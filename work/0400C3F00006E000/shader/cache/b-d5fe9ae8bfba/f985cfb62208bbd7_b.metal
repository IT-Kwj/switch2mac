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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3176 = false;
    bool _636 = false;
    bool _506 = false;
    bool _352 = false;
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
        float _3461 = as_type<float>(_122);
        out.gl_Position.z = _3461;
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
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_160);
        out.gl_Position.z = _3530;
    }
    if (_154)
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
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _312 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _252, _308);
    float _322 = fma(_314, _252, _310);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_53.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_106);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _360 + _362;
    float _366 = in.m_55.x;
    float _368 = in.m_55.y;
    float _370 = in.m_55.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _376 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _378 = isnan(_360);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _392 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _394 = isnan(_360);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _404;
    bool _408 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _410 = isnan(_360);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _374;
    float _422 = -_386;
    float _424 = _422 + 1.0;
    bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _428 = _402 * _424;
    float _430 = -_402;
    float _432 = _430 + 1.0;
    float _434 = 1.0 / _390;
    float _436 = _406 * _420;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _442 = fma(_436, _364, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _328 * _368;
    float _446 = _440 * _434;
    float _448 = _442 * _428;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _360 + _454;
    float _458 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[115].x, _448);
    float _460 = _386 * _452;
    float _462 = fma(_446, _456, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = _326 * _366;
    float _468 = fma(_462, _460, _458);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[117].x, _468);
    float _476 = _330 * _370;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _484 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _472;
    out.m_57.y = _484;
    out.m_57.z = _480;
    out.m_57.w = _482;
    bool _486 = !_426;
    float _504;
    if (!_486)
    {
        float _488 = in.m_53.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_106);
        float _510 = 1.0 / _508;
        float _512 = _140 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _524 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _526 = isnan(_514);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _540 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _542 = isnan(_514);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _552;
    bool _556 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _558 = isnan(_514);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = 1.0 / _522;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _576 = _550 * _572;
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = 1.0 / _538;
    float _584 = _554 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _590 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _592 = _588 * _582;
    float _594 = _590 * _576;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _602 = _514 + _600;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[131].x, _594);
    float _606 = _534 * _598;
    float _608 = fma(_592, _602, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _610 = fma(_608, _606, _604);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[133].x, _610);
    float _614 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _614;
    bool _616 = !_574;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_106);
        float _640 = 1.0 / _638;
        float _642 = _140 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_53.x;
    float _648 = _140 * 0.119999997317790985107421875;
    float _650 = in.m_53.y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = in.m_61.x;
    float _662 = 1.0 / _654;
    float _664 = in.m_53.z;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _680 = in.m_46.x;
    float _682 = in.m_46.y;
    float _684 = in.m_46.z;
    float _686 = 1.0 / _668;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _690 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = _646 * 6.283185482025146484375;
    bool _694 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _696 = isnan(_644);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _674;
    float _708 = -_670;
    float _710 = fma(_690, 2.0, _708);
    float _712 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = fma(_648, _660, _692);
    float _716 = -_140;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[76].x, _710);
    float _720 = fma(_712, -2.0, _688);
    float _722 = 1.0 / _678;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _730 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _720);
    float _732 = _682 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _734 = _682 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _740 = _682 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _742 = 1.0 / _726;
    float _744 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[4].x, _732);
    float _746 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[5].x, _734);
    float _748 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[6].x, _740);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _762 = 1.0 / _738;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _768;
    float _772 = _664 * 2.0;
    float _774 = _752 * _706;
    float _776 = _766 * _686;
    float _778 = _650 * 2.0;
    float _780 = _756 * _722;
    float _782 = _646 * 2.0;
    float _784 = _650 + _664;
    float _786 = 1.0 / _760;
    float _788 = _770 * _662;
    float _790 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].z, _744);
    bool _792 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _794 = isnan(_644);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _806 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].z, _748);
    float _808 = floor(_778);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _820 = _644 + _818;
    float _822 = -_802;
    float _824 = _822 + 1.0;
    float _826 = _816 * _762;
    float _828 = floor(_772);
    float _830 = _784 + (-1.0);
    float _832 = _646 + _650;
    float _834 = fma(_776, _820, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _836 = _812 * _742;
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _840 = _832 + (-1.0);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _842;
    float _846 = floor(_782);
    float _848 = _646 + _664;
    float _850 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _852 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _854 = isnan(_644);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _844 * _786;
    float _866 = _848 + (-1.0);
    bool _868 = _808 > 0.0;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _872 = _808 >= 0.0;
    bool _874 = isnan(_808);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _644 + _884;
    bool _888 = _828 > 0.0;
    float _890 = -_704;
    float _892 = _890 + 1.0;
    bool _894 = _828 >= 0.0;
    bool _896 = isnan(_828);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = fma(_788, _886, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _906 = -_862;
    float _908 = _906 + 1.0;
    bool _910 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _912 = isnan(_644);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _924 = log2(_922);
    bool _926 = _846 > 0.0;
    float _928 = _802 * _908;
    bool _930 = _846 >= 0.0;
    bool _932 = isnan(_846);
    bool _934 = _930 || _932;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _942 = _644 + _940;
    bool _944 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _946 = isnan(_644);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _920 * _824;
    float _958 = -_920;
    float _960 = _958 + 1.0;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _964 = _644 + _962;
    bool _966 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = isnan(_644);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = fma(_774, _942, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _980 = _954 * _960;
    float _982 = fma(_780, _964, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _984 = -_954;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _644 + _988;
    bool _992 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _994 = isnan(_644);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_976;
    float _1006 = _1004 + 1.0;
    float _1008 = _976 * _986;
    float _1010 = fma(_836, _990, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1014 = _644 + _1012;
    bool _1016 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1018 = isnan(_644);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _1002 * _1006;
    float _1030 = _990;
    float _1032 = _834;
    float _1034 = _664;
    float _1036 = _730;
    if (_658)
    {
        _1030 = _646;
    }
    float _1038 = _1030;
    float _1040 = fma(_826, _1014, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1044 = _644 + _1042;
    float _1046 = _1038;
    if (!_658)
    {
        _1046 = _664;
    }
    float _1048 = _1046;
    float _1050 = _1026 * _892;
    float _1052 = -_1002;
    float _1054 = _1052 + 1.0;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1058 = fma(_864, _1044, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1062 = _904 * _1050;
    float _1064 = _704 * _1054;
    int _1066 = _902 ? 0 : 1;
    float _1068 = -_1056;
    float _1070 = fma(_1060, 2.0, _1068);
    float _1072 = _1056;
    float _1074 = _1048;
    if (!_658)
    {
        _1072 = _650;
    }
    float _1076 = _1072;
    float _1078 = -_1026;
    float _1080 = _1078 + 1.0;
    float _1082 = _1076;
    if (_658)
    {
        _1082 = _646;
    }
    float _1084 = _1082;
    float _1086 = _790 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_658)
    {
        _1074 = _664;
    }
    float _1088 = _1074;
    float _1090 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1062);
    int _1092 = _938 ? 0 : 1;
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[83].z, _728);
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1098 = ~_1066;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    float _1104 = fma(_834, _1064, _1090);
    int _1106 = _1102;
    float _1108 = _1088;
    if (!_888)
    {
        int _1110 = ~_1066;
        int _1112 = _1110 + 1;
        _1106 = _1112;
    }
    int _1114 = _1106;
    float _1116 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1118 = _880 ? 0 : 1;
    float _1120 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1094);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1132 = _1130 != 0;
    float _1134 = _804 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_658)
    {
        _1108 = _650;
    }
    float _1136 = _1108;
    float _1138 = fma(_140, -0.2199999988079071044921875, _714);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = _1116 + _1140;
    bool _1144 = !_1128;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[83].w, _870);
    bool _1150 = !_1124;
    int _1152 = _1150 ? 0 : 1;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1156 = !_1132;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1148);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1172 = _1170 != 0;
    float _1174 = _1136;
    if (!_658)
    {
        _1174 = _664;
    }
    float _1176 = _1174;
    float _1178 = _1176;
    if (_658)
    {
        _1178 = _650;
    }
    float _1180 = _1178;
    bool _1182 = !_1164;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = ~_1118;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1194 = _1190;
    if (!_868)
    {
        int _1196 = ~_1118;
        int _1198 = _1196 + 1;
        _1194 = _1198;
    }
    int _1200 = _1194;
    float _1202 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1204 = int(_1202);
    int _1206 = abs(_1184);
    float _1208 = fma(_1192, -2.0, _1154);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1086 + _1210;
    float _1214 = float(_1114);
    float _1216 = -_1116;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = float(_1206);
    float _1222 = _924 * _140;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1226 = _1218;
    if (_658)
    {
        _1032 = _650;
    }
    float _1228 = _1032;
    float _1230 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1208);
    float _1232 = _1228;
    if (!_658)
    {
        _1232 = _646;
    }
    float _1234 = _1232;
    float _1236 = -_1224;
    float _1238 = fma(_1096, 2.0, _1236);
    float _1240 = exp2(_1222);
    float _1242 = -_140;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    int _1246 = ~_1092;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    float _1252 = abs(_1212);
    float _1254 = abs(_1218);
    float _1256 = precise::max(_1252, _1254);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1260 = _1250;
    if (!_926)
    {
        int _1262 = ~_1092;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1270 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1272 = isnan(1.0);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1278 = _1274 || _1276;
    float _1280 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1282 = int(_1280);
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1286 = 1.0 + _1284;
    bool _1288 = _1256 >= 16.0;
    float _1290 = fma(_978, _1028, _1104);
    float _1292 = float(_1204);
    float _1294 = fma(_1268, -2.0, _1258);
    float _1296 = _1220 * _1214;
    float _1298 = 1.0 / _1292;
    float _1300 = fma(_982, _1008, _1290);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1314 = _1310 || _1312;
    float _1316 = 1.0 / _1286;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1320 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1302);
    float _1322 = -_1240;
    float _1324 = _1322 + 1.0;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1328 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1304);
    float _1330 = float(_1282);
    float _1332 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1318);
    float _1334 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1320);
    float _1336 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1326);
    float _1338 = _1314 ? _1324 : 0.0;
    float _1340 = _1296 * (-2.0);
    float _1342 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1332);
    float _1344 = -_140;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1070);
    bool _1348 = !_1172;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -_660;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[193].y, _140);
    float _1356 = _1330 * _140;
    float _1358 = _1298 * _140;
    float _1360 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1328);
    float _1362 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1336);
    float _1364 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1294);
    float _1366 = _646 + (-0.5);
    bool _1368 = _1278;
    if (_1278)
    {
        float _1370 = _1338 * _1316;
        _144 = _1370;
    }
    float _1372 = _144;
    float _1374 = fma(_850, _1340, _850);
    bool _1376 = !_1168;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1382 = _1134 + _1380;
    int _1384 = abs(_1350);
    float _1386 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1388 = _1138 * 0.15915493667125701904296875;
    int _1390 = abs(_1378);
    float _1392 = _1382 * _1382;
    float _1394 = float(_1384);
    float _1396 = _1212 * 0.0625;
    float _1398 = float(_1200);
    float _1400 = fma(_1212, _1212, _1392);
    float _1402 = fma(_1374, _1372, _1386);
    if (_1288)
    {
        float _1404 = _1218 * 0.0625;
        _1226 = _1404;
    }
    float _1406 = _1226;
    float _1408 = _1394 * _1398;
    float _1410 = fma(_1142, _1142, _1400);
    float _1412 = float(_1266);
    float _1414 = _664 + (-0.5);
    float _1416 = _1408 * (-2.0);
    float _1418 = float(_1390);
    float _1420 = rsqrt(_1410);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1424 = fma(_882, _1416, _882);
    float _1426 = _1288 ? _1396 : _1212;
    float _1428 = _1418 * _1412;
    float _1430 = in.m_63.x;
    float _1432 = in.m_63.y;
    float _1434 = fma(_1424, _1372, _1422);
    float _1436 = abs(_1426);
    bool _1438 = _1436 != 0.0;
    bool _1440 = isnan(_1436);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(0.0);
    bool _1446 = _1442 || _1444;
    float _1448 = _1402 * 0.15915493667125701904296875;
    float _1450 = abs(_1406);
    bool _1452 = _1450 == 0.0;
    float _1454 = _1434 * 0.15915493667125701904296875;
    float _1456 = abs(_1406);
    bool _1458 = _1456 == 0.0;
    bool _1460 = !_1446;
    bool _1462 = _1458 && _1460;
    float _1464 = _1428 * (-2.0);
    float _1466 = _1388 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1010, _980, _1300);
    float _1472 = _1382 * _1420;
    float _1474 = _1212 * _1420;
    float _1476 = fma(_838, _1464, _838);
    float _1478 = _650 + (-0.5);
    float _1480 = -_1472;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1382);
    float _1484 = -_1474;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1488 = _1448 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    float _1492 = _1142 * _1420;
    float _1494 = _1482 * _1482;
    int _1496 = as_type<int>(_1486);
    int _1498 = as_type<int>(_1476);
    float _1500 = _1474;
    if (_1462)
    {
        bool _1502 = as_type<int>(_1406) >= 0;
        _1368 = _1502;
    }
    bool _1504 = _1368;
    float _1506 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1508 = -_1492;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1512 = fma(_1486, _1486, _1494);
    int _1514 = _1504 ? (-1) : 0;
    if (_1462)
    {
        int _1516 = _1504 ? 0 : 1078530011;
        _1496 = _1516;
    }
    int _1518 = _1496;
    float _1520 = _1448 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = fma(_1476, _1372, _1506);
    float _1526 = fma(_1510, _1510, _1512);
    if (_1462)
    {
        int _1528 = int(0x80000000) & as_type<int>(_1426);
        int _1530 = _1518 | _1528;
        _1498 = _1530;
    }
    int _1532 = _1498;
    float _1534 = _1454 * 6.283185482025146484375;
    float _1536 = cos(_1534);
    bool _1538 = !_1446;
    bool _1540 = _1538 && _1452;
    int _1542 = _1532;
    float _1544 = as_type<float>(_1532);
    if (!_1540)
    {
        float _1546 = abs(_1426);
        bool _1548 = _1546 != as_type<float>(0x7f800000u /* inf */);
        bool _1550 = isnan(_1546);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1556 = _1552 || _1554;
        float _1558 = abs(_1406);
        bool _1560 = _1558 == as_type<float>(0x7f800000u /* inf */);
        float _1562 = abs(_1406);
        bool _1564 = _1562 == as_type<float>(0x7f800000u /* inf */);
        bool _1566 = !_1556;
        bool _1568 = _1564 && _1566;
        if (_1568)
        {
            bool _1570 = as_type<int>(_1406) >= 0;
            _1514 = _1570 ? (-1) : 0;
        }
        int _1572 = _1514;
        if (_1568)
        {
            _1542 = 1075235812;
        }
        int _1574 = _1542;
        int _1576 = _1574;
        if (_1568)
        {
            int _1578 = ~_1572;
            int _1580 = (_1578 != 0) ? _1574 : 1061752795;
            _1576 = _1580;
        }
        int _1582 = _1576;
        float _1584 = as_type<float>(_1582);
        if (_1568)
        {
            int _1586 = int(0x80000000) & as_type<int>(_1426);
            int _1588 = _1582 | _1586;
            _1584 = as_type<float>(_1588);
        }
        float _1590 = _1584;
        bool _1592 = !_1556;
        bool _1594 = _1592 && _1560;
        _1544 = _1590;
        if (!_1594)
        {
            float _1596 = abs(_1406);
            float _1598 = abs(_1426);
            float _1600 = precise::max(_1596, _1598);
            float _1602 = abs(_1406);
            float _1604 = abs(_1426);
            float _1606 = precise::min(_1602, _1604);
            float _1608 = 1.0 / _1600;
            float _1610 = abs(_1426);
            float _1612 = abs(_1406);
            bool _1614 = _1610 > _1612;
            bool _1616 = as_type<int>(_1406) >= 0;
            float _1618 = _1606 * _1608;
            float _1620 = _1618 * _1618;
            float _1622 = _1620 + 11.33538818359375;
            float _1624 = fma(_1620, _1622, 28.84246826171875);
            float _1626 = fma(_1620, _1624, 19.6966705322265625);
            float _1628 = fma(_1620, -0.82336294651031494140625, -5.674867153167724609375);
            float _1630 = fma(_1620, _1628, -6.565555095672607421875);
            float _1632 = 1.0 / _1626;
            float _1634 = _1620 * _1630;
            float _1636 = abs(_1406);
            float _1638 = abs(_1426);
            float _1640 = _1636 + _1638;
            int _1642 = as_type<int>(_1426) & int(0x80000000);
            float _1644 = _1618 * _1634;
            bool _1646 = _1640 > as_type<float>(0x7f800000u /* inf */);
            bool _1648 = isnan(_1640);
            bool _1650 = _1646 || _1648;
            bool _1652 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1654 = _1650 || _1652;
            float _1656 = fma(_1644, _1632, _1618);
            float _1658 = _1656;
            _1544 = _1640;
            if (_1614)
            {
                float _1660 = -_1656;
                float _1662 = _1660 + 1.57079637050628662109375;
                _1658 = _1662;
            }
            float _1664 = _1658;
            int _1666 = as_type<int>(_1664);
            if (!_1616)
            {
                float _1668 = -_1664;
                float _1670 = _1668 + 3.1415927410125732421875;
                _1666 = as_type<int>(_1670);
            }
            int _1672 = _1666;
            if (!_1654)
            {
                int _1674 = _1642 | _1672;
                _1544 = as_type<float>(_1674);
            }
        }
    }
    float _1676 = _1544;
    float _1678 = fma(_1040, _956, _1470);
    float _1680 = sqrt(_1526);
    float _1682 = precise::max(0.0, _1354);
    float _1684 = in.m_63.z;
    float _1686 = fma(_1058, _928, _1678);
    float _1688 = -_1676;
    float _1690 = _1524 + _1688;
    float _1692 = precise::min(_1682, 1000.0);
    float _1694 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1696 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1686);
    float _1698 = _1690 * 0.15915493667125701904296875;
    float _1700 = _1454 * 6.283185482025146484375;
    float _1702 = sin(_1700);
    float _1704 = _1692 * 0.100000001490116119384765625;
    float _1706 = _1696 * _1468;
    float _1708 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1710 = _1704 * _1704;
    float _1712 = fma(_1706, _660, _1430);
    float _1714 = _1420 * _1680;
    float _1716 = _1698 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = -_1710;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1432);
    float _1724 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1726 = _1714 * _1694;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1712);
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1722);
    float _1732 = _1714 * _1724;
    float _1734 = _1714 * _1708;
    float _1736 = _1698 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1726 * _1728;
    float _1742 = _1732 * _1730;
    float _1744 = _1490 * _1536;
    float _1746 = _1744 * _1742;
    float _1748 = _1522 * _1718;
    float _1750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1684);
    float _1752 = _1734 * _1750;
    float _1754 = _1490 * _1718;
    float _1756 = -_1742;
    float _1758 = _1702 * _1756;
    float _1760 = _1490 * _1738;
    float _1762 = _1522 * _1738;
    float _1764 = _1738 * _1536;
    float _1766 = _1718 * _1536;
    float _1768 = -_1748;
    float _1770 = fma(_1702, _1760, _1768);
    float _1772 = fma(_1702, _1754, _1762);
    float _1774 = _1522 * _1536;
    float _1776 = fma(_1702, _1762, _1754);
    float _1778 = fma(_1770, _1740, _1746);
    float _1780 = fma(_1764, _1740, _1758);
    float _1782 = _1774 * _1742;
    float _1784 = -_1760;
    float _1786 = fma(_1702, _1748, _1784);
    float _1788 = fma(_1772, _1752, _1778);
    float _1790 = fma(_1766, _1752, _1780);
    float _1792 = fma(_1776, _1740, _1782);
    float _1794 = _1116 + _1788;
    float _1796 = _1086 + _1790;
    float _1798 = fma(_1786, _1752, _1792);
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1802 = _1794 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1806 = _1796 + _1804;
    float _1808 = _1134 + _1798;
    float _1810 = _1802 * _1802;
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = sqrt(_1812);
    bool _1816 = _1814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1818 = _1798;
    float _1820 = _1754;
    float _1822 = _1740;
    float _1824 = _1748;
    float _1826 = _1808;
    float _1828 = _1752;
    if (!_1816)
    {
        _1818 = _1796;
    }
    float _1830 = _1818;
    float _1832 = _1830;
    if (!_1816)
    {
        _1820 = _1794;
    }
    float _1834 = _1820;
    float _1836 = _1834;
    if (!_1816)
    {
        _1822 = _1808;
    }
    float _1838 = _1822;
    bool _1840 = !_1816;
    float _1842 = _1838;
    if (!_1840)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1848 = _1814 + _1846;
        float _1850 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = rsqrt(_1812);
        float _1854 = _1848 * _1844;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = _1856 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = fma(_1860, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1868 = _1852 * _1866;
        float _1870 = _1864 + (-1.0);
        float _1872 = fma(_1806, _1868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1874 = fma(_1802, _1868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1876 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1878 = fma(_1808, _1864, _1876);
        _1842 = _1878;
        _1832 = _1872;
        _1836 = _1874;
        _1824 = _1856;
    }
    float _1880 = _1842;
    float _1882 = _1832;
    float _1884 = _1836;
    float _1886 = _1824;
    float _1888 = -_1472;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1880);
    float _1892 = -_1474;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1882);
    float _1896 = -_1492;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1884);
    float _1900 = -_1474;
    float _1902 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1906 = _1890 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1910 = _1894 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1914 = _1898 + _1912;
    float _1916 = -_1492;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1920 = _1906 * _1906;
    float _1922 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1924 = fma(_1910, _1910, _1920);
    float _1926 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1922);
    float _1928 = fma(_1914, _1914, _1924);
    float _1930 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1932 = rsqrt(_1928);
    float _1934 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1936 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1938 = _1910 * _1936;
    float _1940 = _1914 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 * _1940;
    float _1946 = _1942 + _1944;
    float _1948 = sqrt(_1946);
    bool _1950 = _1948 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1954 = _1948 + _1952;
    float _1956 = _1886;
    float _1958 = _1954;
    float _1960 = _1906;
    float _1962 = _1938;
    float _1964 = _1940;
    float _1966 = _1942;
    if (_1950)
    {
        float _1968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _1968;
    }
    float _1970 = _1956;
    if (_1950)
    {
        float _1972 = rsqrt(_1946);
        _1826 = _1972;
    }
    float _1974 = _1826;
    float _1976 = _1974;
    if (_1950)
    {
        float _1978 = _1954 * _1970;
        _1958 = _1978;
    }
    float _1980 = _1958;
    float _1982 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1950)
    {
        float _1984 = _1980 * 0.15915493667125701904296875;
        _1828 = _1984;
    }
    float _1986 = _1828;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = _1882;
    float _1992 = _1986;
    if (_1950)
    {
        float _1994 = _1986 * 6.283185482025146484375;
        float _1996 = sin(_1994);
        _1990 = _1996;
    }
    float _1998 = _1990;
    float _2000 = precise::max(0.0, _1988);
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1950)
    {
        float _2004 = _1986 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        _2002 = _2006;
    }
    float _2008 = _2002;
    float _2010 = -_1936;
    float _2012 = -_2000;
    float _2014 = fma(_1906, _2010, _2012);
    if (_1950)
    {
        float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1960 = _2016;
    }
    float _2018 = _1960;
    float _2020 = _1998;
    if (_1950)
    {
        float _2022 = fma(_1998, _2018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2028 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _2030 = _2024;
    if (_1950)
    {
        float _2032 = _1974 * _2024;
        _1500 = _2032;
    }
    float _2034 = _1500;
    if (!_1950)
    {
        _2030 = _2014;
    }
    float _2036 = _2030;
    float _2038 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2040 = _2036;
    float _2042 = _2008;
    if (_1950)
    {
        float _2044 = _2008 + (-1.0);
        _1976 = _2044;
    }
    float _2046 = _1976;
    if (_1950)
    {
        float _2048 = _1938 * _2034;
        _1962 = _2048;
    }
    float _2050 = _1962;
    if (_1950)
    {
        float _2052 = _1940 * _2034;
        _1964 = _2052;
    }
    float _2054 = _1964;
    float _2056 = floor(_2026);
    if (_1950)
    {
        float _2058 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2058;
    }
    float _2060 = _1992;
    if (_1950)
    {
        float _2062 = _2050 * _2050;
        _1966 = _2062;
    }
    float _2064 = _1966;
    if (_1950)
    {
        float _2066 = fma(_2014, _2008, _2060);
        _2040 = _2066;
    }
    float _2068 = _2040;
    if (!_1950)
    {
        _2042 = _1944;
    }
    float _2070 = _2042;
    float _2072 = _2070;
    if (_1950)
    {
        float _2074 = _2054 * _2054;
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = fma(_2068, _2068, _2064);
    float _2080 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2082 = sqrt(_1928);
    float _2084 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2086 = _2078 + _2076;
    float _2088 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2090 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2084);
    float _2092 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = floor(_2080);
    float _2096 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2090);
    float _2100 = -_2092;
    float _2102 = fma(_2100, _2088, 1.0);
    float _2104 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2106 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2108 = rsqrt(_2086);
    float _2110 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2104);
    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2114 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2112);
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2120 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2122 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2124 = -_2116;
    float _2126 = _2124 + 1.0;
    float _2128 = log2(_2102);
    float _2130 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2118);
    float _2132 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = -_2094;
    float _2136 = _2080 + _2134;
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2120);
    float _2140 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2130);
    float _2142 = abs(_2126);
    float _2144 = log2(_2142);
    float _2146 = _2108 * _2050;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2140);
    float _2150 = _2108 * _2068;
    float _2152 = _2108 * _2054;
    float _2154 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2156 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2138);
    float _2158 = 1.0 / _2148;
    float _2160 = -_2154;
    float _2162 = fma(_2150, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2160);
    float _2164 = -_2056;
    float _2166 = _2026 + _2164;
    float _2168 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2170 = _2128 * 0.693147182464599609375;
    float _2172 = -_2152;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2162);
    float _2176 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2168);
    float _2178 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2180 = fma(_2174, -0.5, 0.5);
    float _2182 = fma(_2174, 0.5, 0.5);
    float _2184 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2176);
    float _2186 = _2150 + 1.0;
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2156);
    float _2190 = exp2(_2178);
    float _2192 = fma(_2182, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2194 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2184);
    float _2196 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = fma(_2182, _2192, -0.212114393711090087890625);
    float _2200 = _2194 * _2158;
    float _2202 = _2188 * _2158;
    float _2204 = sqrt(_2180);
    float _2206 = fma(_2182, _2198, 1.570728778839111328125);
    float _2208 = fma(_2202, -0.5, 0.5);
    float _2210 = -_2150;
    float _2212 = fma(_2190, _2186, _2210);
    float2 _6766 = float2(_2166, _2136);
    float _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6766, float2(0.0), isnan(_6766)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6766, float2(0.0), isnan(_6766)), level(0.0)).x;
    float _2216 = fma(_2212, 0.5, 0.5);
    float _2218 = _2204 * 0.636619746685028076171875;
    float _2220 = fma(_2200, 0.5, 0.5);
    float _2222 = -_2206;
    float _2224 = fma(_2218, _2222, 1.0);
    float3 _6789 = float3(_2220, _2208, _2196);
    float _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6789, float3(0.0), isnan(_6789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6789, float3(0.0), isnan(_6789)), level(0.0)).x;
    float3 _6800 = float3(_2220, _2208, _2196);
    float4 _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6800, float3(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6800, float3(0.0), isnan(_6800)), level(0.0)).xyzw;
    float _2231 = _2229.x;
    float _2233 = _2229.y;
    float _2235 = _2229.z;
    float _2237 = _2229.w;
    float2 _6816 = float2(_2224, _2216);
    float3 _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6816, float2(0.0), isnan(_6816)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6816, float2(0.0), isnan(_6816)), level(0.0)).xyz;
    float _2243 = _2241.x;
    float _2245 = _2241.y;
    float _2247 = _2241.z;
    float _2249 = float(uint(_1282));
    float _2251 = trunc(_1358);
    int _2253 = int(_2251);
    float _2255 = float(_106);
    float _2257 = -_1472;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1134);
    int _2261 = ~_1282;
    int _2263 = _2261 + 1;
    float _2265 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2267 = abs(_1146);
    float _2269 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2271 = ~_1282;
    int _2273 = _2271 + 1;
    float _2275 = 1.0 / _2249;
    int _2277 = abs(_1152);
    float _2279 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2281 = abs(_1158);
    bool _2283 = _650 > 0.5;
    float _2285 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    int _2287 = ~_1282;
    int _2289 = _2287 + 1;
    float _2291 = 1.0 / _2255;
    float _2293 = float(uint(_2253));
    float _2295 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2285);
    float _2297 = float(_2253);
    bool _2299 = !_658;
    float _2301 = _2299 ? 5.839270114898681640625 : 1.0;
    float _2303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2305 = as_type<int>(_2275) + (-2);
    float _2307 = as_type<float>(_2305) * _2293;
    float _2309 = _1356 * _2291;
    float _2311 = exp2(_2265);
    float _2313 = trunc(_2307);
    float _2315 = precise::max(_2313, 0.0);
    uint _2318 = uint(_2315);
    float _2320 = trunc(_2309);
    int _2322 = int(_2320);
    float _2324 = -_2311;
    float _2326 = _2324 + 1.0;
    int _2328 = _2263 * int(_2318);
    int _2330 = _2328 + _2253;
    int _2332 = _1282 + (-1);
    float _2334 = float(uint(_2330));
    float _2336 = as_type<float>(_2305) * _2334;
    bool _2338 = !_658;
    float _2340 = _2338 ? _664 : _646;
    float _2342 = trunc(_2336);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = _2340 * _2301;
    float _2350 = floor(_2348);
    int _2352 = int(_2318) + int(_2346);
    bool _2354 = _2297 >= _1330;
    bool _2356 = isnan(_2297);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(_1330);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    int _2366 = _2273 * _2352;
    int _2368 = _2366 + _2253;
    float _2370 = trunc(_2364);
    int _2372 = int(_2370);
    float _2374 = -_2350;
    float _2376 = _2348 + _2374;
    bool _2378 = uint(_2368) >= uint(_1282);
    float _2380 = _2376 * _1330;
    bool _2382 = !_2378;
    int _2384 = _2382 ? 0 : (-1);
    bool _2386 = _1282 == 0;
    int _2388 = ~_2352;
    int _2390 = _2388 + _2384;
    int _2392 = _2390 + 1;
    float _2394 = trunc(_2380);
    int _2396 = int(_2394);
    int _2398 = _1282 * _2392;
    int _2400 = _2398 + _2253;
    int _2402 = ~_2372;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2410 = _2408 != 0;
    bool _2412 = !_2386;
    int _2414 = _2412 ? _2400 : (-1);
    bool _2416 = !_2410;
    int _2418 = _2416 ? 0 : 1;
    int _2420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2422 = _2420 != 0;
    int _2424 = _2414 * _2406;
    int _2426 = abs(_2418);
    int _2428 = ~_1282;
    int _2430 = _2428 + 1;
    int _2432 = _2372 * _2332;
    int _2434 = _2432 + _2424;
    bool _2436 = !_2422;
    int _2438 = _2436 ? 0 : 1;
    int _2440 = _2396 * _2426;
    int _2442 = _2440 + _2253;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2446 = _2444 != 0;
    int _2448 = _2434 * _2267;
    int _2450 = abs(_2438);
    float _2452 = in.m_65.y;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2456 = _2454 != 0;
    int _2458 = _2322 * _2277;
    int _2460 = _2458 + _2448;
    bool _2462 = _664 > 0.5;
    float _2464 = in.m_53.w;
    int _2466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2468 = _2466 != 0;
    int _2470 = _2442 * _2281;
    int _2472 = _2470 + _2460;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2476 = _2474 != 0;
    int _2478 = _2396 * _2450;
    int _2480 = _2478 + _2472;
    float _2482 = in.m_65.x;
    float _2484 = float(uint(_2480));
    float _2486 = in.m_61.w;
    float _2488 = as_type<float>(_2305) * _2484;
    float _2490 = trunc(_2488);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    float _2496 = -_2452;
    float _2498 = _2496 + 1.0;
    int _2500 = _2283 ? as_type<int>(_2498) : as_type<int>(_2452);
    int _2502 = _2462 ? as_type<int>(_2498) : as_type<int>(_2452);
    float _2504 = _2446 ? as_type<float>(_2500) : _2452;
    bool _2506 = _2464 > 0.5;
    float _2508 = _2476 ? as_type<float>(_2502) : _2452;
    int _2510 = _2430 * int(_2494);
    int _2512 = _2510 + _2480;
    bool _2514 = _2476;
    float _2516 = _2452;
    float _2518 = _2148;
    if (_2456)
    {
        bool _2520 = _646 > 0.5;
        _2514 = _2520;
    }
    bool _2522 = _2514;
    out.m_67.w = _2486;
    if (!_2456)
    {
        _1034 = _2482;
    }
    float _2524 = _1034;
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2528 = float(uint(_2512));
    float _2530 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    int _2532 = as_type<int>(_2528);
    float _2534 = _2524;
    if (_2468)
    {
        float _2536 = _2506 ? _2498 : _2452;
        _2516 = _2536;
    }
    float _2538 = _2516;
    int _2540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2542 = _2540 != 0;
    float _2544 = as_type<float>(_2305) * _2528;
    if (_2456)
    {
        float _2546 = -_2482;
        float _2548 = _2546 + 1.0;
        _2532 = as_type<int>(_2548);
    }
    int _2550 = _2532;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2554 = _2552 != 0;
    float _2556 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2558 = trunc(_2544);
    float _2560 = precise::max(_2558, 0.0);
    uint _2562 = uint(_2560);
    float _2564 = -_1364;
    float _2566 = fma(_1362, _2530, _2564);
    if (_2456)
    {
        float _2568 = _2522 ? as_type<float>(_2550) : _2482;
        _2534 = _2568;
    }
    float _2570 = _2534;
    float _2572 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2576 = _2574 != 0;
    float _2578 = _2566 + 0.5;
    float _2580 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2572);
    float _2582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2584 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2556);
    float _2586 = float(uint(_2442));
    float _2588 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2580);
    int _2590 = ~_1282;
    int _2592 = _2590 + 1;
    float _2594 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2584);
    float _2596 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2598 = int(_2494) + int(_2562);
    float _2600 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2602 = _2594 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2604 = as_type<float>(_2305) * _2586;
    float _2606 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _2608 = _2289 * _2598;
    int _2610 = _2608 + _2480;
    float _2612 = fma(_2600, _2504, -0.5);
    float _2614 = _2602 + _2596;
    float _2616 = trunc(_2604);
    float _2618 = precise::max(_2616, 0.0);
    uint _2620 = uint(_2618);
    bool _2622 = uint(_2610) >= uint(_1282);
    float _2624 = _2582 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2626 = -_730;
    float _2628 = fma(_1334, _2612, _2626);
    float _2630 = _2624;
    int _2632 = _2598;
    if (!_2554)
    {
        _1036 = _2482;
    }
    float _2634 = _1036;
    bool _2636 = !_2622;
    int _2638 = _2636 ? 0 : (-1);
    float _2640 = 1.0 / _2596;
    float _2642 = fma(_2624, _2538, -0.5);
    float _2644 = _2634;
    if (!_2542)
    {
        _2630 = _2482;
    }
    float _2646 = _2630;
    int _2648 = ~_2598;
    int _2650 = _2648 + _2638;
    int _2652 = _2650 + 1;
    float _2654 = _2646;
    if (_2542)
    {
        float _2656 = -_2482;
        float _2658 = _2656 + 1.0;
        _2632 = as_type<int>(_2658);
    }
    int _2660 = _2632;
    float _2662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2664 = _1282 * _2652;
    int _2666 = _2664 + _2480;
    int _2668 = _2660;
    if (_2542)
    {
        float _2670 = _2462 ? as_type<float>(_2660) : _2482;
        _2654 = _2670;
    }
    float _2672 = _2654;
    if (_2554)
    {
        float _2674 = -_2482;
        float _2676 = _2674 + 1.0;
        _2668 = as_type<int>(_2676);
    }
    int _2678 = _2668;
    int _2680 = _2592 * int(_2620);
    int _2682 = _2680 + _2442;
    bool _2684 = !_2386;
    int _2686 = _2684 ? _2666 : (-1);
    if (_2554)
    {
        float _2688 = _2283 ? as_type<float>(_2678) : _2482;
        _2644 = _2688;
    }
    float _2690 = _2644;
    float _2692 = _2614 * _2640;
    float _2694 = _2692 * 0.5;
    int _2696 = _2686 >> 31;
    float _2698 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2700 = float(uint(_2682));
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2704 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2702);
    int _2706 = _2696 & 3;
    float _2708 = fma(_2698, _2570, -0.5);
    float _2710 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2712 = 1.0 / _2704;
    int _2714 = _2686 + _2706;
    float _2716 = fma(_1342, _2708, _718);
    float _2718 = fma(_2710, _2672, -0.5);
    float _2720 = -_1230;
    float _2722 = fma(_1160, _2642, _2720);
    int _2724 = _2714 >> 2;
    float _2726 = _2628 + 0.5;
    float _2728 = fma(_1120, _2718, _1244);
    float _2730 = fma(_2690, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _2732 = _2724 << 4;
    int _2734 = _2732 + 656;
    float _2736 = as_type<float>(_2305) * _2700;
    float _2738 = _2716 + 0.5;
    float _2740 = _2728 + 0.5;
    uint _2742 = uint(int(uint(_2734) >> uint(2)));
    uint _2744 = uint(int(uint(int(_2742)) >> uint(2)));
    int _2746 = int(_2742) & 3;
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[int(_2744)][_2746];
    int _2750 = int(_2742) + 1;
    uint _2752 = uint(int(uint(_2750) >> uint(2)));
    int _2754 = _2750 & 3;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[int(_2752)][_2754];
    float _2758 = trunc(_2736);
    float _2760 = precise::max(_2758, 0.0);
    uint _2762 = uint(_2760);
    float _2764 = fma(_1360, _2730, _1346);
    float _2766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2768 = _2712 * _2766;
    float _2770 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2772 = _2686 & 3;
    bool _2774 = _2772 != 0;
    float _2776 = _2722 + 0.5;
    int _2778 = ~_1282;
    int _2780 = _2778 + 1;
    int _2782 = _2734 + 8;
    uint _2784 = uint(int(uint(_2782) >> uint(2)));
    uint _2786 = uint(int(uint(int(_2784)) >> uint(2)));
    int _2788 = int(_2784) & 3;
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[int(_2786)][_2788];
    int _2792 = int(_2784) + 1;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    int _2796 = _2792 & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    float _2800 = abs(_2768);
    float _2802 = log2(_2800);
    bool _2804 = uint(_2772) > 1u;
    out.m_69.x = _2738;
    out.m_69.y = _2726;
    out.m_69.z = _2740;
    out.m_69.w = _2776;
    int _2806 = _2686 & 3;
    bool _2808 = _2806 != 0;
    float _2810 = _2764 + 0.5;
    float _2812 = _1744 * _2770;
    float _2814 = -_2770;
    float _2816 = _1702 * _2814;
    float _2818 = _1774 * _2770;
    int _2820 = int(_2620) + int(_2762);
    out.m_71.x = _2810;
    out.m_71.y = _2578;
    bool _2822 = _2768 <= 8000.0;
    bool _2824 = isnan(_2768);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan(8000.0);
    bool _2830 = _2826 || _2828;
    float _2832 = float(_2830);
    float _2834 = fma(_1770, _2269, _2812);
    int _2836 = _2780 * _2820;
    int _2838 = _2836 + _2442;
    int _2840 = _2808 ? 0 : 1;
    float _2842 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2844 = uint(_2838) >= uint(_1282);
    float _2846 = -_2214;
    float _2848 = _2846 + 1.0;
    int _2850 = ~_2840;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = fma(_1764, _2269, _2816);
    int _2858 = _2854;
    if (!_2804)
    {
        int _2860 = ~_2840;
        int _2862 = _2860 + 1;
        _2858 = _2862;
    }
    int _2864 = _2858;
    float _2866 = exp2(_2842);
    bool _2868 = _2772 != 3;
    float _2870 = fma(_1766, _2606, _2856);
    bool _2872 = !_2844;
    int _2874 = _2872 ? 0 : (-1);
    bool _2876 = uint(_2772) >= 2u;
    int _2878 = ~_2820;
    int _2880 = _2878 + _2874;
    int _2882 = _2880 + 1;
    int _2884 = abs(_2864);
    bool _2886 = !_2774;
    int _2888 = _2886 ? 0 : 1;
    int _2890 = _1282 * _2882;
    int _2892 = _2890 + _2442;
    int _2894 = _2876 ? 0 : 1;
    int _2896 = ~_2884;
    int _2898 = _2896 + 1;
    int _2900 = _2898 + 1;
    int _2902 = abs(_2888);
    int _2904 = _2900 * as_type<int>(_2756);
    int _2906 = ~_2894;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    float _2912 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    bool _2916 = _2772 != 3;
    int _2918 = _2910;
    if (_2868)
    {
        int _2920 = ~_2894;
        int _2922 = _2920 + 1;
        _2918 = _2922;
    }
    int _2924 = _2918;
    bool _2926 = !_2916;
    int _2928 = _2926 ? 0 : (-1);
    int _2930 = abs(_2924);
    int _2932 = ~_2902;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    bool _2938 = !_2576;
    int _2940 = _2938 ? 0 : 1;
    int _2942 = abs(_2928);
    int _2944 = _2936 * as_type<int>(_2748);
    int _2946 = _2944 + _2904;
    int _2948 = abs(_2940);
    float _2950 = fma(_2914, -2.0, 3.0);
    int _2952 = ~_2930;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    float _2958 = _2914 * _2914;
    float _2960 = fma(_1776, _2269, _2818);
    int _2962 = ~_2942;
    int _2964 = _2962 + 1;
    int _2966 = _2964 + 1;
    int _2968 = _2956 * as_type<int>(_2790);
    int _2970 = _2968 + _2946;
    float _2972 = _2958 * _2950;
    int _2974 = ~_2948;
    int _2976 = _2974 + 1;
    int _2978 = _2976 + 1;
    float _2980 = _2148 * 0.5;
    int _2982 = _2966 * as_type<int>(_2798);
    int _2984 = _2982 + _2970;
    bool _2986 = !_2386;
    int _2988 = _2986 ? _2892 : (-1);
    float _2990 = -_2972;
    float _2992 = _2990 + 1.0;
    float _2994 = in.m_73.x;
    int _2996 = _2984 * _2978;
    float _2998 = _2194 + _2148;
    float _3000 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2972);
    float _3002 = fma(_2188, -0.5, _2980);
    int _3004 = _2988 * _2948;
    int _3006 = _3004 + _2996;
    float _3008 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2295);
    float _3010 = _2832 * _3000;
    float _3012 = fma(_1786, _2606, _2960);
    bool _3014 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3016 = isnan(_2082);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3022 = _3018 || _3020;
    float _3024 = _3008 + _2148;
    float _3026 = float(_3006);
    float _3028 = fma(_1772, _2606, _2834);
    float _3030 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3032 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2194;
    out.gl_Position.y = _2188;
    out.gl_Position.z = _3008;
    out.gl_Position.w = _2148;
    float _3034 = _2848 * _3030;
    float _3036 = precise::clamp(_3034, 0.0, 1.0);
    float _3038 = _3032 * _2226;
    out.m_75.z = _3026;
    float _3040 = -_3036;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3044 = _3024 * 0.5;
    float _3046 = _2247 * _3038;
    out.m_77.x = _2870;
    out.m_77.y = _3012;
    out.m_77.z = _3028;
    float _3048 = _3042 * _2994;
    float _3050 = _2998 * 0.5;
    float _3052 = fma(_2237, _3046, _2235);
    float _3054 = _3048 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3056 = _2237 * _3038;
    float _3058 = -_3032;
    float _3060 = _3058 + 1.0;
    out.m_79.x = _3050;
    out.m_79.y = _3002;
    out.m_79.z = _3044;
    out.m_79.w = _2148;
    float _3062 = _3008;
    float _3064 = _3056;
    float _3066 = _3060;
    float _3068 = _3002;
    float _3070 = _3050;
    if (!_3022)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3072 = _2518;
    float _3074 = fma(_2243, _3056, _2231);
    float _3076 = fma(_2245, _3056, _2233);
    float _3078 = _2237 * _3060;
    out.m_81.x = _3054;
    float _3080 = _3072;
    float _3082 = _3072;
    if (!_3022)
    {
        _3062 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3084 = _3062;
    float _3086 = _3084;
    float _3088 = _3084;
    if (!_3022)
    {
        _3064 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3090 = _3064;
    out.m_83.x = _3074;
    out.m_83.y = _3076;
    out.m_83.z = _3052;
    out.m_83.w = _3078;
    float _3092 = _3090;
    float _3094 = _3090;
    if (!_3022)
    {
        _3066 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3096 = _3066;
    float _3098 = _3096;
    float _3100 = _3096;
    if (!_3022)
    {
        _3068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3102 = _3068;
    float _3104 = _3102;
    float _3106 = _3102;
    if (!_3022)
    {
        _3070 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3108 = _3070;
    bool _3110 = !_3022;
    float _3112 = _3108;
    float _3114 = _3108;
    if (!_3110)
    {
        bool _3116 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3118 = isnan(_2082);
        bool _3120 = _3116 || _3118;
        bool _3122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3124 = _3120 || _3122;
        if (!_3124)
        {
            float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3128 = _2082 + _3126;
            float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3132 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3130;
            float _3134 = 1.0 / _3132;
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3156 = _3128 * _3134;
            float _3158 = precise::clamp(_3156, 0.0, 1.0);
            float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3164 = fma(_3158, _3138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3166 = fma(_3158, _3162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3168 = fma(_3158, _3142, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3170 = fma(_3158, _3146, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3172 = fma(_3158, _3150, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3174 = fma(_3158, _3154, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3114 = _3166;
            _3094 = _3172;
            _3106 = _3164;
            _3088 = _3170;
            _3082 = _3168;
            _3100 = _3174;
            _3176 = true;
        }
        else
        {
            bool _3178 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3180 = isnan(_2082);
            bool _3182 = _3178 || _3180;
            bool _3184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3186 = _3182 || _3184;
            if (!_3186)
            {
                _3104 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3188 = _3104;
            _3106 = _3188;
            if (!_3186)
            {
                _3112 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3190 = _3112;
            _3114 = _3190;
            if (!_3186)
            {
                _3080 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3192 = _3080;
            _3082 = _3192;
            if (!_3186)
            {
                _3086 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3194 = _3086;
            _3088 = _3194;
            if (!_3186)
            {
                _3092 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3196 = _3092;
            _3094 = _3196;
            if (!_3186)
            {
                _3098 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3198 = _3098;
            bool _3200 = !_3186;
            _3100 = _3198;
            if (!_3200)
            {
                bool _3202 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3204 = isnan(_2082);
                bool _3206 = _3202 || _3204;
                bool _3208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3210 = _3206 || _3208;
                if (!_3210)
                {
                    float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3214 = _2082 + _3212;
                    float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3216;
                    float _3220 = 1.0 / _3218;
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3242 = _3214 * _3220;
                    float _3244 = precise::clamp(_3242, 0.0, 1.0);
                    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3250 = fma(_3244, _3224, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3252 = fma(_3244, _3248, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3254 = fma(_3244, _3228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3256 = fma(_3244, _3232, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3258 = fma(_3244, _3236, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3260 = fma(_3244, _3240, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3114 = _3252;
                    _3094 = _3258;
                    _3106 = _3250;
                    _3088 = _3256;
                    _3082 = _3254;
                    _3100 = _3260;
                    _3176 = true;
                }
                else
                {
                    _3114 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3094 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3106 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3088 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3082 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3100 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3176 = false;
    float _3262 = _3114;
    float _3264 = _3094;
    float _3266 = _3106;
    float _3268 = _3088;
    float _3270 = _3082;
    float _3272 = _3100;
    float _3274 = fma(_3012, -0.5, 0.5);
    float _3276 = precise::clamp(_3274, 0.0, 1.0);
    float _3278 = -_3262;
    float _3280 = _3278 + _3264;
    float _3282 = -_3266;
    float _3284 = _3282 + _3268;
    float _3286 = -_3270;
    float _3288 = _3286 + _3272;
    bool _3290 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3292 = fma(_3276, _3280, _3262);
    float _3294 = fma(_3276, _3284, _3266);
    float _3296 = fma(_3276, _3288, _3270);
    float _3298 = _3292 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _3300 = fma(_3294, 0.298911988735198974609375, _3298);
    float _3302 = fma(_3296, 0.114477999508380889892578125, _3300);
    float _3304 = -_3302;
    float _3306 = _3294 + _3304;
    float _3308 = -_3302;
    float _3310 = _3292 + _3308;
    float _3312 = -_3302;
    float _3314 = _3296 + _3312;
    float _3316 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3318 = fma(_3306, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    float _3320 = fma(_3310, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    float _3322 = fma(_3314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    out.m_49.x = _3316;
    out.m_87.x = _3318;
    out.m_87.y = _3320;
    out.m_87.z = _3322;
    if (!_3290)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3324 = -_1890;
    float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3328 = -_1894;
    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3332 = -_1898;
    float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3336 = _3326 * _3326;
    float _3338 = fma(_3330, _3330, _3336);
    float _3340 = fma(_3334, _3334, _3338);
    float _3342 = sqrt(_3340);
    float _3344 = rsqrt(_3340);
    float _3346 = -_3342;
    float _3348 = _3346 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3350 = _3348 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3352 = precise::clamp(_3350, 0.0, 1.0);
    float _3354 = _3330 * _3344;
    float _3356 = _3326 * _3344;
    float _3358 = abs(_3352);
    float _3360 = log2(_3358);
    float _3362 = _3334 * _3344;
    float _3364 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3366 = _3012 * _3356;
    float _3368 = -_3356;
    float _3370 = -_3364;
    float _3372 = fma(_3368, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3370);
    float _3374 = fma(_2870, _3354, _3366);
    float _3376 = -_3362;
    float _3378 = fma(_3376, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3372);
    float _3380 = fma(_3028, _3362, _3374);
    float _3382 = precise::clamp(_3380, 0.0, 1.0);
    float _3384 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3386 = _3378 + _3384;
    float _3388 = _3360 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3390 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = exp2(_3388);
    float _3396 = _3394 * _3392;
    float _3398 = _3382 * _3396;
    float _3400 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3402 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3404 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _3400;
    out.m_85.y = _3402;
    out.m_85.z = _3404;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3176 = false;
    bool _636 = false;
    bool _506 = false;
    bool _352 = false;
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
        float _3461 = as_type<float>(_122);
        out.gl_Position.z = _3461;
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
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_160);
        out.gl_Position.z = _3530;
    }
    if (_154)
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
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _312 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _252, _308);
    float _322 = fma(_314, _252, _310);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_53.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_106);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _360 + _362;
    float _366 = in.m_55.x;
    float _368 = in.m_55.y;
    float _370 = in.m_55.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _376 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _378 = isnan(_360);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _392 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _394 = isnan(_360);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _404;
    bool _408 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _410 = isnan(_360);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _374;
    float _422 = -_386;
    float _424 = _422 + 1.0;
    bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _428 = _402 * _424;
    float _430 = -_402;
    float _432 = _430 + 1.0;
    float _434 = 1.0 / _390;
    float _436 = _406 * _420;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _442 = fma(_436, _364, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _328 * _368;
    float _446 = _440 * _434;
    float _448 = _442 * _428;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _360 + _454;
    float _458 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[115].x, _448);
    float _460 = _386 * _452;
    float _462 = fma(_446, _456, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = _326 * _366;
    float _468 = fma(_462, _460, _458);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[117].x, _468);
    float _476 = _330 * _370;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _484 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _472;
    out.m_57.y = _484;
    out.m_57.z = _480;
    out.m_57.w = _482;
    bool _486 = !_426;
    float _504;
    if (!_486)
    {
        float _488 = in.m_53.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_106);
        float _510 = 1.0 / _508;
        float _512 = _140 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _524 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _526 = isnan(_514);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _540 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _542 = isnan(_514);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _552;
    bool _556 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _558 = isnan(_514);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = 1.0 / _522;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _576 = _550 * _572;
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = 1.0 / _538;
    float _584 = _554 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _590 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _592 = _588 * _582;
    float _594 = _590 * _576;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _602 = _514 + _600;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[131].x, _594);
    float _606 = _534 * _598;
    float _608 = fma(_592, _602, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _610 = fma(_608, _606, _604);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[133].x, _610);
    float _614 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _614;
    bool _616 = !_574;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_106);
        float _640 = 1.0 / _638;
        float _642 = _140 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_53.x;
    float _648 = _140 * 0.119999997317790985107421875;
    float _650 = in.m_53.y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = in.m_61.x;
    float _662 = 1.0 / _654;
    float _664 = in.m_53.z;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _680 = in.m_46.x;
    float _682 = in.m_46.y;
    float _684 = in.m_46.z;
    float _686 = 1.0 / _668;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _690 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = _646 * 6.283185482025146484375;
    bool _694 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _696 = isnan(_644);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _674;
    float _708 = -_670;
    float _710 = fma(_690, 2.0, _708);
    float _712 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = fma(_648, _660, _692);
    float _716 = -_140;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[76].x, _710);
    float _720 = fma(_712, -2.0, _688);
    float _722 = 1.0 / _678;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _730 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _720);
    float _732 = _682 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _734 = _682 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _740 = _682 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _742 = 1.0 / _726;
    float _744 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[4].x, _732);
    float _746 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[5].x, _734);
    float _748 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[6].x, _740);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _762 = 1.0 / _738;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _768;
    float _772 = _664 * 2.0;
    float _774 = _752 * _706;
    float _776 = _766 * _686;
    float _778 = _650 * 2.0;
    float _780 = _756 * _722;
    float _782 = _646 * 2.0;
    float _784 = _650 + _664;
    float _786 = 1.0 / _760;
    float _788 = _770 * _662;
    float _790 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].z, _744);
    bool _792 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _794 = isnan(_644);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _806 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].z, _748);
    float _808 = floor(_778);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _820 = _644 + _818;
    float _822 = -_802;
    float _824 = _822 + 1.0;
    float _826 = _816 * _762;
    float _828 = floor(_772);
    float _830 = _784 + (-1.0);
    float _832 = _646 + _650;
    float _834 = fma(_776, _820, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _836 = _812 * _742;
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _840 = _832 + (-1.0);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _842;
    float _846 = floor(_782);
    float _848 = _646 + _664;
    float _850 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _852 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _854 = isnan(_644);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _844 * _786;
    float _866 = _848 + (-1.0);
    bool _868 = _808 > 0.0;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _872 = _808 >= 0.0;
    bool _874 = isnan(_808);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _644 + _884;
    bool _888 = _828 > 0.0;
    float _890 = -_704;
    float _892 = _890 + 1.0;
    bool _894 = _828 >= 0.0;
    bool _896 = isnan(_828);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = fma(_788, _886, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _906 = -_862;
    float _908 = _906 + 1.0;
    bool _910 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _912 = isnan(_644);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _924 = log2(_922);
    bool _926 = _846 > 0.0;
    float _928 = _802 * _908;
    bool _930 = _846 >= 0.0;
    bool _932 = isnan(_846);
    bool _934 = _930 || _932;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _942 = _644 + _940;
    bool _944 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _946 = isnan(_644);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _920 * _824;
    float _958 = -_920;
    float _960 = _958 + 1.0;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _964 = _644 + _962;
    bool _966 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = isnan(_644);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = fma(_774, _942, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _980 = _954 * _960;
    float _982 = fma(_780, _964, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _984 = -_954;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _644 + _988;
    bool _992 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _994 = isnan(_644);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_976;
    float _1006 = _1004 + 1.0;
    float _1008 = _976 * _986;
    float _1010 = fma(_836, _990, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1014 = _644 + _1012;
    bool _1016 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1018 = isnan(_644);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _1002 * _1006;
    float _1030 = _990;
    float _1032 = _834;
    float _1034 = _664;
    float _1036 = _730;
    if (_658)
    {
        _1030 = _646;
    }
    float _1038 = _1030;
    float _1040 = fma(_826, _1014, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1044 = _644 + _1042;
    float _1046 = _1038;
    if (!_658)
    {
        _1046 = _664;
    }
    float _1048 = _1046;
    float _1050 = _1026 * _892;
    float _1052 = -_1002;
    float _1054 = _1052 + 1.0;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1058 = fma(_864, _1044, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1062 = _904 * _1050;
    float _1064 = _704 * _1054;
    int _1066 = _902 ? 0 : 1;
    float _1068 = -_1056;
    float _1070 = fma(_1060, 2.0, _1068);
    float _1072 = _1056;
    float _1074 = _1048;
    if (!_658)
    {
        _1072 = _650;
    }
    float _1076 = _1072;
    float _1078 = -_1026;
    float _1080 = _1078 + 1.0;
    float _1082 = _1076;
    if (_658)
    {
        _1082 = _646;
    }
    float _1084 = _1082;
    float _1086 = _790 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_658)
    {
        _1074 = _664;
    }
    float _1088 = _1074;
    float _1090 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1062);
    int _1092 = _938 ? 0 : 1;
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[83].z, _728);
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1098 = ~_1066;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    float _1104 = fma(_834, _1064, _1090);
    int _1106 = _1102;
    float _1108 = _1088;
    if (!_888)
    {
        int _1110 = ~_1066;
        int _1112 = _1110 + 1;
        _1106 = _1112;
    }
    int _1114 = _1106;
    float _1116 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1118 = _880 ? 0 : 1;
    float _1120 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1094);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1132 = _1130 != 0;
    float _1134 = _804 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_658)
    {
        _1108 = _650;
    }
    float _1136 = _1108;
    float _1138 = fma(_140, -0.2199999988079071044921875, _714);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = _1116 + _1140;
    bool _1144 = !_1128;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[83].w, _870);
    bool _1150 = !_1124;
    int _1152 = _1150 ? 0 : 1;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1156 = !_1132;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1148);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1172 = _1170 != 0;
    float _1174 = _1136;
    if (!_658)
    {
        _1174 = _664;
    }
    float _1176 = _1174;
    float _1178 = _1176;
    if (_658)
    {
        _1178 = _650;
    }
    float _1180 = _1178;
    bool _1182 = !_1164;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = ~_1118;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1194 = _1190;
    if (!_868)
    {
        int _1196 = ~_1118;
        int _1198 = _1196 + 1;
        _1194 = _1198;
    }
    int _1200 = _1194;
    float _1202 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1204 = int(_1202);
    int _1206 = abs(_1184);
    float _1208 = fma(_1192, -2.0, _1154);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1086 + _1210;
    float _1214 = float(_1114);
    float _1216 = -_1116;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = float(_1206);
    float _1222 = _924 * _140;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1226 = _1218;
    if (_658)
    {
        _1032 = _650;
    }
    float _1228 = _1032;
    float _1230 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1208);
    float _1232 = _1228;
    if (!_658)
    {
        _1232 = _646;
    }
    float _1234 = _1232;
    float _1236 = -_1224;
    float _1238 = fma(_1096, 2.0, _1236);
    float _1240 = exp2(_1222);
    float _1242 = -_140;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    int _1246 = ~_1092;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    float _1252 = abs(_1212);
    float _1254 = abs(_1218);
    float _1256 = precise::max(_1252, _1254);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1260 = _1250;
    if (!_926)
    {
        int _1262 = ~_1092;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1270 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1272 = isnan(1.0);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1278 = _1274 || _1276;
    float _1280 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1282 = int(_1280);
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1286 = 1.0 + _1284;
    bool _1288 = _1256 >= 16.0;
    float _1290 = fma(_978, _1028, _1104);
    float _1292 = float(_1204);
    float _1294 = fma(_1268, -2.0, _1258);
    float _1296 = _1220 * _1214;
    float _1298 = 1.0 / _1292;
    float _1300 = fma(_982, _1008, _1290);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1314 = _1310 || _1312;
    float _1316 = 1.0 / _1286;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1320 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1302);
    float _1322 = -_1240;
    float _1324 = _1322 + 1.0;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1328 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1304);
    float _1330 = float(_1282);
    float _1332 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1318);
    float _1334 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1320);
    float _1336 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1326);
    float _1338 = _1314 ? _1324 : 0.0;
    float _1340 = _1296 * (-2.0);
    float _1342 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1332);
    float _1344 = -_140;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1070);
    bool _1348 = !_1172;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -_660;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[193].y, _140);
    float _1356 = _1330 * _140;
    float _1358 = _1298 * _140;
    float _1360 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1328);
    float _1362 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1336);
    float _1364 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1294);
    float _1366 = _646 + (-0.5);
    bool _1368 = _1278;
    if (_1278)
    {
        float _1370 = _1338 * _1316;
        _144 = _1370;
    }
    float _1372 = _144;
    float _1374 = fma(_850, _1340, _850);
    bool _1376 = !_1168;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1382 = _1134 + _1380;
    int _1384 = abs(_1350);
    float _1386 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1388 = _1138 * 0.15915493667125701904296875;
    int _1390 = abs(_1378);
    float _1392 = _1382 * _1382;
    float _1394 = float(_1384);
    float _1396 = _1212 * 0.0625;
    float _1398 = float(_1200);
    float _1400 = fma(_1212, _1212, _1392);
    float _1402 = fma(_1374, _1372, _1386);
    if (_1288)
    {
        float _1404 = _1218 * 0.0625;
        _1226 = _1404;
    }
    float _1406 = _1226;
    float _1408 = _1394 * _1398;
    float _1410 = fma(_1142, _1142, _1400);
    float _1412 = float(_1266);
    float _1414 = _664 + (-0.5);
    float _1416 = _1408 * (-2.0);
    float _1418 = float(_1390);
    float _1420 = rsqrt(_1410);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1424 = fma(_882, _1416, _882);
    float _1426 = _1288 ? _1396 : _1212;
    float _1428 = _1418 * _1412;
    float _1430 = in.m_63.x;
    float _1432 = in.m_63.y;
    float _1434 = fma(_1424, _1372, _1422);
    float _1436 = abs(_1426);
    bool _1438 = _1436 != 0.0;
    bool _1440 = isnan(_1436);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(0.0);
    bool _1446 = _1442 || _1444;
    float _1448 = _1402 * 0.15915493667125701904296875;
    float _1450 = abs(_1406);
    bool _1452 = _1450 == 0.0;
    float _1454 = _1434 * 0.15915493667125701904296875;
    float _1456 = abs(_1406);
    bool _1458 = _1456 == 0.0;
    bool _1460 = !_1446;
    bool _1462 = _1458 && _1460;
    float _1464 = _1428 * (-2.0);
    float _1466 = _1388 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1010, _980, _1300);
    float _1472 = _1382 * _1420;
    float _1474 = _1212 * _1420;
    float _1476 = fma(_838, _1464, _838);
    float _1478 = _650 + (-0.5);
    float _1480 = -_1472;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1382);
    float _1484 = -_1474;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1488 = _1448 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    float _1492 = _1142 * _1420;
    float _1494 = _1482 * _1482;
    int _1496 = as_type<int>(_1486);
    int _1498 = as_type<int>(_1476);
    float _1500 = _1474;
    if (_1462)
    {
        bool _1502 = as_type<int>(_1406) >= 0;
        _1368 = _1502;
    }
    bool _1504 = _1368;
    float _1506 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1508 = -_1492;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1512 = fma(_1486, _1486, _1494);
    int _1514 = _1504 ? (-1) : 0;
    if (_1462)
    {
        int _1516 = _1504 ? 0 : 1078530011;
        _1496 = _1516;
    }
    int _1518 = _1496;
    float _1520 = _1448 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = fma(_1476, _1372, _1506);
    float _1526 = fma(_1510, _1510, _1512);
    if (_1462)
    {
        int _1528 = int(0x80000000) & as_type<int>(_1426);
        int _1530 = _1518 | _1528;
        _1498 = _1530;
    }
    int _1532 = _1498;
    float _1534 = _1454 * 6.283185482025146484375;
    float _1536 = cos(_1534);
    bool _1538 = !_1446;
    bool _1540 = _1538 && _1452;
    int _1542 = _1532;
    float _1544 = as_type<float>(_1532);
    if (!_1540)
    {
        float _1546 = abs(_1426);
        bool _1548 = _1546 != as_type<float>(0x7f800000u /* inf */);
        bool _1550 = isnan(_1546);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1556 = _1552 || _1554;
        float _1558 = abs(_1406);
        bool _1560 = _1558 == as_type<float>(0x7f800000u /* inf */);
        float _1562 = abs(_1406);
        bool _1564 = _1562 == as_type<float>(0x7f800000u /* inf */);
        bool _1566 = !_1556;
        bool _1568 = _1564 && _1566;
        if (_1568)
        {
            bool _1570 = as_type<int>(_1406) >= 0;
            _1514 = _1570 ? (-1) : 0;
        }
        int _1572 = _1514;
        if (_1568)
        {
            _1542 = 1075235812;
        }
        int _1574 = _1542;
        int _1576 = _1574;
        if (_1568)
        {
            int _1578 = ~_1572;
            int _1580 = (_1578 != 0) ? _1574 : 1061752795;
            _1576 = _1580;
        }
        int _1582 = _1576;
        float _1584 = as_type<float>(_1582);
        if (_1568)
        {
            int _1586 = int(0x80000000) & as_type<int>(_1426);
            int _1588 = _1582 | _1586;
            _1584 = as_type<float>(_1588);
        }
        float _1590 = _1584;
        bool _1592 = !_1556;
        bool _1594 = _1592 && _1560;
        _1544 = _1590;
        if (!_1594)
        {
            float _1596 = abs(_1406);
            float _1598 = abs(_1426);
            float _1600 = precise::max(_1596, _1598);
            float _1602 = abs(_1406);
            float _1604 = abs(_1426);
            float _1606 = precise::min(_1602, _1604);
            float _1608 = 1.0 / _1600;
            float _1610 = abs(_1426);
            float _1612 = abs(_1406);
            bool _1614 = _1610 > _1612;
            bool _1616 = as_type<int>(_1406) >= 0;
            float _1618 = _1606 * _1608;
            float _1620 = _1618 * _1618;
            float _1622 = _1620 + 11.33538818359375;
            float _1624 = fma(_1620, _1622, 28.84246826171875);
            float _1626 = fma(_1620, _1624, 19.6966705322265625);
            float _1628 = fma(_1620, -0.82336294651031494140625, -5.674867153167724609375);
            float _1630 = fma(_1620, _1628, -6.565555095672607421875);
            float _1632 = 1.0 / _1626;
            float _1634 = _1620 * _1630;
            float _1636 = abs(_1406);
            float _1638 = abs(_1426);
            float _1640 = _1636 + _1638;
            int _1642 = as_type<int>(_1426) & int(0x80000000);
            float _1644 = _1618 * _1634;
            bool _1646 = _1640 > as_type<float>(0x7f800000u /* inf */);
            bool _1648 = isnan(_1640);
            bool _1650 = _1646 || _1648;
            bool _1652 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1654 = _1650 || _1652;
            float _1656 = fma(_1644, _1632, _1618);
            float _1658 = _1656;
            _1544 = _1640;
            if (_1614)
            {
                float _1660 = -_1656;
                float _1662 = _1660 + 1.57079637050628662109375;
                _1658 = _1662;
            }
            float _1664 = _1658;
            int _1666 = as_type<int>(_1664);
            if (!_1616)
            {
                float _1668 = -_1664;
                float _1670 = _1668 + 3.1415927410125732421875;
                _1666 = as_type<int>(_1670);
            }
            int _1672 = _1666;
            if (!_1654)
            {
                int _1674 = _1642 | _1672;
                _1544 = as_type<float>(_1674);
            }
        }
    }
    float _1676 = _1544;
    float _1678 = fma(_1040, _956, _1470);
    float _1680 = sqrt(_1526);
    float _1682 = precise::max(0.0, _1354);
    float _1684 = in.m_63.z;
    float _1686 = fma(_1058, _928, _1678);
    float _1688 = -_1676;
    float _1690 = _1524 + _1688;
    float _1692 = precise::min(_1682, 1000.0);
    float _1694 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1696 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1686);
    float _1698 = _1690 * 0.15915493667125701904296875;
    float _1700 = _1454 * 6.283185482025146484375;
    float _1702 = sin(_1700);
    float _1704 = _1692 * 0.100000001490116119384765625;
    float _1706 = _1696 * _1468;
    float _1708 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1710 = _1704 * _1704;
    float _1712 = fma(_1706, _660, _1430);
    float _1714 = _1420 * _1680;
    float _1716 = _1698 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = -_1710;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1432);
    float _1724 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1726 = _1714 * _1694;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1712);
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1722);
    float _1732 = _1714 * _1724;
    float _1734 = _1714 * _1708;
    float _1736 = _1698 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1726 * _1728;
    float _1742 = _1732 * _1730;
    float _1744 = _1490 * _1536;
    float _1746 = _1744 * _1742;
    float _1748 = _1522 * _1718;
    float _1750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1684);
    float _1752 = _1734 * _1750;
    float _1754 = _1490 * _1718;
    float _1756 = -_1742;
    float _1758 = _1702 * _1756;
    float _1760 = _1490 * _1738;
    float _1762 = _1522 * _1738;
    float _1764 = _1738 * _1536;
    float _1766 = _1718 * _1536;
    float _1768 = -_1748;
    float _1770 = fma(_1702, _1760, _1768);
    float _1772 = fma(_1702, _1754, _1762);
    float _1774 = _1522 * _1536;
    float _1776 = fma(_1702, _1762, _1754);
    float _1778 = fma(_1770, _1740, _1746);
    float _1780 = fma(_1764, _1740, _1758);
    float _1782 = _1774 * _1742;
    float _1784 = -_1760;
    float _1786 = fma(_1702, _1748, _1784);
    float _1788 = fma(_1772, _1752, _1778);
    float _1790 = fma(_1766, _1752, _1780);
    float _1792 = fma(_1776, _1740, _1782);
    float _1794 = _1116 + _1788;
    float _1796 = _1086 + _1790;
    float _1798 = fma(_1786, _1752, _1792);
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1802 = _1794 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1806 = _1796 + _1804;
    float _1808 = _1134 + _1798;
    float _1810 = _1802 * _1802;
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = sqrt(_1812);
    bool _1816 = _1814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1818 = _1798;
    float _1820 = _1754;
    float _1822 = _1740;
    float _1824 = _1748;
    float _1826 = _1808;
    float _1828 = _1752;
    if (!_1816)
    {
        _1818 = _1796;
    }
    float _1830 = _1818;
    float _1832 = _1830;
    if (!_1816)
    {
        _1820 = _1794;
    }
    float _1834 = _1820;
    float _1836 = _1834;
    if (!_1816)
    {
        _1822 = _1808;
    }
    float _1838 = _1822;
    bool _1840 = !_1816;
    float _1842 = _1838;
    if (!_1840)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1848 = _1814 + _1846;
        float _1850 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = rsqrt(_1812);
        float _1854 = _1848 * _1844;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = _1856 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = fma(_1860, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1868 = _1852 * _1866;
        float _1870 = _1864 + (-1.0);
        float _1872 = fma(_1806, _1868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1874 = fma(_1802, _1868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1876 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1878 = fma(_1808, _1864, _1876);
        _1842 = _1878;
        _1832 = _1872;
        _1836 = _1874;
        _1824 = _1856;
    }
    float _1880 = _1842;
    float _1882 = _1832;
    float _1884 = _1836;
    float _1886 = _1824;
    float _1888 = -_1472;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1880);
    float _1892 = -_1474;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1882);
    float _1896 = -_1492;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1884);
    float _1900 = -_1474;
    float _1902 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1906 = _1890 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1910 = _1894 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1914 = _1898 + _1912;
    float _1916 = -_1492;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1920 = _1906 * _1906;
    float _1922 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1924 = fma(_1910, _1910, _1920);
    float _1926 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1922);
    float _1928 = fma(_1914, _1914, _1924);
    float _1930 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1932 = rsqrt(_1928);
    float _1934 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1936 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1938 = _1910 * _1936;
    float _1940 = _1914 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 * _1940;
    float _1946 = _1942 + _1944;
    float _1948 = sqrt(_1946);
    bool _1950 = _1948 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1954 = _1948 + _1952;
    float _1956 = _1886;
    float _1958 = _1954;
    float _1960 = _1906;
    float _1962 = _1938;
    float _1964 = _1940;
    float _1966 = _1942;
    if (_1950)
    {
        float _1968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _1968;
    }
    float _1970 = _1956;
    if (_1950)
    {
        float _1972 = rsqrt(_1946);
        _1826 = _1972;
    }
    float _1974 = _1826;
    float _1976 = _1974;
    if (_1950)
    {
        float _1978 = _1954 * _1970;
        _1958 = _1978;
    }
    float _1980 = _1958;
    float _1982 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1950)
    {
        float _1984 = _1980 * 0.15915493667125701904296875;
        _1828 = _1984;
    }
    float _1986 = _1828;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = _1882;
    float _1992 = _1986;
    if (_1950)
    {
        float _1994 = _1986 * 6.283185482025146484375;
        float _1996 = sin(_1994);
        _1990 = _1996;
    }
    float _1998 = _1990;
    float _2000 = precise::max(0.0, _1988);
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1950)
    {
        float _2004 = _1986 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        _2002 = _2006;
    }
    float _2008 = _2002;
    float _2010 = -_1936;
    float _2012 = -_2000;
    float _2014 = fma(_1906, _2010, _2012);
    if (_1950)
    {
        float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1960 = _2016;
    }
    float _2018 = _1960;
    float _2020 = _1998;
    if (_1950)
    {
        float _2022 = fma(_1998, _2018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2028 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _2030 = _2024;
    if (_1950)
    {
        float _2032 = _1974 * _2024;
        _1500 = _2032;
    }
    float _2034 = _1500;
    if (!_1950)
    {
        _2030 = _2014;
    }
    float _2036 = _2030;
    float _2038 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2040 = _2036;
    float _2042 = _2008;
    if (_1950)
    {
        float _2044 = _2008 + (-1.0);
        _1976 = _2044;
    }
    float _2046 = _1976;
    if (_1950)
    {
        float _2048 = _1938 * _2034;
        _1962 = _2048;
    }
    float _2050 = _1962;
    if (_1950)
    {
        float _2052 = _1940 * _2034;
        _1964 = _2052;
    }
    float _2054 = _1964;
    float _2056 = floor(_2026);
    if (_1950)
    {
        float _2058 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2058;
    }
    float _2060 = _1992;
    if (_1950)
    {
        float _2062 = _2050 * _2050;
        _1966 = _2062;
    }
    float _2064 = _1966;
    if (_1950)
    {
        float _2066 = fma(_2014, _2008, _2060);
        _2040 = _2066;
    }
    float _2068 = _2040;
    if (!_1950)
    {
        _2042 = _1944;
    }
    float _2070 = _2042;
    float _2072 = _2070;
    if (_1950)
    {
        float _2074 = _2054 * _2054;
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = fma(_2068, _2068, _2064);
    float _2080 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2082 = sqrt(_1928);
    float _2084 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2086 = _2078 + _2076;
    float _2088 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2090 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2084);
    float _2092 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = floor(_2080);
    float _2096 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2090);
    float _2100 = -_2092;
    float _2102 = fma(_2100, _2088, 1.0);
    float _2104 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2106 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2108 = rsqrt(_2086);
    float _2110 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2104);
    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2114 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2112);
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2120 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2122 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2124 = -_2116;
    float _2126 = _2124 + 1.0;
    float _2128 = log2(_2102);
    float _2130 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2118);
    float _2132 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = -_2094;
    float _2136 = _2080 + _2134;
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2120);
    float _2140 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2130);
    float _2142 = abs(_2126);
    float _2144 = log2(_2142);
    float _2146 = _2108 * _2050;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2140);
    float _2150 = _2108 * _2068;
    float _2152 = _2108 * _2054;
    float _2154 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2156 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2138);
    float _2158 = 1.0 / _2148;
    float _2160 = -_2154;
    float _2162 = fma(_2150, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2160);
    float _2164 = -_2056;
    float _2166 = _2026 + _2164;
    float _2168 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2170 = _2128 * 0.693147182464599609375;
    float _2172 = -_2152;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2162);
    float _2176 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2168);
    float _2178 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2180 = fma(_2174, -0.5, 0.5);
    float _2182 = fma(_2174, 0.5, 0.5);
    float _2184 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2176);
    float _2186 = _2150 + 1.0;
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2156);
    float _2190 = exp2(_2178);
    float _2192 = fma(_2182, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2194 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2184);
    float _2196 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = fma(_2182, _2192, -0.212114393711090087890625);
    float _2200 = _2194 * _2158;
    float _2202 = _2188 * _2158;
    float _2204 = sqrt(_2180);
    float _2206 = fma(_2182, _2198, 1.570728778839111328125);
    float _2208 = fma(_2202, -0.5, 0.5);
    float _2210 = -_2150;
    float _2212 = fma(_2190, _2186, _2210);
    float2 _6766 = float2(_2166, _2136);
    float _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6766, float2(0.0), isnan(_6766)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6766, float2(0.0), isnan(_6766)), level(0.0)).x;
    float _2216 = fma(_2212, 0.5, 0.5);
    float _2218 = _2204 * 0.636619746685028076171875;
    float _2220 = fma(_2200, 0.5, 0.5);
    float _2222 = -_2206;
    float _2224 = fma(_2218, _2222, 1.0);
    float3 _6789 = float3(_2220, _2208, _2196);
    float _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6789, float3(0.0), isnan(_6789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6789, float3(0.0), isnan(_6789)), level(0.0)).x;
    float3 _6800 = float3(_2220, _2208, _2196);
    float4 _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6800, float3(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6800, float3(0.0), isnan(_6800)), level(0.0)).xyzw;
    float _2231 = _2229.x;
    float _2233 = _2229.y;
    float _2235 = _2229.z;
    float _2237 = _2229.w;
    float2 _6816 = float2(_2224, _2216);
    float3 _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6816, float2(0.0), isnan(_6816)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6816, float2(0.0), isnan(_6816)), level(0.0)).xyz;
    float _2243 = _2241.x;
    float _2245 = _2241.y;
    float _2247 = _2241.z;
    float _2249 = float(uint(_1282));
    float _2251 = trunc(_1358);
    int _2253 = int(_2251);
    float _2255 = float(_106);
    float _2257 = -_1472;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1134);
    int _2261 = ~_1282;
    int _2263 = _2261 + 1;
    float _2265 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2267 = abs(_1146);
    float _2269 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2271 = ~_1282;
    int _2273 = _2271 + 1;
    float _2275 = 1.0 / _2249;
    int _2277 = abs(_1152);
    float _2279 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2281 = abs(_1158);
    bool _2283 = _650 > 0.5;
    float _2285 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    int _2287 = ~_1282;
    int _2289 = _2287 + 1;
    float _2291 = 1.0 / _2255;
    float _2293 = float(uint(_2253));
    float _2295 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2285);
    float _2297 = float(_2253);
    bool _2299 = !_658;
    float _2301 = _2299 ? 5.839270114898681640625 : 1.0;
    float _2303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2305 = as_type<int>(_2275) + (-2);
    float _2307 = as_type<float>(_2305) * _2293;
    float _2309 = _1356 * _2291;
    float _2311 = exp2(_2265);
    float _2313 = trunc(_2307);
    float _2315 = precise::max(_2313, 0.0);
    uint _2318 = uint(_2315);
    float _2320 = trunc(_2309);
    int _2322 = int(_2320);
    float _2324 = -_2311;
    float _2326 = _2324 + 1.0;
    int _2328 = _2263 * int(_2318);
    int _2330 = _2328 + _2253;
    int _2332 = _1282 + (-1);
    float _2334 = float(uint(_2330));
    float _2336 = as_type<float>(_2305) * _2334;
    bool _2338 = !_658;
    float _2340 = _2338 ? _664 : _646;
    float _2342 = trunc(_2336);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = _2340 * _2301;
    float _2350 = floor(_2348);
    int _2352 = int(_2318) + int(_2346);
    bool _2354 = _2297 >= _1330;
    bool _2356 = isnan(_2297);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(_1330);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    int _2366 = _2273 * _2352;
    int _2368 = _2366 + _2253;
    float _2370 = trunc(_2364);
    int _2372 = int(_2370);
    float _2374 = -_2350;
    float _2376 = _2348 + _2374;
    bool _2378 = uint(_2368) >= uint(_1282);
    float _2380 = _2376 * _1330;
    bool _2382 = !_2378;
    int _2384 = _2382 ? 0 : (-1);
    bool _2386 = _1282 == 0;
    int _2388 = ~_2352;
    int _2390 = _2388 + _2384;
    int _2392 = _2390 + 1;
    float _2394 = trunc(_2380);
    int _2396 = int(_2394);
    int _2398 = _1282 * _2392;
    int _2400 = _2398 + _2253;
    int _2402 = ~_2372;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2410 = _2408 != 0;
    bool _2412 = !_2386;
    int _2414 = _2412 ? _2400 : (-1);
    bool _2416 = !_2410;
    int _2418 = _2416 ? 0 : 1;
    int _2420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2422 = _2420 != 0;
    int _2424 = _2414 * _2406;
    int _2426 = abs(_2418);
    int _2428 = ~_1282;
    int _2430 = _2428 + 1;
    int _2432 = _2372 * _2332;
    int _2434 = _2432 + _2424;
    bool _2436 = !_2422;
    int _2438 = _2436 ? 0 : 1;
    int _2440 = _2396 * _2426;
    int _2442 = _2440 + _2253;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2446 = _2444 != 0;
    int _2448 = _2434 * _2267;
    int _2450 = abs(_2438);
    float _2452 = in.m_65.y;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2456 = _2454 != 0;
    int _2458 = _2322 * _2277;
    int _2460 = _2458 + _2448;
    bool _2462 = _664 > 0.5;
    float _2464 = in.m_53.w;
    int _2466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2468 = _2466 != 0;
    int _2470 = _2442 * _2281;
    int _2472 = _2470 + _2460;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2476 = _2474 != 0;
    int _2478 = _2396 * _2450;
    int _2480 = _2478 + _2472;
    float _2482 = in.m_65.x;
    float _2484 = float(uint(_2480));
    float _2486 = in.m_61.w;
    float _2488 = as_type<float>(_2305) * _2484;
    float _2490 = trunc(_2488);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    float _2496 = -_2452;
    float _2498 = _2496 + 1.0;
    int _2500 = _2283 ? as_type<int>(_2498) : as_type<int>(_2452);
    int _2502 = _2462 ? as_type<int>(_2498) : as_type<int>(_2452);
    float _2504 = _2446 ? as_type<float>(_2500) : _2452;
    bool _2506 = _2464 > 0.5;
    float _2508 = _2476 ? as_type<float>(_2502) : _2452;
    int _2510 = _2430 * int(_2494);
    int _2512 = _2510 + _2480;
    bool _2514 = _2476;
    float _2516 = _2452;
    float _2518 = _2148;
    if (_2456)
    {
        bool _2520 = _646 > 0.5;
        _2514 = _2520;
    }
    bool _2522 = _2514;
    out.m_67.w = _2486;
    if (!_2456)
    {
        _1034 = _2482;
    }
    float _2524 = _1034;
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2528 = float(uint(_2512));
    float _2530 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    int _2532 = as_type<int>(_2528);
    float _2534 = _2524;
    if (_2468)
    {
        float _2536 = _2506 ? _2498 : _2452;
        _2516 = _2536;
    }
    float _2538 = _2516;
    int _2540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2542 = _2540 != 0;
    float _2544 = as_type<float>(_2305) * _2528;
    if (_2456)
    {
        float _2546 = -_2482;
        float _2548 = _2546 + 1.0;
        _2532 = as_type<int>(_2548);
    }
    int _2550 = _2532;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2554 = _2552 != 0;
    float _2556 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2558 = trunc(_2544);
    float _2560 = precise::max(_2558, 0.0);
    uint _2562 = uint(_2560);
    float _2564 = -_1364;
    float _2566 = fma(_1362, _2530, _2564);
    if (_2456)
    {
        float _2568 = _2522 ? as_type<float>(_2550) : _2482;
        _2534 = _2568;
    }
    float _2570 = _2534;
    float _2572 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2576 = _2574 != 0;
    float _2578 = _2566 + 0.5;
    float _2580 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2572);
    float _2582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2584 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2556);
    float _2586 = float(uint(_2442));
    float _2588 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2580);
    int _2590 = ~_1282;
    int _2592 = _2590 + 1;
    float _2594 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2584);
    float _2596 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2598 = int(_2494) + int(_2562);
    float _2600 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2602 = _2594 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2604 = as_type<float>(_2305) * _2586;
    float _2606 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _2608 = _2289 * _2598;
    int _2610 = _2608 + _2480;
    float _2612 = fma(_2600, _2504, -0.5);
    float _2614 = _2602 + _2596;
    float _2616 = trunc(_2604);
    float _2618 = precise::max(_2616, 0.0);
    uint _2620 = uint(_2618);
    bool _2622 = uint(_2610) >= uint(_1282);
    float _2624 = _2582 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2626 = -_730;
    float _2628 = fma(_1334, _2612, _2626);
    float _2630 = _2624;
    int _2632 = _2598;
    if (!_2554)
    {
        _1036 = _2482;
    }
    float _2634 = _1036;
    bool _2636 = !_2622;
    int _2638 = _2636 ? 0 : (-1);
    float _2640 = 1.0 / _2596;
    float _2642 = fma(_2624, _2538, -0.5);
    float _2644 = _2634;
    if (!_2542)
    {
        _2630 = _2482;
    }
    float _2646 = _2630;
    int _2648 = ~_2598;
    int _2650 = _2648 + _2638;
    int _2652 = _2650 + 1;
    float _2654 = _2646;
    if (_2542)
    {
        float _2656 = -_2482;
        float _2658 = _2656 + 1.0;
        _2632 = as_type<int>(_2658);
    }
    int _2660 = _2632;
    float _2662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2664 = _1282 * _2652;
    int _2666 = _2664 + _2480;
    int _2668 = _2660;
    if (_2542)
    {
        float _2670 = _2462 ? as_type<float>(_2660) : _2482;
        _2654 = _2670;
    }
    float _2672 = _2654;
    if (_2554)
    {
        float _2674 = -_2482;
        float _2676 = _2674 + 1.0;
        _2668 = as_type<int>(_2676);
    }
    int _2678 = _2668;
    int _2680 = _2592 * int(_2620);
    int _2682 = _2680 + _2442;
    bool _2684 = !_2386;
    int _2686 = _2684 ? _2666 : (-1);
    if (_2554)
    {
        float _2688 = _2283 ? as_type<float>(_2678) : _2482;
        _2644 = _2688;
    }
    float _2690 = _2644;
    float _2692 = _2614 * _2640;
    float _2694 = _2692 * 0.5;
    int _2696 = _2686 >> 31;
    float _2698 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2700 = float(uint(_2682));
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2704 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2702);
    int _2706 = _2696 & 3;
    float _2708 = fma(_2698, _2570, -0.5);
    float _2710 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2712 = 1.0 / _2704;
    int _2714 = _2686 + _2706;
    float _2716 = fma(_1342, _2708, _718);
    float _2718 = fma(_2710, _2672, -0.5);
    float _2720 = -_1230;
    float _2722 = fma(_1160, _2642, _2720);
    int _2724 = _2714 >> 2;
    float _2726 = _2628 + 0.5;
    float _2728 = fma(_1120, _2718, _1244);
    float _2730 = fma(_2690, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _2732 = _2724 << 4;
    int _2734 = _2732 + 656;
    float _2736 = as_type<float>(_2305) * _2700;
    float _2738 = _2716 + 0.5;
    float _2740 = _2728 + 0.5;
    uint _2742 = uint(int(uint(_2734) >> uint(2)));
    uint _2744 = uint(int(uint(int(_2742)) >> uint(2)));
    int _2746 = int(_2742) & 3;
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[int(_2744)][_2746];
    int _2750 = int(_2742) + 1;
    uint _2752 = uint(int(uint(_2750) >> uint(2)));
    int _2754 = _2750 & 3;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[int(_2752)][_2754];
    float _2758 = trunc(_2736);
    float _2760 = precise::max(_2758, 0.0);
    uint _2762 = uint(_2760);
    float _2764 = fma(_1360, _2730, _1346);
    float _2766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2768 = _2712 * _2766;
    float _2770 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2772 = _2686 & 3;
    bool _2774 = _2772 != 0;
    float _2776 = _2722 + 0.5;
    int _2778 = ~_1282;
    int _2780 = _2778 + 1;
    int _2782 = _2734 + 8;
    uint _2784 = uint(int(uint(_2782) >> uint(2)));
    uint _2786 = uint(int(uint(int(_2784)) >> uint(2)));
    int _2788 = int(_2784) & 3;
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[int(_2786)][_2788];
    int _2792 = int(_2784) + 1;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    int _2796 = _2792 & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    float _2800 = abs(_2768);
    float _2802 = log2(_2800);
    bool _2804 = uint(_2772) > 1u;
    out.m_69.x = _2738;
    out.m_69.y = _2726;
    out.m_69.z = _2740;
    out.m_69.w = _2776;
    int _2806 = _2686 & 3;
    bool _2808 = _2806 != 0;
    float _2810 = _2764 + 0.5;
    float _2812 = _1744 * _2770;
    float _2814 = -_2770;
    float _2816 = _1702 * _2814;
    float _2818 = _1774 * _2770;
    int _2820 = int(_2620) + int(_2762);
    out.m_71.x = _2810;
    out.m_71.y = _2578;
    bool _2822 = _2768 <= 8000.0;
    bool _2824 = isnan(_2768);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan(8000.0);
    bool _2830 = _2826 || _2828;
    float _2832 = float(_2830);
    float _2834 = fma(_1770, _2269, _2812);
    int _2836 = _2780 * _2820;
    int _2838 = _2836 + _2442;
    int _2840 = _2808 ? 0 : 1;
    float _2842 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2844 = uint(_2838) >= uint(_1282);
    float _2846 = -_2214;
    float _2848 = _2846 + 1.0;
    int _2850 = ~_2840;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = fma(_1764, _2269, _2816);
    int _2858 = _2854;
    if (!_2804)
    {
        int _2860 = ~_2840;
        int _2862 = _2860 + 1;
        _2858 = _2862;
    }
    int _2864 = _2858;
    float _2866 = exp2(_2842);
    bool _2868 = _2772 != 3;
    float _2870 = fma(_1766, _2606, _2856);
    bool _2872 = !_2844;
    int _2874 = _2872 ? 0 : (-1);
    bool _2876 = uint(_2772) >= 2u;
    int _2878 = ~_2820;
    int _2880 = _2878 + _2874;
    int _2882 = _2880 + 1;
    int _2884 = abs(_2864);
    bool _2886 = !_2774;
    int _2888 = _2886 ? 0 : 1;
    int _2890 = _1282 * _2882;
    int _2892 = _2890 + _2442;
    int _2894 = _2876 ? 0 : 1;
    int _2896 = ~_2884;
    int _2898 = _2896 + 1;
    int _2900 = _2898 + 1;
    int _2902 = abs(_2888);
    int _2904 = _2900 * as_type<int>(_2756);
    int _2906 = ~_2894;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    float _2912 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    bool _2916 = _2772 != 3;
    int _2918 = _2910;
    if (_2868)
    {
        int _2920 = ~_2894;
        int _2922 = _2920 + 1;
        _2918 = _2922;
    }
    int _2924 = _2918;
    bool _2926 = !_2916;
    int _2928 = _2926 ? 0 : (-1);
    int _2930 = abs(_2924);
    int _2932 = ~_2902;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    bool _2938 = !_2576;
    int _2940 = _2938 ? 0 : 1;
    int _2942 = abs(_2928);
    int _2944 = _2936 * as_type<int>(_2748);
    int _2946 = _2944 + _2904;
    int _2948 = abs(_2940);
    float _2950 = fma(_2914, -2.0, 3.0);
    int _2952 = ~_2930;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    float _2958 = _2914 * _2914;
    float _2960 = fma(_1776, _2269, _2818);
    int _2962 = ~_2942;
    int _2964 = _2962 + 1;
    int _2966 = _2964 + 1;
    int _2968 = _2956 * as_type<int>(_2790);
    int _2970 = _2968 + _2946;
    float _2972 = _2958 * _2950;
    int _2974 = ~_2948;
    int _2976 = _2974 + 1;
    int _2978 = _2976 + 1;
    float _2980 = _2148 * 0.5;
    int _2982 = _2966 * as_type<int>(_2798);
    int _2984 = _2982 + _2970;
    bool _2986 = !_2386;
    int _2988 = _2986 ? _2892 : (-1);
    float _2990 = -_2972;
    float _2992 = _2990 + 1.0;
    float _2994 = in.m_73.x;
    int _2996 = _2984 * _2978;
    float _2998 = _2194 + _2148;
    float _3000 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2972);
    float _3002 = fma(_2188, -0.5, _2980);
    int _3004 = _2988 * _2948;
    int _3006 = _3004 + _2996;
    float _3008 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2295);
    float _3010 = _2832 * _3000;
    float _3012 = fma(_1786, _2606, _2960);
    bool _3014 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3016 = isnan(_2082);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3022 = _3018 || _3020;
    float _3024 = _3008 + _2148;
    float _3026 = float(_3006);
    float _3028 = fma(_1772, _2606, _2834);
    float _3030 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3032 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2194;
    out.gl_Position.y = _2188;
    out.gl_Position.z = _3008;
    out.gl_Position.w = _2148;
    float _3034 = _2848 * _3030;
    float _3036 = precise::clamp(_3034, 0.0, 1.0);
    float _3038 = _3032 * _2226;
    out.m_75.z = _3026;
    float _3040 = -_3036;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3044 = _3024 * 0.5;
    float _3046 = _2247 * _3038;
    out.m_77.x = _2870;
    out.m_77.y = _3012;
    out.m_77.z = _3028;
    float _3048 = _3042 * _2994;
    float _3050 = _2998 * 0.5;
    float _3052 = fma(_2237, _3046, _2235);
    float _3054 = _3048 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3056 = _2237 * _3038;
    float _3058 = -_3032;
    float _3060 = _3058 + 1.0;
    out.m_79.x = _3050;
    out.m_79.y = _3002;
    out.m_79.z = _3044;
    out.m_79.w = _2148;
    float _3062 = _3008;
    float _3064 = _3056;
    float _3066 = _3060;
    float _3068 = _3002;
    float _3070 = _3050;
    if (!_3022)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3072 = _2518;
    float _3074 = fma(_2243, _3056, _2231);
    float _3076 = fma(_2245, _3056, _2233);
    float _3078 = _2237 * _3060;
    out.m_81.x = _3054;
    float _3080 = _3072;
    float _3082 = _3072;
    if (!_3022)
    {
        _3062 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3084 = _3062;
    float _3086 = _3084;
    float _3088 = _3084;
    if (!_3022)
    {
        _3064 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3090 = _3064;
    out.m_83.x = _3074;
    out.m_83.y = _3076;
    out.m_83.z = _3052;
    out.m_83.w = _3078;
    float _3092 = _3090;
    float _3094 = _3090;
    if (!_3022)
    {
        _3066 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3096 = _3066;
    float _3098 = _3096;
    float _3100 = _3096;
    if (!_3022)
    {
        _3068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3102 = _3068;
    float _3104 = _3102;
    float _3106 = _3102;
    if (!_3022)
    {
        _3070 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3108 = _3070;
    bool _3110 = !_3022;
    float _3112 = _3108;
    float _3114 = _3108;
    if (!_3110)
    {
        bool _3116 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3118 = isnan(_2082);
        bool _3120 = _3116 || _3118;
        bool _3122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3124 = _3120 || _3122;
        if (!_3124)
        {
            float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3128 = _2082 + _3126;
            float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3132 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3130;
            float _3134 = 1.0 / _3132;
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3156 = _3128 * _3134;
            float _3158 = precise::clamp(_3156, 0.0, 1.0);
            float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3164 = fma(_3158, _3138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3166 = fma(_3158, _3162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3168 = fma(_3158, _3142, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3170 = fma(_3158, _3146, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3172 = fma(_3158, _3150, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3174 = fma(_3158, _3154, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3114 = _3166;
            _3094 = _3172;
            _3106 = _3164;
            _3088 = _3170;
            _3082 = _3168;
            _3100 = _3174;
            _3176 = true;
        }
        else
        {
            bool _3178 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3180 = isnan(_2082);
            bool _3182 = _3178 || _3180;
            bool _3184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3186 = _3182 || _3184;
            if (!_3186)
            {
                _3104 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3188 = _3104;
            _3106 = _3188;
            if (!_3186)
            {
                _3112 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3190 = _3112;
            _3114 = _3190;
            if (!_3186)
            {
                _3080 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3192 = _3080;
            _3082 = _3192;
            if (!_3186)
            {
                _3086 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3194 = _3086;
            _3088 = _3194;
            if (!_3186)
            {
                _3092 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3196 = _3092;
            _3094 = _3196;
            if (!_3186)
            {
                _3098 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3198 = _3098;
            bool _3200 = !_3186;
            _3100 = _3198;
            if (!_3200)
            {
                bool _3202 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3204 = isnan(_2082);
                bool _3206 = _3202 || _3204;
                bool _3208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3210 = _3206 || _3208;
                if (!_3210)
                {
                    float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3214 = _2082 + _3212;
                    float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3216;
                    float _3220 = 1.0 / _3218;
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3242 = _3214 * _3220;
                    float _3244 = precise::clamp(_3242, 0.0, 1.0);
                    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3250 = fma(_3244, _3224, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3252 = fma(_3244, _3248, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3254 = fma(_3244, _3228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3256 = fma(_3244, _3232, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3258 = fma(_3244, _3236, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3260 = fma(_3244, _3240, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3114 = _3252;
                    _3094 = _3258;
                    _3106 = _3250;
                    _3088 = _3256;
                    _3082 = _3254;
                    _3100 = _3260;
                    _3176 = true;
                }
                else
                {
                    _3114 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3094 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3106 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3088 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3082 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3100 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3176 = false;
    float _3262 = _3114;
    float _3264 = _3094;
    float _3266 = _3106;
    float _3268 = _3088;
    float _3270 = _3082;
    float _3272 = _3100;
    float _3274 = fma(_3012, -0.5, 0.5);
    float _3276 = precise::clamp(_3274, 0.0, 1.0);
    float _3278 = -_3262;
    float _3280 = _3278 + _3264;
    float _3282 = -_3266;
    float _3284 = _3282 + _3268;
    float _3286 = -_3270;
    float _3288 = _3286 + _3272;
    bool _3290 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3292 = fma(_3276, _3280, _3262);
    float _3294 = fma(_3276, _3284, _3266);
    float _3296 = fma(_3276, _3288, _3270);
    float _3298 = _3292 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _3300 = fma(_3294, 0.298911988735198974609375, _3298);
    float _3302 = fma(_3296, 0.114477999508380889892578125, _3300);
    float _3304 = -_3302;
    float _3306 = _3294 + _3304;
    float _3308 = -_3302;
    float _3310 = _3292 + _3308;
    float _3312 = -_3302;
    float _3314 = _3296 + _3312;
    float _3316 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3318 = fma(_3306, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    float _3320 = fma(_3310, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    float _3322 = fma(_3314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    out.m_49.x = _3316;
    out.m_87.x = _3318;
    out.m_87.y = _3320;
    out.m_87.z = _3322;
    if (!_3290)
    {
        return out;
    }
    float _3324 = -_1890;
    float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3328 = -_1894;
    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3332 = -_1898;
    float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3336 = _3326 * _3326;
    float _3338 = fma(_3330, _3330, _3336);
    float _3340 = fma(_3334, _3334, _3338);
    float _3342 = sqrt(_3340);
    float _3344 = rsqrt(_3340);
    float _3346 = -_3342;
    float _3348 = _3346 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3350 = _3348 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3352 = precise::clamp(_3350, 0.0, 1.0);
    float _3354 = _3330 * _3344;
    float _3356 = _3326 * _3344;
    float _3358 = abs(_3352);
    float _3360 = log2(_3358);
    float _3362 = _3334 * _3344;
    float _3364 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3366 = _3012 * _3356;
    float _3368 = -_3356;
    float _3370 = -_3364;
    float _3372 = fma(_3368, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3370);
    float _3374 = fma(_2870, _3354, _3366);
    float _3376 = -_3362;
    float _3378 = fma(_3376, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3372);
    float _3380 = fma(_3028, _3362, _3374);
    float _3382 = precise::clamp(_3380, 0.0, 1.0);
    float _3384 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3386 = _3378 + _3384;
    float _3388 = _3360 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3390 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = exp2(_3388);
    float _3396 = _3394 * _3392;
    float _3398 = _3382 * _3396;
    float _3400 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3402 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3404 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _3400;
    out.m_85.y = _3402;
    out.m_85.z = _3404;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3176 = false;
    bool _636 = false;
    bool _506 = false;
    bool _352 = false;
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
        float _3461 = as_type<float>(_122);
        out.gl_Position.z = _3461;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_160);
        out.gl_Position.z = _3530;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _312 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _252, _308);
    float _322 = fma(_314, _252, _310);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_53.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_106);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _360 + _362;
    float _366 = in.m_55.x;
    float _368 = in.m_55.y;
    float _370 = in.m_55.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _376 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _378 = isnan(_360);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _392 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _394 = isnan(_360);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _404;
    bool _408 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _410 = isnan(_360);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _374;
    float _422 = -_386;
    float _424 = _422 + 1.0;
    bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _428 = _402 * _424;
    float _430 = -_402;
    float _432 = _430 + 1.0;
    float _434 = 1.0 / _390;
    float _436 = _406 * _420;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _442 = fma(_436, _364, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _328 * _368;
    float _446 = _440 * _434;
    float _448 = _442 * _428;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _360 + _454;
    float _458 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[115].x, _448);
    float _460 = _386 * _452;
    float _462 = fma(_446, _456, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = _326 * _366;
    float _468 = fma(_462, _460, _458);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[117].x, _468);
    float _476 = _330 * _370;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _484 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _472;
    out.m_57.y = _484;
    out.m_57.z = _480;
    out.m_57.w = _482;
    bool _486 = !_426;
    float _504;
    if (!_486)
    {
        float _488 = in.m_53.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_106);
        float _510 = 1.0 / _508;
        float _512 = _140 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _524 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _526 = isnan(_514);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _540 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _542 = isnan(_514);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _552;
    bool _556 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _558 = isnan(_514);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = 1.0 / _522;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _576 = _550 * _572;
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = 1.0 / _538;
    float _584 = _554 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _590 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _592 = _588 * _582;
    float _594 = _590 * _576;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _602 = _514 + _600;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[131].x, _594);
    float _606 = _534 * _598;
    float _608 = fma(_592, _602, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _610 = fma(_608, _606, _604);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[133].x, _610);
    float _614 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _614;
    bool _616 = !_574;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_106);
        float _640 = 1.0 / _638;
        float _642 = _140 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_53.x;
    float _648 = _140 * 0.119999997317790985107421875;
    float _650 = in.m_53.y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = in.m_61.x;
    float _662 = 1.0 / _654;
    float _664 = in.m_53.z;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _680 = in.m_46.x;
    float _682 = in.m_46.y;
    float _684 = in.m_46.z;
    float _686 = 1.0 / _668;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _690 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = _646 * 6.283185482025146484375;
    bool _694 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _696 = isnan(_644);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _674;
    float _708 = -_670;
    float _710 = fma(_690, 2.0, _708);
    float _712 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = fma(_648, _660, _692);
    float _716 = -_140;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[76].x, _710);
    float _720 = fma(_712, -2.0, _688);
    float _722 = 1.0 / _678;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _730 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _720);
    float _732 = _682 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _734 = _682 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _740 = _682 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _742 = 1.0 / _726;
    float _744 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[4].x, _732);
    float _746 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[5].x, _734);
    float _748 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[6].x, _740);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _762 = 1.0 / _738;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _768;
    float _772 = _664 * 2.0;
    float _774 = _752 * _706;
    float _776 = _766 * _686;
    float _778 = _650 * 2.0;
    float _780 = _756 * _722;
    float _782 = _646 * 2.0;
    float _784 = _650 + _664;
    float _786 = 1.0 / _760;
    float _788 = _770 * _662;
    float _790 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].z, _744);
    bool _792 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _794 = isnan(_644);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _806 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].z, _748);
    float _808 = floor(_778);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _820 = _644 + _818;
    float _822 = -_802;
    float _824 = _822 + 1.0;
    float _826 = _816 * _762;
    float _828 = floor(_772);
    float _830 = _784 + (-1.0);
    float _832 = _646 + _650;
    float _834 = fma(_776, _820, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _836 = _812 * _742;
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _840 = _832 + (-1.0);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _842;
    float _846 = floor(_782);
    float _848 = _646 + _664;
    float _850 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _852 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _854 = isnan(_644);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _844 * _786;
    float _866 = _848 + (-1.0);
    bool _868 = _808 > 0.0;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _872 = _808 >= 0.0;
    bool _874 = isnan(_808);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _644 + _884;
    bool _888 = _828 > 0.0;
    float _890 = -_704;
    float _892 = _890 + 1.0;
    bool _894 = _828 >= 0.0;
    bool _896 = isnan(_828);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = fma(_788, _886, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _906 = -_862;
    float _908 = _906 + 1.0;
    bool _910 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _912 = isnan(_644);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _924 = log2(_922);
    bool _926 = _846 > 0.0;
    float _928 = _802 * _908;
    bool _930 = _846 >= 0.0;
    bool _932 = isnan(_846);
    bool _934 = _930 || _932;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _942 = _644 + _940;
    bool _944 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _946 = isnan(_644);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _920 * _824;
    float _958 = -_920;
    float _960 = _958 + 1.0;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _964 = _644 + _962;
    bool _966 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = isnan(_644);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = fma(_774, _942, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _980 = _954 * _960;
    float _982 = fma(_780, _964, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _984 = -_954;
    float _986 = _984 + 1.0;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _644 + _988;
    bool _992 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _994 = isnan(_644);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_976;
    float _1006 = _1004 + 1.0;
    float _1008 = _976 * _986;
    float _1010 = fma(_836, _990, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1014 = _644 + _1012;
    bool _1016 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1018 = isnan(_644);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _1002 * _1006;
    float _1030 = _990;
    float _1032 = _834;
    float _1034 = _664;
    float _1036 = _730;
    if (_658)
    {
        _1030 = _646;
    }
    float _1038 = _1030;
    float _1040 = fma(_826, _1014, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1044 = _644 + _1042;
    float _1046 = _1038;
    if (!_658)
    {
        _1046 = _664;
    }
    float _1048 = _1046;
    float _1050 = _1026 * _892;
    float _1052 = -_1002;
    float _1054 = _1052 + 1.0;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1058 = fma(_864, _1044, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1062 = _904 * _1050;
    float _1064 = _704 * _1054;
    int _1066 = _902 ? 0 : 1;
    float _1068 = -_1056;
    float _1070 = fma(_1060, 2.0, _1068);
    float _1072 = _1056;
    float _1074 = _1048;
    if (!_658)
    {
        _1072 = _650;
    }
    float _1076 = _1072;
    float _1078 = -_1026;
    float _1080 = _1078 + 1.0;
    float _1082 = _1076;
    if (_658)
    {
        _1082 = _646;
    }
    float _1084 = _1082;
    float _1086 = _790 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_658)
    {
        _1074 = _664;
    }
    float _1088 = _1074;
    float _1090 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1062);
    int _1092 = _938 ? 0 : 1;
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[83].z, _728);
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1098 = ~_1066;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    float _1104 = fma(_834, _1064, _1090);
    int _1106 = _1102;
    float _1108 = _1088;
    if (!_888)
    {
        int _1110 = ~_1066;
        int _1112 = _1110 + 1;
        _1106 = _1112;
    }
    int _1114 = _1106;
    float _1116 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1118 = _880 ? 0 : 1;
    float _1120 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1094);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1132 = _1130 != 0;
    float _1134 = _804 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_658)
    {
        _1108 = _650;
    }
    float _1136 = _1108;
    float _1138 = fma(_140, -0.2199999988079071044921875, _714);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = _1116 + _1140;
    bool _1144 = !_1128;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[83].w, _870);
    bool _1150 = !_1124;
    int _1152 = _1150 ? 0 : 1;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1156 = !_1132;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1148);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1172 = _1170 != 0;
    float _1174 = _1136;
    if (!_658)
    {
        _1174 = _664;
    }
    float _1176 = _1174;
    float _1178 = _1176;
    if (_658)
    {
        _1178 = _650;
    }
    float _1180 = _1178;
    bool _1182 = !_1164;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = ~_1118;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1194 = _1190;
    if (!_868)
    {
        int _1196 = ~_1118;
        int _1198 = _1196 + 1;
        _1194 = _1198;
    }
    int _1200 = _1194;
    float _1202 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1204 = int(_1202);
    int _1206 = abs(_1184);
    float _1208 = fma(_1192, -2.0, _1154);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1086 + _1210;
    float _1214 = float(_1114);
    float _1216 = -_1116;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = float(_1206);
    float _1222 = _924 * _140;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1226 = _1218;
    if (_658)
    {
        _1032 = _650;
    }
    float _1228 = _1032;
    float _1230 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1208);
    float _1232 = _1228;
    if (!_658)
    {
        _1232 = _646;
    }
    float _1234 = _1232;
    float _1236 = -_1224;
    float _1238 = fma(_1096, 2.0, _1236);
    float _1240 = exp2(_1222);
    float _1242 = -_140;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    int _1246 = ~_1092;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    float _1252 = abs(_1212);
    float _1254 = abs(_1218);
    float _1256 = precise::max(_1252, _1254);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1260 = _1250;
    if (!_926)
    {
        int _1262 = ~_1092;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1270 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1272 = isnan(1.0);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1278 = _1274 || _1276;
    float _1280 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1282 = int(_1280);
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1286 = 1.0 + _1284;
    bool _1288 = _1256 >= 16.0;
    float _1290 = fma(_978, _1028, _1104);
    float _1292 = float(_1204);
    float _1294 = fma(_1268, -2.0, _1258);
    float _1296 = _1220 * _1214;
    float _1298 = 1.0 / _1292;
    float _1300 = fma(_982, _1008, _1290);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1314 = _1310 || _1312;
    float _1316 = 1.0 / _1286;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1320 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1302);
    float _1322 = -_1240;
    float _1324 = _1322 + 1.0;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1328 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1304);
    float _1330 = float(_1282);
    float _1332 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1318);
    float _1334 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1320);
    float _1336 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1326);
    float _1338 = _1314 ? _1324 : 0.0;
    float _1340 = _1296 * (-2.0);
    float _1342 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1332);
    float _1344 = -_140;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1070);
    bool _1348 = !_1172;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -_660;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[193].y, _140);
    float _1356 = _1330 * _140;
    float _1358 = _1298 * _140;
    float _1360 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1328);
    float _1362 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1336);
    float _1364 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1294);
    float _1366 = _646 + (-0.5);
    bool _1368 = _1278;
    if (_1278)
    {
        float _1370 = _1338 * _1316;
        _144 = _1370;
    }
    float _1372 = _144;
    float _1374 = fma(_850, _1340, _850);
    bool _1376 = !_1168;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1382 = _1134 + _1380;
    int _1384 = abs(_1350);
    float _1386 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1388 = _1138 * 0.15915493667125701904296875;
    int _1390 = abs(_1378);
    float _1392 = _1382 * _1382;
    float _1394 = float(_1384);
    float _1396 = _1212 * 0.0625;
    float _1398 = float(_1200);
    float _1400 = fma(_1212, _1212, _1392);
    float _1402 = fma(_1374, _1372, _1386);
    if (_1288)
    {
        float _1404 = _1218 * 0.0625;
        _1226 = _1404;
    }
    float _1406 = _1226;
    float _1408 = _1394 * _1398;
    float _1410 = fma(_1142, _1142, _1400);
    float _1412 = float(_1266);
    float _1414 = _664 + (-0.5);
    float _1416 = _1408 * (-2.0);
    float _1418 = float(_1390);
    float _1420 = rsqrt(_1410);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1424 = fma(_882, _1416, _882);
    float _1426 = _1288 ? _1396 : _1212;
    float _1428 = _1418 * _1412;
    float _1430 = in.m_63.x;
    float _1432 = in.m_63.y;
    float _1434 = fma(_1424, _1372, _1422);
    float _1436 = abs(_1426);
    bool _1438 = _1436 != 0.0;
    bool _1440 = isnan(_1436);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(0.0);
    bool _1446 = _1442 || _1444;
    float _1448 = _1402 * 0.15915493667125701904296875;
    float _1450 = abs(_1406);
    bool _1452 = _1450 == 0.0;
    float _1454 = _1434 * 0.15915493667125701904296875;
    float _1456 = abs(_1406);
    bool _1458 = _1456 == 0.0;
    bool _1460 = !_1446;
    bool _1462 = _1458 && _1460;
    float _1464 = _1428 * (-2.0);
    float _1466 = _1388 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1010, _980, _1300);
    float _1472 = _1382 * _1420;
    float _1474 = _1212 * _1420;
    float _1476 = fma(_838, _1464, _838);
    float _1478 = _650 + (-0.5);
    float _1480 = -_1472;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1382);
    float _1484 = -_1474;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1488 = _1448 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    float _1492 = _1142 * _1420;
    float _1494 = _1482 * _1482;
    int _1496 = as_type<int>(_1486);
    int _1498 = as_type<int>(_1476);
    float _1500 = _1474;
    if (_1462)
    {
        bool _1502 = as_type<int>(_1406) >= 0;
        _1368 = _1502;
    }
    bool _1504 = _1368;
    float _1506 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1508 = -_1492;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1512 = fma(_1486, _1486, _1494);
    int _1514 = _1504 ? (-1) : 0;
    if (_1462)
    {
        int _1516 = _1504 ? 0 : 1078530011;
        _1496 = _1516;
    }
    int _1518 = _1496;
    float _1520 = _1448 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = fma(_1476, _1372, _1506);
    float _1526 = fma(_1510, _1510, _1512);
    if (_1462)
    {
        int _1528 = int(0x80000000) & as_type<int>(_1426);
        int _1530 = _1518 | _1528;
        _1498 = _1530;
    }
    int _1532 = _1498;
    float _1534 = _1454 * 6.283185482025146484375;
    float _1536 = cos(_1534);
    bool _1538 = !_1446;
    bool _1540 = _1538 && _1452;
    int _1542 = _1532;
    float _1544 = as_type<float>(_1532);
    if (!_1540)
    {
        float _1546 = abs(_1426);
        bool _1548 = _1546 != as_type<float>(0x7f800000u /* inf */);
        bool _1550 = isnan(_1546);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1556 = _1552 || _1554;
        float _1558 = abs(_1406);
        bool _1560 = _1558 == as_type<float>(0x7f800000u /* inf */);
        float _1562 = abs(_1406);
        bool _1564 = _1562 == as_type<float>(0x7f800000u /* inf */);
        bool _1566 = !_1556;
        bool _1568 = _1564 && _1566;
        if (_1568)
        {
            bool _1570 = as_type<int>(_1406) >= 0;
            _1514 = _1570 ? (-1) : 0;
        }
        int _1572 = _1514;
        if (_1568)
        {
            _1542 = 1075235812;
        }
        int _1574 = _1542;
        int _1576 = _1574;
        if (_1568)
        {
            int _1578 = ~_1572;
            int _1580 = (_1578 != 0) ? _1574 : 1061752795;
            _1576 = _1580;
        }
        int _1582 = _1576;
        float _1584 = as_type<float>(_1582);
        if (_1568)
        {
            int _1586 = int(0x80000000) & as_type<int>(_1426);
            int _1588 = _1582 | _1586;
            _1584 = as_type<float>(_1588);
        }
        float _1590 = _1584;
        bool _1592 = !_1556;
        bool _1594 = _1592 && _1560;
        _1544 = _1590;
        if (!_1594)
        {
            float _1596 = abs(_1406);
            float _1598 = abs(_1426);
            float _1600 = precise::max(_1596, _1598);
            float _1602 = abs(_1406);
            float _1604 = abs(_1426);
            float _1606 = precise::min(_1602, _1604);
            float _1608 = 1.0 / _1600;
            float _1610 = abs(_1426);
            float _1612 = abs(_1406);
            bool _1614 = _1610 > _1612;
            bool _1616 = as_type<int>(_1406) >= 0;
            float _1618 = _1606 * _1608;
            float _1620 = _1618 * _1618;
            float _1622 = _1620 + 11.33538818359375;
            float _1624 = fma(_1620, _1622, 28.84246826171875);
            float _1626 = fma(_1620, _1624, 19.6966705322265625);
            float _1628 = fma(_1620, -0.82336294651031494140625, -5.674867153167724609375);
            float _1630 = fma(_1620, _1628, -6.565555095672607421875);
            float _1632 = 1.0 / _1626;
            float _1634 = _1620 * _1630;
            float _1636 = abs(_1406);
            float _1638 = abs(_1426);
            float _1640 = _1636 + _1638;
            int _1642 = as_type<int>(_1426) & int(0x80000000);
            float _1644 = _1618 * _1634;
            bool _1646 = _1640 > as_type<float>(0x7f800000u /* inf */);
            bool _1648 = isnan(_1640);
            bool _1650 = _1646 || _1648;
            bool _1652 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1654 = _1650 || _1652;
            float _1656 = fma(_1644, _1632, _1618);
            float _1658 = _1656;
            _1544 = _1640;
            if (_1614)
            {
                float _1660 = -_1656;
                float _1662 = _1660 + 1.57079637050628662109375;
                _1658 = _1662;
            }
            float _1664 = _1658;
            int _1666 = as_type<int>(_1664);
            if (!_1616)
            {
                float _1668 = -_1664;
                float _1670 = _1668 + 3.1415927410125732421875;
                _1666 = as_type<int>(_1670);
            }
            int _1672 = _1666;
            if (!_1654)
            {
                int _1674 = _1642 | _1672;
                _1544 = as_type<float>(_1674);
            }
        }
    }
    float _1676 = _1544;
    float _1678 = fma(_1040, _956, _1470);
    float _1680 = sqrt(_1526);
    float _1682 = precise::max(0.0, _1354);
    float _1684 = in.m_63.z;
    float _1686 = fma(_1058, _928, _1678);
    float _1688 = -_1676;
    float _1690 = _1524 + _1688;
    float _1692 = precise::min(_1682, 1000.0);
    float _1694 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1696 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1686);
    float _1698 = _1690 * 0.15915493667125701904296875;
    float _1700 = _1454 * 6.283185482025146484375;
    float _1702 = sin(_1700);
    float _1704 = _1692 * 0.100000001490116119384765625;
    float _1706 = _1696 * _1468;
    float _1708 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1710 = _1704 * _1704;
    float _1712 = fma(_1706, _660, _1430);
    float _1714 = _1420 * _1680;
    float _1716 = _1698 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = -_1710;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1432);
    float _1724 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1726 = _1714 * _1694;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1712);
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1722);
    float _1732 = _1714 * _1724;
    float _1734 = _1714 * _1708;
    float _1736 = _1698 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1726 * _1728;
    float _1742 = _1732 * _1730;
    float _1744 = _1490 * _1536;
    float _1746 = _1744 * _1742;
    float _1748 = _1522 * _1718;
    float _1750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1684);
    float _1752 = _1734 * _1750;
    float _1754 = _1490 * _1718;
    float _1756 = -_1742;
    float _1758 = _1702 * _1756;
    float _1760 = _1490 * _1738;
    float _1762 = _1522 * _1738;
    float _1764 = _1738 * _1536;
    float _1766 = _1718 * _1536;
    float _1768 = -_1748;
    float _1770 = fma(_1702, _1760, _1768);
    float _1772 = fma(_1702, _1754, _1762);
    float _1774 = _1522 * _1536;
    float _1776 = fma(_1702, _1762, _1754);
    float _1778 = fma(_1770, _1740, _1746);
    float _1780 = fma(_1764, _1740, _1758);
    float _1782 = _1774 * _1742;
    float _1784 = -_1760;
    float _1786 = fma(_1702, _1748, _1784);
    float _1788 = fma(_1772, _1752, _1778);
    float _1790 = fma(_1766, _1752, _1780);
    float _1792 = fma(_1776, _1740, _1782);
    float _1794 = _1116 + _1788;
    float _1796 = _1086 + _1790;
    float _1798 = fma(_1786, _1752, _1792);
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1802 = _1794 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1806 = _1796 + _1804;
    float _1808 = _1134 + _1798;
    float _1810 = _1802 * _1802;
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = sqrt(_1812);
    bool _1816 = _1814 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1818 = _1798;
    float _1820 = _1754;
    float _1822 = _1740;
    float _1824 = _1748;
    float _1826 = _1808;
    float _1828 = _1752;
    if (!_1816)
    {
        _1818 = _1796;
    }
    float _1830 = _1818;
    float _1832 = _1830;
    if (!_1816)
    {
        _1820 = _1794;
    }
    float _1834 = _1820;
    float _1836 = _1834;
    if (!_1816)
    {
        _1822 = _1808;
    }
    float _1838 = _1822;
    bool _1840 = !_1816;
    float _1842 = _1838;
    if (!_1840)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1848 = _1814 + _1846;
        float _1850 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = rsqrt(_1812);
        float _1854 = _1848 * _1844;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = _1856 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = fma(_1860, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1868 = _1852 * _1866;
        float _1870 = _1864 + (-1.0);
        float _1872 = fma(_1806, _1868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1874 = fma(_1802, _1868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1876 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1878 = fma(_1808, _1864, _1876);
        _1842 = _1878;
        _1832 = _1872;
        _1836 = _1874;
        _1824 = _1856;
    }
    float _1880 = _1842;
    float _1882 = _1832;
    float _1884 = _1836;
    float _1886 = _1824;
    float _1888 = -_1472;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1880);
    float _1892 = -_1474;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1882);
    float _1896 = -_1492;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1884);
    float _1900 = -_1474;
    float _1902 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1906 = _1890 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1910 = _1894 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1914 = _1898 + _1912;
    float _1916 = -_1492;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1920 = _1906 * _1906;
    float _1922 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1924 = fma(_1910, _1910, _1920);
    float _1926 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1922);
    float _1928 = fma(_1914, _1914, _1924);
    float _1930 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1932 = rsqrt(_1928);
    float _1934 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1936 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1938 = _1910 * _1936;
    float _1940 = _1914 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 * _1940;
    float _1946 = _1942 + _1944;
    float _1948 = sqrt(_1946);
    bool _1950 = _1948 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1954 = _1948 + _1952;
    float _1956 = _1886;
    float _1958 = _1954;
    float _1960 = _1906;
    float _1962 = _1938;
    float _1964 = _1940;
    float _1966 = _1942;
    if (_1950)
    {
        float _1968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _1968;
    }
    float _1970 = _1956;
    if (_1950)
    {
        float _1972 = rsqrt(_1946);
        _1826 = _1972;
    }
    float _1974 = _1826;
    float _1976 = _1974;
    if (_1950)
    {
        float _1978 = _1954 * _1970;
        _1958 = _1978;
    }
    float _1980 = _1958;
    float _1982 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1950)
    {
        float _1984 = _1980 * 0.15915493667125701904296875;
        _1828 = _1984;
    }
    float _1986 = _1828;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = _1882;
    float _1992 = _1986;
    if (_1950)
    {
        float _1994 = _1986 * 6.283185482025146484375;
        float _1996 = sin(_1994);
        _1990 = _1996;
    }
    float _1998 = _1990;
    float _2000 = precise::max(0.0, _1988);
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1950)
    {
        float _2004 = _1986 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        _2002 = _2006;
    }
    float _2008 = _2002;
    float _2010 = -_1936;
    float _2012 = -_2000;
    float _2014 = fma(_1906, _2010, _2012);
    if (_1950)
    {
        float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1960 = _2016;
    }
    float _2018 = _1960;
    float _2020 = _1998;
    if (_1950)
    {
        float _2022 = fma(_1998, _2018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2028 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _2030 = _2024;
    if (_1950)
    {
        float _2032 = _1974 * _2024;
        _1500 = _2032;
    }
    float _2034 = _1500;
    if (!_1950)
    {
        _2030 = _2014;
    }
    float _2036 = _2030;
    float _2038 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2040 = _2036;
    float _2042 = _2008;
    if (_1950)
    {
        float _2044 = _2008 + (-1.0);
        _1976 = _2044;
    }
    float _2046 = _1976;
    if (_1950)
    {
        float _2048 = _1938 * _2034;
        _1962 = _2048;
    }
    float _2050 = _1962;
    if (_1950)
    {
        float _2052 = _1940 * _2034;
        _1964 = _2052;
    }
    float _2054 = _1964;
    float _2056 = floor(_2026);
    if (_1950)
    {
        float _2058 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2058;
    }
    float _2060 = _1992;
    if (_1950)
    {
        float _2062 = _2050 * _2050;
        _1966 = _2062;
    }
    float _2064 = _1966;
    if (_1950)
    {
        float _2066 = fma(_2014, _2008, _2060);
        _2040 = _2066;
    }
    float _2068 = _2040;
    if (!_1950)
    {
        _2042 = _1944;
    }
    float _2070 = _2042;
    float _2072 = _2070;
    if (_1950)
    {
        float _2074 = _2054 * _2054;
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = fma(_2068, _2068, _2064);
    float _2080 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2082 = sqrt(_1928);
    float _2084 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2086 = _2078 + _2076;
    float _2088 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2090 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2084);
    float _2092 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = floor(_2080);
    float _2096 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2090);
    float _2100 = -_2092;
    float _2102 = fma(_2100, _2088, 1.0);
    float _2104 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2106 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2108 = rsqrt(_2086);
    float _2110 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2104);
    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2114 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2112);
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2120 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2122 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2124 = -_2116;
    float _2126 = _2124 + 1.0;
    float _2128 = log2(_2102);
    float _2130 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2118);
    float _2132 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = -_2094;
    float _2136 = _2080 + _2134;
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2120);
    float _2140 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2130);
    float _2142 = abs(_2126);
    float _2144 = log2(_2142);
    float _2146 = _2108 * _2050;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2140);
    float _2150 = _2108 * _2068;
    float _2152 = _2108 * _2054;
    float _2154 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2156 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2138);
    float _2158 = 1.0 / _2148;
    float _2160 = -_2154;
    float _2162 = fma(_2150, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2160);
    float _2164 = -_2056;
    float _2166 = _2026 + _2164;
    float _2168 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2170 = _2128 * 0.693147182464599609375;
    float _2172 = -_2152;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2162);
    float _2176 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2168);
    float _2178 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2180 = fma(_2174, -0.5, 0.5);
    float _2182 = fma(_2174, 0.5, 0.5);
    float _2184 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2176);
    float _2186 = _2150 + 1.0;
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2156);
    float _2190 = exp2(_2178);
    float _2192 = fma(_2182, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2194 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2184);
    float _2196 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = fma(_2182, _2192, -0.212114393711090087890625);
    float _2200 = _2194 * _2158;
    float _2202 = _2188 * _2158;
    float _2204 = sqrt(_2180);
    float _2206 = fma(_2182, _2198, 1.570728778839111328125);
    float _2208 = fma(_2202, -0.5, 0.5);
    float _2210 = -_2150;
    float _2212 = fma(_2190, _2186, _2210);
    float2 _6766 = float2(_2166, _2136);
    float _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6766, float2(0.0), isnan(_6766)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6766, float2(0.0), isnan(_6766)), level(0.0)).x;
    float _2216 = fma(_2212, 0.5, 0.5);
    float _2218 = _2204 * 0.636619746685028076171875;
    float _2220 = fma(_2200, 0.5, 0.5);
    float _2222 = -_2206;
    float _2224 = fma(_2218, _2222, 1.0);
    float3 _6789 = float3(_2220, _2208, _2196);
    float _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6789, float3(0.0), isnan(_6789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6789, float3(0.0), isnan(_6789)), level(0.0)).x;
    float3 _6800 = float3(_2220, _2208, _2196);
    float4 _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6800, float3(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6800, float3(0.0), isnan(_6800)), level(0.0)).xyzw;
    float _2231 = _2229.x;
    float _2233 = _2229.y;
    float _2235 = _2229.z;
    float _2237 = _2229.w;
    float2 _6816 = float2(_2224, _2216);
    float3 _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6816, float2(0.0), isnan(_6816)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6816, float2(0.0), isnan(_6816)), level(0.0)).xyz;
    float _2243 = _2241.x;
    float _2245 = _2241.y;
    float _2247 = _2241.z;
    float _2249 = float(uint(_1282));
    float _2251 = trunc(_1358);
    int _2253 = int(_2251);
    float _2255 = float(_106);
    float _2257 = -_1472;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1134);
    int _2261 = ~_1282;
    int _2263 = _2261 + 1;
    float _2265 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2267 = abs(_1146);
    float _2269 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2271 = ~_1282;
    int _2273 = _2271 + 1;
    float _2275 = 1.0 / _2249;
    int _2277 = abs(_1152);
    float _2279 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2281 = abs(_1158);
    bool _2283 = _650 > 0.5;
    float _2285 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    int _2287 = ~_1282;
    int _2289 = _2287 + 1;
    float _2291 = 1.0 / _2255;
    float _2293 = float(uint(_2253));
    float _2295 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2285);
    float _2297 = float(_2253);
    bool _2299 = !_658;
    float _2301 = _2299 ? 5.839270114898681640625 : 1.0;
    float _2303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2305 = as_type<int>(_2275) + (-2);
    float _2307 = as_type<float>(_2305) * _2293;
    float _2309 = _1356 * _2291;
    float _2311 = exp2(_2265);
    float _2313 = trunc(_2307);
    float _2315 = precise::max(_2313, 0.0);
    uint _2318 = uint(_2315);
    float _2320 = trunc(_2309);
    int _2322 = int(_2320);
    float _2324 = -_2311;
    float _2326 = _2324 + 1.0;
    int _2328 = _2263 * int(_2318);
    int _2330 = _2328 + _2253;
    int _2332 = _1282 + (-1);
    float _2334 = float(uint(_2330));
    float _2336 = as_type<float>(_2305) * _2334;
    bool _2338 = !_658;
    float _2340 = _2338 ? _664 : _646;
    float _2342 = trunc(_2336);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = _2340 * _2301;
    float _2350 = floor(_2348);
    int _2352 = int(_2318) + int(_2346);
    bool _2354 = _2297 >= _1330;
    bool _2356 = isnan(_2297);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(_1330);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    int _2366 = _2273 * _2352;
    int _2368 = _2366 + _2253;
    float _2370 = trunc(_2364);
    int _2372 = int(_2370);
    float _2374 = -_2350;
    float _2376 = _2348 + _2374;
    bool _2378 = uint(_2368) >= uint(_1282);
    float _2380 = _2376 * _1330;
    bool _2382 = !_2378;
    int _2384 = _2382 ? 0 : (-1);
    bool _2386 = _1282 == 0;
    int _2388 = ~_2352;
    int _2390 = _2388 + _2384;
    int _2392 = _2390 + 1;
    float _2394 = trunc(_2380);
    int _2396 = int(_2394);
    int _2398 = _1282 * _2392;
    int _2400 = _2398 + _2253;
    int _2402 = ~_2372;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2410 = _2408 != 0;
    bool _2412 = !_2386;
    int _2414 = _2412 ? _2400 : (-1);
    bool _2416 = !_2410;
    int _2418 = _2416 ? 0 : 1;
    int _2420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2422 = _2420 != 0;
    int _2424 = _2414 * _2406;
    int _2426 = abs(_2418);
    int _2428 = ~_1282;
    int _2430 = _2428 + 1;
    int _2432 = _2372 * _2332;
    int _2434 = _2432 + _2424;
    bool _2436 = !_2422;
    int _2438 = _2436 ? 0 : 1;
    int _2440 = _2396 * _2426;
    int _2442 = _2440 + _2253;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2446 = _2444 != 0;
    int _2448 = _2434 * _2267;
    int _2450 = abs(_2438);
    float _2452 = in.m_65.y;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2456 = _2454 != 0;
    int _2458 = _2322 * _2277;
    int _2460 = _2458 + _2448;
    bool _2462 = _664 > 0.5;
    float _2464 = in.m_53.w;
    int _2466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2468 = _2466 != 0;
    int _2470 = _2442 * _2281;
    int _2472 = _2470 + _2460;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2476 = _2474 != 0;
    int _2478 = _2396 * _2450;
    int _2480 = _2478 + _2472;
    float _2482 = in.m_65.x;
    float _2484 = float(uint(_2480));
    float _2486 = in.m_61.w;
    float _2488 = as_type<float>(_2305) * _2484;
    float _2490 = trunc(_2488);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    float _2496 = -_2452;
    float _2498 = _2496 + 1.0;
    int _2500 = _2283 ? as_type<int>(_2498) : as_type<int>(_2452);
    int _2502 = _2462 ? as_type<int>(_2498) : as_type<int>(_2452);
    float _2504 = _2446 ? as_type<float>(_2500) : _2452;
    bool _2506 = _2464 > 0.5;
    float _2508 = _2476 ? as_type<float>(_2502) : _2452;
    int _2510 = _2430 * int(_2494);
    int _2512 = _2510 + _2480;
    bool _2514 = _2476;
    float _2516 = _2452;
    float _2518 = _2148;
    if (_2456)
    {
        bool _2520 = _646 > 0.5;
        _2514 = _2520;
    }
    bool _2522 = _2514;
    out.m_67.w = _2486;
    if (!_2456)
    {
        _1034 = _2482;
    }
    float _2524 = _1034;
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2528 = float(uint(_2512));
    float _2530 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    int _2532 = as_type<int>(_2528);
    float _2534 = _2524;
    if (_2468)
    {
        float _2536 = _2506 ? _2498 : _2452;
        _2516 = _2536;
    }
    float _2538 = _2516;
    int _2540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2542 = _2540 != 0;
    float _2544 = as_type<float>(_2305) * _2528;
    if (_2456)
    {
        float _2546 = -_2482;
        float _2548 = _2546 + 1.0;
        _2532 = as_type<int>(_2548);
    }
    int _2550 = _2532;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2554 = _2552 != 0;
    float _2556 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2558 = trunc(_2544);
    float _2560 = precise::max(_2558, 0.0);
    uint _2562 = uint(_2560);
    float _2564 = -_1364;
    float _2566 = fma(_1362, _2530, _2564);
    if (_2456)
    {
        float _2568 = _2522 ? as_type<float>(_2550) : _2482;
        _2534 = _2568;
    }
    float _2570 = _2534;
    float _2572 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2576 = _2574 != 0;
    float _2578 = _2566 + 0.5;
    float _2580 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2572);
    float _2582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2584 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2556);
    float _2586 = float(uint(_2442));
    float _2588 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2580);
    int _2590 = ~_1282;
    int _2592 = _2590 + 1;
    float _2594 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2584);
    float _2596 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2598 = int(_2494) + int(_2562);
    float _2600 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2602 = _2594 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2604 = as_type<float>(_2305) * _2586;
    float _2606 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _2608 = _2289 * _2598;
    int _2610 = _2608 + _2480;
    float _2612 = fma(_2600, _2504, -0.5);
    float _2614 = _2602 + _2596;
    float _2616 = trunc(_2604);
    float _2618 = precise::max(_2616, 0.0);
    uint _2620 = uint(_2618);
    bool _2622 = uint(_2610) >= uint(_1282);
    float _2624 = _2582 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2626 = -_730;
    float _2628 = fma(_1334, _2612, _2626);
    float _2630 = _2624;
    int _2632 = _2598;
    if (!_2554)
    {
        _1036 = _2482;
    }
    float _2634 = _1036;
    bool _2636 = !_2622;
    int _2638 = _2636 ? 0 : (-1);
    float _2640 = 1.0 / _2596;
    float _2642 = fma(_2624, _2538, -0.5);
    float _2644 = _2634;
    if (!_2542)
    {
        _2630 = _2482;
    }
    float _2646 = _2630;
    int _2648 = ~_2598;
    int _2650 = _2648 + _2638;
    int _2652 = _2650 + 1;
    float _2654 = _2646;
    if (_2542)
    {
        float _2656 = -_2482;
        float _2658 = _2656 + 1.0;
        _2632 = as_type<int>(_2658);
    }
    int _2660 = _2632;
    float _2662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2664 = _1282 * _2652;
    int _2666 = _2664 + _2480;
    int _2668 = _2660;
    if (_2542)
    {
        float _2670 = _2462 ? as_type<float>(_2660) : _2482;
        _2654 = _2670;
    }
    float _2672 = _2654;
    if (_2554)
    {
        float _2674 = -_2482;
        float _2676 = _2674 + 1.0;
        _2668 = as_type<int>(_2676);
    }
    int _2678 = _2668;
    int _2680 = _2592 * int(_2620);
    int _2682 = _2680 + _2442;
    bool _2684 = !_2386;
    int _2686 = _2684 ? _2666 : (-1);
    if (_2554)
    {
        float _2688 = _2283 ? as_type<float>(_2678) : _2482;
        _2644 = _2688;
    }
    float _2690 = _2644;
    float _2692 = _2614 * _2640;
    float _2694 = _2692 * 0.5;
    int _2696 = _2686 >> 31;
    float _2698 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2700 = float(uint(_2682));
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2704 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2702);
    int _2706 = _2696 & 3;
    float _2708 = fma(_2698, _2570, -0.5);
    float _2710 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2712 = 1.0 / _2704;
    int _2714 = _2686 + _2706;
    float _2716 = fma(_1342, _2708, _718);
    float _2718 = fma(_2710, _2672, -0.5);
    float _2720 = -_1230;
    float _2722 = fma(_1160, _2642, _2720);
    int _2724 = _2714 >> 2;
    float _2726 = _2628 + 0.5;
    float _2728 = fma(_1120, _2718, _1244);
    float _2730 = fma(_2690, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _2732 = _2724 << 4;
    int _2734 = _2732 + 656;
    float _2736 = as_type<float>(_2305) * _2700;
    float _2738 = _2716 + 0.5;
    float _2740 = _2728 + 0.5;
    uint _2742 = uint(int(uint(_2734) >> uint(2)));
    uint _2744 = uint(int(uint(int(_2742)) >> uint(2)));
    int _2746 = int(_2742) & 3;
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[int(_2744)][_2746];
    int _2750 = int(_2742) + 1;
    uint _2752 = uint(int(uint(_2750) >> uint(2)));
    int _2754 = _2750 & 3;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[int(_2752)][_2754];
    float _2758 = trunc(_2736);
    float _2760 = precise::max(_2758, 0.0);
    uint _2762 = uint(_2760);
    float _2764 = fma(_1360, _2730, _1346);
    float _2766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2768 = _2712 * _2766;
    float _2770 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2772 = _2686 & 3;
    bool _2774 = _2772 != 0;
    float _2776 = _2722 + 0.5;
    int _2778 = ~_1282;
    int _2780 = _2778 + 1;
    int _2782 = _2734 + 8;
    uint _2784 = uint(int(uint(_2782) >> uint(2)));
    uint _2786 = uint(int(uint(int(_2784)) >> uint(2)));
    int _2788 = int(_2784) & 3;
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[int(_2786)][_2788];
    int _2792 = int(_2784) + 1;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    int _2796 = _2792 & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    float _2800 = abs(_2768);
    float _2802 = log2(_2800);
    bool _2804 = uint(_2772) > 1u;
    out.m_69.x = _2738;
    out.m_69.y = _2726;
    out.m_69.z = _2740;
    out.m_69.w = _2776;
    int _2806 = _2686 & 3;
    bool _2808 = _2806 != 0;
    float _2810 = _2764 + 0.5;
    float _2812 = _1744 * _2770;
    float _2814 = -_2770;
    float _2816 = _1702 * _2814;
    float _2818 = _1774 * _2770;
    int _2820 = int(_2620) + int(_2762);
    out.m_71.x = _2810;
    out.m_71.y = _2578;
    bool _2822 = _2768 <= 8000.0;
    bool _2824 = isnan(_2768);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan(8000.0);
    bool _2830 = _2826 || _2828;
    float _2832 = float(_2830);
    float _2834 = fma(_1770, _2269, _2812);
    int _2836 = _2780 * _2820;
    int _2838 = _2836 + _2442;
    int _2840 = _2808 ? 0 : 1;
    float _2842 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2844 = uint(_2838) >= uint(_1282);
    float _2846 = -_2214;
    float _2848 = _2846 + 1.0;
    int _2850 = ~_2840;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = fma(_1764, _2269, _2816);
    int _2858 = _2854;
    if (!_2804)
    {
        int _2860 = ~_2840;
        int _2862 = _2860 + 1;
        _2858 = _2862;
    }
    int _2864 = _2858;
    float _2866 = exp2(_2842);
    bool _2868 = _2772 != 3;
    float _2870 = fma(_1766, _2606, _2856);
    bool _2872 = !_2844;
    int _2874 = _2872 ? 0 : (-1);
    bool _2876 = uint(_2772) >= 2u;
    int _2878 = ~_2820;
    int _2880 = _2878 + _2874;
    int _2882 = _2880 + 1;
    int _2884 = abs(_2864);
    bool _2886 = !_2774;
    int _2888 = _2886 ? 0 : 1;
    int _2890 = _1282 * _2882;
    int _2892 = _2890 + _2442;
    int _2894 = _2876 ? 0 : 1;
    int _2896 = ~_2884;
    int _2898 = _2896 + 1;
    int _2900 = _2898 + 1;
    int _2902 = abs(_2888);
    int _2904 = _2900 * as_type<int>(_2756);
    int _2906 = ~_2894;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    float _2912 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    bool _2916 = _2772 != 3;
    int _2918 = _2910;
    if (_2868)
    {
        int _2920 = ~_2894;
        int _2922 = _2920 + 1;
        _2918 = _2922;
    }
    int _2924 = _2918;
    bool _2926 = !_2916;
    int _2928 = _2926 ? 0 : (-1);
    int _2930 = abs(_2924);
    int _2932 = ~_2902;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    bool _2938 = !_2576;
    int _2940 = _2938 ? 0 : 1;
    int _2942 = abs(_2928);
    int _2944 = _2936 * as_type<int>(_2748);
    int _2946 = _2944 + _2904;
    int _2948 = abs(_2940);
    float _2950 = fma(_2914, -2.0, 3.0);
    int _2952 = ~_2930;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    float _2958 = _2914 * _2914;
    float _2960 = fma(_1776, _2269, _2818);
    int _2962 = ~_2942;
    int _2964 = _2962 + 1;
    int _2966 = _2964 + 1;
    int _2968 = _2956 * as_type<int>(_2790);
    int _2970 = _2968 + _2946;
    float _2972 = _2958 * _2950;
    int _2974 = ~_2948;
    int _2976 = _2974 + 1;
    int _2978 = _2976 + 1;
    float _2980 = _2148 * 0.5;
    int _2982 = _2966 * as_type<int>(_2798);
    int _2984 = _2982 + _2970;
    bool _2986 = !_2386;
    int _2988 = _2986 ? _2892 : (-1);
    float _2990 = -_2972;
    float _2992 = _2990 + 1.0;
    float _2994 = in.m_73.x;
    int _2996 = _2984 * _2978;
    float _2998 = _2194 + _2148;
    float _3000 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2972);
    float _3002 = fma(_2188, -0.5, _2980);
    int _3004 = _2988 * _2948;
    int _3006 = _3004 + _2996;
    float _3008 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2295);
    float _3010 = _2832 * _3000;
    float _3012 = fma(_1786, _2606, _2960);
    bool _3014 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3016 = isnan(_2082);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3022 = _3018 || _3020;
    float _3024 = _3008 + _2148;
    float _3026 = float(_3006);
    float _3028 = fma(_1772, _2606, _2834);
    float _3030 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3032 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2194;
    out.gl_Position.y = _2188;
    out.gl_Position.z = _3008;
    out.gl_Position.w = _2148;
    float _3034 = _2848 * _3030;
    float _3036 = precise::clamp(_3034, 0.0, 1.0);
    float _3038 = _3032 * _2226;
    out.m_75.z = _3026;
    float _3040 = -_3036;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3044 = _3024 * 0.5;
    float _3046 = _2247 * _3038;
    out.m_77.x = _2870;
    out.m_77.y = _3012;
    out.m_77.z = _3028;
    float _3048 = _3042 * _2994;
    float _3050 = _2998 * 0.5;
    float _3052 = fma(_2237, _3046, _2235);
    float _3054 = _3048 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3056 = _2237 * _3038;
    float _3058 = -_3032;
    float _3060 = _3058 + 1.0;
    out.m_79.x = _3050;
    out.m_79.y = _3002;
    out.m_79.z = _3044;
    out.m_79.w = _2148;
    float _3062 = _3008;
    float _3064 = _3056;
    float _3066 = _3060;
    float _3068 = _3002;
    float _3070 = _3050;
    if (!_3022)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3072 = _2518;
    float _3074 = fma(_2243, _3056, _2231);
    float _3076 = fma(_2245, _3056, _2233);
    float _3078 = _2237 * _3060;
    out.m_81.x = _3054;
    float _3080 = _3072;
    float _3082 = _3072;
    if (!_3022)
    {
        _3062 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3084 = _3062;
    float _3086 = _3084;
    float _3088 = _3084;
    if (!_3022)
    {
        _3064 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3090 = _3064;
    out.m_83.x = _3074;
    out.m_83.y = _3076;
    out.m_83.z = _3052;
    out.m_83.w = _3078;
    float _3092 = _3090;
    float _3094 = _3090;
    if (!_3022)
    {
        _3066 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3096 = _3066;
    float _3098 = _3096;
    float _3100 = _3096;
    if (!_3022)
    {
        _3068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3102 = _3068;
    float _3104 = _3102;
    float _3106 = _3102;
    if (!_3022)
    {
        _3070 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3108 = _3070;
    bool _3110 = !_3022;
    float _3112 = _3108;
    float _3114 = _3108;
    if (!_3110)
    {
        bool _3116 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3118 = isnan(_2082);
        bool _3120 = _3116 || _3118;
        bool _3122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3124 = _3120 || _3122;
        if (!_3124)
        {
            float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3128 = _2082 + _3126;
            float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3132 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3130;
            float _3134 = 1.0 / _3132;
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3156 = _3128 * _3134;
            float _3158 = precise::clamp(_3156, 0.0, 1.0);
            float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3164 = fma(_3158, _3138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3166 = fma(_3158, _3162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3168 = fma(_3158, _3142, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3170 = fma(_3158, _3146, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3172 = fma(_3158, _3150, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3174 = fma(_3158, _3154, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3114 = _3166;
            _3094 = _3172;
            _3106 = _3164;
            _3088 = _3170;
            _3082 = _3168;
            _3100 = _3174;
            _3176 = true;
        }
        else
        {
            bool _3178 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3180 = isnan(_2082);
            bool _3182 = _3178 || _3180;
            bool _3184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3186 = _3182 || _3184;
            if (!_3186)
            {
                _3104 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3188 = _3104;
            _3106 = _3188;
            if (!_3186)
            {
                _3112 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3190 = _3112;
            _3114 = _3190;
            if (!_3186)
            {
                _3080 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3192 = _3080;
            _3082 = _3192;
            if (!_3186)
            {
                _3086 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3194 = _3086;
            _3088 = _3194;
            if (!_3186)
            {
                _3092 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3196 = _3092;
            _3094 = _3196;
            if (!_3186)
            {
                _3098 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3198 = _3098;
            bool _3200 = !_3186;
            _3100 = _3198;
            if (!_3200)
            {
                bool _3202 = _2082 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3204 = isnan(_2082);
                bool _3206 = _3202 || _3204;
                bool _3208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3210 = _3206 || _3208;
                if (!_3210)
                {
                    float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3214 = _2082 + _3212;
                    float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3216;
                    float _3220 = 1.0 / _3218;
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3242 = _3214 * _3220;
                    float _3244 = precise::clamp(_3242, 0.0, 1.0);
                    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3250 = fma(_3244, _3224, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3252 = fma(_3244, _3248, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3254 = fma(_3244, _3228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3256 = fma(_3244, _3232, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3258 = fma(_3244, _3236, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3260 = fma(_3244, _3240, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3114 = _3252;
                    _3094 = _3258;
                    _3106 = _3250;
                    _3088 = _3256;
                    _3082 = _3254;
                    _3100 = _3260;
                    _3176 = true;
                }
                else
                {
                    _3114 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3094 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3106 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3088 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3082 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3100 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3176 = false;
    float _3262 = _3114;
    float _3264 = _3094;
    float _3266 = _3106;
    float _3268 = _3088;
    float _3270 = _3082;
    float _3272 = _3100;
    float _3274 = fma(_3012, -0.5, 0.5);
    float _3276 = precise::clamp(_3274, 0.0, 1.0);
    float _3278 = -_3262;
    float _3280 = _3278 + _3264;
    float _3282 = -_3266;
    float _3284 = _3282 + _3268;
    float _3286 = -_3270;
    float _3288 = _3286 + _3272;
    bool _3290 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3292 = fma(_3276, _3280, _3262);
    float _3294 = fma(_3276, _3284, _3266);
    float _3296 = fma(_3276, _3288, _3270);
    float _3298 = _3292 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _3300 = fma(_3294, 0.298911988735198974609375, _3298);
    float _3302 = fma(_3296, 0.114477999508380889892578125, _3300);
    float _3304 = -_3302;
    float _3306 = _3294 + _3304;
    float _3308 = -_3302;
    float _3310 = _3292 + _3308;
    float _3312 = -_3302;
    float _3314 = _3296 + _3312;
    float _3316 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3318 = fma(_3306, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    float _3320 = fma(_3310, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    float _3322 = fma(_3314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3302);
    out.m_49.x = _3316;
    out.m_87.x = _3318;
    out.m_87.y = _3320;
    out.m_87.z = _3322;
    if (!_3290)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3324 = -_1890;
    float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3328 = -_1894;
    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3332 = -_1898;
    float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3336 = _3326 * _3326;
    float _3338 = fma(_3330, _3330, _3336);
    float _3340 = fma(_3334, _3334, _3338);
    float _3342 = sqrt(_3340);
    float _3344 = rsqrt(_3340);
    float _3346 = -_3342;
    float _3348 = _3346 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3350 = _3348 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3352 = precise::clamp(_3350, 0.0, 1.0);
    float _3354 = _3330 * _3344;
    float _3356 = _3326 * _3344;
    float _3358 = abs(_3352);
    float _3360 = log2(_3358);
    float _3362 = _3334 * _3344;
    float _3364 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3366 = _3012 * _3356;
    float _3368 = -_3356;
    float _3370 = -_3364;
    float _3372 = fma(_3368, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3370);
    float _3374 = fma(_2870, _3354, _3366);
    float _3376 = -_3362;
    float _3378 = fma(_3376, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3372);
    float _3380 = fma(_3028, _3362, _3374);
    float _3382 = precise::clamp(_3380, 0.0, 1.0);
    float _3384 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3386 = _3378 + _3384;
    float _3388 = _3360 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3390 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = exp2(_3388);
    float _3396 = _3394 * _3392;
    float _3398 = _3382 * _3396;
    float _3400 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3402 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3404 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _3400;
    out.m_85.y = _3402;
    out.m_85.z = _3404;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

