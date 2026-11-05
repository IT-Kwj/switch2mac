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
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_71 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _628 = false;
    bool _474 = false;
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
        float _2622 = as_type<float>(_110);
        out.gl_Position.z = _2622;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_148);
        out.gl_Position.z = _2691;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    int _274 = as_type<int>(_266);
    float _292;
    if (!_272)
    {
        float _276 = in.m_51.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
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
        float _300 = _128 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _342;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _338;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _322 * _360;
    float _384 = _306 * _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_370, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = in.m_49.x;
    float _402 = in.m_49.y;
    float _404 = in.m_49.z;
    float _406 = _394 * _376;
    float _408 = _396 * _376;
    float _410 = _398 * _376;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _426 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _428 = fma(_414, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_418, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_422, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _436 = fma(_428, _362, _424);
    float _438 = fma(_430, _362, _426);
    float _440 = fma(_432, _362, _434);
    float _442 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].y, _438);
    float _446 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].z, _440);
    float _448 = _442 * _400;
    float _450 = _444 * _402;
    float _452 = _446 * _404;
    bool _454 = !_372;
    float _472;
    if (!_454)
    {
        float _456 = in.m_51.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_94);
        float _478 = 1.0 / _476;
        float _480 = _128 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _486 = _482 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = isnan(_482);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_482);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_482);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _490;
    float _538 = -_502;
    float _540 = _538 + 1.0;
    bool _542 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _544 = _518 * _540;
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _506;
    float _552 = _522 * _536;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _486, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _550;
    float _562 = _558 * _544;
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _482 + _568;
    float _572 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _574 = _502 * _566;
    float _576 = fma(_560, _570, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = fma(_576, _574, _572);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[117].x, _580);
    float _588 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _588;
    out.m_53.y = _590;
    out.m_53.z = _592;
    out.m_53.w = _594;
    bool _596 = !_542;
    int _598 = as_type<int>(_582);
    bool _600 = _542;
    float _624;
    float _626;
    if (!_596)
    {
        float _602 = in.m_51.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = float(_94);
        float _608 = 1.0 / _606;
        float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _612 = _128 * _608;
        float _614 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _616 = _614 * _604;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _598 = as_type<int>(_616);
        _624 = _612;
        _626 = _622;
        _628 = true;
    }
    else
    {
        float _630 = float(_94);
        float _632 = 1.0 / _630;
        float _634 = _128 * _632;
        _624 = _634;
        _626 = _634;
    }
    _628 = false;
    int _636 = _598;
    float _638 = _624;
    float _640 = _626;
    float _642 = in.m_55.x;
    float _644 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = in.m_51.x;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _650 = _648 != 0;
    float _652 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _656 = _654 != 0;
    float _658 = in.m_55.y;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _662 = _660 != 0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _670 = _668 != 0;
    float _672 = in.m_51.y;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _676 = _674 != 0;
    float _678 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _652);
    float _680 = in.m_51.z;
    float _682 = 1.0 / _666;
    float _684 = in.m_51.w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _694 = _636;
    float _696 = _642;
    if (_650)
    {
        float _698 = -_642;
        float _700 = _698 + 1.0;
        _694 = as_type<int>(_700);
    }
    int _702 = _694;
    float _704 = 0.0;
    if (!_650)
    {
        _704 = _642;
    }
    float _706 = _704;
    float _708 = in.m_57.x;
    float _710 = 0.0;
    float _712 = _706;
    if (!_656)
    {
        _710 = _642;
    }
    float _714 = _710;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _720 = _714;
    if (_650)
    {
        bool _722 = _646 > 0.5;
        _600 = _722;
    }
    bool _724 = _600;
    float _726 = in.m_57.z;
    float _728 = 1.0 / _688;
    float _730 = -_658;
    float _732 = _730 + 1.0;
    float _734 = _658;
    if (_650)
    {
        float _736 = _724 ? as_type<float>(_702) : _642;
        _712 = _736;
    }
    float _738 = _712;
    float _740 = in.m_57.y;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _744 = _742 != 0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _750 = _672 > 0.5;
    float _752 = in.m_57.w;
    float _754 = 1.0 / _692;
    int _756 = _750 ? as_type<int>(_732) : as_type<int>(_658);
    float _758 = _678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _760 = _680 > 0.5;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _766 = _662 ? as_type<float>(_756) : _658;
    int _768 = _760 ? as_type<int>(_732) : as_type<int>(_658);
    float _770 = 1.0 / _718;
    out.m_59.x = _708;
    float _772 = _670 ? as_type<float>(_768) : _658;
    int _774 = 0;
    if (_744)
    {
        float _776 = -_642;
        float _778 = _776 + 1.0;
        _774 = as_type<int>(_778);
    }
    int _780 = _774;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _784 = _782 != 0;
    float _786 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _788 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _790 = _684 > 0.5;
    float _792 = 1.0 / _764;
    float _794 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _786);
    float _796 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    if (_656)
    {
        float _798 = -_642;
        float _800 = _798 + 1.0;
        _274 = as_type<int>(_800);
    }
    int _802 = _274;
    out.m_59.z = _726;
    float _804 = _672 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_656)
    {
        float _806 = _760 ? as_type<float>(_802) : _642;
        _720 = _806;
    }
    float _808 = _720;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _814 = 1.0 / _748;
    out.m_59.y = _740;
    if (_676)
    {
        float _816 = _790 ? _732 : _658;
        _734 = _816;
    }
    float _818 = _734;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _842 = -_820;
    float _844 = fma(_836, 2.0, _842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _850 = fma(_804, -2.0, _822);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _856 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _858;
    float _862 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _864 = 1.0 / _812;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _870 = _680 * 2.0;
    float _872 = _860 * _682;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _874;
    out.m_59.w = _752;
    float _878 = 1.0 / _840;
    float _880 = _868 * _728;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _890 = _876 * _792;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _892;
    float _896 = _884 * _754;
    float _898 = 1.0 / _848;
    float _900 = _646 * 2.0;
    float _902 = _888 * _770;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _908 = _894 * _814;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _910;
    float _914 = _906 * _864;
    float _916 = 1.0 / _854;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _918;
    float _922 = _912 * _878;
    float _924 = _646 + _672;
    if (_744)
    {
        float _926 = _750 ? as_type<float>(_780) : _642;
        _696 = _926;
    }
    float _928 = _696;
    float _930 = -_128;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[76].x, _844);
    float _934 = _924 + (-1.0);
    float _936 = floor(_870);
    float _938 = _672 * 2.0;
    bool _940 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _942 = isnan(_638);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _954 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _956 = isnan(_640);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    bool _966 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _968 = isnan(_640);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = floor(_938);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _988 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _990 = isnan(_638);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_976;
    float _1002 = _1000 + 1.0;
    float _1004 = floor(_900);
    bool _1006 = _936 >= 0.0;
    bool _1008 = isnan(_936);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = _936 > 0.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1020 = _638 + _1018;
    int _1022 = _1014 ? 0 : 1;
    bool _1024 = _982 >= 0.0;
    bool _1026 = isnan(_982);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = _986 * _898;
    float _1036 = _920 * _916;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1040 = _1032 ? 0 : 1;
    float _1042 = fma(_908, _1020, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1044 = _982 > 0.0;
    float _1046 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _640 + _1048;
    bool _1052 = _1004 >= 0.0;
    bool _1054 = isnan(_1004);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1064 = _638 + _1062;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1068 = fma(_872, _1050, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1072 = _638 + _1070;
    int _1074 = _1060 ? 0 : 1;
    float _1076 = fma(_890, _1064, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1078 = _1004 > 0.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = _640 + _1080;
    float _1084 = fma(_914, _1072, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1088 = _638 + _1086;
    float _1090 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1092 = fma(_896, _1082, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1096 = _638 + _1094;
    float _1098 = fma(_1034, _1088, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1100 = fma(_1090, _766, -0.5);
    float _1102 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[78].w, _952);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1106 = _638 + _1104;
    float _1108 = fma(_922, _1096, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1110 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _850);
    float _1112 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1102);
    float _1114 = fma(_1036, _1106, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1116 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1118 = isnan(_638);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1130 = _640 + _1128;
    float _1132 = -_1110;
    float _1134 = fma(_1112, _1100, _1132);
    bool _1136 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1138 = isnan(_638);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1150 = fma(_880, _1130, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1152 = -_1126;
    float _1154 = _1152 + 1.0;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1158 = _638 + _1156;
    bool _1160 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1162 = isnan(_638);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _1146 * _1154;
    float _1174 = fma(_902, _1158, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1176 = -_1146;
    float _1178 = _1176 + 1.0;
    float _1180 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1182 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1184 = isnan(_638);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1196 = _1170 * _1178;
    float _1198 = fma(_772, _1180, -0.5);
    float _1200 = -_1170;
    float _1202 = _1200 + 1.0;
    bool _1204 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1206 = isnan(_640);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1218 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1220 = isnan(_640);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = _1192 * _1202;
    bool _1232 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1234 = isnan(_638);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1192;
    float _1246 = _1244 + 1.0;
    bool _1248 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1250 = isnan(_638);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = -_1214;
    float _1262 = _1260 + 1.0;
    float _1264 = fma(_1216, _818, -0.5);
    float _1266 = _950 * _1246;
    float _1268 = -_1228;
    float _1270 = _1268 + 1.0;
    float _1272 = _1228 * _1262;
    float _1274 = _1258 * _980;
    float _1276 = -_1258;
    float _1278 = _1276 + 1.0;
    float _1280 = _976 * _1270;
    float _1282 = _964 * _1002;
    float _1284 = _998 * _1278;
    float _1286 = -_998;
    float _1288 = _1286 + 1.0;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1292 = _1068 * _1282;
    float _1294 = _1242 * _1288;
    float _1296 = _1288;
    float _1298 = _1280;
    float _1300 = _1258;
    float _1302 = _1172;
    if (!_784)
    {
        _1296 = _672;
    }
    float _1304 = _1296;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1308 = _1304;
    if (_784)
    {
        _1308 = _646;
    }
    float _1310 = _1308;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1314 = -_964;
    float _1316 = _1314 + 1.0;
    float _1318 = _1076 * _1294;
    float _1320 = -_1242;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1312);
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1328 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1292);
    float _1330 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1318);
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1334 = fma(_1150, _1280, _1328);
    if (!_784)
    {
        _1298 = _680;
    }
    float _1336 = _1298;
    float _1338 = fma(_1174, _1284, _1330);
    float _1340 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1342 = _1336;
    if (_784)
    {
        _1342 = _672;
    }
    float _1344 = _1342;
    float _1346 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1350 = fma(_1092, _1272, _1334);
    float _1352 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1354 = fma(_1346, _808, -0.5);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1358 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1360 = fma(_1352, -2.0, _1348);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1364 = fma(_1340, _738, -0.5);
    float _1366 = -_1356;
    float _1368 = fma(_1358, 2.0, _1366);
    float _1370 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1362);
    float _1372 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1374 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1324);
    float _1376 = -_128;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1368);
    float _1380 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1370);
    float _1382 = fma(_1372, _928, -0.5);
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1386 = fma(_1374, _1354, _1378);
    float _1388 = fma(_1380, _1364, _932);
    bool _1390 = !_826;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1384);
    float _1396 = _1384;
    if (_784)
    {
        _1300 = _646;
    }
    float _1398 = _1300;
    float _1400 = fma(_1042, _1274, _1338);
    int _1402 = abs(_1392);
    float _1404 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1406 = _1398;
    if (!_784)
    {
        _1406 = _680;
    }
    float _1408 = _1406;
    float _1410 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1394);
    float _1412 = _1408;
    if (_784)
    {
        _1396 = _672;
    }
    float _1414 = _1396;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _758 + _1416;
    int _1420 = ~_1022;
    int _1422 = _1420 + 1;
    int _1424 = _1422 + 1;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1428 = fma(_1084, _1266, _1400);
    float _1430 = _862 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1432 = _1414;
    int _1434 = _1424;
    if (!_784)
    {
        _1432 = _646;
    }
    float _1436 = _1432;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1016)
    {
        int _1440 = ~_1022;
        int _1442 = _1440 + 1;
        _1434 = _1442;
    }
    int _1444 = _1434;
    float _1446 = -_1290;
    float _1448 = fma(_1426, 2.0, _1446);
    float _1450 = float(_1402);
    float _1452 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_784)
    {
        _1412 = _680;
    }
    float _1454 = _1412;
    float _1456 = -_128;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1448);
    float _1460 = float(_1444);
    float _1462 = fma(_1452, -2.0, _1438);
    float _1464 = _1454;
    if (_784)
    {
        _1464 = _672;
    }
    float _1466 = _1464;
    float _1468 = fma(_1410, _1382, _1458);
    float _1470 = _1450 * _1460;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1404 + _1472;
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1326);
    float _1478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1480 = log2(_1478);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1484 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1486 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1476);
    float _1488 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1360);
    float _1490 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1482);
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1430 + _1492;
    float _1496 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1484);
    float _1498 = -_1488;
    float _1500 = fma(_1486, _1264, _1498);
    float _1502 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1350);
    float _1504 = fma(_1108, _1230, _1428);
    float _1506 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1490);
    float _1508 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1462);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1496);
    float _1512 = _1500 + 0.5;
    float _1514 = _1418 * _1418;
    float _1516 = _1480 * _128;
    float _1518 = _1134 + 0.5;
    bool _1520 = _1510 >= 0.0;
    float _1522 = _1388 + 0.5;
    float _1524 = _1386 + 0.5;
    float _1526 = fma(_1474, _1474, _1514);
    float _1528 = fma(_1098, _1196, _1504);
    float _1530 = -_1508;
    float _1532 = fma(_1506, _1198, _1530);
    float _1534 = exp2(_1516);
    float _1536 = fma(_1494, _1494, _1526);
    out.m_61.x = _1522;
    out.m_61.y = _1518;
    out.m_61.z = _1524;
    out.m_61.w = _1512;
    float _1538 = fma(_1114, _1172, _1528);
    float _1540 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1542 = in.m_63.x;
    float _1544 = in.m_63.y;
    float _1546 = in.m_63.z;
    if (_1520)
    {
        _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1548 = _1302;
    float _1550 = rsqrt(_1536);
    float _1552 = _1468 + 0.5;
    float _1554 = _1532 + 0.5;
    int _1556 = as_type<int>(_1548);
    if (_1520)
    {
        float _1558 = _1548 * 5.0;
        _1556 = as_type<int>(_1558);
    }
    int _1560 = _1556;
    float _1562 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1538);
    bool _1564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1572 = _1568 || _1570;
    out.m_65.w = _1540;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1576 = 1.0 + _1574;
    float _1578 = -_1534;
    float _1580 = _1578 + 1.0;
    int _1582 = ~_1040;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1586;
    if (_1520)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5006 = as_type<float>(_1560);
        out.gl_Position.z = _5006;
    }
    float _1590 = 1.0 / _1576;
    int _1592 = ~_1074;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    out.m_67.x = _1552;
    out.m_67.y = _1554;
    int _1598 = _1596;
    if (!_1044)
    {
        int _1600 = ~_1040;
        int _1602 = _1600 + 1;
        _1588 = _1602;
    }
    int _1604 = _1588;
    float _1606 = _1474 * _1550;
    if (!_1078)
    {
        int _1608 = ~_1074;
        int _1610 = _1608 + 1;
        _1598 = _1610;
    }
    int _1612 = _1598;
    out.m_69.x = _1562;
    bool _1614 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1616 = isnan(1.0);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1622 = _1618 || _1620;
    bool _1624 = !_830;
    int _1626 = _1624 ? 0 : 1;
    if (_1520)
    {
        out.m_45.x = 0.0;
    }
    bool _1628 = !_834;
    int _1630 = _1628 ? 0 : 1;
    float _1632 = _1418 * _1550;
    float _1634 = _1572 ? _1580 : 0.0;
    float _1636 = _1546;
    if (_1520)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1638 = -_1632;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _1642 = -_1606;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1646 = _1470 * (-2.0);
    float _1648 = _646 + (-0.5);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1652 = _1640 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1656 = _1644 + _1654;
    float _1658 = fma(_1046, _1646, _1046);
    int _1660 = abs(_1626);
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1664 = fma(_1646, _1542, _1542);
    float _1666 = float(_1612);
    float _1668 = _1494 * _1550;
    float _1670 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1662);
    int _1672 = abs(_1630);
    float _1674 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1664);
    float _1676 = float(_1660);
    float _1678 = _672 + _680;
    float _1680 = float(_1672);
    float _1682 = -_1668;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1430);
    float _1686 = float(_1604);
    float _1688 = _1676 * _1666;
    float _1690 = _1684;
    if (_1622)
    {
        float _1692 = _1634 * _1590;
        _132 = _1692;
    }
    float _1694 = _132;
    float _1696 = _1678 + (-1.0);
    float _1698 = _1680 * _1686;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1702 = _1684 + _1700;
    float _1704 = _1688 * (-2.0);
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1708 = _672 + (-0.5);
    float _1710 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1670);
    float _1712 = fma(_1704, _1544, _1544);
    float _1714 = _646 + _680;
    float _1716 = fma(_1706, _1704, _1706);
    float _1718 = _1698 * (-2.0);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1712);
    bool _1722 = _1710 >= 0.0;
    float _1724 = _1714 + (-1.0);
    float _1726 = fma(_1716, _1694, _1720);
    float _1728 = fma(_1718, _1546, _1546);
    float _1730 = _680 + (-0.5);
    float _1732 = fma(_1658, _1694, _1674);
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1736 = _1726 * 0.15915493667125701904296875;
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1728);
    float _1740 = _1732 * 0.15915493667125701904296875;
    float _1742 = fma(_1734, _1718, _1734);
    float _1744 = _1736 * 6.283185482025146484375;
    float _1746 = sin(_1744);
    if (_1722)
    {
        _1636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1748 = _1636;
    float _1750 = fma(_1742, _1694, _1738);
    int _1752 = as_type<int>(_1748);
    if (_1722)
    {
        out.m_45.x = 0.0;
    }
    float _1754 = -_1632;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    if (_1722)
    {
        float _1758 = _1748 * 5.0;
        _1752 = as_type<int>(_1758);
    }
    int _1760 = _1752;
    float _1762 = _1740 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    if (_1722)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5300 = as_type<float>(_1760);
        out.gl_Position.z = _5300;
    }
    float _1766 = _1740 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    float _1770 = _1736 * 6.283185482025146484375;
    float _1772 = cos(_1770);
    if (_1722)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1774 = -_758;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1778 = -_1404;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1782 = -_1430;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1786 = -_1606;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1790 = _1776 * _1776;
    float _1792 = _1756 * _1756;
    float _1794 = _1750 * 0.15915493667125701904296875;
    float _1796 = -_1668;
    float _1798 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1800 = fma(_1780, _1780, _1790);
    float _1802 = fma(_1788, _1788, _1792);
    float _1804 = _1794 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1764 * _1746;
    float _1810 = fma(_1784, _1784, _1800);
    float _1812 = fma(_1798, _1798, _1802);
    float _1814 = _1768 * _1772;
    float _1816 = in.m_71.x;
    float _1818 = in.m_71.y;
    float _1820 = in.m_71.z;
    float _1822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1824 = rsqrt(_1810);
    float _1826 = sqrt(_1812);
    float _1828 = fma(_1806, _1814, _1808);
    float _1830 = fma(_1806, _1808, _1814);
    float _1832 = _1780 * _1824;
    float _1834 = _1784 * _1824;
    float _1836 = _1794 * 6.283185482025146484375;
    float _1838 = cos(_1836);
    float _1840 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1844 = _1832 * _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1848 = _1834 * _1846;
    float _1850 = _1764 * _1772;
    float _1852 = _1550 * _1826;
    float _1854 = _1776 * _1824;
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1858 = -_1844;
    float _1860 = fma(_1834, _1856, _1858);
    float _1862 = _1852 * _1840;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1866 = _1854 * _1864;
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1870 = -_1848;
    float _1872 = fma(_1854, _1868, _1870);
    float _1874 = _1860 * _1860;
    float _1876 = _1852 * _1822;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1880 = -_1866;
    float _1882 = fma(_1832, _1878, _1880);
    float _1884 = _1768 * _1746;
    float _1886 = fma(_1872, _1872, _1874);
    float _1888 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1890 = _1772 * _1838;
    float _1892 = fma(_1882, _1882, _1886);
    float _1894 = _1852 * _1888;
    float _1896 = _1746 * _1838;
    float _1898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1818);
    float _1900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1820);
    float _1902 = rsqrt(_1892);
    float _1904 = _1862 * _1898;
    float _1906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1816);
    float _1908 = -_1884;
    float _1910 = fma(_1806, _1850, _1908);
    float _1912 = -_1850;
    float _1914 = fma(_1806, _1884, _1912);
    float _1916 = _1876 * _1900;
    float _1918 = _1894 * _1906;
    float _1920 = _1838 * _1904;
    float _1922 = -_1904;
    float _1924 = _1806 * _1922;
    float _1926 = _1768 * _1920;
    float _1928 = fma(_1890, _1918, _1924);
    float _1930 = _1764 * _1920;
    float _1932 = fma(_1828, _1918, _1926);
    float _1934 = _1872 * _1902;
    float _1936 = _1860 * _1902;
    float _1938 = _1882 * _1902;
    float _1940 = fma(_1914, _1916, _1932);
    float _1942 = _1854 * _1934;
    float _1944 = _1834 * _1936;
    float _1946 = fma(_1910, _1918, _1930);
    float _1948 = fma(_1896, _1916, _1928);
    float _1950 = -_1942;
    float _1952 = fma(_1832, _1936, _1950);
    float _1954 = -_1944;
    float _1956 = fma(_1854, _1938, _1954);
    float _1958 = fma(_1830, _1916, _1946);
    float _1960 = _1952 * _1940;
    float _1962 = _1956 * _1940;
    float _1964 = fma(_1938, _1948, _1960);
    float _1966 = fma(_1934, _1948, _1962);
    float _1968 = fma(_1834, _1958, _1964);
    float _1970 = fma(_1832, _1958, _1966);
    float _1972 = _1832 * _1938;
    float _1974 = _1430 + _1968;
    float _1976 = _1404 + _1970;
    float _1978 = -_1972;
    float _1980 = fma(_1834, _1934, _1978);
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1984 = _1974 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1976 + _1986;
    float _1990 = _1984 * _1984;
    float _1992 = fma(_1988, _1988, _1990);
    float _1994 = _1980 * _1940;
    float _1996 = sqrt(_1992);
    float _1998 = fma(_1936, _1948, _1994);
    float _2000 = fma(_1854, _1958, _1998);
    float _2002 = _758 + _2000;
    bool _2004 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _1970;
    float _2008 = _1976;
    float _2010 = _1974;
    float _2012 = _1940;
    float _2014 = _2002;
    float _2016 = 0.5;
    if (!_2004)
    {
        _2006 = _2002;
    }
    float _2018 = _2006;
    bool _2020 = !_2004;
    float _2022 = _2018;
    if (!_2020)
    {
        float _2024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2028 = _1996 + _2026;
        float _2030 = rsqrt(_1992);
        float _2032 = _2028 * _2024;
        float _2034 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = _2032 * 0.15915493667125701904296875;
        float _2038 = _2036 * 6.283185482025146484375;
        float _2040 = cos(_2038);
        float _2042 = _2036 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = _2040 + (-1.0);
        float _2048 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2050 = fma(_2044, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2052 = fma(_2002, _2040, _2048);
        float _2054 = _2030 * _2050;
        float _2056 = fma(_1988, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2058 = fma(_1984, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2022 = _2052;
        _2008 = _2056;
        _2010 = _2058;
    }
    float _2060 = _2022;
    float _2062 = _2008;
    float _2064 = _2010;
    float _2066 = -_1632;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2070 = -_1606;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2062);
    float _2074 = -_1668;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2064);
    float _2078 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2068 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2072 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2076 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = sqrt(_2096);
    float _2102 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2104 = _2086 * _2102;
    float _2106 = _2090 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 * _2106;
    float _2112 = _2108 + _2110;
    float _2114 = sqrt(_2112);
    bool _2116 = _2114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = _2114 + _2118;
    float _2122 = _2090;
    float _2124 = _2094;
    float _2126 = _2120;
    float _2128 = _2102;
    if (_2116)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2122 = _2130;
    }
    float _2132 = _2122;
    if (_2116)
    {
        float _2134 = rsqrt(_2112);
        _2124 = _2134;
    }
    float _2136 = _2124;
    float _2138 = _2136;
    if (_2116)
    {
        float _2140 = _2120 * _2132;
        _2126 = _2140;
    }
    float _2142 = _2126;
    if (_2116)
    {
        float _2144 = _2142 * 0.15915493667125701904296875;
        _2012 = _2144;
    }
    float _2146 = _2012;
    float _2148 = _2098;
    float _2150 = _2146;
    if (_2116)
    {
        float _2152 = _2146 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2160 = precise::max(0.0, _2158);
    float _2162 = _2132;
    float _2164 = _2160;
    if (_2116)
    {
        float _2166 = _2146 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2162 = _2168;
    }
    float _2170 = _2162;
    float _2172 = -_2102;
    float _2174 = -_2160;
    float _2176 = fma(_2082, _2172, _2174);
    if (_2116)
    {
        float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2178;
    }
    float _2180 = _2164;
    float _2182 = _2180;
    if (!_2116)
    {
        _2150 = _2108;
    }
    float _2184 = _2150;
    float _2186 = _2156;
    float _2188 = _2184;
    if (_2116)
    {
        float _2190 = fma(_2156, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = _2192;
    float _2196 = _2170;
    if (_2116)
    {
        float _2198 = _2170 + (-1.0);
        _2182 = _2198;
    }
    float _2200 = _2182;
    float _2202 = _2200;
    if (_2116)
    {
        float _2204 = _2136 * _2192;
        _2014 = _2204;
    }
    float _2206 = _2014;
    if (!_2116)
    {
        _2138 = _2104;
    }
    float _2208 = _2138;
    float _2210 = _2208;
    if (_2116)
    {
        float _2212 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2212;
    }
    float _2214 = _2128;
    if (_2116)
    {
        float _2216 = _2104 * _2206;
        _2210 = _2216;
    }
    float _2218 = _2210;
    if (!_2116)
    {
        _2194 = _2176;
    }
    float _2220 = _2194;
    float _2222 = _2220;
    if (!_2116)
    {
        _2202 = _2106;
    }
    float _2224 = _2202;
    float _2226 = _2224;
    if (_2116)
    {
        float _2228 = fma(_2176, _2170, _2214);
        _2222 = _2228;
    }
    float _2230 = _2222;
    if (_2116)
    {
        float _2232 = _2106 * _2206;
        _2226 = _2232;
    }
    float _2234 = _2226;
    if (_2116)
    {
        float _2236 = _2218 * _2218;
        _2188 = _2236;
    }
    float _2238 = _2188;
    if (!_2116)
    {
        _2196 = _2110;
    }
    float _2240 = _2196;
    float _2242 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2244 = _2240;
    if (_2116)
    {
        float _2246 = _2234 * _2234;
        _2244 = _2246;
    }
    float _2248 = _2244;
    float _2250 = fma(_2230, _2230, _2238);
    float _2252 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2242);
    float _2254 = _2250 + _2248;
    float _2256 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2260 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2258);
    float _2262 = precise::clamp(_2260, 0.0, 1.0);
    float _2264 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2252);
    float _2266 = rsqrt(_2254);
    float _2268 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2256);
    float _2270 = -_2262;
    float _2272 = _2270 + 1.0;
    float _2274 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2276 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2278 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2268);
    float _2280 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2282 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2274);
    float _2284 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2276);
    float _2286 = abs(_2272);
    float _2288 = log2(_2286);
    float _2290 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2282);
    float _2294 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2284);
    float _2298 = -_2290;
    float _2300 = fma(_2298, _2078, 1.0);
    float _2302 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2304 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2306 = _2296 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2308 = _2266 * _2218;
    float _2310 = _2266 * _2234;
    float _2312 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2304);
    float _2314 = _2266 * _2230;
    float _2316 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2318 = log2(_2300);
    float _2320 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2312);
    float _2322 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2324 = -_2316;
    float _2326 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2324);
    float _2328 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2330 = -_2310;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2326);
    float _2334 = exp2(_2322);
    float _2336 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2320);
    float _2338 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2340 = fma(_2332, -0.5, 0.5);
    float _2342 = fma(_2332, 0.5, 0.5);
    float _2344 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2328);
    float _2346 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2338);
    float _2348 = _2314 + 1.0;
    float _2350 = 1.0 / _2336;
    float _2352 = fma(_2342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2354 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2346);
    float _2356 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2344);
    float _2358 = _2318 * 0.693147182464599609375;
    float _2360 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2356);
    float _2362 = sqrt(_2340);
    float _2364 = -_2314;
    float _2366 = fma(_2334, _2348, _2364);
    float _2368 = fma(_2342, _2352, -0.212114393711090087890625);
    float _2370 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2354);
    float _2372 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2374 = fma(_2366, 0.5, 0.5);
    float _2376 = fma(_2342, _2368, 1.570728778839111328125);
    float _2378 = _2370 * _2350;
    float _2380 = _2360 * _2350;
    float _2382 = fma(_2378, 0.5, 0.5);
    float _2384 = fma(_2380, -0.5, 0.5);
    float _2386 = _2362 * 0.636619746685028076171875;
    float3 _6299 = float3(_2382, _2384, _2372);
    float _2388 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6299, float3(0.0), isnan(_6299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6299, float3(0.0), isnan(_6299)), level(0.0)).x;
    float3 _6310 = float3(_2382, _2384, _2372);
    float4 _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6310, float3(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6310, float3(0.0), isnan(_6310)), level(0.0)).xyzw;
    float _2393 = _2391.x;
    float _2395 = _2391.y;
    float _2397 = _2391.z;
    float _2399 = _2391.w;
    float _2401 = -_2376;
    float _2403 = fma(_2386, _2401, 1.0);
    float2 _6332 = float2(_2403, _2374);
    float3 _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6332, float2(0.0), isnan(_6332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6332, float2(0.0), isnan(_6332)), level(0.0)).xyz;
    float _2409 = _2407.x;
    float _2411 = _2407.y;
    float _2413 = _2407.z;
    float _2415 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2417 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2419 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2421 = isnan(0.5);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2427 = _2423 || _2425;
    float _2429 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2431 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2415);
    float _2433 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2417);
    float _2435 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2429);
    float _2437 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2431);
    float _2439 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2433);
    float _2441 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2435);
    float _2443 = _2437 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2445 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2447 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2427)
    {
        _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2449 = _1690;
    float _2451 = 1.0 / _2443;
    float _2453 = _2445 + _2443;
    float _2455 = _2336 * 0.5;
    float _2457 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2441);
    float _2459 = _2457 + _2336;
    float _2461 = exp2(_2447);
    out.gl_Position.x = _2370;
    out.gl_Position.y = _2360;
    out.gl_Position.z = _2457;
    out.gl_Position.w = _2336;
    float _2463 = _2459 * 0.5;
    float _2465 = _2453 * _2451;
    float _2467 = _2465 * 0.5;
    float _2469 = _2451;
    float _2471 = _2467;
    float _2473 = _2449;
    if (_2427)
    {
        _2469 = 1.0;
    }
    float _2475 = _2469;
    float _2477 = _2475;
    if (!_2427)
    {
        float _2479 = -_2449;
        float _2481 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2479);
        _2471 = _2481;
    }
    float _2483 = _2471;
    if (!_2427)
    {
        _2473 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2485 = _2473;
    float _2487 = -_2461;
    float _2489 = _2487 + 1.0;
    float _2491 = _2483;
    float _2493 = _2485;
    if (!_2427)
    {
        float _2495 = 1.0 / _2483;
        _2491 = _2495;
    }
    float _2497 = _2491;
    if (!_2427)
    {
        float _2499 = -_2485;
        float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2016 = _2501;
    }
    float _2503 = _2016;
    float _2505 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2507 = _2382;
    if (!_2427)
    {
        float _2509 = 1.0 / _2503;
        _2507 = _2509;
    }
    float _2511 = _2507;
    if (!_2427)
    {
        float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2515 = -_2485;
        float _2517 = fma(_2497, _2513, _2515);
        _2493 = _2517;
    }
    float _2519 = _2493;
    float _2521 = _2370 + _2336;
    float _2523 = _2521 * 0.5;
    if (!_2427)
    {
        float _2525 = _2519 * _2511;
        float _2527 = precise::clamp(_2525, 0.0, 1.0);
        _2477 = _2527;
    }
    float _2529 = _2477;
    float _2531 = fma(_2360, -0.5, _2455);
    float _2533 = _2529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2535 = _2529 > 0.0;
    bool _2537 = isnan(_2529);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(0.0);
    bool _2543 = _2539 || _2541;
    out.m_73.x = _2523;
    out.m_73.y = _2531;
    out.m_73.z = _2463;
    out.m_73.w = _2336;
    float _2545 = _2533 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2545;
    float _2547 = _2505 * _2388;
    float _2549 = -_2505;
    float _2551 = _2549 + 1.0;
    float _2553 = _2399 * _2547;
    float _2555 = _2399 * _2551;
    float _2557 = _2413 * _2547;
    float _2559 = fma(_2409, _2553, _2393);
    float _2561 = fma(_2411, _2553, _2395);
    float _2563 = fma(_2399, _2557, _2397);
    out.m_75.x = _2559;
    out.m_75.y = _2561;
    out.m_75.z = _2563;
    out.m_75.w = _2555;
    if (_2543)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2565 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2565;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _628 = false;
    bool _474 = false;
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
        float _2622 = as_type<float>(_110);
        out.gl_Position.z = _2622;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_148);
        out.gl_Position.z = _2691;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_49.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    int _274 = as_type<int>(_266);
    float _292;
    if (!_272)
    {
        float _276 = in.m_51.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
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
        float _300 = _128 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _342;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _338;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _322 * _360;
    float _384 = _306 * _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_370, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = in.m_49.x;
    float _402 = in.m_49.y;
    float _404 = in.m_49.z;
    float _406 = _394 * _376;
    float _408 = _396 * _376;
    float _410 = _398 * _376;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _426 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _428 = fma(_414, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_418, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_422, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _436 = fma(_428, _362, _424);
    float _438 = fma(_430, _362, _426);
    float _440 = fma(_432, _362, _434);
    float _442 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].y, _438);
    float _446 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].z, _440);
    float _448 = _442 * _400;
    float _450 = _444 * _402;
    float _452 = _446 * _404;
    bool _454 = !_372;
    float _472;
    if (!_454)
    {
        float _456 = in.m_51.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_94);
        float _478 = 1.0 / _476;
        float _480 = _128 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _486 = _482 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = isnan(_482);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_482);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_482);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _490;
    float _538 = -_502;
    float _540 = _538 + 1.0;
    bool _542 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _544 = _518 * _540;
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _506;
    float _552 = _522 * _536;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _486, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _550;
    float _562 = _558 * _544;
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _482 + _568;
    float _572 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _574 = _502 * _566;
    float _576 = fma(_560, _570, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = fma(_576, _574, _572);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[117].x, _580);
    float _588 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _588;
    out.m_53.y = _590;
    out.m_53.z = _592;
    out.m_53.w = _594;
    bool _596 = !_542;
    int _598 = as_type<int>(_582);
    bool _600 = _542;
    float _624;
    float _626;
    if (!_596)
    {
        float _602 = in.m_51.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = float(_94);
        float _608 = 1.0 / _606;
        float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _612 = _128 * _608;
        float _614 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _616 = _614 * _604;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _598 = as_type<int>(_616);
        _624 = _612;
        _626 = _622;
        _628 = true;
    }
    else
    {
        float _630 = float(_94);
        float _632 = 1.0 / _630;
        float _634 = _128 * _632;
        _624 = _634;
        _626 = _634;
    }
    _628 = false;
    int _636 = _598;
    float _638 = _624;
    float _640 = _626;
    float _642 = in.m_55.x;
    float _644 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = in.m_51.x;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _650 = _648 != 0;
    float _652 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _656 = _654 != 0;
    float _658 = in.m_55.y;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _662 = _660 != 0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _670 = _668 != 0;
    float _672 = in.m_51.y;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _676 = _674 != 0;
    float _678 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _652);
    float _680 = in.m_51.z;
    float _682 = 1.0 / _666;
    float _684 = in.m_51.w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _694 = _636;
    float _696 = _642;
    if (_650)
    {
        float _698 = -_642;
        float _700 = _698 + 1.0;
        _694 = as_type<int>(_700);
    }
    int _702 = _694;
    float _704 = 0.0;
    if (!_650)
    {
        _704 = _642;
    }
    float _706 = _704;
    float _708 = in.m_57.x;
    float _710 = 0.0;
    float _712 = _706;
    if (!_656)
    {
        _710 = _642;
    }
    float _714 = _710;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _720 = _714;
    if (_650)
    {
        bool _722 = _646 > 0.5;
        _600 = _722;
    }
    bool _724 = _600;
    float _726 = in.m_57.z;
    float _728 = 1.0 / _688;
    float _730 = -_658;
    float _732 = _730 + 1.0;
    float _734 = _658;
    if (_650)
    {
        float _736 = _724 ? as_type<float>(_702) : _642;
        _712 = _736;
    }
    float _738 = _712;
    float _740 = in.m_57.y;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _744 = _742 != 0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _750 = _672 > 0.5;
    float _752 = in.m_57.w;
    float _754 = 1.0 / _692;
    int _756 = _750 ? as_type<int>(_732) : as_type<int>(_658);
    float _758 = _678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _760 = _680 > 0.5;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _766 = _662 ? as_type<float>(_756) : _658;
    int _768 = _760 ? as_type<int>(_732) : as_type<int>(_658);
    float _770 = 1.0 / _718;
    out.m_59.x = _708;
    float _772 = _670 ? as_type<float>(_768) : _658;
    int _774 = 0;
    if (_744)
    {
        float _776 = -_642;
        float _778 = _776 + 1.0;
        _774 = as_type<int>(_778);
    }
    int _780 = _774;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _784 = _782 != 0;
    float _786 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _788 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _790 = _684 > 0.5;
    float _792 = 1.0 / _764;
    float _794 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _786);
    float _796 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    if (_656)
    {
        float _798 = -_642;
        float _800 = _798 + 1.0;
        _274 = as_type<int>(_800);
    }
    int _802 = _274;
    out.m_59.z = _726;
    float _804 = _672 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_656)
    {
        float _806 = _760 ? as_type<float>(_802) : _642;
        _720 = _806;
    }
    float _808 = _720;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _814 = 1.0 / _748;
    out.m_59.y = _740;
    if (_676)
    {
        float _816 = _790 ? _732 : _658;
        _734 = _816;
    }
    float _818 = _734;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _842 = -_820;
    float _844 = fma(_836, 2.0, _842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _850 = fma(_804, -2.0, _822);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _856 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _858;
    float _862 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _864 = 1.0 / _812;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _870 = _680 * 2.0;
    float _872 = _860 * _682;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _874;
    out.m_59.w = _752;
    float _878 = 1.0 / _840;
    float _880 = _868 * _728;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _890 = _876 * _792;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _892;
    float _896 = _884 * _754;
    float _898 = 1.0 / _848;
    float _900 = _646 * 2.0;
    float _902 = _888 * _770;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _908 = _894 * _814;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _910;
    float _914 = _906 * _864;
    float _916 = 1.0 / _854;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _918;
    float _922 = _912 * _878;
    float _924 = _646 + _672;
    if (_744)
    {
        float _926 = _750 ? as_type<float>(_780) : _642;
        _696 = _926;
    }
    float _928 = _696;
    float _930 = -_128;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[76].x, _844);
    float _934 = _924 + (-1.0);
    float _936 = floor(_870);
    float _938 = _672 * 2.0;
    bool _940 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _942 = isnan(_638);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _954 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _956 = isnan(_640);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    bool _966 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _968 = isnan(_640);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = floor(_938);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _988 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _990 = isnan(_638);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_976;
    float _1002 = _1000 + 1.0;
    float _1004 = floor(_900);
    bool _1006 = _936 >= 0.0;
    bool _1008 = isnan(_936);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = _936 > 0.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1020 = _638 + _1018;
    int _1022 = _1014 ? 0 : 1;
    bool _1024 = _982 >= 0.0;
    bool _1026 = isnan(_982);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = _986 * _898;
    float _1036 = _920 * _916;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1040 = _1032 ? 0 : 1;
    float _1042 = fma(_908, _1020, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1044 = _982 > 0.0;
    float _1046 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _640 + _1048;
    bool _1052 = _1004 >= 0.0;
    bool _1054 = isnan(_1004);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1064 = _638 + _1062;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1068 = fma(_872, _1050, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1072 = _638 + _1070;
    int _1074 = _1060 ? 0 : 1;
    float _1076 = fma(_890, _1064, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1078 = _1004 > 0.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = _640 + _1080;
    float _1084 = fma(_914, _1072, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1088 = _638 + _1086;
    float _1090 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1092 = fma(_896, _1082, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1096 = _638 + _1094;
    float _1098 = fma(_1034, _1088, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1100 = fma(_1090, _766, -0.5);
    float _1102 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[78].w, _952);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1106 = _638 + _1104;
    float _1108 = fma(_922, _1096, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1110 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _850);
    float _1112 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1102);
    float _1114 = fma(_1036, _1106, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1116 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1118 = isnan(_638);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1130 = _640 + _1128;
    float _1132 = -_1110;
    float _1134 = fma(_1112, _1100, _1132);
    bool _1136 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1138 = isnan(_638);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1150 = fma(_880, _1130, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1152 = -_1126;
    float _1154 = _1152 + 1.0;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1158 = _638 + _1156;
    bool _1160 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1162 = isnan(_638);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _1146 * _1154;
    float _1174 = fma(_902, _1158, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1176 = -_1146;
    float _1178 = _1176 + 1.0;
    float _1180 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1182 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1184 = isnan(_638);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1196 = _1170 * _1178;
    float _1198 = fma(_772, _1180, -0.5);
    float _1200 = -_1170;
    float _1202 = _1200 + 1.0;
    bool _1204 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1206 = isnan(_640);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1218 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1220 = isnan(_640);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = _1192 * _1202;
    bool _1232 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1234 = isnan(_638);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1192;
    float _1246 = _1244 + 1.0;
    bool _1248 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1250 = isnan(_638);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = -_1214;
    float _1262 = _1260 + 1.0;
    float _1264 = fma(_1216, _818, -0.5);
    float _1266 = _950 * _1246;
    float _1268 = -_1228;
    float _1270 = _1268 + 1.0;
    float _1272 = _1228 * _1262;
    float _1274 = _1258 * _980;
    float _1276 = -_1258;
    float _1278 = _1276 + 1.0;
    float _1280 = _976 * _1270;
    float _1282 = _964 * _1002;
    float _1284 = _998 * _1278;
    float _1286 = -_998;
    float _1288 = _1286 + 1.0;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1292 = _1068 * _1282;
    float _1294 = _1242 * _1288;
    float _1296 = _1288;
    float _1298 = _1280;
    float _1300 = _1258;
    float _1302 = _1172;
    if (!_784)
    {
        _1296 = _672;
    }
    float _1304 = _1296;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1308 = _1304;
    if (_784)
    {
        _1308 = _646;
    }
    float _1310 = _1308;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1314 = -_964;
    float _1316 = _1314 + 1.0;
    float _1318 = _1076 * _1294;
    float _1320 = -_1242;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1312);
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1328 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1292);
    float _1330 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1318);
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1334 = fma(_1150, _1280, _1328);
    if (!_784)
    {
        _1298 = _680;
    }
    float _1336 = _1298;
    float _1338 = fma(_1174, _1284, _1330);
    float _1340 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1342 = _1336;
    if (_784)
    {
        _1342 = _672;
    }
    float _1344 = _1342;
    float _1346 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1350 = fma(_1092, _1272, _1334);
    float _1352 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1354 = fma(_1346, _808, -0.5);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1358 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1360 = fma(_1352, -2.0, _1348);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1364 = fma(_1340, _738, -0.5);
    float _1366 = -_1356;
    float _1368 = fma(_1358, 2.0, _1366);
    float _1370 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1362);
    float _1372 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1374 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1324);
    float _1376 = -_128;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1368);
    float _1380 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1370);
    float _1382 = fma(_1372, _928, -0.5);
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1386 = fma(_1374, _1354, _1378);
    float _1388 = fma(_1380, _1364, _932);
    bool _1390 = !_826;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1384);
    float _1396 = _1384;
    if (_784)
    {
        _1300 = _646;
    }
    float _1398 = _1300;
    float _1400 = fma(_1042, _1274, _1338);
    int _1402 = abs(_1392);
    float _1404 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1406 = _1398;
    if (!_784)
    {
        _1406 = _680;
    }
    float _1408 = _1406;
    float _1410 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1394);
    float _1412 = _1408;
    if (_784)
    {
        _1396 = _672;
    }
    float _1414 = _1396;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _758 + _1416;
    int _1420 = ~_1022;
    int _1422 = _1420 + 1;
    int _1424 = _1422 + 1;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1428 = fma(_1084, _1266, _1400);
    float _1430 = _862 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1432 = _1414;
    int _1434 = _1424;
    if (!_784)
    {
        _1432 = _646;
    }
    float _1436 = _1432;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1016)
    {
        int _1440 = ~_1022;
        int _1442 = _1440 + 1;
        _1434 = _1442;
    }
    int _1444 = _1434;
    float _1446 = -_1290;
    float _1448 = fma(_1426, 2.0, _1446);
    float _1450 = float(_1402);
    float _1452 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_784)
    {
        _1412 = _680;
    }
    float _1454 = _1412;
    float _1456 = -_128;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1448);
    float _1460 = float(_1444);
    float _1462 = fma(_1452, -2.0, _1438);
    float _1464 = _1454;
    if (_784)
    {
        _1464 = _672;
    }
    float _1466 = _1464;
    float _1468 = fma(_1410, _1382, _1458);
    float _1470 = _1450 * _1460;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1404 + _1472;
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1326);
    float _1478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1480 = log2(_1478);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1484 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1486 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1476);
    float _1488 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1360);
    float _1490 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1482);
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1430 + _1492;
    float _1496 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1484);
    float _1498 = -_1488;
    float _1500 = fma(_1486, _1264, _1498);
    float _1502 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1350);
    float _1504 = fma(_1108, _1230, _1428);
    float _1506 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1490);
    float _1508 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1462);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1496);
    float _1512 = _1500 + 0.5;
    float _1514 = _1418 * _1418;
    float _1516 = _1480 * _128;
    float _1518 = _1134 + 0.5;
    bool _1520 = _1510 >= 0.0;
    float _1522 = _1388 + 0.5;
    float _1524 = _1386 + 0.5;
    float _1526 = fma(_1474, _1474, _1514);
    float _1528 = fma(_1098, _1196, _1504);
    float _1530 = -_1508;
    float _1532 = fma(_1506, _1198, _1530);
    float _1534 = exp2(_1516);
    float _1536 = fma(_1494, _1494, _1526);
    out.m_61.x = _1522;
    out.m_61.y = _1518;
    out.m_61.z = _1524;
    out.m_61.w = _1512;
    float _1538 = fma(_1114, _1172, _1528);
    float _1540 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1542 = in.m_63.x;
    float _1544 = in.m_63.y;
    float _1546 = in.m_63.z;
    if (_1520)
    {
        _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1548 = _1302;
    float _1550 = rsqrt(_1536);
    float _1552 = _1468 + 0.5;
    float _1554 = _1532 + 0.5;
    int _1556 = as_type<int>(_1548);
    if (_1520)
    {
        float _1558 = _1548 * 5.0;
        _1556 = as_type<int>(_1558);
    }
    int _1560 = _1556;
    float _1562 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1538);
    bool _1564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1572 = _1568 || _1570;
    out.m_65.w = _1540;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1576 = 1.0 + _1574;
    float _1578 = -_1534;
    float _1580 = _1578 + 1.0;
    int _1582 = ~_1040;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1586;
    if (_1520)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5006 = as_type<float>(_1560);
        out.gl_Position.z = _5006;
    }
    float _1590 = 1.0 / _1576;
    int _1592 = ~_1074;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    out.m_67.x = _1552;
    out.m_67.y = _1554;
    int _1598 = _1596;
    if (!_1044)
    {
        int _1600 = ~_1040;
        int _1602 = _1600 + 1;
        _1588 = _1602;
    }
    int _1604 = _1588;
    float _1606 = _1474 * _1550;
    if (!_1078)
    {
        int _1608 = ~_1074;
        int _1610 = _1608 + 1;
        _1598 = _1610;
    }
    int _1612 = _1598;
    out.m_69.x = _1562;
    bool _1614 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1616 = isnan(1.0);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1622 = _1618 || _1620;
    bool _1624 = !_830;
    int _1626 = _1624 ? 0 : 1;
    if (_1520)
    {
        out.m_45.x = 0.0;
    }
    bool _1628 = !_834;
    int _1630 = _1628 ? 0 : 1;
    float _1632 = _1418 * _1550;
    float _1634 = _1572 ? _1580 : 0.0;
    float _1636 = _1546;
    if (_1520)
    {
        return out;
    }
    float _1638 = -_1632;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _1642 = -_1606;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1646 = _1470 * (-2.0);
    float _1648 = _646 + (-0.5);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1652 = _1640 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1656 = _1644 + _1654;
    float _1658 = fma(_1046, _1646, _1046);
    int _1660 = abs(_1626);
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1664 = fma(_1646, _1542, _1542);
    float _1666 = float(_1612);
    float _1668 = _1494 * _1550;
    float _1670 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1662);
    int _1672 = abs(_1630);
    float _1674 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1664);
    float _1676 = float(_1660);
    float _1678 = _672 + _680;
    float _1680 = float(_1672);
    float _1682 = -_1668;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1430);
    float _1686 = float(_1604);
    float _1688 = _1676 * _1666;
    float _1690 = _1684;
    if (_1622)
    {
        float _1692 = _1634 * _1590;
        _132 = _1692;
    }
    float _1694 = _132;
    float _1696 = _1678 + (-1.0);
    float _1698 = _1680 * _1686;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1702 = _1684 + _1700;
    float _1704 = _1688 * (-2.0);
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1708 = _672 + (-0.5);
    float _1710 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1670);
    float _1712 = fma(_1704, _1544, _1544);
    float _1714 = _646 + _680;
    float _1716 = fma(_1706, _1704, _1706);
    float _1718 = _1698 * (-2.0);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1712);
    bool _1722 = _1710 >= 0.0;
    float _1724 = _1714 + (-1.0);
    float _1726 = fma(_1716, _1694, _1720);
    float _1728 = fma(_1718, _1546, _1546);
    float _1730 = _680 + (-0.5);
    float _1732 = fma(_1658, _1694, _1674);
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1736 = _1726 * 0.15915493667125701904296875;
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1728);
    float _1740 = _1732 * 0.15915493667125701904296875;
    float _1742 = fma(_1734, _1718, _1734);
    float _1744 = _1736 * 6.283185482025146484375;
    float _1746 = sin(_1744);
    if (_1722)
    {
        _1636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1748 = _1636;
    float _1750 = fma(_1742, _1694, _1738);
    int _1752 = as_type<int>(_1748);
    if (_1722)
    {
        out.m_45.x = 0.0;
    }
    float _1754 = -_1632;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    if (_1722)
    {
        float _1758 = _1748 * 5.0;
        _1752 = as_type<int>(_1758);
    }
    int _1760 = _1752;
    float _1762 = _1740 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    if (_1722)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5300 = as_type<float>(_1760);
        out.gl_Position.z = _5300;
    }
    float _1766 = _1740 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    float _1770 = _1736 * 6.283185482025146484375;
    float _1772 = cos(_1770);
    if (_1722)
    {
        return out;
    }
    float _1774 = -_758;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1778 = -_1404;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1782 = -_1430;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1786 = -_1606;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1790 = _1776 * _1776;
    float _1792 = _1756 * _1756;
    float _1794 = _1750 * 0.15915493667125701904296875;
    float _1796 = -_1668;
    float _1798 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1800 = fma(_1780, _1780, _1790);
    float _1802 = fma(_1788, _1788, _1792);
    float _1804 = _1794 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1764 * _1746;
    float _1810 = fma(_1784, _1784, _1800);
    float _1812 = fma(_1798, _1798, _1802);
    float _1814 = _1768 * _1772;
    float _1816 = in.m_71.x;
    float _1818 = in.m_71.y;
    float _1820 = in.m_71.z;
    float _1822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1824 = rsqrt(_1810);
    float _1826 = sqrt(_1812);
    float _1828 = fma(_1806, _1814, _1808);
    float _1830 = fma(_1806, _1808, _1814);
    float _1832 = _1780 * _1824;
    float _1834 = _1784 * _1824;
    float _1836 = _1794 * 6.283185482025146484375;
    float _1838 = cos(_1836);
    float _1840 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1844 = _1832 * _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1848 = _1834 * _1846;
    float _1850 = _1764 * _1772;
    float _1852 = _1550 * _1826;
    float _1854 = _1776 * _1824;
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1858 = -_1844;
    float _1860 = fma(_1834, _1856, _1858);
    float _1862 = _1852 * _1840;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1866 = _1854 * _1864;
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1870 = -_1848;
    float _1872 = fma(_1854, _1868, _1870);
    float _1874 = _1860 * _1860;
    float _1876 = _1852 * _1822;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1880 = -_1866;
    float _1882 = fma(_1832, _1878, _1880);
    float _1884 = _1768 * _1746;
    float _1886 = fma(_1872, _1872, _1874);
    float _1888 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1890 = _1772 * _1838;
    float _1892 = fma(_1882, _1882, _1886);
    float _1894 = _1852 * _1888;
    float _1896 = _1746 * _1838;
    float _1898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1818);
    float _1900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1820);
    float _1902 = rsqrt(_1892);
    float _1904 = _1862 * _1898;
    float _1906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1816);
    float _1908 = -_1884;
    float _1910 = fma(_1806, _1850, _1908);
    float _1912 = -_1850;
    float _1914 = fma(_1806, _1884, _1912);
    float _1916 = _1876 * _1900;
    float _1918 = _1894 * _1906;
    float _1920 = _1838 * _1904;
    float _1922 = -_1904;
    float _1924 = _1806 * _1922;
    float _1926 = _1768 * _1920;
    float _1928 = fma(_1890, _1918, _1924);
    float _1930 = _1764 * _1920;
    float _1932 = fma(_1828, _1918, _1926);
    float _1934 = _1872 * _1902;
    float _1936 = _1860 * _1902;
    float _1938 = _1882 * _1902;
    float _1940 = fma(_1914, _1916, _1932);
    float _1942 = _1854 * _1934;
    float _1944 = _1834 * _1936;
    float _1946 = fma(_1910, _1918, _1930);
    float _1948 = fma(_1896, _1916, _1928);
    float _1950 = -_1942;
    float _1952 = fma(_1832, _1936, _1950);
    float _1954 = -_1944;
    float _1956 = fma(_1854, _1938, _1954);
    float _1958 = fma(_1830, _1916, _1946);
    float _1960 = _1952 * _1940;
    float _1962 = _1956 * _1940;
    float _1964 = fma(_1938, _1948, _1960);
    float _1966 = fma(_1934, _1948, _1962);
    float _1968 = fma(_1834, _1958, _1964);
    float _1970 = fma(_1832, _1958, _1966);
    float _1972 = _1832 * _1938;
    float _1974 = _1430 + _1968;
    float _1976 = _1404 + _1970;
    float _1978 = -_1972;
    float _1980 = fma(_1834, _1934, _1978);
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1984 = _1974 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1976 + _1986;
    float _1990 = _1984 * _1984;
    float _1992 = fma(_1988, _1988, _1990);
    float _1994 = _1980 * _1940;
    float _1996 = sqrt(_1992);
    float _1998 = fma(_1936, _1948, _1994);
    float _2000 = fma(_1854, _1958, _1998);
    float _2002 = _758 + _2000;
    bool _2004 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _1970;
    float _2008 = _1976;
    float _2010 = _1974;
    float _2012 = _1940;
    float _2014 = _2002;
    float _2016 = 0.5;
    if (!_2004)
    {
        _2006 = _2002;
    }
    float _2018 = _2006;
    bool _2020 = !_2004;
    float _2022 = _2018;
    if (!_2020)
    {
        float _2024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2028 = _1996 + _2026;
        float _2030 = rsqrt(_1992);
        float _2032 = _2028 * _2024;
        float _2034 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = _2032 * 0.15915493667125701904296875;
        float _2038 = _2036 * 6.283185482025146484375;
        float _2040 = cos(_2038);
        float _2042 = _2036 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = _2040 + (-1.0);
        float _2048 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2050 = fma(_2044, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2052 = fma(_2002, _2040, _2048);
        float _2054 = _2030 * _2050;
        float _2056 = fma(_1988, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2058 = fma(_1984, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2022 = _2052;
        _2008 = _2056;
        _2010 = _2058;
    }
    float _2060 = _2022;
    float _2062 = _2008;
    float _2064 = _2010;
    float _2066 = -_1632;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2070 = -_1606;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2062);
    float _2074 = -_1668;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2064);
    float _2078 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2068 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2072 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2076 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = sqrt(_2096);
    float _2102 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2104 = _2086 * _2102;
    float _2106 = _2090 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 * _2106;
    float _2112 = _2108 + _2110;
    float _2114 = sqrt(_2112);
    bool _2116 = _2114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = _2114 + _2118;
    float _2122 = _2090;
    float _2124 = _2094;
    float _2126 = _2120;
    float _2128 = _2102;
    if (_2116)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2122 = _2130;
    }
    float _2132 = _2122;
    if (_2116)
    {
        float _2134 = rsqrt(_2112);
        _2124 = _2134;
    }
    float _2136 = _2124;
    float _2138 = _2136;
    if (_2116)
    {
        float _2140 = _2120 * _2132;
        _2126 = _2140;
    }
    float _2142 = _2126;
    if (_2116)
    {
        float _2144 = _2142 * 0.15915493667125701904296875;
        _2012 = _2144;
    }
    float _2146 = _2012;
    float _2148 = _2098;
    float _2150 = _2146;
    if (_2116)
    {
        float _2152 = _2146 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2160 = precise::max(0.0, _2158);
    float _2162 = _2132;
    float _2164 = _2160;
    if (_2116)
    {
        float _2166 = _2146 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2162 = _2168;
    }
    float _2170 = _2162;
    float _2172 = -_2102;
    float _2174 = -_2160;
    float _2176 = fma(_2082, _2172, _2174);
    if (_2116)
    {
        float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2178;
    }
    float _2180 = _2164;
    float _2182 = _2180;
    if (!_2116)
    {
        _2150 = _2108;
    }
    float _2184 = _2150;
    float _2186 = _2156;
    float _2188 = _2184;
    if (_2116)
    {
        float _2190 = fma(_2156, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = _2192;
    float _2196 = _2170;
    if (_2116)
    {
        float _2198 = _2170 + (-1.0);
        _2182 = _2198;
    }
    float _2200 = _2182;
    float _2202 = _2200;
    if (_2116)
    {
        float _2204 = _2136 * _2192;
        _2014 = _2204;
    }
    float _2206 = _2014;
    if (!_2116)
    {
        _2138 = _2104;
    }
    float _2208 = _2138;
    float _2210 = _2208;
    if (_2116)
    {
        float _2212 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2212;
    }
    float _2214 = _2128;
    if (_2116)
    {
        float _2216 = _2104 * _2206;
        _2210 = _2216;
    }
    float _2218 = _2210;
    if (!_2116)
    {
        _2194 = _2176;
    }
    float _2220 = _2194;
    float _2222 = _2220;
    if (!_2116)
    {
        _2202 = _2106;
    }
    float _2224 = _2202;
    float _2226 = _2224;
    if (_2116)
    {
        float _2228 = fma(_2176, _2170, _2214);
        _2222 = _2228;
    }
    float _2230 = _2222;
    if (_2116)
    {
        float _2232 = _2106 * _2206;
        _2226 = _2232;
    }
    float _2234 = _2226;
    if (_2116)
    {
        float _2236 = _2218 * _2218;
        _2188 = _2236;
    }
    float _2238 = _2188;
    if (!_2116)
    {
        _2196 = _2110;
    }
    float _2240 = _2196;
    float _2242 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2244 = _2240;
    if (_2116)
    {
        float _2246 = _2234 * _2234;
        _2244 = _2246;
    }
    float _2248 = _2244;
    float _2250 = fma(_2230, _2230, _2238);
    float _2252 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2242);
    float _2254 = _2250 + _2248;
    float _2256 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2260 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2258);
    float _2262 = precise::clamp(_2260, 0.0, 1.0);
    float _2264 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2252);
    float _2266 = rsqrt(_2254);
    float _2268 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2256);
    float _2270 = -_2262;
    float _2272 = _2270 + 1.0;
    float _2274 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2276 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2278 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2268);
    float _2280 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2282 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2274);
    float _2284 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2276);
    float _2286 = abs(_2272);
    float _2288 = log2(_2286);
    float _2290 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2282);
    float _2294 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2284);
    float _2298 = -_2290;
    float _2300 = fma(_2298, _2078, 1.0);
    float _2302 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2304 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2306 = _2296 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2308 = _2266 * _2218;
    float _2310 = _2266 * _2234;
    float _2312 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2304);
    float _2314 = _2266 * _2230;
    float _2316 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2318 = log2(_2300);
    float _2320 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2312);
    float _2322 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2324 = -_2316;
    float _2326 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2324);
    float _2328 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2330 = -_2310;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2326);
    float _2334 = exp2(_2322);
    float _2336 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2320);
    float _2338 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2340 = fma(_2332, -0.5, 0.5);
    float _2342 = fma(_2332, 0.5, 0.5);
    float _2344 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2328);
    float _2346 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2338);
    float _2348 = _2314 + 1.0;
    float _2350 = 1.0 / _2336;
    float _2352 = fma(_2342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2354 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2346);
    float _2356 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2344);
    float _2358 = _2318 * 0.693147182464599609375;
    float _2360 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2356);
    float _2362 = sqrt(_2340);
    float _2364 = -_2314;
    float _2366 = fma(_2334, _2348, _2364);
    float _2368 = fma(_2342, _2352, -0.212114393711090087890625);
    float _2370 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2354);
    float _2372 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2374 = fma(_2366, 0.5, 0.5);
    float _2376 = fma(_2342, _2368, 1.570728778839111328125);
    float _2378 = _2370 * _2350;
    float _2380 = _2360 * _2350;
    float _2382 = fma(_2378, 0.5, 0.5);
    float _2384 = fma(_2380, -0.5, 0.5);
    float _2386 = _2362 * 0.636619746685028076171875;
    float3 _6299 = float3(_2382, _2384, _2372);
    float _2388 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6299, float3(0.0), isnan(_6299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6299, float3(0.0), isnan(_6299)), level(0.0)).x;
    float3 _6310 = float3(_2382, _2384, _2372);
    float4 _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6310, float3(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6310, float3(0.0), isnan(_6310)), level(0.0)).xyzw;
    float _2393 = _2391.x;
    float _2395 = _2391.y;
    float _2397 = _2391.z;
    float _2399 = _2391.w;
    float _2401 = -_2376;
    float _2403 = fma(_2386, _2401, 1.0);
    float2 _6332 = float2(_2403, _2374);
    float3 _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6332, float2(0.0), isnan(_6332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6332, float2(0.0), isnan(_6332)), level(0.0)).xyz;
    float _2409 = _2407.x;
    float _2411 = _2407.y;
    float _2413 = _2407.z;
    float _2415 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2417 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2419 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2421 = isnan(0.5);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2427 = _2423 || _2425;
    float _2429 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2431 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2415);
    float _2433 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2417);
    float _2435 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2429);
    float _2437 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2431);
    float _2439 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2433);
    float _2441 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2435);
    float _2443 = _2437 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2445 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2447 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2427)
    {
        _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2449 = _1690;
    float _2451 = 1.0 / _2443;
    float _2453 = _2445 + _2443;
    float _2455 = _2336 * 0.5;
    float _2457 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2441);
    float _2459 = _2457 + _2336;
    float _2461 = exp2(_2447);
    out.gl_Position.x = _2370;
    out.gl_Position.y = _2360;
    out.gl_Position.z = _2457;
    out.gl_Position.w = _2336;
    float _2463 = _2459 * 0.5;
    float _2465 = _2453 * _2451;
    float _2467 = _2465 * 0.5;
    float _2469 = _2451;
    float _2471 = _2467;
    float _2473 = _2449;
    if (_2427)
    {
        _2469 = 1.0;
    }
    float _2475 = _2469;
    float _2477 = _2475;
    if (!_2427)
    {
        float _2479 = -_2449;
        float _2481 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2479);
        _2471 = _2481;
    }
    float _2483 = _2471;
    if (!_2427)
    {
        _2473 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2485 = _2473;
    float _2487 = -_2461;
    float _2489 = _2487 + 1.0;
    float _2491 = _2483;
    float _2493 = _2485;
    if (!_2427)
    {
        float _2495 = 1.0 / _2483;
        _2491 = _2495;
    }
    float _2497 = _2491;
    if (!_2427)
    {
        float _2499 = -_2485;
        float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2016 = _2501;
    }
    float _2503 = _2016;
    float _2505 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2507 = _2382;
    if (!_2427)
    {
        float _2509 = 1.0 / _2503;
        _2507 = _2509;
    }
    float _2511 = _2507;
    if (!_2427)
    {
        float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2515 = -_2485;
        float _2517 = fma(_2497, _2513, _2515);
        _2493 = _2517;
    }
    float _2519 = _2493;
    float _2521 = _2370 + _2336;
    float _2523 = _2521 * 0.5;
    if (!_2427)
    {
        float _2525 = _2519 * _2511;
        float _2527 = precise::clamp(_2525, 0.0, 1.0);
        _2477 = _2527;
    }
    float _2529 = _2477;
    float _2531 = fma(_2360, -0.5, _2455);
    float _2533 = _2529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2535 = _2529 > 0.0;
    bool _2537 = isnan(_2529);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(0.0);
    bool _2543 = _2539 || _2541;
    out.m_73.x = _2523;
    out.m_73.y = _2531;
    out.m_73.z = _2463;
    out.m_73.w = _2336;
    float _2545 = _2533 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2545;
    float _2547 = _2505 * _2388;
    float _2549 = -_2505;
    float _2551 = _2549 + 1.0;
    float _2553 = _2399 * _2547;
    float _2555 = _2399 * _2551;
    float _2557 = _2413 * _2547;
    float _2559 = fma(_2409, _2553, _2393);
    float _2561 = fma(_2411, _2553, _2395);
    float _2563 = fma(_2399, _2557, _2397);
    out.m_75.x = _2559;
    out.m_75.y = _2561;
    out.m_75.z = _2563;
    out.m_75.w = _2555;
    if (_2543)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2565 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2565;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _628 = false;
    bool _474 = false;
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
        float _2622 = as_type<float>(_110);
        out.gl_Position.z = _2622;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_148);
        out.gl_Position.z = _2691;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    int _274 = as_type<int>(_266);
    float _292;
    if (!_272)
    {
        float _276 = in.m_51.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
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
        float _300 = _128 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _342;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _338;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _322 * _360;
    float _384 = _306 * _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_370, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = in.m_49.x;
    float _402 = in.m_49.y;
    float _404 = in.m_49.z;
    float _406 = _394 * _376;
    float _408 = _396 * _376;
    float _410 = _398 * _376;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _426 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _428 = fma(_414, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_418, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_422, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _436 = fma(_428, _362, _424);
    float _438 = fma(_430, _362, _426);
    float _440 = fma(_432, _362, _434);
    float _442 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].y, _438);
    float _446 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].z, _440);
    float _448 = _442 * _400;
    float _450 = _444 * _402;
    float _452 = _446 * _404;
    bool _454 = !_372;
    float _472;
    if (!_454)
    {
        float _456 = in.m_51.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_94);
        float _478 = 1.0 / _476;
        float _480 = _128 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _486 = _482 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = isnan(_482);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_482);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_482);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _490;
    float _538 = -_502;
    float _540 = _538 + 1.0;
    bool _542 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _544 = _518 * _540;
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _506;
    float _552 = _522 * _536;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _486, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _550;
    float _562 = _558 * _544;
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _482 + _568;
    float _572 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _574 = _502 * _566;
    float _576 = fma(_560, _570, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = fma(_576, _574, _572);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[117].x, _580);
    float _588 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _588;
    out.m_53.y = _590;
    out.m_53.z = _592;
    out.m_53.w = _594;
    bool _596 = !_542;
    int _598 = as_type<int>(_582);
    bool _600 = _542;
    float _624;
    float _626;
    if (!_596)
    {
        float _602 = in.m_51.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = float(_94);
        float _608 = 1.0 / _606;
        float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _612 = _128 * _608;
        float _614 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _616 = _614 * _604;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _598 = as_type<int>(_616);
        _624 = _612;
        _626 = _622;
        _628 = true;
    }
    else
    {
        float _630 = float(_94);
        float _632 = 1.0 / _630;
        float _634 = _128 * _632;
        _624 = _634;
        _626 = _634;
    }
    _628 = false;
    int _636 = _598;
    float _638 = _624;
    float _640 = _626;
    float _642 = in.m_55.x;
    float _644 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = in.m_51.x;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _650 = _648 != 0;
    float _652 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _656 = _654 != 0;
    float _658 = in.m_55.y;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _662 = _660 != 0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _670 = _668 != 0;
    float _672 = in.m_51.y;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _676 = _674 != 0;
    float _678 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _652);
    float _680 = in.m_51.z;
    float _682 = 1.0 / _666;
    float _684 = in.m_51.w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _694 = _636;
    float _696 = _642;
    if (_650)
    {
        float _698 = -_642;
        float _700 = _698 + 1.0;
        _694 = as_type<int>(_700);
    }
    int _702 = _694;
    float _704 = 0.0;
    if (!_650)
    {
        _704 = _642;
    }
    float _706 = _704;
    float _708 = in.m_57.x;
    float _710 = 0.0;
    float _712 = _706;
    if (!_656)
    {
        _710 = _642;
    }
    float _714 = _710;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _720 = _714;
    if (_650)
    {
        bool _722 = _646 > 0.5;
        _600 = _722;
    }
    bool _724 = _600;
    float _726 = in.m_57.z;
    float _728 = 1.0 / _688;
    float _730 = -_658;
    float _732 = _730 + 1.0;
    float _734 = _658;
    if (_650)
    {
        float _736 = _724 ? as_type<float>(_702) : _642;
        _712 = _736;
    }
    float _738 = _712;
    float _740 = in.m_57.y;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _744 = _742 != 0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _750 = _672 > 0.5;
    float _752 = in.m_57.w;
    float _754 = 1.0 / _692;
    int _756 = _750 ? as_type<int>(_732) : as_type<int>(_658);
    float _758 = _678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _760 = _680 > 0.5;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _766 = _662 ? as_type<float>(_756) : _658;
    int _768 = _760 ? as_type<int>(_732) : as_type<int>(_658);
    float _770 = 1.0 / _718;
    out.m_59.x = _708;
    float _772 = _670 ? as_type<float>(_768) : _658;
    int _774 = 0;
    if (_744)
    {
        float _776 = -_642;
        float _778 = _776 + 1.0;
        _774 = as_type<int>(_778);
    }
    int _780 = _774;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _784 = _782 != 0;
    float _786 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _788 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _790 = _684 > 0.5;
    float _792 = 1.0 / _764;
    float _794 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _786);
    float _796 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    if (_656)
    {
        float _798 = -_642;
        float _800 = _798 + 1.0;
        _274 = as_type<int>(_800);
    }
    int _802 = _274;
    out.m_59.z = _726;
    float _804 = _672 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_656)
    {
        float _806 = _760 ? as_type<float>(_802) : _642;
        _720 = _806;
    }
    float _808 = _720;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _814 = 1.0 / _748;
    out.m_59.y = _740;
    if (_676)
    {
        float _816 = _790 ? _732 : _658;
        _734 = _816;
    }
    float _818 = _734;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _842 = -_820;
    float _844 = fma(_836, 2.0, _842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _850 = fma(_804, -2.0, _822);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _856 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _858;
    float _862 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _864 = 1.0 / _812;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _870 = _680 * 2.0;
    float _872 = _860 * _682;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _874;
    out.m_59.w = _752;
    float _878 = 1.0 / _840;
    float _880 = _868 * _728;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _890 = _876 * _792;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _892;
    float _896 = _884 * _754;
    float _898 = 1.0 / _848;
    float _900 = _646 * 2.0;
    float _902 = _888 * _770;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _908 = _894 * _814;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _910;
    float _914 = _906 * _864;
    float _916 = 1.0 / _854;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _918;
    float _922 = _912 * _878;
    float _924 = _646 + _672;
    if (_744)
    {
        float _926 = _750 ? as_type<float>(_780) : _642;
        _696 = _926;
    }
    float _928 = _696;
    float _930 = -_128;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[76].x, _844);
    float _934 = _924 + (-1.0);
    float _936 = floor(_870);
    float _938 = _672 * 2.0;
    bool _940 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _942 = isnan(_638);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _954 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _956 = isnan(_640);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    bool _966 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _968 = isnan(_640);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = floor(_938);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _988 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _990 = isnan(_638);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_976;
    float _1002 = _1000 + 1.0;
    float _1004 = floor(_900);
    bool _1006 = _936 >= 0.0;
    bool _1008 = isnan(_936);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = _936 > 0.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1020 = _638 + _1018;
    int _1022 = _1014 ? 0 : 1;
    bool _1024 = _982 >= 0.0;
    bool _1026 = isnan(_982);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = _986 * _898;
    float _1036 = _920 * _916;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1040 = _1032 ? 0 : 1;
    float _1042 = fma(_908, _1020, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1044 = _982 > 0.0;
    float _1046 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _640 + _1048;
    bool _1052 = _1004 >= 0.0;
    bool _1054 = isnan(_1004);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1064 = _638 + _1062;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1068 = fma(_872, _1050, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1072 = _638 + _1070;
    int _1074 = _1060 ? 0 : 1;
    float _1076 = fma(_890, _1064, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1078 = _1004 > 0.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = _640 + _1080;
    float _1084 = fma(_914, _1072, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1088 = _638 + _1086;
    float _1090 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1092 = fma(_896, _1082, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1096 = _638 + _1094;
    float _1098 = fma(_1034, _1088, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1100 = fma(_1090, _766, -0.5);
    float _1102 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[78].w, _952);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1106 = _638 + _1104;
    float _1108 = fma(_922, _1096, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1110 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _850);
    float _1112 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1102);
    float _1114 = fma(_1036, _1106, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1116 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1118 = isnan(_638);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1130 = _640 + _1128;
    float _1132 = -_1110;
    float _1134 = fma(_1112, _1100, _1132);
    bool _1136 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1138 = isnan(_638);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1150 = fma(_880, _1130, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1152 = -_1126;
    float _1154 = _1152 + 1.0;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1158 = _638 + _1156;
    bool _1160 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1162 = isnan(_638);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _1146 * _1154;
    float _1174 = fma(_902, _1158, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1176 = -_1146;
    float _1178 = _1176 + 1.0;
    float _1180 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1182 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1184 = isnan(_638);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1196 = _1170 * _1178;
    float _1198 = fma(_772, _1180, -0.5);
    float _1200 = -_1170;
    float _1202 = _1200 + 1.0;
    bool _1204 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1206 = isnan(_640);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1218 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1220 = isnan(_640);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = _1192 * _1202;
    bool _1232 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1234 = isnan(_638);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1192;
    float _1246 = _1244 + 1.0;
    bool _1248 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1250 = isnan(_638);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = -_1214;
    float _1262 = _1260 + 1.0;
    float _1264 = fma(_1216, _818, -0.5);
    float _1266 = _950 * _1246;
    float _1268 = -_1228;
    float _1270 = _1268 + 1.0;
    float _1272 = _1228 * _1262;
    float _1274 = _1258 * _980;
    float _1276 = -_1258;
    float _1278 = _1276 + 1.0;
    float _1280 = _976 * _1270;
    float _1282 = _964 * _1002;
    float _1284 = _998 * _1278;
    float _1286 = -_998;
    float _1288 = _1286 + 1.0;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1292 = _1068 * _1282;
    float _1294 = _1242 * _1288;
    float _1296 = _1288;
    float _1298 = _1280;
    float _1300 = _1258;
    float _1302 = _1172;
    if (!_784)
    {
        _1296 = _672;
    }
    float _1304 = _1296;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1308 = _1304;
    if (_784)
    {
        _1308 = _646;
    }
    float _1310 = _1308;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1314 = -_964;
    float _1316 = _1314 + 1.0;
    float _1318 = _1076 * _1294;
    float _1320 = -_1242;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1312);
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1328 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1292);
    float _1330 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1318);
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1334 = fma(_1150, _1280, _1328);
    if (!_784)
    {
        _1298 = _680;
    }
    float _1336 = _1298;
    float _1338 = fma(_1174, _1284, _1330);
    float _1340 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1342 = _1336;
    if (_784)
    {
        _1342 = _672;
    }
    float _1344 = _1342;
    float _1346 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1350 = fma(_1092, _1272, _1334);
    float _1352 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1354 = fma(_1346, _808, -0.5);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1358 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1360 = fma(_1352, -2.0, _1348);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1364 = fma(_1340, _738, -0.5);
    float _1366 = -_1356;
    float _1368 = fma(_1358, 2.0, _1366);
    float _1370 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1362);
    float _1372 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1374 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1324);
    float _1376 = -_128;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1368);
    float _1380 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1370);
    float _1382 = fma(_1372, _928, -0.5);
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1386 = fma(_1374, _1354, _1378);
    float _1388 = fma(_1380, _1364, _932);
    bool _1390 = !_826;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1384);
    float _1396 = _1384;
    if (_784)
    {
        _1300 = _646;
    }
    float _1398 = _1300;
    float _1400 = fma(_1042, _1274, _1338);
    int _1402 = abs(_1392);
    float _1404 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1406 = _1398;
    if (!_784)
    {
        _1406 = _680;
    }
    float _1408 = _1406;
    float _1410 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1394);
    float _1412 = _1408;
    if (_784)
    {
        _1396 = _672;
    }
    float _1414 = _1396;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _758 + _1416;
    int _1420 = ~_1022;
    int _1422 = _1420 + 1;
    int _1424 = _1422 + 1;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1428 = fma(_1084, _1266, _1400);
    float _1430 = _862 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1432 = _1414;
    int _1434 = _1424;
    if (!_784)
    {
        _1432 = _646;
    }
    float _1436 = _1432;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (!_1016)
    {
        int _1440 = ~_1022;
        int _1442 = _1440 + 1;
        _1434 = _1442;
    }
    int _1444 = _1434;
    float _1446 = -_1290;
    float _1448 = fma(_1426, 2.0, _1446);
    float _1450 = float(_1402);
    float _1452 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_784)
    {
        _1412 = _680;
    }
    float _1454 = _1412;
    float _1456 = -_128;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1448);
    float _1460 = float(_1444);
    float _1462 = fma(_1452, -2.0, _1438);
    float _1464 = _1454;
    if (_784)
    {
        _1464 = _672;
    }
    float _1466 = _1464;
    float _1468 = fma(_1410, _1382, _1458);
    float _1470 = _1450 * _1460;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1404 + _1472;
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1326);
    float _1478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1480 = log2(_1478);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1484 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1486 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1476);
    float _1488 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1360);
    float _1490 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1482);
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1430 + _1492;
    float _1496 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1484);
    float _1498 = -_1488;
    float _1500 = fma(_1486, _1264, _1498);
    float _1502 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1350);
    float _1504 = fma(_1108, _1230, _1428);
    float _1506 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1490);
    float _1508 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1462);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1496);
    float _1512 = _1500 + 0.5;
    float _1514 = _1418 * _1418;
    float _1516 = _1480 * _128;
    float _1518 = _1134 + 0.5;
    bool _1520 = _1510 >= 0.0;
    float _1522 = _1388 + 0.5;
    float _1524 = _1386 + 0.5;
    float _1526 = fma(_1474, _1474, _1514);
    float _1528 = fma(_1098, _1196, _1504);
    float _1530 = -_1508;
    float _1532 = fma(_1506, _1198, _1530);
    float _1534 = exp2(_1516);
    float _1536 = fma(_1494, _1494, _1526);
    out.m_61.x = _1522;
    out.m_61.y = _1518;
    out.m_61.z = _1524;
    out.m_61.w = _1512;
    float _1538 = fma(_1114, _1172, _1528);
    float _1540 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1542 = in.m_63.x;
    float _1544 = in.m_63.y;
    float _1546 = in.m_63.z;
    if (_1520)
    {
        _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1548 = _1302;
    float _1550 = rsqrt(_1536);
    float _1552 = _1468 + 0.5;
    float _1554 = _1532 + 0.5;
    int _1556 = as_type<int>(_1548);
    if (_1520)
    {
        float _1558 = _1548 * 5.0;
        _1556 = as_type<int>(_1558);
    }
    int _1560 = _1556;
    float _1562 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1538);
    bool _1564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1572 = _1568 || _1570;
    out.m_65.w = _1540;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1576 = 1.0 + _1574;
    float _1578 = -_1534;
    float _1580 = _1578 + 1.0;
    int _1582 = ~_1040;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1586;
    if (_1520)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5006 = as_type<float>(_1560);
        out.gl_Position.z = _5006;
    }
    float _1590 = 1.0 / _1576;
    int _1592 = ~_1074;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    out.m_67.x = _1552;
    out.m_67.y = _1554;
    int _1598 = _1596;
    if (!_1044)
    {
        int _1600 = ~_1040;
        int _1602 = _1600 + 1;
        _1588 = _1602;
    }
    int _1604 = _1588;
    float _1606 = _1474 * _1550;
    if (!_1078)
    {
        int _1608 = ~_1074;
        int _1610 = _1608 + 1;
        _1598 = _1610;
    }
    int _1612 = _1598;
    out.m_69.x = _1562;
    bool _1614 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1616 = isnan(1.0);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1622 = _1618 || _1620;
    bool _1624 = !_830;
    int _1626 = _1624 ? 0 : 1;
    if (_1520)
    {
        out.m_45.x = 0.0;
    }
    bool _1628 = !_834;
    int _1630 = _1628 ? 0 : 1;
    float _1632 = _1418 * _1550;
    float _1634 = _1572 ? _1580 : 0.0;
    float _1636 = _1546;
    if (_1520)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1638 = -_1632;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _1642 = -_1606;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1646 = _1470 * (-2.0);
    float _1648 = _646 + (-0.5);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1652 = _1640 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1656 = _1644 + _1654;
    float _1658 = fma(_1046, _1646, _1046);
    int _1660 = abs(_1626);
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1664 = fma(_1646, _1542, _1542);
    float _1666 = float(_1612);
    float _1668 = _1494 * _1550;
    float _1670 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1662);
    int _1672 = abs(_1630);
    float _1674 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1664);
    float _1676 = float(_1660);
    float _1678 = _672 + _680;
    float _1680 = float(_1672);
    float _1682 = -_1668;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1430);
    float _1686 = float(_1604);
    float _1688 = _1676 * _1666;
    float _1690 = _1684;
    if (_1622)
    {
        float _1692 = _1634 * _1590;
        _132 = _1692;
    }
    float _1694 = _132;
    float _1696 = _1678 + (-1.0);
    float _1698 = _1680 * _1686;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1702 = _1684 + _1700;
    float _1704 = _1688 * (-2.0);
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1708 = _672 + (-0.5);
    float _1710 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1670);
    float _1712 = fma(_1704, _1544, _1544);
    float _1714 = _646 + _680;
    float _1716 = fma(_1706, _1704, _1706);
    float _1718 = _1698 * (-2.0);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1712);
    bool _1722 = _1710 >= 0.0;
    float _1724 = _1714 + (-1.0);
    float _1726 = fma(_1716, _1694, _1720);
    float _1728 = fma(_1718, _1546, _1546);
    float _1730 = _680 + (-0.5);
    float _1732 = fma(_1658, _1694, _1674);
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1736 = _1726 * 0.15915493667125701904296875;
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1728);
    float _1740 = _1732 * 0.15915493667125701904296875;
    float _1742 = fma(_1734, _1718, _1734);
    float _1744 = _1736 * 6.283185482025146484375;
    float _1746 = sin(_1744);
    if (_1722)
    {
        _1636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1748 = _1636;
    float _1750 = fma(_1742, _1694, _1738);
    int _1752 = as_type<int>(_1748);
    if (_1722)
    {
        out.m_45.x = 0.0;
    }
    float _1754 = -_1632;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    if (_1722)
    {
        float _1758 = _1748 * 5.0;
        _1752 = as_type<int>(_1758);
    }
    int _1760 = _1752;
    float _1762 = _1740 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    if (_1722)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5300 = as_type<float>(_1760);
        out.gl_Position.z = _5300;
    }
    float _1766 = _1740 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    float _1770 = _1736 * 6.283185482025146484375;
    float _1772 = cos(_1770);
    if (_1722)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1774 = -_758;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1778 = -_1404;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1782 = -_1430;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1786 = -_1606;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1790 = _1776 * _1776;
    float _1792 = _1756 * _1756;
    float _1794 = _1750 * 0.15915493667125701904296875;
    float _1796 = -_1668;
    float _1798 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1800 = fma(_1780, _1780, _1790);
    float _1802 = fma(_1788, _1788, _1792);
    float _1804 = _1794 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1764 * _1746;
    float _1810 = fma(_1784, _1784, _1800);
    float _1812 = fma(_1798, _1798, _1802);
    float _1814 = _1768 * _1772;
    float _1816 = in.m_71.x;
    float _1818 = in.m_71.y;
    float _1820 = in.m_71.z;
    float _1822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1824 = rsqrt(_1810);
    float _1826 = sqrt(_1812);
    float _1828 = fma(_1806, _1814, _1808);
    float _1830 = fma(_1806, _1808, _1814);
    float _1832 = _1780 * _1824;
    float _1834 = _1784 * _1824;
    float _1836 = _1794 * 6.283185482025146484375;
    float _1838 = cos(_1836);
    float _1840 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1844 = _1832 * _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1848 = _1834 * _1846;
    float _1850 = _1764 * _1772;
    float _1852 = _1550 * _1826;
    float _1854 = _1776 * _1824;
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1858 = -_1844;
    float _1860 = fma(_1834, _1856, _1858);
    float _1862 = _1852 * _1840;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1866 = _1854 * _1864;
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1870 = -_1848;
    float _1872 = fma(_1854, _1868, _1870);
    float _1874 = _1860 * _1860;
    float _1876 = _1852 * _1822;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1880 = -_1866;
    float _1882 = fma(_1832, _1878, _1880);
    float _1884 = _1768 * _1746;
    float _1886 = fma(_1872, _1872, _1874);
    float _1888 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1890 = _1772 * _1838;
    float _1892 = fma(_1882, _1882, _1886);
    float _1894 = _1852 * _1888;
    float _1896 = _1746 * _1838;
    float _1898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1818);
    float _1900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1820);
    float _1902 = rsqrt(_1892);
    float _1904 = _1862 * _1898;
    float _1906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1816);
    float _1908 = -_1884;
    float _1910 = fma(_1806, _1850, _1908);
    float _1912 = -_1850;
    float _1914 = fma(_1806, _1884, _1912);
    float _1916 = _1876 * _1900;
    float _1918 = _1894 * _1906;
    float _1920 = _1838 * _1904;
    float _1922 = -_1904;
    float _1924 = _1806 * _1922;
    float _1926 = _1768 * _1920;
    float _1928 = fma(_1890, _1918, _1924);
    float _1930 = _1764 * _1920;
    float _1932 = fma(_1828, _1918, _1926);
    float _1934 = _1872 * _1902;
    float _1936 = _1860 * _1902;
    float _1938 = _1882 * _1902;
    float _1940 = fma(_1914, _1916, _1932);
    float _1942 = _1854 * _1934;
    float _1944 = _1834 * _1936;
    float _1946 = fma(_1910, _1918, _1930);
    float _1948 = fma(_1896, _1916, _1928);
    float _1950 = -_1942;
    float _1952 = fma(_1832, _1936, _1950);
    float _1954 = -_1944;
    float _1956 = fma(_1854, _1938, _1954);
    float _1958 = fma(_1830, _1916, _1946);
    float _1960 = _1952 * _1940;
    float _1962 = _1956 * _1940;
    float _1964 = fma(_1938, _1948, _1960);
    float _1966 = fma(_1934, _1948, _1962);
    float _1968 = fma(_1834, _1958, _1964);
    float _1970 = fma(_1832, _1958, _1966);
    float _1972 = _1832 * _1938;
    float _1974 = _1430 + _1968;
    float _1976 = _1404 + _1970;
    float _1978 = -_1972;
    float _1980 = fma(_1834, _1934, _1978);
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1984 = _1974 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1976 + _1986;
    float _1990 = _1984 * _1984;
    float _1992 = fma(_1988, _1988, _1990);
    float _1994 = _1980 * _1940;
    float _1996 = sqrt(_1992);
    float _1998 = fma(_1936, _1948, _1994);
    float _2000 = fma(_1854, _1958, _1998);
    float _2002 = _758 + _2000;
    bool _2004 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _1970;
    float _2008 = _1976;
    float _2010 = _1974;
    float _2012 = _1940;
    float _2014 = _2002;
    float _2016 = 0.5;
    if (!_2004)
    {
        _2006 = _2002;
    }
    float _2018 = _2006;
    bool _2020 = !_2004;
    float _2022 = _2018;
    if (!_2020)
    {
        float _2024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2028 = _1996 + _2026;
        float _2030 = rsqrt(_1992);
        float _2032 = _2028 * _2024;
        float _2034 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = _2032 * 0.15915493667125701904296875;
        float _2038 = _2036 * 6.283185482025146484375;
        float _2040 = cos(_2038);
        float _2042 = _2036 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = _2040 + (-1.0);
        float _2048 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2050 = fma(_2044, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2052 = fma(_2002, _2040, _2048);
        float _2054 = _2030 * _2050;
        float _2056 = fma(_1988, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2058 = fma(_1984, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2022 = _2052;
        _2008 = _2056;
        _2010 = _2058;
    }
    float _2060 = _2022;
    float _2062 = _2008;
    float _2064 = _2010;
    float _2066 = -_1632;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2070 = -_1606;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2062);
    float _2074 = -_1668;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2064);
    float _2078 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2068 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2072 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2076 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = sqrt(_2096);
    float _2102 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2104 = _2086 * _2102;
    float _2106 = _2090 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 * _2106;
    float _2112 = _2108 + _2110;
    float _2114 = sqrt(_2112);
    bool _2116 = _2114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = _2114 + _2118;
    float _2122 = _2090;
    float _2124 = _2094;
    float _2126 = _2120;
    float _2128 = _2102;
    if (_2116)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2122 = _2130;
    }
    float _2132 = _2122;
    if (_2116)
    {
        float _2134 = rsqrt(_2112);
        _2124 = _2134;
    }
    float _2136 = _2124;
    float _2138 = _2136;
    if (_2116)
    {
        float _2140 = _2120 * _2132;
        _2126 = _2140;
    }
    float _2142 = _2126;
    if (_2116)
    {
        float _2144 = _2142 * 0.15915493667125701904296875;
        _2012 = _2144;
    }
    float _2146 = _2012;
    float _2148 = _2098;
    float _2150 = _2146;
    if (_2116)
    {
        float _2152 = _2146 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2160 = precise::max(0.0, _2158);
    float _2162 = _2132;
    float _2164 = _2160;
    if (_2116)
    {
        float _2166 = _2146 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2162 = _2168;
    }
    float _2170 = _2162;
    float _2172 = -_2102;
    float _2174 = -_2160;
    float _2176 = fma(_2082, _2172, _2174);
    if (_2116)
    {
        float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2178;
    }
    float _2180 = _2164;
    float _2182 = _2180;
    if (!_2116)
    {
        _2150 = _2108;
    }
    float _2184 = _2150;
    float _2186 = _2156;
    float _2188 = _2184;
    if (_2116)
    {
        float _2190 = fma(_2156, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = _2192;
    float _2196 = _2170;
    if (_2116)
    {
        float _2198 = _2170 + (-1.0);
        _2182 = _2198;
    }
    float _2200 = _2182;
    float _2202 = _2200;
    if (_2116)
    {
        float _2204 = _2136 * _2192;
        _2014 = _2204;
    }
    float _2206 = _2014;
    if (!_2116)
    {
        _2138 = _2104;
    }
    float _2208 = _2138;
    float _2210 = _2208;
    if (_2116)
    {
        float _2212 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2212;
    }
    float _2214 = _2128;
    if (_2116)
    {
        float _2216 = _2104 * _2206;
        _2210 = _2216;
    }
    float _2218 = _2210;
    if (!_2116)
    {
        _2194 = _2176;
    }
    float _2220 = _2194;
    float _2222 = _2220;
    if (!_2116)
    {
        _2202 = _2106;
    }
    float _2224 = _2202;
    float _2226 = _2224;
    if (_2116)
    {
        float _2228 = fma(_2176, _2170, _2214);
        _2222 = _2228;
    }
    float _2230 = _2222;
    if (_2116)
    {
        float _2232 = _2106 * _2206;
        _2226 = _2232;
    }
    float _2234 = _2226;
    if (_2116)
    {
        float _2236 = _2218 * _2218;
        _2188 = _2236;
    }
    float _2238 = _2188;
    if (!_2116)
    {
        _2196 = _2110;
    }
    float _2240 = _2196;
    float _2242 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2244 = _2240;
    if (_2116)
    {
        float _2246 = _2234 * _2234;
        _2244 = _2246;
    }
    float _2248 = _2244;
    float _2250 = fma(_2230, _2230, _2238);
    float _2252 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2242);
    float _2254 = _2250 + _2248;
    float _2256 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2260 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2258);
    float _2262 = precise::clamp(_2260, 0.0, 1.0);
    float _2264 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2252);
    float _2266 = rsqrt(_2254);
    float _2268 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2256);
    float _2270 = -_2262;
    float _2272 = _2270 + 1.0;
    float _2274 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2276 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2278 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2268);
    float _2280 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2282 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2274);
    float _2284 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2276);
    float _2286 = abs(_2272);
    float _2288 = log2(_2286);
    float _2290 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2282);
    float _2294 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2284);
    float _2298 = -_2290;
    float _2300 = fma(_2298, _2078, 1.0);
    float _2302 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2304 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2306 = _2296 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2308 = _2266 * _2218;
    float _2310 = _2266 * _2234;
    float _2312 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2304);
    float _2314 = _2266 * _2230;
    float _2316 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2318 = log2(_2300);
    float _2320 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2312);
    float _2322 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2324 = -_2316;
    float _2326 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2324);
    float _2328 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2330 = -_2310;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2326);
    float _2334 = exp2(_2322);
    float _2336 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2320);
    float _2338 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2340 = fma(_2332, -0.5, 0.5);
    float _2342 = fma(_2332, 0.5, 0.5);
    float _2344 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2328);
    float _2346 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2338);
    float _2348 = _2314 + 1.0;
    float _2350 = 1.0 / _2336;
    float _2352 = fma(_2342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2354 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2346);
    float _2356 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2344);
    float _2358 = _2318 * 0.693147182464599609375;
    float _2360 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2356);
    float _2362 = sqrt(_2340);
    float _2364 = -_2314;
    float _2366 = fma(_2334, _2348, _2364);
    float _2368 = fma(_2342, _2352, -0.212114393711090087890625);
    float _2370 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2354);
    float _2372 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2374 = fma(_2366, 0.5, 0.5);
    float _2376 = fma(_2342, _2368, 1.570728778839111328125);
    float _2378 = _2370 * _2350;
    float _2380 = _2360 * _2350;
    float _2382 = fma(_2378, 0.5, 0.5);
    float _2384 = fma(_2380, -0.5, 0.5);
    float _2386 = _2362 * 0.636619746685028076171875;
    float3 _6299 = float3(_2382, _2384, _2372);
    float _2388 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6299, float3(0.0), isnan(_6299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6299, float3(0.0), isnan(_6299)), level(0.0)).x;
    float3 _6310 = float3(_2382, _2384, _2372);
    float4 _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6310, float3(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6310, float3(0.0), isnan(_6310)), level(0.0)).xyzw;
    float _2393 = _2391.x;
    float _2395 = _2391.y;
    float _2397 = _2391.z;
    float _2399 = _2391.w;
    float _2401 = -_2376;
    float _2403 = fma(_2386, _2401, 1.0);
    float2 _6332 = float2(_2403, _2374);
    float3 _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6332, float2(0.0), isnan(_6332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6332, float2(0.0), isnan(_6332)), level(0.0)).xyz;
    float _2409 = _2407.x;
    float _2411 = _2407.y;
    float _2413 = _2407.z;
    float _2415 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2417 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2419 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2421 = isnan(0.5);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2427 = _2423 || _2425;
    float _2429 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2431 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2415);
    float _2433 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2417);
    float _2435 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2429);
    float _2437 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2431);
    float _2439 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2433);
    float _2441 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2435);
    float _2443 = _2437 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2445 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2447 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2427)
    {
        _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2449 = _1690;
    float _2451 = 1.0 / _2443;
    float _2453 = _2445 + _2443;
    float _2455 = _2336 * 0.5;
    float _2457 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2441);
    float _2459 = _2457 + _2336;
    float _2461 = exp2(_2447);
    out.gl_Position.x = _2370;
    out.gl_Position.y = _2360;
    out.gl_Position.z = _2457;
    out.gl_Position.w = _2336;
    float _2463 = _2459 * 0.5;
    float _2465 = _2453 * _2451;
    float _2467 = _2465 * 0.5;
    float _2469 = _2451;
    float _2471 = _2467;
    float _2473 = _2449;
    if (_2427)
    {
        _2469 = 1.0;
    }
    float _2475 = _2469;
    float _2477 = _2475;
    if (!_2427)
    {
        float _2479 = -_2449;
        float _2481 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2479);
        _2471 = _2481;
    }
    float _2483 = _2471;
    if (!_2427)
    {
        _2473 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2485 = _2473;
    float _2487 = -_2461;
    float _2489 = _2487 + 1.0;
    float _2491 = _2483;
    float _2493 = _2485;
    if (!_2427)
    {
        float _2495 = 1.0 / _2483;
        _2491 = _2495;
    }
    float _2497 = _2491;
    if (!_2427)
    {
        float _2499 = -_2485;
        float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2016 = _2501;
    }
    float _2503 = _2016;
    float _2505 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2507 = _2382;
    if (!_2427)
    {
        float _2509 = 1.0 / _2503;
        _2507 = _2509;
    }
    float _2511 = _2507;
    if (!_2427)
    {
        float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2515 = -_2485;
        float _2517 = fma(_2497, _2513, _2515);
        _2493 = _2517;
    }
    float _2519 = _2493;
    float _2521 = _2370 + _2336;
    float _2523 = _2521 * 0.5;
    if (!_2427)
    {
        float _2525 = _2519 * _2511;
        float _2527 = precise::clamp(_2525, 0.0, 1.0);
        _2477 = _2527;
    }
    float _2529 = _2477;
    float _2531 = fma(_2360, -0.5, _2455);
    float _2533 = _2529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2535 = _2529 > 0.0;
    bool _2537 = isnan(_2529);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(0.0);
    bool _2543 = _2539 || _2541;
    out.m_73.x = _2523;
    out.m_73.y = _2531;
    out.m_73.z = _2463;
    out.m_73.w = _2336;
    float _2545 = _2533 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2545;
    float _2547 = _2505 * _2388;
    float _2549 = -_2505;
    float _2551 = _2549 + 1.0;
    float _2553 = _2399 * _2547;
    float _2555 = _2399 * _2551;
    float _2557 = _2413 * _2547;
    float _2559 = fma(_2409, _2553, _2393);
    float _2561 = fma(_2411, _2553, _2395);
    float _2563 = fma(_2399, _2557, _2397);
    out.m_75.x = _2559;
    out.m_75.y = _2561;
    out.m_75.z = _2563;
    out.m_75.w = _2555;
    if (_2543)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2565 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2565;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

