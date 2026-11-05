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
    float4 m_67 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4886 = false;
    bool _672 = false;
    bool _530 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _5119 = as_type<float>(_130);
        out.gl_Position.z = _5119;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5189 = as_type<float>(_168);
        out.gl_Position.z = _5189;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = 1.0 / _236;
    float _244 = 1.0 / _232;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    float _266 = _208 * _242;
    bool _268 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_200);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_200);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -_258;
    float _302 = _300 + 1.0;
    float _304 = -_278;
    float _306 = _304 + 1.0;
    float _308 = _228 * _244;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _314;
    float _318 = _294 * _306;
    float _320 = fma(_282, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_316, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = _278 * _302;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _322 * _318;
    float _334 = _324 * _318;
    float _336 = _320 * _318;
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_298, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_344, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_330, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_356, _326, _346);
    float _372 = fma(_354, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = fma(_358, _326, _348);
    float _380 = fma(_360, _326, _350);
    float _382 = fma(_372, _264, _370);
    float _384 = fma(_374, _264, _378);
    float _386 = fma(_376, _264, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_114);
        float _418 = 1.0 / _416;
        float _420 = _148 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_55.x;
    float _426 = in.m_55.y;
    float _428 = in.m_55.z;
    bool _430 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _432 = isnan(_422);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _448 = isnan(_422);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _422 + _462;
    float _466 = -_440;
    float _468 = _466 + 1.0;
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _472 = 1.0 / _444;
    float _474 = _456 * _468;
    float _476 = -_456;
    float _478 = _476 + 1.0;
    float _480 = _390 * _426;
    float _482 = _392 * _428;
    float _484 = _460 * _472;
    float _486 = _388 * _424;
    float _488 = fma(_484, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _490 = _488 * _474;
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[116].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _502;
    out.m_57.y = _504;
    out.m_57.z = _506;
    out.m_57.w = _508;
    bool _510 = !_470;
    float _528;
    if (!_510)
    {
        float _512 = in.m_53.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_114);
        float _534 = 1.0 / _532;
        float _536 = _148 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _542 = _538 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _550 = isnan(_538);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _564 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _566 = isnan(_538);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _576;
    bool _580 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _582 = isnan(_538);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _574 * _596;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = 1.0 / _562;
    float _608 = _578 * _592;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _614 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _616 = _612 * _606;
    float _618 = _614 * _600;
    float _620 = -_590;
    float _622 = _620 + 1.0;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _626 = _538 + _624;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[131].x, _618);
    float _630 = _558 * _622;
    float _632 = fma(_616, _626, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _636 = fma(_632, _630, _628);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[133].x, _636);
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _644;
    out.m_59.y = _646;
    out.m_59.z = _648;
    out.m_59.w = _650;
    bool _652 = !_598;
    float _670;
    if (!_652)
    {
        float _654 = in.m_53.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_114);
        float _676 = 1.0 / _674;
        float _678 = _148 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _684 = int(_682);
    float _686 = in.m_53.x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _690 = _680 + _688;
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _696 = _694 != 0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _700 = _680 + _698;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _704 = int(_702);
    float _706 = in.m_53.z;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _714 = _712 != 0;
    float _716 = in.m_61.x;
    float _718 = float(_114);
    float _720 = float(_684);
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _724 = int(_722);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _730 = float(_704);
    float _732 = 1.0 / _720;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _744 = int(_742);
    float _746 = float(uint(_724));
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _752 = ~_724;
    int _754 = _752 + 1;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _756;
    bool _760 = _706 > 0.5;
    float _762 = 0.0;
    float _764 = _730;
    bool _766 = _696;
    float _768 = _716;
    if (!_710)
    {
        _762 = _716;
    }
    float _770 = _762;
    float _772 = 1.0 / _730;
    float _774 = _732 * _148;
    int _776 = _724 + (-1);
    bool _778 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _780 = isnan(_680);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _792 = int(_790);
    float _794 = float(_744);
    float _796 = _770;
    if (_696)
    {
        _764 = 1.0;
    }
    float _798 = _764;
    float _800 = _798;
    if (!_696)
    {
        _800 = 7.345489978790283203125;
    }
    float _802 = _800;
    float _804 = 1.0 / _746;
    float _806 = _772 * _148;
    float _808 = _802 * _686;
    float _810 = trunc(_774);
    int _812 = int(_810);
    float _814 = float(uint(_792));
    int _816 = ~_792;
    int _818 = _816 + 1;
    int _820 = ~_792;
    int _822 = _820 + 1;
    float _824 = float(_792);
    float _826 = 1.0 / _794;
    int _828 = as_type<int>(_804) + (-2);
    float _830 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _832 = int(_830);
    float _834 = float(uint(_812));
    float _836 = as_type<float>(_828) * _834;
    float _838 = 1.0 / _814;
    float _840 = trunc(_806);
    int _842 = int(_840);
    float _844 = _826 * _148;
    float _846 = float(uint(_832));
    int _848 = ~_724;
    int _850 = _848 + 1;
    int _852 = ~_832;
    int _854 = _852 + 1;
    float _856 = 1.0 / _846;
    int _858 = as_type<int>(_838) + (-2);
    int _860 = ~_832;
    int _862 = _860 + 1;
    float _864 = float(_832);
    float _866 = trunc(_844);
    int _868 = int(_866);
    float _870 = float(uint(_842));
    float _872 = in.m_53.w;
    float _874 = float(_842);
    float _876 = as_type<float>(_858) * _870;
    float _878 = trunc(_836);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    int _885 = as_type<int>(_856) + (-2);
    float _887 = float(uint(_868));
    float _889 = trunc(_876);
    float _891 = precise::max(_889, 0.0);
    uint _893 = uint(_891);
    float _895 = as_type<float>(_885) * _887;
    float _897 = _887;
    int _899 = _885;
    if (_696)
    {
        _897 = _686;
    }
    float _901 = _897;
    int _903 = _850 * int(_883);
    int _905 = _903 + _812;
    float _907 = trunc(_895);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    float _913 = _901;
    float _915 = as_type<float>(_905);
    if (!_696)
    {
        _913 = _692;
    }
    float _917 = _913;
    float _919 = float(uint(_905));
    float _921 = _917;
    if (_696)
    {
        _915 = 1.0;
    }
    float _923 = _915;
    float _925 = floor(_808);
    float _927 = as_type<float>(_828) * _919;
    float _929 = _923;
    if (!_696)
    {
        _929 = 1.2345600128173828125;
    }
    float _931 = _929;
    int _933 = _818 * int(_893);
    int _935 = _933 + _842;
    float _937 = trunc(_927);
    float _939 = precise::max(_937, 0.0);
    uint _941 = uint(_939);
    int _943 = _854 * int(_911);
    int _945 = _943 + _868;
    float _947 = _917 * _931;
    float _949 = as_type<float>(_935);
    if (_696)
    {
        _921 = _686;
    }
    float _951 = _921;
    float _953 = float(uint(_935));
    float _955 = _951;
    if (_696)
    {
        _949 = 1.0;
    }
    float _957 = _949;
    float _959 = floor(_947);
    float _961 = float(uint(_945));
    float _963 = as_type<float>(_858) * _953;
    float _965 = _957;
    int _967 = as_type<int>(_963);
    float _969 = _961;
    if (!_696)
    {
        _955 = _706;
    }
    float _971 = _955;
    float _973 = in.m_61.y;
    int _975 = as_type<int>(_971);
    if (!_696)
    {
        _965 = 5.839270114898681640625;
    }
    float _977 = _965;
    float _979 = as_type<float>(_885) * _961;
    if (_710)
    {
        bool _981 = _686 > 0.5;
        _766 = _981;
    }
    bool _983 = _766;
    float _985 = trunc(_963);
    float _987 = precise::max(_985, 0.0);
    uint _989 = uint(_987);
    int _991 = int(_883) + int(_941);
    float _993 = _971 * _977;
    if (_710)
    {
        float _995 = -_716;
        float _997 = _995 + 1.0;
        _975 = as_type<int>(_997);
    }
    int _999 = _975;
    float _1001 = -_925;
    float _1003 = _808 + _1001;
    int _1005 = _754 * _991;
    int _1007 = _1005 + _812;
    float _1009 = float(_724);
    float _1011 = trunc(_979);
    float _1013 = precise::max(_1011, 0.0);
    uint _1015 = uint(_1013);
    if (_710)
    {
        float _1017 = _983 ? as_type<float>(_999) : _716;
        _796 = _1017;
    }
    float _1019 = _796;
    if (_714)
    {
        float _1021 = -_716;
        float _1023 = _1021 + 1.0;
        _967 = as_type<int>(_1023);
    }
    int _1025 = _967;
    if (!_714)
    {
        _969 = _716;
    }
    float _1027 = _969;
    float _1029 = -_959;
    float _1031 = _947 + _1029;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1043 = _1041 != 0;
    bool _1045 = uint(_1007) >= uint(_724);
    float _1047 = floor(_993);
    float _1049 = float(_812);
    float _1051 = _1027;
    if (_714)
    {
        float _1053 = _760 ? as_type<float>(_1025) : _716;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = -_973;
    float _1059 = _1057 + 1.0;
    bool _1061 = !_1043;
    int _1063 = _1061 ? 0 : 1;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1067 = _1065 != 0;
    float _1069 = 1.0 / _718;
    bool _1071 = _1049 >= _1009;
    bool _1073 = isnan(_1049);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_1009);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1085 = _1083 != 0;
    bool _1087 = _692 > 0.5;
    int _1089 = int(_893) + int(_989);
    float _1091 = trunc(_1081);
    int _1093 = int(_1091);
    int _1095 = int(_911) + int(_1015);
    float _1097 = -_1047;
    float _1099 = _993 + _1097;
    bool _1101 = !_1067;
    int _1103 = _1101 ? 0 : 1;
    int _1105 = _822 * _1089;
    int _1107 = _1105 + _842;
    bool _1109 = !_1085;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _862 * _1095;
    int _1115 = _1113 + _868;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1119 = _1117 != 0;
    float _1121 = 1.0 / _728;
    int _1123 = _1087 ? as_type<int>(_1059) : as_type<int>(_973);
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1127 = _1125 != 0;
    bool _1129 = !_1045;
    int _1131 = _1129 ? 0 : (-1);
    float _1133 = _1119 ? as_type<float>(_1123) : _973;
    float _1135 = 1.0 / _736;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1143 = _1141 != 0;
    int _1145 = ~_991;
    int _1147 = _1145 + _1131;
    int _1149 = _1147 + 1;
    bool _1151 = !_1127;
    int _1153 = _1151 ? 0 : 1;
    bool _1155 = uint(_1107) >= uint(_792);
    int _1157 = _724 * _1149;
    int _1159 = _1157 + _812;
    bool _1161 = !_1143;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = 1.0 / _740;
    bool _1167 = _724 == 0;
    bool _1169 = _874 >= _824;
    bool _1171 = isnan(_874);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(_824);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = _1003 * _1009;
    bool _1183 = !_1155;
    int _1185 = _1183 ? 0 : (-1);
    float _1187 = _1009 * _148;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1195 = _1193 != 0;
    float _1197 = 1.0 / _750;
    int _1199 = ~_1093;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    bool _1205 = !_1167;
    int _1207 = _1205 ? _1159 : (-1);
    bool _1209 = !_1139;
    int _1211 = _1209 ? 0 : 1;
    bool _1213 = !_1191;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = trunc(_1179);
    int _1219 = int(_1217);
    int _1221 = _1207 * _1203;
    bool _1223 = uint(_1115) >= uint(_832);
    float _1225 = _824 * _1031;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1229 = _1227 != 0;
    float _1231 = _1187 * _1069;
    float _1233 = _1069 * _148;
    bool _1235 = !_1039;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = trunc(_1181);
    int _1241 = int(_1239);
    bool _1243 = !_1035;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _824 * _1233;
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1251 = _1249 != 0;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1255 = _1253 != 0;
    int _1257 = _1093 * _776;
    int _1259 = _1257 + _1221;
    int _1261 = ~_1089;
    int _1263 = _1261 + _1185;
    int _1265 = _1263 + 1;
    float _1267 = _864 * _1233;
    float _1269 = float(_868);
    float _1271 = trunc(_1225);
    int _1273 = int(_1271);
    int _1275 = abs(_1237);
    int _1277 = _792 * _1265;
    int _1279 = _1277 + _842;
    bool _1281 = !_1255;
    int _1283 = _1281 ? 0 : 1;
    float _1285 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1287 = _792 == 0;
    bool _1289 = _1269 >= _864;
    bool _1291 = isnan(_1269);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan(_864);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = trunc(_1231);
    int _1303 = int(_1301);
    float _1305 = _864 * _1099;
    int _1307 = abs(_1111);
    int _1309 = abs(_1153);
    int _1311 = abs(_1245);
    int _1313 = _1241 * _1307;
    int _1315 = _1313 + _812;
    float _1317 = trunc(_1247);
    int _1319 = int(_1317);
    int _1321 = ~_1219;
    int _1323 = _1321 + 1;
    int _1325 = _1323 + 1;
    int _1327 = _1273 * _1309;
    int _1329 = _1327 + _842;
    bool _1331 = !_1287;
    int _1333 = _1331 ? _1279 : (-1);
    int _1335 = _1259 * _1275;
    int _1337 = abs(_1163);
    int _1339 = _1325 * _1333;
    int _1341 = abs(_1063);
    int _1343 = _1303 * _1311;
    int _1345 = _1343 + _1335;
    int _1347 = _792 + (-1);
    float _1349 = trunc(_1299);
    int _1351 = int(_1349);
    int _1353 = abs(_1103);
    int _1355 = _1219 * _1347;
    int _1357 = _1355 + _1339;
    int _1359 = abs(_1211);
    int _1361 = _1315 * _1341;
    int _1363 = _1361 + _1345;
    float _1365 = trunc(_1267);
    int _1367 = int(_1365);
    int _1369 = _1357 * _1337;
    int _1371 = abs(_1215);
    int _1373 = _1241 * _1353;
    int _1375 = _1373 + _1363;
    bool _1377 = !_1223;
    int _1379 = _1377 ? 0 : (-1);
    int _1381 = _1319 * _1359;
    int _1383 = _1381 + _1369;
    float _1385 = trunc(_1305);
    int _1387 = int(_1385);
    float _1389 = float(uint(_1375));
    bool _1391 = !_1195;
    int _1393 = _1391 ? 0 : 1;
    int _1395 = _1329 * _1371;
    int _1397 = _1395 + _1383;
    int _1399 = ~_1095;
    int _1401 = _1399 + _1379;
    int _1403 = _1401 + 1;
    float _1405 = as_type<float>(_828) * _1389;
    int _1407 = abs(_1393);
    bool _1409 = !_1229;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = trunc(_1405);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    bool _1419 = !_1251;
    int _1421 = _1419 ? 0 : 1;
    int _1423 = _1273 * _1407;
    int _1425 = _1423 + _1397;
    int _1427 = abs(_1411);
    int _1429 = _832 * _1403;
    int _1431 = _1429 + _868;
    bool _1433 = _832 == 0;
    float _1435 = float(uint(_1425));
    int _1437 = _1387 * _1427;
    int _1439 = _1437 + _868;
    int _1441 = ~_724;
    int _1443 = _1441 + 1;
    int _1445 = ~_1351;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = as_type<float>(_858) * _1435;
    bool _1453 = !_1433;
    int _1455 = _1453 ? _1431 : (-1);
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1459 = _1457 != 0;
    int _1461 = _1443 * int(_1417);
    int _1463 = _1461 + _1375;
    int _1465 = _832 + (-1);
    int _1467 = _1449 * _1455;
    int _1469 = abs(_1283);
    float _1471 = trunc(_1451);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = float(uint(_1463));
    int _1479 = _1351 * _1465;
    int _1481 = _1479 + _1467;
    bool _1483 = !_1459;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = abs(_1421);
    float _1489 = as_type<float>(_828) * _1477;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1493 = _1491 != 0;
    int _1495 = ~_792;
    int _1497 = _1495 + 1;
    int _1499 = _1481 * _1469;
    int _1501 = abs(_1485);
    float _1503 = trunc(_1489);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    bool _1509 = !_1493;
    int _1511 = _1509 ? 0 : 1;
    int _1513 = _1367 * _1487;
    int _1515 = _1513 + _1499;
    int _1517 = abs(_1511);
    bool _1519 = _872 > 0.5;
    int _1521 = _1497 * int(_1475);
    int _1523 = _1521 + _1425;
    int _1525 = _1519 ? as_type<int>(_1059) : as_type<int>(_973);
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1529 = _1527 != 0;
    int _1531 = _1439 * _1501;
    int _1533 = _1531 + _1515;
    float _1535 = float(uint(_1523));
    float _1537 = _1529 ? as_type<float>(_1525) : _973;
    int _1539 = _1387 * _1517;
    int _1541 = _1539 + _1533;
    int _1543 = int(_1417) + int(_1507);
    float _1545 = as_type<float>(_858) * _1535;
    int _1547 = ~_724;
    int _1549 = _1547 + 1;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1553 = _1551 != 0;
    float _1555 = trunc(_1545);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    float _1561 = float(uint(_1541));
    int _1563 = _1549 * _1543;
    int _1565 = _1563 + _1375;
    bool _1567 = _706 > 0.5;
    float _1569 = float(uint(_1315));
    float _1571 = as_type<float>(_885) * _1561;
    bool _1573 = uint(_1565) >= uint(_724);
    int _1575 = ~_832;
    int _1577 = _1575 + 1;
    float _1579 = as_type<float>(_828) * _1569;
    bool _1581 = !_1573;
    int _1583 = _1581 ? 0 : (-1);
    float _1585 = trunc(_1571);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    float _1591 = _973;
    int _1593 = as_type<int>(_1059);
    int _1595 = _1311;
    float _1597 = as_type<float>(_1329);
    if (_1553)
    {
        float _1599 = _1567 ? _1059 : _973;
        _1591 = _1599;
    }
    float _1601 = _1591;
    float _1603 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1607 = _1605 != 0;
    int _1609 = ~_1543;
    int _1611 = _1609 + _1583;
    int _1613 = _1611 + 1;
    int _1615 = int(_1475) + int(_1559);
    float _1617 = trunc(_1579);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = ~_792;
    int _1625 = _1623 + 1;
    int _1627 = _724 * _1613;
    int _1629 = _1627 + _1375;
    int _1631 = ~_724;
    int _1633 = _1631 + 1;
    int _1635 = _1625 * _1615;
    int _1637 = _1635 + _1425;
    bool _1639 = !_1167;
    int _1641 = _1639 ? _1629 : (-1);
    if (_1607)
    {
        float _1643 = -_716;
        float _1645 = _1643 + 1.0;
        _1593 = as_type<int>(_1645);
    }
    int _1647 = _1593;
    int _1649 = _1577 * int(_1589);
    int _1651 = _1649 + _1541;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1657 = _1641 & 3;
    bool _1659 = _1657 != 0;
    if (_1607)
    {
        float _1661 = _1087 ? as_type<float>(_1647) : _716;
        _768 = _1661;
    }
    float _1663 = _768;
    int _1665 = _1641 & 3;
    bool _1667 = _1665 != 0;
    int _1669 = _1633 * int(_1621);
    int _1671 = _1669 + _1315;
    int _1673 = _1659 ? 0 : 1;
    float _1675 = 1.0 / _1655;
    bool _1677 = uint(_1637) >= uint(_792);
    float _1679 = float(uint(_1651));
    bool _1681 = uint(_1665) >= 2u;
    bool _1683 = !_1677;
    int _1685 = _1683 ? 0 : (-1);
    float _1687 = as_type<float>(_885) * _1679;
    int _1689 = _1681 ? 0 : 1;
    bool _1691 = _1665 != 3;
    float _1693 = trunc(_1687);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    bool _1699 = uint(_1665) > 1u;
    int _1701 = ~_1615;
    int _1703 = _1701 + _1685;
    int _1705 = _1703 + 1;
    int _1707 = ~_1689;
    int _1709 = _1707 + 1;
    int _1711 = _1709 + 1;
    int _1713 = ~_1673;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    int _1719 = _792 * _1705;
    int _1721 = _1719 + _1425;
    float _1723 = float(uint(_1439));
    int _1725 = _1711;
    int _1727 = _1717;
    float _1729 = as_type<float>(_1665);
    if (_1691)
    {
        int _1731 = ~_1689;
        int _1733 = _1731 + 1;
        _1725 = _1733;
    }
    int _1735 = _1725;
    bool _1737 = !_1287;
    int _1739 = _1737 ? _1721 : (-1);
    float _1741 = as_type<float>(_885) * _1723;
    if (!_1699)
    {
        int _1743 = ~_1673;
        int _1745 = _1743 + 1;
        _1727 = _1745;
    }
    int _1747 = _1727;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1751 = _1749 != 0;
    float _1753 = in.m_46.x;
    float _1755 = in.m_46.y;
    float _1757 = in.m_46.z;
    int _1759 = _1739 & 3;
    bool _1761 = _1759 != 0;
    bool _1763 = !_1751;
    int _1765 = _1763 ? 0 : 1;
    bool _1767 = uint(_1759) >= 2u;
    int _1769 = _1761 ? 0 : 1;
    int _1771 = int(_1589) + int(_1697);
    bool _1773 = _1759 != 3;
    int _1775 = _1767 ? 0 : 1;
    bool _1777 = uint(_1759) > 1u;
    int _1779 = ~_832;
    int _1781 = _1779 + 1;
    int _1783 = ~_1775;
    int _1785 = _1783 + 1;
    int _1787 = _1785 + 1;
    int _1789 = ~_1769;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    int _1795 = _1781 * _1771;
    int _1797 = _1795 + _1541;
    float _1799 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1801 = _1787;
    int _1803 = _1793;
    float _1805 = as_type<float>(_1759);
    if (_1773)
    {
        int _1807 = ~_1775;
        int _1809 = _1807 + 1;
        _1801 = _1809;
    }
    int _1811 = _1801;
    float _1813 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1815 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1799);
    bool _1817 = uint(_1797) >= uint(_832);
    float _1819 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1813);
    if (!_1777)
    {
        int _1821 = ~_1769;
        int _1823 = _1821 + 1;
        _1803 = _1823;
    }
    int _1825 = _1803;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1829 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1819);
    bool _1831 = !_1817;
    int _1833 = _1831 ? 0 : (-1);
    float _1835 = -_1827;
    float _1837 = fma(_1603, 2.0, _1835);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1841 = _1839 != 0;
    float _1843 = _1829 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1847 = _1845 != 0;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1851 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1853 = float(uint(_1329));
    float _1855 = fma(_1285, -2.0, _1849);
    float _1857 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1851);
    float _1859 = float(uint(_1671));
    float _1861 = as_type<float>(_858) * _1853;
    float _1863 = trunc(_1741);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1877 = as_type<float>(_828) * _1859;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1879;
    float _1883 = _1871 * _1675;
    float _1885 = _1875 * _1121;
    float _1887 = trunc(_1861);
    float _1889 = precise::max(_1887, 0.0);
    uint _1891 = uint(_1889);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1893;
    int _1897 = ~_832;
    int _1899 = _1897 + 1;
    float _1901 = _1881 * _1135;
    int _1903 = ~_792;
    int _1905 = _1903 + 1;
    float _1907 = _1895 * _1165;
    int _1909 = ~_724;
    int _1911 = _1909 + 1;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1917 = trunc(_1877);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    int _1923 = _1899 * int(_1867);
    int _1925 = _1923 + _1439;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1929 = _1927 != 0;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1935 = ~_1771;
    int _1937 = _1935 + _1833;
    int _1939 = _1937 + 1;
    float _1941 = _686 + _692;
    float _1943 = float(uint(_1925));
    float _1945 = _1933 * _1197;
    int _1947 = _1905 * int(_1891);
    int _1949 = _1947 + _1329;
    float _1951 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1857);
    float _1953 = _1941 + (-1.0);
    float _1955 = float(uint(_1949));
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_1929)
    {
        _1595 = 0;
    }
    int _1961 = _1595;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1967 = int(_1621) + int(_1921);
    float _1969 = as_type<float>(_858) * _1955;
    float _1971 = as_type<float>(_885) * _1943;
    int _1973 = _832 * _1939;
    int _1975 = _1973 + _1541;
    float _1977 = _686 * 2.0;
    int _1979 = _1961;
    if (_1929)
    {
        _899 = 0;
    }
    int _1981 = _899;
    int _1983 = _1911 * _1967;
    int _1985 = _1983 + _1315;
    bool _1987 = !_1841;
    int _1989 = _1987 ? 0 : 1;
    float _1991 = 1.0 / _1959;
    bool _1993 = !_1433;
    int _1995 = _1993 ? _1975 : (-1);
    float _1997 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1999 = uint(_1985) >= uint(_724);
    float _2001 = _1951 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2003 = _1981;
    if (!_1929)
    {
        _2003 = 1;
    }
    int _2005 = _2003;
    float _2007 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1855);
    if (!_1929)
    {
        _1979 = 2;
    }
    int _2009 = _1979;
    float _2011 = floor(_1977);
    int _2013 = _1995 & 3;
    bool _2015 = _2013 != 0;
    bool _2017 = !_1847;
    int _2019 = _2017 ? 0 : 1;
    bool _2021 = _2013 != 3;
    bool _2023 = !_1999;
    int _2025 = _2023 ? 0 : (-1);
    float _2027 = trunc(_1969);
    float _2029 = precise::max(_2027, 0.0);
    uint _2031 = uint(_2029);
    bool _2033 = uint(_2013) >= 2u;
    float _2035 = _1915 * _1991;
    bool _2037 = !_1667;
    int _2039 = _2037 ? 0 : 1;
    int _2041 = _2033 ? 0 : 1;
    float _2043 = fma(_2035, _690, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2045 = uint(_2013) > 1u;
    float _2047 = trunc(_1971);
    float _2049 = precise::max(_2047, 0.0);
    uint _2051 = uint(_2049);
    int _2053 = ~_2041;
    int _2055 = _2053 + 1;
    int _2057 = _2055 + 1;
    int _2059 = _2057;
    if (_2021)
    {
        int _2061 = ~_2041;
        int _2063 = _2061 + 1;
        _2059 = _2063;
    }
    int _2065 = _2059;
    int _2067 = _2015 ? 0 : 1;
    bool _2069 = _2011 > 0.0;
    float _2071 = 1.0 / _1965;
    bool _2073 = _2011 >= 0.0;
    bool _2075 = isnan(_2011);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan(0.0);
    bool _2081 = _2077 || _2079;
    int _2083 = ~_792;
    int _2085 = _2083 + 1;
    int _2087 = int(_1891) + int(_2031);
    float _2089 = _692 * 2.0;
    float _2091 = _706 * 2.0;
    int _2093 = int(_1867) + int(_2051);
    float _2095 = _692 + _706;
    float _2097 = floor(_2089);
    int _2099 = abs(_2039);
    int _2101 = _2085 * _2087;
    int _2103 = _2101 + _1329;
    float _2105 = _758 * _2071;
    int _2107 = ~_2067;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _2095 + (-1.0);
    int _2115 = _2111;
    if (!_2045)
    {
        int _2117 = ~_2067;
        int _2119 = _2117 + 1;
        _2115 = _2119;
    }
    int _2121 = _2115;
    float _2123 = floor(_2091);
    int _2125 = ~_832;
    int _2127 = _2125 + 1;
    float _2129 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2131 = uint(_2103) >= uint(_792);
    float _2133 = fma(_2105, _700, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2135 = ~_1967;
    int _2137 = _2135 + _2025;
    int _2139 = _2137 + 1;
    int _2141 = _2127 * _2093;
    int _2143 = _2141 + _1439;
    bool _2145 = !_2131;
    int _2147 = _2145 ? 0 : (-1);
    int _2149 = _2081 ? 0 : 1;
    int _2151 = _724 * _2139;
    int _2153 = _2151 + _1315;
    bool _2155 = uint(_2143) >= uint(_832);
    bool _2157 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2159 = isnan(_680);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    bool _2169 = !_2155;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = ~_2149;
    int _2175 = _2173 + 1;
    int _2177 = _2175 + 1;
    float _2179 = -_2167;
    float _2181 = _2179 + 1.0;
    bool _2183 = _2097 > 0.0;
    bool _2185 = _2097 >= 0.0;
    bool _2187 = isnan(_2097);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(0.0);
    bool _2193 = _2189 || _2191;
    int _2195 = _2177;
    if (!_2069)
    {
        int _2197 = ~_2149;
        int _2199 = _2197 + 1;
        _2195 = _2199;
    }
    int _2201 = _2195;
    float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2205 = _680 + _2203;
    bool _2207 = !_1167;
    int _2209 = _2207 ? _2153 : (-1);
    float _2211 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1815);
    bool _2213 = _2123 > 0.0;
    bool _2215 = _2123 >= 0.0;
    bool _2217 = isnan(_2123);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(0.0);
    bool _2223 = _2219 || _2221;
    float _2225 = _2211 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2227 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2229 = isnan(_680);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    bool _2239 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2241 = isnan(_680);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    bool _2251 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2253 = isnan(_680);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2259 = _2255 || _2257;
    float _2261 = float(_2259);
    float _2263 = _2237 * _2181;
    float _2265 = -_2237;
    float _2267 = _2265 + 1.0;
    float _2269 = -_2249;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_1883, _2205, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2277 = _680 + _2275;
    float _2279 = _2249 * _2267;
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2283 = _680 + _2281;
    float _2285 = _788 * _2271;
    float _2287 = -_788;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_1885, _2277, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2293 = fma(_1901, _2283, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2297 = _680 + _2295;
    bool _2299 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2301 = isnan(_680);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2307 = _2303 || _2305;
    float _2309 = float(_2307);
    float _2311 = _2261 * _2289;
    float _2313 = -_2261;
    float _2315 = _2313 + 1.0;
    float _2317 = fma(_1945, _2297, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2321 = _680 + _2319;
    bool _2323 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2325 = isnan(_680);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2331);
    float _2335 = _2309 * _2315;
    float _2337 = -_2309;
    float _2339 = _2337 + 1.0;
    float _2341 = fma(_1907, _2321, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2343 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2345 = isnan(_680);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    float _2355 = -_2333;
    float _2357 = _2355 + 1.0;
    float _2359 = _2333 * _2339;
    int _2361 = _2193 ? 0 : 1;
    bool _2363 = _2009 != 2;
    float _2365 = _2353 * _2357;
    float _2367 = -_2353;
    float _2369 = _2367 + 1.0;
    int _2371 = ~_2087;
    int _2373 = _2371 + _2147;
    int _2375 = _2373 + 1;
    float _2377 = _2273 * _2365;
    int _2379 = ~_2093;
    int _2381 = _2379 + _2171;
    int _2383 = _2381 + 1;
    int _2385 = ~_2361;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    float _2391 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2377);
    int _2393 = _792 * _2375;
    int _2395 = _2393 + _1329;
    int _2397 = _2389;
    float _2399 = _2359;
    if (!_2183)
    {
        int _2401 = ~_2361;
        int _2403 = _2401 + 1;
        _2397 = _2403;
    }
    int _2405 = _2397;
    int _2407 = _832 * _2383;
    int _2409 = _2407 + _1439;
    float _2411 = fma(_2291, _2359, _2391);
    if (_2363)
    {
        _1597 = _686;
    }
    float _2413 = _1597;
    float _2415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2417 = _2225 + _2415;
    bool _2419 = _2005 != 1;
    float _2421 = fma(_2293, _2335, _2411);
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2425 = _2001 + _2423;
    float _2427 = _2413;
    if (!_2363)
    {
        _2427 = _706;
    }
    float _2429 = _2427;
    float _2431 = fma(_2317, _2311, _2421);
    int _2433 = _2223 ? 0 : 1;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2437 = !_1287;
    int _2439 = _2437 ? _2395 : (-1);
    float _2441 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2443 = !_1433;
    int _2445 = _2443 ? _2409 : (-1);
    float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2449 = _1843 + _2447;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2453 = _2451 != 0;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2457 = _2455 != 0;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2461 = _2459 != 0;
    float _2463 = -_2435;
    float _2465 = fma(_2441, 2.0, _2463);
    int _2467 = _1641 >> 31;
    float _2469 = _2449 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2471 = _1739 & 3;
    bool _2473 = _2471 != 0;
    float _2475 = fma(_2341, _2285, _2431);
    int _2477 = _2467 & 3;
    float _2479 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2469);
    bool _2481 = !_2473;
    int _2483 = _2481 ? 0 : 1;
    float _2485 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2487 = int(_2485);
    int _2489 = _1995 & 3;
    bool _2491 = _2489 != 0;
    float _2493 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2479);
    int _2495 = _1739 >> 31;
    float _2497 = fma(_2043, _2279, _2475);
    int _2499 = _1641 + _2477;
    int _2501 = _1995 >> 31;
    float _2503 = fma(_2133, _2263, _2497);
    bool _2505 = !_2491;
    int _2507 = _2505 ? 0 : 1;
    int _2509 = _2495 & 3;
    float _2511 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2503);
    bool _2513 = _1665 != 3;
    int _2515 = _2499 >> 2;
    int _2517 = _2501 & 3;
    out.m_63.x = _2511;
    int _2519 = _1739 + _2509;
    bool _2521 = !_2513;
    int _2523 = _2521 ? 0 : (-1);
    bool _2525 = _1759 != 3;
    int _2527 = _2515 << 4;
    int _2529 = _2527 + 368;
    int _2531 = _1995 + _2517;
    int _2533 = ~_2433;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    int _2539 = _2519 >> 2;
    int _2541 = _2537;
    if (!_2213)
    {
        int _2543 = ~_2433;
        int _2545 = _2543 + 1;
        _2541 = _2545;
    }
    int _2547 = _2541;
    bool _2549 = !_2525;
    int _2551 = _2549 ? 0 : (-1);
    uint _2553 = uint(int(uint(_2529) >> uint(2)));
    uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
    int _2557 = int(_2553) & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = int(_2553) + 1;
    uint _2563 = uint(int(uint(_2561) >> uint(2)));
    int _2565 = _2561 & 3;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[int(_2563)][_2565];
    bool _2569 = _2013 != 3;
    int _2571 = _2539 << 4;
    int _2573 = _2571 + 512;
    int _2575 = _2531 >> 2;
    uint _2577 = uint(int(uint(_2573) >> uint(2)));
    uint _2579 = uint(int(uint(int(_2577)) >> uint(2)));
    int _2581 = int(_2577) & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    int _2585 = int(_2577) + 1;
    uint _2587 = uint(int(uint(_2585) >> uint(2)));
    int _2589 = _2585 & 3;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[int(_2587)][_2589];
    int _2593 = _2575 << 4;
    int _2595 = _2593 + 656;
    if (!_2419)
    {
        _1729 = _706;
    }
    float _2597 = _1729;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2601 = _2597;
    if (_2419)
    {
        _2601 = _692;
    }
    float _2603 = _2601;
    int _2605 = abs(_1825);
    uint _2607 = uint(int(uint(_2595) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    if (!_2419)
    {
        _1805 = _692;
    }
    float _2623 = _1805;
    float _2625 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2599);
    bool _2627 = !_2569;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _2493 >= 0.0;
    float _2633 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2625);
    int _2635 = abs(_1747);
    int _2637 = _2529 + 8;
    uint _2639 = uint(int(uint(_2637) >> uint(2)));
    uint _2641 = uint(int(uint(int(_2639)) >> uint(2)));
    int _2643 = int(_2639) & 3;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[int(_2641)][_2643];
    int _2647 = int(_2639) + 1;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    int _2651 = _2647 & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    float _2655 = _2623;
    if (!_2419)
    {
        _2399 = _2623;
    }
    float _2657 = _2399;
    float _2659 = _2657;
    if (_2419)
    {
        _2655 = _686;
    }
    float _2661 = _2655;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2665 = ~_2635;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = _2595 + 8;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    if (_2419)
    {
        _2659 = _686;
    }
    float _2689 = _2659;
    float _2691 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2663);
    if (_2631)
    {
        out.m_49.x = 0.0;
    }
    int _2693 = ~_2099;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    float _2699 = _2689 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2701 = ~_2605;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = _2573 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2727 = abs(_2483);
    int _2729 = abs(_2121);
    int _2731 = abs(_2507);
    int _2733 = _2669 * as_type<int>(_2567);
    float _2735 = -_2725;
    float _2737 = fma(_2699, 2.0, _2735);
    int _2739 = abs(_1811);
    int _2741 = _2697 * as_type<int>(_2559);
    int _2743 = _2741 + _2733;
    int _2745 = abs(_1735);
    float _2747 = -_148;
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2737);
    int _2751 = _2705 * as_type<int>(_2591);
    int _2753 = ~_2729;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    float _2759 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2761 = int(_2759);
    int _2763 = ~_2727;
    int _2765 = _2763 + 1;
    int _2767 = _2765 + 1;
    int _2769 = ~_2731;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = _2757 * as_type<int>(_2621);
    int _2777 = ~_2745;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    int _2783 = _2767 * as_type<int>(_2583);
    int _2785 = _2783 + _2751;
    int _2787 = abs(_2065);
    int _2789 = _2773 * as_type<int>(_2613);
    int _2791 = _2789 + _2775;
    int _2793 = abs(_2523);
    float _2795 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2797 = int(_2795);
    int _2799 = ~_2787;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = _2781 * as_type<int>(_2645);
    int _2807 = _2805 + _2743;
    int _2809 = ~_2739;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    int _2815 = abs(_2551);
    int _2817 = ~_2793;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = abs(_2629);
    int _2825 = _2803 * as_type<int>(_2679);
    int _2827 = _2825 + _2791;
    float _2829 = float(uint(_2761));
    int _2831 = _2821 * as_type<int>(_2653);
    int _2833 = _2831 + _2807;
    int _2835 = abs(_1765);
    int _2837 = ~_2815;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    float _2843 = 1.0 / _2829;
    int _2845 = ~_2823;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    int _2851 = _2813 * as_type<int>(_2715);
    int _2853 = _2851 + _2785;
    int _2855 = abs(_1989);
    float _2857 = float(uint(_2487));
    int _2859 = _2841 * as_type<int>(_2723);
    int _2861 = _2859 + _2853;
    int _2863 = abs(_2487);
    int _2865 = _2849 * as_type<int>(_2687);
    int _2867 = _2865 + _2827;
    float _2869 = 1.0 / _2857;
    int _2871 = ~_2855;
    int _2873 = _2871 + 1;
    int _2875 = _2873 + 1;
    int _2877 = ~_2835;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = float(uint(_2797));
    int _2885 = _2875 * _2861;
    int _2887 = abs(_2019);
    int _2889 = abs(_2797);
    int _2891 = _2833 * _2881;
    float _2893 = 1.0 / _2883;
    int _2895 = _2439 * _2855;
    int _2897 = _2895 + _2885;
    int _2899 = _2209 * _2835;
    int _2901 = _2899 + _2891;
    int _2903 = abs(_2761);
    float _2905 = float(uint(_2863));
    int _2907 = ~_2887;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = float(uint(_2889));
    float _2915 = float(uint(_2903));
    float _2917 = 1.0 / _2905;
    int _2919 = _2911 * _2867;
    int _2921 = as_type<int>(_2869) + (-2);
    float _2923 = float(uint(_2901));
    int _2925 = _2445 * _2887;
    int _2927 = _2925 + _2919;
    int _2929 = as_type<int>(_2843) + (-2);
    float _2931 = 1.0 / _2915;
    float _2933 = float(uint(_2897));
    float _2935 = as_type<float>(_2921) * _2923;
    int _2937 = ~_2797;
    int _2939 = _2937 + 1;
    int _2941 = as_type<int>(_2893) + (-2);
    float _2943 = as_type<float>(_2929) * _2933;
    float _2945 = float(uint(_2927));
    float _2947 = 1.0 / _2913;
    int _2949 = abs(_2901);
    float _2951 = as_type<float>(_2941) * _2945;
    int _2953 = as_type<int>(_2917) + (-2);
    int _2955 = abs(_2897);
    float _2957 = trunc(_2935);
    float _2959 = precise::max(_2957, 0.0);
    uint _2961 = uint(_2959);
    float _2963 = float(uint(_2949));
    int _2965 = as_type<int>(_2931) + (-2);
    int _2967 = abs(_2927);
    int _2969 = ~_2487;
    int _2971 = _2969 + 1;
    float _2973 = trunc(_2951);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    int _2979 = as_type<int>(_2947) + (-2);
    float _2981 = as_type<float>(_2953) * _2963;
    bool _2983 = !_2457;
    int _2985 = _2983 ? 0 : 1;
    float _2987 = float(uint(_2955));
    float _2989 = trunc(_2943);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    int _2995 = abs(_2985);
    float _2997 = as_type<float>(_2965) * _2987;
    float _2999 = float(_2201);
    float _3001 = float(uint(_2967));
    float _3003 = trunc(_2981);
    float _3005 = precise::max(_3003, 0.0);
    uint _3007 = uint(_3005);
    int _3009 = _2971 * int(_2961);
    int _3011 = _3009 + _2901;
    int _3013 = ~_2761;
    int _3015 = _3013 + 1;
    float _3017 = as_type<float>(_2979) * _3001;
    float _3019 = float(_2995);
    int _3021 = _2939 * int(_2977);
    int _3023 = _3021 + _2927;
    float _3025 = float(uint(_3011));
    float _3027 = trunc(_2997);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    float _3033 = _2725;
    float _3035 = as_type<float>(_2961);
    if (!_2419)
    {
        _3033 = _706;
    }
    float _3037 = _3033;
    float _3039 = _3019 * _2999;
    int _3041 = _3015 * int(_2993);
    int _3043 = _3041 + _2897;
    float _3045 = _3037;
    if (_2419)
    {
        _3045 = _692;
    }
    float _3047 = _3045;
    float _3049 = as_type<float>(_2921) * _3025;
    float _3051 = float(uint(_3023));
    float _3053 = trunc(_3017);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = ~_2863;
    int _3061 = _3059 + 1;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3065 = _3047 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3067 = float(uint(_3043));
    float _3069 = as_type<float>(_2941) * _3051;
    int _3071 = ~_2889;
    int _3073 = _3071 + 1;
    int _3075 = _3061 * int(_3007);
    int _3077 = _3075 + _2949;
    float _3079 = trunc(_3049);
    float _3081 = precise::max(_3079, 0.0);
    uint _3083 = uint(_3081);
    float _3085 = fma(_3065, -2.0, _3063);
    int _3087 = ~_2903;
    int _3089 = _3087 + 1;
    float _3091 = as_type<float>(_2929) * _3067;
    bool _3093 = !_2453;
    int _3095 = _3093 ? 0 : 1;
    int _3097 = _3089 * int(_3031);
    int _3099 = _3097 + _2955;
    float _3101 = float(uint(_3077));
    int _3103 = _3073 * int(_3057);
    int _3105 = _3103 + _2967;
    int _3107 = abs(_3095);
    float _3109 = trunc(_3091);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = float(_2547);
    float _3117 = as_type<float>(_2953) * _3101;
    float _3119 = float(_3107);
    float _3121 = float(uint(_3099));
    float _3123 = float(uint(_3105));
    float _3125 = trunc(_3117);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    int _3131 = int(_2961) + int(_3083);
    float _3133 = _3119 * _3115;
    float _3135 = as_type<float>(_2965) * _3121;
    float _3137 = _3123;
    if (_2363)
    {
        _3035 = _692;
    }
    float _3139 = _3035;
    float _3141 = as_type<float>(_2979) * _3123;
    float _3143 = _3139;
    if (!_2363)
    {
        _3143 = _686;
    }
    float _3145 = _3143;
    float _3147 = _3133 * (-2.0);
    int _3149 = as_type<int>(_3145);
    if (_2631)
    {
        _3137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3151 = _3137;
    float _3153 = trunc(_3069);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    float _3159 = _3145 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3161 = ~_2487;
    int _3163 = _3161 + 1;
    if (_2631)
    {
        float _3165 = _3151 * 5.0;
        _3149 = as_type<int>(_3165);
    }
    int _3167 = _3149;
    float _3169 = fma(_1997, _3147, _1997);
    int _3171 = ~_2761;
    int _3173 = _3171 + 1;
    float _3175 = in.m_65.x;
    float _3177 = in.m_65.y;
    float _3179 = in.m_65.z;
    float _3181 = trunc(_3135);
    float _3183 = precise::max(_3181, 0.0);
    uint _3185 = uint(_3183);
    if (_2631)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9534 = as_type<float>(_3167);
        out.gl_Position.z = _9534;
    }
    int _3187 = int(_2993) + int(_3113);
    int _3189 = int(_3007) + int(_3129);
    int _3191 = _3163 * _3131;
    int _3193 = _3191 + _2901;
    float _3195 = trunc(_3141);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    int _3201 = int(_2977) + int(_3157);
    int _3203 = ~_2889;
    int _3205 = _3203 + 1;
    bool _3207 = uint(_3193) >= uint(_2487);
    int _3209 = ~_2863;
    int _3211 = _3209 + 1;
    int _3213 = ~_2797;
    int _3215 = _3213 + 1;
    int _3217 = _3173 * _3187;
    int _3219 = _3217 + _2897;
    int _3221 = int(_3031) + int(_3185);
    int _3223 = _3211 * _3189;
    int _3225 = _3223 + _2949;
    int _3227 = ~_2903;
    int _3229 = _3227 + 1;
    int _3231 = _3215 * _3201;
    int _3233 = _3231 + _2927;
    bool _3235 = uint(_3219) >= uint(_2761);
    float _3237 = fma(_3147, _3175, _3175);
    bool _3239 = uint(_3225) >= uint(_2863);
    int _3241 = _3229 * _3221;
    int _3243 = _3241 + _2955;
    bool _3245 = !_3207;
    int _3247 = _3245 ? 0 : (-1);
    float _3249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3251 = !_3235;
    int _3253 = _3251 ? 0 : (-1);
    bool _3255 = uint(_3233) >= uint(_2797);
    int _3257 = ~_3131;
    int _3259 = _3257 + _3247;
    int _3261 = _3259 + 1;
    int _3263 = ~_3187;
    int _3265 = _3263 + _3253;
    int _3267 = _3265 + 1;
    float _3269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3271 = int(_3057) + int(_3199);
    int _3273 = _2487 * _3261;
    int _3275 = _3273 + _2901;
    bool _3277 = uint(_3243) >= uint(_2903);
    int _3279 = _2761 * _3267;
    int _3281 = _3279 + _2897;
    bool _3283 = !_3255;
    int _3285 = _3283 ? 0 : (-1);
    int _3287 = _3205 * _3271;
    int _3289 = _3287 + _2967;
    bool _3291 = _2487 == 0;
    float _3293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3295 = !_3277;
    int _3297 = _3295 ? 0 : (-1);
    bool _3299 = _2761 == 0;
    int _3301 = ~_3201;
    int _3303 = _3301 + _3285;
    int _3305 = _3303 + 1;
    bool _3307 = !_3291;
    int _3309 = _3307 ? _3275 : (-1);
    bool _3311 = !_3299;
    int _3313 = _3311 ? _3281 : (-1);
    int _3315 = _2797 * _3305;
    int _3317 = _3315 + _2927;
    bool _3319 = _2797 == 0;
    bool _3321 = _2797 == 0;
    int _3323 = _2927 ^ _2797;
    float _3325 = _3249 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3327 = ~_3297;
    int _3329 = _3221 + _3327;
    int _3331 = _3329 + 1;
    float _3333 = _3269 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3335 = float(_3309);
    float _3337 = -_148;
    float _3339 = fma(_3337, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1837);
    bool _3341 = uint(_3289) >= uint(_2889);
    float _3343 = fma(_3325, _1019, -0.5);
    int _3345 = _2901 ^ _2487;
    float _3347 = fma(_3325, _3335, _3339);
    float _3349 = float(_3313);
    float _3351 = fma(_3333, _1055, -0.5);
    bool _3353 = !_3319;
    int _3355 = _3353 ? _3317 : (-1);
    float _3357 = _3293 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3359 = !_3341;
    int _3361 = _3359 ? 0 : (-1);
    float _3363 = _2449 * _2449;
    bool _3365 = _2761 == 0;
    float _3367 = fma(_3357, _1663, -0.5);
    bool _3369 = !_3239;
    int _3371 = _3369 ? 0 : (-1);
    int _3373 = _2897 ^ _2761;
    uint _3375 = uint(int(uint(_3345) >> uint(31)));
    float _3377 = fma(_3333, _3349, _2749);
    float _3379 = float(_3355);
    float _3381 = -_148;
    float _3383 = fma(_3381, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2465);
    int _3385 = ~_3371;
    int _3387 = _3189 + _3385;
    int _3389 = _3387 + 1;
    float _3391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3393 = ~int(_3375);
    int _3395 = _3393 + 1;
    float _3397 = fma(_3357, _3379, _3383);
    uint _3399 = uint(int(uint(_3373) >> uint(31)));
    int _3401 = _3389 ^ _3395;
    int _3403 = ~int(_3399);
    int _3405 = _3403 + 1;
    uint _3407 = uint(int(uint(_3323) >> uint(31)));
    float _3409 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3411 = ~_3395;
    int _3413 = _3411 + _3401;
    int _3415 = _3413 + 1;
    float _3417 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3419 = _3331 ^ _3405;
    float _3421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3423 = ~int(_3407);
    int _3425 = _3423 + 1;
    float _3427 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3409);
    int _3429 = ~_3405;
    int _3431 = _3429 + _3419;
    int _3433 = _3431 + 1;
    float _3435 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3417);
    float _3437 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2691);
    bool _3439 = _2487 == 0;
    float _3441 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3427);
    int _3443 = ~_3361;
    int _3445 = _3271 + _3443;
    int _3447 = _3445 + 1;
    float _3449 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3435);
    float _3451 = fma(_3437, _3351, _3377);
    float _3453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3455 = !_3365;
    int _3457 = _3455 ? _3433 : (-1);
    float _3459 = fma(_3441, _3343, _3347);
    bool _3461 = !_3439;
    int _3463 = _3461 ? _3415 : (-1);
    float _3465 = fma(_3449, _3367, _3397);
    float _3467 = _3391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3469 = _3447 ^ _3425;
    float _3471 = _3421 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3473 = float(_3457);
    float _3475 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3085);
    float _3477 = float(_3463);
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3481 = ~_3425;
    int _3483 = _3481 + _3469;
    int _3485 = _3483 + 1;
    float _3487 = fma(_1133, _3467, -0.5);
    float _3489 = -_3475;
    float _3491 = fma(_3471, _3473, _3489);
    float _3493 = -_2007;
    float _3495 = fma(_3467, _3477, _3493);
    bool _3497 = !_3321;
    int _3499 = _3497 ? _3485 : (-1);
    float _3501 = fma(_3159, -2.0, _3479);
    float _3503 = fma(_1537, _3471, -0.5);
    float _3505 = float(_3499);
    float _3507 = _3453 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3509 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3501);
    float _3511 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3515 = log2(_3513);
    float _3517 = -_3509;
    float _3519 = fma(_3507, _3505, _3517);
    float _3521 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3511);
    float _3523 = fma(_2417, _2417, _3363);
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3527 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3529 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3521);
    float _3531 = fma(_2425, _2425, _3523);
    float _3533 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3525);
    float _3535 = fma(_3507, _1601, -0.5);
    float _3537 = fma(_3529, _3487, _3495);
    float _3539 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3533);
    float _3541 = rsqrt(_3531);
    float _3543 = fma(_2633, _3503, _3491);
    float _3545 = _3459 + 0.5;
    float _3547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3549 = 1.0 + _3547;
    float _3551 = fma(_3539, _3535, _3519);
    float _3553 = _3451 + 0.5;
    float _3555 = _3537 + 0.5;
    float _3557 = _3543 + 0.5;
    float _3559 = 1.0 / _3549;
    float _3561 = _3465 + 0.5;
    float _3563 = _3551 + 0.5;
    float _3565 = _3527 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3567 = _3515 * _148;
    out.m_67.x = _3545;
    out.m_67.y = _3555;
    out.m_67.z = _3553;
    out.m_67.w = _3557;
    bool _3569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3571 = isnan(1.0);
    bool _3573 = _3569 || _3571;
    bool _3575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3577 = _3573 || _3575;
    float _3579 = _3565 * _3541;
    out.m_69.x = _3561;
    out.m_69.y = _3563;
    float _3581 = exp2(_3567);
    bool _3583 = !_2461;
    int _3585 = _3583 ? 0 : 1;
    float _3587 = _2417 * _3579;
    float _3589 = _2449 * _3579;
    float _3591 = as_type<float>(_3317);
    float _3593 = as_type<float>(_3129);
    if (_2631)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3595 = -_3589;
    float _3597 = _1843 + _3595;
    float _3599 = _2425 * _3579;
    float _3601 = -_3587;
    float _3603 = _2225 + _3601;
    float _3605 = -_3581;
    float _3607 = _3605 + 1.0;
    float _3609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3611 = _3597 + _3609;
    float _3613 = -_3599;
    float _3615 = _2001 + _3613;
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3619 = _3603 + _3617;
    bool _3621 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3623 = isnan(0.0);
    bool _3625 = _3621 || _3623;
    bool _3627 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3629 = _3625 || _3627;
    float _3631 = _3611 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3635 = _3615 + _3633;
    float _3637 = -_3589;
    float _3639 = _2449 + _3637;
    float _3641 = _3629 ? _3607 : 0.0;
    float _3643 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3631);
    float _3645 = _686 + (-0.5);
    float _3647 = -_3587;
    float _3649 = _2417 + _3647;
    float _3651 = _3639 * _3639;
    float _3653 = fma(_3635, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3643);
    float _3655 = _3631;
    if (_3577)
    {
        float _3657 = _3641 * _3559;
        _150 = _3657;
    }
    float _3659 = _150;
    float _3661 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3237);
    float _3663 = fma(_3649, _3649, _3651);
    float _3665 = -_3599;
    float _3667 = _2425 + _3665;
    bool _3669 = _3653 >= 0.0;
    float _3671 = fma(_3169, _3659, _3661);
    float _3673 = _3039 * (-2.0);
    float _3675 = fma(_3667, _3667, _3663);
    int _3677 = abs(_3585);
    float _3679 = _3671 * 0.15915493667125701904296875;
    float _3681 = _692 + (-0.5);
    float _3683 = sqrt(_3675);
    float _3685 = fma(_3673, _3177, _3177);
    float _3687 = fma(_2129, _3673, _2129);
    if (_3669)
    {
        _3655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3689 = _3655;
    float _3691 = fma(_3681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3685);
    float _3693 = _3679 * 6.283185482025146484375;
    float _3695 = sin(_3693);
    float _3697 = float(_2405);
    int _3699 = as_type<int>(_3689);
    if (_3669)
    {
        out.m_49.x = 0.0;
    }
    if (_3669)
    {
        float _3701 = _3689 * 5.0;
        _3699 = as_type<int>(_3701);
    }
    int _3703 = _3699;
    float _3705 = float(_3677);
    float _3707 = fma(_3687, _3659, _3691);
    float _3709 = _3679 * 6.283185482025146484375;
    float _3711 = cos(_3709);
    if (_3669)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10350 = as_type<float>(_3703);
        out.gl_Position.z = _10350;
    }
    float _3713 = _3705 * _3697;
    if (_3669)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3715 = -_1843;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3719 = _3707 * 0.15915493667125701904296875;
    float _3721 = -_2225;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3725 = -_2001;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3729 = _3717 * _3717;
    float _3731 = _686 + _706;
    float _3733 = _706 + (-0.5);
    float _3735 = _3719 * 6.283185482025146484375;
    float _3737 = sin(_3735);
    float _3739 = fma(_3723, _3723, _3729);
    float _3741 = _3731 + (-1.0);
    float _3743 = _3713 * (-2.0);
    float _3745 = fma(_3727, _3727, _3739);
    float _3747 = fma(_3741, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3749 = fma(_3743, _3179, _3179);
    float _3751 = _3719 * 6.283185482025146484375;
    float _3753 = cos(_3751);
    float _3755 = fma(_3747, _3743, _3747);
    float _3757 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3749);
    float _3759 = fma(_3755, _3659, _3757);
    float _3761 = rsqrt(_3745);
    float _3763 = _3541 * _3683;
    float _3765 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3767 = _3759 * 0.15915493667125701904296875;
    float _3769 = in.m_71.x;
    float _3771 = in.m_71.y;
    float _3773 = in.m_71.z;
    float _3775 = _3527 * _3763;
    float _3777 = _3767 * 6.283185482025146484375;
    float _3779 = sin(_3777);
    float _3781 = _3695 * _3737;
    float _3783 = _3711 * _3753;
    float _3785 = _3695 * _3753;
    bool _3787 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3789 = isnan(0.5);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3795 = _3791 || _3793;
    float _3797 = _3723 * _3761;
    float _3799 = _3727 * _3761;
    float _3801 = _3717 * _3761;
    float _3803 = _3767 * 6.283185482025146484375;
    float _3805 = cos(_3803);
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3797 * _3807;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3813 = _3799 * _3811;
    float _3815 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3817 = -_3809;
    float _3819 = fma(_3799, _3815, _3817);
    float _3821 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3823 = -_3813;
    float _3825 = fma(_3801, _3821, _3823);
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3829 = _3801 * _3827;
    float _3831 = fma(_3779, _3783, _3781);
    float _3833 = _3819 * _3819;
    float _3835 = fma(_3779, _3781, _3783);
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3839 = -_3829;
    float _3841 = fma(_3797, _3837, _3839);
    float _3843 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3845 = fma(_3825, _3825, _3833);
    float _3847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3771);
    float _3849 = _3711 * _3737;
    float _3851 = _3763 * _3843;
    float _3853 = fma(_3841, _3841, _3845);
    float _3855 = _3711 * _3805;
    float _3857 = _3753 * _3805;
    float _3859 = _3695 * _3805;
    float _3861 = _3737 * _3805;
    float _3863 = _3847 * _3851;
    float _3865 = rsqrt(_3853);
    float _3867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3769);
    float _3869 = -_3849;
    float _3871 = fma(_3779, _3785, _3869);
    float _3873 = _3763 * _3765;
    float _3875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3773);
    float _3877 = -_3785;
    float _3879 = fma(_3779, _3849, _3877);
    float _3881 = _3867 * _3775;
    float _3883 = _3855 * _3863;
    float _3885 = _3875 * _3873;
    float _3887 = -_3863;
    float _3889 = _3779 * _3887;
    float _3891 = _3859 * _3863;
    float _3893 = fma(_3831, _3881, _3883);
    float _3895 = fma(_3857, _3881, _3889);
    float _3897 = fma(_3871, _3881, _3891);
    float _3899 = fma(_3879, _3885, _3893);
    float _3901 = _3825 * _3865;
    float _3903 = _3819 * _3865;
    float _3905 = _3841 * _3865;
    float _3907 = fma(_3861, _3885, _3895);
    float _3909 = _3801 * _3901;
    float _3911 = _3799 * _3903;
    float _3913 = fma(_3835, _3885, _3897);
    float _3915 = -_3909;
    float _3917 = fma(_3797, _3903, _3915);
    float _3919 = -_3911;
    float _3921 = fma(_3801, _3905, _3919);
    float _3923 = _3917 * _3899;
    float _3925 = _3921 * _3899;
    float _3927 = fma(_3905, _3907, _3923);
    float _3929 = fma(_3901, _3907, _3925);
    float _3931 = fma(_3799, _3913, _3927);
    float _3933 = fma(_3797, _3913, _3929);
    float _3935 = _2001 + _3931;
    float _3937 = _2225 + _3933;
    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3941 = _3935 + _3939;
    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3945 = _3937 + _3943;
    float _3947 = _3941 * _3941;
    float _3949 = fma(_3945, _3945, _3947);
    float _3951 = _3797 * _3905;
    float _3953 = sqrt(_3949);
    float _3955 = -_3951;
    float _3957 = fma(_3799, _3901, _3955);
    float _3959 = _3957 * _3899;
    float _3961 = fma(_3903, _3907, _3959);
    float _3963 = fma(_3801, _3913, _3961);
    bool _3965 = _3953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3967 = _1843 + _3963;
    float _3969 = _3899;
    float _3971 = _3913;
    float _3973 = _3937;
    float _3975 = _3953;
    if (!_3965)
    {
        _3969 = _3937;
    }
    float _3977 = _3969;
    float _3979 = _3977;
    if (!_3965)
    {
        _3971 = _3935;
    }
    float _3981 = _3971;
    float _3983 = _3981;
    if (!_3965)
    {
        _3973 = _3967;
    }
    float _3985 = _3973;
    bool _3987 = !_3965;
    float _3989 = _3985;
    if (!_3987)
    {
        float _3991 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3995 = _3953 + _3993;
        float _3997 = rsqrt(_3949);
        float _3999 = _3995 * _3991;
        float _4001 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4003 = _3999 * 0.15915493667125701904296875;
        float _4005 = _4003 * 6.283185482025146484375;
        float _4007 = sin(_4005);
        float _4009 = _4003 * 6.283185482025146484375;
        float _4011 = cos(_4009);
        float _4013 = fma(_4007, _4001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4015 = _3997 * _4013;
        float _4017 = _4011 + (-1.0);
        float _4019 = fma(_3945, _4015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4021 = fma(_3941, _4015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4023 = _4017 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4025 = fma(_3967, _4011, _4023);
        _3979 = _4019;
        _3989 = _4025;
        _3983 = _4021;
        _3975 = _4003;
    }
    float _4027 = _3979;
    float _4029 = _3989;
    float _4031 = _3983;
    float _4033 = _3975;
    float _4035 = -_3587;
    float _4037 = _4035 + _4027;
    float _4039 = -_3589;
    float _4041 = _4039 + _4029;
    float _4043 = -_3599;
    float _4045 = _4043 + _4031;
    float _4047 = _4041;
    float _4049 = _4037;
    float _4051 = _4045;
    float _4053 = _4033;
    float _4055 = _4027;
    if (!_3795)
    {
        float _4057 = _3611 * _3611;
        float _4059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4061 = -_2001;
        float _4063 = _4061 + _4031;
        float _4065 = fma(_3619, _3619, _4057);
        float _4067 = fma(_3635, _3635, _4065);
        float _4069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4071 = sqrt(_4067);
        float _4073 = 1.0 / _3763;
        float _4075 = _4069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4077 = precise::min(_4071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4079 = _4077 * _4059;
        float _4081 = _4079 * _4073;
        float _4083 = -_2225;
        float _4085 = _4083 + _4027;
        float _4087 = -_1843;
        float _4089 = _4087 + _4029;
        float _4091 = _4075 * _4081;
        float _4093 = _4063 * _4081;
        float _4095 = fma(_4085, _4091, _3603);
        float _4097 = fma(_4089, _4091, _3597);
        float _4099 = fma(_4075, _4093, _3615);
        _4047 = _4097;
        _4049 = _4095;
        _4051 = _4099;
        _4053 = _4091;
    }
    float _4101 = _4047;
    float _4103 = _4049;
    float _4105 = _4051;
    float _4107 = _4053;
    float _4109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4111 = _4101 + _4109;
    float _4113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4115 = _4103 + _4113;
    float _4117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4119 = _4105 + _4117;
    float _4121 = _4111 * _4111;
    float _4123 = fma(_4115, _4115, _4121);
    float _4125 = fma(_4119, _4119, _4123);
    float _4127 = rsqrt(_4125);
    float _4129 = sqrt(_4125);
    float _4131 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4133 = _4115 * _4131;
    float _4135 = _4119 * _4131;
    float _4137 = _4133 * _4133;
    float _4139 = _4135 * _4135;
    float _4141 = _4137 + _4139;
    float _4143 = sqrt(_4141);
    bool _4145 = _4143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4149 = _4143 + _4147;
    float _4151 = _4119;
    float _4153 = _4123;
    float _4155 = _4149;
    float _4157 = _4111;
    if (_4145)
    {
        float _4159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4151 = _4159;
    }
    float _4161 = _4151;
    if (_4145)
    {
        float _4163 = rsqrt(_4141);
        _4153 = _4163;
    }
    float _4165 = _4153;
    float _4167 = _4165;
    if (_4145)
    {
        float _4169 = _4149 * _4161;
        _4155 = _4169;
    }
    float _4171 = _4155;
    if (_4145)
    {
        float _4173 = _4171 * 0.15915493667125701904296875;
        _4055 = _4173;
    }
    float _4175 = _4055;
    float _4177 = _4107;
    if (_4145)
    {
        float _4179 = _4175 * 6.283185482025146484375;
        float _4181 = sin(_4179);
        _4177 = _4181;
    }
    float _4183 = _4177;
    float _4185 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4187 = precise::max(0.0, _4185);
    float _4189 = _4127;
    float _4191 = _4187;
    float _4193 = _4185;
    if (_4145)
    {
        float _4195 = _4175 * 6.283185482025146484375;
        float _4197 = cos(_4195);
        _4189 = _4197;
    }
    float _4199 = _4189;
    float _4201 = -_4131;
    float _4203 = -_4187;
    float _4205 = fma(_4111, _4201, _4203);
    float _4207 = _4205;
    if (!_4145)
    {
        _4157 = _4133;
    }
    float _4209 = _4157;
    float _4211 = _4209;
    if (!_4145)
    {
        _4191 = _4135;
    }
    float _4213 = _4191;
    float _4215 = _4213;
    if (_4145)
    {
        float _4217 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4193 = _4217;
    }
    float _4219 = _4193;
    float _4221 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4223 = _4183;
    float _4225 = _4219;
    if (_4145)
    {
        float _4227 = fma(_4183, _4219, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4223 = _4227;
    }
    float _4229 = _4223;
    float _4231 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4221);
    float _4233 = _4229;
    float _4235 = _4199;
    if (_4145)
    {
        float _4237 = _4199 + (-1.0);
        _4225 = _4237;
    }
    float _4239 = _4225;
    float _4241 = _4239;
    if (_4145)
    {
        float _4243 = _4165 * _4229;
        _4233 = _4243;
    }
    float _4245 = _4233;
    float _4247 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4231);
    if (_4145)
    {
        float _4249 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4167 = _4249;
    }
    float _4251 = _4167;
    if (_4145)
    {
        float _4253 = _4133 * _4245;
        _4211 = _4253;
    }
    float _4255 = _4211;
    if (!_4145)
    {
        _4241 = _4137;
    }
    float _4257 = _4241;
    float _4259 = _4257;
    if (_4145)
    {
        float _4261 = _4135 * _4245;
        _4215 = _4261;
    }
    float _4263 = _4215;
    if (_4145)
    {
        float _4265 = fma(_4205, _4199, _4251);
        _4207 = _4265;
    }
    float _4267 = _4207;
    if (_4145)
    {
        float _4269 = _4255 * _4255;
        _4259 = _4269;
    }
    float _4271 = _4259;
    float _4273 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4145)
    {
        _4235 = _4139;
    }
    float _4275 = _4235;
    float _4277 = _4275;
    if (_4145)
    {
        float _4279 = _4263 * _4263;
        _4277 = _4279;
    }
    float _4281 = _4277;
    float _4283 = fma(_4267, _4267, _4271);
    float _4285 = fma(_3603, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4287 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4273);
    float _4289 = _4283 + _4281;
    float _4291 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4293 = _4247 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4297 = fma(_4129, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4295);
    float _4299 = precise::clamp(_4297, 0.0, 1.0);
    float _4301 = rsqrt(_4289);
    float _4303 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4291);
    float _4305 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4287);
    float _4307 = -_4299;
    float _4309 = _4307 + 1.0;
    float _4311 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4313 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4303);
    float _4315 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4317 = _4305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4319 = floor(_4285);
    float _4321 = _4313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4323 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4315);
    float _4325 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4327 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4311);
    float _4329 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4323);
    float _4331 = _4301 * _4267;
    float _4333 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4327);
    float _4335 = _4301 * _4255;
    float _4337 = abs(_4309);
    float _4339 = log2(_4337);
    float _4341 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4343 = _4301 * _4263;
    float _4345 = _4335 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4347 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4333);
    float _4349 = -_4319;
    float _4351 = _4285 + _4349;
    float _4353 = -_4345;
    float _4355 = fma(_4331, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4353);
    float _4357 = floor(_4325);
    float _4359 = -_4343;
    float _4361 = fma(_4359, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4355);
    float _4363 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4365 = fma(_4361, 0.5, 0.5);
    float _4367 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4371 = fma(_4361, -0.5, 0.5);
    float _4373 = 1.0 / _4347;
    float _4375 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4377 = -_4363;
    float _4379 = fma(_4377, _4369, 1.0);
    float _4381 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4383 = fma(_4365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4385 = -_4357;
    float _4387 = _4325 + _4385;
    float _4389 = _4331 + 1.0;
    float _4391 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4381);
    float _4393 = exp2(_4367);
    float _4395 = fma(_4365, _4383, -0.212114393711090087890625);
    float _4397 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4375);
    float _4399 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4391);
    float _4401 = log2(_4379);
    float _4403 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4397);
    float _4405 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4399);
    float _4407 = sqrt(_4371);
    float _4409 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4403);
    float _4411 = -_4331;
    float _4413 = fma(_4393, _4389, _4411);
    float _4415 = _4405 * _4373;
    float2 _11466 = float2(_4351, _4387);
    float _4417 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11466, float2(0.0), isnan(_11466)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11466, float2(0.0), isnan(_11466)), level(0.0)).x;
    float _4419 = _4409 * _4373;
    float _4421 = fma(_4365, _4395, 1.570728778839111328125);
    float _4423 = fma(_4415, 0.5, 0.5);
    float _4425 = _4401 * 0.693147182464599609375;
    float _4427 = fma(_4413, 0.5, 0.5);
    float _4429 = fma(_4419, -0.5, 0.5);
    float _4431 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4433 = _4407 * 0.636619746685028076171875;
    float3 _11500 = float3(_4423, _4429, _4431);
    float _4435 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11500, float3(0.0), isnan(_11500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11500, float3(0.0), isnan(_11500)), level(0.0)).x;
    float3 _11511 = float3(_4423, _4429, _4431);
    float4 _4438 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11511, float3(0.0), isnan(_11511)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11511, float3(0.0), isnan(_11511)), level(0.0)).xyzw;
    float _4440 = _4438.x;
    float _4442 = _4438.y;
    float _4444 = _4438.z;
    float _4446 = _4438.w;
    float _4448 = -_4421;
    float _4450 = fma(_4433, _4448, 1.0);
    float2 _11532 = float2(_4450, _4427);
    float3 _4454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11532, float2(0.0), isnan(_11532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11532, float2(0.0), isnan(_11532)), level(0.0)).xyz;
    float _4456 = _4454.x;
    float _4458 = _4454.y;
    float _4460 = _4454.z;
    float _4462 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4464 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4466 = _3771 != 0.0;
    bool _4468 = isnan(_3771);
    bool _4470 = _4466 || _4468;
    bool _4472 = isnan(0.0);
    bool _4474 = _4470 || _4472;
    float _4476 = _3855 * _3957;
    float _4478 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4462);
    float _4480 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4464);
    float _4482 = in.m_73.x;
    float _4484 = in.m_73.y;
    float _4486 = in.m_73.z;
    bool _4488 = _3769 == 0.0;
    bool _4490 = !_4474;
    bool _4492 = _4488 && _4490;
    float _4494 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4478);
    float _4496 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4480);
    float _4498 = _3855 * _3917;
    float _4500 = _4494 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4502 = _4496 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4504 = _3773 == 0.0;
    bool _4506 = _4504 && _4492;
    float _4508 = -_3779;
    float _4510 = fma(_4508, _3903, _4476);
    float _4512 = 1.0 / _4500;
    float _4514 = _4502 + _4500;
    float _4516 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4518 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _4103;
    out.m_75.y = _4101;
    out.m_75.z = _4105;
    float _4520 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4518);
    float _4522 = in.m_77.x;
    float _4524 = in.m_77.y;
    float _4526 = in.m_77.z;
    float _4528 = in.m_77.w;
    float _4530 = exp2(_4516);
    float _4532 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4520);
    float _4534 = _4482;
    if (_4506)
    {
        _3591 = _4482;
    }
    float _4536 = _3591;
    float _4538 = _4514 * _4512;
    float _4540 = _4538 * 0.5;
    float _4542 = _4536;
    if (_4506)
    {
        _3593 = _4484;
    }
    float _4544 = _3593;
    float _4546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4548 = fma(_4540, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4546);
    float _4550 = 1.0 / _4548;
    float _4552 = -_4530;
    float _4554 = _4552 + 1.0;
    float _4556 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4560 = _4550 * _4558;
    float _4562 = _4550;
    float _4564 = _4544;
    if (_4506)
    {
        _4562 = _4536;
    }
    float _4566 = _4562;
    float _4568 = _4566;
    if (!_4506)
    {
        _4542 = _4482;
    }
    float _4570 = _4542;
    float _4572 = abs(_4560);
    float _4574 = log2(_4572);
    if (_4506)
    {
        _4534 = _4486;
    }
    float _4576 = _4534;
    float _4578 = _4576;
    if (!_4506)
    {
        float _4580 = fma(_3773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4486);
        _4578 = _4580;
    }
    float _4582 = _4578;
    if (!_4506)
    {
        float _4584 = fma(_3769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4570);
        _4568 = _4584;
    }
    float _4586 = _4568;
    bool _4588 = _4560 <= 8000.0;
    bool _4590 = isnan(_4560);
    bool _4592 = _4588 || _4590;
    bool _4594 = isnan(8000.0);
    bool _4596 = _4592 || _4594;
    float _4598 = float(_4596);
    float _4600 = _4574 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4602 = _4574;
    if (_4506)
    {
        _4602 = _4544;
    }
    float _4604 = _4602;
    float _4606 = _4604;
    if (!_4506)
    {
        _4564 = _4484;
    }
    float _4608 = _4564;
    float _4610 = _4526 * _4570;
    float _4612 = exp2(_4600);
    if (!_4506)
    {
        float _4614 = fma(_3771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4608);
        _4606 = _4614;
    }
    float _4616 = _4606;
    float _4618 = _4524 * _4486;
    float _4620 = _4522 * _4608;
    float _4622 = -_4610;
    float _4624 = fma(_4522, _4486, _4622);
    float _4626 = _3831 * _3921;
    bool _4628 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4630 = isnan(_4129);
    bool _4632 = _4628 || _4630;
    bool _4634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4636 = _4632 || _4634;
    float _4638 = fma(_4612, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4640 = precise::clamp(_4638, 0.0, 1.0);
    float _4642 = -_4618;
    float _4644 = fma(_4526, _4608, _4642);
    float _4646 = -_4620;
    float _4648 = fma(_4524, _4570, _4646);
    float _4650 = _4624 * _4528;
    float _4652 = fma(_4640, -2.0, 3.0);
    float _4654 = _4640 * _4640;
    float _4656 = _4644 * _4528;
    float _4658 = _4648 * _4528;
    float _4660 = _3831 * _3957;
    float _4662 = _4654 * _4652;
    float _4664 = _3855 * _3921;
    float _4666 = _3831 * _3917;
    float _4668 = _3879 * _3921;
    float _4670 = fma(_3857, _3901, _4626);
    float _4672 = -_3779;
    float _4674 = fma(_4672, _3901, _4664);
    float _4676 = fma(_3857, _3903, _4660);
    float _4678 = fma(_3857, _3905, _4666);
    float _4680 = -_3779;
    float _4682 = fma(_4680, _3905, _4498);
    float _4684 = _3879 * _3917;
    float _4686 = -_4662;
    float _4688 = _4686 + 1.0;
    float _4690 = fma(_3861, _3901, _4668);
    float _4692 = fma(_3859, _3797, _4674);
    float _4694 = fma(_3859, _3801, _4510);
    float _4696 = _3879 * _3957;
    float _4698 = fma(_3859, _3799, _4682);
    float _4700 = fma(_4688, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4662);
    float _4702 = fma(_3871, _3801, _4676);
    float _4704 = fma(_3871, _3797, _4670);
    float _4706 = fma(_3871, _3799, _4678);
    float _4708 = fma(_3861, _3903, _4696);
    float _4710 = fma(_3835, _3797, _4690);
    float _4712 = _4692 * _4524;
    float _4714 = _4694 * _4524;
    float _4716 = _4698 * _4524;
    float _4718 = fma(_3861, _3905, _4684);
    float _4720 = _4692 * _4616;
    float _4722 = _4650 * _4692;
    float _4724 = _4694 * _4616;
    float _4726 = _4698 * _4616;
    float _4728 = _4650 * _4694;
    float _4730 = _4650 * _4698;
    float _4732 = fma(_3835, _3801, _4708);
    float _4734 = fma(_3835, _3799, _4718);
    float _4736 = fma(_4656, _4704, _4722);
    float _4738 = fma(_4704, _4522, _4712);
    float _4740 = fma(_4702, _4522, _4714);
    float _4742 = fma(_4704, _4586, _4720);
    float _4744 = fma(_4702, _4586, _4724);
    float _4746 = fma(_4656, _4702, _4728);
    float _4748 = fma(_4656, _4706, _4730);
    float _4750 = _4598 * _4700;
    float _4752 = fma(_4706, _4522, _4716);
    float _4754 = fma(_4710, _4526, _4738);
    float _4756 = fma(_4658, _4710, _4736);
    float _4758 = fma(_4658, _4732, _4746);
    float _4760 = fma(_4658, _4734, _4748);
    float _4762 = fma(_4732, _4526, _4740);
    float _4764 = in.m_79.x;
    float _4766 = fma(_4734, _4526, _4752);
    float _4768 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4532);
    float _4770 = fma(_4706, _4586, _4726);
    float _4772 = _4750 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4774 = fma(_4710, _4582, _4742);
    float _4776 = _4768 + _4347;
    float _4778 = fma(_4734, _4582, _4770);
    out.m_81.x = _4756;
    out.m_81.y = _4758;
    out.m_81.z = _4760;
    float _4780 = _4776 * 0.5;
    float _4782 = fma(_4732, _4582, _4744);
    out.m_83.x = _4754;
    out.m_83.y = _4762;
    out.m_83.z = _4766;
    out.m_85.z = _4780;
    out.m_85.w = _4347;
    float _4784 = _4760;
    float _4786 = _4758;
    if (!_4636)
    {
        _4784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4788 = _4784;
    out.gl_Position.x = _4405;
    out.gl_Position.y = _4409;
    out.gl_Position.z = _4768;
    out.gl_Position.w = _4347;
    float _4790 = _4788;
    float _4792 = _4788;
    if (!_4636)
    {
        _4786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4794 = _4786;
    out.m_87.x = _4774;
    out.m_87.y = _4782;
    out.m_87.z = _4778;
    float _4796 = -_4417;
    float _4798 = _4796 + 1.0;
    float _4800 = _4798 * _4772;
    float _4802 = precise::clamp(_4800, 0.0, 1.0);
    float _4804 = -_4802;
    float _4806 = fma(_4804, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4808 = _4806 * _4764;
    float _4810 = _4556 * _4435;
    float _4812 = -_4556;
    float _4814 = _4812 + 1.0;
    float _4816 = _4808 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4818 = _4446 * _4810;
    float _4820 = _4446 * _4814;
    out.m_89.x = _4816;
    float _4822 = _4460 * _4810;
    float _4824 = fma(_4456, _4818, _4440);
    float _4826 = fma(_4458, _4818, _4442);
    float _4828 = _4818;
    float _4830 = _4794;
    float _4832 = _4794;
    if (!_4636)
    {
        _4828 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4834 = _4828;
    float _4836 = fma(_4446, _4822, _4444);
    out.m_91.x = _4824;
    out.m_91.y = _4826;
    out.m_91.z = _4836;
    out.m_91.w = _4820;
    bool _4838 = !_4636;
    float _4840 = _4834;
    float _4842 = _4834;
    if (!_4838)
    {
        bool _4844 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4846 = isnan(_4129);
        bool _4848 = _4844 || _4846;
        bool _4850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4852 = _4848 || _4850;
        if (!_4852)
        {
            float _4854 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4856 = _4129 + _4854;
            float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4860 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4858;
            float _4862 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4864 = _4862 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4870 = 1.0 / _4860;
            float _4872 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4874 = _4872 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4876 = _4856 * _4870;
            float _4878 = precise::clamp(_4876, 0.0, 1.0);
            float _4880 = fma(_4878, _4864, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4882 = fma(_4878, _4868, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4884 = fma(_4878, _4874, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4832 = _4882;
            _4792 = _4880;
            _4842 = _4884;
            _4886 = true;
        }
        else
        {
            bool _4888 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4890 = isnan(_4129);
            bool _4892 = _4888 || _4890;
            bool _4894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4896 = _4892 || _4894;
            if (!_4896)
            {
                _4790 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4898 = _4790;
            _4792 = _4898;
            if (!_4896)
            {
                _4830 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4900 = _4830;
            _4832 = _4900;
            if (!_4896)
            {
                _4840 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4902 = _4840;
            bool _4904 = !_4896;
            _4842 = _4902;
            if (!_4904)
            {
                bool _4906 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4908 = isnan(_4129);
                bool _4910 = _4906 || _4908;
                bool _4912 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4914 = _4910 || _4912;
                if (!_4914)
                {
                    float _4916 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4918 = _4129 + _4916;
                    float _4920 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4922 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4920;
                    float _4924 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4926 = _4924 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4928 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4930 = _4928 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4932 = 1.0 / _4922;
                    float _4934 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4936 = _4934 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4938 = _4918 * _4932;
                    float _4940 = precise::clamp(_4938, 0.0, 1.0);
                    float _4942 = fma(_4940, _4926, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4944 = fma(_4940, _4930, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4946 = fma(_4940, _4936, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4832 = _4944;
                    _4792 = _4942;
                    _4842 = _4946;
                    _4886 = true;
                }
                else
                {
                    _4832 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4792 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4842 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4886 = false;
    float _4948 = _4832;
    float _4950 = _4792;
    float _4952 = _4842;
    float _4954 = _4948 * 0.586610972881317138671875;
    bool _4956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = 1.0;
    float _4958 = fma(_4950, 0.298911988735198974609375, _4954);
    out.m_93.x = 0.0;
    float _4960 = fma(_4952, 0.114477999508380889892578125, _4958);
    float _4962 = -_4960;
    float _4964 = _4962 + _4950;
    float _4966 = -_4960;
    float _4968 = _4966 + _4948;
    float _4970 = -_4960;
    float _4972 = _4970 + _4952;
    float _4974 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4976 = fma(_4964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    float _4978 = fma(_4968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    float _4980 = fma(_4972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    out.m_89.w = _4974;
    out.m_95.x = _4976;
    out.m_95.y = _4978;
    out.m_95.z = _4980;
    if (!_4956)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4982 = -_4101;
    float _4984 = _4982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4986 = -_4103;
    float _4988 = _4986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4990 = -_4105;
    float _4992 = _4990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4994 = _4984 * _4984;
    float _4996 = fma(_4988, _4988, _4994);
    float _4998 = fma(_4992, _4992, _4996);
    float _5000 = sqrt(_4998);
    float _5002 = rsqrt(_4998);
    float _5004 = -_5000;
    float _5006 = _5004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5008 = _5006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5010 = precise::clamp(_5008, 0.0, 1.0);
    float _5012 = _4988 * _5002;
    float _5014 = _4984 * _5002;
    float _5016 = abs(_5010);
    float _5018 = log2(_5016);
    float _5020 = _4992 * _5002;
    float _5022 = _5012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5024 = _4782 * _5014;
    float _5026 = -_5014;
    float _5028 = -_5022;
    float _5030 = fma(_5026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5028);
    float _5032 = fma(_4774, _5012, _5024);
    float _5034 = -_5020;
    float _5036 = fma(_5034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5030);
    float _5038 = fma(_4778, _5020, _5032);
    float _5040 = precise::clamp(_5038, 0.0, 1.0);
    float _5042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5044 = _5036 + _5042;
    float _5046 = _5018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5048 = _5044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5050 = precise::clamp(_5048, 0.0, 1.0);
    float _5052 = exp2(_5046);
    float _5054 = _5052 * _5050;
    float _5056 = _5040 * _5054;
    float _5058 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5060 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5062 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _5058;
    out.m_93.y = _5060;
    out.m_93.z = _5062;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4886 = false;
    bool _672 = false;
    bool _530 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _5119 = as_type<float>(_130);
        out.gl_Position.z = _5119;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5189 = as_type<float>(_168);
        out.gl_Position.z = _5189;
    }
    if (_160)
    {
        return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = 1.0 / _236;
    float _244 = 1.0 / _232;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    float _266 = _208 * _242;
    bool _268 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_200);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_200);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -_258;
    float _302 = _300 + 1.0;
    float _304 = -_278;
    float _306 = _304 + 1.0;
    float _308 = _228 * _244;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _314;
    float _318 = _294 * _306;
    float _320 = fma(_282, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_316, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = _278 * _302;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _322 * _318;
    float _334 = _324 * _318;
    float _336 = _320 * _318;
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_298, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_344, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_330, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_356, _326, _346);
    float _372 = fma(_354, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = fma(_358, _326, _348);
    float _380 = fma(_360, _326, _350);
    float _382 = fma(_372, _264, _370);
    float _384 = fma(_374, _264, _378);
    float _386 = fma(_376, _264, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_114);
        float _418 = 1.0 / _416;
        float _420 = _148 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_55.x;
    float _426 = in.m_55.y;
    float _428 = in.m_55.z;
    bool _430 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _432 = isnan(_422);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _448 = isnan(_422);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _422 + _462;
    float _466 = -_440;
    float _468 = _466 + 1.0;
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _472 = 1.0 / _444;
    float _474 = _456 * _468;
    float _476 = -_456;
    float _478 = _476 + 1.0;
    float _480 = _390 * _426;
    float _482 = _392 * _428;
    float _484 = _460 * _472;
    float _486 = _388 * _424;
    float _488 = fma(_484, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _490 = _488 * _474;
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[116].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _502;
    out.m_57.y = _504;
    out.m_57.z = _506;
    out.m_57.w = _508;
    bool _510 = !_470;
    float _528;
    if (!_510)
    {
        float _512 = in.m_53.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_114);
        float _534 = 1.0 / _532;
        float _536 = _148 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _542 = _538 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _550 = isnan(_538);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _564 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _566 = isnan(_538);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _576;
    bool _580 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _582 = isnan(_538);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _574 * _596;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = 1.0 / _562;
    float _608 = _578 * _592;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _614 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _616 = _612 * _606;
    float _618 = _614 * _600;
    float _620 = -_590;
    float _622 = _620 + 1.0;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _626 = _538 + _624;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[131].x, _618);
    float _630 = _558 * _622;
    float _632 = fma(_616, _626, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _636 = fma(_632, _630, _628);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[133].x, _636);
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _644;
    out.m_59.y = _646;
    out.m_59.z = _648;
    out.m_59.w = _650;
    bool _652 = !_598;
    float _670;
    if (!_652)
    {
        float _654 = in.m_53.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_114);
        float _676 = 1.0 / _674;
        float _678 = _148 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _684 = int(_682);
    float _686 = in.m_53.x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _690 = _680 + _688;
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _696 = _694 != 0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _700 = _680 + _698;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _704 = int(_702);
    float _706 = in.m_53.z;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _714 = _712 != 0;
    float _716 = in.m_61.x;
    float _718 = float(_114);
    float _720 = float(_684);
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _724 = int(_722);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _730 = float(_704);
    float _732 = 1.0 / _720;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _744 = int(_742);
    float _746 = float(uint(_724));
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _752 = ~_724;
    int _754 = _752 + 1;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _756;
    bool _760 = _706 > 0.5;
    float _762 = 0.0;
    float _764 = _730;
    bool _766 = _696;
    float _768 = _716;
    if (!_710)
    {
        _762 = _716;
    }
    float _770 = _762;
    float _772 = 1.0 / _730;
    float _774 = _732 * _148;
    int _776 = _724 + (-1);
    bool _778 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _780 = isnan(_680);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _792 = int(_790);
    float _794 = float(_744);
    float _796 = _770;
    if (_696)
    {
        _764 = 1.0;
    }
    float _798 = _764;
    float _800 = _798;
    if (!_696)
    {
        _800 = 7.345489978790283203125;
    }
    float _802 = _800;
    float _804 = 1.0 / _746;
    float _806 = _772 * _148;
    float _808 = _802 * _686;
    float _810 = trunc(_774);
    int _812 = int(_810);
    float _814 = float(uint(_792));
    int _816 = ~_792;
    int _818 = _816 + 1;
    int _820 = ~_792;
    int _822 = _820 + 1;
    float _824 = float(_792);
    float _826 = 1.0 / _794;
    int _828 = as_type<int>(_804) + (-2);
    float _830 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _832 = int(_830);
    float _834 = float(uint(_812));
    float _836 = as_type<float>(_828) * _834;
    float _838 = 1.0 / _814;
    float _840 = trunc(_806);
    int _842 = int(_840);
    float _844 = _826 * _148;
    float _846 = float(uint(_832));
    int _848 = ~_724;
    int _850 = _848 + 1;
    int _852 = ~_832;
    int _854 = _852 + 1;
    float _856 = 1.0 / _846;
    int _858 = as_type<int>(_838) + (-2);
    int _860 = ~_832;
    int _862 = _860 + 1;
    float _864 = float(_832);
    float _866 = trunc(_844);
    int _868 = int(_866);
    float _870 = float(uint(_842));
    float _872 = in.m_53.w;
    float _874 = float(_842);
    float _876 = as_type<float>(_858) * _870;
    float _878 = trunc(_836);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    int _885 = as_type<int>(_856) + (-2);
    float _887 = float(uint(_868));
    float _889 = trunc(_876);
    float _891 = precise::max(_889, 0.0);
    uint _893 = uint(_891);
    float _895 = as_type<float>(_885) * _887;
    float _897 = _887;
    int _899 = _885;
    if (_696)
    {
        _897 = _686;
    }
    float _901 = _897;
    int _903 = _850 * int(_883);
    int _905 = _903 + _812;
    float _907 = trunc(_895);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    float _913 = _901;
    float _915 = as_type<float>(_905);
    if (!_696)
    {
        _913 = _692;
    }
    float _917 = _913;
    float _919 = float(uint(_905));
    float _921 = _917;
    if (_696)
    {
        _915 = 1.0;
    }
    float _923 = _915;
    float _925 = floor(_808);
    float _927 = as_type<float>(_828) * _919;
    float _929 = _923;
    if (!_696)
    {
        _929 = 1.2345600128173828125;
    }
    float _931 = _929;
    int _933 = _818 * int(_893);
    int _935 = _933 + _842;
    float _937 = trunc(_927);
    float _939 = precise::max(_937, 0.0);
    uint _941 = uint(_939);
    int _943 = _854 * int(_911);
    int _945 = _943 + _868;
    float _947 = _917 * _931;
    float _949 = as_type<float>(_935);
    if (_696)
    {
        _921 = _686;
    }
    float _951 = _921;
    float _953 = float(uint(_935));
    float _955 = _951;
    if (_696)
    {
        _949 = 1.0;
    }
    float _957 = _949;
    float _959 = floor(_947);
    float _961 = float(uint(_945));
    float _963 = as_type<float>(_858) * _953;
    float _965 = _957;
    int _967 = as_type<int>(_963);
    float _969 = _961;
    if (!_696)
    {
        _955 = _706;
    }
    float _971 = _955;
    float _973 = in.m_61.y;
    int _975 = as_type<int>(_971);
    if (!_696)
    {
        _965 = 5.839270114898681640625;
    }
    float _977 = _965;
    float _979 = as_type<float>(_885) * _961;
    if (_710)
    {
        bool _981 = _686 > 0.5;
        _766 = _981;
    }
    bool _983 = _766;
    float _985 = trunc(_963);
    float _987 = precise::max(_985, 0.0);
    uint _989 = uint(_987);
    int _991 = int(_883) + int(_941);
    float _993 = _971 * _977;
    if (_710)
    {
        float _995 = -_716;
        float _997 = _995 + 1.0;
        _975 = as_type<int>(_997);
    }
    int _999 = _975;
    float _1001 = -_925;
    float _1003 = _808 + _1001;
    int _1005 = _754 * _991;
    int _1007 = _1005 + _812;
    float _1009 = float(_724);
    float _1011 = trunc(_979);
    float _1013 = precise::max(_1011, 0.0);
    uint _1015 = uint(_1013);
    if (_710)
    {
        float _1017 = _983 ? as_type<float>(_999) : _716;
        _796 = _1017;
    }
    float _1019 = _796;
    if (_714)
    {
        float _1021 = -_716;
        float _1023 = _1021 + 1.0;
        _967 = as_type<int>(_1023);
    }
    int _1025 = _967;
    if (!_714)
    {
        _969 = _716;
    }
    float _1027 = _969;
    float _1029 = -_959;
    float _1031 = _947 + _1029;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1043 = _1041 != 0;
    bool _1045 = uint(_1007) >= uint(_724);
    float _1047 = floor(_993);
    float _1049 = float(_812);
    float _1051 = _1027;
    if (_714)
    {
        float _1053 = _760 ? as_type<float>(_1025) : _716;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = -_973;
    float _1059 = _1057 + 1.0;
    bool _1061 = !_1043;
    int _1063 = _1061 ? 0 : 1;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1067 = _1065 != 0;
    float _1069 = 1.0 / _718;
    bool _1071 = _1049 >= _1009;
    bool _1073 = isnan(_1049);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_1009);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1085 = _1083 != 0;
    bool _1087 = _692 > 0.5;
    int _1089 = int(_893) + int(_989);
    float _1091 = trunc(_1081);
    int _1093 = int(_1091);
    int _1095 = int(_911) + int(_1015);
    float _1097 = -_1047;
    float _1099 = _993 + _1097;
    bool _1101 = !_1067;
    int _1103 = _1101 ? 0 : 1;
    int _1105 = _822 * _1089;
    int _1107 = _1105 + _842;
    bool _1109 = !_1085;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _862 * _1095;
    int _1115 = _1113 + _868;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1119 = _1117 != 0;
    float _1121 = 1.0 / _728;
    int _1123 = _1087 ? as_type<int>(_1059) : as_type<int>(_973);
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1127 = _1125 != 0;
    bool _1129 = !_1045;
    int _1131 = _1129 ? 0 : (-1);
    float _1133 = _1119 ? as_type<float>(_1123) : _973;
    float _1135 = 1.0 / _736;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1143 = _1141 != 0;
    int _1145 = ~_991;
    int _1147 = _1145 + _1131;
    int _1149 = _1147 + 1;
    bool _1151 = !_1127;
    int _1153 = _1151 ? 0 : 1;
    bool _1155 = uint(_1107) >= uint(_792);
    int _1157 = _724 * _1149;
    int _1159 = _1157 + _812;
    bool _1161 = !_1143;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = 1.0 / _740;
    bool _1167 = _724 == 0;
    bool _1169 = _874 >= _824;
    bool _1171 = isnan(_874);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(_824);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = _1003 * _1009;
    bool _1183 = !_1155;
    int _1185 = _1183 ? 0 : (-1);
    float _1187 = _1009 * _148;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1195 = _1193 != 0;
    float _1197 = 1.0 / _750;
    int _1199 = ~_1093;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    bool _1205 = !_1167;
    int _1207 = _1205 ? _1159 : (-1);
    bool _1209 = !_1139;
    int _1211 = _1209 ? 0 : 1;
    bool _1213 = !_1191;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = trunc(_1179);
    int _1219 = int(_1217);
    int _1221 = _1207 * _1203;
    bool _1223 = uint(_1115) >= uint(_832);
    float _1225 = _824 * _1031;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1229 = _1227 != 0;
    float _1231 = _1187 * _1069;
    float _1233 = _1069 * _148;
    bool _1235 = !_1039;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = trunc(_1181);
    int _1241 = int(_1239);
    bool _1243 = !_1035;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _824 * _1233;
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1251 = _1249 != 0;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1255 = _1253 != 0;
    int _1257 = _1093 * _776;
    int _1259 = _1257 + _1221;
    int _1261 = ~_1089;
    int _1263 = _1261 + _1185;
    int _1265 = _1263 + 1;
    float _1267 = _864 * _1233;
    float _1269 = float(_868);
    float _1271 = trunc(_1225);
    int _1273 = int(_1271);
    int _1275 = abs(_1237);
    int _1277 = _792 * _1265;
    int _1279 = _1277 + _842;
    bool _1281 = !_1255;
    int _1283 = _1281 ? 0 : 1;
    float _1285 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1287 = _792 == 0;
    bool _1289 = _1269 >= _864;
    bool _1291 = isnan(_1269);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan(_864);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = trunc(_1231);
    int _1303 = int(_1301);
    float _1305 = _864 * _1099;
    int _1307 = abs(_1111);
    int _1309 = abs(_1153);
    int _1311 = abs(_1245);
    int _1313 = _1241 * _1307;
    int _1315 = _1313 + _812;
    float _1317 = trunc(_1247);
    int _1319 = int(_1317);
    int _1321 = ~_1219;
    int _1323 = _1321 + 1;
    int _1325 = _1323 + 1;
    int _1327 = _1273 * _1309;
    int _1329 = _1327 + _842;
    bool _1331 = !_1287;
    int _1333 = _1331 ? _1279 : (-1);
    int _1335 = _1259 * _1275;
    int _1337 = abs(_1163);
    int _1339 = _1325 * _1333;
    int _1341 = abs(_1063);
    int _1343 = _1303 * _1311;
    int _1345 = _1343 + _1335;
    int _1347 = _792 + (-1);
    float _1349 = trunc(_1299);
    int _1351 = int(_1349);
    int _1353 = abs(_1103);
    int _1355 = _1219 * _1347;
    int _1357 = _1355 + _1339;
    int _1359 = abs(_1211);
    int _1361 = _1315 * _1341;
    int _1363 = _1361 + _1345;
    float _1365 = trunc(_1267);
    int _1367 = int(_1365);
    int _1369 = _1357 * _1337;
    int _1371 = abs(_1215);
    int _1373 = _1241 * _1353;
    int _1375 = _1373 + _1363;
    bool _1377 = !_1223;
    int _1379 = _1377 ? 0 : (-1);
    int _1381 = _1319 * _1359;
    int _1383 = _1381 + _1369;
    float _1385 = trunc(_1305);
    int _1387 = int(_1385);
    float _1389 = float(uint(_1375));
    bool _1391 = !_1195;
    int _1393 = _1391 ? 0 : 1;
    int _1395 = _1329 * _1371;
    int _1397 = _1395 + _1383;
    int _1399 = ~_1095;
    int _1401 = _1399 + _1379;
    int _1403 = _1401 + 1;
    float _1405 = as_type<float>(_828) * _1389;
    int _1407 = abs(_1393);
    bool _1409 = !_1229;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = trunc(_1405);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    bool _1419 = !_1251;
    int _1421 = _1419 ? 0 : 1;
    int _1423 = _1273 * _1407;
    int _1425 = _1423 + _1397;
    int _1427 = abs(_1411);
    int _1429 = _832 * _1403;
    int _1431 = _1429 + _868;
    bool _1433 = _832 == 0;
    float _1435 = float(uint(_1425));
    int _1437 = _1387 * _1427;
    int _1439 = _1437 + _868;
    int _1441 = ~_724;
    int _1443 = _1441 + 1;
    int _1445 = ~_1351;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = as_type<float>(_858) * _1435;
    bool _1453 = !_1433;
    int _1455 = _1453 ? _1431 : (-1);
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1459 = _1457 != 0;
    int _1461 = _1443 * int(_1417);
    int _1463 = _1461 + _1375;
    int _1465 = _832 + (-1);
    int _1467 = _1449 * _1455;
    int _1469 = abs(_1283);
    float _1471 = trunc(_1451);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = float(uint(_1463));
    int _1479 = _1351 * _1465;
    int _1481 = _1479 + _1467;
    bool _1483 = !_1459;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = abs(_1421);
    float _1489 = as_type<float>(_828) * _1477;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1493 = _1491 != 0;
    int _1495 = ~_792;
    int _1497 = _1495 + 1;
    int _1499 = _1481 * _1469;
    int _1501 = abs(_1485);
    float _1503 = trunc(_1489);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    bool _1509 = !_1493;
    int _1511 = _1509 ? 0 : 1;
    int _1513 = _1367 * _1487;
    int _1515 = _1513 + _1499;
    int _1517 = abs(_1511);
    bool _1519 = _872 > 0.5;
    int _1521 = _1497 * int(_1475);
    int _1523 = _1521 + _1425;
    int _1525 = _1519 ? as_type<int>(_1059) : as_type<int>(_973);
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1529 = _1527 != 0;
    int _1531 = _1439 * _1501;
    int _1533 = _1531 + _1515;
    float _1535 = float(uint(_1523));
    float _1537 = _1529 ? as_type<float>(_1525) : _973;
    int _1539 = _1387 * _1517;
    int _1541 = _1539 + _1533;
    int _1543 = int(_1417) + int(_1507);
    float _1545 = as_type<float>(_858) * _1535;
    int _1547 = ~_724;
    int _1549 = _1547 + 1;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1553 = _1551 != 0;
    float _1555 = trunc(_1545);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    float _1561 = float(uint(_1541));
    int _1563 = _1549 * _1543;
    int _1565 = _1563 + _1375;
    bool _1567 = _706 > 0.5;
    float _1569 = float(uint(_1315));
    float _1571 = as_type<float>(_885) * _1561;
    bool _1573 = uint(_1565) >= uint(_724);
    int _1575 = ~_832;
    int _1577 = _1575 + 1;
    float _1579 = as_type<float>(_828) * _1569;
    bool _1581 = !_1573;
    int _1583 = _1581 ? 0 : (-1);
    float _1585 = trunc(_1571);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    float _1591 = _973;
    int _1593 = as_type<int>(_1059);
    int _1595 = _1311;
    float _1597 = as_type<float>(_1329);
    if (_1553)
    {
        float _1599 = _1567 ? _1059 : _973;
        _1591 = _1599;
    }
    float _1601 = _1591;
    float _1603 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1607 = _1605 != 0;
    int _1609 = ~_1543;
    int _1611 = _1609 + _1583;
    int _1613 = _1611 + 1;
    int _1615 = int(_1475) + int(_1559);
    float _1617 = trunc(_1579);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = ~_792;
    int _1625 = _1623 + 1;
    int _1627 = _724 * _1613;
    int _1629 = _1627 + _1375;
    int _1631 = ~_724;
    int _1633 = _1631 + 1;
    int _1635 = _1625 * _1615;
    int _1637 = _1635 + _1425;
    bool _1639 = !_1167;
    int _1641 = _1639 ? _1629 : (-1);
    if (_1607)
    {
        float _1643 = -_716;
        float _1645 = _1643 + 1.0;
        _1593 = as_type<int>(_1645);
    }
    int _1647 = _1593;
    int _1649 = _1577 * int(_1589);
    int _1651 = _1649 + _1541;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1657 = _1641 & 3;
    bool _1659 = _1657 != 0;
    if (_1607)
    {
        float _1661 = _1087 ? as_type<float>(_1647) : _716;
        _768 = _1661;
    }
    float _1663 = _768;
    int _1665 = _1641 & 3;
    bool _1667 = _1665 != 0;
    int _1669 = _1633 * int(_1621);
    int _1671 = _1669 + _1315;
    int _1673 = _1659 ? 0 : 1;
    float _1675 = 1.0 / _1655;
    bool _1677 = uint(_1637) >= uint(_792);
    float _1679 = float(uint(_1651));
    bool _1681 = uint(_1665) >= 2u;
    bool _1683 = !_1677;
    int _1685 = _1683 ? 0 : (-1);
    float _1687 = as_type<float>(_885) * _1679;
    int _1689 = _1681 ? 0 : 1;
    bool _1691 = _1665 != 3;
    float _1693 = trunc(_1687);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    bool _1699 = uint(_1665) > 1u;
    int _1701 = ~_1615;
    int _1703 = _1701 + _1685;
    int _1705 = _1703 + 1;
    int _1707 = ~_1689;
    int _1709 = _1707 + 1;
    int _1711 = _1709 + 1;
    int _1713 = ~_1673;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    int _1719 = _792 * _1705;
    int _1721 = _1719 + _1425;
    float _1723 = float(uint(_1439));
    int _1725 = _1711;
    int _1727 = _1717;
    float _1729 = as_type<float>(_1665);
    if (_1691)
    {
        int _1731 = ~_1689;
        int _1733 = _1731 + 1;
        _1725 = _1733;
    }
    int _1735 = _1725;
    bool _1737 = !_1287;
    int _1739 = _1737 ? _1721 : (-1);
    float _1741 = as_type<float>(_885) * _1723;
    if (!_1699)
    {
        int _1743 = ~_1673;
        int _1745 = _1743 + 1;
        _1727 = _1745;
    }
    int _1747 = _1727;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1751 = _1749 != 0;
    float _1753 = in.m_46.x;
    float _1755 = in.m_46.y;
    float _1757 = in.m_46.z;
    int _1759 = _1739 & 3;
    bool _1761 = _1759 != 0;
    bool _1763 = !_1751;
    int _1765 = _1763 ? 0 : 1;
    bool _1767 = uint(_1759) >= 2u;
    int _1769 = _1761 ? 0 : 1;
    int _1771 = int(_1589) + int(_1697);
    bool _1773 = _1759 != 3;
    int _1775 = _1767 ? 0 : 1;
    bool _1777 = uint(_1759) > 1u;
    int _1779 = ~_832;
    int _1781 = _1779 + 1;
    int _1783 = ~_1775;
    int _1785 = _1783 + 1;
    int _1787 = _1785 + 1;
    int _1789 = ~_1769;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    int _1795 = _1781 * _1771;
    int _1797 = _1795 + _1541;
    float _1799 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1801 = _1787;
    int _1803 = _1793;
    float _1805 = as_type<float>(_1759);
    if (_1773)
    {
        int _1807 = ~_1775;
        int _1809 = _1807 + 1;
        _1801 = _1809;
    }
    int _1811 = _1801;
    float _1813 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1815 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1799);
    bool _1817 = uint(_1797) >= uint(_832);
    float _1819 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1813);
    if (!_1777)
    {
        int _1821 = ~_1769;
        int _1823 = _1821 + 1;
        _1803 = _1823;
    }
    int _1825 = _1803;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1829 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1819);
    bool _1831 = !_1817;
    int _1833 = _1831 ? 0 : (-1);
    float _1835 = -_1827;
    float _1837 = fma(_1603, 2.0, _1835);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1841 = _1839 != 0;
    float _1843 = _1829 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1847 = _1845 != 0;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1851 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1853 = float(uint(_1329));
    float _1855 = fma(_1285, -2.0, _1849);
    float _1857 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1851);
    float _1859 = float(uint(_1671));
    float _1861 = as_type<float>(_858) * _1853;
    float _1863 = trunc(_1741);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1877 = as_type<float>(_828) * _1859;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1879;
    float _1883 = _1871 * _1675;
    float _1885 = _1875 * _1121;
    float _1887 = trunc(_1861);
    float _1889 = precise::max(_1887, 0.0);
    uint _1891 = uint(_1889);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1893;
    int _1897 = ~_832;
    int _1899 = _1897 + 1;
    float _1901 = _1881 * _1135;
    int _1903 = ~_792;
    int _1905 = _1903 + 1;
    float _1907 = _1895 * _1165;
    int _1909 = ~_724;
    int _1911 = _1909 + 1;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1917 = trunc(_1877);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    int _1923 = _1899 * int(_1867);
    int _1925 = _1923 + _1439;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1929 = _1927 != 0;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1935 = ~_1771;
    int _1937 = _1935 + _1833;
    int _1939 = _1937 + 1;
    float _1941 = _686 + _692;
    float _1943 = float(uint(_1925));
    float _1945 = _1933 * _1197;
    int _1947 = _1905 * int(_1891);
    int _1949 = _1947 + _1329;
    float _1951 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1857);
    float _1953 = _1941 + (-1.0);
    float _1955 = float(uint(_1949));
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_1929)
    {
        _1595 = 0;
    }
    int _1961 = _1595;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1967 = int(_1621) + int(_1921);
    float _1969 = as_type<float>(_858) * _1955;
    float _1971 = as_type<float>(_885) * _1943;
    int _1973 = _832 * _1939;
    int _1975 = _1973 + _1541;
    float _1977 = _686 * 2.0;
    int _1979 = _1961;
    if (_1929)
    {
        _899 = 0;
    }
    int _1981 = _899;
    int _1983 = _1911 * _1967;
    int _1985 = _1983 + _1315;
    bool _1987 = !_1841;
    int _1989 = _1987 ? 0 : 1;
    float _1991 = 1.0 / _1959;
    bool _1993 = !_1433;
    int _1995 = _1993 ? _1975 : (-1);
    float _1997 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1999 = uint(_1985) >= uint(_724);
    float _2001 = _1951 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2003 = _1981;
    if (!_1929)
    {
        _2003 = 1;
    }
    int _2005 = _2003;
    float _2007 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1855);
    if (!_1929)
    {
        _1979 = 2;
    }
    int _2009 = _1979;
    float _2011 = floor(_1977);
    int _2013 = _1995 & 3;
    bool _2015 = _2013 != 0;
    bool _2017 = !_1847;
    int _2019 = _2017 ? 0 : 1;
    bool _2021 = _2013 != 3;
    bool _2023 = !_1999;
    int _2025 = _2023 ? 0 : (-1);
    float _2027 = trunc(_1969);
    float _2029 = precise::max(_2027, 0.0);
    uint _2031 = uint(_2029);
    bool _2033 = uint(_2013) >= 2u;
    float _2035 = _1915 * _1991;
    bool _2037 = !_1667;
    int _2039 = _2037 ? 0 : 1;
    int _2041 = _2033 ? 0 : 1;
    float _2043 = fma(_2035, _690, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2045 = uint(_2013) > 1u;
    float _2047 = trunc(_1971);
    float _2049 = precise::max(_2047, 0.0);
    uint _2051 = uint(_2049);
    int _2053 = ~_2041;
    int _2055 = _2053 + 1;
    int _2057 = _2055 + 1;
    int _2059 = _2057;
    if (_2021)
    {
        int _2061 = ~_2041;
        int _2063 = _2061 + 1;
        _2059 = _2063;
    }
    int _2065 = _2059;
    int _2067 = _2015 ? 0 : 1;
    bool _2069 = _2011 > 0.0;
    float _2071 = 1.0 / _1965;
    bool _2073 = _2011 >= 0.0;
    bool _2075 = isnan(_2011);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan(0.0);
    bool _2081 = _2077 || _2079;
    int _2083 = ~_792;
    int _2085 = _2083 + 1;
    int _2087 = int(_1891) + int(_2031);
    float _2089 = _692 * 2.0;
    float _2091 = _706 * 2.0;
    int _2093 = int(_1867) + int(_2051);
    float _2095 = _692 + _706;
    float _2097 = floor(_2089);
    int _2099 = abs(_2039);
    int _2101 = _2085 * _2087;
    int _2103 = _2101 + _1329;
    float _2105 = _758 * _2071;
    int _2107 = ~_2067;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _2095 + (-1.0);
    int _2115 = _2111;
    if (!_2045)
    {
        int _2117 = ~_2067;
        int _2119 = _2117 + 1;
        _2115 = _2119;
    }
    int _2121 = _2115;
    float _2123 = floor(_2091);
    int _2125 = ~_832;
    int _2127 = _2125 + 1;
    float _2129 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2131 = uint(_2103) >= uint(_792);
    float _2133 = fma(_2105, _700, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2135 = ~_1967;
    int _2137 = _2135 + _2025;
    int _2139 = _2137 + 1;
    int _2141 = _2127 * _2093;
    int _2143 = _2141 + _1439;
    bool _2145 = !_2131;
    int _2147 = _2145 ? 0 : (-1);
    int _2149 = _2081 ? 0 : 1;
    int _2151 = _724 * _2139;
    int _2153 = _2151 + _1315;
    bool _2155 = uint(_2143) >= uint(_832);
    bool _2157 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2159 = isnan(_680);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    bool _2169 = !_2155;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = ~_2149;
    int _2175 = _2173 + 1;
    int _2177 = _2175 + 1;
    float _2179 = -_2167;
    float _2181 = _2179 + 1.0;
    bool _2183 = _2097 > 0.0;
    bool _2185 = _2097 >= 0.0;
    bool _2187 = isnan(_2097);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(0.0);
    bool _2193 = _2189 || _2191;
    int _2195 = _2177;
    if (!_2069)
    {
        int _2197 = ~_2149;
        int _2199 = _2197 + 1;
        _2195 = _2199;
    }
    int _2201 = _2195;
    float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2205 = _680 + _2203;
    bool _2207 = !_1167;
    int _2209 = _2207 ? _2153 : (-1);
    float _2211 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1815);
    bool _2213 = _2123 > 0.0;
    bool _2215 = _2123 >= 0.0;
    bool _2217 = isnan(_2123);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(0.0);
    bool _2223 = _2219 || _2221;
    float _2225 = _2211 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2227 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2229 = isnan(_680);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    bool _2239 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2241 = isnan(_680);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    bool _2251 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2253 = isnan(_680);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2259 = _2255 || _2257;
    float _2261 = float(_2259);
    float _2263 = _2237 * _2181;
    float _2265 = -_2237;
    float _2267 = _2265 + 1.0;
    float _2269 = -_2249;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_1883, _2205, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2277 = _680 + _2275;
    float _2279 = _2249 * _2267;
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2283 = _680 + _2281;
    float _2285 = _788 * _2271;
    float _2287 = -_788;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_1885, _2277, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2293 = fma(_1901, _2283, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2297 = _680 + _2295;
    bool _2299 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2301 = isnan(_680);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2307 = _2303 || _2305;
    float _2309 = float(_2307);
    float _2311 = _2261 * _2289;
    float _2313 = -_2261;
    float _2315 = _2313 + 1.0;
    float _2317 = fma(_1945, _2297, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2321 = _680 + _2319;
    bool _2323 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2325 = isnan(_680);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2331);
    float _2335 = _2309 * _2315;
    float _2337 = -_2309;
    float _2339 = _2337 + 1.0;
    float _2341 = fma(_1907, _2321, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2343 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2345 = isnan(_680);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    float _2355 = -_2333;
    float _2357 = _2355 + 1.0;
    float _2359 = _2333 * _2339;
    int _2361 = _2193 ? 0 : 1;
    bool _2363 = _2009 != 2;
    float _2365 = _2353 * _2357;
    float _2367 = -_2353;
    float _2369 = _2367 + 1.0;
    int _2371 = ~_2087;
    int _2373 = _2371 + _2147;
    int _2375 = _2373 + 1;
    float _2377 = _2273 * _2365;
    int _2379 = ~_2093;
    int _2381 = _2379 + _2171;
    int _2383 = _2381 + 1;
    int _2385 = ~_2361;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    float _2391 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2377);
    int _2393 = _792 * _2375;
    int _2395 = _2393 + _1329;
    int _2397 = _2389;
    float _2399 = _2359;
    if (!_2183)
    {
        int _2401 = ~_2361;
        int _2403 = _2401 + 1;
        _2397 = _2403;
    }
    int _2405 = _2397;
    int _2407 = _832 * _2383;
    int _2409 = _2407 + _1439;
    float _2411 = fma(_2291, _2359, _2391);
    if (_2363)
    {
        _1597 = _686;
    }
    float _2413 = _1597;
    float _2415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2417 = _2225 + _2415;
    bool _2419 = _2005 != 1;
    float _2421 = fma(_2293, _2335, _2411);
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2425 = _2001 + _2423;
    float _2427 = _2413;
    if (!_2363)
    {
        _2427 = _706;
    }
    float _2429 = _2427;
    float _2431 = fma(_2317, _2311, _2421);
    int _2433 = _2223 ? 0 : 1;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2437 = !_1287;
    int _2439 = _2437 ? _2395 : (-1);
    float _2441 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2443 = !_1433;
    int _2445 = _2443 ? _2409 : (-1);
    float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2449 = _1843 + _2447;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2453 = _2451 != 0;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2457 = _2455 != 0;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2461 = _2459 != 0;
    float _2463 = -_2435;
    float _2465 = fma(_2441, 2.0, _2463);
    int _2467 = _1641 >> 31;
    float _2469 = _2449 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2471 = _1739 & 3;
    bool _2473 = _2471 != 0;
    float _2475 = fma(_2341, _2285, _2431);
    int _2477 = _2467 & 3;
    float _2479 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2469);
    bool _2481 = !_2473;
    int _2483 = _2481 ? 0 : 1;
    float _2485 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2487 = int(_2485);
    int _2489 = _1995 & 3;
    bool _2491 = _2489 != 0;
    float _2493 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2479);
    int _2495 = _1739 >> 31;
    float _2497 = fma(_2043, _2279, _2475);
    int _2499 = _1641 + _2477;
    int _2501 = _1995 >> 31;
    float _2503 = fma(_2133, _2263, _2497);
    bool _2505 = !_2491;
    int _2507 = _2505 ? 0 : 1;
    int _2509 = _2495 & 3;
    float _2511 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2503);
    bool _2513 = _1665 != 3;
    int _2515 = _2499 >> 2;
    int _2517 = _2501 & 3;
    out.m_63.x = _2511;
    int _2519 = _1739 + _2509;
    bool _2521 = !_2513;
    int _2523 = _2521 ? 0 : (-1);
    bool _2525 = _1759 != 3;
    int _2527 = _2515 << 4;
    int _2529 = _2527 + 368;
    int _2531 = _1995 + _2517;
    int _2533 = ~_2433;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    int _2539 = _2519 >> 2;
    int _2541 = _2537;
    if (!_2213)
    {
        int _2543 = ~_2433;
        int _2545 = _2543 + 1;
        _2541 = _2545;
    }
    int _2547 = _2541;
    bool _2549 = !_2525;
    int _2551 = _2549 ? 0 : (-1);
    uint _2553 = uint(int(uint(_2529) >> uint(2)));
    uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
    int _2557 = int(_2553) & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = int(_2553) + 1;
    uint _2563 = uint(int(uint(_2561) >> uint(2)));
    int _2565 = _2561 & 3;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[int(_2563)][_2565];
    bool _2569 = _2013 != 3;
    int _2571 = _2539 << 4;
    int _2573 = _2571 + 512;
    int _2575 = _2531 >> 2;
    uint _2577 = uint(int(uint(_2573) >> uint(2)));
    uint _2579 = uint(int(uint(int(_2577)) >> uint(2)));
    int _2581 = int(_2577) & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    int _2585 = int(_2577) + 1;
    uint _2587 = uint(int(uint(_2585) >> uint(2)));
    int _2589 = _2585 & 3;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[int(_2587)][_2589];
    int _2593 = _2575 << 4;
    int _2595 = _2593 + 656;
    if (!_2419)
    {
        _1729 = _706;
    }
    float _2597 = _1729;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2601 = _2597;
    if (_2419)
    {
        _2601 = _692;
    }
    float _2603 = _2601;
    int _2605 = abs(_1825);
    uint _2607 = uint(int(uint(_2595) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    if (!_2419)
    {
        _1805 = _692;
    }
    float _2623 = _1805;
    float _2625 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2599);
    bool _2627 = !_2569;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _2493 >= 0.0;
    float _2633 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2625);
    int _2635 = abs(_1747);
    int _2637 = _2529 + 8;
    uint _2639 = uint(int(uint(_2637) >> uint(2)));
    uint _2641 = uint(int(uint(int(_2639)) >> uint(2)));
    int _2643 = int(_2639) & 3;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[int(_2641)][_2643];
    int _2647 = int(_2639) + 1;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    int _2651 = _2647 & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    float _2655 = _2623;
    if (!_2419)
    {
        _2399 = _2623;
    }
    float _2657 = _2399;
    float _2659 = _2657;
    if (_2419)
    {
        _2655 = _686;
    }
    float _2661 = _2655;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2665 = ~_2635;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = _2595 + 8;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    if (_2419)
    {
        _2659 = _686;
    }
    float _2689 = _2659;
    float _2691 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2663);
    if (_2631)
    {
        out.m_49.x = 0.0;
    }
    int _2693 = ~_2099;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    float _2699 = _2689 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2701 = ~_2605;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = _2573 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2727 = abs(_2483);
    int _2729 = abs(_2121);
    int _2731 = abs(_2507);
    int _2733 = _2669 * as_type<int>(_2567);
    float _2735 = -_2725;
    float _2737 = fma(_2699, 2.0, _2735);
    int _2739 = abs(_1811);
    int _2741 = _2697 * as_type<int>(_2559);
    int _2743 = _2741 + _2733;
    int _2745 = abs(_1735);
    float _2747 = -_148;
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2737);
    int _2751 = _2705 * as_type<int>(_2591);
    int _2753 = ~_2729;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    float _2759 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2761 = int(_2759);
    int _2763 = ~_2727;
    int _2765 = _2763 + 1;
    int _2767 = _2765 + 1;
    int _2769 = ~_2731;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = _2757 * as_type<int>(_2621);
    int _2777 = ~_2745;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    int _2783 = _2767 * as_type<int>(_2583);
    int _2785 = _2783 + _2751;
    int _2787 = abs(_2065);
    int _2789 = _2773 * as_type<int>(_2613);
    int _2791 = _2789 + _2775;
    int _2793 = abs(_2523);
    float _2795 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2797 = int(_2795);
    int _2799 = ~_2787;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = _2781 * as_type<int>(_2645);
    int _2807 = _2805 + _2743;
    int _2809 = ~_2739;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    int _2815 = abs(_2551);
    int _2817 = ~_2793;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = abs(_2629);
    int _2825 = _2803 * as_type<int>(_2679);
    int _2827 = _2825 + _2791;
    float _2829 = float(uint(_2761));
    int _2831 = _2821 * as_type<int>(_2653);
    int _2833 = _2831 + _2807;
    int _2835 = abs(_1765);
    int _2837 = ~_2815;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    float _2843 = 1.0 / _2829;
    int _2845 = ~_2823;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    int _2851 = _2813 * as_type<int>(_2715);
    int _2853 = _2851 + _2785;
    int _2855 = abs(_1989);
    float _2857 = float(uint(_2487));
    int _2859 = _2841 * as_type<int>(_2723);
    int _2861 = _2859 + _2853;
    int _2863 = abs(_2487);
    int _2865 = _2849 * as_type<int>(_2687);
    int _2867 = _2865 + _2827;
    float _2869 = 1.0 / _2857;
    int _2871 = ~_2855;
    int _2873 = _2871 + 1;
    int _2875 = _2873 + 1;
    int _2877 = ~_2835;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = float(uint(_2797));
    int _2885 = _2875 * _2861;
    int _2887 = abs(_2019);
    int _2889 = abs(_2797);
    int _2891 = _2833 * _2881;
    float _2893 = 1.0 / _2883;
    int _2895 = _2439 * _2855;
    int _2897 = _2895 + _2885;
    int _2899 = _2209 * _2835;
    int _2901 = _2899 + _2891;
    int _2903 = abs(_2761);
    float _2905 = float(uint(_2863));
    int _2907 = ~_2887;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = float(uint(_2889));
    float _2915 = float(uint(_2903));
    float _2917 = 1.0 / _2905;
    int _2919 = _2911 * _2867;
    int _2921 = as_type<int>(_2869) + (-2);
    float _2923 = float(uint(_2901));
    int _2925 = _2445 * _2887;
    int _2927 = _2925 + _2919;
    int _2929 = as_type<int>(_2843) + (-2);
    float _2931 = 1.0 / _2915;
    float _2933 = float(uint(_2897));
    float _2935 = as_type<float>(_2921) * _2923;
    int _2937 = ~_2797;
    int _2939 = _2937 + 1;
    int _2941 = as_type<int>(_2893) + (-2);
    float _2943 = as_type<float>(_2929) * _2933;
    float _2945 = float(uint(_2927));
    float _2947 = 1.0 / _2913;
    int _2949 = abs(_2901);
    float _2951 = as_type<float>(_2941) * _2945;
    int _2953 = as_type<int>(_2917) + (-2);
    int _2955 = abs(_2897);
    float _2957 = trunc(_2935);
    float _2959 = precise::max(_2957, 0.0);
    uint _2961 = uint(_2959);
    float _2963 = float(uint(_2949));
    int _2965 = as_type<int>(_2931) + (-2);
    int _2967 = abs(_2927);
    int _2969 = ~_2487;
    int _2971 = _2969 + 1;
    float _2973 = trunc(_2951);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    int _2979 = as_type<int>(_2947) + (-2);
    float _2981 = as_type<float>(_2953) * _2963;
    bool _2983 = !_2457;
    int _2985 = _2983 ? 0 : 1;
    float _2987 = float(uint(_2955));
    float _2989 = trunc(_2943);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    int _2995 = abs(_2985);
    float _2997 = as_type<float>(_2965) * _2987;
    float _2999 = float(_2201);
    float _3001 = float(uint(_2967));
    float _3003 = trunc(_2981);
    float _3005 = precise::max(_3003, 0.0);
    uint _3007 = uint(_3005);
    int _3009 = _2971 * int(_2961);
    int _3011 = _3009 + _2901;
    int _3013 = ~_2761;
    int _3015 = _3013 + 1;
    float _3017 = as_type<float>(_2979) * _3001;
    float _3019 = float(_2995);
    int _3021 = _2939 * int(_2977);
    int _3023 = _3021 + _2927;
    float _3025 = float(uint(_3011));
    float _3027 = trunc(_2997);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    float _3033 = _2725;
    float _3035 = as_type<float>(_2961);
    if (!_2419)
    {
        _3033 = _706;
    }
    float _3037 = _3033;
    float _3039 = _3019 * _2999;
    int _3041 = _3015 * int(_2993);
    int _3043 = _3041 + _2897;
    float _3045 = _3037;
    if (_2419)
    {
        _3045 = _692;
    }
    float _3047 = _3045;
    float _3049 = as_type<float>(_2921) * _3025;
    float _3051 = float(uint(_3023));
    float _3053 = trunc(_3017);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = ~_2863;
    int _3061 = _3059 + 1;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3065 = _3047 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3067 = float(uint(_3043));
    float _3069 = as_type<float>(_2941) * _3051;
    int _3071 = ~_2889;
    int _3073 = _3071 + 1;
    int _3075 = _3061 * int(_3007);
    int _3077 = _3075 + _2949;
    float _3079 = trunc(_3049);
    float _3081 = precise::max(_3079, 0.0);
    uint _3083 = uint(_3081);
    float _3085 = fma(_3065, -2.0, _3063);
    int _3087 = ~_2903;
    int _3089 = _3087 + 1;
    float _3091 = as_type<float>(_2929) * _3067;
    bool _3093 = !_2453;
    int _3095 = _3093 ? 0 : 1;
    int _3097 = _3089 * int(_3031);
    int _3099 = _3097 + _2955;
    float _3101 = float(uint(_3077));
    int _3103 = _3073 * int(_3057);
    int _3105 = _3103 + _2967;
    int _3107 = abs(_3095);
    float _3109 = trunc(_3091);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = float(_2547);
    float _3117 = as_type<float>(_2953) * _3101;
    float _3119 = float(_3107);
    float _3121 = float(uint(_3099));
    float _3123 = float(uint(_3105));
    float _3125 = trunc(_3117);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    int _3131 = int(_2961) + int(_3083);
    float _3133 = _3119 * _3115;
    float _3135 = as_type<float>(_2965) * _3121;
    float _3137 = _3123;
    if (_2363)
    {
        _3035 = _692;
    }
    float _3139 = _3035;
    float _3141 = as_type<float>(_2979) * _3123;
    float _3143 = _3139;
    if (!_2363)
    {
        _3143 = _686;
    }
    float _3145 = _3143;
    float _3147 = _3133 * (-2.0);
    int _3149 = as_type<int>(_3145);
    if (_2631)
    {
        _3137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3151 = _3137;
    float _3153 = trunc(_3069);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    float _3159 = _3145 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3161 = ~_2487;
    int _3163 = _3161 + 1;
    if (_2631)
    {
        float _3165 = _3151 * 5.0;
        _3149 = as_type<int>(_3165);
    }
    int _3167 = _3149;
    float _3169 = fma(_1997, _3147, _1997);
    int _3171 = ~_2761;
    int _3173 = _3171 + 1;
    float _3175 = in.m_65.x;
    float _3177 = in.m_65.y;
    float _3179 = in.m_65.z;
    float _3181 = trunc(_3135);
    float _3183 = precise::max(_3181, 0.0);
    uint _3185 = uint(_3183);
    if (_2631)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9534 = as_type<float>(_3167);
        out.gl_Position.z = _9534;
    }
    int _3187 = int(_2993) + int(_3113);
    int _3189 = int(_3007) + int(_3129);
    int _3191 = _3163 * _3131;
    int _3193 = _3191 + _2901;
    float _3195 = trunc(_3141);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    int _3201 = int(_2977) + int(_3157);
    int _3203 = ~_2889;
    int _3205 = _3203 + 1;
    bool _3207 = uint(_3193) >= uint(_2487);
    int _3209 = ~_2863;
    int _3211 = _3209 + 1;
    int _3213 = ~_2797;
    int _3215 = _3213 + 1;
    int _3217 = _3173 * _3187;
    int _3219 = _3217 + _2897;
    int _3221 = int(_3031) + int(_3185);
    int _3223 = _3211 * _3189;
    int _3225 = _3223 + _2949;
    int _3227 = ~_2903;
    int _3229 = _3227 + 1;
    int _3231 = _3215 * _3201;
    int _3233 = _3231 + _2927;
    bool _3235 = uint(_3219) >= uint(_2761);
    float _3237 = fma(_3147, _3175, _3175);
    bool _3239 = uint(_3225) >= uint(_2863);
    int _3241 = _3229 * _3221;
    int _3243 = _3241 + _2955;
    bool _3245 = !_3207;
    int _3247 = _3245 ? 0 : (-1);
    float _3249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3251 = !_3235;
    int _3253 = _3251 ? 0 : (-1);
    bool _3255 = uint(_3233) >= uint(_2797);
    int _3257 = ~_3131;
    int _3259 = _3257 + _3247;
    int _3261 = _3259 + 1;
    int _3263 = ~_3187;
    int _3265 = _3263 + _3253;
    int _3267 = _3265 + 1;
    float _3269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3271 = int(_3057) + int(_3199);
    int _3273 = _2487 * _3261;
    int _3275 = _3273 + _2901;
    bool _3277 = uint(_3243) >= uint(_2903);
    int _3279 = _2761 * _3267;
    int _3281 = _3279 + _2897;
    bool _3283 = !_3255;
    int _3285 = _3283 ? 0 : (-1);
    int _3287 = _3205 * _3271;
    int _3289 = _3287 + _2967;
    bool _3291 = _2487 == 0;
    float _3293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3295 = !_3277;
    int _3297 = _3295 ? 0 : (-1);
    bool _3299 = _2761 == 0;
    int _3301 = ~_3201;
    int _3303 = _3301 + _3285;
    int _3305 = _3303 + 1;
    bool _3307 = !_3291;
    int _3309 = _3307 ? _3275 : (-1);
    bool _3311 = !_3299;
    int _3313 = _3311 ? _3281 : (-1);
    int _3315 = _2797 * _3305;
    int _3317 = _3315 + _2927;
    bool _3319 = _2797 == 0;
    bool _3321 = _2797 == 0;
    int _3323 = _2927 ^ _2797;
    float _3325 = _3249 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3327 = ~_3297;
    int _3329 = _3221 + _3327;
    int _3331 = _3329 + 1;
    float _3333 = _3269 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3335 = float(_3309);
    float _3337 = -_148;
    float _3339 = fma(_3337, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1837);
    bool _3341 = uint(_3289) >= uint(_2889);
    float _3343 = fma(_3325, _1019, -0.5);
    int _3345 = _2901 ^ _2487;
    float _3347 = fma(_3325, _3335, _3339);
    float _3349 = float(_3313);
    float _3351 = fma(_3333, _1055, -0.5);
    bool _3353 = !_3319;
    int _3355 = _3353 ? _3317 : (-1);
    float _3357 = _3293 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3359 = !_3341;
    int _3361 = _3359 ? 0 : (-1);
    float _3363 = _2449 * _2449;
    bool _3365 = _2761 == 0;
    float _3367 = fma(_3357, _1663, -0.5);
    bool _3369 = !_3239;
    int _3371 = _3369 ? 0 : (-1);
    int _3373 = _2897 ^ _2761;
    uint _3375 = uint(int(uint(_3345) >> uint(31)));
    float _3377 = fma(_3333, _3349, _2749);
    float _3379 = float(_3355);
    float _3381 = -_148;
    float _3383 = fma(_3381, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2465);
    int _3385 = ~_3371;
    int _3387 = _3189 + _3385;
    int _3389 = _3387 + 1;
    float _3391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3393 = ~int(_3375);
    int _3395 = _3393 + 1;
    float _3397 = fma(_3357, _3379, _3383);
    uint _3399 = uint(int(uint(_3373) >> uint(31)));
    int _3401 = _3389 ^ _3395;
    int _3403 = ~int(_3399);
    int _3405 = _3403 + 1;
    uint _3407 = uint(int(uint(_3323) >> uint(31)));
    float _3409 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3411 = ~_3395;
    int _3413 = _3411 + _3401;
    int _3415 = _3413 + 1;
    float _3417 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3419 = _3331 ^ _3405;
    float _3421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3423 = ~int(_3407);
    int _3425 = _3423 + 1;
    float _3427 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3409);
    int _3429 = ~_3405;
    int _3431 = _3429 + _3419;
    int _3433 = _3431 + 1;
    float _3435 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3417);
    float _3437 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2691);
    bool _3439 = _2487 == 0;
    float _3441 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3427);
    int _3443 = ~_3361;
    int _3445 = _3271 + _3443;
    int _3447 = _3445 + 1;
    float _3449 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3435);
    float _3451 = fma(_3437, _3351, _3377);
    float _3453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3455 = !_3365;
    int _3457 = _3455 ? _3433 : (-1);
    float _3459 = fma(_3441, _3343, _3347);
    bool _3461 = !_3439;
    int _3463 = _3461 ? _3415 : (-1);
    float _3465 = fma(_3449, _3367, _3397);
    float _3467 = _3391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3469 = _3447 ^ _3425;
    float _3471 = _3421 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3473 = float(_3457);
    float _3475 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3085);
    float _3477 = float(_3463);
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3481 = ~_3425;
    int _3483 = _3481 + _3469;
    int _3485 = _3483 + 1;
    float _3487 = fma(_1133, _3467, -0.5);
    float _3489 = -_3475;
    float _3491 = fma(_3471, _3473, _3489);
    float _3493 = -_2007;
    float _3495 = fma(_3467, _3477, _3493);
    bool _3497 = !_3321;
    int _3499 = _3497 ? _3485 : (-1);
    float _3501 = fma(_3159, -2.0, _3479);
    float _3503 = fma(_1537, _3471, -0.5);
    float _3505 = float(_3499);
    float _3507 = _3453 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3509 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3501);
    float _3511 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3515 = log2(_3513);
    float _3517 = -_3509;
    float _3519 = fma(_3507, _3505, _3517);
    float _3521 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3511);
    float _3523 = fma(_2417, _2417, _3363);
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3527 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3529 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3521);
    float _3531 = fma(_2425, _2425, _3523);
    float _3533 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3525);
    float _3535 = fma(_3507, _1601, -0.5);
    float _3537 = fma(_3529, _3487, _3495);
    float _3539 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3533);
    float _3541 = rsqrt(_3531);
    float _3543 = fma(_2633, _3503, _3491);
    float _3545 = _3459 + 0.5;
    float _3547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3549 = 1.0 + _3547;
    float _3551 = fma(_3539, _3535, _3519);
    float _3553 = _3451 + 0.5;
    float _3555 = _3537 + 0.5;
    float _3557 = _3543 + 0.5;
    float _3559 = 1.0 / _3549;
    float _3561 = _3465 + 0.5;
    float _3563 = _3551 + 0.5;
    float _3565 = _3527 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3567 = _3515 * _148;
    out.m_67.x = _3545;
    out.m_67.y = _3555;
    out.m_67.z = _3553;
    out.m_67.w = _3557;
    bool _3569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3571 = isnan(1.0);
    bool _3573 = _3569 || _3571;
    bool _3575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3577 = _3573 || _3575;
    float _3579 = _3565 * _3541;
    out.m_69.x = _3561;
    out.m_69.y = _3563;
    float _3581 = exp2(_3567);
    bool _3583 = !_2461;
    int _3585 = _3583 ? 0 : 1;
    float _3587 = _2417 * _3579;
    float _3589 = _2449 * _3579;
    float _3591 = as_type<float>(_3317);
    float _3593 = as_type<float>(_3129);
    if (_2631)
    {
        return out;
    }
    float _3595 = -_3589;
    float _3597 = _1843 + _3595;
    float _3599 = _2425 * _3579;
    float _3601 = -_3587;
    float _3603 = _2225 + _3601;
    float _3605 = -_3581;
    float _3607 = _3605 + 1.0;
    float _3609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3611 = _3597 + _3609;
    float _3613 = -_3599;
    float _3615 = _2001 + _3613;
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3619 = _3603 + _3617;
    bool _3621 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3623 = isnan(0.0);
    bool _3625 = _3621 || _3623;
    bool _3627 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3629 = _3625 || _3627;
    float _3631 = _3611 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3635 = _3615 + _3633;
    float _3637 = -_3589;
    float _3639 = _2449 + _3637;
    float _3641 = _3629 ? _3607 : 0.0;
    float _3643 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3631);
    float _3645 = _686 + (-0.5);
    float _3647 = -_3587;
    float _3649 = _2417 + _3647;
    float _3651 = _3639 * _3639;
    float _3653 = fma(_3635, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3643);
    float _3655 = _3631;
    if (_3577)
    {
        float _3657 = _3641 * _3559;
        _150 = _3657;
    }
    float _3659 = _150;
    float _3661 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3237);
    float _3663 = fma(_3649, _3649, _3651);
    float _3665 = -_3599;
    float _3667 = _2425 + _3665;
    bool _3669 = _3653 >= 0.0;
    float _3671 = fma(_3169, _3659, _3661);
    float _3673 = _3039 * (-2.0);
    float _3675 = fma(_3667, _3667, _3663);
    int _3677 = abs(_3585);
    float _3679 = _3671 * 0.15915493667125701904296875;
    float _3681 = _692 + (-0.5);
    float _3683 = sqrt(_3675);
    float _3685 = fma(_3673, _3177, _3177);
    float _3687 = fma(_2129, _3673, _2129);
    if (_3669)
    {
        _3655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3689 = _3655;
    float _3691 = fma(_3681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3685);
    float _3693 = _3679 * 6.283185482025146484375;
    float _3695 = sin(_3693);
    float _3697 = float(_2405);
    int _3699 = as_type<int>(_3689);
    if (_3669)
    {
        out.m_49.x = 0.0;
    }
    if (_3669)
    {
        float _3701 = _3689 * 5.0;
        _3699 = as_type<int>(_3701);
    }
    int _3703 = _3699;
    float _3705 = float(_3677);
    float _3707 = fma(_3687, _3659, _3691);
    float _3709 = _3679 * 6.283185482025146484375;
    float _3711 = cos(_3709);
    if (_3669)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10350 = as_type<float>(_3703);
        out.gl_Position.z = _10350;
    }
    float _3713 = _3705 * _3697;
    if (_3669)
    {
        return out;
    }
    float _3715 = -_1843;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3719 = _3707 * 0.15915493667125701904296875;
    float _3721 = -_2225;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3725 = -_2001;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3729 = _3717 * _3717;
    float _3731 = _686 + _706;
    float _3733 = _706 + (-0.5);
    float _3735 = _3719 * 6.283185482025146484375;
    float _3737 = sin(_3735);
    float _3739 = fma(_3723, _3723, _3729);
    float _3741 = _3731 + (-1.0);
    float _3743 = _3713 * (-2.0);
    float _3745 = fma(_3727, _3727, _3739);
    float _3747 = fma(_3741, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3749 = fma(_3743, _3179, _3179);
    float _3751 = _3719 * 6.283185482025146484375;
    float _3753 = cos(_3751);
    float _3755 = fma(_3747, _3743, _3747);
    float _3757 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3749);
    float _3759 = fma(_3755, _3659, _3757);
    float _3761 = rsqrt(_3745);
    float _3763 = _3541 * _3683;
    float _3765 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3767 = _3759 * 0.15915493667125701904296875;
    float _3769 = in.m_71.x;
    float _3771 = in.m_71.y;
    float _3773 = in.m_71.z;
    float _3775 = _3527 * _3763;
    float _3777 = _3767 * 6.283185482025146484375;
    float _3779 = sin(_3777);
    float _3781 = _3695 * _3737;
    float _3783 = _3711 * _3753;
    float _3785 = _3695 * _3753;
    bool _3787 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3789 = isnan(0.5);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3795 = _3791 || _3793;
    float _3797 = _3723 * _3761;
    float _3799 = _3727 * _3761;
    float _3801 = _3717 * _3761;
    float _3803 = _3767 * 6.283185482025146484375;
    float _3805 = cos(_3803);
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3797 * _3807;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3813 = _3799 * _3811;
    float _3815 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3817 = -_3809;
    float _3819 = fma(_3799, _3815, _3817);
    float _3821 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3823 = -_3813;
    float _3825 = fma(_3801, _3821, _3823);
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3829 = _3801 * _3827;
    float _3831 = fma(_3779, _3783, _3781);
    float _3833 = _3819 * _3819;
    float _3835 = fma(_3779, _3781, _3783);
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3839 = -_3829;
    float _3841 = fma(_3797, _3837, _3839);
    float _3843 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3845 = fma(_3825, _3825, _3833);
    float _3847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3771);
    float _3849 = _3711 * _3737;
    float _3851 = _3763 * _3843;
    float _3853 = fma(_3841, _3841, _3845);
    float _3855 = _3711 * _3805;
    float _3857 = _3753 * _3805;
    float _3859 = _3695 * _3805;
    float _3861 = _3737 * _3805;
    float _3863 = _3847 * _3851;
    float _3865 = rsqrt(_3853);
    float _3867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3769);
    float _3869 = -_3849;
    float _3871 = fma(_3779, _3785, _3869);
    float _3873 = _3763 * _3765;
    float _3875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3773);
    float _3877 = -_3785;
    float _3879 = fma(_3779, _3849, _3877);
    float _3881 = _3867 * _3775;
    float _3883 = _3855 * _3863;
    float _3885 = _3875 * _3873;
    float _3887 = -_3863;
    float _3889 = _3779 * _3887;
    float _3891 = _3859 * _3863;
    float _3893 = fma(_3831, _3881, _3883);
    float _3895 = fma(_3857, _3881, _3889);
    float _3897 = fma(_3871, _3881, _3891);
    float _3899 = fma(_3879, _3885, _3893);
    float _3901 = _3825 * _3865;
    float _3903 = _3819 * _3865;
    float _3905 = _3841 * _3865;
    float _3907 = fma(_3861, _3885, _3895);
    float _3909 = _3801 * _3901;
    float _3911 = _3799 * _3903;
    float _3913 = fma(_3835, _3885, _3897);
    float _3915 = -_3909;
    float _3917 = fma(_3797, _3903, _3915);
    float _3919 = -_3911;
    float _3921 = fma(_3801, _3905, _3919);
    float _3923 = _3917 * _3899;
    float _3925 = _3921 * _3899;
    float _3927 = fma(_3905, _3907, _3923);
    float _3929 = fma(_3901, _3907, _3925);
    float _3931 = fma(_3799, _3913, _3927);
    float _3933 = fma(_3797, _3913, _3929);
    float _3935 = _2001 + _3931;
    float _3937 = _2225 + _3933;
    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3941 = _3935 + _3939;
    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3945 = _3937 + _3943;
    float _3947 = _3941 * _3941;
    float _3949 = fma(_3945, _3945, _3947);
    float _3951 = _3797 * _3905;
    float _3953 = sqrt(_3949);
    float _3955 = -_3951;
    float _3957 = fma(_3799, _3901, _3955);
    float _3959 = _3957 * _3899;
    float _3961 = fma(_3903, _3907, _3959);
    float _3963 = fma(_3801, _3913, _3961);
    bool _3965 = _3953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3967 = _1843 + _3963;
    float _3969 = _3899;
    float _3971 = _3913;
    float _3973 = _3937;
    float _3975 = _3953;
    if (!_3965)
    {
        _3969 = _3937;
    }
    float _3977 = _3969;
    float _3979 = _3977;
    if (!_3965)
    {
        _3971 = _3935;
    }
    float _3981 = _3971;
    float _3983 = _3981;
    if (!_3965)
    {
        _3973 = _3967;
    }
    float _3985 = _3973;
    bool _3987 = !_3965;
    float _3989 = _3985;
    if (!_3987)
    {
        float _3991 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3995 = _3953 + _3993;
        float _3997 = rsqrt(_3949);
        float _3999 = _3995 * _3991;
        float _4001 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4003 = _3999 * 0.15915493667125701904296875;
        float _4005 = _4003 * 6.283185482025146484375;
        float _4007 = sin(_4005);
        float _4009 = _4003 * 6.283185482025146484375;
        float _4011 = cos(_4009);
        float _4013 = fma(_4007, _4001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4015 = _3997 * _4013;
        float _4017 = _4011 + (-1.0);
        float _4019 = fma(_3945, _4015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4021 = fma(_3941, _4015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4023 = _4017 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4025 = fma(_3967, _4011, _4023);
        _3979 = _4019;
        _3989 = _4025;
        _3983 = _4021;
        _3975 = _4003;
    }
    float _4027 = _3979;
    float _4029 = _3989;
    float _4031 = _3983;
    float _4033 = _3975;
    float _4035 = -_3587;
    float _4037 = _4035 + _4027;
    float _4039 = -_3589;
    float _4041 = _4039 + _4029;
    float _4043 = -_3599;
    float _4045 = _4043 + _4031;
    float _4047 = _4041;
    float _4049 = _4037;
    float _4051 = _4045;
    float _4053 = _4033;
    float _4055 = _4027;
    if (!_3795)
    {
        float _4057 = _3611 * _3611;
        float _4059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4061 = -_2001;
        float _4063 = _4061 + _4031;
        float _4065 = fma(_3619, _3619, _4057);
        float _4067 = fma(_3635, _3635, _4065);
        float _4069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4071 = sqrt(_4067);
        float _4073 = 1.0 / _3763;
        float _4075 = _4069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4077 = precise::min(_4071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4079 = _4077 * _4059;
        float _4081 = _4079 * _4073;
        float _4083 = -_2225;
        float _4085 = _4083 + _4027;
        float _4087 = -_1843;
        float _4089 = _4087 + _4029;
        float _4091 = _4075 * _4081;
        float _4093 = _4063 * _4081;
        float _4095 = fma(_4085, _4091, _3603);
        float _4097 = fma(_4089, _4091, _3597);
        float _4099 = fma(_4075, _4093, _3615);
        _4047 = _4097;
        _4049 = _4095;
        _4051 = _4099;
        _4053 = _4091;
    }
    float _4101 = _4047;
    float _4103 = _4049;
    float _4105 = _4051;
    float _4107 = _4053;
    float _4109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4111 = _4101 + _4109;
    float _4113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4115 = _4103 + _4113;
    float _4117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4119 = _4105 + _4117;
    float _4121 = _4111 * _4111;
    float _4123 = fma(_4115, _4115, _4121);
    float _4125 = fma(_4119, _4119, _4123);
    float _4127 = rsqrt(_4125);
    float _4129 = sqrt(_4125);
    float _4131 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4133 = _4115 * _4131;
    float _4135 = _4119 * _4131;
    float _4137 = _4133 * _4133;
    float _4139 = _4135 * _4135;
    float _4141 = _4137 + _4139;
    float _4143 = sqrt(_4141);
    bool _4145 = _4143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4149 = _4143 + _4147;
    float _4151 = _4119;
    float _4153 = _4123;
    float _4155 = _4149;
    float _4157 = _4111;
    if (_4145)
    {
        float _4159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4151 = _4159;
    }
    float _4161 = _4151;
    if (_4145)
    {
        float _4163 = rsqrt(_4141);
        _4153 = _4163;
    }
    float _4165 = _4153;
    float _4167 = _4165;
    if (_4145)
    {
        float _4169 = _4149 * _4161;
        _4155 = _4169;
    }
    float _4171 = _4155;
    if (_4145)
    {
        float _4173 = _4171 * 0.15915493667125701904296875;
        _4055 = _4173;
    }
    float _4175 = _4055;
    float _4177 = _4107;
    if (_4145)
    {
        float _4179 = _4175 * 6.283185482025146484375;
        float _4181 = sin(_4179);
        _4177 = _4181;
    }
    float _4183 = _4177;
    float _4185 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4187 = precise::max(0.0, _4185);
    float _4189 = _4127;
    float _4191 = _4187;
    float _4193 = _4185;
    if (_4145)
    {
        float _4195 = _4175 * 6.283185482025146484375;
        float _4197 = cos(_4195);
        _4189 = _4197;
    }
    float _4199 = _4189;
    float _4201 = -_4131;
    float _4203 = -_4187;
    float _4205 = fma(_4111, _4201, _4203);
    float _4207 = _4205;
    if (!_4145)
    {
        _4157 = _4133;
    }
    float _4209 = _4157;
    float _4211 = _4209;
    if (!_4145)
    {
        _4191 = _4135;
    }
    float _4213 = _4191;
    float _4215 = _4213;
    if (_4145)
    {
        float _4217 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4193 = _4217;
    }
    float _4219 = _4193;
    float _4221 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4223 = _4183;
    float _4225 = _4219;
    if (_4145)
    {
        float _4227 = fma(_4183, _4219, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4223 = _4227;
    }
    float _4229 = _4223;
    float _4231 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4221);
    float _4233 = _4229;
    float _4235 = _4199;
    if (_4145)
    {
        float _4237 = _4199 + (-1.0);
        _4225 = _4237;
    }
    float _4239 = _4225;
    float _4241 = _4239;
    if (_4145)
    {
        float _4243 = _4165 * _4229;
        _4233 = _4243;
    }
    float _4245 = _4233;
    float _4247 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4231);
    if (_4145)
    {
        float _4249 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4167 = _4249;
    }
    float _4251 = _4167;
    if (_4145)
    {
        float _4253 = _4133 * _4245;
        _4211 = _4253;
    }
    float _4255 = _4211;
    if (!_4145)
    {
        _4241 = _4137;
    }
    float _4257 = _4241;
    float _4259 = _4257;
    if (_4145)
    {
        float _4261 = _4135 * _4245;
        _4215 = _4261;
    }
    float _4263 = _4215;
    if (_4145)
    {
        float _4265 = fma(_4205, _4199, _4251);
        _4207 = _4265;
    }
    float _4267 = _4207;
    if (_4145)
    {
        float _4269 = _4255 * _4255;
        _4259 = _4269;
    }
    float _4271 = _4259;
    float _4273 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4145)
    {
        _4235 = _4139;
    }
    float _4275 = _4235;
    float _4277 = _4275;
    if (_4145)
    {
        float _4279 = _4263 * _4263;
        _4277 = _4279;
    }
    float _4281 = _4277;
    float _4283 = fma(_4267, _4267, _4271);
    float _4285 = fma(_3603, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4287 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4273);
    float _4289 = _4283 + _4281;
    float _4291 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4293 = _4247 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4297 = fma(_4129, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4295);
    float _4299 = precise::clamp(_4297, 0.0, 1.0);
    float _4301 = rsqrt(_4289);
    float _4303 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4291);
    float _4305 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4287);
    float _4307 = -_4299;
    float _4309 = _4307 + 1.0;
    float _4311 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4313 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4303);
    float _4315 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4317 = _4305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4319 = floor(_4285);
    float _4321 = _4313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4323 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4315);
    float _4325 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4327 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4311);
    float _4329 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4323);
    float _4331 = _4301 * _4267;
    float _4333 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4327);
    float _4335 = _4301 * _4255;
    float _4337 = abs(_4309);
    float _4339 = log2(_4337);
    float _4341 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4343 = _4301 * _4263;
    float _4345 = _4335 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4347 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4333);
    float _4349 = -_4319;
    float _4351 = _4285 + _4349;
    float _4353 = -_4345;
    float _4355 = fma(_4331, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4353);
    float _4357 = floor(_4325);
    float _4359 = -_4343;
    float _4361 = fma(_4359, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4355);
    float _4363 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4365 = fma(_4361, 0.5, 0.5);
    float _4367 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4371 = fma(_4361, -0.5, 0.5);
    float _4373 = 1.0 / _4347;
    float _4375 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4377 = -_4363;
    float _4379 = fma(_4377, _4369, 1.0);
    float _4381 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4383 = fma(_4365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4385 = -_4357;
    float _4387 = _4325 + _4385;
    float _4389 = _4331 + 1.0;
    float _4391 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4381);
    float _4393 = exp2(_4367);
    float _4395 = fma(_4365, _4383, -0.212114393711090087890625);
    float _4397 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4375);
    float _4399 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4391);
    float _4401 = log2(_4379);
    float _4403 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4397);
    float _4405 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4399);
    float _4407 = sqrt(_4371);
    float _4409 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4403);
    float _4411 = -_4331;
    float _4413 = fma(_4393, _4389, _4411);
    float _4415 = _4405 * _4373;
    float2 _11466 = float2(_4351, _4387);
    float _4417 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11466, float2(0.0), isnan(_11466)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11466, float2(0.0), isnan(_11466)), level(0.0)).x;
    float _4419 = _4409 * _4373;
    float _4421 = fma(_4365, _4395, 1.570728778839111328125);
    float _4423 = fma(_4415, 0.5, 0.5);
    float _4425 = _4401 * 0.693147182464599609375;
    float _4427 = fma(_4413, 0.5, 0.5);
    float _4429 = fma(_4419, -0.5, 0.5);
    float _4431 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4433 = _4407 * 0.636619746685028076171875;
    float3 _11500 = float3(_4423, _4429, _4431);
    float _4435 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11500, float3(0.0), isnan(_11500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11500, float3(0.0), isnan(_11500)), level(0.0)).x;
    float3 _11511 = float3(_4423, _4429, _4431);
    float4 _4438 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11511, float3(0.0), isnan(_11511)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11511, float3(0.0), isnan(_11511)), level(0.0)).xyzw;
    float _4440 = _4438.x;
    float _4442 = _4438.y;
    float _4444 = _4438.z;
    float _4446 = _4438.w;
    float _4448 = -_4421;
    float _4450 = fma(_4433, _4448, 1.0);
    float2 _11532 = float2(_4450, _4427);
    float3 _4454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11532, float2(0.0), isnan(_11532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11532, float2(0.0), isnan(_11532)), level(0.0)).xyz;
    float _4456 = _4454.x;
    float _4458 = _4454.y;
    float _4460 = _4454.z;
    float _4462 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4464 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4466 = _3771 != 0.0;
    bool _4468 = isnan(_3771);
    bool _4470 = _4466 || _4468;
    bool _4472 = isnan(0.0);
    bool _4474 = _4470 || _4472;
    float _4476 = _3855 * _3957;
    float _4478 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4462);
    float _4480 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4464);
    float _4482 = in.m_73.x;
    float _4484 = in.m_73.y;
    float _4486 = in.m_73.z;
    bool _4488 = _3769 == 0.0;
    bool _4490 = !_4474;
    bool _4492 = _4488 && _4490;
    float _4494 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4478);
    float _4496 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4480);
    float _4498 = _3855 * _3917;
    float _4500 = _4494 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4502 = _4496 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4504 = _3773 == 0.0;
    bool _4506 = _4504 && _4492;
    float _4508 = -_3779;
    float _4510 = fma(_4508, _3903, _4476);
    float _4512 = 1.0 / _4500;
    float _4514 = _4502 + _4500;
    float _4516 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4518 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _4103;
    out.m_75.y = _4101;
    out.m_75.z = _4105;
    float _4520 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4518);
    float _4522 = in.m_77.x;
    float _4524 = in.m_77.y;
    float _4526 = in.m_77.z;
    float _4528 = in.m_77.w;
    float _4530 = exp2(_4516);
    float _4532 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4520);
    float _4534 = _4482;
    if (_4506)
    {
        _3591 = _4482;
    }
    float _4536 = _3591;
    float _4538 = _4514 * _4512;
    float _4540 = _4538 * 0.5;
    float _4542 = _4536;
    if (_4506)
    {
        _3593 = _4484;
    }
    float _4544 = _3593;
    float _4546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4548 = fma(_4540, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4546);
    float _4550 = 1.0 / _4548;
    float _4552 = -_4530;
    float _4554 = _4552 + 1.0;
    float _4556 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4560 = _4550 * _4558;
    float _4562 = _4550;
    float _4564 = _4544;
    if (_4506)
    {
        _4562 = _4536;
    }
    float _4566 = _4562;
    float _4568 = _4566;
    if (!_4506)
    {
        _4542 = _4482;
    }
    float _4570 = _4542;
    float _4572 = abs(_4560);
    float _4574 = log2(_4572);
    if (_4506)
    {
        _4534 = _4486;
    }
    float _4576 = _4534;
    float _4578 = _4576;
    if (!_4506)
    {
        float _4580 = fma(_3773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4486);
        _4578 = _4580;
    }
    float _4582 = _4578;
    if (!_4506)
    {
        float _4584 = fma(_3769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4570);
        _4568 = _4584;
    }
    float _4586 = _4568;
    bool _4588 = _4560 <= 8000.0;
    bool _4590 = isnan(_4560);
    bool _4592 = _4588 || _4590;
    bool _4594 = isnan(8000.0);
    bool _4596 = _4592 || _4594;
    float _4598 = float(_4596);
    float _4600 = _4574 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4602 = _4574;
    if (_4506)
    {
        _4602 = _4544;
    }
    float _4604 = _4602;
    float _4606 = _4604;
    if (!_4506)
    {
        _4564 = _4484;
    }
    float _4608 = _4564;
    float _4610 = _4526 * _4570;
    float _4612 = exp2(_4600);
    if (!_4506)
    {
        float _4614 = fma(_3771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4608);
        _4606 = _4614;
    }
    float _4616 = _4606;
    float _4618 = _4524 * _4486;
    float _4620 = _4522 * _4608;
    float _4622 = -_4610;
    float _4624 = fma(_4522, _4486, _4622);
    float _4626 = _3831 * _3921;
    bool _4628 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4630 = isnan(_4129);
    bool _4632 = _4628 || _4630;
    bool _4634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4636 = _4632 || _4634;
    float _4638 = fma(_4612, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4640 = precise::clamp(_4638, 0.0, 1.0);
    float _4642 = -_4618;
    float _4644 = fma(_4526, _4608, _4642);
    float _4646 = -_4620;
    float _4648 = fma(_4524, _4570, _4646);
    float _4650 = _4624 * _4528;
    float _4652 = fma(_4640, -2.0, 3.0);
    float _4654 = _4640 * _4640;
    float _4656 = _4644 * _4528;
    float _4658 = _4648 * _4528;
    float _4660 = _3831 * _3957;
    float _4662 = _4654 * _4652;
    float _4664 = _3855 * _3921;
    float _4666 = _3831 * _3917;
    float _4668 = _3879 * _3921;
    float _4670 = fma(_3857, _3901, _4626);
    float _4672 = -_3779;
    float _4674 = fma(_4672, _3901, _4664);
    float _4676 = fma(_3857, _3903, _4660);
    float _4678 = fma(_3857, _3905, _4666);
    float _4680 = -_3779;
    float _4682 = fma(_4680, _3905, _4498);
    float _4684 = _3879 * _3917;
    float _4686 = -_4662;
    float _4688 = _4686 + 1.0;
    float _4690 = fma(_3861, _3901, _4668);
    float _4692 = fma(_3859, _3797, _4674);
    float _4694 = fma(_3859, _3801, _4510);
    float _4696 = _3879 * _3957;
    float _4698 = fma(_3859, _3799, _4682);
    float _4700 = fma(_4688, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4662);
    float _4702 = fma(_3871, _3801, _4676);
    float _4704 = fma(_3871, _3797, _4670);
    float _4706 = fma(_3871, _3799, _4678);
    float _4708 = fma(_3861, _3903, _4696);
    float _4710 = fma(_3835, _3797, _4690);
    float _4712 = _4692 * _4524;
    float _4714 = _4694 * _4524;
    float _4716 = _4698 * _4524;
    float _4718 = fma(_3861, _3905, _4684);
    float _4720 = _4692 * _4616;
    float _4722 = _4650 * _4692;
    float _4724 = _4694 * _4616;
    float _4726 = _4698 * _4616;
    float _4728 = _4650 * _4694;
    float _4730 = _4650 * _4698;
    float _4732 = fma(_3835, _3801, _4708);
    float _4734 = fma(_3835, _3799, _4718);
    float _4736 = fma(_4656, _4704, _4722);
    float _4738 = fma(_4704, _4522, _4712);
    float _4740 = fma(_4702, _4522, _4714);
    float _4742 = fma(_4704, _4586, _4720);
    float _4744 = fma(_4702, _4586, _4724);
    float _4746 = fma(_4656, _4702, _4728);
    float _4748 = fma(_4656, _4706, _4730);
    float _4750 = _4598 * _4700;
    float _4752 = fma(_4706, _4522, _4716);
    float _4754 = fma(_4710, _4526, _4738);
    float _4756 = fma(_4658, _4710, _4736);
    float _4758 = fma(_4658, _4732, _4746);
    float _4760 = fma(_4658, _4734, _4748);
    float _4762 = fma(_4732, _4526, _4740);
    float _4764 = in.m_79.x;
    float _4766 = fma(_4734, _4526, _4752);
    float _4768 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4532);
    float _4770 = fma(_4706, _4586, _4726);
    float _4772 = _4750 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4774 = fma(_4710, _4582, _4742);
    float _4776 = _4768 + _4347;
    float _4778 = fma(_4734, _4582, _4770);
    out.m_81.x = _4756;
    out.m_81.y = _4758;
    out.m_81.z = _4760;
    float _4780 = _4776 * 0.5;
    float _4782 = fma(_4732, _4582, _4744);
    out.m_83.x = _4754;
    out.m_83.y = _4762;
    out.m_83.z = _4766;
    out.m_85.z = _4780;
    out.m_85.w = _4347;
    float _4784 = _4760;
    float _4786 = _4758;
    if (!_4636)
    {
        _4784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4788 = _4784;
    out.gl_Position.x = _4405;
    out.gl_Position.y = _4409;
    out.gl_Position.z = _4768;
    out.gl_Position.w = _4347;
    float _4790 = _4788;
    float _4792 = _4788;
    if (!_4636)
    {
        _4786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4794 = _4786;
    out.m_87.x = _4774;
    out.m_87.y = _4782;
    out.m_87.z = _4778;
    float _4796 = -_4417;
    float _4798 = _4796 + 1.0;
    float _4800 = _4798 * _4772;
    float _4802 = precise::clamp(_4800, 0.0, 1.0);
    float _4804 = -_4802;
    float _4806 = fma(_4804, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4808 = _4806 * _4764;
    float _4810 = _4556 * _4435;
    float _4812 = -_4556;
    float _4814 = _4812 + 1.0;
    float _4816 = _4808 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4818 = _4446 * _4810;
    float _4820 = _4446 * _4814;
    out.m_89.x = _4816;
    float _4822 = _4460 * _4810;
    float _4824 = fma(_4456, _4818, _4440);
    float _4826 = fma(_4458, _4818, _4442);
    float _4828 = _4818;
    float _4830 = _4794;
    float _4832 = _4794;
    if (!_4636)
    {
        _4828 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4834 = _4828;
    float _4836 = fma(_4446, _4822, _4444);
    out.m_91.x = _4824;
    out.m_91.y = _4826;
    out.m_91.z = _4836;
    out.m_91.w = _4820;
    bool _4838 = !_4636;
    float _4840 = _4834;
    float _4842 = _4834;
    if (!_4838)
    {
        bool _4844 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4846 = isnan(_4129);
        bool _4848 = _4844 || _4846;
        bool _4850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4852 = _4848 || _4850;
        if (!_4852)
        {
            float _4854 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4856 = _4129 + _4854;
            float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4860 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4858;
            float _4862 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4864 = _4862 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4870 = 1.0 / _4860;
            float _4872 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4874 = _4872 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4876 = _4856 * _4870;
            float _4878 = precise::clamp(_4876, 0.0, 1.0);
            float _4880 = fma(_4878, _4864, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4882 = fma(_4878, _4868, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4884 = fma(_4878, _4874, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4832 = _4882;
            _4792 = _4880;
            _4842 = _4884;
            _4886 = true;
        }
        else
        {
            bool _4888 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4890 = isnan(_4129);
            bool _4892 = _4888 || _4890;
            bool _4894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4896 = _4892 || _4894;
            if (!_4896)
            {
                _4790 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4898 = _4790;
            _4792 = _4898;
            if (!_4896)
            {
                _4830 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4900 = _4830;
            _4832 = _4900;
            if (!_4896)
            {
                _4840 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4902 = _4840;
            bool _4904 = !_4896;
            _4842 = _4902;
            if (!_4904)
            {
                bool _4906 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4908 = isnan(_4129);
                bool _4910 = _4906 || _4908;
                bool _4912 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4914 = _4910 || _4912;
                if (!_4914)
                {
                    float _4916 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4918 = _4129 + _4916;
                    float _4920 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4922 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4920;
                    float _4924 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4926 = _4924 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4928 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4930 = _4928 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4932 = 1.0 / _4922;
                    float _4934 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4936 = _4934 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4938 = _4918 * _4932;
                    float _4940 = precise::clamp(_4938, 0.0, 1.0);
                    float _4942 = fma(_4940, _4926, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4944 = fma(_4940, _4930, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4946 = fma(_4940, _4936, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4832 = _4944;
                    _4792 = _4942;
                    _4842 = _4946;
                    _4886 = true;
                }
                else
                {
                    _4832 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4792 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4842 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4886 = false;
    float _4948 = _4832;
    float _4950 = _4792;
    float _4952 = _4842;
    float _4954 = _4948 * 0.586610972881317138671875;
    bool _4956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = 1.0;
    float _4958 = fma(_4950, 0.298911988735198974609375, _4954);
    out.m_93.x = 0.0;
    float _4960 = fma(_4952, 0.114477999508380889892578125, _4958);
    float _4962 = -_4960;
    float _4964 = _4962 + _4950;
    float _4966 = -_4960;
    float _4968 = _4966 + _4948;
    float _4970 = -_4960;
    float _4972 = _4970 + _4952;
    float _4974 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4976 = fma(_4964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    float _4978 = fma(_4968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    float _4980 = fma(_4972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    out.m_89.w = _4974;
    out.m_95.x = _4976;
    out.m_95.y = _4978;
    out.m_95.z = _4980;
    if (!_4956)
    {
        return out;
    }
    float _4982 = -_4101;
    float _4984 = _4982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4986 = -_4103;
    float _4988 = _4986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4990 = -_4105;
    float _4992 = _4990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4994 = _4984 * _4984;
    float _4996 = fma(_4988, _4988, _4994);
    float _4998 = fma(_4992, _4992, _4996);
    float _5000 = sqrt(_4998);
    float _5002 = rsqrt(_4998);
    float _5004 = -_5000;
    float _5006 = _5004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5008 = _5006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5010 = precise::clamp(_5008, 0.0, 1.0);
    float _5012 = _4988 * _5002;
    float _5014 = _4984 * _5002;
    float _5016 = abs(_5010);
    float _5018 = log2(_5016);
    float _5020 = _4992 * _5002;
    float _5022 = _5012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5024 = _4782 * _5014;
    float _5026 = -_5014;
    float _5028 = -_5022;
    float _5030 = fma(_5026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5028);
    float _5032 = fma(_4774, _5012, _5024);
    float _5034 = -_5020;
    float _5036 = fma(_5034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5030);
    float _5038 = fma(_4778, _5020, _5032);
    float _5040 = precise::clamp(_5038, 0.0, 1.0);
    float _5042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5044 = _5036 + _5042;
    float _5046 = _5018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5048 = _5044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5050 = precise::clamp(_5048, 0.0, 1.0);
    float _5052 = exp2(_5046);
    float _5054 = _5052 * _5050;
    float _5056 = _5040 * _5054;
    float _5058 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5060 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5062 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _5058;
    out.m_93.y = _5060;
    out.m_93.z = _5062;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4886 = false;
    bool _672 = false;
    bool _530 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _5119 = as_type<float>(_130);
        out.gl_Position.z = _5119;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5189 = as_type<float>(_168);
        out.gl_Position.z = _5189;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = 1.0 / _236;
    float _244 = 1.0 / _232;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    float _266 = _208 * _242;
    bool _268 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_200);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_200);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -_258;
    float _302 = _300 + 1.0;
    float _304 = -_278;
    float _306 = _304 + 1.0;
    float _308 = _228 * _244;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _314;
    float _318 = _294 * _306;
    float _320 = fma(_282, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_316, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = _278 * _302;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _322 * _318;
    float _334 = _324 * _318;
    float _336 = _320 * _318;
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_298, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_344, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_330, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_356, _326, _346);
    float _372 = fma(_354, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = fma(_358, _326, _348);
    float _380 = fma(_360, _326, _350);
    float _382 = fma(_372, _264, _370);
    float _384 = fma(_374, _264, _378);
    float _386 = fma(_376, _264, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_114);
        float _418 = 1.0 / _416;
        float _420 = _148 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_55.x;
    float _426 = in.m_55.y;
    float _428 = in.m_55.z;
    bool _430 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _432 = isnan(_422);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _448 = isnan(_422);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _422 + _462;
    float _466 = -_440;
    float _468 = _466 + 1.0;
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _472 = 1.0 / _444;
    float _474 = _456 * _468;
    float _476 = -_456;
    float _478 = _476 + 1.0;
    float _480 = _390 * _426;
    float _482 = _392 * _428;
    float _484 = _460 * _472;
    float _486 = _388 * _424;
    float _488 = fma(_484, _464, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _490 = _488 * _474;
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[116].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _502;
    out.m_57.y = _504;
    out.m_57.z = _506;
    out.m_57.w = _508;
    bool _510 = !_470;
    float _528;
    if (!_510)
    {
        float _512 = in.m_53.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_114);
        float _534 = 1.0 / _532;
        float _536 = _148 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _542 = _538 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _550 = isnan(_538);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _564 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _566 = isnan(_538);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _576;
    bool _580 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _582 = isnan(_538);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _600 = _574 * _596;
    float _602 = -_574;
    float _604 = _602 + 1.0;
    float _606 = 1.0 / _562;
    float _608 = _578 * _592;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _614 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _616 = _612 * _606;
    float _618 = _614 * _600;
    float _620 = -_590;
    float _622 = _620 + 1.0;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _626 = _538 + _624;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[131].x, _618);
    float _630 = _558 * _622;
    float _632 = fma(_616, _626, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _636 = fma(_632, _630, _628);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[133].x, _636);
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _644;
    out.m_59.y = _646;
    out.m_59.z = _648;
    out.m_59.w = _650;
    bool _652 = !_598;
    float _670;
    if (!_652)
    {
        float _654 = in.m_53.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_114);
        float _676 = 1.0 / _674;
        float _678 = _148 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _684 = int(_682);
    float _686 = in.m_53.x;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _690 = _680 + _688;
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _696 = _694 != 0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _700 = _680 + _698;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _704 = int(_702);
    float _706 = in.m_53.z;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _714 = _712 != 0;
    float _716 = in.m_61.x;
    float _718 = float(_114);
    float _720 = float(_684);
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _724 = int(_722);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _730 = float(_704);
    float _732 = 1.0 / _720;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _744 = int(_742);
    float _746 = float(uint(_724));
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _752 = ~_724;
    int _754 = _752 + 1;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _756;
    bool _760 = _706 > 0.5;
    float _762 = 0.0;
    float _764 = _730;
    bool _766 = _696;
    float _768 = _716;
    if (!_710)
    {
        _762 = _716;
    }
    float _770 = _762;
    float _772 = 1.0 / _730;
    float _774 = _732 * _148;
    int _776 = _724 + (-1);
    bool _778 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _780 = isnan(_680);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _792 = int(_790);
    float _794 = float(_744);
    float _796 = _770;
    if (_696)
    {
        _764 = 1.0;
    }
    float _798 = _764;
    float _800 = _798;
    if (!_696)
    {
        _800 = 7.345489978790283203125;
    }
    float _802 = _800;
    float _804 = 1.0 / _746;
    float _806 = _772 * _148;
    float _808 = _802 * _686;
    float _810 = trunc(_774);
    int _812 = int(_810);
    float _814 = float(uint(_792));
    int _816 = ~_792;
    int _818 = _816 + 1;
    int _820 = ~_792;
    int _822 = _820 + 1;
    float _824 = float(_792);
    float _826 = 1.0 / _794;
    int _828 = as_type<int>(_804) + (-2);
    float _830 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _832 = int(_830);
    float _834 = float(uint(_812));
    float _836 = as_type<float>(_828) * _834;
    float _838 = 1.0 / _814;
    float _840 = trunc(_806);
    int _842 = int(_840);
    float _844 = _826 * _148;
    float _846 = float(uint(_832));
    int _848 = ~_724;
    int _850 = _848 + 1;
    int _852 = ~_832;
    int _854 = _852 + 1;
    float _856 = 1.0 / _846;
    int _858 = as_type<int>(_838) + (-2);
    int _860 = ~_832;
    int _862 = _860 + 1;
    float _864 = float(_832);
    float _866 = trunc(_844);
    int _868 = int(_866);
    float _870 = float(uint(_842));
    float _872 = in.m_53.w;
    float _874 = float(_842);
    float _876 = as_type<float>(_858) * _870;
    float _878 = trunc(_836);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    int _885 = as_type<int>(_856) + (-2);
    float _887 = float(uint(_868));
    float _889 = trunc(_876);
    float _891 = precise::max(_889, 0.0);
    uint _893 = uint(_891);
    float _895 = as_type<float>(_885) * _887;
    float _897 = _887;
    int _899 = _885;
    if (_696)
    {
        _897 = _686;
    }
    float _901 = _897;
    int _903 = _850 * int(_883);
    int _905 = _903 + _812;
    float _907 = trunc(_895);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    float _913 = _901;
    float _915 = as_type<float>(_905);
    if (!_696)
    {
        _913 = _692;
    }
    float _917 = _913;
    float _919 = float(uint(_905));
    float _921 = _917;
    if (_696)
    {
        _915 = 1.0;
    }
    float _923 = _915;
    float _925 = floor(_808);
    float _927 = as_type<float>(_828) * _919;
    float _929 = _923;
    if (!_696)
    {
        _929 = 1.2345600128173828125;
    }
    float _931 = _929;
    int _933 = _818 * int(_893);
    int _935 = _933 + _842;
    float _937 = trunc(_927);
    float _939 = precise::max(_937, 0.0);
    uint _941 = uint(_939);
    int _943 = _854 * int(_911);
    int _945 = _943 + _868;
    float _947 = _917 * _931;
    float _949 = as_type<float>(_935);
    if (_696)
    {
        _921 = _686;
    }
    float _951 = _921;
    float _953 = float(uint(_935));
    float _955 = _951;
    if (_696)
    {
        _949 = 1.0;
    }
    float _957 = _949;
    float _959 = floor(_947);
    float _961 = float(uint(_945));
    float _963 = as_type<float>(_858) * _953;
    float _965 = _957;
    int _967 = as_type<int>(_963);
    float _969 = _961;
    if (!_696)
    {
        _955 = _706;
    }
    float _971 = _955;
    float _973 = in.m_61.y;
    int _975 = as_type<int>(_971);
    if (!_696)
    {
        _965 = 5.839270114898681640625;
    }
    float _977 = _965;
    float _979 = as_type<float>(_885) * _961;
    if (_710)
    {
        bool _981 = _686 > 0.5;
        _766 = _981;
    }
    bool _983 = _766;
    float _985 = trunc(_963);
    float _987 = precise::max(_985, 0.0);
    uint _989 = uint(_987);
    int _991 = int(_883) + int(_941);
    float _993 = _971 * _977;
    if (_710)
    {
        float _995 = -_716;
        float _997 = _995 + 1.0;
        _975 = as_type<int>(_997);
    }
    int _999 = _975;
    float _1001 = -_925;
    float _1003 = _808 + _1001;
    int _1005 = _754 * _991;
    int _1007 = _1005 + _812;
    float _1009 = float(_724);
    float _1011 = trunc(_979);
    float _1013 = precise::max(_1011, 0.0);
    uint _1015 = uint(_1013);
    if (_710)
    {
        float _1017 = _983 ? as_type<float>(_999) : _716;
        _796 = _1017;
    }
    float _1019 = _796;
    if (_714)
    {
        float _1021 = -_716;
        float _1023 = _1021 + 1.0;
        _967 = as_type<int>(_1023);
    }
    int _1025 = _967;
    if (!_714)
    {
        _969 = _716;
    }
    float _1027 = _969;
    float _1029 = -_959;
    float _1031 = _947 + _1029;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1043 = _1041 != 0;
    bool _1045 = uint(_1007) >= uint(_724);
    float _1047 = floor(_993);
    float _1049 = float(_812);
    float _1051 = _1027;
    if (_714)
    {
        float _1053 = _760 ? as_type<float>(_1025) : _716;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = -_973;
    float _1059 = _1057 + 1.0;
    bool _1061 = !_1043;
    int _1063 = _1061 ? 0 : 1;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1067 = _1065 != 0;
    float _1069 = 1.0 / _718;
    bool _1071 = _1049 >= _1009;
    bool _1073 = isnan(_1049);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_1009);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1085 = _1083 != 0;
    bool _1087 = _692 > 0.5;
    int _1089 = int(_893) + int(_989);
    float _1091 = trunc(_1081);
    int _1093 = int(_1091);
    int _1095 = int(_911) + int(_1015);
    float _1097 = -_1047;
    float _1099 = _993 + _1097;
    bool _1101 = !_1067;
    int _1103 = _1101 ? 0 : 1;
    int _1105 = _822 * _1089;
    int _1107 = _1105 + _842;
    bool _1109 = !_1085;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _862 * _1095;
    int _1115 = _1113 + _868;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1119 = _1117 != 0;
    float _1121 = 1.0 / _728;
    int _1123 = _1087 ? as_type<int>(_1059) : as_type<int>(_973);
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1127 = _1125 != 0;
    bool _1129 = !_1045;
    int _1131 = _1129 ? 0 : (-1);
    float _1133 = _1119 ? as_type<float>(_1123) : _973;
    float _1135 = 1.0 / _736;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1143 = _1141 != 0;
    int _1145 = ~_991;
    int _1147 = _1145 + _1131;
    int _1149 = _1147 + 1;
    bool _1151 = !_1127;
    int _1153 = _1151 ? 0 : 1;
    bool _1155 = uint(_1107) >= uint(_792);
    int _1157 = _724 * _1149;
    int _1159 = _1157 + _812;
    bool _1161 = !_1143;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = 1.0 / _740;
    bool _1167 = _724 == 0;
    bool _1169 = _874 >= _824;
    bool _1171 = isnan(_874);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan(_824);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = _1003 * _1009;
    bool _1183 = !_1155;
    int _1185 = _1183 ? 0 : (-1);
    float _1187 = _1009 * _148;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1195 = _1193 != 0;
    float _1197 = 1.0 / _750;
    int _1199 = ~_1093;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    bool _1205 = !_1167;
    int _1207 = _1205 ? _1159 : (-1);
    bool _1209 = !_1139;
    int _1211 = _1209 ? 0 : 1;
    bool _1213 = !_1191;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = trunc(_1179);
    int _1219 = int(_1217);
    int _1221 = _1207 * _1203;
    bool _1223 = uint(_1115) >= uint(_832);
    float _1225 = _824 * _1031;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1229 = _1227 != 0;
    float _1231 = _1187 * _1069;
    float _1233 = _1069 * _148;
    bool _1235 = !_1039;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = trunc(_1181);
    int _1241 = int(_1239);
    bool _1243 = !_1035;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _824 * _1233;
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1251 = _1249 != 0;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1255 = _1253 != 0;
    int _1257 = _1093 * _776;
    int _1259 = _1257 + _1221;
    int _1261 = ~_1089;
    int _1263 = _1261 + _1185;
    int _1265 = _1263 + 1;
    float _1267 = _864 * _1233;
    float _1269 = float(_868);
    float _1271 = trunc(_1225);
    int _1273 = int(_1271);
    int _1275 = abs(_1237);
    int _1277 = _792 * _1265;
    int _1279 = _1277 + _842;
    bool _1281 = !_1255;
    int _1283 = _1281 ? 0 : 1;
    float _1285 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1287 = _792 == 0;
    bool _1289 = _1269 >= _864;
    bool _1291 = isnan(_1269);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan(_864);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = trunc(_1231);
    int _1303 = int(_1301);
    float _1305 = _864 * _1099;
    int _1307 = abs(_1111);
    int _1309 = abs(_1153);
    int _1311 = abs(_1245);
    int _1313 = _1241 * _1307;
    int _1315 = _1313 + _812;
    float _1317 = trunc(_1247);
    int _1319 = int(_1317);
    int _1321 = ~_1219;
    int _1323 = _1321 + 1;
    int _1325 = _1323 + 1;
    int _1327 = _1273 * _1309;
    int _1329 = _1327 + _842;
    bool _1331 = !_1287;
    int _1333 = _1331 ? _1279 : (-1);
    int _1335 = _1259 * _1275;
    int _1337 = abs(_1163);
    int _1339 = _1325 * _1333;
    int _1341 = abs(_1063);
    int _1343 = _1303 * _1311;
    int _1345 = _1343 + _1335;
    int _1347 = _792 + (-1);
    float _1349 = trunc(_1299);
    int _1351 = int(_1349);
    int _1353 = abs(_1103);
    int _1355 = _1219 * _1347;
    int _1357 = _1355 + _1339;
    int _1359 = abs(_1211);
    int _1361 = _1315 * _1341;
    int _1363 = _1361 + _1345;
    float _1365 = trunc(_1267);
    int _1367 = int(_1365);
    int _1369 = _1357 * _1337;
    int _1371 = abs(_1215);
    int _1373 = _1241 * _1353;
    int _1375 = _1373 + _1363;
    bool _1377 = !_1223;
    int _1379 = _1377 ? 0 : (-1);
    int _1381 = _1319 * _1359;
    int _1383 = _1381 + _1369;
    float _1385 = trunc(_1305);
    int _1387 = int(_1385);
    float _1389 = float(uint(_1375));
    bool _1391 = !_1195;
    int _1393 = _1391 ? 0 : 1;
    int _1395 = _1329 * _1371;
    int _1397 = _1395 + _1383;
    int _1399 = ~_1095;
    int _1401 = _1399 + _1379;
    int _1403 = _1401 + 1;
    float _1405 = as_type<float>(_828) * _1389;
    int _1407 = abs(_1393);
    bool _1409 = !_1229;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = trunc(_1405);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    bool _1419 = !_1251;
    int _1421 = _1419 ? 0 : 1;
    int _1423 = _1273 * _1407;
    int _1425 = _1423 + _1397;
    int _1427 = abs(_1411);
    int _1429 = _832 * _1403;
    int _1431 = _1429 + _868;
    bool _1433 = _832 == 0;
    float _1435 = float(uint(_1425));
    int _1437 = _1387 * _1427;
    int _1439 = _1437 + _868;
    int _1441 = ~_724;
    int _1443 = _1441 + 1;
    int _1445 = ~_1351;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = as_type<float>(_858) * _1435;
    bool _1453 = !_1433;
    int _1455 = _1453 ? _1431 : (-1);
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1459 = _1457 != 0;
    int _1461 = _1443 * int(_1417);
    int _1463 = _1461 + _1375;
    int _1465 = _832 + (-1);
    int _1467 = _1449 * _1455;
    int _1469 = abs(_1283);
    float _1471 = trunc(_1451);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = float(uint(_1463));
    int _1479 = _1351 * _1465;
    int _1481 = _1479 + _1467;
    bool _1483 = !_1459;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = abs(_1421);
    float _1489 = as_type<float>(_828) * _1477;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1493 = _1491 != 0;
    int _1495 = ~_792;
    int _1497 = _1495 + 1;
    int _1499 = _1481 * _1469;
    int _1501 = abs(_1485);
    float _1503 = trunc(_1489);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    bool _1509 = !_1493;
    int _1511 = _1509 ? 0 : 1;
    int _1513 = _1367 * _1487;
    int _1515 = _1513 + _1499;
    int _1517 = abs(_1511);
    bool _1519 = _872 > 0.5;
    int _1521 = _1497 * int(_1475);
    int _1523 = _1521 + _1425;
    int _1525 = _1519 ? as_type<int>(_1059) : as_type<int>(_973);
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1529 = _1527 != 0;
    int _1531 = _1439 * _1501;
    int _1533 = _1531 + _1515;
    float _1535 = float(uint(_1523));
    float _1537 = _1529 ? as_type<float>(_1525) : _973;
    int _1539 = _1387 * _1517;
    int _1541 = _1539 + _1533;
    int _1543 = int(_1417) + int(_1507);
    float _1545 = as_type<float>(_858) * _1535;
    int _1547 = ~_724;
    int _1549 = _1547 + 1;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1553 = _1551 != 0;
    float _1555 = trunc(_1545);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    float _1561 = float(uint(_1541));
    int _1563 = _1549 * _1543;
    int _1565 = _1563 + _1375;
    bool _1567 = _706 > 0.5;
    float _1569 = float(uint(_1315));
    float _1571 = as_type<float>(_885) * _1561;
    bool _1573 = uint(_1565) >= uint(_724);
    int _1575 = ~_832;
    int _1577 = _1575 + 1;
    float _1579 = as_type<float>(_828) * _1569;
    bool _1581 = !_1573;
    int _1583 = _1581 ? 0 : (-1);
    float _1585 = trunc(_1571);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    float _1591 = _973;
    int _1593 = as_type<int>(_1059);
    int _1595 = _1311;
    float _1597 = as_type<float>(_1329);
    if (_1553)
    {
        float _1599 = _1567 ? _1059 : _973;
        _1591 = _1599;
    }
    float _1601 = _1591;
    float _1603 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1607 = _1605 != 0;
    int _1609 = ~_1543;
    int _1611 = _1609 + _1583;
    int _1613 = _1611 + 1;
    int _1615 = int(_1475) + int(_1559);
    float _1617 = trunc(_1579);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = ~_792;
    int _1625 = _1623 + 1;
    int _1627 = _724 * _1613;
    int _1629 = _1627 + _1375;
    int _1631 = ~_724;
    int _1633 = _1631 + 1;
    int _1635 = _1625 * _1615;
    int _1637 = _1635 + _1425;
    bool _1639 = !_1167;
    int _1641 = _1639 ? _1629 : (-1);
    if (_1607)
    {
        float _1643 = -_716;
        float _1645 = _1643 + 1.0;
        _1593 = as_type<int>(_1645);
    }
    int _1647 = _1593;
    int _1649 = _1577 * int(_1589);
    int _1651 = _1649 + _1541;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1657 = _1641 & 3;
    bool _1659 = _1657 != 0;
    if (_1607)
    {
        float _1661 = _1087 ? as_type<float>(_1647) : _716;
        _768 = _1661;
    }
    float _1663 = _768;
    int _1665 = _1641 & 3;
    bool _1667 = _1665 != 0;
    int _1669 = _1633 * int(_1621);
    int _1671 = _1669 + _1315;
    int _1673 = _1659 ? 0 : 1;
    float _1675 = 1.0 / _1655;
    bool _1677 = uint(_1637) >= uint(_792);
    float _1679 = float(uint(_1651));
    bool _1681 = uint(_1665) >= 2u;
    bool _1683 = !_1677;
    int _1685 = _1683 ? 0 : (-1);
    float _1687 = as_type<float>(_885) * _1679;
    int _1689 = _1681 ? 0 : 1;
    bool _1691 = _1665 != 3;
    float _1693 = trunc(_1687);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    bool _1699 = uint(_1665) > 1u;
    int _1701 = ~_1615;
    int _1703 = _1701 + _1685;
    int _1705 = _1703 + 1;
    int _1707 = ~_1689;
    int _1709 = _1707 + 1;
    int _1711 = _1709 + 1;
    int _1713 = ~_1673;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    int _1719 = _792 * _1705;
    int _1721 = _1719 + _1425;
    float _1723 = float(uint(_1439));
    int _1725 = _1711;
    int _1727 = _1717;
    float _1729 = as_type<float>(_1665);
    if (_1691)
    {
        int _1731 = ~_1689;
        int _1733 = _1731 + 1;
        _1725 = _1733;
    }
    int _1735 = _1725;
    bool _1737 = !_1287;
    int _1739 = _1737 ? _1721 : (-1);
    float _1741 = as_type<float>(_885) * _1723;
    if (!_1699)
    {
        int _1743 = ~_1673;
        int _1745 = _1743 + 1;
        _1727 = _1745;
    }
    int _1747 = _1727;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1751 = _1749 != 0;
    float _1753 = in.m_46.x;
    float _1755 = in.m_46.y;
    float _1757 = in.m_46.z;
    int _1759 = _1739 & 3;
    bool _1761 = _1759 != 0;
    bool _1763 = !_1751;
    int _1765 = _1763 ? 0 : 1;
    bool _1767 = uint(_1759) >= 2u;
    int _1769 = _1761 ? 0 : 1;
    int _1771 = int(_1589) + int(_1697);
    bool _1773 = _1759 != 3;
    int _1775 = _1767 ? 0 : 1;
    bool _1777 = uint(_1759) > 1u;
    int _1779 = ~_832;
    int _1781 = _1779 + 1;
    int _1783 = ~_1775;
    int _1785 = _1783 + 1;
    int _1787 = _1785 + 1;
    int _1789 = ~_1769;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    int _1795 = _1781 * _1771;
    int _1797 = _1795 + _1541;
    float _1799 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1801 = _1787;
    int _1803 = _1793;
    float _1805 = as_type<float>(_1759);
    if (_1773)
    {
        int _1807 = ~_1775;
        int _1809 = _1807 + 1;
        _1801 = _1809;
    }
    int _1811 = _1801;
    float _1813 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1815 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1799);
    bool _1817 = uint(_1797) >= uint(_832);
    float _1819 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1813);
    if (!_1777)
    {
        int _1821 = ~_1769;
        int _1823 = _1821 + 1;
        _1803 = _1823;
    }
    int _1825 = _1803;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1829 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1819);
    bool _1831 = !_1817;
    int _1833 = _1831 ? 0 : (-1);
    float _1835 = -_1827;
    float _1837 = fma(_1603, 2.0, _1835);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1841 = _1839 != 0;
    float _1843 = _1829 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1847 = _1845 != 0;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1851 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1853 = float(uint(_1329));
    float _1855 = fma(_1285, -2.0, _1849);
    float _1857 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1851);
    float _1859 = float(uint(_1671));
    float _1861 = as_type<float>(_858) * _1853;
    float _1863 = trunc(_1741);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1877 = as_type<float>(_828) * _1859;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1879;
    float _1883 = _1871 * _1675;
    float _1885 = _1875 * _1121;
    float _1887 = trunc(_1861);
    float _1889 = precise::max(_1887, 0.0);
    uint _1891 = uint(_1889);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1893;
    int _1897 = ~_832;
    int _1899 = _1897 + 1;
    float _1901 = _1881 * _1135;
    int _1903 = ~_792;
    int _1905 = _1903 + 1;
    float _1907 = _1895 * _1165;
    int _1909 = ~_724;
    int _1911 = _1909 + 1;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1917 = trunc(_1877);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    int _1923 = _1899 * int(_1867);
    int _1925 = _1923 + _1439;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1929 = _1927 != 0;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1935 = ~_1771;
    int _1937 = _1935 + _1833;
    int _1939 = _1937 + 1;
    float _1941 = _686 + _692;
    float _1943 = float(uint(_1925));
    float _1945 = _1933 * _1197;
    int _1947 = _1905 * int(_1891);
    int _1949 = _1947 + _1329;
    float _1951 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1857);
    float _1953 = _1941 + (-1.0);
    float _1955 = float(uint(_1949));
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_1929)
    {
        _1595 = 0;
    }
    int _1961 = _1595;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1967 = int(_1621) + int(_1921);
    float _1969 = as_type<float>(_858) * _1955;
    float _1971 = as_type<float>(_885) * _1943;
    int _1973 = _832 * _1939;
    int _1975 = _1973 + _1541;
    float _1977 = _686 * 2.0;
    int _1979 = _1961;
    if (_1929)
    {
        _899 = 0;
    }
    int _1981 = _899;
    int _1983 = _1911 * _1967;
    int _1985 = _1983 + _1315;
    bool _1987 = !_1841;
    int _1989 = _1987 ? 0 : 1;
    float _1991 = 1.0 / _1959;
    bool _1993 = !_1433;
    int _1995 = _1993 ? _1975 : (-1);
    float _1997 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1999 = uint(_1985) >= uint(_724);
    float _2001 = _1951 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2003 = _1981;
    if (!_1929)
    {
        _2003 = 1;
    }
    int _2005 = _2003;
    float _2007 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1855);
    if (!_1929)
    {
        _1979 = 2;
    }
    int _2009 = _1979;
    float _2011 = floor(_1977);
    int _2013 = _1995 & 3;
    bool _2015 = _2013 != 0;
    bool _2017 = !_1847;
    int _2019 = _2017 ? 0 : 1;
    bool _2021 = _2013 != 3;
    bool _2023 = !_1999;
    int _2025 = _2023 ? 0 : (-1);
    float _2027 = trunc(_1969);
    float _2029 = precise::max(_2027, 0.0);
    uint _2031 = uint(_2029);
    bool _2033 = uint(_2013) >= 2u;
    float _2035 = _1915 * _1991;
    bool _2037 = !_1667;
    int _2039 = _2037 ? 0 : 1;
    int _2041 = _2033 ? 0 : 1;
    float _2043 = fma(_2035, _690, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2045 = uint(_2013) > 1u;
    float _2047 = trunc(_1971);
    float _2049 = precise::max(_2047, 0.0);
    uint _2051 = uint(_2049);
    int _2053 = ~_2041;
    int _2055 = _2053 + 1;
    int _2057 = _2055 + 1;
    int _2059 = _2057;
    if (_2021)
    {
        int _2061 = ~_2041;
        int _2063 = _2061 + 1;
        _2059 = _2063;
    }
    int _2065 = _2059;
    int _2067 = _2015 ? 0 : 1;
    bool _2069 = _2011 > 0.0;
    float _2071 = 1.0 / _1965;
    bool _2073 = _2011 >= 0.0;
    bool _2075 = isnan(_2011);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan(0.0);
    bool _2081 = _2077 || _2079;
    int _2083 = ~_792;
    int _2085 = _2083 + 1;
    int _2087 = int(_1891) + int(_2031);
    float _2089 = _692 * 2.0;
    float _2091 = _706 * 2.0;
    int _2093 = int(_1867) + int(_2051);
    float _2095 = _692 + _706;
    float _2097 = floor(_2089);
    int _2099 = abs(_2039);
    int _2101 = _2085 * _2087;
    int _2103 = _2101 + _1329;
    float _2105 = _758 * _2071;
    int _2107 = ~_2067;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _2095 + (-1.0);
    int _2115 = _2111;
    if (!_2045)
    {
        int _2117 = ~_2067;
        int _2119 = _2117 + 1;
        _2115 = _2119;
    }
    int _2121 = _2115;
    float _2123 = floor(_2091);
    int _2125 = ~_832;
    int _2127 = _2125 + 1;
    float _2129 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2131 = uint(_2103) >= uint(_792);
    float _2133 = fma(_2105, _700, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2135 = ~_1967;
    int _2137 = _2135 + _2025;
    int _2139 = _2137 + 1;
    int _2141 = _2127 * _2093;
    int _2143 = _2141 + _1439;
    bool _2145 = !_2131;
    int _2147 = _2145 ? 0 : (-1);
    int _2149 = _2081 ? 0 : 1;
    int _2151 = _724 * _2139;
    int _2153 = _2151 + _1315;
    bool _2155 = uint(_2143) >= uint(_832);
    bool _2157 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2159 = isnan(_680);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    bool _2169 = !_2155;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = ~_2149;
    int _2175 = _2173 + 1;
    int _2177 = _2175 + 1;
    float _2179 = -_2167;
    float _2181 = _2179 + 1.0;
    bool _2183 = _2097 > 0.0;
    bool _2185 = _2097 >= 0.0;
    bool _2187 = isnan(_2097);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(0.0);
    bool _2193 = _2189 || _2191;
    int _2195 = _2177;
    if (!_2069)
    {
        int _2197 = ~_2149;
        int _2199 = _2197 + 1;
        _2195 = _2199;
    }
    int _2201 = _2195;
    float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2205 = _680 + _2203;
    bool _2207 = !_1167;
    int _2209 = _2207 ? _2153 : (-1);
    float _2211 = fma(_1757, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1815);
    bool _2213 = _2123 > 0.0;
    bool _2215 = _2123 >= 0.0;
    bool _2217 = isnan(_2123);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(0.0);
    bool _2223 = _2219 || _2221;
    float _2225 = _2211 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2227 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2229 = isnan(_680);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    bool _2239 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2241 = isnan(_680);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    bool _2251 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2253 = isnan(_680);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2259 = _2255 || _2257;
    float _2261 = float(_2259);
    float _2263 = _2237 * _2181;
    float _2265 = -_2237;
    float _2267 = _2265 + 1.0;
    float _2269 = -_2249;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_1883, _2205, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2277 = _680 + _2275;
    float _2279 = _2249 * _2267;
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2283 = _680 + _2281;
    float _2285 = _788 * _2271;
    float _2287 = -_788;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_1885, _2277, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2293 = fma(_1901, _2283, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2297 = _680 + _2295;
    bool _2299 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2301 = isnan(_680);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2307 = _2303 || _2305;
    float _2309 = float(_2307);
    float _2311 = _2261 * _2289;
    float _2313 = -_2261;
    float _2315 = _2313 + 1.0;
    float _2317 = fma(_1945, _2297, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2321 = _680 + _2319;
    bool _2323 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2325 = isnan(_680);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2331);
    float _2335 = _2309 * _2315;
    float _2337 = -_2309;
    float _2339 = _2337 + 1.0;
    float _2341 = fma(_1907, _2321, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2343 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2345 = isnan(_680);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    float _2355 = -_2333;
    float _2357 = _2355 + 1.0;
    float _2359 = _2333 * _2339;
    int _2361 = _2193 ? 0 : 1;
    bool _2363 = _2009 != 2;
    float _2365 = _2353 * _2357;
    float _2367 = -_2353;
    float _2369 = _2367 + 1.0;
    int _2371 = ~_2087;
    int _2373 = _2371 + _2147;
    int _2375 = _2373 + 1;
    float _2377 = _2273 * _2365;
    int _2379 = ~_2093;
    int _2381 = _2379 + _2171;
    int _2383 = _2381 + 1;
    int _2385 = ~_2361;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    float _2391 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2377);
    int _2393 = _792 * _2375;
    int _2395 = _2393 + _1329;
    int _2397 = _2389;
    float _2399 = _2359;
    if (!_2183)
    {
        int _2401 = ~_2361;
        int _2403 = _2401 + 1;
        _2397 = _2403;
    }
    int _2405 = _2397;
    int _2407 = _832 * _2383;
    int _2409 = _2407 + _1439;
    float _2411 = fma(_2291, _2359, _2391);
    if (_2363)
    {
        _1597 = _686;
    }
    float _2413 = _1597;
    float _2415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2417 = _2225 + _2415;
    bool _2419 = _2005 != 1;
    float _2421 = fma(_2293, _2335, _2411);
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2425 = _2001 + _2423;
    float _2427 = _2413;
    if (!_2363)
    {
        _2427 = _706;
    }
    float _2429 = _2427;
    float _2431 = fma(_2317, _2311, _2421);
    int _2433 = _2223 ? 0 : 1;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2437 = !_1287;
    int _2439 = _2437 ? _2395 : (-1);
    float _2441 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2443 = !_1433;
    int _2445 = _2443 ? _2409 : (-1);
    float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2449 = _1843 + _2447;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2453 = _2451 != 0;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2457 = _2455 != 0;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2461 = _2459 != 0;
    float _2463 = -_2435;
    float _2465 = fma(_2441, 2.0, _2463);
    int _2467 = _1641 >> 31;
    float _2469 = _2449 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2471 = _1739 & 3;
    bool _2473 = _2471 != 0;
    float _2475 = fma(_2341, _2285, _2431);
    int _2477 = _2467 & 3;
    float _2479 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2469);
    bool _2481 = !_2473;
    int _2483 = _2481 ? 0 : 1;
    float _2485 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2487 = int(_2485);
    int _2489 = _1995 & 3;
    bool _2491 = _2489 != 0;
    float _2493 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2479);
    int _2495 = _1739 >> 31;
    float _2497 = fma(_2043, _2279, _2475);
    int _2499 = _1641 + _2477;
    int _2501 = _1995 >> 31;
    float _2503 = fma(_2133, _2263, _2497);
    bool _2505 = !_2491;
    int _2507 = _2505 ? 0 : 1;
    int _2509 = _2495 & 3;
    float _2511 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2503);
    bool _2513 = _1665 != 3;
    int _2515 = _2499 >> 2;
    int _2517 = _2501 & 3;
    out.m_63.x = _2511;
    int _2519 = _1739 + _2509;
    bool _2521 = !_2513;
    int _2523 = _2521 ? 0 : (-1);
    bool _2525 = _1759 != 3;
    int _2527 = _2515 << 4;
    int _2529 = _2527 + 368;
    int _2531 = _1995 + _2517;
    int _2533 = ~_2433;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    int _2539 = _2519 >> 2;
    int _2541 = _2537;
    if (!_2213)
    {
        int _2543 = ~_2433;
        int _2545 = _2543 + 1;
        _2541 = _2545;
    }
    int _2547 = _2541;
    bool _2549 = !_2525;
    int _2551 = _2549 ? 0 : (-1);
    uint _2553 = uint(int(uint(_2529) >> uint(2)));
    uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
    int _2557 = int(_2553) & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = int(_2553) + 1;
    uint _2563 = uint(int(uint(_2561) >> uint(2)));
    int _2565 = _2561 & 3;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[int(_2563)][_2565];
    bool _2569 = _2013 != 3;
    int _2571 = _2539 << 4;
    int _2573 = _2571 + 512;
    int _2575 = _2531 >> 2;
    uint _2577 = uint(int(uint(_2573) >> uint(2)));
    uint _2579 = uint(int(uint(int(_2577)) >> uint(2)));
    int _2581 = int(_2577) & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    int _2585 = int(_2577) + 1;
    uint _2587 = uint(int(uint(_2585) >> uint(2)));
    int _2589 = _2585 & 3;
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[int(_2587)][_2589];
    int _2593 = _2575 << 4;
    int _2595 = _2593 + 656;
    if (!_2419)
    {
        _1729 = _706;
    }
    float _2597 = _1729;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2601 = _2597;
    if (_2419)
    {
        _2601 = _692;
    }
    float _2603 = _2601;
    int _2605 = abs(_1825);
    uint _2607 = uint(int(uint(_2595) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    if (!_2419)
    {
        _1805 = _692;
    }
    float _2623 = _1805;
    float _2625 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2599);
    bool _2627 = !_2569;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _2493 >= 0.0;
    float _2633 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2625);
    int _2635 = abs(_1747);
    int _2637 = _2529 + 8;
    uint _2639 = uint(int(uint(_2637) >> uint(2)));
    uint _2641 = uint(int(uint(int(_2639)) >> uint(2)));
    int _2643 = int(_2639) & 3;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[int(_2641)][_2643];
    int _2647 = int(_2639) + 1;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    int _2651 = _2647 & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    float _2655 = _2623;
    if (!_2419)
    {
        _2399 = _2623;
    }
    float _2657 = _2399;
    float _2659 = _2657;
    if (_2419)
    {
        _2655 = _686;
    }
    float _2661 = _2655;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2665 = ~_2635;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = _2595 + 8;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    if (_2419)
    {
        _2659 = _686;
    }
    float _2689 = _2659;
    float _2691 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2663);
    if (_2631)
    {
        out.m_49.x = 0.0;
    }
    int _2693 = ~_2099;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    float _2699 = _2689 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2701 = ~_2605;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = _2573 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2727 = abs(_2483);
    int _2729 = abs(_2121);
    int _2731 = abs(_2507);
    int _2733 = _2669 * as_type<int>(_2567);
    float _2735 = -_2725;
    float _2737 = fma(_2699, 2.0, _2735);
    int _2739 = abs(_1811);
    int _2741 = _2697 * as_type<int>(_2559);
    int _2743 = _2741 + _2733;
    int _2745 = abs(_1735);
    float _2747 = -_148;
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2737);
    int _2751 = _2705 * as_type<int>(_2591);
    int _2753 = ~_2729;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    float _2759 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2761 = int(_2759);
    int _2763 = ~_2727;
    int _2765 = _2763 + 1;
    int _2767 = _2765 + 1;
    int _2769 = ~_2731;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = _2757 * as_type<int>(_2621);
    int _2777 = ~_2745;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    int _2783 = _2767 * as_type<int>(_2583);
    int _2785 = _2783 + _2751;
    int _2787 = abs(_2065);
    int _2789 = _2773 * as_type<int>(_2613);
    int _2791 = _2789 + _2775;
    int _2793 = abs(_2523);
    float _2795 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2797 = int(_2795);
    int _2799 = ~_2787;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = _2781 * as_type<int>(_2645);
    int _2807 = _2805 + _2743;
    int _2809 = ~_2739;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    int _2815 = abs(_2551);
    int _2817 = ~_2793;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = abs(_2629);
    int _2825 = _2803 * as_type<int>(_2679);
    int _2827 = _2825 + _2791;
    float _2829 = float(uint(_2761));
    int _2831 = _2821 * as_type<int>(_2653);
    int _2833 = _2831 + _2807;
    int _2835 = abs(_1765);
    int _2837 = ~_2815;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    float _2843 = 1.0 / _2829;
    int _2845 = ~_2823;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    int _2851 = _2813 * as_type<int>(_2715);
    int _2853 = _2851 + _2785;
    int _2855 = abs(_1989);
    float _2857 = float(uint(_2487));
    int _2859 = _2841 * as_type<int>(_2723);
    int _2861 = _2859 + _2853;
    int _2863 = abs(_2487);
    int _2865 = _2849 * as_type<int>(_2687);
    int _2867 = _2865 + _2827;
    float _2869 = 1.0 / _2857;
    int _2871 = ~_2855;
    int _2873 = _2871 + 1;
    int _2875 = _2873 + 1;
    int _2877 = ~_2835;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = float(uint(_2797));
    int _2885 = _2875 * _2861;
    int _2887 = abs(_2019);
    int _2889 = abs(_2797);
    int _2891 = _2833 * _2881;
    float _2893 = 1.0 / _2883;
    int _2895 = _2439 * _2855;
    int _2897 = _2895 + _2885;
    int _2899 = _2209 * _2835;
    int _2901 = _2899 + _2891;
    int _2903 = abs(_2761);
    float _2905 = float(uint(_2863));
    int _2907 = ~_2887;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = float(uint(_2889));
    float _2915 = float(uint(_2903));
    float _2917 = 1.0 / _2905;
    int _2919 = _2911 * _2867;
    int _2921 = as_type<int>(_2869) + (-2);
    float _2923 = float(uint(_2901));
    int _2925 = _2445 * _2887;
    int _2927 = _2925 + _2919;
    int _2929 = as_type<int>(_2843) + (-2);
    float _2931 = 1.0 / _2915;
    float _2933 = float(uint(_2897));
    float _2935 = as_type<float>(_2921) * _2923;
    int _2937 = ~_2797;
    int _2939 = _2937 + 1;
    int _2941 = as_type<int>(_2893) + (-2);
    float _2943 = as_type<float>(_2929) * _2933;
    float _2945 = float(uint(_2927));
    float _2947 = 1.0 / _2913;
    int _2949 = abs(_2901);
    float _2951 = as_type<float>(_2941) * _2945;
    int _2953 = as_type<int>(_2917) + (-2);
    int _2955 = abs(_2897);
    float _2957 = trunc(_2935);
    float _2959 = precise::max(_2957, 0.0);
    uint _2961 = uint(_2959);
    float _2963 = float(uint(_2949));
    int _2965 = as_type<int>(_2931) + (-2);
    int _2967 = abs(_2927);
    int _2969 = ~_2487;
    int _2971 = _2969 + 1;
    float _2973 = trunc(_2951);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    int _2979 = as_type<int>(_2947) + (-2);
    float _2981 = as_type<float>(_2953) * _2963;
    bool _2983 = !_2457;
    int _2985 = _2983 ? 0 : 1;
    float _2987 = float(uint(_2955));
    float _2989 = trunc(_2943);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    int _2995 = abs(_2985);
    float _2997 = as_type<float>(_2965) * _2987;
    float _2999 = float(_2201);
    float _3001 = float(uint(_2967));
    float _3003 = trunc(_2981);
    float _3005 = precise::max(_3003, 0.0);
    uint _3007 = uint(_3005);
    int _3009 = _2971 * int(_2961);
    int _3011 = _3009 + _2901;
    int _3013 = ~_2761;
    int _3015 = _3013 + 1;
    float _3017 = as_type<float>(_2979) * _3001;
    float _3019 = float(_2995);
    int _3021 = _2939 * int(_2977);
    int _3023 = _3021 + _2927;
    float _3025 = float(uint(_3011));
    float _3027 = trunc(_2997);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    float _3033 = _2725;
    float _3035 = as_type<float>(_2961);
    if (!_2419)
    {
        _3033 = _706;
    }
    float _3037 = _3033;
    float _3039 = _3019 * _2999;
    int _3041 = _3015 * int(_2993);
    int _3043 = _3041 + _2897;
    float _3045 = _3037;
    if (_2419)
    {
        _3045 = _692;
    }
    float _3047 = _3045;
    float _3049 = as_type<float>(_2921) * _3025;
    float _3051 = float(uint(_3023));
    float _3053 = trunc(_3017);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = ~_2863;
    int _3061 = _3059 + 1;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3065 = _3047 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3067 = float(uint(_3043));
    float _3069 = as_type<float>(_2941) * _3051;
    int _3071 = ~_2889;
    int _3073 = _3071 + 1;
    int _3075 = _3061 * int(_3007);
    int _3077 = _3075 + _2949;
    float _3079 = trunc(_3049);
    float _3081 = precise::max(_3079, 0.0);
    uint _3083 = uint(_3081);
    float _3085 = fma(_3065, -2.0, _3063);
    int _3087 = ~_2903;
    int _3089 = _3087 + 1;
    float _3091 = as_type<float>(_2929) * _3067;
    bool _3093 = !_2453;
    int _3095 = _3093 ? 0 : 1;
    int _3097 = _3089 * int(_3031);
    int _3099 = _3097 + _2955;
    float _3101 = float(uint(_3077));
    int _3103 = _3073 * int(_3057);
    int _3105 = _3103 + _2967;
    int _3107 = abs(_3095);
    float _3109 = trunc(_3091);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = float(_2547);
    float _3117 = as_type<float>(_2953) * _3101;
    float _3119 = float(_3107);
    float _3121 = float(uint(_3099));
    float _3123 = float(uint(_3105));
    float _3125 = trunc(_3117);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    int _3131 = int(_2961) + int(_3083);
    float _3133 = _3119 * _3115;
    float _3135 = as_type<float>(_2965) * _3121;
    float _3137 = _3123;
    if (_2363)
    {
        _3035 = _692;
    }
    float _3139 = _3035;
    float _3141 = as_type<float>(_2979) * _3123;
    float _3143 = _3139;
    if (!_2363)
    {
        _3143 = _686;
    }
    float _3145 = _3143;
    float _3147 = _3133 * (-2.0);
    int _3149 = as_type<int>(_3145);
    if (_2631)
    {
        _3137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3151 = _3137;
    float _3153 = trunc(_3069);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    float _3159 = _3145 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3161 = ~_2487;
    int _3163 = _3161 + 1;
    if (_2631)
    {
        float _3165 = _3151 * 5.0;
        _3149 = as_type<int>(_3165);
    }
    int _3167 = _3149;
    float _3169 = fma(_1997, _3147, _1997);
    int _3171 = ~_2761;
    int _3173 = _3171 + 1;
    float _3175 = in.m_65.x;
    float _3177 = in.m_65.y;
    float _3179 = in.m_65.z;
    float _3181 = trunc(_3135);
    float _3183 = precise::max(_3181, 0.0);
    uint _3185 = uint(_3183);
    if (_2631)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9534 = as_type<float>(_3167);
        out.gl_Position.z = _9534;
    }
    int _3187 = int(_2993) + int(_3113);
    int _3189 = int(_3007) + int(_3129);
    int _3191 = _3163 * _3131;
    int _3193 = _3191 + _2901;
    float _3195 = trunc(_3141);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    int _3201 = int(_2977) + int(_3157);
    int _3203 = ~_2889;
    int _3205 = _3203 + 1;
    bool _3207 = uint(_3193) >= uint(_2487);
    int _3209 = ~_2863;
    int _3211 = _3209 + 1;
    int _3213 = ~_2797;
    int _3215 = _3213 + 1;
    int _3217 = _3173 * _3187;
    int _3219 = _3217 + _2897;
    int _3221 = int(_3031) + int(_3185);
    int _3223 = _3211 * _3189;
    int _3225 = _3223 + _2949;
    int _3227 = ~_2903;
    int _3229 = _3227 + 1;
    int _3231 = _3215 * _3201;
    int _3233 = _3231 + _2927;
    bool _3235 = uint(_3219) >= uint(_2761);
    float _3237 = fma(_3147, _3175, _3175);
    bool _3239 = uint(_3225) >= uint(_2863);
    int _3241 = _3229 * _3221;
    int _3243 = _3241 + _2955;
    bool _3245 = !_3207;
    int _3247 = _3245 ? 0 : (-1);
    float _3249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3251 = !_3235;
    int _3253 = _3251 ? 0 : (-1);
    bool _3255 = uint(_3233) >= uint(_2797);
    int _3257 = ~_3131;
    int _3259 = _3257 + _3247;
    int _3261 = _3259 + 1;
    int _3263 = ~_3187;
    int _3265 = _3263 + _3253;
    int _3267 = _3265 + 1;
    float _3269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3271 = int(_3057) + int(_3199);
    int _3273 = _2487 * _3261;
    int _3275 = _3273 + _2901;
    bool _3277 = uint(_3243) >= uint(_2903);
    int _3279 = _2761 * _3267;
    int _3281 = _3279 + _2897;
    bool _3283 = !_3255;
    int _3285 = _3283 ? 0 : (-1);
    int _3287 = _3205 * _3271;
    int _3289 = _3287 + _2967;
    bool _3291 = _2487 == 0;
    float _3293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3295 = !_3277;
    int _3297 = _3295 ? 0 : (-1);
    bool _3299 = _2761 == 0;
    int _3301 = ~_3201;
    int _3303 = _3301 + _3285;
    int _3305 = _3303 + 1;
    bool _3307 = !_3291;
    int _3309 = _3307 ? _3275 : (-1);
    bool _3311 = !_3299;
    int _3313 = _3311 ? _3281 : (-1);
    int _3315 = _2797 * _3305;
    int _3317 = _3315 + _2927;
    bool _3319 = _2797 == 0;
    bool _3321 = _2797 == 0;
    int _3323 = _2927 ^ _2797;
    float _3325 = _3249 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3327 = ~_3297;
    int _3329 = _3221 + _3327;
    int _3331 = _3329 + 1;
    float _3333 = _3269 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3335 = float(_3309);
    float _3337 = -_148;
    float _3339 = fma(_3337, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1837);
    bool _3341 = uint(_3289) >= uint(_2889);
    float _3343 = fma(_3325, _1019, -0.5);
    int _3345 = _2901 ^ _2487;
    float _3347 = fma(_3325, _3335, _3339);
    float _3349 = float(_3313);
    float _3351 = fma(_3333, _1055, -0.5);
    bool _3353 = !_3319;
    int _3355 = _3353 ? _3317 : (-1);
    float _3357 = _3293 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3359 = !_3341;
    int _3361 = _3359 ? 0 : (-1);
    float _3363 = _2449 * _2449;
    bool _3365 = _2761 == 0;
    float _3367 = fma(_3357, _1663, -0.5);
    bool _3369 = !_3239;
    int _3371 = _3369 ? 0 : (-1);
    int _3373 = _2897 ^ _2761;
    uint _3375 = uint(int(uint(_3345) >> uint(31)));
    float _3377 = fma(_3333, _3349, _2749);
    float _3379 = float(_3355);
    float _3381 = -_148;
    float _3383 = fma(_3381, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2465);
    int _3385 = ~_3371;
    int _3387 = _3189 + _3385;
    int _3389 = _3387 + 1;
    float _3391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3393 = ~int(_3375);
    int _3395 = _3393 + 1;
    float _3397 = fma(_3357, _3379, _3383);
    uint _3399 = uint(int(uint(_3373) >> uint(31)));
    int _3401 = _3389 ^ _3395;
    int _3403 = ~int(_3399);
    int _3405 = _3403 + 1;
    uint _3407 = uint(int(uint(_3323) >> uint(31)));
    float _3409 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3411 = ~_3395;
    int _3413 = _3411 + _3401;
    int _3415 = _3413 + 1;
    float _3417 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3419 = _3331 ^ _3405;
    float _3421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3423 = ~int(_3407);
    int _3425 = _3423 + 1;
    float _3427 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3409);
    int _3429 = ~_3405;
    int _3431 = _3429 + _3419;
    int _3433 = _3431 + 1;
    float _3435 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3417);
    float _3437 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2691);
    bool _3439 = _2487 == 0;
    float _3441 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3427);
    int _3443 = ~_3361;
    int _3445 = _3271 + _3443;
    int _3447 = _3445 + 1;
    float _3449 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3435);
    float _3451 = fma(_3437, _3351, _3377);
    float _3453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3455 = !_3365;
    int _3457 = _3455 ? _3433 : (-1);
    float _3459 = fma(_3441, _3343, _3347);
    bool _3461 = !_3439;
    int _3463 = _3461 ? _3415 : (-1);
    float _3465 = fma(_3449, _3367, _3397);
    float _3467 = _3391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3469 = _3447 ^ _3425;
    float _3471 = _3421 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3473 = float(_3457);
    float _3475 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3085);
    float _3477 = float(_3463);
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3481 = ~_3425;
    int _3483 = _3481 + _3469;
    int _3485 = _3483 + 1;
    float _3487 = fma(_1133, _3467, -0.5);
    float _3489 = -_3475;
    float _3491 = fma(_3471, _3473, _3489);
    float _3493 = -_2007;
    float _3495 = fma(_3467, _3477, _3493);
    bool _3497 = !_3321;
    int _3499 = _3497 ? _3485 : (-1);
    float _3501 = fma(_3159, -2.0, _3479);
    float _3503 = fma(_1537, _3471, -0.5);
    float _3505 = float(_3499);
    float _3507 = _3453 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3509 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3501);
    float _3511 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3513 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3515 = log2(_3513);
    float _3517 = -_3509;
    float _3519 = fma(_3507, _3505, _3517);
    float _3521 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3511);
    float _3523 = fma(_2417, _2417, _3363);
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3527 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3529 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3521);
    float _3531 = fma(_2425, _2425, _3523);
    float _3533 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3525);
    float _3535 = fma(_3507, _1601, -0.5);
    float _3537 = fma(_3529, _3487, _3495);
    float _3539 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3533);
    float _3541 = rsqrt(_3531);
    float _3543 = fma(_2633, _3503, _3491);
    float _3545 = _3459 + 0.5;
    float _3547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3549 = 1.0 + _3547;
    float _3551 = fma(_3539, _3535, _3519);
    float _3553 = _3451 + 0.5;
    float _3555 = _3537 + 0.5;
    float _3557 = _3543 + 0.5;
    float _3559 = 1.0 / _3549;
    float _3561 = _3465 + 0.5;
    float _3563 = _3551 + 0.5;
    float _3565 = _3527 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3567 = _3515 * _148;
    out.m_67.x = _3545;
    out.m_67.y = _3555;
    out.m_67.z = _3553;
    out.m_67.w = _3557;
    bool _3569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3571 = isnan(1.0);
    bool _3573 = _3569 || _3571;
    bool _3575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3577 = _3573 || _3575;
    float _3579 = _3565 * _3541;
    out.m_69.x = _3561;
    out.m_69.y = _3563;
    float _3581 = exp2(_3567);
    bool _3583 = !_2461;
    int _3585 = _3583 ? 0 : 1;
    float _3587 = _2417 * _3579;
    float _3589 = _2449 * _3579;
    float _3591 = as_type<float>(_3317);
    float _3593 = as_type<float>(_3129);
    if (_2631)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3595 = -_3589;
    float _3597 = _1843 + _3595;
    float _3599 = _2425 * _3579;
    float _3601 = -_3587;
    float _3603 = _2225 + _3601;
    float _3605 = -_3581;
    float _3607 = _3605 + 1.0;
    float _3609 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3611 = _3597 + _3609;
    float _3613 = -_3599;
    float _3615 = _2001 + _3613;
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3619 = _3603 + _3617;
    bool _3621 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3623 = isnan(0.0);
    bool _3625 = _3621 || _3623;
    bool _3627 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3629 = _3625 || _3627;
    float _3631 = _3611 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3635 = _3615 + _3633;
    float _3637 = -_3589;
    float _3639 = _2449 + _3637;
    float _3641 = _3629 ? _3607 : 0.0;
    float _3643 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3631);
    float _3645 = _686 + (-0.5);
    float _3647 = -_3587;
    float _3649 = _2417 + _3647;
    float _3651 = _3639 * _3639;
    float _3653 = fma(_3635, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3643);
    float _3655 = _3631;
    if (_3577)
    {
        float _3657 = _3641 * _3559;
        _150 = _3657;
    }
    float _3659 = _150;
    float _3661 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3237);
    float _3663 = fma(_3649, _3649, _3651);
    float _3665 = -_3599;
    float _3667 = _2425 + _3665;
    bool _3669 = _3653 >= 0.0;
    float _3671 = fma(_3169, _3659, _3661);
    float _3673 = _3039 * (-2.0);
    float _3675 = fma(_3667, _3667, _3663);
    int _3677 = abs(_3585);
    float _3679 = _3671 * 0.15915493667125701904296875;
    float _3681 = _692 + (-0.5);
    float _3683 = sqrt(_3675);
    float _3685 = fma(_3673, _3177, _3177);
    float _3687 = fma(_2129, _3673, _2129);
    if (_3669)
    {
        _3655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3689 = _3655;
    float _3691 = fma(_3681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3685);
    float _3693 = _3679 * 6.283185482025146484375;
    float _3695 = sin(_3693);
    float _3697 = float(_2405);
    int _3699 = as_type<int>(_3689);
    if (_3669)
    {
        out.m_49.x = 0.0;
    }
    if (_3669)
    {
        float _3701 = _3689 * 5.0;
        _3699 = as_type<int>(_3701);
    }
    int _3703 = _3699;
    float _3705 = float(_3677);
    float _3707 = fma(_3687, _3659, _3691);
    float _3709 = _3679 * 6.283185482025146484375;
    float _3711 = cos(_3709);
    if (_3669)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10350 = as_type<float>(_3703);
        out.gl_Position.z = _10350;
    }
    float _3713 = _3705 * _3697;
    if (_3669)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3715 = -_1843;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3719 = _3707 * 0.15915493667125701904296875;
    float _3721 = -_2225;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3725 = -_2001;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3729 = _3717 * _3717;
    float _3731 = _686 + _706;
    float _3733 = _706 + (-0.5);
    float _3735 = _3719 * 6.283185482025146484375;
    float _3737 = sin(_3735);
    float _3739 = fma(_3723, _3723, _3729);
    float _3741 = _3731 + (-1.0);
    float _3743 = _3713 * (-2.0);
    float _3745 = fma(_3727, _3727, _3739);
    float _3747 = fma(_3741, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3749 = fma(_3743, _3179, _3179);
    float _3751 = _3719 * 6.283185482025146484375;
    float _3753 = cos(_3751);
    float _3755 = fma(_3747, _3743, _3747);
    float _3757 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3749);
    float _3759 = fma(_3755, _3659, _3757);
    float _3761 = rsqrt(_3745);
    float _3763 = _3541 * _3683;
    float _3765 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3767 = _3759 * 0.15915493667125701904296875;
    float _3769 = in.m_71.x;
    float _3771 = in.m_71.y;
    float _3773 = in.m_71.z;
    float _3775 = _3527 * _3763;
    float _3777 = _3767 * 6.283185482025146484375;
    float _3779 = sin(_3777);
    float _3781 = _3695 * _3737;
    float _3783 = _3711 * _3753;
    float _3785 = _3695 * _3753;
    bool _3787 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3789 = isnan(0.5);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3795 = _3791 || _3793;
    float _3797 = _3723 * _3761;
    float _3799 = _3727 * _3761;
    float _3801 = _3717 * _3761;
    float _3803 = _3767 * 6.283185482025146484375;
    float _3805 = cos(_3803);
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3797 * _3807;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3813 = _3799 * _3811;
    float _3815 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3817 = -_3809;
    float _3819 = fma(_3799, _3815, _3817);
    float _3821 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3823 = -_3813;
    float _3825 = fma(_3801, _3821, _3823);
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3829 = _3801 * _3827;
    float _3831 = fma(_3779, _3783, _3781);
    float _3833 = _3819 * _3819;
    float _3835 = fma(_3779, _3781, _3783);
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3839 = -_3829;
    float _3841 = fma(_3797, _3837, _3839);
    float _3843 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3845 = fma(_3825, _3825, _3833);
    float _3847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3771);
    float _3849 = _3711 * _3737;
    float _3851 = _3763 * _3843;
    float _3853 = fma(_3841, _3841, _3845);
    float _3855 = _3711 * _3805;
    float _3857 = _3753 * _3805;
    float _3859 = _3695 * _3805;
    float _3861 = _3737 * _3805;
    float _3863 = _3847 * _3851;
    float _3865 = rsqrt(_3853);
    float _3867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3769);
    float _3869 = -_3849;
    float _3871 = fma(_3779, _3785, _3869);
    float _3873 = _3763 * _3765;
    float _3875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3773);
    float _3877 = -_3785;
    float _3879 = fma(_3779, _3849, _3877);
    float _3881 = _3867 * _3775;
    float _3883 = _3855 * _3863;
    float _3885 = _3875 * _3873;
    float _3887 = -_3863;
    float _3889 = _3779 * _3887;
    float _3891 = _3859 * _3863;
    float _3893 = fma(_3831, _3881, _3883);
    float _3895 = fma(_3857, _3881, _3889);
    float _3897 = fma(_3871, _3881, _3891);
    float _3899 = fma(_3879, _3885, _3893);
    float _3901 = _3825 * _3865;
    float _3903 = _3819 * _3865;
    float _3905 = _3841 * _3865;
    float _3907 = fma(_3861, _3885, _3895);
    float _3909 = _3801 * _3901;
    float _3911 = _3799 * _3903;
    float _3913 = fma(_3835, _3885, _3897);
    float _3915 = -_3909;
    float _3917 = fma(_3797, _3903, _3915);
    float _3919 = -_3911;
    float _3921 = fma(_3801, _3905, _3919);
    float _3923 = _3917 * _3899;
    float _3925 = _3921 * _3899;
    float _3927 = fma(_3905, _3907, _3923);
    float _3929 = fma(_3901, _3907, _3925);
    float _3931 = fma(_3799, _3913, _3927);
    float _3933 = fma(_3797, _3913, _3929);
    float _3935 = _2001 + _3931;
    float _3937 = _2225 + _3933;
    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3941 = _3935 + _3939;
    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3945 = _3937 + _3943;
    float _3947 = _3941 * _3941;
    float _3949 = fma(_3945, _3945, _3947);
    float _3951 = _3797 * _3905;
    float _3953 = sqrt(_3949);
    float _3955 = -_3951;
    float _3957 = fma(_3799, _3901, _3955);
    float _3959 = _3957 * _3899;
    float _3961 = fma(_3903, _3907, _3959);
    float _3963 = fma(_3801, _3913, _3961);
    bool _3965 = _3953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3967 = _1843 + _3963;
    float _3969 = _3899;
    float _3971 = _3913;
    float _3973 = _3937;
    float _3975 = _3953;
    if (!_3965)
    {
        _3969 = _3937;
    }
    float _3977 = _3969;
    float _3979 = _3977;
    if (!_3965)
    {
        _3971 = _3935;
    }
    float _3981 = _3971;
    float _3983 = _3981;
    if (!_3965)
    {
        _3973 = _3967;
    }
    float _3985 = _3973;
    bool _3987 = !_3965;
    float _3989 = _3985;
    if (!_3987)
    {
        float _3991 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3995 = _3953 + _3993;
        float _3997 = rsqrt(_3949);
        float _3999 = _3995 * _3991;
        float _4001 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4003 = _3999 * 0.15915493667125701904296875;
        float _4005 = _4003 * 6.283185482025146484375;
        float _4007 = sin(_4005);
        float _4009 = _4003 * 6.283185482025146484375;
        float _4011 = cos(_4009);
        float _4013 = fma(_4007, _4001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4015 = _3997 * _4013;
        float _4017 = _4011 + (-1.0);
        float _4019 = fma(_3945, _4015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4021 = fma(_3941, _4015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4023 = _4017 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4025 = fma(_3967, _4011, _4023);
        _3979 = _4019;
        _3989 = _4025;
        _3983 = _4021;
        _3975 = _4003;
    }
    float _4027 = _3979;
    float _4029 = _3989;
    float _4031 = _3983;
    float _4033 = _3975;
    float _4035 = -_3587;
    float _4037 = _4035 + _4027;
    float _4039 = -_3589;
    float _4041 = _4039 + _4029;
    float _4043 = -_3599;
    float _4045 = _4043 + _4031;
    float _4047 = _4041;
    float _4049 = _4037;
    float _4051 = _4045;
    float _4053 = _4033;
    float _4055 = _4027;
    if (!_3795)
    {
        float _4057 = _3611 * _3611;
        float _4059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4061 = -_2001;
        float _4063 = _4061 + _4031;
        float _4065 = fma(_3619, _3619, _4057);
        float _4067 = fma(_3635, _3635, _4065);
        float _4069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4071 = sqrt(_4067);
        float _4073 = 1.0 / _3763;
        float _4075 = _4069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4077 = precise::min(_4071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4079 = _4077 * _4059;
        float _4081 = _4079 * _4073;
        float _4083 = -_2225;
        float _4085 = _4083 + _4027;
        float _4087 = -_1843;
        float _4089 = _4087 + _4029;
        float _4091 = _4075 * _4081;
        float _4093 = _4063 * _4081;
        float _4095 = fma(_4085, _4091, _3603);
        float _4097 = fma(_4089, _4091, _3597);
        float _4099 = fma(_4075, _4093, _3615);
        _4047 = _4097;
        _4049 = _4095;
        _4051 = _4099;
        _4053 = _4091;
    }
    float _4101 = _4047;
    float _4103 = _4049;
    float _4105 = _4051;
    float _4107 = _4053;
    float _4109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4111 = _4101 + _4109;
    float _4113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4115 = _4103 + _4113;
    float _4117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4119 = _4105 + _4117;
    float _4121 = _4111 * _4111;
    float _4123 = fma(_4115, _4115, _4121);
    float _4125 = fma(_4119, _4119, _4123);
    float _4127 = rsqrt(_4125);
    float _4129 = sqrt(_4125);
    float _4131 = _4127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4133 = _4115 * _4131;
    float _4135 = _4119 * _4131;
    float _4137 = _4133 * _4133;
    float _4139 = _4135 * _4135;
    float _4141 = _4137 + _4139;
    float _4143 = sqrt(_4141);
    bool _4145 = _4143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4149 = _4143 + _4147;
    float _4151 = _4119;
    float _4153 = _4123;
    float _4155 = _4149;
    float _4157 = _4111;
    if (_4145)
    {
        float _4159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4151 = _4159;
    }
    float _4161 = _4151;
    if (_4145)
    {
        float _4163 = rsqrt(_4141);
        _4153 = _4163;
    }
    float _4165 = _4153;
    float _4167 = _4165;
    if (_4145)
    {
        float _4169 = _4149 * _4161;
        _4155 = _4169;
    }
    float _4171 = _4155;
    if (_4145)
    {
        float _4173 = _4171 * 0.15915493667125701904296875;
        _4055 = _4173;
    }
    float _4175 = _4055;
    float _4177 = _4107;
    if (_4145)
    {
        float _4179 = _4175 * 6.283185482025146484375;
        float _4181 = sin(_4179);
        _4177 = _4181;
    }
    float _4183 = _4177;
    float _4185 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4187 = precise::max(0.0, _4185);
    float _4189 = _4127;
    float _4191 = _4187;
    float _4193 = _4185;
    if (_4145)
    {
        float _4195 = _4175 * 6.283185482025146484375;
        float _4197 = cos(_4195);
        _4189 = _4197;
    }
    float _4199 = _4189;
    float _4201 = -_4131;
    float _4203 = -_4187;
    float _4205 = fma(_4111, _4201, _4203);
    float _4207 = _4205;
    if (!_4145)
    {
        _4157 = _4133;
    }
    float _4209 = _4157;
    float _4211 = _4209;
    if (!_4145)
    {
        _4191 = _4135;
    }
    float _4213 = _4191;
    float _4215 = _4213;
    if (_4145)
    {
        float _4217 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4193 = _4217;
    }
    float _4219 = _4193;
    float _4221 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4223 = _4183;
    float _4225 = _4219;
    if (_4145)
    {
        float _4227 = fma(_4183, _4219, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4223 = _4227;
    }
    float _4229 = _4223;
    float _4231 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4221);
    float _4233 = _4229;
    float _4235 = _4199;
    if (_4145)
    {
        float _4237 = _4199 + (-1.0);
        _4225 = _4237;
    }
    float _4239 = _4225;
    float _4241 = _4239;
    if (_4145)
    {
        float _4243 = _4165 * _4229;
        _4233 = _4243;
    }
    float _4245 = _4233;
    float _4247 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4231);
    if (_4145)
    {
        float _4249 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4167 = _4249;
    }
    float _4251 = _4167;
    if (_4145)
    {
        float _4253 = _4133 * _4245;
        _4211 = _4253;
    }
    float _4255 = _4211;
    if (!_4145)
    {
        _4241 = _4137;
    }
    float _4257 = _4241;
    float _4259 = _4257;
    if (_4145)
    {
        float _4261 = _4135 * _4245;
        _4215 = _4261;
    }
    float _4263 = _4215;
    if (_4145)
    {
        float _4265 = fma(_4205, _4199, _4251);
        _4207 = _4265;
    }
    float _4267 = _4207;
    if (_4145)
    {
        float _4269 = _4255 * _4255;
        _4259 = _4269;
    }
    float _4271 = _4259;
    float _4273 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4145)
    {
        _4235 = _4139;
    }
    float _4275 = _4235;
    float _4277 = _4275;
    if (_4145)
    {
        float _4279 = _4263 * _4263;
        _4277 = _4279;
    }
    float _4281 = _4277;
    float _4283 = fma(_4267, _4267, _4271);
    float _4285 = fma(_3603, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4287 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4273);
    float _4289 = _4283 + _4281;
    float _4291 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4293 = _4247 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4297 = fma(_4129, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4295);
    float _4299 = precise::clamp(_4297, 0.0, 1.0);
    float _4301 = rsqrt(_4289);
    float _4303 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4291);
    float _4305 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4287);
    float _4307 = -_4299;
    float _4309 = _4307 + 1.0;
    float _4311 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4313 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4303);
    float _4315 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4317 = _4305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4319 = floor(_4285);
    float _4321 = _4313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4323 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4315);
    float _4325 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4327 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4311);
    float _4329 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4323);
    float _4331 = _4301 * _4267;
    float _4333 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4327);
    float _4335 = _4301 * _4255;
    float _4337 = abs(_4309);
    float _4339 = log2(_4337);
    float _4341 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4343 = _4301 * _4263;
    float _4345 = _4335 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4347 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4333);
    float _4349 = -_4319;
    float _4351 = _4285 + _4349;
    float _4353 = -_4345;
    float _4355 = fma(_4331, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4353);
    float _4357 = floor(_4325);
    float _4359 = -_4343;
    float _4361 = fma(_4359, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4355);
    float _4363 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4365 = fma(_4361, 0.5, 0.5);
    float _4367 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4371 = fma(_4361, -0.5, 0.5);
    float _4373 = 1.0 / _4347;
    float _4375 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4377 = -_4363;
    float _4379 = fma(_4377, _4369, 1.0);
    float _4381 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4383 = fma(_4365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4385 = -_4357;
    float _4387 = _4325 + _4385;
    float _4389 = _4331 + 1.0;
    float _4391 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4381);
    float _4393 = exp2(_4367);
    float _4395 = fma(_4365, _4383, -0.212114393711090087890625);
    float _4397 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4375);
    float _4399 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4391);
    float _4401 = log2(_4379);
    float _4403 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4397);
    float _4405 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4399);
    float _4407 = sqrt(_4371);
    float _4409 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4403);
    float _4411 = -_4331;
    float _4413 = fma(_4393, _4389, _4411);
    float _4415 = _4405 * _4373;
    float2 _11466 = float2(_4351, _4387);
    float _4417 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11466, float2(0.0), isnan(_11466)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11466, float2(0.0), isnan(_11466)), level(0.0)).x;
    float _4419 = _4409 * _4373;
    float _4421 = fma(_4365, _4395, 1.570728778839111328125);
    float _4423 = fma(_4415, 0.5, 0.5);
    float _4425 = _4401 * 0.693147182464599609375;
    float _4427 = fma(_4413, 0.5, 0.5);
    float _4429 = fma(_4419, -0.5, 0.5);
    float _4431 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4433 = _4407 * 0.636619746685028076171875;
    float3 _11500 = float3(_4423, _4429, _4431);
    float _4435 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11500, float3(0.0), isnan(_11500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11500, float3(0.0), isnan(_11500)), level(0.0)).x;
    float3 _11511 = float3(_4423, _4429, _4431);
    float4 _4438 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11511, float3(0.0), isnan(_11511)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11511, float3(0.0), isnan(_11511)), level(0.0)).xyzw;
    float _4440 = _4438.x;
    float _4442 = _4438.y;
    float _4444 = _4438.z;
    float _4446 = _4438.w;
    float _4448 = -_4421;
    float _4450 = fma(_4433, _4448, 1.0);
    float2 _11532 = float2(_4450, _4427);
    float3 _4454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11532, float2(0.0), isnan(_11532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11532, float2(0.0), isnan(_11532)), level(0.0)).xyz;
    float _4456 = _4454.x;
    float _4458 = _4454.y;
    float _4460 = _4454.z;
    float _4462 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4464 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4466 = _3771 != 0.0;
    bool _4468 = isnan(_3771);
    bool _4470 = _4466 || _4468;
    bool _4472 = isnan(0.0);
    bool _4474 = _4470 || _4472;
    float _4476 = _3855 * _3957;
    float _4478 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4462);
    float _4480 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4464);
    float _4482 = in.m_73.x;
    float _4484 = in.m_73.y;
    float _4486 = in.m_73.z;
    bool _4488 = _3769 == 0.0;
    bool _4490 = !_4474;
    bool _4492 = _4488 && _4490;
    float _4494 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4478);
    float _4496 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4480);
    float _4498 = _3855 * _3917;
    float _4500 = _4494 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4502 = _4496 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4504 = _3773 == 0.0;
    bool _4506 = _4504 && _4492;
    float _4508 = -_3779;
    float _4510 = fma(_4508, _3903, _4476);
    float _4512 = 1.0 / _4500;
    float _4514 = _4502 + _4500;
    float _4516 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4518 = _4293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _4103;
    out.m_75.y = _4101;
    out.m_75.z = _4105;
    float _4520 = fma(_4321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4518);
    float _4522 = in.m_77.x;
    float _4524 = in.m_77.y;
    float _4526 = in.m_77.z;
    float _4528 = in.m_77.w;
    float _4530 = exp2(_4516);
    float _4532 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4520);
    float _4534 = _4482;
    if (_4506)
    {
        _3591 = _4482;
    }
    float _4536 = _3591;
    float _4538 = _4514 * _4512;
    float _4540 = _4538 * 0.5;
    float _4542 = _4536;
    if (_4506)
    {
        _3593 = _4484;
    }
    float _4544 = _3593;
    float _4546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4548 = fma(_4540, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4546);
    float _4550 = 1.0 / _4548;
    float _4552 = -_4530;
    float _4554 = _4552 + 1.0;
    float _4556 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4560 = _4550 * _4558;
    float _4562 = _4550;
    float _4564 = _4544;
    if (_4506)
    {
        _4562 = _4536;
    }
    float _4566 = _4562;
    float _4568 = _4566;
    if (!_4506)
    {
        _4542 = _4482;
    }
    float _4570 = _4542;
    float _4572 = abs(_4560);
    float _4574 = log2(_4572);
    if (_4506)
    {
        _4534 = _4486;
    }
    float _4576 = _4534;
    float _4578 = _4576;
    if (!_4506)
    {
        float _4580 = fma(_3773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4486);
        _4578 = _4580;
    }
    float _4582 = _4578;
    if (!_4506)
    {
        float _4584 = fma(_3769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4570);
        _4568 = _4584;
    }
    float _4586 = _4568;
    bool _4588 = _4560 <= 8000.0;
    bool _4590 = isnan(_4560);
    bool _4592 = _4588 || _4590;
    bool _4594 = isnan(8000.0);
    bool _4596 = _4592 || _4594;
    float _4598 = float(_4596);
    float _4600 = _4574 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4602 = _4574;
    if (_4506)
    {
        _4602 = _4544;
    }
    float _4604 = _4602;
    float _4606 = _4604;
    if (!_4506)
    {
        _4564 = _4484;
    }
    float _4608 = _4564;
    float _4610 = _4526 * _4570;
    float _4612 = exp2(_4600);
    if (!_4506)
    {
        float _4614 = fma(_3771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4608);
        _4606 = _4614;
    }
    float _4616 = _4606;
    float _4618 = _4524 * _4486;
    float _4620 = _4522 * _4608;
    float _4622 = -_4610;
    float _4624 = fma(_4522, _4486, _4622);
    float _4626 = _3831 * _3921;
    bool _4628 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4630 = isnan(_4129);
    bool _4632 = _4628 || _4630;
    bool _4634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4636 = _4632 || _4634;
    float _4638 = fma(_4612, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4640 = precise::clamp(_4638, 0.0, 1.0);
    float _4642 = -_4618;
    float _4644 = fma(_4526, _4608, _4642);
    float _4646 = -_4620;
    float _4648 = fma(_4524, _4570, _4646);
    float _4650 = _4624 * _4528;
    float _4652 = fma(_4640, -2.0, 3.0);
    float _4654 = _4640 * _4640;
    float _4656 = _4644 * _4528;
    float _4658 = _4648 * _4528;
    float _4660 = _3831 * _3957;
    float _4662 = _4654 * _4652;
    float _4664 = _3855 * _3921;
    float _4666 = _3831 * _3917;
    float _4668 = _3879 * _3921;
    float _4670 = fma(_3857, _3901, _4626);
    float _4672 = -_3779;
    float _4674 = fma(_4672, _3901, _4664);
    float _4676 = fma(_3857, _3903, _4660);
    float _4678 = fma(_3857, _3905, _4666);
    float _4680 = -_3779;
    float _4682 = fma(_4680, _3905, _4498);
    float _4684 = _3879 * _3917;
    float _4686 = -_4662;
    float _4688 = _4686 + 1.0;
    float _4690 = fma(_3861, _3901, _4668);
    float _4692 = fma(_3859, _3797, _4674);
    float _4694 = fma(_3859, _3801, _4510);
    float _4696 = _3879 * _3957;
    float _4698 = fma(_3859, _3799, _4682);
    float _4700 = fma(_4688, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4662);
    float _4702 = fma(_3871, _3801, _4676);
    float _4704 = fma(_3871, _3797, _4670);
    float _4706 = fma(_3871, _3799, _4678);
    float _4708 = fma(_3861, _3903, _4696);
    float _4710 = fma(_3835, _3797, _4690);
    float _4712 = _4692 * _4524;
    float _4714 = _4694 * _4524;
    float _4716 = _4698 * _4524;
    float _4718 = fma(_3861, _3905, _4684);
    float _4720 = _4692 * _4616;
    float _4722 = _4650 * _4692;
    float _4724 = _4694 * _4616;
    float _4726 = _4698 * _4616;
    float _4728 = _4650 * _4694;
    float _4730 = _4650 * _4698;
    float _4732 = fma(_3835, _3801, _4708);
    float _4734 = fma(_3835, _3799, _4718);
    float _4736 = fma(_4656, _4704, _4722);
    float _4738 = fma(_4704, _4522, _4712);
    float _4740 = fma(_4702, _4522, _4714);
    float _4742 = fma(_4704, _4586, _4720);
    float _4744 = fma(_4702, _4586, _4724);
    float _4746 = fma(_4656, _4702, _4728);
    float _4748 = fma(_4656, _4706, _4730);
    float _4750 = _4598 * _4700;
    float _4752 = fma(_4706, _4522, _4716);
    float _4754 = fma(_4710, _4526, _4738);
    float _4756 = fma(_4658, _4710, _4736);
    float _4758 = fma(_4658, _4732, _4746);
    float _4760 = fma(_4658, _4734, _4748);
    float _4762 = fma(_4732, _4526, _4740);
    float _4764 = in.m_79.x;
    float _4766 = fma(_4734, _4526, _4752);
    float _4768 = fma(_4341, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4532);
    float _4770 = fma(_4706, _4586, _4726);
    float _4772 = _4750 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4774 = fma(_4710, _4582, _4742);
    float _4776 = _4768 + _4347;
    float _4778 = fma(_4734, _4582, _4770);
    out.m_81.x = _4756;
    out.m_81.y = _4758;
    out.m_81.z = _4760;
    float _4780 = _4776 * 0.5;
    float _4782 = fma(_4732, _4582, _4744);
    out.m_83.x = _4754;
    out.m_83.y = _4762;
    out.m_83.z = _4766;
    out.m_85.z = _4780;
    out.m_85.w = _4347;
    float _4784 = _4760;
    float _4786 = _4758;
    if (!_4636)
    {
        _4784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4788 = _4784;
    out.gl_Position.x = _4405;
    out.gl_Position.y = _4409;
    out.gl_Position.z = _4768;
    out.gl_Position.w = _4347;
    float _4790 = _4788;
    float _4792 = _4788;
    if (!_4636)
    {
        _4786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4794 = _4786;
    out.m_87.x = _4774;
    out.m_87.y = _4782;
    out.m_87.z = _4778;
    float _4796 = -_4417;
    float _4798 = _4796 + 1.0;
    float _4800 = _4798 * _4772;
    float _4802 = precise::clamp(_4800, 0.0, 1.0);
    float _4804 = -_4802;
    float _4806 = fma(_4804, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4808 = _4806 * _4764;
    float _4810 = _4556 * _4435;
    float _4812 = -_4556;
    float _4814 = _4812 + 1.0;
    float _4816 = _4808 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4818 = _4446 * _4810;
    float _4820 = _4446 * _4814;
    out.m_89.x = _4816;
    float _4822 = _4460 * _4810;
    float _4824 = fma(_4456, _4818, _4440);
    float _4826 = fma(_4458, _4818, _4442);
    float _4828 = _4818;
    float _4830 = _4794;
    float _4832 = _4794;
    if (!_4636)
    {
        _4828 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4834 = _4828;
    float _4836 = fma(_4446, _4822, _4444);
    out.m_91.x = _4824;
    out.m_91.y = _4826;
    out.m_91.z = _4836;
    out.m_91.w = _4820;
    bool _4838 = !_4636;
    float _4840 = _4834;
    float _4842 = _4834;
    if (!_4838)
    {
        bool _4844 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4846 = isnan(_4129);
        bool _4848 = _4844 || _4846;
        bool _4850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4852 = _4848 || _4850;
        if (!_4852)
        {
            float _4854 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4856 = _4129 + _4854;
            float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4860 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4858;
            float _4862 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4864 = _4862 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4870 = 1.0 / _4860;
            float _4872 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4874 = _4872 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4876 = _4856 * _4870;
            float _4878 = precise::clamp(_4876, 0.0, 1.0);
            float _4880 = fma(_4878, _4864, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4882 = fma(_4878, _4868, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4884 = fma(_4878, _4874, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4832 = _4882;
            _4792 = _4880;
            _4842 = _4884;
            _4886 = true;
        }
        else
        {
            bool _4888 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4890 = isnan(_4129);
            bool _4892 = _4888 || _4890;
            bool _4894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4896 = _4892 || _4894;
            if (!_4896)
            {
                _4790 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4898 = _4790;
            _4792 = _4898;
            if (!_4896)
            {
                _4830 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4900 = _4830;
            _4832 = _4900;
            if (!_4896)
            {
                _4840 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4902 = _4840;
            bool _4904 = !_4896;
            _4842 = _4902;
            if (!_4904)
            {
                bool _4906 = _4129 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4908 = isnan(_4129);
                bool _4910 = _4906 || _4908;
                bool _4912 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4914 = _4910 || _4912;
                if (!_4914)
                {
                    float _4916 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4918 = _4129 + _4916;
                    float _4920 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4922 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4920;
                    float _4924 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4926 = _4924 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4928 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4930 = _4928 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4932 = 1.0 / _4922;
                    float _4934 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4936 = _4934 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4938 = _4918 * _4932;
                    float _4940 = precise::clamp(_4938, 0.0, 1.0);
                    float _4942 = fma(_4940, _4926, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4944 = fma(_4940, _4930, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4946 = fma(_4940, _4936, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4832 = _4944;
                    _4792 = _4942;
                    _4842 = _4946;
                    _4886 = true;
                }
                else
                {
                    _4832 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4792 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4842 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4886 = false;
    float _4948 = _4832;
    float _4950 = _4792;
    float _4952 = _4842;
    float _4954 = _4948 * 0.586610972881317138671875;
    bool _4956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = 1.0;
    float _4958 = fma(_4950, 0.298911988735198974609375, _4954);
    out.m_93.x = 0.0;
    float _4960 = fma(_4952, 0.114477999508380889892578125, _4958);
    float _4962 = -_4960;
    float _4964 = _4962 + _4950;
    float _4966 = -_4960;
    float _4968 = _4966 + _4948;
    float _4970 = -_4960;
    float _4972 = _4970 + _4952;
    float _4974 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4976 = fma(_4964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    float _4978 = fma(_4968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    float _4980 = fma(_4972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4960);
    out.m_89.w = _4974;
    out.m_95.x = _4976;
    out.m_95.y = _4978;
    out.m_95.z = _4980;
    if (!_4956)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4982 = -_4101;
    float _4984 = _4982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4986 = -_4103;
    float _4988 = _4986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4990 = -_4105;
    float _4992 = _4990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4994 = _4984 * _4984;
    float _4996 = fma(_4988, _4988, _4994);
    float _4998 = fma(_4992, _4992, _4996);
    float _5000 = sqrt(_4998);
    float _5002 = rsqrt(_4998);
    float _5004 = -_5000;
    float _5006 = _5004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5008 = _5006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5010 = precise::clamp(_5008, 0.0, 1.0);
    float _5012 = _4988 * _5002;
    float _5014 = _4984 * _5002;
    float _5016 = abs(_5010);
    float _5018 = log2(_5016);
    float _5020 = _4992 * _5002;
    float _5022 = _5012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5024 = _4782 * _5014;
    float _5026 = -_5014;
    float _5028 = -_5022;
    float _5030 = fma(_5026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5028);
    float _5032 = fma(_4774, _5012, _5024);
    float _5034 = -_5020;
    float _5036 = fma(_5034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5030);
    float _5038 = fma(_4778, _5020, _5032);
    float _5040 = precise::clamp(_5038, 0.0, 1.0);
    float _5042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5044 = _5036 + _5042;
    float _5046 = _5018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5048 = _5044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5050 = precise::clamp(_5048, 0.0, 1.0);
    float _5052 = exp2(_5046);
    float _5054 = _5052 * _5050;
    float _5056 = _5040 * _5054;
    float _5058 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5060 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5062 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _5058;
    out.m_93.y = _5060;
    out.m_93.z = _5062;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

