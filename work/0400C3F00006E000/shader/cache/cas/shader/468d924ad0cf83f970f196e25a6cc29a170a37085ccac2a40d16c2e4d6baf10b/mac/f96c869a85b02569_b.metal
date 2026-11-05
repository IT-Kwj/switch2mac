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
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3816 = false;
    bool _952 = false;
    bool _640 = false;
    bool _478 = false;
    bool _368 = false;
    bool _206 = false;
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
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4122 = as_type<float>(_122);
        out.gl_Position.z = _4122;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    float _128 = float(_106);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _114;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _124 = as_type<int>(_152);
    }
    int _154 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4185 = as_type<float>(_154);
        out.gl_Position.z = _4185;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    float _162 = 1.0 / _128;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _168 = _158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _170 = _158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _166);
    float _174 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _170);
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _176);
    float _184 = _132 * _162;
    bool _186 = !_164;
    float _204;
    if (!_186)
    {
        float _188 = in.m_55.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        _204 = _184;
    }
    _206 = false;
    float _208 = _204;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    bool _214 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_208);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _208 + _226;
    bool _230 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_208);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_208);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_224;
    float _264 = _262 + 1.0;
    float _266 = 1.0 / _248;
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _244;
    float _282 = _240 * _272;
    float _284 = -_240;
    float _286 = _284 + 1.0;
    float _288 = _228 * _266;
    float _290 = _212 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _296;
    float _300 = fma(_276, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = fma(_298, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = _300 * _282;
    float _308 = _302 * _282;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _326 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _328 = fma(_314, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _330 = fma(_318, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _334 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _310);
    float _336 = fma(_328, _268, _324);
    float _338 = fma(_330, _268, _326);
    float _340 = fma(_332, _268, _334);
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _336);
    float _344 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _338);
    float _346 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _340);
    bool _348 = !_278;
    float _366;
    if (!_348)
    {
        float _350 = in.m_55.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        _366 = _184;
    }
    _368 = false;
    float _370 = _366;
    float _372 = in.m_57.x;
    float _374 = in.m_57.y;
    float _376 = in.m_57.z;
    bool _378 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _380 = isnan(_370);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _394 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _396 = isnan(_370);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _370 + _410;
    float _414 = -_388;
    float _416 = _414 + 1.0;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = 1.0 / _392;
    float _422 = _404 * _416;
    float _424 = -_404;
    float _426 = _424 + 1.0;
    float _428 = _342 * _372;
    float _430 = _408 * _420;
    float _432 = _344 * _374;
    float _434 = fma(_430, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = _346 * _376;
    float _442 = _434 * _422;
    float _444 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[115].x, _442);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _450 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[116].x, _446);
    float _452 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _458 = !_418;
    float _476;
    if (!_458)
    {
        float _460 = in.m_55.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        _476 = _184;
    }
    _478 = false;
    float _480 = _476;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _484 = _480 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _490 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _492 = isnan(_480);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _510 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _512 = isnan(_480);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _488;
    float _524 = -_500;
    float _526 = _524 + 1.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _528;
    bool _532 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _534 = isnan(_480);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _520 * _526;
    float _546 = -_520;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = 1.0 / _504;
    float _554 = _542 * _548;
    float _556 = -_542;
    float _558 = _556 + 1.0;
    float _560 = 1.0 / _508;
    float _562 = _530 * _522;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _568 = fma(_562, _484, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _570 = _566 * _552;
    bool _572 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _574 = isnan(_480);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _590 = _480 + _588;
    float _592 = _568 * _554;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _596 = _480 + _594;
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = fma(_570, _590, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _604 = _586 * _560;
    float _606 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[131].x, _592);
    float _608 = _500 * _600;
    float _610 = fma(_604, _596, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _612 = fma(_602, _544, _606);
    float _614 = fma(_610, _608, _612);
    float _616 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[134].x, _614);
    float _618 = _616 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _620 = !_550;
    float _638;
    if (!_620)
    {
        float _622 = in.m_55.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[14].x, _132);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _184;
    }
    _640 = false;
    float _642 = _638;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _646 = _642 + _644;
    bool _648 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _650 = isnan(_642);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _664 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _666 = isnan(_642);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _676;
    bool _680 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _682 = isnan(_642);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _662;
    float _694 = -_690;
    float _696 = _694 + 1.0;
    bool _698 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _700 = isnan(_642);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _714 = 1.0 / _712;
    bool _716 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _718 = _678 * _692;
    float _720 = -_658;
    float _722 = _720 + 1.0;
    float _724 = -_674;
    float _726 = _724 + 1.0;
    float _728 = -_708;
    float _730 = _728 + 1.0;
    float _732 = fma(_718, _646, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _734 = _674 * _722;
    bool _736 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _738 = isnan(_642);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _690 * _726;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _758 = _746 * _696;
    float _760 = -_746;
    float _762 = _760 + 1.0;
    bool _764 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _766 = isnan(_642);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = 1.0 / _752;
    float _778 = _708 * _762;
    bool _780 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _782 = isnan(_642);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _774 * _730;
    float _794 = -_774;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _802 = _790 * _796;
    float _804 = 1.0 / _756;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _810 = -_790;
    float _812 = _810 + 1.0;
    float _814 = _732 * _802;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _820 = _800 * _714;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _822;
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[159].x, _814);
    float _828 = 1.0 / _818;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _832 = _642 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _838 = _824 * _776;
    float _840 = fma(_820, _832, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _844 = _642 + _842;
    float _846 = 1.0 / _808;
    float _848 = fma(_840, _792, _826);
    float _850 = fma(_838, _844, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _862 = _642 + _860;
    float _864 = fma(_850, _778, _848);
    float _866 = 1.0 / _836;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _872 = _854 * _828;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _876 = _642 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _878;
    float _882 = _870 * _804;
    float _884 = _858 * _846;
    float _886 = fma(_882, _862, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _888 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _890 = isnan(_642);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _902 = _642 + _900;
    float _904 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _906 = fma(_886, _758, _864);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _910 = _642 + _908;
    float _912 = fma(_872, _902, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _914 = _880 * _866;
    float _916 = -_898;
    float _918 = _916 + 1.0;
    float _920 = fma(_904, _748, _906);
    float _922 = fma(_914, _910, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _924 = _658 * _918;
    float _926 = fma(_912, _734, _920);
    float _928 = fma(_922, _924, _926);
    float _930 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[166].x, _928);
    out.m_59.x = _930;
    bool _932 = !_716;
    float _950;
    if (!_932)
    {
        float _934 = in.m_55.x;
        float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _938 = _934 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[14].y, _132);
        float _942 = _940 * _936;
        float _944 = floor(_942);
        float _946 = -_944;
        float _948 = _942 + _946;
        _950 = _948;
        _952 = true;
    }
    else
    {
        _950 = _184;
    }
    _952 = false;
    float _954 = _950;
    float _956 = in.m_46.x;
    float _958 = in.m_46.y;
    float _960 = in.m_46.z;
    float _962 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _964 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _966 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _968 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _970 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _972 = -_968;
    float _974 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _972);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _980 = fma(_184, _978, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _982 = _958 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = _958 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _986 = _958 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[5].x, _982);
    float _990 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[4].x, _984);
    float _992 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _994 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[5].z, _988);
    float _996 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[4].z, _990);
    float _998 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[6].z, _992);
    float _1000 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1002 = _996 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1004 = _998 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1008 = -_1000;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = -_1002;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = -_1004;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = -_1006;
    float _1022 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1024 = _1010 * _1010;
    float _1026 = fma(_1014, _1014, _1024);
    float _1028 = fma(_1018, _1018, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1014 * _1030;
    float _1036 = _1018 * _1030;
    float _1038 = _1010 * _1030;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_1036, _1036, _1040);
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1048 = rsqrt(_1042);
    float _1050 = -_1044;
    float _1052 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1050);
    float _1054 = -_1046;
    float _1056 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1054);
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1062 = -_1058;
    float _1064 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1062);
    float _1066 = -_970;
    float _1068 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1070 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1072 = -_1060;
    float _1074 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1072);
    float _1076 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1078 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1080 = -_1070;
    float _1082 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1080);
    float _1084 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1074);
    float _1086 = _1036 * _1048;
    float _1088 = _1034 * _1048;
    float _1090 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1082);
    float _1092 = -_1076;
    float _1094 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1092);
    float _1096 = -_1086;
    float _1098 = _1036 * _1096;
    float _1100 = -_1086;
    float _1102 = _1038 * _1100;
    float _1104 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1106 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1094);
    float _1108 = -_1098;
    float _1110 = fma(_1034, _1088, _1108);
    float _1112 = _1038 * _1088;
    float _1114 = -_1104;
    float _1116 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1114);
    float _1118 = -_1078;
    float _1120 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1122 = _1110 * _1110;
    float _1124 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1126 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1116);
    float _1128 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1120);
    float _1130 = fma(_1112, _1112, _1122);
    float _1132 = -_1124;
    float _1134 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1136 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1138 = -_1128;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1126);
    float _1142 = fma(_1102, _1102, _1130);
    float _1144 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1134);
    float _1146 = -_1136;
    float _1148 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1146);
    float _1150 = 1.0 / _1140;
    float _1152 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1154 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1148);
    float _1156 = -_1152;
    float _1158 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1156);
    float _1160 = rsqrt(_1142);
    float _1162 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1158);
    float _1164 = fma(_1144, _1150, -1.0);
    float _1166 = _1110 * _1160;
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = -_1168;
    float _1172 = _1170 + 1.0;
    float _1174 = _1172 * _1150;
    float _1176 = fma(_1172, _1164, 1.0);
    float _1178 = _1154 * _1174;
    float _1180 = _1176 * _1176;
    float _1182 = _1162 * _1174;
    float _1184 = fma(_1178, _1178, _1180);
    float _1186 = fma(_1182, _1182, _1184);
    float _1188 = rsqrt(_1186);
    float _1190 = _1182 * _1188;
    float _1192 = _1178 * _1188;
    float _1194 = _1176 * _1188;
    float _1196 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1198 = -_1190;
    float _1200 = _1034 * _1198;
    float _1202 = _1036 * _1194;
    float _1204 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1196);
    float _1206 = -_1192;
    float _1208 = -_1200;
    float _1210 = fma(_1036, _1206, _1208);
    float _1212 = -_1192;
    float _1214 = _1038 * _1212;
    float _1216 = -_1190;
    float _1218 = -_1202;
    float _1220 = fma(_1038, _1216, _1218);
    float _1222 = _1210 * _1210;
    float _1224 = -_1214;
    float _1226 = fma(_1034, _1194, _1224);
    float _1228 = fma(_1220, _1220, _1222);
    float _1230 = fma(_1226, _1226, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1220 * _1232;
    float _1236 = _1226 * _1232;
    float _1238 = _1210 * _1232;
    float _1240 = _1036 * _1234;
    float _1242 = _1038 * _1236;
    float _1244 = -_1240;
    float _1246 = fma(_1034, _1236, _1244);
    float _1248 = _1034 * _1238;
    float _1250 = -_1242;
    float _1252 = fma(_1036, _1238, _1250);
    float _1254 = _1246 * _1246;
    float _1256 = -_1248;
    float _1258 = fma(_1038, _1234, _1256);
    float _1260 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1262 = fma(_1252, _1252, _1254);
    float _1264 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1260);
    float _1266 = fma(_1258, _1258, _1262);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1268;
    float _1272 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1264);
    float _1274 = 1.0 / _1270;
    float _1276 = rsqrt(_1266);
    float _1278 = _1258 * _1276;
    float _1280 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1204);
    float _1282 = _1246 * _1276;
    float _1284 = _1252 * _1276;
    float _1286 = _1034 * _1278;
    float _1288 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1292 = _1036 * _1282;
    float _1294 = -_1286;
    float _1296 = fma(_1036, _1284, _1294);
    float _1298 = in.m_61.x;
    float _1300 = in.m_61.y;
    float _1302 = in.m_61.z;
    float _1304 = -_1290;
    float _1306 = _1288 + _1304;
    float _1308 = -_1292;
    float _1310 = fma(_1038, _1278, _1308);
    float _1312 = _1296 * _1296;
    float _1314 = _1038 * _1284;
    bool _1316 = _1290 >= _1288;
    bool _1318 = isnan(_1290);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(_1288);
    bool _1324 = _1320 || _1322;
    float _1326 = abs(_1306);
    float _1328 = precise::max(_1326, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1330 = fma(_1310, _1310, _1312);
    float _1332 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1334 = -_1314;
    float _1336 = fma(_1034, _1282, _1334);
    float _1338 = precise::min(_1328, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1340 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1332);
    float _1342 = fma(_1336, _1336, _1330);
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1346 = _1338 + _1344;
    float _1348 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1340);
    float _1350 = rsqrt(_1342);
    float _1352 = _1346 * _1274;
    float _1354 = abs(_1032);
    float _1356 = precise::max(0.0, _1354);
    bool _1358 = !_1324;
    float _1360 = _1358 ? 1.0 : (-1.0);
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1298);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1300);
    float _1366 = rsqrt(_1348);
    float _1368 = _184 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1370 = _962 * _1362;
    float _1372 = _1360 * _1352;
    float _1374 = _964 * _1364;
    float _1376 = precise::min(_1356, 40.0);
    float _1378 = _1368 * _1372;
    float _1380 = _1336 * _1350;
    float _1382 = _966 * _1302;
    float _1384 = _1296 * _1350;
    float _1386 = _1374 * _1282;
    float _1388 = fma(_1376, -0.02500000037252902984619140625, 1.0);
    float _1390 = _1310 * _1350;
    float _1392 = _1374 * _1284;
    float _1394 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1400 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1402 = _1374 * _1278;
    float _1404 = _1396 * _1396;
    float _1406 = fma(_1370, _1390, _1392);
    float _1408 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    float _1410 = fma(_1370, _1380, _1402);
    float _1412 = fma(_1398, _1398, _1404);
    float _1414 = fma(_1370, _1384, _1386);
    float _1416 = _1378 * 0.15915493667125701904296875;
    float _1418 = fma(_1382, _1036, _1410);
    float _1420 = fma(_1400, _1400, _1412);
    float _1422 = fma(_1382, _1038, _1414);
    float _1424 = fma(_1382, _1034, _1406);
    float _1426 = _1004 + _1418;
    float _1428 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1408);
    float _1430 = _1000 + _1422;
    float _1432 = _1002 + _1424;
    float _1434 = rsqrt(_1420);
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1442 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1438);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1440);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1450 = _1416 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1446);
    float _1458 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1460 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1462 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1464 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = _1416 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1400 * _1434;
    float _1472 = -_1462;
    float _1474 = _1472 + _1436;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1480 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1482 = fma(_1388, _1474, _1462);
    float _1484 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1476);
    float _1486 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1478);
    float _1488 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1480);
    float _1490 = _1398 * _1434;
    float _1492 = _1396 * _1434;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1484);
    float _1496 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1486);
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1488);
    float _1500 = _1470 * _1470;
    float _1502 = -_1468;
    float _1504 = _1502 + 1.0;
    float _1506 = _1490 * _1452;
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1510 = _1492 * _1452;
    float _1512 = _1492 * _1504;
    float _1514 = fma(_1504, _1500, _1468);
    float _1516 = _1470 * _1452;
    float _1518 = _1490 * _1504;
    float _1520 = fma(_1470, _1512, _1506);
    float _1522 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1524 = -_1000;
    float _1526 = _1524 + _1508;
    float _1528 = -_1516;
    float _1530 = fma(_1492, _1518, _1528);
    float _1532 = -_1510;
    float _1534 = fma(_1470, _1518, _1532);
    float _1536 = -_1002;
    float _1538 = _1536 + _1522;
    float _1540 = _1520 * _1526;
    float _1542 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1544 = fma(_1490, _1518, _1468);
    float _1546 = _1530 * _1526;
    float _1548 = fma(_1534, _1538, _1540);
    float _1550 = -_1004;
    float _1552 = _1550 + _1542;
    float _1554 = fma(_1470, _1518, _1510);
    float _1556 = fma(_1544, _1538, _1546);
    float _1558 = fma(_1492, _1512, _1468);
    float _1560 = fma(_1514, _1552, _1548);
    float _1562 = fma(_1492, _1518, _1516);
    float _1564 = fma(_1554, _1552, _1556);
    float _1566 = _1558 * _1526;
    float _1568 = fma(_1560, _980, _1004);
    float _1570 = -_1506;
    float _1572 = fma(_1470, _1512, _1570);
    float _1574 = fma(_1564, _980, _1002);
    float _1576 = fma(_1562, _1538, _1566);
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1580 = _1568 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1584 = _1574 + _1582;
    float _1586 = fma(_1572, _1552, _1576);
    float _1588 = _1580 * _1580;
    float _1590 = _1000 + _1586;
    float _1592 = fma(_1584, _1584, _1588);
    float _1594 = sqrt(_1592);
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1610 = _1608 != 0;
    float _1612 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1614 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1612);
    bool _1616 = !_1602;
    int _1618 = _1616 ? 0 : 1;
    bool _1620 = !_1598;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1614);
    bool _1626 = !_1606;
    int _1628 = _1626 ? 0 : 1;
    bool _1630 = !_1610;
    int _1632 = _1630 ? 0 : 1;
    bool _1634 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1614;
    float _1638 = _1566;
    float _1640 = _1586;
    float _1642 = _1538;
    float _1644 = _1580;
    if (!_1634)
    {
        _1636 = _1574;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (!_1634)
    {
        _1638 = _1568;
    }
    float _1650 = _1638;
    float _1652 = _1650;
    if (!_1634)
    {
        _1640 = _1590;
    }
    float _1654 = _1640;
    bool _1656 = !_1634;
    float _1658 = _1654;
    if (!_1656)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1664 = _1594 + _1662;
        float _1666 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = rsqrt(_1592);
        float _1670 = _1664 * _1660;
        float _1672 = _1670 * 0.15915493667125701904296875;
        float _1674 = _1672 * 6.283185482025146484375;
        float _1676 = cos(_1674);
        float _1678 = _1672 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        float _1682 = _1676 + (-1.0);
        float _1684 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = fma(_1680, _1666, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1688 = fma(_1590, _1676, _1684);
        float _1690 = _1668 * _1686;
        float _1692 = fma(_1584, _1690, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1694 = fma(_1580, _1690, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1658 = _1688;
        _1648 = _1692;
        _1652 = _1694;
    }
    float _1696 = _1658;
    float _1698 = _1648;
    float _1700 = _1652;
    float _1702 = -_1000;
    float _1704 = _1702 + _1696;
    float _1706 = -_1002;
    float _1708 = _1706 + _1698;
    float _1710 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1712 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1714 = _1704 * _1704;
    float _1716 = -_1004;
    float _1718 = _1716 + _1700;
    float _1720 = 1.0 / _1710;
    float _1722 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1712);
    float _1724 = fma(_1708, _1708, _1714);
    float _1726 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1722);
    float _1728 = fma(_1718, _1718, _1724);
    float _1730 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1732 = sqrt(_1728);
    float _1734 = _1730 + _1710;
    float _1736 = _1734 * _1720;
    float _1738 = _1736 * 0.5;
    bool _1740 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.5);
    bool _1748 = _1744 || _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1750);
    float _1754 = 1.0 / _1752;
    bool _1756 = _1732 > 0.0;
    bool _1758 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan(0.5);
    bool _1766 = _1762 || _1764;
    bool _1768 = !_1756;
    float _1770 = _1698;
    float _1772 = _1696;
    float _1774 = _1700;
    float _1776 = _1720;
    float _1778 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1780 = _1708;
    if (!_1768)
    {
        float _1782 = _180 * _180;
        float _1784 = fma(_178, _178, _1782);
        float _1786 = fma(_182, _182, _1784);
        float _1788 = rsqrt(_1728);
        float _1790 = sqrt(_1786);
        float _1792 = _1708 * _1788;
        float _1794 = _1704 * _1788;
        float _1796 = _1718 * _1788;
        bool _1798 = _1790 > 0.0;
        bool _1800 = !_1798;
        _1642 = _1792;
        _1644 = _1794;
        if (!_1800)
        {
            float _1802 = rsqrt(_1786);
            float _1804 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1806 = _180 * _1802;
            float _1808 = _178 * _1802;
            float _1810 = _1794 * _1806;
            float _1812 = _182 * _1802;
            float _1814 = fma(_1792, _1808, _1810);
            float _1816 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1818 = fma(_1796, _1812, _1814);
            float _1820 = _1818 * _1816;
            float _1822 = fma(_178, _1820, _1698);
            float _1824 = fma(_180, _1820, _1696);
            float _1826 = fma(_182, _1820, _1700);
            _1770 = _1822;
            _1772 = _1824;
            _1774 = _1826;
            _1776 = _1816;
        }
    }
    float _1828 = _1770;
    float _1830 = _1772;
    float _1832 = _1774;
    float _1834 = _1642;
    float _1836 = _1776;
    float _1838 = _1644;
    float _1840 = _1836;
    float _1842 = _1834;
    float _1844 = _1830;
    float _1846 = _1832;
    float _1848 = _1838;
    if (_1748)
    {
        _1840 = 1.0;
    }
    float _1850 = _1840;
    float _1852 = _1850;
    if (_1766)
    {
        _1778 = _1828;
    }
    float _1854 = _1778;
    float _1856 = _1854;
    if (_1766)
    {
        _1842 = _1830;
    }
    float _1858 = _1842;
    float _1860 = _1858;
    if (_1766)
    {
        _1780 = _1832;
    }
    float _1862 = _1780;
    float _1864 = _1862;
    if (!_1766)
    {
        float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1868 = _1000 + _1866;
        float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1872 = _1002 + _1870;
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1876 = -_1000;
        float _1878 = _1876 + _1830;
        float _1880 = _1868 * _1868;
        float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1884 = _1004 + _1882;
        float _1886 = -_1002;
        float _1888 = _1886 + _1828;
        float _1890 = -_1004;
        float _1892 = _1890 + _1832;
        float _1894 = fma(_1872, _1872, _1880);
        float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1898 = fma(_1884, _1884, _1894);
        float _1900 = sqrt(_1898);
        float _1902 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1904 = precise::min(_1900, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1906 = _1904 * _1896;
        float _1908 = _1902 * _1906;
        float _1910 = fma(_1878, _1908, _1000);
        float _1912 = fma(_1888, _1908, _1002);
        float _1914 = fma(_1892, _1908, _1004);
        _1844 = _1878;
        _1860 = _1910;
        _1856 = _1912;
        _1864 = _1914;
        _1846 = _1892;
    }
    float _1916 = _1844;
    float _1918 = _1860;
    float _1920 = _1856;
    float _1922 = _1864;
    float _1924 = _1846;
    float _1926 = _1916;
    float _1928 = _1924;
    if (_1748)
    {
        _1848 = 1.0;
    }
    float _1930 = _1848;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1934 = _1754 * _1932;
    float _1936 = _1930;
    if (!_1748)
    {
        float _1938 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        float _1946 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1948 = _1946 * 0.15915493667125701904296875;
        float _1950 = _1940 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = 1.0 / _1944;
        float _1956 = _1948 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1952 * _1954;
        float _1962 = _1948 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1958 * _1960;
        float _1968 = 1.0 / _1966;
        float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1972 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1970;
        float _1974 = 1.0 / _1972;
        float _1976 = _1964 * _1968;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = fma(_1934, _1976, _1978);
        float _1982 = _1980 * _1974;
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        _1926 = _1948;
        _1928 = _1980;
        _1852 = _1984;
    }
    float _1986 = _1926;
    float _1988 = _1928;
    float _1990 = _1852;
    float _1992 = _1986;
    float _1994 = _1988;
    if (!_1748)
    {
        float _1996 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = _1998 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        float _2004 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2006 = _2004 * 0.15915493667125701904296875;
        float _2008 = _1998 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = 1.0 / _2002;
        float _2014 = _2006 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = _2006 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = 1.0 / _2024;
        float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2030 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2028;
        float _2032 = 1.0 / _2030;
        float _2034 = _2022 * _2026;
        float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2038 = fma(_1934, _2034, _2036);
        float _2040 = _2038 * _2032;
        float _2042 = precise::clamp(_2040, 0.0, 1.0);
        float _2044 = -_2042;
        float _2046 = _2044 + 1.0;
        _1992 = _2012;
        _1994 = _2034;
        _1936 = _2046;
    }
    float _2048 = _1992;
    float _2050 = _1994;
    float _2052 = _1936;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _1918 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2060 = _1920 + _2058;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2064 = _1922 + _2062;
    float _2066 = _2056 * _2056;
    float _2068 = fma(_2060, _2060, _2066);
    float _2070 = fma(_1002, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2072 = fma(_2064, _2064, _2068);
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2076 = rsqrt(_2072);
    float _2078 = sqrt(_2072);
    float _2080 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2082 = _2060 * _2080;
    float _2084 = _2064 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 * _2084;
    float _2090 = _2086 + _2088;
    float _2092 = sqrt(_2090);
    bool _2094 = _2092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2092 + _2096;
    float _2100 = _2076;
    float _2102 = _2098;
    float _2104 = _2048;
    float _2106 = _2056;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2094)
    {
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2100 = _2110;
    }
    float _2112 = _2100;
    float _2114 = _2112;
    if (_2094)
    {
        float _2116 = _2098 * _2112;
        _2102 = _2116;
    }
    float _2118 = _2102;
    if (_2094)
    {
        float _2120 = rsqrt(_2090);
        _2114 = _2120;
    }
    float _2122 = _2114;
    float _2124 = _2122;
    if (_2094)
    {
        float _2126 = _2118 * 0.15915493667125701904296875;
        _2104 = _2126;
    }
    float _2128 = _2104;
    float _2130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2132 = _2064;
    float _2134 = _2128;
    if (_2094)
    {
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2144 = precise::max(0.0, _2130);
    float _2146 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2142);
    float _2148 = _2050;
    float _2150 = _2144;
    if (_2094)
    {
        float _2152 = _2128 * 6.283185482025146484375;
        float _2154 = cos(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = -_2080;
    float _2160 = -_2144;
    float _2162 = fma(_2056, _2158, _2160);
    float _2164 = _2162;
    if (_2094)
    {
        float _2166 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2166;
    }
    float _2168 = _2106;
    float _2170 = _2140;
    if (_2094)
    {
        float _2172 = fma(_2140, _2168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2170 = _2172;
    }
    float _2174 = _2170;
    float _2176 = floor(_2070);
    float _2178 = _2174;
    if (_2094)
    {
        float _2180 = _2122 * _2174;
        _2108 = _2180;
    }
    float _2182 = _2108;
    if (!_2094)
    {
        _2124 = _2082;
    }
    float _2184 = _2124;
    float _2186 = _2184;
    float _2188 = _2156;
    if (_2094)
    {
        float _2190 = _2156 + (-1.0);
        _2150 = _2190;
    }
    float _2192 = _2150;
    float _2194 = _2192;
    if (_2094)
    {
        float _2196 = _2082 * _2182;
        _2186 = _2196;
    }
    float _2198 = _2186;
    if (!_2094)
    {
        _2178 = _2086;
    }
    float _2200 = _2178;
    float _2202 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2204 = _2200;
    if (_2094)
    {
        float _2206 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2206;
    }
    float _2208 = _2134;
    if (!_2094)
    {
        _2194 = _2084;
    }
    float _2210 = _2194;
    float _2212 = _2210;
    if (_2094)
    {
        float _2214 = _2084 * _2182;
        _2212 = _2214;
    }
    float _2216 = _2212;
    if (_2094)
    {
        float _2218 = fma(_2162, _2156, _2208);
        _2164 = _2218;
    }
    float _2220 = _2164;
    if (_2094)
    {
        float _2222 = _2198 * _2198;
        _2204 = _2222;
    }
    float _2224 = _2204;
    if (!_2094)
    {
        _2188 = _2088;
    }
    float _2226 = _2188;
    float _2228 = _2226;
    if (_2094)
    {
        float _2230 = _2216 * _2216;
        _2228 = _2230;
    }
    float _2232 = _2228;
    float _2234 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2236 = fma(_2220, _2220, _2224);
    float _2238 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2240 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2202);
    float _2242 = floor(_2234);
    float _2244 = _2236 + _2232;
    float _2246 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2248 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2238);
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2252 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2250);
    float _2254 = precise::clamp(_2252, 0.0, 1.0);
    float _2256 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2246);
    float _2258 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2248);
    float _2260 = rsqrt(_2244);
    float _2262 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2240);
    float _2264 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2256);
    float _2266 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2268 = -_2254;
    float _2270 = _2268 + 1.0;
    float _2272 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2274 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2278 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2280 = abs(_2270);
    float _2282 = log2(_2280);
    float _2284 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2276);
    float _2288 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2290 = -_2176;
    float _2292 = _2070 + _2290;
    float _2294 = -_2284;
    float _2296 = fma(_2294, _2074, 1.0);
    float _2298 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2300 = _2260 * _2198;
    float _2302 = _2260 * _2216;
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2306 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2298);
    float _2308 = _2260 * _2220;
    float _2310 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2312 = log2(_2296);
    float _2314 = -_2242;
    float _2316 = _2234 + _2314;
    float _2318 = _2308 + 1.0;
    float _2320 = -_2310;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2320);
    float _2324 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2326 = -_2302;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2322);
    float _2330 = 1.0 / _2306;
    float _2332 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2334 = fma(_2328, -0.5, 0.5);
    float _2336 = fma(_2328, 0.5, 0.5);
    float _2338 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2304);
    float _2340 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2332);
    float _2342 = exp2(_2324);
    float _2344 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2338);
    float _2346 = fma(_2336, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2348 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2340);
    float _2350 = _2312 * 0.693147182464599609375;
    float _2352 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2344);
    float _2354 = fma(_2336, _2346, -0.212114393711090087890625);
    float _2356 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2348);
    float _2358 = sqrt(_2334);
    float _2360 = _2352 * _2330;
    float _2362 = fma(_2336, _2354, 1.570728778839111328125);
    float _2364 = _2356 * _2330;
    float _2366 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2368 = fma(_2360, 0.5, 0.5);
    float _2370 = fma(_2364, -0.5, 0.5);
    float _2372 = -_2308;
    float _2374 = fma(_2342, _2318, _2372);
    float2 _7762 = float2(_2292, _2316);
    float _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7762, float2(0.0), isnan(_7762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7762, float2(0.0), isnan(_7762)), level(0.0)).x;
    float _2378 = fma(_2374, 0.5, 0.5);
    float _2380 = _2358 * 0.636619746685028076171875;
    float _2382 = -_2362;
    float _2384 = fma(_2380, _2382, 1.0);
    float3 _7783 = float3(_2368, _2370, _2366);
    float _2386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7783, float3(0.0), isnan(_7783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7783, float3(0.0), isnan(_7783)), level(0.0)).x;
    float3 _7794 = float3(_2368, _2370, _2366);
    float4 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7794, float3(0.0), isnan(_7794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7794, float3(0.0), isnan(_7794)), level(0.0)).xyzw;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = _2389.w;
    float2 _7810 = float2(_2384, _2378);
    float3 _2401 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7810, float2(0.0), isnan(_7810)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7810, float2(0.0), isnan(_7810)), level(0.0)).xyz;
    float _2403 = _2401.x;
    float _2405 = _2401.y;
    float _2407 = _2401.z;
    float _2409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2411 = int(_2409);
    int _2413 = abs(_1618);
    out.m_63.x = _454;
    out.m_63.y = _444;
    out.m_63.z = _452;
    out.m_63.w = _456;
    int _2415 = abs(_1632);
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2419 = _954 + _2417;
    out.m_65.w = _618;
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2423 = _954 + _2421;
    float _2425 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2427 = int(_2425);
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2433 = in.m_67.x;
    float _2435 = float(_2411);
    float _2437 = 1.0 / _2431;
    float _2439 = float(uint(_2427));
    float _2441 = 1.0 / _2435;
    int _2443 = ~_2427;
    int _2445 = _2443 + 1;
    bool _2447 = _2427 == 0;
    int _2449 = ~_2427;
    int _2451 = _2449 + 1;
    int _2453 = ~_2427;
    int _2455 = _2453 + 1;
    float _2457 = 1.0 / _2439;
    int _2459 = ~_2427;
    int _2461 = _2459 + 1;
    float _2463 = in.m_55.y;
    float _2465 = _132 * _2441;
    float _2467 = trunc(_2465);
    int _2469 = int(_2467);
    int _2471 = as_type<int>(_2457) + (-2);
    float _2473 = float(uint(_2469));
    float _2475 = as_type<float>(_2471) * _2473;
    float _2477 = in.m_55.x;
    float _2479 = trunc(_2475);
    float _2481 = precise::max(_2479, 0.0);
    uint _2484 = uint(_2481);
    int _2486 = _2461 * int(_2484);
    int _2488 = _2486 + _2469;
    float _2490 = float(uint(_2488));
    float _2492 = as_type<float>(_2471) * _2490;
    int _2494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2496 = _2494 != 0;
    float _2498 = trunc(_2492);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = !_2496;
    float _2506 = _2504 ? 1.2345600128173828125 : 1.0;
    bool _2508 = !_2496;
    float _2510 = _2508 ? _2463 : _2477;
    float _2512 = _2510 * _2506;
    float _2514 = floor(_2512);
    int _2516 = int(_2484) + int(_2502);
    float _2518 = float(_2427);
    float _2520 = float(_2469);
    int _2522 = _2445 * _2516;
    int _2524 = _2522 + _2469;
    bool _2526 = _2520 >= _2518;
    bool _2528 = isnan(_2520);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(_2518);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    bool _2538 = uint(_2524) >= uint(_2427);
    float _2540 = trunc(_2536);
    int _2542 = int(_2540);
    bool _2544 = !_2538;
    int _2546 = _2544 ? 0 : (-1);
    float _2548 = -_2514;
    float _2550 = _2512 + _2548;
    int _2552 = ~_2516;
    int _2554 = _2552 + _2546;
    int _2556 = _2554 + 1;
    float _2558 = _2550 * _2518;
    float _2560 = _132 * _2518;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2564 = _2562 != 0;
    int _2566 = _2427 * _2556;
    int _2568 = _2566 + _2469;
    float _2570 = _2560 * _162;
    float _2572 = trunc(_2558);
    int _2574 = int(_2572);
    int _2576 = _2427 + (-1);
    bool _2578 = !_2447;
    int _2580 = _2578 ? _2568 : (-1);
    int _2582 = ~_2542;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    bool _2588 = !_2564;
    int _2590 = _2588 ? 0 : 1;
    float _2592 = trunc(_2570);
    int _2594 = int(_2592);
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2598 = _2596 != 0;
    int _2600 = _2580 * _2586;
    int _2602 = abs(_2590);
    int _2604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2606 = _2604 != 0;
    int _2608 = _2542 * _2576;
    int _2610 = _2608 + _2600;
    int _2612 = abs(_1622);
    int _2614 = abs(_1628);
    int _2616 = _2610 * _2413;
    int _2618 = _2574 * _2602;
    int _2620 = _2618 + _2469;
    int _2622 = ~_2427;
    int _2624 = _2622 + 1;
    int _2626 = _2594 * _2612;
    int _2628 = _2626 + _2616;
    int _2630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2632 = _2630 != 0;
    float _2634 = float(uint(_2620));
    int _2636 = _2620 * _2614;
    int _2638 = _2636 + _2628;
    int _2640 = _2574 * _2415;
    int _2642 = _2640 + _2638;
    int _2644 = ~_2427;
    int _2646 = _2644 + 1;
    float _2648 = in.m_55.w;
    float _2650 = as_type<float>(_2471) * _2634;
    float _2652 = float(uint(_2642));
    float _2654 = trunc(_2650);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = as_type<float>(_2471) * _2652;
    float _2662 = trunc(_2660);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    int _2668 = _2451 * int(_2658);
    int _2670 = _2668 + _2620;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2676 = _2648 > 0.5;
    float _2678 = float(uint(_2670));
    int _2680 = _2646 * int(_2666);
    int _2682 = _2680 + _2642;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2684;
    float _2688 = as_type<float>(_2471) * _2678;
    float _2690 = float(uint(_2682));
    float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2694 = _2692 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2696 = in.m_67.y;
    float _2698 = trunc(_2688);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = as_type<float>(_2471) * _2690;
    float _2706 = trunc(_2704);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    float _2712 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2716 = 1.0 / _2714;
    int _2718 = int(_2658) + int(_2702);
    float _2720 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2722 = _2720 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2724 = -_2696;
    float _2726 = _2724 + 1.0;
    int _2728 = int(_2666) + int(_2710);
    int _2730 = _2455 * _2718;
    int _2732 = _2730 + _2620;
    float _2734 = 1.0 / _2674;
    int _2736 = _2624 * _2728;
    int _2738 = _2736 + _2642;
    float _2740 = _2686 * _2716;
    float _2742 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _2746 = uint(_2738) >= uint(_2427);
    float _2748 = 1.0 / _2722;
    int _2750 = _2676 ? as_type<int>(_2726) : as_type<int>(_2696);
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _2756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2758 = _2756 != 0;
    float _2760 = fma(_2740, _2419, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2762 = !_2746;
    int _2764 = _2762 ? 0 : (-1);
    float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2768 = _954 + _2766;
    int _2770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2772 = _2770 != 0;
    float _2774 = 1.0 / _2754;
    int _2776 = ~_2728;
    int _2778 = _2776 + _2764;
    int _2780 = _2778 + 1;
    float _2782 = _2744 * _2734;
    float _2784 = _2772 ? as_type<float>(_2750) : _2696;
    bool _2786 = _2463 > 0.5;
    float _2788 = 1.0 / _2694;
    float _2790 = _2696;
    float _2792 = _2306;
    float _2794 = _2356;
    if (_2758)
    {
        float _2796 = _2786 ? _2726 : _2696;
        _2790 = _2796;
    }
    float _2798 = _2790;
    int _2800 = _2427 * _2780;
    int _2802 = _2800 + _2642;
    bool _2804 = !_2447;
    int _2806 = _2804 ? _2802 : (-1);
    float _2808 = -_2376;
    float _2810 = _2808 + 1.0;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2814 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2812;
    float _2816 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2818 = _2816 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2820 = _2806 >> 31;
    int _2822 = _2806 & 3;
    bool _2824 = _2822 != 0;
    int _2826 = _2820 & 3;
    float _2828 = _2814 * _2748;
    int _2830 = _2806 & 3;
    bool _2832 = _2830 != 0;
    float _2834 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2834;
    int _2838 = _2806 + _2826;
    float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2842 = _2840 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _2844 = _2824 ? 0 : 1;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    if (_2632)
    {
        float _2848 = in.m_55.z;
        _2846 = _2848;
    }
    float _2850 = _2846;
    int _2852 = _2838 >> 2;
    float _2854 = 1.0 / _2842;
    bool _2856 = uint(_2830) > 1u;
    float _2858 = _2818 * _2788;
    int _2860 = _2852 << 4;
    int _2862 = _2860 + 512;
    float _2864 = _2836 * _2774;
    int _2866 = ~_2844;
    int _2868 = _2866 + 1;
    int _2870 = _2868 + 1;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2874 = _2872 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    uint _2876 = uint(int(uint(_2862) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = _2874 * _2437;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2896 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2894;
    int _2898 = _2870;
    float _2900 = _2864;
    if (!_2856)
    {
        int _2902 = ~_2844;
        int _2904 = _2902 + 1;
        _2898 = _2904;
    }
    int _2906 = _2898;
    bool _2908 = uint(_2830) >= 2u;
    float _2910 = _2896 * _2854;
    bool _2912 = !_2832;
    int _2914 = _2912 ? 0 : 1;
    bool _2916 = _2830 != 3;
    float _2918 = _2908 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2920 = _2830 != 3;
    int _2922 = _2862 + 8;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    uint _2926 = uint(int(uint(int(_2924)) >> uint(2)));
    int _2928 = int(_2924) & 3;
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[int(_2926)][_2928];
    int _2932 = int(_2924) + 1;
    uint _2934 = uint(int(uint(_2932) >> uint(2)));
    int _2936 = _2932 & 3;
    float _2938 = (*spvDescriptorSet0.vp_c9)._m0[int(_2934)][_2936];
    int _2940 = ~as_type<int>(_2918);
    int _2942 = _2940 + 1;
    int _2944 = _2942 + 1;
    bool _2946 = !_2920;
    int _2948 = _2946 ? 0 : (-1);
    bool _2950 = uint(_2732) >= uint(_2427);
    float _2952 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2954 = _954 + _2952;
    int _2956 = _2944;
    bool _2958 = _2916;
    float _2960 = _2918;
    bool _2962 = _2950;
    if (_2916)
    {
        int _2964 = ~as_type<int>(_2918);
        int _2966 = _2964 + 1;
        _2956 = _2966;
    }
    int _2968 = _2956;
    if (_2632)
    {
        bool _2970 = _2850 > 0.5;
        _2958 = _2970;
    }
    bool _2972 = _2958;
    if (!_2496)
    {
        _2960 = _2463;
    }
    float _2974 = _2960;
    bool _2976 = !_2950;
    float _2978 = _2976 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2980 = _2974;
    float _2982 = _2978;
    if (_2606)
    {
        bool _2984 = _2477 > 0.5;
        _2962 = _2984;
    }
    bool _2986 = _2962;
    if (_2496)
    {
        _2980 = _2477;
    }
    float _2988 = _2980;
    float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2992 = _954 + _2990;
    int _2994 = abs(_2914);
    int _2996 = abs(_2968);
    float _2998 = fma(_2782, _2992, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3000 = fma(_2828, _2423, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3002 = fma(_2858, _2768, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3004 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3006 = _954 + _3004;
    int _3008 = abs(_2906);
    float _3010 = fma(_2864, _2954, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    if (!_2606)
    {
        _2900 = _2433;
    }
    float _3012 = _2900;
    float _3014 = fma(_2892, _3006, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3016 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3018 = _954 + _3016;
    int _3020 = ~_2718;
    int _3022 = _3020 + as_type<int>(_2978);
    int _3024 = _3022 + 1;
    int _3026 = ~_3008;
    int _3028 = _3026 + 1;
    int _3030 = _3028 + 1;
    float _3032 = fma(_2910, _3018, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3034 = _3012;
    if (!_2606)
    {
        _2982 = _3012;
    }
    float _3036 = _2982;
    int _3038 = _2427 * _3024;
    int _3040 = _3038 + _2620;
    float _3042 = _3036;
    if (_2606)
    {
        _3034 = _2433;
    }
    float _3044 = _3034;
    int _3046 = _3030 * as_type<int>(_2890);
    int _3048 = abs(_2948);
    int _3050 = ~_2994;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    float _3056 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3058 = int(_3056);
    bool _3060 = !_2598;
    int _3062 = _3060 ? 0 : 1;
    int _3064 = ~_2996;
    int _3066 = _3064 + 1;
    int _3068 = _3066 + 1;
    int _3070 = _3054 * as_type<int>(_2882);
    int _3072 = _3070 + _3046;
    int _3074 = abs(_3062);
    int _3076 = ~_3048;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    int _3082 = _3068 * as_type<int>(_2930);
    int _3084 = _3082 + _3072;
    bool _3086 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3088 = isnan(_954);
    bool _3090 = _3086 || _3088;
    bool _3092 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3094 = _3090 || _3092;
    float _3096 = float(_3094);
    bool _3098 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3100 = isnan(_954);
    bool _3102 = _3098 || _3100;
    bool _3104 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3106 = _3102 || _3104;
    float _3108 = float(_3106);
    int _3110 = _3080 * as_type<int>(_2938);
    int _3112 = _3110 + _3084;
    int _3114 = ~_3074;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    float _3120 = -_3096;
    float _3122 = _3120 + 1.0;
    bool _3124 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3126 = isnan(_954);
    bool _3128 = _3124 || _3126;
    bool _3130 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3132 = _3128 || _3130;
    float _3134 = float(_3132);
    float _3136 = -_3108;
    float _3138 = _3136 + 1.0;
    float _3140 = float(uint(_3058));
    int _3142 = _3112 * _3118;
    float _3144 = _3108 * _3122;
    bool _3146 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3148 = isnan(_954);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3154 = _3150 || _3152;
    float _3156 = float(_3154);
    float _3158 = -_3134;
    float _3160 = _3158 + 1.0;
    float _3162 = _3134 * _3138;
    bool _3164 = !_2447;
    int _3166 = _3164 ? _3040 : (-1);
    float _3168 = 1.0 / _3140;
    bool _3170 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3172 = isnan(_954);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3178 = _3174 || _3176;
    float _3180 = float(_3178);
    float _3182 = _3156 * _3160;
    float _3184 = -_3156;
    float _3186 = _3184 + 1.0;
    int _3188 = abs(_3058);
    int _3190 = _3166 * _3074;
    int _3192 = _3190 + _3142;
    bool _3194 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3196 = isnan(_954);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3202 = _3198 || _3200;
    float _3204 = float(_3202);
    float _3206 = _3180 * _3186;
    float _3208 = -_3180;
    float _3210 = _3208 + 1.0;
    bool _3212 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3214 = isnan(_954);
    bool _3216 = _3212 || _3214;
    bool _3218 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3220 = _3216 || _3218;
    float _3222 = float(_3220);
    float _3224 = as_type<float>(_3142);
    int _3226 = as_type<int>(_3182);
    float _3228 = _3044;
    if (!_2496)
    {
        float _3230 = in.m_55.z;
        _3224 = _3230;
    }
    float _3232 = _3224;
    float _3234 = float(uint(_3188));
    float _3236 = _3204 * _3210;
    float _3238 = -_3204;
    float _3240 = _3238 + 1.0;
    bool _3242 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3244 = isnan(_954);
    bool _3246 = _3242 || _3244;
    bool _3248 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3250 = _3246 || _3248;
    float _3252 = float(_3250);
    float _3254 = -_3222;
    float _3256 = _3254 + 1.0;
    int _3258 = as_type<int>(_3168) + (-2);
    float _3260 = 1.0 / _3234;
    float _3262 = float(uint(_3192));
    float _3264 = _3222 * _3240;
    float _3266 = _3252 * _3256;
    float _3268 = in.m_69.x;
    float _3270 = in.m_69.y;
    float _3272 = in.m_69.z;
    int _3274 = abs(_3192);
    float _3276 = as_type<float>(_3258) * _3262;
    bool _3278 = _1300 != 0.0;
    bool _3280 = isnan(_1300);
    bool _3282 = _3278 || _3280;
    bool _3284 = isnan(0.0);
    bool _3286 = _3282 || _3284;
    float _3288 = _2760 * _3266;
    float _3290 = -_3252;
    float _3292 = _3290 + 1.0;
    bool _3294 = _1298 == 0.0;
    bool _3296 = !_3286;
    bool _3298 = _3294 && _3296;
    float _3300 = trunc(_3276);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    float _3306 = float(uint(_3274));
    float _3308 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3288);
    bool _3310 = _1302 == 0.0;
    bool _3312 = _3310 && _3298;
    int _3314 = as_type<int>(_3260) + (-2);
    float _3316 = fma(_2998, _3264, _3308);
    int _3318 = ~_3058;
    int _3320 = _3318 + 1;
    float _3322 = abs(_1934);
    float _3324 = log2(_3322);
    float _3326 = _3252;
    float _3328 = _3232;
    if (!_2496)
    {
        _3326 = _3232;
    }
    float _3330 = _3326;
    float _3332 = as_type<float>(_3314) * _3306;
    float _3334 = _3330;
    if (_2496)
    {
        _3334 = _2463;
    }
    float _3336 = _3334;
    float _3338 = fma(_3000, _3236, _3316);
    if (_2496)
    {
        _3328 = _2463;
    }
    float _3340 = _3328;
    float _3342 = trunc(_3332);
    float _3344 = precise::max(_3342, 0.0);
    uint _3346 = uint(_3344);
    float _3348 = _3268;
    float _3350 = _3272;
    float _3352 = _3270;
    int _3354 = _3320;
    if (!_3312)
    {
        float _3356 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3268);
        _3348 = _3356;
    }
    float _3358 = _3348;
    int _3360 = ~_3188;
    int _3362 = _3360 + 1;
    if (!_3312)
    {
        float _3364 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3350 = _3364;
    }
    float _3366 = _3350;
    int _3368 = _3320 * int(_3304);
    int _3370 = _3368 + _3192;
    if (!_3312)
    {
        float _3372 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3270);
        _3352 = _3372;
    }
    float _3374 = _3352;
    float _3376 = _3336 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3378 = _3324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3380 = float(uint(_3370));
    if (_2632)
    {
        float _3382 = -_3044;
        float _3384 = _3382 + 1.0;
        _3354 = as_type<int>(_3384);
    }
    int _3386 = _3354;
    float _3388 = _1284 * _3374;
    float _3390 = as_type<float>(_3258) * _3380;
    float _3392 = exp2(_3378);
    int _3394 = _3362 * int(_3346);
    int _3396 = _3394 + _3274;
    float _3398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3402 = _1934 <= 8000.0;
    bool _3404 = isnan(_1934);
    bool _3406 = _3402 || _3404;
    bool _3408 = isnan(8000.0);
    bool _3410 = _3406 || _3408;
    float _3412 = float(_3410);
    float _3414 = _1282 * _3374;
    float _3416 = float(uint(_3396));
    float _3418 = trunc(_3390);
    float _3420 = precise::max(_3418, 0.0);
    uint _3422 = uint(_3420);
    float _3424 = fma(_3002, _3206, _3338);
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3428 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3398);
    float _3430 = as_type<float>(_3314) * _3416;
    float _3432 = fma(_3010, _3182, _3424);
    float _3434 = fma(_3340, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3426);
    if (_2606)
    {
        float _3436 = -_3044;
        float _3438 = _3436 + 1.0;
        _3226 = as_type<int>(_3438);
    }
    int _3440 = _3226;
    float _3442 = trunc(_3430);
    float _3444 = precise::max(_3442, 0.0);
    uint _3446 = uint(_3444);
    float _3448 = _2988 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3450 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3452 = precise::clamp(_3450, 0.0, 1.0);
    float _3454 = fma(_3014, _3162, _3432);
    if (_2606)
    {
        float _3456 = _2986 ? as_type<float>(_3440) : _3044;
        _3042 = _3456;
    }
    float _3458 = _3042;
    float _3460 = -_3400;
    float _3462 = fma(_3448, 2.0, _3460);
    float _3464 = fma(_3452, -2.0, 3.0);
    float _3466 = _3452 * _3452;
    float _3468 = fma(_3032, _3144, _3454);
    float _3470 = fma(_1384, _3358, _3414);
    int _3472 = ~_3058;
    int _3474 = _3472 + 1;
    float _3476 = _3466 * _3464;
    int _3478 = int(_3304) + int(_3422);
    float _3480 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3482 = ~_3188;
    int _3484 = _3482 + 1;
    float _3486 = -_3476;
    float _3488 = _3486 + 1.0;
    int _3490 = int(_3346) + int(_3446);
    int _3492 = _3474 * _3478;
    int _3494 = _3492 + _3192;
    float _3496 = fma(_3488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3476);
    float _3498 = fma(_3376, -2.0, _3480);
    if (_2632)
    {
        float _3500 = _2972 ? as_type<float>(_3386) : _3044;
        _3228 = _3500;
    }
    float _3502 = _3228;
    float _3504 = fma(_3096, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3468);
    bool _3506 = uint(_3494) >= uint(_3058);
    int _3508 = _3484 * _3490;
    int _3510 = _3508 + _3274;
    float _3512 = _3412 * _3496;
    int _3514 = _3192 ^ _3058;
    float _3516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3518 = !_3506;
    int _3520 = _3518 ? 0 : (-1);
    float _3522 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3428);
    bool _3524 = uint(_3510) >= uint(_3188);
    float _3526 = -_132;
    float _3528 = fma(_3526, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3462);
    int _3530 = ~_3478;
    int _3532 = _3530 + _3520;
    int _3534 = _3532 + 1;
    float _3536 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3434);
    bool _3538 = !_3524;
    int _3540 = _3538 ? 0 : (-1);
    float _3542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3544 = uint(int(uint(_3514) >> uint(31)));
    int _3546 = _3058 * _3534;
    int _3548 = _3546 + _3192;
    bool _3550 = _3058 == 0;
    float _3552 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3498);
    bool _3554 = _3058 == 0;
    float _3556 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _3558 = ~_3540;
    int _3560 = _3490 + _3558;
    int _3562 = _3560 + 1;
    float _3564 = _3516 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3566 = ~int(_3544);
    int _3568 = _3566 + 1;
    float _3570 = _2810 * _3556;
    float _3572 = precise::clamp(_3570, 0.0, 1.0);
    bool _3574 = !_3550;
    int _3576 = _3574 ? _3548 : (-1);
    float _3578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3580 = _3562 ^ _3568;
    float _3582 = _1278 * _3374;
    float _3584 = fma(_1390, _3358, _3388);
    float _3586 = float(_3576);
    float _3588 = _3542 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3590 = ~_3568;
    int _3592 = _3590 + _3580;
    int _3594 = _3592 + 1;
    float _3596 = fma(_1380, _3358, _3582);
    float _3598 = fma(_1034, _3366, _3584);
    float _3600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3602 = !_3554;
    int _3604 = _3602 ? _3594 : (-1);
    float _3606 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3608 = in.m_71.x;
    float _3610 = fma(_3564, _3502, -0.5);
    float _3612 = float(_3604);
    float _3614 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3606);
    float _3616 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3618 = fma(_3564, _3586, _3528);
    float _3620 = fma(_2784, _3588, -0.5);
    float _3622 = -_3552;
    float _3624 = fma(_3588, _3612, _3622);
    float _3626 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3614);
    float _3628 = _2306 * 0.5;
    float _3630 = exp2(_3616);
    float _3632 = fma(_3522, _3610, _3618);
    float _3634 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3636 = _3458 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3638 = fma(_3536, _3620, _3624);
    float _3640 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3626);
    float _3642 = fma(_1038, _3366, _3470);
    float _3644 = fma(_2356, -0.5, _3628);
    float _3646 = _3632 + 0.5;
    float _3648 = _3634 * _3600;
    float _3650 = _3636 * _3578;
    float _3652 = _3638 + 0.5;
    float _3654 = _3640 + _2306;
    float _3656 = _2352 + _2306;
    float _3658 = -_3572;
    float _3660 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3662 = -_3630;
    float _3664 = _3662 + 1.0;
    float _3666 = _3654 * 0.5;
    float _3668 = _3656 * 0.5;
    float _3670 = _3664 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _3650;
    out.m_73.y = _3648;
    out.m_73.z = _3646;
    out.m_73.w = _3652;
    float _3672 = _3660 * _3608;
    float _3674 = fma(_1036, _3366, _3596);
    float _3676 = _3670 * _2386;
    float _3678 = -_3670;
    float _3680 = _3678 + 1.0;
    out.m_75.x = _3668;
    out.m_75.y = _3644;
    out.m_75.z = _3666;
    out.m_75.w = _2306;
    float _3682 = _3672 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3684 = _2407 * _3676;
    bool _3686 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3688 = isnan(_2078);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3694 = _3690 || _3692;
    out.m_77.x = _3504;
    out.m_79.x = _3682;
    float _3696 = _2397 * _3676;
    out.m_81.x = _3598;
    out.m_81.y = _3642;
    out.m_81.z = _3674;
    float _3698 = fma(_2403, _3696, _2391);
    float _3700 = fma(_2405, _3696, _2393);
    float _3702 = _2397 * _3680;
    float _3704 = fma(_2397, _3684, _2395);
    out.gl_Position.x = _2352;
    out.gl_Position.y = _2356;
    out.gl_Position.z = _3640;
    out.gl_Position.w = _2306;
    float _3706 = _3648;
    float _3708 = _3696;
    float _3710 = _3640;
    if (!_3694)
    {
        _3706 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3712 = _3706;
    float _3714 = _3712;
    float _3716 = _3712;
    if (!_3694)
    {
        _3708 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3718 = _3708;
    out.m_83.x = _3698;
    out.m_83.y = _3700;
    out.m_83.z = _3704;
    out.m_83.w = _3702;
    float _3720 = _1990 * _2052;
    float _3722 = _3720;
    float _3724 = _3718;
    float _3726 = _3718;
    if (!_3694)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3728 = _2792;
    float _3730 = _3728;
    float _3732 = _3728;
    if (!_3694)
    {
        _3710 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3734 = _3710;
    float _3736 = _3720 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3738 = _3734;
    float _3740 = _3734;
    if (!_3694)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3742 = _2794;
    float _3744 = _3742;
    float _3746 = _3742;
    if (!_3694)
    {
        _3722 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3748 = _3722;
    bool _3750 = !_3694;
    float _3752 = _3748;
    float _3754 = _3748;
    if (!_3750)
    {
        bool _3756 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3758 = isnan(_2078);
        bool _3760 = _3756 || _3758;
        bool _3762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3764 = _3760 || _3762;
        if (!_3764)
        {
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = _2078 + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3770;
            float _3774 = 1.0 / _3772;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3792 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3796 = _3768 * _3774;
            float _3798 = precise::clamp(_3796, 0.0, 1.0);
            float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3804 = fma(_3798, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3806 = fma(_3798, _3802, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3808 = fma(_3798, _3782, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3810 = fma(_3798, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3812 = fma(_3798, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3814 = fma(_3798, _3794, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3726 = _3806;
            _3746 = _3812;
            _3716 = _3804;
            _3740 = _3810;
            _3732 = _3808;
            _3754 = _3814;
            _3816 = true;
        }
        else
        {
            bool _3818 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3820 = isnan(_2078);
            bool _3822 = _3818 || _3820;
            bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3826 = _3822 || _3824;
            if (!_3826)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3828 = _3714;
            _3716 = _3828;
            if (!_3826)
            {
                _3724 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3830 = _3724;
            _3726 = _3830;
            if (!_3826)
            {
                _3730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3832 = _3730;
            _3732 = _3832;
            if (!_3826)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3834 = _3738;
            _3740 = _3834;
            if (!_3826)
            {
                _3744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3836 = _3744;
            _3746 = _3836;
            if (!_3826)
            {
                _3752 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3838 = _3752;
            bool _3840 = !_3826;
            _3754 = _3838;
            if (!_3840)
            {
                bool _3842 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3844 = isnan(_2078);
                bool _3846 = _3842 || _3844;
                bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3850 = _3846 || _3848;
                if (!_3850)
                {
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = _2078 + _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3858 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3856;
                    float _3860 = 1.0 / _3858;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3880 = _3878 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3882 = _3854 * _3860;
                    float _3884 = precise::clamp(_3882, 0.0, 1.0);
                    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3890 = fma(_3884, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3892 = fma(_3884, _3888, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3894 = fma(_3884, _3868, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3896 = fma(_3884, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3898 = fma(_3884, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3900 = fma(_3884, _3880, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3726 = _3892;
                    _3746 = _3898;
                    _3716 = _3890;
                    _3740 = _3896;
                    _3732 = _3894;
                    _3754 = _3900;
                    _3816 = true;
                }
                else
                {
                    _3726 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3754 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3816 = false;
    float _3902 = _3726;
    float _3904 = _3746;
    float _3906 = _3716;
    float _3908 = _3740;
    float _3910 = _3732;
    float _3912 = _3754;
    float _3914 = fma(_3642, -0.5, 0.5);
    float _3916 = precise::clamp(_3914, 0.0, 1.0);
    float _3918 = -_3902;
    float _3920 = _3918 + _3904;
    float _3922 = _3736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3924 = -_3906;
    float _3926 = _3924 + _3908;
    float _3928 = fma(_3916, _3920, _3902);
    out.m_85.x = 0.0;
    float _3930 = -_3910;
    float _3932 = _3930 + _3912;
    float _3934 = fma(_3916, _3926, _3906);
    float _3936 = _3928 * 0.586610972881317138671875;
    out.m_49.x = _3922;
    bool _3938 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3940 = fma(_3916, _3932, _3910);
    float _3942 = fma(_3934, 0.298911988735198974609375, _3936);
    bool _3944 = _1990 > 0.0;
    bool _3946 = isnan(_1990);
    bool _3948 = _3944 || _3946;
    bool _3950 = isnan(0.0);
    bool _3952 = _3948 || _3950;
    float _3954 = fma(_3940, 0.114477999508380889892578125, _3942);
    bool _3956 = _2052 <= 0.0;
    bool _3958 = !_3952;
    bool _3960 = _3956 || _3958;
    float _3962 = -_3954;
    float _3964 = _3934 + _3962;
    float _3966 = -_3954;
    float _3968 = _3928 + _3966;
    float _3970 = -_3954;
    float _3972 = _3940 + _3970;
    float _3974 = fma(_3964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    float _3976 = fma(_3968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    float _3978 = fma(_3972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    bool _3980 = !_3938;
    if (!_3980)
    {
        float _3982 = -_1918;
        float _3984 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3986 = -_1920;
        float _3988 = _3986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3990 = -_1922;
        float _3992 = _3990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3994 = _3984 * _3984;
        float _3996 = fma(_3988, _3988, _3994);
        float _3998 = fma(_3992, _3992, _3996);
        float _4000 = sqrt(_3998);
        float _4002 = rsqrt(_3998);
        float _4004 = -_4000;
        float _4006 = _4004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4008 = _4006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4010 = precise::clamp(_4008, 0.0, 1.0);
        float _4012 = _3988 * _4002;
        float _4014 = _3984 * _4002;
        float _4016 = abs(_4010);
        float _4018 = log2(_4016);
        float _4020 = _3992 * _4002;
        float _4022 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4024 = _3642 * _4014;
        float _4026 = -_4014;
        float _4028 = -_4022;
        float _4030 = fma(_4026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4028);
        float _4032 = fma(_3598, _4012, _4024);
        float _4034 = -_4020;
        float _4036 = fma(_4034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4030);
        float _4038 = fma(_3674, _4020, _4032);
        float _4040 = precise::clamp(_4038, 0.0, 1.0);
        float _4042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4044 = _4036 + _4042;
        float _4046 = _4018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4048 = _4044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4050 = precise::clamp(_4048, 0.0, 1.0);
        float _4052 = exp2(_4046);
        float _4054 = _4052 * _4050;
        float _4056 = _4040 * _4054;
        float _4058 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4060 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4062 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _4058;
        out.m_85.y = _4060;
        out.m_85.z = _4062;
    }
    out.m_87.x = _3974;
    out.m_87.y = _3976;
    out.m_87.z = _3978;
    if (!_3960)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4064 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4064;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3816 = false;
    bool _952 = false;
    bool _640 = false;
    bool _478 = false;
    bool _368 = false;
    bool _206 = false;
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
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4122 = as_type<float>(_122);
        out.gl_Position.z = _4122;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_51.w;
    float _128 = float(_106);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _114;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _124 = as_type<int>(_152);
    }
    int _154 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4185 = as_type<float>(_154);
        out.gl_Position.z = _4185;
    }
    if (_148)
    {
        return out;
    }
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    float _162 = 1.0 / _128;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _168 = _158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _170 = _158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _166);
    float _174 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _170);
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _176);
    float _184 = _132 * _162;
    bool _186 = !_164;
    float _204;
    if (!_186)
    {
        float _188 = in.m_55.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        _204 = _184;
    }
    _206 = false;
    float _208 = _204;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    bool _214 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_208);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _208 + _226;
    bool _230 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_208);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_208);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_224;
    float _264 = _262 + 1.0;
    float _266 = 1.0 / _248;
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _244;
    float _282 = _240 * _272;
    float _284 = -_240;
    float _286 = _284 + 1.0;
    float _288 = _228 * _266;
    float _290 = _212 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _296;
    float _300 = fma(_276, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = fma(_298, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = _300 * _282;
    float _308 = _302 * _282;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _326 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _328 = fma(_314, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _330 = fma(_318, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _334 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _310);
    float _336 = fma(_328, _268, _324);
    float _338 = fma(_330, _268, _326);
    float _340 = fma(_332, _268, _334);
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _336);
    float _344 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _338);
    float _346 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _340);
    bool _348 = !_278;
    float _366;
    if (!_348)
    {
        float _350 = in.m_55.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        _366 = _184;
    }
    _368 = false;
    float _370 = _366;
    float _372 = in.m_57.x;
    float _374 = in.m_57.y;
    float _376 = in.m_57.z;
    bool _378 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _380 = isnan(_370);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _394 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _396 = isnan(_370);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _370 + _410;
    float _414 = -_388;
    float _416 = _414 + 1.0;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = 1.0 / _392;
    float _422 = _404 * _416;
    float _424 = -_404;
    float _426 = _424 + 1.0;
    float _428 = _342 * _372;
    float _430 = _408 * _420;
    float _432 = _344 * _374;
    float _434 = fma(_430, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = _346 * _376;
    float _442 = _434 * _422;
    float _444 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[115].x, _442);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _450 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[116].x, _446);
    float _452 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _458 = !_418;
    float _476;
    if (!_458)
    {
        float _460 = in.m_55.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        _476 = _184;
    }
    _478 = false;
    float _480 = _476;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _484 = _480 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _490 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _492 = isnan(_480);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _510 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _512 = isnan(_480);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _488;
    float _524 = -_500;
    float _526 = _524 + 1.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _528;
    bool _532 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _534 = isnan(_480);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _520 * _526;
    float _546 = -_520;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = 1.0 / _504;
    float _554 = _542 * _548;
    float _556 = -_542;
    float _558 = _556 + 1.0;
    float _560 = 1.0 / _508;
    float _562 = _530 * _522;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _568 = fma(_562, _484, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _570 = _566 * _552;
    bool _572 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _574 = isnan(_480);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _590 = _480 + _588;
    float _592 = _568 * _554;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _596 = _480 + _594;
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = fma(_570, _590, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _604 = _586 * _560;
    float _606 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[131].x, _592);
    float _608 = _500 * _600;
    float _610 = fma(_604, _596, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _612 = fma(_602, _544, _606);
    float _614 = fma(_610, _608, _612);
    float _616 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[134].x, _614);
    float _618 = _616 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _620 = !_550;
    float _638;
    if (!_620)
    {
        float _622 = in.m_55.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[14].x, _132);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _184;
    }
    _640 = false;
    float _642 = _638;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _646 = _642 + _644;
    bool _648 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _650 = isnan(_642);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _664 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _666 = isnan(_642);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _676;
    bool _680 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _682 = isnan(_642);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _662;
    float _694 = -_690;
    float _696 = _694 + 1.0;
    bool _698 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _700 = isnan(_642);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _714 = 1.0 / _712;
    bool _716 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _718 = _678 * _692;
    float _720 = -_658;
    float _722 = _720 + 1.0;
    float _724 = -_674;
    float _726 = _724 + 1.0;
    float _728 = -_708;
    float _730 = _728 + 1.0;
    float _732 = fma(_718, _646, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _734 = _674 * _722;
    bool _736 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _738 = isnan(_642);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _690 * _726;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _758 = _746 * _696;
    float _760 = -_746;
    float _762 = _760 + 1.0;
    bool _764 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _766 = isnan(_642);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = 1.0 / _752;
    float _778 = _708 * _762;
    bool _780 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _782 = isnan(_642);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _774 * _730;
    float _794 = -_774;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _802 = _790 * _796;
    float _804 = 1.0 / _756;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _810 = -_790;
    float _812 = _810 + 1.0;
    float _814 = _732 * _802;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _820 = _800 * _714;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _822;
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[159].x, _814);
    float _828 = 1.0 / _818;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _832 = _642 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _838 = _824 * _776;
    float _840 = fma(_820, _832, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _844 = _642 + _842;
    float _846 = 1.0 / _808;
    float _848 = fma(_840, _792, _826);
    float _850 = fma(_838, _844, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _862 = _642 + _860;
    float _864 = fma(_850, _778, _848);
    float _866 = 1.0 / _836;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _872 = _854 * _828;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _876 = _642 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _878;
    float _882 = _870 * _804;
    float _884 = _858 * _846;
    float _886 = fma(_882, _862, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _888 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _890 = isnan(_642);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _902 = _642 + _900;
    float _904 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _906 = fma(_886, _758, _864);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _910 = _642 + _908;
    float _912 = fma(_872, _902, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _914 = _880 * _866;
    float _916 = -_898;
    float _918 = _916 + 1.0;
    float _920 = fma(_904, _748, _906);
    float _922 = fma(_914, _910, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _924 = _658 * _918;
    float _926 = fma(_912, _734, _920);
    float _928 = fma(_922, _924, _926);
    float _930 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[166].x, _928);
    out.m_59.x = _930;
    bool _932 = !_716;
    float _950;
    if (!_932)
    {
        float _934 = in.m_55.x;
        float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _938 = _934 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[14].y, _132);
        float _942 = _940 * _936;
        float _944 = floor(_942);
        float _946 = -_944;
        float _948 = _942 + _946;
        _950 = _948;
        _952 = true;
    }
    else
    {
        _950 = _184;
    }
    _952 = false;
    float _954 = _950;
    float _956 = in.m_46.x;
    float _958 = in.m_46.y;
    float _960 = in.m_46.z;
    float _962 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _964 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _966 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _968 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _970 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _972 = -_968;
    float _974 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _972);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _980 = fma(_184, _978, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _982 = _958 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = _958 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _986 = _958 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[5].x, _982);
    float _990 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[4].x, _984);
    float _992 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _994 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[5].z, _988);
    float _996 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[4].z, _990);
    float _998 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[6].z, _992);
    float _1000 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1002 = _996 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1004 = _998 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1008 = -_1000;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = -_1002;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = -_1004;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = -_1006;
    float _1022 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1024 = _1010 * _1010;
    float _1026 = fma(_1014, _1014, _1024);
    float _1028 = fma(_1018, _1018, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1014 * _1030;
    float _1036 = _1018 * _1030;
    float _1038 = _1010 * _1030;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_1036, _1036, _1040);
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1048 = rsqrt(_1042);
    float _1050 = -_1044;
    float _1052 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1050);
    float _1054 = -_1046;
    float _1056 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1054);
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1062 = -_1058;
    float _1064 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1062);
    float _1066 = -_970;
    float _1068 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1070 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1072 = -_1060;
    float _1074 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1072);
    float _1076 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1078 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1080 = -_1070;
    float _1082 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1080);
    float _1084 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1074);
    float _1086 = _1036 * _1048;
    float _1088 = _1034 * _1048;
    float _1090 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1082);
    float _1092 = -_1076;
    float _1094 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1092);
    float _1096 = -_1086;
    float _1098 = _1036 * _1096;
    float _1100 = -_1086;
    float _1102 = _1038 * _1100;
    float _1104 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1106 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1094);
    float _1108 = -_1098;
    float _1110 = fma(_1034, _1088, _1108);
    float _1112 = _1038 * _1088;
    float _1114 = -_1104;
    float _1116 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1114);
    float _1118 = -_1078;
    float _1120 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1122 = _1110 * _1110;
    float _1124 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1126 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1116);
    float _1128 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1120);
    float _1130 = fma(_1112, _1112, _1122);
    float _1132 = -_1124;
    float _1134 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1136 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1138 = -_1128;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1126);
    float _1142 = fma(_1102, _1102, _1130);
    float _1144 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1134);
    float _1146 = -_1136;
    float _1148 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1146);
    float _1150 = 1.0 / _1140;
    float _1152 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1154 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1148);
    float _1156 = -_1152;
    float _1158 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1156);
    float _1160 = rsqrt(_1142);
    float _1162 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1158);
    float _1164 = fma(_1144, _1150, -1.0);
    float _1166 = _1110 * _1160;
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = -_1168;
    float _1172 = _1170 + 1.0;
    float _1174 = _1172 * _1150;
    float _1176 = fma(_1172, _1164, 1.0);
    float _1178 = _1154 * _1174;
    float _1180 = _1176 * _1176;
    float _1182 = _1162 * _1174;
    float _1184 = fma(_1178, _1178, _1180);
    float _1186 = fma(_1182, _1182, _1184);
    float _1188 = rsqrt(_1186);
    float _1190 = _1182 * _1188;
    float _1192 = _1178 * _1188;
    float _1194 = _1176 * _1188;
    float _1196 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1198 = -_1190;
    float _1200 = _1034 * _1198;
    float _1202 = _1036 * _1194;
    float _1204 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1196);
    float _1206 = -_1192;
    float _1208 = -_1200;
    float _1210 = fma(_1036, _1206, _1208);
    float _1212 = -_1192;
    float _1214 = _1038 * _1212;
    float _1216 = -_1190;
    float _1218 = -_1202;
    float _1220 = fma(_1038, _1216, _1218);
    float _1222 = _1210 * _1210;
    float _1224 = -_1214;
    float _1226 = fma(_1034, _1194, _1224);
    float _1228 = fma(_1220, _1220, _1222);
    float _1230 = fma(_1226, _1226, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1220 * _1232;
    float _1236 = _1226 * _1232;
    float _1238 = _1210 * _1232;
    float _1240 = _1036 * _1234;
    float _1242 = _1038 * _1236;
    float _1244 = -_1240;
    float _1246 = fma(_1034, _1236, _1244);
    float _1248 = _1034 * _1238;
    float _1250 = -_1242;
    float _1252 = fma(_1036, _1238, _1250);
    float _1254 = _1246 * _1246;
    float _1256 = -_1248;
    float _1258 = fma(_1038, _1234, _1256);
    float _1260 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1262 = fma(_1252, _1252, _1254);
    float _1264 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1260);
    float _1266 = fma(_1258, _1258, _1262);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1268;
    float _1272 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1264);
    float _1274 = 1.0 / _1270;
    float _1276 = rsqrt(_1266);
    float _1278 = _1258 * _1276;
    float _1280 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1204);
    float _1282 = _1246 * _1276;
    float _1284 = _1252 * _1276;
    float _1286 = _1034 * _1278;
    float _1288 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1292 = _1036 * _1282;
    float _1294 = -_1286;
    float _1296 = fma(_1036, _1284, _1294);
    float _1298 = in.m_61.x;
    float _1300 = in.m_61.y;
    float _1302 = in.m_61.z;
    float _1304 = -_1290;
    float _1306 = _1288 + _1304;
    float _1308 = -_1292;
    float _1310 = fma(_1038, _1278, _1308);
    float _1312 = _1296 * _1296;
    float _1314 = _1038 * _1284;
    bool _1316 = _1290 >= _1288;
    bool _1318 = isnan(_1290);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(_1288);
    bool _1324 = _1320 || _1322;
    float _1326 = abs(_1306);
    float _1328 = precise::max(_1326, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1330 = fma(_1310, _1310, _1312);
    float _1332 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1334 = -_1314;
    float _1336 = fma(_1034, _1282, _1334);
    float _1338 = precise::min(_1328, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1340 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1332);
    float _1342 = fma(_1336, _1336, _1330);
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1346 = _1338 + _1344;
    float _1348 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1340);
    float _1350 = rsqrt(_1342);
    float _1352 = _1346 * _1274;
    float _1354 = abs(_1032);
    float _1356 = precise::max(0.0, _1354);
    bool _1358 = !_1324;
    float _1360 = _1358 ? 1.0 : (-1.0);
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1298);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1300);
    float _1366 = rsqrt(_1348);
    float _1368 = _184 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1370 = _962 * _1362;
    float _1372 = _1360 * _1352;
    float _1374 = _964 * _1364;
    float _1376 = precise::min(_1356, 40.0);
    float _1378 = _1368 * _1372;
    float _1380 = _1336 * _1350;
    float _1382 = _966 * _1302;
    float _1384 = _1296 * _1350;
    float _1386 = _1374 * _1282;
    float _1388 = fma(_1376, -0.02500000037252902984619140625, 1.0);
    float _1390 = _1310 * _1350;
    float _1392 = _1374 * _1284;
    float _1394 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1400 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1402 = _1374 * _1278;
    float _1404 = _1396 * _1396;
    float _1406 = fma(_1370, _1390, _1392);
    float _1408 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    float _1410 = fma(_1370, _1380, _1402);
    float _1412 = fma(_1398, _1398, _1404);
    float _1414 = fma(_1370, _1384, _1386);
    float _1416 = _1378 * 0.15915493667125701904296875;
    float _1418 = fma(_1382, _1036, _1410);
    float _1420 = fma(_1400, _1400, _1412);
    float _1422 = fma(_1382, _1038, _1414);
    float _1424 = fma(_1382, _1034, _1406);
    float _1426 = _1004 + _1418;
    float _1428 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1408);
    float _1430 = _1000 + _1422;
    float _1432 = _1002 + _1424;
    float _1434 = rsqrt(_1420);
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1442 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1438);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1440);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1450 = _1416 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1446);
    float _1458 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1460 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1462 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1464 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = _1416 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1400 * _1434;
    float _1472 = -_1462;
    float _1474 = _1472 + _1436;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1480 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1482 = fma(_1388, _1474, _1462);
    float _1484 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1476);
    float _1486 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1478);
    float _1488 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1480);
    float _1490 = _1398 * _1434;
    float _1492 = _1396 * _1434;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1484);
    float _1496 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1486);
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1488);
    float _1500 = _1470 * _1470;
    float _1502 = -_1468;
    float _1504 = _1502 + 1.0;
    float _1506 = _1490 * _1452;
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1510 = _1492 * _1452;
    float _1512 = _1492 * _1504;
    float _1514 = fma(_1504, _1500, _1468);
    float _1516 = _1470 * _1452;
    float _1518 = _1490 * _1504;
    float _1520 = fma(_1470, _1512, _1506);
    float _1522 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1524 = -_1000;
    float _1526 = _1524 + _1508;
    float _1528 = -_1516;
    float _1530 = fma(_1492, _1518, _1528);
    float _1532 = -_1510;
    float _1534 = fma(_1470, _1518, _1532);
    float _1536 = -_1002;
    float _1538 = _1536 + _1522;
    float _1540 = _1520 * _1526;
    float _1542 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1544 = fma(_1490, _1518, _1468);
    float _1546 = _1530 * _1526;
    float _1548 = fma(_1534, _1538, _1540);
    float _1550 = -_1004;
    float _1552 = _1550 + _1542;
    float _1554 = fma(_1470, _1518, _1510);
    float _1556 = fma(_1544, _1538, _1546);
    float _1558 = fma(_1492, _1512, _1468);
    float _1560 = fma(_1514, _1552, _1548);
    float _1562 = fma(_1492, _1518, _1516);
    float _1564 = fma(_1554, _1552, _1556);
    float _1566 = _1558 * _1526;
    float _1568 = fma(_1560, _980, _1004);
    float _1570 = -_1506;
    float _1572 = fma(_1470, _1512, _1570);
    float _1574 = fma(_1564, _980, _1002);
    float _1576 = fma(_1562, _1538, _1566);
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1580 = _1568 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1584 = _1574 + _1582;
    float _1586 = fma(_1572, _1552, _1576);
    float _1588 = _1580 * _1580;
    float _1590 = _1000 + _1586;
    float _1592 = fma(_1584, _1584, _1588);
    float _1594 = sqrt(_1592);
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1610 = _1608 != 0;
    float _1612 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1614 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1612);
    bool _1616 = !_1602;
    int _1618 = _1616 ? 0 : 1;
    bool _1620 = !_1598;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1614);
    bool _1626 = !_1606;
    int _1628 = _1626 ? 0 : 1;
    bool _1630 = !_1610;
    int _1632 = _1630 ? 0 : 1;
    bool _1634 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1614;
    float _1638 = _1566;
    float _1640 = _1586;
    float _1642 = _1538;
    float _1644 = _1580;
    if (!_1634)
    {
        _1636 = _1574;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (!_1634)
    {
        _1638 = _1568;
    }
    float _1650 = _1638;
    float _1652 = _1650;
    if (!_1634)
    {
        _1640 = _1590;
    }
    float _1654 = _1640;
    bool _1656 = !_1634;
    float _1658 = _1654;
    if (!_1656)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1664 = _1594 + _1662;
        float _1666 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = rsqrt(_1592);
        float _1670 = _1664 * _1660;
        float _1672 = _1670 * 0.15915493667125701904296875;
        float _1674 = _1672 * 6.283185482025146484375;
        float _1676 = cos(_1674);
        float _1678 = _1672 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        float _1682 = _1676 + (-1.0);
        float _1684 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = fma(_1680, _1666, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1688 = fma(_1590, _1676, _1684);
        float _1690 = _1668 * _1686;
        float _1692 = fma(_1584, _1690, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1694 = fma(_1580, _1690, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1658 = _1688;
        _1648 = _1692;
        _1652 = _1694;
    }
    float _1696 = _1658;
    float _1698 = _1648;
    float _1700 = _1652;
    float _1702 = -_1000;
    float _1704 = _1702 + _1696;
    float _1706 = -_1002;
    float _1708 = _1706 + _1698;
    float _1710 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1712 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1714 = _1704 * _1704;
    float _1716 = -_1004;
    float _1718 = _1716 + _1700;
    float _1720 = 1.0 / _1710;
    float _1722 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1712);
    float _1724 = fma(_1708, _1708, _1714);
    float _1726 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1722);
    float _1728 = fma(_1718, _1718, _1724);
    float _1730 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1732 = sqrt(_1728);
    float _1734 = _1730 + _1710;
    float _1736 = _1734 * _1720;
    float _1738 = _1736 * 0.5;
    bool _1740 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.5);
    bool _1748 = _1744 || _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1750);
    float _1754 = 1.0 / _1752;
    bool _1756 = _1732 > 0.0;
    bool _1758 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan(0.5);
    bool _1766 = _1762 || _1764;
    bool _1768 = !_1756;
    float _1770 = _1698;
    float _1772 = _1696;
    float _1774 = _1700;
    float _1776 = _1720;
    float _1778 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1780 = _1708;
    if (!_1768)
    {
        float _1782 = _180 * _180;
        float _1784 = fma(_178, _178, _1782);
        float _1786 = fma(_182, _182, _1784);
        float _1788 = rsqrt(_1728);
        float _1790 = sqrt(_1786);
        float _1792 = _1708 * _1788;
        float _1794 = _1704 * _1788;
        float _1796 = _1718 * _1788;
        bool _1798 = _1790 > 0.0;
        bool _1800 = !_1798;
        _1642 = _1792;
        _1644 = _1794;
        if (!_1800)
        {
            float _1802 = rsqrt(_1786);
            float _1804 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1806 = _180 * _1802;
            float _1808 = _178 * _1802;
            float _1810 = _1794 * _1806;
            float _1812 = _182 * _1802;
            float _1814 = fma(_1792, _1808, _1810);
            float _1816 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1818 = fma(_1796, _1812, _1814);
            float _1820 = _1818 * _1816;
            float _1822 = fma(_178, _1820, _1698);
            float _1824 = fma(_180, _1820, _1696);
            float _1826 = fma(_182, _1820, _1700);
            _1770 = _1822;
            _1772 = _1824;
            _1774 = _1826;
            _1776 = _1816;
        }
    }
    float _1828 = _1770;
    float _1830 = _1772;
    float _1832 = _1774;
    float _1834 = _1642;
    float _1836 = _1776;
    float _1838 = _1644;
    float _1840 = _1836;
    float _1842 = _1834;
    float _1844 = _1830;
    float _1846 = _1832;
    float _1848 = _1838;
    if (_1748)
    {
        _1840 = 1.0;
    }
    float _1850 = _1840;
    float _1852 = _1850;
    if (_1766)
    {
        _1778 = _1828;
    }
    float _1854 = _1778;
    float _1856 = _1854;
    if (_1766)
    {
        _1842 = _1830;
    }
    float _1858 = _1842;
    float _1860 = _1858;
    if (_1766)
    {
        _1780 = _1832;
    }
    float _1862 = _1780;
    float _1864 = _1862;
    if (!_1766)
    {
        float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1868 = _1000 + _1866;
        float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1872 = _1002 + _1870;
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1876 = -_1000;
        float _1878 = _1876 + _1830;
        float _1880 = _1868 * _1868;
        float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1884 = _1004 + _1882;
        float _1886 = -_1002;
        float _1888 = _1886 + _1828;
        float _1890 = -_1004;
        float _1892 = _1890 + _1832;
        float _1894 = fma(_1872, _1872, _1880);
        float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1898 = fma(_1884, _1884, _1894);
        float _1900 = sqrt(_1898);
        float _1902 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1904 = precise::min(_1900, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1906 = _1904 * _1896;
        float _1908 = _1902 * _1906;
        float _1910 = fma(_1878, _1908, _1000);
        float _1912 = fma(_1888, _1908, _1002);
        float _1914 = fma(_1892, _1908, _1004);
        _1844 = _1878;
        _1860 = _1910;
        _1856 = _1912;
        _1864 = _1914;
        _1846 = _1892;
    }
    float _1916 = _1844;
    float _1918 = _1860;
    float _1920 = _1856;
    float _1922 = _1864;
    float _1924 = _1846;
    float _1926 = _1916;
    float _1928 = _1924;
    if (_1748)
    {
        _1848 = 1.0;
    }
    float _1930 = _1848;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1934 = _1754 * _1932;
    float _1936 = _1930;
    if (!_1748)
    {
        float _1938 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        float _1946 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1948 = _1946 * 0.15915493667125701904296875;
        float _1950 = _1940 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = 1.0 / _1944;
        float _1956 = _1948 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1952 * _1954;
        float _1962 = _1948 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1958 * _1960;
        float _1968 = 1.0 / _1966;
        float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1972 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1970;
        float _1974 = 1.0 / _1972;
        float _1976 = _1964 * _1968;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = fma(_1934, _1976, _1978);
        float _1982 = _1980 * _1974;
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        _1926 = _1948;
        _1928 = _1980;
        _1852 = _1984;
    }
    float _1986 = _1926;
    float _1988 = _1928;
    float _1990 = _1852;
    float _1992 = _1986;
    float _1994 = _1988;
    if (!_1748)
    {
        float _1996 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = _1998 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        float _2004 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2006 = _2004 * 0.15915493667125701904296875;
        float _2008 = _1998 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = 1.0 / _2002;
        float _2014 = _2006 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = _2006 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = 1.0 / _2024;
        float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2030 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2028;
        float _2032 = 1.0 / _2030;
        float _2034 = _2022 * _2026;
        float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2038 = fma(_1934, _2034, _2036);
        float _2040 = _2038 * _2032;
        float _2042 = precise::clamp(_2040, 0.0, 1.0);
        float _2044 = -_2042;
        float _2046 = _2044 + 1.0;
        _1992 = _2012;
        _1994 = _2034;
        _1936 = _2046;
    }
    float _2048 = _1992;
    float _2050 = _1994;
    float _2052 = _1936;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _1918 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2060 = _1920 + _2058;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2064 = _1922 + _2062;
    float _2066 = _2056 * _2056;
    float _2068 = fma(_2060, _2060, _2066);
    float _2070 = fma(_1002, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2072 = fma(_2064, _2064, _2068);
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2076 = rsqrt(_2072);
    float _2078 = sqrt(_2072);
    float _2080 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2082 = _2060 * _2080;
    float _2084 = _2064 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 * _2084;
    float _2090 = _2086 + _2088;
    float _2092 = sqrt(_2090);
    bool _2094 = _2092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2092 + _2096;
    float _2100 = _2076;
    float _2102 = _2098;
    float _2104 = _2048;
    float _2106 = _2056;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2094)
    {
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2100 = _2110;
    }
    float _2112 = _2100;
    float _2114 = _2112;
    if (_2094)
    {
        float _2116 = _2098 * _2112;
        _2102 = _2116;
    }
    float _2118 = _2102;
    if (_2094)
    {
        float _2120 = rsqrt(_2090);
        _2114 = _2120;
    }
    float _2122 = _2114;
    float _2124 = _2122;
    if (_2094)
    {
        float _2126 = _2118 * 0.15915493667125701904296875;
        _2104 = _2126;
    }
    float _2128 = _2104;
    float _2130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2132 = _2064;
    float _2134 = _2128;
    if (_2094)
    {
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2144 = precise::max(0.0, _2130);
    float _2146 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2142);
    float _2148 = _2050;
    float _2150 = _2144;
    if (_2094)
    {
        float _2152 = _2128 * 6.283185482025146484375;
        float _2154 = cos(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = -_2080;
    float _2160 = -_2144;
    float _2162 = fma(_2056, _2158, _2160);
    float _2164 = _2162;
    if (_2094)
    {
        float _2166 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2166;
    }
    float _2168 = _2106;
    float _2170 = _2140;
    if (_2094)
    {
        float _2172 = fma(_2140, _2168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2170 = _2172;
    }
    float _2174 = _2170;
    float _2176 = floor(_2070);
    float _2178 = _2174;
    if (_2094)
    {
        float _2180 = _2122 * _2174;
        _2108 = _2180;
    }
    float _2182 = _2108;
    if (!_2094)
    {
        _2124 = _2082;
    }
    float _2184 = _2124;
    float _2186 = _2184;
    float _2188 = _2156;
    if (_2094)
    {
        float _2190 = _2156 + (-1.0);
        _2150 = _2190;
    }
    float _2192 = _2150;
    float _2194 = _2192;
    if (_2094)
    {
        float _2196 = _2082 * _2182;
        _2186 = _2196;
    }
    float _2198 = _2186;
    if (!_2094)
    {
        _2178 = _2086;
    }
    float _2200 = _2178;
    float _2202 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2204 = _2200;
    if (_2094)
    {
        float _2206 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2206;
    }
    float _2208 = _2134;
    if (!_2094)
    {
        _2194 = _2084;
    }
    float _2210 = _2194;
    float _2212 = _2210;
    if (_2094)
    {
        float _2214 = _2084 * _2182;
        _2212 = _2214;
    }
    float _2216 = _2212;
    if (_2094)
    {
        float _2218 = fma(_2162, _2156, _2208);
        _2164 = _2218;
    }
    float _2220 = _2164;
    if (_2094)
    {
        float _2222 = _2198 * _2198;
        _2204 = _2222;
    }
    float _2224 = _2204;
    if (!_2094)
    {
        _2188 = _2088;
    }
    float _2226 = _2188;
    float _2228 = _2226;
    if (_2094)
    {
        float _2230 = _2216 * _2216;
        _2228 = _2230;
    }
    float _2232 = _2228;
    float _2234 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2236 = fma(_2220, _2220, _2224);
    float _2238 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2240 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2202);
    float _2242 = floor(_2234);
    float _2244 = _2236 + _2232;
    float _2246 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2248 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2238);
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2252 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2250);
    float _2254 = precise::clamp(_2252, 0.0, 1.0);
    float _2256 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2246);
    float _2258 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2248);
    float _2260 = rsqrt(_2244);
    float _2262 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2240);
    float _2264 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2256);
    float _2266 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2268 = -_2254;
    float _2270 = _2268 + 1.0;
    float _2272 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2274 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2278 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2280 = abs(_2270);
    float _2282 = log2(_2280);
    float _2284 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2276);
    float _2288 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2290 = -_2176;
    float _2292 = _2070 + _2290;
    float _2294 = -_2284;
    float _2296 = fma(_2294, _2074, 1.0);
    float _2298 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2300 = _2260 * _2198;
    float _2302 = _2260 * _2216;
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2306 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2298);
    float _2308 = _2260 * _2220;
    float _2310 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2312 = log2(_2296);
    float _2314 = -_2242;
    float _2316 = _2234 + _2314;
    float _2318 = _2308 + 1.0;
    float _2320 = -_2310;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2320);
    float _2324 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2326 = -_2302;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2322);
    float _2330 = 1.0 / _2306;
    float _2332 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2334 = fma(_2328, -0.5, 0.5);
    float _2336 = fma(_2328, 0.5, 0.5);
    float _2338 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2304);
    float _2340 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2332);
    float _2342 = exp2(_2324);
    float _2344 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2338);
    float _2346 = fma(_2336, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2348 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2340);
    float _2350 = _2312 * 0.693147182464599609375;
    float _2352 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2344);
    float _2354 = fma(_2336, _2346, -0.212114393711090087890625);
    float _2356 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2348);
    float _2358 = sqrt(_2334);
    float _2360 = _2352 * _2330;
    float _2362 = fma(_2336, _2354, 1.570728778839111328125);
    float _2364 = _2356 * _2330;
    float _2366 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2368 = fma(_2360, 0.5, 0.5);
    float _2370 = fma(_2364, -0.5, 0.5);
    float _2372 = -_2308;
    float _2374 = fma(_2342, _2318, _2372);
    float2 _7762 = float2(_2292, _2316);
    float _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7762, float2(0.0), isnan(_7762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7762, float2(0.0), isnan(_7762)), level(0.0)).x;
    float _2378 = fma(_2374, 0.5, 0.5);
    float _2380 = _2358 * 0.636619746685028076171875;
    float _2382 = -_2362;
    float _2384 = fma(_2380, _2382, 1.0);
    float3 _7783 = float3(_2368, _2370, _2366);
    float _2386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7783, float3(0.0), isnan(_7783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7783, float3(0.0), isnan(_7783)), level(0.0)).x;
    float3 _7794 = float3(_2368, _2370, _2366);
    float4 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7794, float3(0.0), isnan(_7794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7794, float3(0.0), isnan(_7794)), level(0.0)).xyzw;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = _2389.w;
    float2 _7810 = float2(_2384, _2378);
    float3 _2401 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7810, float2(0.0), isnan(_7810)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7810, float2(0.0), isnan(_7810)), level(0.0)).xyz;
    float _2403 = _2401.x;
    float _2405 = _2401.y;
    float _2407 = _2401.z;
    float _2409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2411 = int(_2409);
    int _2413 = abs(_1618);
    out.m_63.x = _454;
    out.m_63.y = _444;
    out.m_63.z = _452;
    out.m_63.w = _456;
    int _2415 = abs(_1632);
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2419 = _954 + _2417;
    out.m_65.w = _618;
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2423 = _954 + _2421;
    float _2425 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2427 = int(_2425);
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2433 = in.m_67.x;
    float _2435 = float(_2411);
    float _2437 = 1.0 / _2431;
    float _2439 = float(uint(_2427));
    float _2441 = 1.0 / _2435;
    int _2443 = ~_2427;
    int _2445 = _2443 + 1;
    bool _2447 = _2427 == 0;
    int _2449 = ~_2427;
    int _2451 = _2449 + 1;
    int _2453 = ~_2427;
    int _2455 = _2453 + 1;
    float _2457 = 1.0 / _2439;
    int _2459 = ~_2427;
    int _2461 = _2459 + 1;
    float _2463 = in.m_55.y;
    float _2465 = _132 * _2441;
    float _2467 = trunc(_2465);
    int _2469 = int(_2467);
    int _2471 = as_type<int>(_2457) + (-2);
    float _2473 = float(uint(_2469));
    float _2475 = as_type<float>(_2471) * _2473;
    float _2477 = in.m_55.x;
    float _2479 = trunc(_2475);
    float _2481 = precise::max(_2479, 0.0);
    uint _2484 = uint(_2481);
    int _2486 = _2461 * int(_2484);
    int _2488 = _2486 + _2469;
    float _2490 = float(uint(_2488));
    float _2492 = as_type<float>(_2471) * _2490;
    int _2494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2496 = _2494 != 0;
    float _2498 = trunc(_2492);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = !_2496;
    float _2506 = _2504 ? 1.2345600128173828125 : 1.0;
    bool _2508 = !_2496;
    float _2510 = _2508 ? _2463 : _2477;
    float _2512 = _2510 * _2506;
    float _2514 = floor(_2512);
    int _2516 = int(_2484) + int(_2502);
    float _2518 = float(_2427);
    float _2520 = float(_2469);
    int _2522 = _2445 * _2516;
    int _2524 = _2522 + _2469;
    bool _2526 = _2520 >= _2518;
    bool _2528 = isnan(_2520);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(_2518);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    bool _2538 = uint(_2524) >= uint(_2427);
    float _2540 = trunc(_2536);
    int _2542 = int(_2540);
    bool _2544 = !_2538;
    int _2546 = _2544 ? 0 : (-1);
    float _2548 = -_2514;
    float _2550 = _2512 + _2548;
    int _2552 = ~_2516;
    int _2554 = _2552 + _2546;
    int _2556 = _2554 + 1;
    float _2558 = _2550 * _2518;
    float _2560 = _132 * _2518;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2564 = _2562 != 0;
    int _2566 = _2427 * _2556;
    int _2568 = _2566 + _2469;
    float _2570 = _2560 * _162;
    float _2572 = trunc(_2558);
    int _2574 = int(_2572);
    int _2576 = _2427 + (-1);
    bool _2578 = !_2447;
    int _2580 = _2578 ? _2568 : (-1);
    int _2582 = ~_2542;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    bool _2588 = !_2564;
    int _2590 = _2588 ? 0 : 1;
    float _2592 = trunc(_2570);
    int _2594 = int(_2592);
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2598 = _2596 != 0;
    int _2600 = _2580 * _2586;
    int _2602 = abs(_2590);
    int _2604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2606 = _2604 != 0;
    int _2608 = _2542 * _2576;
    int _2610 = _2608 + _2600;
    int _2612 = abs(_1622);
    int _2614 = abs(_1628);
    int _2616 = _2610 * _2413;
    int _2618 = _2574 * _2602;
    int _2620 = _2618 + _2469;
    int _2622 = ~_2427;
    int _2624 = _2622 + 1;
    int _2626 = _2594 * _2612;
    int _2628 = _2626 + _2616;
    int _2630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2632 = _2630 != 0;
    float _2634 = float(uint(_2620));
    int _2636 = _2620 * _2614;
    int _2638 = _2636 + _2628;
    int _2640 = _2574 * _2415;
    int _2642 = _2640 + _2638;
    int _2644 = ~_2427;
    int _2646 = _2644 + 1;
    float _2648 = in.m_55.w;
    float _2650 = as_type<float>(_2471) * _2634;
    float _2652 = float(uint(_2642));
    float _2654 = trunc(_2650);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = as_type<float>(_2471) * _2652;
    float _2662 = trunc(_2660);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    int _2668 = _2451 * int(_2658);
    int _2670 = _2668 + _2620;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2676 = _2648 > 0.5;
    float _2678 = float(uint(_2670));
    int _2680 = _2646 * int(_2666);
    int _2682 = _2680 + _2642;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2684;
    float _2688 = as_type<float>(_2471) * _2678;
    float _2690 = float(uint(_2682));
    float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2694 = _2692 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2696 = in.m_67.y;
    float _2698 = trunc(_2688);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = as_type<float>(_2471) * _2690;
    float _2706 = trunc(_2704);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    float _2712 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2716 = 1.0 / _2714;
    int _2718 = int(_2658) + int(_2702);
    float _2720 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2722 = _2720 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2724 = -_2696;
    float _2726 = _2724 + 1.0;
    int _2728 = int(_2666) + int(_2710);
    int _2730 = _2455 * _2718;
    int _2732 = _2730 + _2620;
    float _2734 = 1.0 / _2674;
    int _2736 = _2624 * _2728;
    int _2738 = _2736 + _2642;
    float _2740 = _2686 * _2716;
    float _2742 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _2746 = uint(_2738) >= uint(_2427);
    float _2748 = 1.0 / _2722;
    int _2750 = _2676 ? as_type<int>(_2726) : as_type<int>(_2696);
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _2756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2758 = _2756 != 0;
    float _2760 = fma(_2740, _2419, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2762 = !_2746;
    int _2764 = _2762 ? 0 : (-1);
    float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2768 = _954 + _2766;
    int _2770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2772 = _2770 != 0;
    float _2774 = 1.0 / _2754;
    int _2776 = ~_2728;
    int _2778 = _2776 + _2764;
    int _2780 = _2778 + 1;
    float _2782 = _2744 * _2734;
    float _2784 = _2772 ? as_type<float>(_2750) : _2696;
    bool _2786 = _2463 > 0.5;
    float _2788 = 1.0 / _2694;
    float _2790 = _2696;
    float _2792 = _2306;
    float _2794 = _2356;
    if (_2758)
    {
        float _2796 = _2786 ? _2726 : _2696;
        _2790 = _2796;
    }
    float _2798 = _2790;
    int _2800 = _2427 * _2780;
    int _2802 = _2800 + _2642;
    bool _2804 = !_2447;
    int _2806 = _2804 ? _2802 : (-1);
    float _2808 = -_2376;
    float _2810 = _2808 + 1.0;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2814 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2812;
    float _2816 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2818 = _2816 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2820 = _2806 >> 31;
    int _2822 = _2806 & 3;
    bool _2824 = _2822 != 0;
    int _2826 = _2820 & 3;
    float _2828 = _2814 * _2748;
    int _2830 = _2806 & 3;
    bool _2832 = _2830 != 0;
    float _2834 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2834;
    int _2838 = _2806 + _2826;
    float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2842 = _2840 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _2844 = _2824 ? 0 : 1;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    if (_2632)
    {
        float _2848 = in.m_55.z;
        _2846 = _2848;
    }
    float _2850 = _2846;
    int _2852 = _2838 >> 2;
    float _2854 = 1.0 / _2842;
    bool _2856 = uint(_2830) > 1u;
    float _2858 = _2818 * _2788;
    int _2860 = _2852 << 4;
    int _2862 = _2860 + 512;
    float _2864 = _2836 * _2774;
    int _2866 = ~_2844;
    int _2868 = _2866 + 1;
    int _2870 = _2868 + 1;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2874 = _2872 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    uint _2876 = uint(int(uint(_2862) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = _2874 * _2437;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2896 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2894;
    int _2898 = _2870;
    float _2900 = _2864;
    if (!_2856)
    {
        int _2902 = ~_2844;
        int _2904 = _2902 + 1;
        _2898 = _2904;
    }
    int _2906 = _2898;
    bool _2908 = uint(_2830) >= 2u;
    float _2910 = _2896 * _2854;
    bool _2912 = !_2832;
    int _2914 = _2912 ? 0 : 1;
    bool _2916 = _2830 != 3;
    float _2918 = _2908 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2920 = _2830 != 3;
    int _2922 = _2862 + 8;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    uint _2926 = uint(int(uint(int(_2924)) >> uint(2)));
    int _2928 = int(_2924) & 3;
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[int(_2926)][_2928];
    int _2932 = int(_2924) + 1;
    uint _2934 = uint(int(uint(_2932) >> uint(2)));
    int _2936 = _2932 & 3;
    float _2938 = (*spvDescriptorSet0.vp_c9)._m0[int(_2934)][_2936];
    int _2940 = ~as_type<int>(_2918);
    int _2942 = _2940 + 1;
    int _2944 = _2942 + 1;
    bool _2946 = !_2920;
    int _2948 = _2946 ? 0 : (-1);
    bool _2950 = uint(_2732) >= uint(_2427);
    float _2952 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2954 = _954 + _2952;
    int _2956 = _2944;
    bool _2958 = _2916;
    float _2960 = _2918;
    bool _2962 = _2950;
    if (_2916)
    {
        int _2964 = ~as_type<int>(_2918);
        int _2966 = _2964 + 1;
        _2956 = _2966;
    }
    int _2968 = _2956;
    if (_2632)
    {
        bool _2970 = _2850 > 0.5;
        _2958 = _2970;
    }
    bool _2972 = _2958;
    if (!_2496)
    {
        _2960 = _2463;
    }
    float _2974 = _2960;
    bool _2976 = !_2950;
    float _2978 = _2976 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2980 = _2974;
    float _2982 = _2978;
    if (_2606)
    {
        bool _2984 = _2477 > 0.5;
        _2962 = _2984;
    }
    bool _2986 = _2962;
    if (_2496)
    {
        _2980 = _2477;
    }
    float _2988 = _2980;
    float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2992 = _954 + _2990;
    int _2994 = abs(_2914);
    int _2996 = abs(_2968);
    float _2998 = fma(_2782, _2992, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3000 = fma(_2828, _2423, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3002 = fma(_2858, _2768, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3004 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3006 = _954 + _3004;
    int _3008 = abs(_2906);
    float _3010 = fma(_2864, _2954, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    if (!_2606)
    {
        _2900 = _2433;
    }
    float _3012 = _2900;
    float _3014 = fma(_2892, _3006, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3016 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3018 = _954 + _3016;
    int _3020 = ~_2718;
    int _3022 = _3020 + as_type<int>(_2978);
    int _3024 = _3022 + 1;
    int _3026 = ~_3008;
    int _3028 = _3026 + 1;
    int _3030 = _3028 + 1;
    float _3032 = fma(_2910, _3018, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3034 = _3012;
    if (!_2606)
    {
        _2982 = _3012;
    }
    float _3036 = _2982;
    int _3038 = _2427 * _3024;
    int _3040 = _3038 + _2620;
    float _3042 = _3036;
    if (_2606)
    {
        _3034 = _2433;
    }
    float _3044 = _3034;
    int _3046 = _3030 * as_type<int>(_2890);
    int _3048 = abs(_2948);
    int _3050 = ~_2994;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    float _3056 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3058 = int(_3056);
    bool _3060 = !_2598;
    int _3062 = _3060 ? 0 : 1;
    int _3064 = ~_2996;
    int _3066 = _3064 + 1;
    int _3068 = _3066 + 1;
    int _3070 = _3054 * as_type<int>(_2882);
    int _3072 = _3070 + _3046;
    int _3074 = abs(_3062);
    int _3076 = ~_3048;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    int _3082 = _3068 * as_type<int>(_2930);
    int _3084 = _3082 + _3072;
    bool _3086 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3088 = isnan(_954);
    bool _3090 = _3086 || _3088;
    bool _3092 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3094 = _3090 || _3092;
    float _3096 = float(_3094);
    bool _3098 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3100 = isnan(_954);
    bool _3102 = _3098 || _3100;
    bool _3104 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3106 = _3102 || _3104;
    float _3108 = float(_3106);
    int _3110 = _3080 * as_type<int>(_2938);
    int _3112 = _3110 + _3084;
    int _3114 = ~_3074;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    float _3120 = -_3096;
    float _3122 = _3120 + 1.0;
    bool _3124 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3126 = isnan(_954);
    bool _3128 = _3124 || _3126;
    bool _3130 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3132 = _3128 || _3130;
    float _3134 = float(_3132);
    float _3136 = -_3108;
    float _3138 = _3136 + 1.0;
    float _3140 = float(uint(_3058));
    int _3142 = _3112 * _3118;
    float _3144 = _3108 * _3122;
    bool _3146 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3148 = isnan(_954);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3154 = _3150 || _3152;
    float _3156 = float(_3154);
    float _3158 = -_3134;
    float _3160 = _3158 + 1.0;
    float _3162 = _3134 * _3138;
    bool _3164 = !_2447;
    int _3166 = _3164 ? _3040 : (-1);
    float _3168 = 1.0 / _3140;
    bool _3170 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3172 = isnan(_954);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3178 = _3174 || _3176;
    float _3180 = float(_3178);
    float _3182 = _3156 * _3160;
    float _3184 = -_3156;
    float _3186 = _3184 + 1.0;
    int _3188 = abs(_3058);
    int _3190 = _3166 * _3074;
    int _3192 = _3190 + _3142;
    bool _3194 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3196 = isnan(_954);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3202 = _3198 || _3200;
    float _3204 = float(_3202);
    float _3206 = _3180 * _3186;
    float _3208 = -_3180;
    float _3210 = _3208 + 1.0;
    bool _3212 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3214 = isnan(_954);
    bool _3216 = _3212 || _3214;
    bool _3218 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3220 = _3216 || _3218;
    float _3222 = float(_3220);
    float _3224 = as_type<float>(_3142);
    int _3226 = as_type<int>(_3182);
    float _3228 = _3044;
    if (!_2496)
    {
        float _3230 = in.m_55.z;
        _3224 = _3230;
    }
    float _3232 = _3224;
    float _3234 = float(uint(_3188));
    float _3236 = _3204 * _3210;
    float _3238 = -_3204;
    float _3240 = _3238 + 1.0;
    bool _3242 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3244 = isnan(_954);
    bool _3246 = _3242 || _3244;
    bool _3248 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3250 = _3246 || _3248;
    float _3252 = float(_3250);
    float _3254 = -_3222;
    float _3256 = _3254 + 1.0;
    int _3258 = as_type<int>(_3168) + (-2);
    float _3260 = 1.0 / _3234;
    float _3262 = float(uint(_3192));
    float _3264 = _3222 * _3240;
    float _3266 = _3252 * _3256;
    float _3268 = in.m_69.x;
    float _3270 = in.m_69.y;
    float _3272 = in.m_69.z;
    int _3274 = abs(_3192);
    float _3276 = as_type<float>(_3258) * _3262;
    bool _3278 = _1300 != 0.0;
    bool _3280 = isnan(_1300);
    bool _3282 = _3278 || _3280;
    bool _3284 = isnan(0.0);
    bool _3286 = _3282 || _3284;
    float _3288 = _2760 * _3266;
    float _3290 = -_3252;
    float _3292 = _3290 + 1.0;
    bool _3294 = _1298 == 0.0;
    bool _3296 = !_3286;
    bool _3298 = _3294 && _3296;
    float _3300 = trunc(_3276);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    float _3306 = float(uint(_3274));
    float _3308 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3288);
    bool _3310 = _1302 == 0.0;
    bool _3312 = _3310 && _3298;
    int _3314 = as_type<int>(_3260) + (-2);
    float _3316 = fma(_2998, _3264, _3308);
    int _3318 = ~_3058;
    int _3320 = _3318 + 1;
    float _3322 = abs(_1934);
    float _3324 = log2(_3322);
    float _3326 = _3252;
    float _3328 = _3232;
    if (!_2496)
    {
        _3326 = _3232;
    }
    float _3330 = _3326;
    float _3332 = as_type<float>(_3314) * _3306;
    float _3334 = _3330;
    if (_2496)
    {
        _3334 = _2463;
    }
    float _3336 = _3334;
    float _3338 = fma(_3000, _3236, _3316);
    if (_2496)
    {
        _3328 = _2463;
    }
    float _3340 = _3328;
    float _3342 = trunc(_3332);
    float _3344 = precise::max(_3342, 0.0);
    uint _3346 = uint(_3344);
    float _3348 = _3268;
    float _3350 = _3272;
    float _3352 = _3270;
    int _3354 = _3320;
    if (!_3312)
    {
        float _3356 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3268);
        _3348 = _3356;
    }
    float _3358 = _3348;
    int _3360 = ~_3188;
    int _3362 = _3360 + 1;
    if (!_3312)
    {
        float _3364 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3350 = _3364;
    }
    float _3366 = _3350;
    int _3368 = _3320 * int(_3304);
    int _3370 = _3368 + _3192;
    if (!_3312)
    {
        float _3372 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3270);
        _3352 = _3372;
    }
    float _3374 = _3352;
    float _3376 = _3336 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3378 = _3324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3380 = float(uint(_3370));
    if (_2632)
    {
        float _3382 = -_3044;
        float _3384 = _3382 + 1.0;
        _3354 = as_type<int>(_3384);
    }
    int _3386 = _3354;
    float _3388 = _1284 * _3374;
    float _3390 = as_type<float>(_3258) * _3380;
    float _3392 = exp2(_3378);
    int _3394 = _3362 * int(_3346);
    int _3396 = _3394 + _3274;
    float _3398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3402 = _1934 <= 8000.0;
    bool _3404 = isnan(_1934);
    bool _3406 = _3402 || _3404;
    bool _3408 = isnan(8000.0);
    bool _3410 = _3406 || _3408;
    float _3412 = float(_3410);
    float _3414 = _1282 * _3374;
    float _3416 = float(uint(_3396));
    float _3418 = trunc(_3390);
    float _3420 = precise::max(_3418, 0.0);
    uint _3422 = uint(_3420);
    float _3424 = fma(_3002, _3206, _3338);
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3428 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3398);
    float _3430 = as_type<float>(_3314) * _3416;
    float _3432 = fma(_3010, _3182, _3424);
    float _3434 = fma(_3340, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3426);
    if (_2606)
    {
        float _3436 = -_3044;
        float _3438 = _3436 + 1.0;
        _3226 = as_type<int>(_3438);
    }
    int _3440 = _3226;
    float _3442 = trunc(_3430);
    float _3444 = precise::max(_3442, 0.0);
    uint _3446 = uint(_3444);
    float _3448 = _2988 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3450 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3452 = precise::clamp(_3450, 0.0, 1.0);
    float _3454 = fma(_3014, _3162, _3432);
    if (_2606)
    {
        float _3456 = _2986 ? as_type<float>(_3440) : _3044;
        _3042 = _3456;
    }
    float _3458 = _3042;
    float _3460 = -_3400;
    float _3462 = fma(_3448, 2.0, _3460);
    float _3464 = fma(_3452, -2.0, 3.0);
    float _3466 = _3452 * _3452;
    float _3468 = fma(_3032, _3144, _3454);
    float _3470 = fma(_1384, _3358, _3414);
    int _3472 = ~_3058;
    int _3474 = _3472 + 1;
    float _3476 = _3466 * _3464;
    int _3478 = int(_3304) + int(_3422);
    float _3480 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3482 = ~_3188;
    int _3484 = _3482 + 1;
    float _3486 = -_3476;
    float _3488 = _3486 + 1.0;
    int _3490 = int(_3346) + int(_3446);
    int _3492 = _3474 * _3478;
    int _3494 = _3492 + _3192;
    float _3496 = fma(_3488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3476);
    float _3498 = fma(_3376, -2.0, _3480);
    if (_2632)
    {
        float _3500 = _2972 ? as_type<float>(_3386) : _3044;
        _3228 = _3500;
    }
    float _3502 = _3228;
    float _3504 = fma(_3096, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3468);
    bool _3506 = uint(_3494) >= uint(_3058);
    int _3508 = _3484 * _3490;
    int _3510 = _3508 + _3274;
    float _3512 = _3412 * _3496;
    int _3514 = _3192 ^ _3058;
    float _3516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3518 = !_3506;
    int _3520 = _3518 ? 0 : (-1);
    float _3522 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3428);
    bool _3524 = uint(_3510) >= uint(_3188);
    float _3526 = -_132;
    float _3528 = fma(_3526, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3462);
    int _3530 = ~_3478;
    int _3532 = _3530 + _3520;
    int _3534 = _3532 + 1;
    float _3536 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3434);
    bool _3538 = !_3524;
    int _3540 = _3538 ? 0 : (-1);
    float _3542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3544 = uint(int(uint(_3514) >> uint(31)));
    int _3546 = _3058 * _3534;
    int _3548 = _3546 + _3192;
    bool _3550 = _3058 == 0;
    float _3552 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3498);
    bool _3554 = _3058 == 0;
    float _3556 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _3558 = ~_3540;
    int _3560 = _3490 + _3558;
    int _3562 = _3560 + 1;
    float _3564 = _3516 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3566 = ~int(_3544);
    int _3568 = _3566 + 1;
    float _3570 = _2810 * _3556;
    float _3572 = precise::clamp(_3570, 0.0, 1.0);
    bool _3574 = !_3550;
    int _3576 = _3574 ? _3548 : (-1);
    float _3578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3580 = _3562 ^ _3568;
    float _3582 = _1278 * _3374;
    float _3584 = fma(_1390, _3358, _3388);
    float _3586 = float(_3576);
    float _3588 = _3542 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3590 = ~_3568;
    int _3592 = _3590 + _3580;
    int _3594 = _3592 + 1;
    float _3596 = fma(_1380, _3358, _3582);
    float _3598 = fma(_1034, _3366, _3584);
    float _3600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3602 = !_3554;
    int _3604 = _3602 ? _3594 : (-1);
    float _3606 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3608 = in.m_71.x;
    float _3610 = fma(_3564, _3502, -0.5);
    float _3612 = float(_3604);
    float _3614 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3606);
    float _3616 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3618 = fma(_3564, _3586, _3528);
    float _3620 = fma(_2784, _3588, -0.5);
    float _3622 = -_3552;
    float _3624 = fma(_3588, _3612, _3622);
    float _3626 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3614);
    float _3628 = _2306 * 0.5;
    float _3630 = exp2(_3616);
    float _3632 = fma(_3522, _3610, _3618);
    float _3634 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3636 = _3458 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3638 = fma(_3536, _3620, _3624);
    float _3640 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3626);
    float _3642 = fma(_1038, _3366, _3470);
    float _3644 = fma(_2356, -0.5, _3628);
    float _3646 = _3632 + 0.5;
    float _3648 = _3634 * _3600;
    float _3650 = _3636 * _3578;
    float _3652 = _3638 + 0.5;
    float _3654 = _3640 + _2306;
    float _3656 = _2352 + _2306;
    float _3658 = -_3572;
    float _3660 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3662 = -_3630;
    float _3664 = _3662 + 1.0;
    float _3666 = _3654 * 0.5;
    float _3668 = _3656 * 0.5;
    float _3670 = _3664 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _3650;
    out.m_73.y = _3648;
    out.m_73.z = _3646;
    out.m_73.w = _3652;
    float _3672 = _3660 * _3608;
    float _3674 = fma(_1036, _3366, _3596);
    float _3676 = _3670 * _2386;
    float _3678 = -_3670;
    float _3680 = _3678 + 1.0;
    out.m_75.x = _3668;
    out.m_75.y = _3644;
    out.m_75.z = _3666;
    out.m_75.w = _2306;
    float _3682 = _3672 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3684 = _2407 * _3676;
    bool _3686 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3688 = isnan(_2078);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3694 = _3690 || _3692;
    out.m_77.x = _3504;
    out.m_79.x = _3682;
    float _3696 = _2397 * _3676;
    out.m_81.x = _3598;
    out.m_81.y = _3642;
    out.m_81.z = _3674;
    float _3698 = fma(_2403, _3696, _2391);
    float _3700 = fma(_2405, _3696, _2393);
    float _3702 = _2397 * _3680;
    float _3704 = fma(_2397, _3684, _2395);
    out.gl_Position.x = _2352;
    out.gl_Position.y = _2356;
    out.gl_Position.z = _3640;
    out.gl_Position.w = _2306;
    float _3706 = _3648;
    float _3708 = _3696;
    float _3710 = _3640;
    if (!_3694)
    {
        _3706 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3712 = _3706;
    float _3714 = _3712;
    float _3716 = _3712;
    if (!_3694)
    {
        _3708 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3718 = _3708;
    out.m_83.x = _3698;
    out.m_83.y = _3700;
    out.m_83.z = _3704;
    out.m_83.w = _3702;
    float _3720 = _1990 * _2052;
    float _3722 = _3720;
    float _3724 = _3718;
    float _3726 = _3718;
    if (!_3694)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3728 = _2792;
    float _3730 = _3728;
    float _3732 = _3728;
    if (!_3694)
    {
        _3710 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3734 = _3710;
    float _3736 = _3720 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3738 = _3734;
    float _3740 = _3734;
    if (!_3694)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3742 = _2794;
    float _3744 = _3742;
    float _3746 = _3742;
    if (!_3694)
    {
        _3722 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3748 = _3722;
    bool _3750 = !_3694;
    float _3752 = _3748;
    float _3754 = _3748;
    if (!_3750)
    {
        bool _3756 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3758 = isnan(_2078);
        bool _3760 = _3756 || _3758;
        bool _3762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3764 = _3760 || _3762;
        if (!_3764)
        {
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = _2078 + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3770;
            float _3774 = 1.0 / _3772;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3792 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3796 = _3768 * _3774;
            float _3798 = precise::clamp(_3796, 0.0, 1.0);
            float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3804 = fma(_3798, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3806 = fma(_3798, _3802, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3808 = fma(_3798, _3782, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3810 = fma(_3798, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3812 = fma(_3798, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3814 = fma(_3798, _3794, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3726 = _3806;
            _3746 = _3812;
            _3716 = _3804;
            _3740 = _3810;
            _3732 = _3808;
            _3754 = _3814;
            _3816 = true;
        }
        else
        {
            bool _3818 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3820 = isnan(_2078);
            bool _3822 = _3818 || _3820;
            bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3826 = _3822 || _3824;
            if (!_3826)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3828 = _3714;
            _3716 = _3828;
            if (!_3826)
            {
                _3724 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3830 = _3724;
            _3726 = _3830;
            if (!_3826)
            {
                _3730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3832 = _3730;
            _3732 = _3832;
            if (!_3826)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3834 = _3738;
            _3740 = _3834;
            if (!_3826)
            {
                _3744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3836 = _3744;
            _3746 = _3836;
            if (!_3826)
            {
                _3752 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3838 = _3752;
            bool _3840 = !_3826;
            _3754 = _3838;
            if (!_3840)
            {
                bool _3842 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3844 = isnan(_2078);
                bool _3846 = _3842 || _3844;
                bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3850 = _3846 || _3848;
                if (!_3850)
                {
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = _2078 + _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3858 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3856;
                    float _3860 = 1.0 / _3858;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3880 = _3878 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3882 = _3854 * _3860;
                    float _3884 = precise::clamp(_3882, 0.0, 1.0);
                    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3890 = fma(_3884, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3892 = fma(_3884, _3888, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3894 = fma(_3884, _3868, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3896 = fma(_3884, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3898 = fma(_3884, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3900 = fma(_3884, _3880, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3726 = _3892;
                    _3746 = _3898;
                    _3716 = _3890;
                    _3740 = _3896;
                    _3732 = _3894;
                    _3754 = _3900;
                    _3816 = true;
                }
                else
                {
                    _3726 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3754 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3816 = false;
    float _3902 = _3726;
    float _3904 = _3746;
    float _3906 = _3716;
    float _3908 = _3740;
    float _3910 = _3732;
    float _3912 = _3754;
    float _3914 = fma(_3642, -0.5, 0.5);
    float _3916 = precise::clamp(_3914, 0.0, 1.0);
    float _3918 = -_3902;
    float _3920 = _3918 + _3904;
    float _3922 = _3736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3924 = -_3906;
    float _3926 = _3924 + _3908;
    float _3928 = fma(_3916, _3920, _3902);
    out.m_85.x = 0.0;
    float _3930 = -_3910;
    float _3932 = _3930 + _3912;
    float _3934 = fma(_3916, _3926, _3906);
    float _3936 = _3928 * 0.586610972881317138671875;
    out.m_49.x = _3922;
    bool _3938 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3940 = fma(_3916, _3932, _3910);
    float _3942 = fma(_3934, 0.298911988735198974609375, _3936);
    bool _3944 = _1990 > 0.0;
    bool _3946 = isnan(_1990);
    bool _3948 = _3944 || _3946;
    bool _3950 = isnan(0.0);
    bool _3952 = _3948 || _3950;
    float _3954 = fma(_3940, 0.114477999508380889892578125, _3942);
    bool _3956 = _2052 <= 0.0;
    bool _3958 = !_3952;
    bool _3960 = _3956 || _3958;
    float _3962 = -_3954;
    float _3964 = _3934 + _3962;
    float _3966 = -_3954;
    float _3968 = _3928 + _3966;
    float _3970 = -_3954;
    float _3972 = _3940 + _3970;
    float _3974 = fma(_3964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    float _3976 = fma(_3968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    float _3978 = fma(_3972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    bool _3980 = !_3938;
    if (!_3980)
    {
        float _3982 = -_1918;
        float _3984 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3986 = -_1920;
        float _3988 = _3986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3990 = -_1922;
        float _3992 = _3990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3994 = _3984 * _3984;
        float _3996 = fma(_3988, _3988, _3994);
        float _3998 = fma(_3992, _3992, _3996);
        float _4000 = sqrt(_3998);
        float _4002 = rsqrt(_3998);
        float _4004 = -_4000;
        float _4006 = _4004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4008 = _4006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4010 = precise::clamp(_4008, 0.0, 1.0);
        float _4012 = _3988 * _4002;
        float _4014 = _3984 * _4002;
        float _4016 = abs(_4010);
        float _4018 = log2(_4016);
        float _4020 = _3992 * _4002;
        float _4022 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4024 = _3642 * _4014;
        float _4026 = -_4014;
        float _4028 = -_4022;
        float _4030 = fma(_4026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4028);
        float _4032 = fma(_3598, _4012, _4024);
        float _4034 = -_4020;
        float _4036 = fma(_4034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4030);
        float _4038 = fma(_3674, _4020, _4032);
        float _4040 = precise::clamp(_4038, 0.0, 1.0);
        float _4042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4044 = _4036 + _4042;
        float _4046 = _4018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4048 = _4044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4050 = precise::clamp(_4048, 0.0, 1.0);
        float _4052 = exp2(_4046);
        float _4054 = _4052 * _4050;
        float _4056 = _4040 * _4054;
        float _4058 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4060 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4062 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _4058;
        out.m_85.y = _4060;
        out.m_85.z = _4062;
    }
    out.m_87.x = _3974;
    out.m_87.y = _3976;
    out.m_87.z = _3978;
    if (!_3960)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4064 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4064;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3816 = false;
    bool _952 = false;
    bool _640 = false;
    bool _478 = false;
    bool _368 = false;
    bool _206 = false;
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
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4122 = as_type<float>(_122);
        out.gl_Position.z = _4122;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    float _128 = float(_106);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _114;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _124 = as_type<int>(_152);
    }
    int _154 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4185 = as_type<float>(_154);
        out.gl_Position.z = _4185;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    float _162 = 1.0 / _128;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _168 = _158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _170 = _158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _166);
    float _174 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _170);
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _176);
    float _184 = _132 * _162;
    bool _186 = !_164;
    float _204;
    if (!_186)
    {
        float _188 = in.m_55.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        _204 = _184;
    }
    _206 = false;
    float _208 = _204;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    bool _214 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_208);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _208 + _226;
    bool _230 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_208);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_208);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_224;
    float _264 = _262 + 1.0;
    float _266 = 1.0 / _248;
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = 1.0 / _244;
    float _282 = _240 * _272;
    float _284 = -_240;
    float _286 = _284 + 1.0;
    float _288 = _228 * _266;
    float _290 = _212 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _296;
    float _300 = fma(_276, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = fma(_298, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = _300 * _282;
    float _308 = _302 * _282;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _326 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _328 = fma(_314, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _330 = fma(_318, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _334 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _310);
    float _336 = fma(_328, _268, _324);
    float _338 = fma(_330, _268, _326);
    float _340 = fma(_332, _268, _334);
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _336);
    float _344 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _338);
    float _346 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _340);
    bool _348 = !_278;
    float _366;
    if (!_348)
    {
        float _350 = in.m_55.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        _366 = _184;
    }
    _368 = false;
    float _370 = _366;
    float _372 = in.m_57.x;
    float _374 = in.m_57.y;
    float _376 = in.m_57.z;
    bool _378 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _380 = isnan(_370);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _394 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _396 = isnan(_370);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _370 + _410;
    float _414 = -_388;
    float _416 = _414 + 1.0;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = 1.0 / _392;
    float _422 = _404 * _416;
    float _424 = -_404;
    float _426 = _424 + 1.0;
    float _428 = _342 * _372;
    float _430 = _408 * _420;
    float _432 = _344 * _374;
    float _434 = fma(_430, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = _346 * _376;
    float _442 = _434 * _422;
    float _444 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[115].x, _442);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _450 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[116].x, _446);
    float _452 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _458 = !_418;
    float _476;
    if (!_458)
    {
        float _460 = in.m_55.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        _476 = _184;
    }
    _478 = false;
    float _480 = _476;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _484 = _480 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _490 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _492 = isnan(_480);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _510 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _512 = isnan(_480);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _488;
    float _524 = -_500;
    float _526 = _524 + 1.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _528;
    bool _532 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _534 = isnan(_480);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _520 * _526;
    float _546 = -_520;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = 1.0 / _504;
    float _554 = _542 * _548;
    float _556 = -_542;
    float _558 = _556 + 1.0;
    float _560 = 1.0 / _508;
    float _562 = _530 * _522;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _568 = fma(_562, _484, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _570 = _566 * _552;
    bool _572 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _574 = isnan(_480);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _590 = _480 + _588;
    float _592 = _568 * _554;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _596 = _480 + _594;
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = fma(_570, _590, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _604 = _586 * _560;
    float _606 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[131].x, _592);
    float _608 = _500 * _600;
    float _610 = fma(_604, _596, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _612 = fma(_602, _544, _606);
    float _614 = fma(_610, _608, _612);
    float _616 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[134].x, _614);
    float _618 = _616 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _620 = !_550;
    float _638;
    if (!_620)
    {
        float _622 = in.m_55.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[14].x, _132);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _184;
    }
    _640 = false;
    float _642 = _638;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _646 = _642 + _644;
    bool _648 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _650 = isnan(_642);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _664 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _666 = isnan(_642);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _676;
    bool _680 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _682 = isnan(_642);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _662;
    float _694 = -_690;
    float _696 = _694 + 1.0;
    bool _698 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _700 = isnan(_642);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _714 = 1.0 / _712;
    bool _716 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _718 = _678 * _692;
    float _720 = -_658;
    float _722 = _720 + 1.0;
    float _724 = -_674;
    float _726 = _724 + 1.0;
    float _728 = -_708;
    float _730 = _728 + 1.0;
    float _732 = fma(_718, _646, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _734 = _674 * _722;
    bool _736 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _738 = isnan(_642);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _690 * _726;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _758 = _746 * _696;
    float _760 = -_746;
    float _762 = _760 + 1.0;
    bool _764 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _766 = isnan(_642);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = 1.0 / _752;
    float _778 = _708 * _762;
    bool _780 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _782 = isnan(_642);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _774 * _730;
    float _794 = -_774;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _802 = _790 * _796;
    float _804 = 1.0 / _756;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _810 = -_790;
    float _812 = _810 + 1.0;
    float _814 = _732 * _802;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _820 = _800 * _714;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _822;
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[159].x, _814);
    float _828 = 1.0 / _818;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _832 = _642 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _838 = _824 * _776;
    float _840 = fma(_820, _832, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _844 = _642 + _842;
    float _846 = 1.0 / _808;
    float _848 = fma(_840, _792, _826);
    float _850 = fma(_838, _844, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _862 = _642 + _860;
    float _864 = fma(_850, _778, _848);
    float _866 = 1.0 / _836;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _872 = _854 * _828;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _876 = _642 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _878;
    float _882 = _870 * _804;
    float _884 = _858 * _846;
    float _886 = fma(_882, _862, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _888 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _890 = isnan(_642);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _902 = _642 + _900;
    float _904 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _906 = fma(_886, _758, _864);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _910 = _642 + _908;
    float _912 = fma(_872, _902, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _914 = _880 * _866;
    float _916 = -_898;
    float _918 = _916 + 1.0;
    float _920 = fma(_904, _748, _906);
    float _922 = fma(_914, _910, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _924 = _658 * _918;
    float _926 = fma(_912, _734, _920);
    float _928 = fma(_922, _924, _926);
    float _930 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[166].x, _928);
    out.m_59.x = _930;
    bool _932 = !_716;
    float _950;
    if (!_932)
    {
        float _934 = in.m_55.x;
        float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _938 = _934 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[14].y, _132);
        float _942 = _940 * _936;
        float _944 = floor(_942);
        float _946 = -_944;
        float _948 = _942 + _946;
        _950 = _948;
        _952 = true;
    }
    else
    {
        _950 = _184;
    }
    _952 = false;
    float _954 = _950;
    float _956 = in.m_46.x;
    float _958 = in.m_46.y;
    float _960 = in.m_46.z;
    float _962 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _964 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _966 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _968 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _970 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _972 = -_968;
    float _974 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _972);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _980 = fma(_184, _978, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _982 = _958 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = _958 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _986 = _958 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[5].x, _982);
    float _990 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[4].x, _984);
    float _992 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _994 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[5].z, _988);
    float _996 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[4].z, _990);
    float _998 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[6].z, _992);
    float _1000 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1002 = _996 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1004 = _998 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1008 = -_1000;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = -_1002;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = -_1004;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = -_1006;
    float _1022 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1024 = _1010 * _1010;
    float _1026 = fma(_1014, _1014, _1024);
    float _1028 = fma(_1018, _1018, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1014 * _1030;
    float _1036 = _1018 * _1030;
    float _1038 = _1010 * _1030;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_1036, _1036, _1040);
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1048 = rsqrt(_1042);
    float _1050 = -_1044;
    float _1052 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1050);
    float _1054 = -_1046;
    float _1056 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1054);
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1062 = -_1058;
    float _1064 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1062);
    float _1066 = -_970;
    float _1068 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1070 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1072 = -_1060;
    float _1074 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1072);
    float _1076 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1078 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1080 = -_1070;
    float _1082 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1080);
    float _1084 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1074);
    float _1086 = _1036 * _1048;
    float _1088 = _1034 * _1048;
    float _1090 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1082);
    float _1092 = -_1076;
    float _1094 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1092);
    float _1096 = -_1086;
    float _1098 = _1036 * _1096;
    float _1100 = -_1086;
    float _1102 = _1038 * _1100;
    float _1104 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1106 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1094);
    float _1108 = -_1098;
    float _1110 = fma(_1034, _1088, _1108);
    float _1112 = _1038 * _1088;
    float _1114 = -_1104;
    float _1116 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1114);
    float _1118 = -_1078;
    float _1120 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1122 = _1110 * _1110;
    float _1124 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1126 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1116);
    float _1128 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1120);
    float _1130 = fma(_1112, _1112, _1122);
    float _1132 = -_1124;
    float _1134 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1136 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1138 = -_1128;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1126);
    float _1142 = fma(_1102, _1102, _1130);
    float _1144 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1134);
    float _1146 = -_1136;
    float _1148 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1146);
    float _1150 = 1.0 / _1140;
    float _1152 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1154 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1148);
    float _1156 = -_1152;
    float _1158 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1156);
    float _1160 = rsqrt(_1142);
    float _1162 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1158);
    float _1164 = fma(_1144, _1150, -1.0);
    float _1166 = _1110 * _1160;
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = -_1168;
    float _1172 = _1170 + 1.0;
    float _1174 = _1172 * _1150;
    float _1176 = fma(_1172, _1164, 1.0);
    float _1178 = _1154 * _1174;
    float _1180 = _1176 * _1176;
    float _1182 = _1162 * _1174;
    float _1184 = fma(_1178, _1178, _1180);
    float _1186 = fma(_1182, _1182, _1184);
    float _1188 = rsqrt(_1186);
    float _1190 = _1182 * _1188;
    float _1192 = _1178 * _1188;
    float _1194 = _1176 * _1188;
    float _1196 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1198 = -_1190;
    float _1200 = _1034 * _1198;
    float _1202 = _1036 * _1194;
    float _1204 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1196);
    float _1206 = -_1192;
    float _1208 = -_1200;
    float _1210 = fma(_1036, _1206, _1208);
    float _1212 = -_1192;
    float _1214 = _1038 * _1212;
    float _1216 = -_1190;
    float _1218 = -_1202;
    float _1220 = fma(_1038, _1216, _1218);
    float _1222 = _1210 * _1210;
    float _1224 = -_1214;
    float _1226 = fma(_1034, _1194, _1224);
    float _1228 = fma(_1220, _1220, _1222);
    float _1230 = fma(_1226, _1226, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1220 * _1232;
    float _1236 = _1226 * _1232;
    float _1238 = _1210 * _1232;
    float _1240 = _1036 * _1234;
    float _1242 = _1038 * _1236;
    float _1244 = -_1240;
    float _1246 = fma(_1034, _1236, _1244);
    float _1248 = _1034 * _1238;
    float _1250 = -_1242;
    float _1252 = fma(_1036, _1238, _1250);
    float _1254 = _1246 * _1246;
    float _1256 = -_1248;
    float _1258 = fma(_1038, _1234, _1256);
    float _1260 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1262 = fma(_1252, _1252, _1254);
    float _1264 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1260);
    float _1266 = fma(_1258, _1258, _1262);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1268;
    float _1272 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1264);
    float _1274 = 1.0 / _1270;
    float _1276 = rsqrt(_1266);
    float _1278 = _1258 * _1276;
    float _1280 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1204);
    float _1282 = _1246 * _1276;
    float _1284 = _1252 * _1276;
    float _1286 = _1034 * _1278;
    float _1288 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1292 = _1036 * _1282;
    float _1294 = -_1286;
    float _1296 = fma(_1036, _1284, _1294);
    float _1298 = in.m_61.x;
    float _1300 = in.m_61.y;
    float _1302 = in.m_61.z;
    float _1304 = -_1290;
    float _1306 = _1288 + _1304;
    float _1308 = -_1292;
    float _1310 = fma(_1038, _1278, _1308);
    float _1312 = _1296 * _1296;
    float _1314 = _1038 * _1284;
    bool _1316 = _1290 >= _1288;
    bool _1318 = isnan(_1290);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(_1288);
    bool _1324 = _1320 || _1322;
    float _1326 = abs(_1306);
    float _1328 = precise::max(_1326, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1330 = fma(_1310, _1310, _1312);
    float _1332 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1334 = -_1314;
    float _1336 = fma(_1034, _1282, _1334);
    float _1338 = precise::min(_1328, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1340 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1332);
    float _1342 = fma(_1336, _1336, _1330);
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1346 = _1338 + _1344;
    float _1348 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1340);
    float _1350 = rsqrt(_1342);
    float _1352 = _1346 * _1274;
    float _1354 = abs(_1032);
    float _1356 = precise::max(0.0, _1354);
    bool _1358 = !_1324;
    float _1360 = _1358 ? 1.0 : (-1.0);
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1298);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1300);
    float _1366 = rsqrt(_1348);
    float _1368 = _184 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1370 = _962 * _1362;
    float _1372 = _1360 * _1352;
    float _1374 = _964 * _1364;
    float _1376 = precise::min(_1356, 40.0);
    float _1378 = _1368 * _1372;
    float _1380 = _1336 * _1350;
    float _1382 = _966 * _1302;
    float _1384 = _1296 * _1350;
    float _1386 = _1374 * _1282;
    float _1388 = fma(_1376, -0.02500000037252902984619140625, 1.0);
    float _1390 = _1310 * _1350;
    float _1392 = _1374 * _1284;
    float _1394 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1400 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1402 = _1374 * _1278;
    float _1404 = _1396 * _1396;
    float _1406 = fma(_1370, _1390, _1392);
    float _1408 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    float _1410 = fma(_1370, _1380, _1402);
    float _1412 = fma(_1398, _1398, _1404);
    float _1414 = fma(_1370, _1384, _1386);
    float _1416 = _1378 * 0.15915493667125701904296875;
    float _1418 = fma(_1382, _1036, _1410);
    float _1420 = fma(_1400, _1400, _1412);
    float _1422 = fma(_1382, _1038, _1414);
    float _1424 = fma(_1382, _1034, _1406);
    float _1426 = _1004 + _1418;
    float _1428 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1408);
    float _1430 = _1000 + _1422;
    float _1432 = _1002 + _1424;
    float _1434 = rsqrt(_1420);
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1442 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1438);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1440);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1450 = _1416 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1446);
    float _1458 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1460 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1462 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1464 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = _1416 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1400 * _1434;
    float _1472 = -_1462;
    float _1474 = _1472 + _1436;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1480 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1482 = fma(_1388, _1474, _1462);
    float _1484 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1476);
    float _1486 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1478);
    float _1488 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1480);
    float _1490 = _1398 * _1434;
    float _1492 = _1396 * _1434;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1484);
    float _1496 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1486);
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1488);
    float _1500 = _1470 * _1470;
    float _1502 = -_1468;
    float _1504 = _1502 + 1.0;
    float _1506 = _1490 * _1452;
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1510 = _1492 * _1452;
    float _1512 = _1492 * _1504;
    float _1514 = fma(_1504, _1500, _1468);
    float _1516 = _1470 * _1452;
    float _1518 = _1490 * _1504;
    float _1520 = fma(_1470, _1512, _1506);
    float _1522 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1524 = -_1000;
    float _1526 = _1524 + _1508;
    float _1528 = -_1516;
    float _1530 = fma(_1492, _1518, _1528);
    float _1532 = -_1510;
    float _1534 = fma(_1470, _1518, _1532);
    float _1536 = -_1002;
    float _1538 = _1536 + _1522;
    float _1540 = _1520 * _1526;
    float _1542 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1544 = fma(_1490, _1518, _1468);
    float _1546 = _1530 * _1526;
    float _1548 = fma(_1534, _1538, _1540);
    float _1550 = -_1004;
    float _1552 = _1550 + _1542;
    float _1554 = fma(_1470, _1518, _1510);
    float _1556 = fma(_1544, _1538, _1546);
    float _1558 = fma(_1492, _1512, _1468);
    float _1560 = fma(_1514, _1552, _1548);
    float _1562 = fma(_1492, _1518, _1516);
    float _1564 = fma(_1554, _1552, _1556);
    float _1566 = _1558 * _1526;
    float _1568 = fma(_1560, _980, _1004);
    float _1570 = -_1506;
    float _1572 = fma(_1470, _1512, _1570);
    float _1574 = fma(_1564, _980, _1002);
    float _1576 = fma(_1562, _1538, _1566);
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1580 = _1568 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1584 = _1574 + _1582;
    float _1586 = fma(_1572, _1552, _1576);
    float _1588 = _1580 * _1580;
    float _1590 = _1000 + _1586;
    float _1592 = fma(_1584, _1584, _1588);
    float _1594 = sqrt(_1592);
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1610 = _1608 != 0;
    float _1612 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1614 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1612);
    bool _1616 = !_1602;
    int _1618 = _1616 ? 0 : 1;
    bool _1620 = !_1598;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1614);
    bool _1626 = !_1606;
    int _1628 = _1626 ? 0 : 1;
    bool _1630 = !_1610;
    int _1632 = _1630 ? 0 : 1;
    bool _1634 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1614;
    float _1638 = _1566;
    float _1640 = _1586;
    float _1642 = _1538;
    float _1644 = _1580;
    if (!_1634)
    {
        _1636 = _1574;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (!_1634)
    {
        _1638 = _1568;
    }
    float _1650 = _1638;
    float _1652 = _1650;
    if (!_1634)
    {
        _1640 = _1590;
    }
    float _1654 = _1640;
    bool _1656 = !_1634;
    float _1658 = _1654;
    if (!_1656)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1664 = _1594 + _1662;
        float _1666 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = rsqrt(_1592);
        float _1670 = _1664 * _1660;
        float _1672 = _1670 * 0.15915493667125701904296875;
        float _1674 = _1672 * 6.283185482025146484375;
        float _1676 = cos(_1674);
        float _1678 = _1672 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        float _1682 = _1676 + (-1.0);
        float _1684 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = fma(_1680, _1666, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1688 = fma(_1590, _1676, _1684);
        float _1690 = _1668 * _1686;
        float _1692 = fma(_1584, _1690, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1694 = fma(_1580, _1690, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1658 = _1688;
        _1648 = _1692;
        _1652 = _1694;
    }
    float _1696 = _1658;
    float _1698 = _1648;
    float _1700 = _1652;
    float _1702 = -_1000;
    float _1704 = _1702 + _1696;
    float _1706 = -_1002;
    float _1708 = _1706 + _1698;
    float _1710 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1712 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1714 = _1704 * _1704;
    float _1716 = -_1004;
    float _1718 = _1716 + _1700;
    float _1720 = 1.0 / _1710;
    float _1722 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1712);
    float _1724 = fma(_1708, _1708, _1714);
    float _1726 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1722);
    float _1728 = fma(_1718, _1718, _1724);
    float _1730 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1732 = sqrt(_1728);
    float _1734 = _1730 + _1710;
    float _1736 = _1734 * _1720;
    float _1738 = _1736 * 0.5;
    bool _1740 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.5);
    bool _1748 = _1744 || _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1750);
    float _1754 = 1.0 / _1752;
    bool _1756 = _1732 > 0.0;
    bool _1758 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan(0.5);
    bool _1766 = _1762 || _1764;
    bool _1768 = !_1756;
    float _1770 = _1698;
    float _1772 = _1696;
    float _1774 = _1700;
    float _1776 = _1720;
    float _1778 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1780 = _1708;
    if (!_1768)
    {
        float _1782 = _180 * _180;
        float _1784 = fma(_178, _178, _1782);
        float _1786 = fma(_182, _182, _1784);
        float _1788 = rsqrt(_1728);
        float _1790 = sqrt(_1786);
        float _1792 = _1708 * _1788;
        float _1794 = _1704 * _1788;
        float _1796 = _1718 * _1788;
        bool _1798 = _1790 > 0.0;
        bool _1800 = !_1798;
        _1642 = _1792;
        _1644 = _1794;
        if (!_1800)
        {
            float _1802 = rsqrt(_1786);
            float _1804 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1806 = _180 * _1802;
            float _1808 = _178 * _1802;
            float _1810 = _1794 * _1806;
            float _1812 = _182 * _1802;
            float _1814 = fma(_1792, _1808, _1810);
            float _1816 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1818 = fma(_1796, _1812, _1814);
            float _1820 = _1818 * _1816;
            float _1822 = fma(_178, _1820, _1698);
            float _1824 = fma(_180, _1820, _1696);
            float _1826 = fma(_182, _1820, _1700);
            _1770 = _1822;
            _1772 = _1824;
            _1774 = _1826;
            _1776 = _1816;
        }
    }
    float _1828 = _1770;
    float _1830 = _1772;
    float _1832 = _1774;
    float _1834 = _1642;
    float _1836 = _1776;
    float _1838 = _1644;
    float _1840 = _1836;
    float _1842 = _1834;
    float _1844 = _1830;
    float _1846 = _1832;
    float _1848 = _1838;
    if (_1748)
    {
        _1840 = 1.0;
    }
    float _1850 = _1840;
    float _1852 = _1850;
    if (_1766)
    {
        _1778 = _1828;
    }
    float _1854 = _1778;
    float _1856 = _1854;
    if (_1766)
    {
        _1842 = _1830;
    }
    float _1858 = _1842;
    float _1860 = _1858;
    if (_1766)
    {
        _1780 = _1832;
    }
    float _1862 = _1780;
    float _1864 = _1862;
    if (!_1766)
    {
        float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1868 = _1000 + _1866;
        float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1872 = _1002 + _1870;
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1876 = -_1000;
        float _1878 = _1876 + _1830;
        float _1880 = _1868 * _1868;
        float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1884 = _1004 + _1882;
        float _1886 = -_1002;
        float _1888 = _1886 + _1828;
        float _1890 = -_1004;
        float _1892 = _1890 + _1832;
        float _1894 = fma(_1872, _1872, _1880);
        float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1898 = fma(_1884, _1884, _1894);
        float _1900 = sqrt(_1898);
        float _1902 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1904 = precise::min(_1900, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1906 = _1904 * _1896;
        float _1908 = _1902 * _1906;
        float _1910 = fma(_1878, _1908, _1000);
        float _1912 = fma(_1888, _1908, _1002);
        float _1914 = fma(_1892, _1908, _1004);
        _1844 = _1878;
        _1860 = _1910;
        _1856 = _1912;
        _1864 = _1914;
        _1846 = _1892;
    }
    float _1916 = _1844;
    float _1918 = _1860;
    float _1920 = _1856;
    float _1922 = _1864;
    float _1924 = _1846;
    float _1926 = _1916;
    float _1928 = _1924;
    if (_1748)
    {
        _1848 = 1.0;
    }
    float _1930 = _1848;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1934 = _1754 * _1932;
    float _1936 = _1930;
    if (!_1748)
    {
        float _1938 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        float _1946 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1948 = _1946 * 0.15915493667125701904296875;
        float _1950 = _1940 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = 1.0 / _1944;
        float _1956 = _1948 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1952 * _1954;
        float _1962 = _1948 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1958 * _1960;
        float _1968 = 1.0 / _1966;
        float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1972 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1970;
        float _1974 = 1.0 / _1972;
        float _1976 = _1964 * _1968;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = fma(_1934, _1976, _1978);
        float _1982 = _1980 * _1974;
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        _1926 = _1948;
        _1928 = _1980;
        _1852 = _1984;
    }
    float _1986 = _1926;
    float _1988 = _1928;
    float _1990 = _1852;
    float _1992 = _1986;
    float _1994 = _1988;
    if (!_1748)
    {
        float _1996 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = _1998 * 6.283185482025146484375;
        float _2002 = cos(_2000);
        float _2004 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2006 = _2004 * 0.15915493667125701904296875;
        float _2008 = _1998 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = 1.0 / _2002;
        float _2014 = _2006 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = _2006 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = 1.0 / _2024;
        float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2030 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2028;
        float _2032 = 1.0 / _2030;
        float _2034 = _2022 * _2026;
        float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2038 = fma(_1934, _2034, _2036);
        float _2040 = _2038 * _2032;
        float _2042 = precise::clamp(_2040, 0.0, 1.0);
        float _2044 = -_2042;
        float _2046 = _2044 + 1.0;
        _1992 = _2012;
        _1994 = _2034;
        _1936 = _2046;
    }
    float _2048 = _1992;
    float _2050 = _1994;
    float _2052 = _1936;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _1918 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2060 = _1920 + _2058;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2064 = _1922 + _2062;
    float _2066 = _2056 * _2056;
    float _2068 = fma(_2060, _2060, _2066);
    float _2070 = fma(_1002, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2072 = fma(_2064, _2064, _2068);
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2076 = rsqrt(_2072);
    float _2078 = sqrt(_2072);
    float _2080 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2082 = _2060 * _2080;
    float _2084 = _2064 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 * _2084;
    float _2090 = _2086 + _2088;
    float _2092 = sqrt(_2090);
    bool _2094 = _2092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2092 + _2096;
    float _2100 = _2076;
    float _2102 = _2098;
    float _2104 = _2048;
    float _2106 = _2056;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2094)
    {
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2100 = _2110;
    }
    float _2112 = _2100;
    float _2114 = _2112;
    if (_2094)
    {
        float _2116 = _2098 * _2112;
        _2102 = _2116;
    }
    float _2118 = _2102;
    if (_2094)
    {
        float _2120 = rsqrt(_2090);
        _2114 = _2120;
    }
    float _2122 = _2114;
    float _2124 = _2122;
    if (_2094)
    {
        float _2126 = _2118 * 0.15915493667125701904296875;
        _2104 = _2126;
    }
    float _2128 = _2104;
    float _2130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2132 = _2064;
    float _2134 = _2128;
    if (_2094)
    {
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2144 = precise::max(0.0, _2130);
    float _2146 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2142);
    float _2148 = _2050;
    float _2150 = _2144;
    if (_2094)
    {
        float _2152 = _2128 * 6.283185482025146484375;
        float _2154 = cos(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = -_2080;
    float _2160 = -_2144;
    float _2162 = fma(_2056, _2158, _2160);
    float _2164 = _2162;
    if (_2094)
    {
        float _2166 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2166;
    }
    float _2168 = _2106;
    float _2170 = _2140;
    if (_2094)
    {
        float _2172 = fma(_2140, _2168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2170 = _2172;
    }
    float _2174 = _2170;
    float _2176 = floor(_2070);
    float _2178 = _2174;
    if (_2094)
    {
        float _2180 = _2122 * _2174;
        _2108 = _2180;
    }
    float _2182 = _2108;
    if (!_2094)
    {
        _2124 = _2082;
    }
    float _2184 = _2124;
    float _2186 = _2184;
    float _2188 = _2156;
    if (_2094)
    {
        float _2190 = _2156 + (-1.0);
        _2150 = _2190;
    }
    float _2192 = _2150;
    float _2194 = _2192;
    if (_2094)
    {
        float _2196 = _2082 * _2182;
        _2186 = _2196;
    }
    float _2198 = _2186;
    if (!_2094)
    {
        _2178 = _2086;
    }
    float _2200 = _2178;
    float _2202 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2204 = _2200;
    if (_2094)
    {
        float _2206 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2206;
    }
    float _2208 = _2134;
    if (!_2094)
    {
        _2194 = _2084;
    }
    float _2210 = _2194;
    float _2212 = _2210;
    if (_2094)
    {
        float _2214 = _2084 * _2182;
        _2212 = _2214;
    }
    float _2216 = _2212;
    if (_2094)
    {
        float _2218 = fma(_2162, _2156, _2208);
        _2164 = _2218;
    }
    float _2220 = _2164;
    if (_2094)
    {
        float _2222 = _2198 * _2198;
        _2204 = _2222;
    }
    float _2224 = _2204;
    if (!_2094)
    {
        _2188 = _2088;
    }
    float _2226 = _2188;
    float _2228 = _2226;
    if (_2094)
    {
        float _2230 = _2216 * _2216;
        _2228 = _2230;
    }
    float _2232 = _2228;
    float _2234 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2236 = fma(_2220, _2220, _2224);
    float _2238 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2240 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2202);
    float _2242 = floor(_2234);
    float _2244 = _2236 + _2232;
    float _2246 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2248 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2238);
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2252 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2250);
    float _2254 = precise::clamp(_2252, 0.0, 1.0);
    float _2256 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2246);
    float _2258 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2248);
    float _2260 = rsqrt(_2244);
    float _2262 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2240);
    float _2264 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2256);
    float _2266 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2268 = -_2254;
    float _2270 = _2268 + 1.0;
    float _2272 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2274 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2278 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2280 = abs(_2270);
    float _2282 = log2(_2280);
    float _2284 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2276);
    float _2288 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2290 = -_2176;
    float _2292 = _2070 + _2290;
    float _2294 = -_2284;
    float _2296 = fma(_2294, _2074, 1.0);
    float _2298 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2300 = _2260 * _2198;
    float _2302 = _2260 * _2216;
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2306 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2298);
    float _2308 = _2260 * _2220;
    float _2310 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2312 = log2(_2296);
    float _2314 = -_2242;
    float _2316 = _2234 + _2314;
    float _2318 = _2308 + 1.0;
    float _2320 = -_2310;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2320);
    float _2324 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2326 = -_2302;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2322);
    float _2330 = 1.0 / _2306;
    float _2332 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2334 = fma(_2328, -0.5, 0.5);
    float _2336 = fma(_2328, 0.5, 0.5);
    float _2338 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2304);
    float _2340 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2332);
    float _2342 = exp2(_2324);
    float _2344 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2338);
    float _2346 = fma(_2336, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2348 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2340);
    float _2350 = _2312 * 0.693147182464599609375;
    float _2352 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2344);
    float _2354 = fma(_2336, _2346, -0.212114393711090087890625);
    float _2356 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2348);
    float _2358 = sqrt(_2334);
    float _2360 = _2352 * _2330;
    float _2362 = fma(_2336, _2354, 1.570728778839111328125);
    float _2364 = _2356 * _2330;
    float _2366 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2368 = fma(_2360, 0.5, 0.5);
    float _2370 = fma(_2364, -0.5, 0.5);
    float _2372 = -_2308;
    float _2374 = fma(_2342, _2318, _2372);
    float2 _7762 = float2(_2292, _2316);
    float _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7762, float2(0.0), isnan(_7762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7762, float2(0.0), isnan(_7762)), level(0.0)).x;
    float _2378 = fma(_2374, 0.5, 0.5);
    float _2380 = _2358 * 0.636619746685028076171875;
    float _2382 = -_2362;
    float _2384 = fma(_2380, _2382, 1.0);
    float3 _7783 = float3(_2368, _2370, _2366);
    float _2386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7783, float3(0.0), isnan(_7783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7783, float3(0.0), isnan(_7783)), level(0.0)).x;
    float3 _7794 = float3(_2368, _2370, _2366);
    float4 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7794, float3(0.0), isnan(_7794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7794, float3(0.0), isnan(_7794)), level(0.0)).xyzw;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = _2389.w;
    float2 _7810 = float2(_2384, _2378);
    float3 _2401 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7810, float2(0.0), isnan(_7810)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7810, float2(0.0), isnan(_7810)), level(0.0)).xyz;
    float _2403 = _2401.x;
    float _2405 = _2401.y;
    float _2407 = _2401.z;
    float _2409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2411 = int(_2409);
    int _2413 = abs(_1618);
    out.m_63.x = _454;
    out.m_63.y = _444;
    out.m_63.z = _452;
    out.m_63.w = _456;
    int _2415 = abs(_1632);
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2419 = _954 + _2417;
    out.m_65.w = _618;
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2423 = _954 + _2421;
    float _2425 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2427 = int(_2425);
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2433 = in.m_67.x;
    float _2435 = float(_2411);
    float _2437 = 1.0 / _2431;
    float _2439 = float(uint(_2427));
    float _2441 = 1.0 / _2435;
    int _2443 = ~_2427;
    int _2445 = _2443 + 1;
    bool _2447 = _2427 == 0;
    int _2449 = ~_2427;
    int _2451 = _2449 + 1;
    int _2453 = ~_2427;
    int _2455 = _2453 + 1;
    float _2457 = 1.0 / _2439;
    int _2459 = ~_2427;
    int _2461 = _2459 + 1;
    float _2463 = in.m_55.y;
    float _2465 = _132 * _2441;
    float _2467 = trunc(_2465);
    int _2469 = int(_2467);
    int _2471 = as_type<int>(_2457) + (-2);
    float _2473 = float(uint(_2469));
    float _2475 = as_type<float>(_2471) * _2473;
    float _2477 = in.m_55.x;
    float _2479 = trunc(_2475);
    float _2481 = precise::max(_2479, 0.0);
    uint _2484 = uint(_2481);
    int _2486 = _2461 * int(_2484);
    int _2488 = _2486 + _2469;
    float _2490 = float(uint(_2488));
    float _2492 = as_type<float>(_2471) * _2490;
    int _2494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2496 = _2494 != 0;
    float _2498 = trunc(_2492);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = !_2496;
    float _2506 = _2504 ? 1.2345600128173828125 : 1.0;
    bool _2508 = !_2496;
    float _2510 = _2508 ? _2463 : _2477;
    float _2512 = _2510 * _2506;
    float _2514 = floor(_2512);
    int _2516 = int(_2484) + int(_2502);
    float _2518 = float(_2427);
    float _2520 = float(_2469);
    int _2522 = _2445 * _2516;
    int _2524 = _2522 + _2469;
    bool _2526 = _2520 >= _2518;
    bool _2528 = isnan(_2520);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(_2518);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    bool _2538 = uint(_2524) >= uint(_2427);
    float _2540 = trunc(_2536);
    int _2542 = int(_2540);
    bool _2544 = !_2538;
    int _2546 = _2544 ? 0 : (-1);
    float _2548 = -_2514;
    float _2550 = _2512 + _2548;
    int _2552 = ~_2516;
    int _2554 = _2552 + _2546;
    int _2556 = _2554 + 1;
    float _2558 = _2550 * _2518;
    float _2560 = _132 * _2518;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2564 = _2562 != 0;
    int _2566 = _2427 * _2556;
    int _2568 = _2566 + _2469;
    float _2570 = _2560 * _162;
    float _2572 = trunc(_2558);
    int _2574 = int(_2572);
    int _2576 = _2427 + (-1);
    bool _2578 = !_2447;
    int _2580 = _2578 ? _2568 : (-1);
    int _2582 = ~_2542;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    bool _2588 = !_2564;
    int _2590 = _2588 ? 0 : 1;
    float _2592 = trunc(_2570);
    int _2594 = int(_2592);
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2598 = _2596 != 0;
    int _2600 = _2580 * _2586;
    int _2602 = abs(_2590);
    int _2604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2606 = _2604 != 0;
    int _2608 = _2542 * _2576;
    int _2610 = _2608 + _2600;
    int _2612 = abs(_1622);
    int _2614 = abs(_1628);
    int _2616 = _2610 * _2413;
    int _2618 = _2574 * _2602;
    int _2620 = _2618 + _2469;
    int _2622 = ~_2427;
    int _2624 = _2622 + 1;
    int _2626 = _2594 * _2612;
    int _2628 = _2626 + _2616;
    int _2630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2632 = _2630 != 0;
    float _2634 = float(uint(_2620));
    int _2636 = _2620 * _2614;
    int _2638 = _2636 + _2628;
    int _2640 = _2574 * _2415;
    int _2642 = _2640 + _2638;
    int _2644 = ~_2427;
    int _2646 = _2644 + 1;
    float _2648 = in.m_55.w;
    float _2650 = as_type<float>(_2471) * _2634;
    float _2652 = float(uint(_2642));
    float _2654 = trunc(_2650);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = as_type<float>(_2471) * _2652;
    float _2662 = trunc(_2660);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    int _2668 = _2451 * int(_2658);
    int _2670 = _2668 + _2620;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2676 = _2648 > 0.5;
    float _2678 = float(uint(_2670));
    int _2680 = _2646 * int(_2666);
    int _2682 = _2680 + _2642;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2684;
    float _2688 = as_type<float>(_2471) * _2678;
    float _2690 = float(uint(_2682));
    float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2694 = _2692 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2696 = in.m_67.y;
    float _2698 = trunc(_2688);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = as_type<float>(_2471) * _2690;
    float _2706 = trunc(_2704);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    float _2712 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2716 = 1.0 / _2714;
    int _2718 = int(_2658) + int(_2702);
    float _2720 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2722 = _2720 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2724 = -_2696;
    float _2726 = _2724 + 1.0;
    int _2728 = int(_2666) + int(_2710);
    int _2730 = _2455 * _2718;
    int _2732 = _2730 + _2620;
    float _2734 = 1.0 / _2674;
    int _2736 = _2624 * _2728;
    int _2738 = _2736 + _2642;
    float _2740 = _2686 * _2716;
    float _2742 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _2746 = uint(_2738) >= uint(_2427);
    float _2748 = 1.0 / _2722;
    int _2750 = _2676 ? as_type<int>(_2726) : as_type<int>(_2696);
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _2756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2758 = _2756 != 0;
    float _2760 = fma(_2740, _2419, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2762 = !_2746;
    int _2764 = _2762 ? 0 : (-1);
    float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2768 = _954 + _2766;
    int _2770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2772 = _2770 != 0;
    float _2774 = 1.0 / _2754;
    int _2776 = ~_2728;
    int _2778 = _2776 + _2764;
    int _2780 = _2778 + 1;
    float _2782 = _2744 * _2734;
    float _2784 = _2772 ? as_type<float>(_2750) : _2696;
    bool _2786 = _2463 > 0.5;
    float _2788 = 1.0 / _2694;
    float _2790 = _2696;
    float _2792 = _2306;
    float _2794 = _2356;
    if (_2758)
    {
        float _2796 = _2786 ? _2726 : _2696;
        _2790 = _2796;
    }
    float _2798 = _2790;
    int _2800 = _2427 * _2780;
    int _2802 = _2800 + _2642;
    bool _2804 = !_2447;
    int _2806 = _2804 ? _2802 : (-1);
    float _2808 = -_2376;
    float _2810 = _2808 + 1.0;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2814 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2812;
    float _2816 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2818 = _2816 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2820 = _2806 >> 31;
    int _2822 = _2806 & 3;
    bool _2824 = _2822 != 0;
    int _2826 = _2820 & 3;
    float _2828 = _2814 * _2748;
    int _2830 = _2806 & 3;
    bool _2832 = _2830 != 0;
    float _2834 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2834;
    int _2838 = _2806 + _2826;
    float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2842 = _2840 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _2844 = _2824 ? 0 : 1;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    if (_2632)
    {
        float _2848 = in.m_55.z;
        _2846 = _2848;
    }
    float _2850 = _2846;
    int _2852 = _2838 >> 2;
    float _2854 = 1.0 / _2842;
    bool _2856 = uint(_2830) > 1u;
    float _2858 = _2818 * _2788;
    int _2860 = _2852 << 4;
    int _2862 = _2860 + 512;
    float _2864 = _2836 * _2774;
    int _2866 = ~_2844;
    int _2868 = _2866 + 1;
    int _2870 = _2868 + 1;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2874 = _2872 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    uint _2876 = uint(int(uint(_2862) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = _2874 * _2437;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2896 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2894;
    int _2898 = _2870;
    float _2900 = _2864;
    if (!_2856)
    {
        int _2902 = ~_2844;
        int _2904 = _2902 + 1;
        _2898 = _2904;
    }
    int _2906 = _2898;
    bool _2908 = uint(_2830) >= 2u;
    float _2910 = _2896 * _2854;
    bool _2912 = !_2832;
    int _2914 = _2912 ? 0 : 1;
    bool _2916 = _2830 != 3;
    float _2918 = _2908 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2920 = _2830 != 3;
    int _2922 = _2862 + 8;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    uint _2926 = uint(int(uint(int(_2924)) >> uint(2)));
    int _2928 = int(_2924) & 3;
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[int(_2926)][_2928];
    int _2932 = int(_2924) + 1;
    uint _2934 = uint(int(uint(_2932) >> uint(2)));
    int _2936 = _2932 & 3;
    float _2938 = (*spvDescriptorSet0.vp_c9)._m0[int(_2934)][_2936];
    int _2940 = ~as_type<int>(_2918);
    int _2942 = _2940 + 1;
    int _2944 = _2942 + 1;
    bool _2946 = !_2920;
    int _2948 = _2946 ? 0 : (-1);
    bool _2950 = uint(_2732) >= uint(_2427);
    float _2952 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2954 = _954 + _2952;
    int _2956 = _2944;
    bool _2958 = _2916;
    float _2960 = _2918;
    bool _2962 = _2950;
    if (_2916)
    {
        int _2964 = ~as_type<int>(_2918);
        int _2966 = _2964 + 1;
        _2956 = _2966;
    }
    int _2968 = _2956;
    if (_2632)
    {
        bool _2970 = _2850 > 0.5;
        _2958 = _2970;
    }
    bool _2972 = _2958;
    if (!_2496)
    {
        _2960 = _2463;
    }
    float _2974 = _2960;
    bool _2976 = !_2950;
    float _2978 = _2976 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2980 = _2974;
    float _2982 = _2978;
    if (_2606)
    {
        bool _2984 = _2477 > 0.5;
        _2962 = _2984;
    }
    bool _2986 = _2962;
    if (_2496)
    {
        _2980 = _2477;
    }
    float _2988 = _2980;
    float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2992 = _954 + _2990;
    int _2994 = abs(_2914);
    int _2996 = abs(_2968);
    float _2998 = fma(_2782, _2992, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3000 = fma(_2828, _2423, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3002 = fma(_2858, _2768, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3004 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3006 = _954 + _3004;
    int _3008 = abs(_2906);
    float _3010 = fma(_2864, _2954, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    if (!_2606)
    {
        _2900 = _2433;
    }
    float _3012 = _2900;
    float _3014 = fma(_2892, _3006, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3016 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3018 = _954 + _3016;
    int _3020 = ~_2718;
    int _3022 = _3020 + as_type<int>(_2978);
    int _3024 = _3022 + 1;
    int _3026 = ~_3008;
    int _3028 = _3026 + 1;
    int _3030 = _3028 + 1;
    float _3032 = fma(_2910, _3018, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3034 = _3012;
    if (!_2606)
    {
        _2982 = _3012;
    }
    float _3036 = _2982;
    int _3038 = _2427 * _3024;
    int _3040 = _3038 + _2620;
    float _3042 = _3036;
    if (_2606)
    {
        _3034 = _2433;
    }
    float _3044 = _3034;
    int _3046 = _3030 * as_type<int>(_2890);
    int _3048 = abs(_2948);
    int _3050 = ~_2994;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    float _3056 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3058 = int(_3056);
    bool _3060 = !_2598;
    int _3062 = _3060 ? 0 : 1;
    int _3064 = ~_2996;
    int _3066 = _3064 + 1;
    int _3068 = _3066 + 1;
    int _3070 = _3054 * as_type<int>(_2882);
    int _3072 = _3070 + _3046;
    int _3074 = abs(_3062);
    int _3076 = ~_3048;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    int _3082 = _3068 * as_type<int>(_2930);
    int _3084 = _3082 + _3072;
    bool _3086 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3088 = isnan(_954);
    bool _3090 = _3086 || _3088;
    bool _3092 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3094 = _3090 || _3092;
    float _3096 = float(_3094);
    bool _3098 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3100 = isnan(_954);
    bool _3102 = _3098 || _3100;
    bool _3104 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3106 = _3102 || _3104;
    float _3108 = float(_3106);
    int _3110 = _3080 * as_type<int>(_2938);
    int _3112 = _3110 + _3084;
    int _3114 = ~_3074;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    float _3120 = -_3096;
    float _3122 = _3120 + 1.0;
    bool _3124 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3126 = isnan(_954);
    bool _3128 = _3124 || _3126;
    bool _3130 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3132 = _3128 || _3130;
    float _3134 = float(_3132);
    float _3136 = -_3108;
    float _3138 = _3136 + 1.0;
    float _3140 = float(uint(_3058));
    int _3142 = _3112 * _3118;
    float _3144 = _3108 * _3122;
    bool _3146 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3148 = isnan(_954);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3154 = _3150 || _3152;
    float _3156 = float(_3154);
    float _3158 = -_3134;
    float _3160 = _3158 + 1.0;
    float _3162 = _3134 * _3138;
    bool _3164 = !_2447;
    int _3166 = _3164 ? _3040 : (-1);
    float _3168 = 1.0 / _3140;
    bool _3170 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3172 = isnan(_954);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3178 = _3174 || _3176;
    float _3180 = float(_3178);
    float _3182 = _3156 * _3160;
    float _3184 = -_3156;
    float _3186 = _3184 + 1.0;
    int _3188 = abs(_3058);
    int _3190 = _3166 * _3074;
    int _3192 = _3190 + _3142;
    bool _3194 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3196 = isnan(_954);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3202 = _3198 || _3200;
    float _3204 = float(_3202);
    float _3206 = _3180 * _3186;
    float _3208 = -_3180;
    float _3210 = _3208 + 1.0;
    bool _3212 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3214 = isnan(_954);
    bool _3216 = _3212 || _3214;
    bool _3218 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3220 = _3216 || _3218;
    float _3222 = float(_3220);
    float _3224 = as_type<float>(_3142);
    int _3226 = as_type<int>(_3182);
    float _3228 = _3044;
    if (!_2496)
    {
        float _3230 = in.m_55.z;
        _3224 = _3230;
    }
    float _3232 = _3224;
    float _3234 = float(uint(_3188));
    float _3236 = _3204 * _3210;
    float _3238 = -_3204;
    float _3240 = _3238 + 1.0;
    bool _3242 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3244 = isnan(_954);
    bool _3246 = _3242 || _3244;
    bool _3248 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3250 = _3246 || _3248;
    float _3252 = float(_3250);
    float _3254 = -_3222;
    float _3256 = _3254 + 1.0;
    int _3258 = as_type<int>(_3168) + (-2);
    float _3260 = 1.0 / _3234;
    float _3262 = float(uint(_3192));
    float _3264 = _3222 * _3240;
    float _3266 = _3252 * _3256;
    float _3268 = in.m_69.x;
    float _3270 = in.m_69.y;
    float _3272 = in.m_69.z;
    int _3274 = abs(_3192);
    float _3276 = as_type<float>(_3258) * _3262;
    bool _3278 = _1300 != 0.0;
    bool _3280 = isnan(_1300);
    bool _3282 = _3278 || _3280;
    bool _3284 = isnan(0.0);
    bool _3286 = _3282 || _3284;
    float _3288 = _2760 * _3266;
    float _3290 = -_3252;
    float _3292 = _3290 + 1.0;
    bool _3294 = _1298 == 0.0;
    bool _3296 = !_3286;
    bool _3298 = _3294 && _3296;
    float _3300 = trunc(_3276);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    float _3306 = float(uint(_3274));
    float _3308 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3288);
    bool _3310 = _1302 == 0.0;
    bool _3312 = _3310 && _3298;
    int _3314 = as_type<int>(_3260) + (-2);
    float _3316 = fma(_2998, _3264, _3308);
    int _3318 = ~_3058;
    int _3320 = _3318 + 1;
    float _3322 = abs(_1934);
    float _3324 = log2(_3322);
    float _3326 = _3252;
    float _3328 = _3232;
    if (!_2496)
    {
        _3326 = _3232;
    }
    float _3330 = _3326;
    float _3332 = as_type<float>(_3314) * _3306;
    float _3334 = _3330;
    if (_2496)
    {
        _3334 = _2463;
    }
    float _3336 = _3334;
    float _3338 = fma(_3000, _3236, _3316);
    if (_2496)
    {
        _3328 = _2463;
    }
    float _3340 = _3328;
    float _3342 = trunc(_3332);
    float _3344 = precise::max(_3342, 0.0);
    uint _3346 = uint(_3344);
    float _3348 = _3268;
    float _3350 = _3272;
    float _3352 = _3270;
    int _3354 = _3320;
    if (!_3312)
    {
        float _3356 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3268);
        _3348 = _3356;
    }
    float _3358 = _3348;
    int _3360 = ~_3188;
    int _3362 = _3360 + 1;
    if (!_3312)
    {
        float _3364 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3350 = _3364;
    }
    float _3366 = _3350;
    int _3368 = _3320 * int(_3304);
    int _3370 = _3368 + _3192;
    if (!_3312)
    {
        float _3372 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3270);
        _3352 = _3372;
    }
    float _3374 = _3352;
    float _3376 = _3336 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3378 = _3324 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3380 = float(uint(_3370));
    if (_2632)
    {
        float _3382 = -_3044;
        float _3384 = _3382 + 1.0;
        _3354 = as_type<int>(_3384);
    }
    int _3386 = _3354;
    float _3388 = _1284 * _3374;
    float _3390 = as_type<float>(_3258) * _3380;
    float _3392 = exp2(_3378);
    int _3394 = _3362 * int(_3346);
    int _3396 = _3394 + _3274;
    float _3398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3402 = _1934 <= 8000.0;
    bool _3404 = isnan(_1934);
    bool _3406 = _3402 || _3404;
    bool _3408 = isnan(8000.0);
    bool _3410 = _3406 || _3408;
    float _3412 = float(_3410);
    float _3414 = _1282 * _3374;
    float _3416 = float(uint(_3396));
    float _3418 = trunc(_3390);
    float _3420 = precise::max(_3418, 0.0);
    uint _3422 = uint(_3420);
    float _3424 = fma(_3002, _3206, _3338);
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3428 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3398);
    float _3430 = as_type<float>(_3314) * _3416;
    float _3432 = fma(_3010, _3182, _3424);
    float _3434 = fma(_3340, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3426);
    if (_2606)
    {
        float _3436 = -_3044;
        float _3438 = _3436 + 1.0;
        _3226 = as_type<int>(_3438);
    }
    int _3440 = _3226;
    float _3442 = trunc(_3430);
    float _3444 = precise::max(_3442, 0.0);
    uint _3446 = uint(_3444);
    float _3448 = _2988 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3450 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3452 = precise::clamp(_3450, 0.0, 1.0);
    float _3454 = fma(_3014, _3162, _3432);
    if (_2606)
    {
        float _3456 = _2986 ? as_type<float>(_3440) : _3044;
        _3042 = _3456;
    }
    float _3458 = _3042;
    float _3460 = -_3400;
    float _3462 = fma(_3448, 2.0, _3460);
    float _3464 = fma(_3452, -2.0, 3.0);
    float _3466 = _3452 * _3452;
    float _3468 = fma(_3032, _3144, _3454);
    float _3470 = fma(_1384, _3358, _3414);
    int _3472 = ~_3058;
    int _3474 = _3472 + 1;
    float _3476 = _3466 * _3464;
    int _3478 = int(_3304) + int(_3422);
    float _3480 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3482 = ~_3188;
    int _3484 = _3482 + 1;
    float _3486 = -_3476;
    float _3488 = _3486 + 1.0;
    int _3490 = int(_3346) + int(_3446);
    int _3492 = _3474 * _3478;
    int _3494 = _3492 + _3192;
    float _3496 = fma(_3488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3476);
    float _3498 = fma(_3376, -2.0, _3480);
    if (_2632)
    {
        float _3500 = _2972 ? as_type<float>(_3386) : _3044;
        _3228 = _3500;
    }
    float _3502 = _3228;
    float _3504 = fma(_3096, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3468);
    bool _3506 = uint(_3494) >= uint(_3058);
    int _3508 = _3484 * _3490;
    int _3510 = _3508 + _3274;
    float _3512 = _3412 * _3496;
    int _3514 = _3192 ^ _3058;
    float _3516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3518 = !_3506;
    int _3520 = _3518 ? 0 : (-1);
    float _3522 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3428);
    bool _3524 = uint(_3510) >= uint(_3188);
    float _3526 = -_132;
    float _3528 = fma(_3526, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3462);
    int _3530 = ~_3478;
    int _3532 = _3530 + _3520;
    int _3534 = _3532 + 1;
    float _3536 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3434);
    bool _3538 = !_3524;
    int _3540 = _3538 ? 0 : (-1);
    float _3542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3544 = uint(int(uint(_3514) >> uint(31)));
    int _3546 = _3058 * _3534;
    int _3548 = _3546 + _3192;
    bool _3550 = _3058 == 0;
    float _3552 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3498);
    bool _3554 = _3058 == 0;
    float _3556 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _3558 = ~_3540;
    int _3560 = _3490 + _3558;
    int _3562 = _3560 + 1;
    float _3564 = _3516 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3566 = ~int(_3544);
    int _3568 = _3566 + 1;
    float _3570 = _2810 * _3556;
    float _3572 = precise::clamp(_3570, 0.0, 1.0);
    bool _3574 = !_3550;
    int _3576 = _3574 ? _3548 : (-1);
    float _3578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3580 = _3562 ^ _3568;
    float _3582 = _1278 * _3374;
    float _3584 = fma(_1390, _3358, _3388);
    float _3586 = float(_3576);
    float _3588 = _3542 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3590 = ~_3568;
    int _3592 = _3590 + _3580;
    int _3594 = _3592 + 1;
    float _3596 = fma(_1380, _3358, _3582);
    float _3598 = fma(_1034, _3366, _3584);
    float _3600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3602 = !_3554;
    int _3604 = _3602 ? _3594 : (-1);
    float _3606 = _2266 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3608 = in.m_71.x;
    float _3610 = fma(_3564, _3502, -0.5);
    float _3612 = float(_3604);
    float _3614 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3606);
    float _3616 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3618 = fma(_3564, _3586, _3528);
    float _3620 = fma(_2784, _3588, -0.5);
    float _3622 = -_3552;
    float _3624 = fma(_3588, _3612, _3622);
    float _3626 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3614);
    float _3628 = _2306 * 0.5;
    float _3630 = exp2(_3616);
    float _3632 = fma(_3522, _3610, _3618);
    float _3634 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3636 = _3458 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3638 = fma(_3536, _3620, _3624);
    float _3640 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3626);
    float _3642 = fma(_1038, _3366, _3470);
    float _3644 = fma(_2356, -0.5, _3628);
    float _3646 = _3632 + 0.5;
    float _3648 = _3634 * _3600;
    float _3650 = _3636 * _3578;
    float _3652 = _3638 + 0.5;
    float _3654 = _3640 + _2306;
    float _3656 = _2352 + _2306;
    float _3658 = -_3572;
    float _3660 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3662 = -_3630;
    float _3664 = _3662 + 1.0;
    float _3666 = _3654 * 0.5;
    float _3668 = _3656 * 0.5;
    float _3670 = _3664 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _3650;
    out.m_73.y = _3648;
    out.m_73.z = _3646;
    out.m_73.w = _3652;
    float _3672 = _3660 * _3608;
    float _3674 = fma(_1036, _3366, _3596);
    float _3676 = _3670 * _2386;
    float _3678 = -_3670;
    float _3680 = _3678 + 1.0;
    out.m_75.x = _3668;
    out.m_75.y = _3644;
    out.m_75.z = _3666;
    out.m_75.w = _2306;
    float _3682 = _3672 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3684 = _2407 * _3676;
    bool _3686 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3688 = isnan(_2078);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3694 = _3690 || _3692;
    out.m_77.x = _3504;
    out.m_79.x = _3682;
    float _3696 = _2397 * _3676;
    out.m_81.x = _3598;
    out.m_81.y = _3642;
    out.m_81.z = _3674;
    float _3698 = fma(_2403, _3696, _2391);
    float _3700 = fma(_2405, _3696, _2393);
    float _3702 = _2397 * _3680;
    float _3704 = fma(_2397, _3684, _2395);
    out.gl_Position.x = _2352;
    out.gl_Position.y = _2356;
    out.gl_Position.z = _3640;
    out.gl_Position.w = _2306;
    float _3706 = _3648;
    float _3708 = _3696;
    float _3710 = _3640;
    if (!_3694)
    {
        _3706 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3712 = _3706;
    float _3714 = _3712;
    float _3716 = _3712;
    if (!_3694)
    {
        _3708 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3718 = _3708;
    out.m_83.x = _3698;
    out.m_83.y = _3700;
    out.m_83.z = _3704;
    out.m_83.w = _3702;
    float _3720 = _1990 * _2052;
    float _3722 = _3720;
    float _3724 = _3718;
    float _3726 = _3718;
    if (!_3694)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3728 = _2792;
    float _3730 = _3728;
    float _3732 = _3728;
    if (!_3694)
    {
        _3710 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3734 = _3710;
    float _3736 = _3720 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3738 = _3734;
    float _3740 = _3734;
    if (!_3694)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3742 = _2794;
    float _3744 = _3742;
    float _3746 = _3742;
    if (!_3694)
    {
        _3722 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3748 = _3722;
    bool _3750 = !_3694;
    float _3752 = _3748;
    float _3754 = _3748;
    if (!_3750)
    {
        bool _3756 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3758 = isnan(_2078);
        bool _3760 = _3756 || _3758;
        bool _3762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3764 = _3760 || _3762;
        if (!_3764)
        {
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = _2078 + _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3770;
            float _3774 = 1.0 / _3772;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3792 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3796 = _3768 * _3774;
            float _3798 = precise::clamp(_3796, 0.0, 1.0);
            float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3804 = fma(_3798, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3806 = fma(_3798, _3802, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3808 = fma(_3798, _3782, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3810 = fma(_3798, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3812 = fma(_3798, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3814 = fma(_3798, _3794, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3726 = _3806;
            _3746 = _3812;
            _3716 = _3804;
            _3740 = _3810;
            _3732 = _3808;
            _3754 = _3814;
            _3816 = true;
        }
        else
        {
            bool _3818 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3820 = isnan(_2078);
            bool _3822 = _3818 || _3820;
            bool _3824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3826 = _3822 || _3824;
            if (!_3826)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3828 = _3714;
            _3716 = _3828;
            if (!_3826)
            {
                _3724 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3830 = _3724;
            _3726 = _3830;
            if (!_3826)
            {
                _3730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3832 = _3730;
            _3732 = _3832;
            if (!_3826)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3834 = _3738;
            _3740 = _3834;
            if (!_3826)
            {
                _3744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3836 = _3744;
            _3746 = _3836;
            if (!_3826)
            {
                _3752 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3838 = _3752;
            bool _3840 = !_3826;
            _3754 = _3838;
            if (!_3840)
            {
                bool _3842 = _2078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3844 = isnan(_2078);
                bool _3846 = _3842 || _3844;
                bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3850 = _3846 || _3848;
                if (!_3850)
                {
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = _2078 + _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3858 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3856;
                    float _3860 = 1.0 / _3858;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3880 = _3878 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3882 = _3854 * _3860;
                    float _3884 = precise::clamp(_3882, 0.0, 1.0);
                    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3890 = fma(_3884, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3892 = fma(_3884, _3888, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3894 = fma(_3884, _3868, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3896 = fma(_3884, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3898 = fma(_3884, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3900 = fma(_3884, _3880, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3726 = _3892;
                    _3746 = _3898;
                    _3716 = _3890;
                    _3740 = _3896;
                    _3732 = _3894;
                    _3754 = _3900;
                    _3816 = true;
                }
                else
                {
                    _3726 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3754 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3816 = false;
    float _3902 = _3726;
    float _3904 = _3746;
    float _3906 = _3716;
    float _3908 = _3740;
    float _3910 = _3732;
    float _3912 = _3754;
    float _3914 = fma(_3642, -0.5, 0.5);
    float _3916 = precise::clamp(_3914, 0.0, 1.0);
    float _3918 = -_3902;
    float _3920 = _3918 + _3904;
    float _3922 = _3736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3924 = -_3906;
    float _3926 = _3924 + _3908;
    float _3928 = fma(_3916, _3920, _3902);
    out.m_85.x = 0.0;
    float _3930 = -_3910;
    float _3932 = _3930 + _3912;
    float _3934 = fma(_3916, _3926, _3906);
    float _3936 = _3928 * 0.586610972881317138671875;
    out.m_49.x = _3922;
    bool _3938 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3940 = fma(_3916, _3932, _3910);
    float _3942 = fma(_3934, 0.298911988735198974609375, _3936);
    bool _3944 = _1990 > 0.0;
    bool _3946 = isnan(_1990);
    bool _3948 = _3944 || _3946;
    bool _3950 = isnan(0.0);
    bool _3952 = _3948 || _3950;
    float _3954 = fma(_3940, 0.114477999508380889892578125, _3942);
    bool _3956 = _2052 <= 0.0;
    bool _3958 = !_3952;
    bool _3960 = _3956 || _3958;
    float _3962 = -_3954;
    float _3964 = _3934 + _3962;
    float _3966 = -_3954;
    float _3968 = _3928 + _3966;
    float _3970 = -_3954;
    float _3972 = _3940 + _3970;
    float _3974 = fma(_3964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    float _3976 = fma(_3968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    float _3978 = fma(_3972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3954);
    bool _3980 = !_3938;
    if (!_3980)
    {
        float _3982 = -_1918;
        float _3984 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3986 = -_1920;
        float _3988 = _3986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3990 = -_1922;
        float _3992 = _3990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3994 = _3984 * _3984;
        float _3996 = fma(_3988, _3988, _3994);
        float _3998 = fma(_3992, _3992, _3996);
        float _4000 = sqrt(_3998);
        float _4002 = rsqrt(_3998);
        float _4004 = -_4000;
        float _4006 = _4004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4008 = _4006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4010 = precise::clamp(_4008, 0.0, 1.0);
        float _4012 = _3988 * _4002;
        float _4014 = _3984 * _4002;
        float _4016 = abs(_4010);
        float _4018 = log2(_4016);
        float _4020 = _3992 * _4002;
        float _4022 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4024 = _3642 * _4014;
        float _4026 = -_4014;
        float _4028 = -_4022;
        float _4030 = fma(_4026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4028);
        float _4032 = fma(_3598, _4012, _4024);
        float _4034 = -_4020;
        float _4036 = fma(_4034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4030);
        float _4038 = fma(_3674, _4020, _4032);
        float _4040 = precise::clamp(_4038, 0.0, 1.0);
        float _4042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4044 = _4036 + _4042;
        float _4046 = _4018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4048 = _4044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4050 = precise::clamp(_4048, 0.0, 1.0);
        float _4052 = exp2(_4046);
        float _4054 = _4052 * _4050;
        float _4056 = _4040 * _4054;
        float _4058 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4060 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4062 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _4058;
        out.m_85.y = _4060;
        out.m_85.z = _4062;
    }
    out.m_87.x = _3974;
    out.m_87.y = _3976;
    out.m_87.z = _3978;
    if (!_3960)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4064 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4064;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

