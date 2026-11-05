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
    bool _4882 = false;
    bool _634 = false;
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
        float _5167 = as_type<float>(_130);
        out.gl_Position.z = _5167;
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
        float _5237 = as_type<float>(_168);
        out.gl_Position.z = _5237;
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
    bool _540 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _542 = isnan(_538);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _556 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _558 = isnan(_538);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _574 = _538 + _572;
    float _576 = -_550;
    float _578 = _576 + 1.0;
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _582 = 1.0 / _554;
    float _584 = _566 * _578;
    float _586 = -_566;
    float _588 = _586 + 1.0;
    float _590 = _570 * _582;
    float _592 = fma(_590, _574, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _594 = _592 * _584;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _594);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _604 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[132].x, _596);
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _606;
    out.m_59.y = _608;
    out.m_59.z = _610;
    out.m_59.w = _612;
    bool _614 = !_580;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_114);
        float _638 = 1.0 / _636;
        float _640 = _148 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _646 = int(_644);
    float _648 = in.m_53.x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _652 = _642 + _650;
    float _654 = in.m_53.y;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _662 = _642 + _660;
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _666 = int(_664);
    float _668 = in.m_53.z;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _676 = _674 != 0;
    float _678 = in.m_61.x;
    float _680 = float(_114);
    float _682 = float(_646);
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _686 = int(_684);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _692 = float(_666);
    float _694 = 1.0 / _682;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _704 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _706 = int(_704);
    float _708 = float(uint(_686));
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _714 = ~_686;
    int _716 = _714 + 1;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _718;
    bool _722 = _668 > 0.5;
    float _724 = 0.0;
    float _726 = _692;
    bool _728 = _658;
    float _730 = _678;
    if (!_672)
    {
        _724 = _678;
    }
    float _732 = _724;
    float _734 = 1.0 / _692;
    float _736 = _694 * _148;
    int _738 = _686 + (-1);
    bool _740 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _742 = isnan(_642);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _754 = int(_752);
    float _756 = float(_706);
    float _758 = _732;
    if (_658)
    {
        _726 = 1.0;
    }
    float _760 = _726;
    float _762 = _760;
    if (!_658)
    {
        _762 = 7.345489978790283203125;
    }
    float _764 = _762;
    float _766 = 1.0 / _708;
    float _768 = _734 * _148;
    float _770 = _764 * _648;
    float _772 = trunc(_736);
    int _774 = int(_772);
    float _776 = float(uint(_754));
    int _778 = ~_754;
    int _780 = _778 + 1;
    int _782 = ~_754;
    int _784 = _782 + 1;
    float _786 = float(_754);
    float _788 = 1.0 / _756;
    int _790 = as_type<int>(_766) + (-2);
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _794 = int(_792);
    float _796 = float(uint(_774));
    float _798 = as_type<float>(_790) * _796;
    float _800 = 1.0 / _776;
    float _802 = trunc(_768);
    int _804 = int(_802);
    float _806 = _788 * _148;
    float _808 = float(uint(_794));
    int _810 = ~_686;
    int _812 = _810 + 1;
    int _814 = ~_794;
    int _816 = _814 + 1;
    float _818 = 1.0 / _808;
    int _820 = as_type<int>(_800) + (-2);
    int _822 = ~_794;
    int _824 = _822 + 1;
    float _826 = float(_794);
    float _828 = trunc(_806);
    int _830 = int(_828);
    float _832 = float(uint(_804));
    float _834 = in.m_53.w;
    float _836 = float(_804);
    float _838 = as_type<float>(_820) * _832;
    float _840 = trunc(_798);
    float _842 = precise::max(_840, 0.0);
    uint _845 = uint(_842);
    int _847 = as_type<int>(_818) + (-2);
    float _849 = float(uint(_830));
    float _851 = trunc(_838);
    float _853 = precise::max(_851, 0.0);
    uint _855 = uint(_853);
    float _857 = as_type<float>(_847) * _849;
    float _859 = _849;
    int _861 = _847;
    if (_658)
    {
        _859 = _648;
    }
    float _863 = _859;
    int _865 = _812 * int(_845);
    int _867 = _865 + _774;
    float _869 = trunc(_857);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    float _875 = _863;
    float _877 = as_type<float>(_867);
    if (!_658)
    {
        _875 = _654;
    }
    float _879 = _875;
    float _881 = float(uint(_867));
    float _883 = _879;
    if (_658)
    {
        _877 = 1.0;
    }
    float _885 = _877;
    float _887 = floor(_770);
    float _889 = as_type<float>(_790) * _881;
    float _891 = _885;
    if (!_658)
    {
        _891 = 1.2345600128173828125;
    }
    float _893 = _891;
    int _895 = _780 * int(_855);
    int _897 = _895 + _804;
    float _899 = trunc(_889);
    float _901 = precise::max(_899, 0.0);
    uint _903 = uint(_901);
    int _905 = _816 * int(_873);
    int _907 = _905 + _830;
    float _909 = _879 * _893;
    float _911 = as_type<float>(_897);
    if (_658)
    {
        _883 = _648;
    }
    float _913 = _883;
    float _915 = float(uint(_897));
    float _917 = _913;
    if (_658)
    {
        _911 = 1.0;
    }
    float _919 = _911;
    float _921 = floor(_909);
    float _923 = float(uint(_907));
    float _925 = as_type<float>(_820) * _915;
    float _927 = _919;
    int _929 = as_type<int>(_925);
    float _931 = _923;
    if (!_658)
    {
        _917 = _668;
    }
    float _933 = _917;
    float _935 = in.m_61.y;
    int _937 = as_type<int>(_933);
    if (!_658)
    {
        _927 = 5.839270114898681640625;
    }
    float _939 = _927;
    float _941 = as_type<float>(_847) * _923;
    if (_672)
    {
        bool _943 = _648 > 0.5;
        _728 = _943;
    }
    bool _945 = _728;
    float _947 = trunc(_925);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    int _953 = int(_845) + int(_903);
    float _955 = _933 * _939;
    if (_672)
    {
        float _957 = -_678;
        float _959 = _957 + 1.0;
        _937 = as_type<int>(_959);
    }
    int _961 = _937;
    float _963 = -_887;
    float _965 = _770 + _963;
    int _967 = _716 * _953;
    int _969 = _967 + _774;
    float _971 = float(_686);
    float _973 = trunc(_941);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    if (_672)
    {
        float _979 = _945 ? as_type<float>(_961) : _678;
        _758 = _979;
    }
    float _981 = _758;
    if (_676)
    {
        float _983 = -_678;
        float _985 = _983 + 1.0;
        _929 = as_type<int>(_985);
    }
    int _987 = _929;
    if (!_676)
    {
        _931 = _678;
    }
    float _989 = _931;
    float _991 = -_921;
    float _993 = _909 + _991;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1005 = _1003 != 0;
    bool _1007 = uint(_969) >= uint(_686);
    float _1009 = floor(_955);
    float _1011 = float(_774);
    float _1013 = _989;
    if (_676)
    {
        float _1015 = _722 ? as_type<float>(_987) : _678;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = -_935;
    float _1021 = _1019 + 1.0;
    bool _1023 = !_1005;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1029 = _1027 != 0;
    float _1031 = 1.0 / _680;
    bool _1033 = _1011 >= _971;
    bool _1035 = isnan(_1011);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_971);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1047 = _1045 != 0;
    bool _1049 = _654 > 0.5;
    int _1051 = int(_855) + int(_951);
    float _1053 = trunc(_1043);
    int _1055 = int(_1053);
    int _1057 = int(_873) + int(_977);
    float _1059 = -_1009;
    float _1061 = _955 + _1059;
    bool _1063 = !_1029;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _784 * _1051;
    int _1069 = _1067 + _804;
    bool _1071 = !_1047;
    int _1073 = _1071 ? 0 : 1;
    int _1075 = _824 * _1057;
    int _1077 = _1075 + _830;
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1081 = _1079 != 0;
    float _1083 = 1.0 / _690;
    int _1085 = _1049 ? as_type<int>(_1021) : as_type<int>(_935);
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1089 = _1087 != 0;
    bool _1091 = !_1007;
    int _1093 = _1091 ? 0 : (-1);
    float _1095 = _1081 ? as_type<float>(_1085) : _935;
    float _1097 = 1.0 / _698;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1105 = _1103 != 0;
    int _1107 = ~_953;
    int _1109 = _1107 + _1093;
    int _1111 = _1109 + 1;
    bool _1113 = !_1089;
    int _1115 = _1113 ? 0 : 1;
    bool _1117 = uint(_1069) >= uint(_754);
    int _1119 = _686 * _1111;
    int _1121 = _1119 + _774;
    bool _1123 = !_1105;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = 1.0 / _702;
    bool _1129 = _686 == 0;
    bool _1131 = _836 >= _786;
    bool _1133 = isnan(_836);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(_786);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _965 * _971;
    bool _1145 = !_1117;
    int _1147 = _1145 ? 0 : (-1);
    float _1149 = _971 * _148;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    float _1159 = 1.0 / _712;
    int _1161 = ~_1055;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    bool _1167 = !_1129;
    int _1169 = _1167 ? _1121 : (-1);
    bool _1171 = !_1101;
    int _1173 = _1171 ? 0 : 1;
    bool _1175 = !_1153;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = trunc(_1141);
    int _1181 = int(_1179);
    int _1183 = _1169 * _1165;
    bool _1185 = uint(_1077) >= uint(_794);
    float _1187 = _786 * _993;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1191 = _1189 != 0;
    float _1193 = _1149 * _1031;
    float _1195 = _1031 * _148;
    bool _1197 = !_1001;
    int _1199 = _1197 ? 0 : 1;
    float _1201 = trunc(_1143);
    int _1203 = int(_1201);
    bool _1205 = !_997;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = _786 * _1195;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1217 = _1215 != 0;
    int _1219 = _1055 * _738;
    int _1221 = _1219 + _1183;
    int _1223 = ~_1051;
    int _1225 = _1223 + _1147;
    int _1227 = _1225 + 1;
    float _1229 = _826 * _1195;
    float _1231 = float(_830);
    float _1233 = trunc(_1187);
    int _1235 = int(_1233);
    int _1237 = abs(_1199);
    int _1239 = _754 * _1227;
    int _1241 = _1239 + _804;
    bool _1243 = !_1217;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1249 = _754 == 0;
    bool _1251 = _1231 >= _826;
    bool _1253 = isnan(_1231);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(_826);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = trunc(_1193);
    int _1265 = int(_1263);
    float _1267 = _826 * _1061;
    int _1269 = abs(_1073);
    int _1271 = abs(_1115);
    int _1273 = abs(_1207);
    int _1275 = _1203 * _1269;
    int _1277 = _1275 + _774;
    float _1279 = trunc(_1209);
    int _1281 = int(_1279);
    int _1283 = ~_1181;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    int _1289 = _1235 * _1271;
    int _1291 = _1289 + _804;
    bool _1293 = !_1249;
    int _1295 = _1293 ? _1241 : (-1);
    int _1297 = _1221 * _1237;
    int _1299 = abs(_1125);
    int _1301 = _1287 * _1295;
    int _1303 = abs(_1025);
    int _1305 = _1265 * _1273;
    int _1307 = _1305 + _1297;
    int _1309 = _754 + (-1);
    float _1311 = trunc(_1261);
    int _1313 = int(_1311);
    int _1315 = abs(_1065);
    int _1317 = _1181 * _1309;
    int _1319 = _1317 + _1301;
    int _1321 = abs(_1173);
    int _1323 = _1277 * _1303;
    int _1325 = _1323 + _1307;
    float _1327 = trunc(_1229);
    int _1329 = int(_1327);
    int _1331 = _1319 * _1299;
    int _1333 = abs(_1177);
    int _1335 = _1203 * _1315;
    int _1337 = _1335 + _1325;
    bool _1339 = !_1185;
    int _1341 = _1339 ? 0 : (-1);
    int _1343 = _1281 * _1321;
    int _1345 = _1343 + _1331;
    float _1347 = trunc(_1267);
    int _1349 = int(_1347);
    float _1351 = float(uint(_1337));
    bool _1353 = !_1157;
    int _1355 = _1353 ? 0 : 1;
    int _1357 = _1291 * _1333;
    int _1359 = _1357 + _1345;
    int _1361 = ~_1057;
    int _1363 = _1361 + _1341;
    int _1365 = _1363 + 1;
    float _1367 = as_type<float>(_790) * _1351;
    int _1369 = abs(_1355);
    bool _1371 = !_1191;
    int _1373 = _1371 ? 0 : 1;
    float _1375 = trunc(_1367);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = !_1213;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = _1235 * _1369;
    int _1387 = _1385 + _1359;
    int _1389 = abs(_1373);
    int _1391 = _794 * _1365;
    int _1393 = _1391 + _830;
    bool _1395 = _794 == 0;
    float _1397 = float(uint(_1387));
    int _1399 = _1349 * _1389;
    int _1401 = _1399 + _830;
    int _1403 = ~_686;
    int _1405 = _1403 + 1;
    int _1407 = ~_1313;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = as_type<float>(_820) * _1397;
    bool _1415 = !_1395;
    int _1417 = _1415 ? _1393 : (-1);
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1421 = _1419 != 0;
    int _1423 = _1405 * int(_1379);
    int _1425 = _1423 + _1337;
    int _1427 = _794 + (-1);
    int _1429 = _1411 * _1417;
    int _1431 = abs(_1245);
    float _1433 = trunc(_1413);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = float(uint(_1425));
    int _1441 = _1313 * _1427;
    int _1443 = _1441 + _1429;
    bool _1445 = !_1421;
    int _1447 = _1445 ? 0 : 1;
    int _1449 = abs(_1383);
    float _1451 = as_type<float>(_790) * _1439;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1455 = _1453 != 0;
    int _1457 = ~_754;
    int _1459 = _1457 + 1;
    int _1461 = _1443 * _1431;
    int _1463 = abs(_1447);
    float _1465 = trunc(_1451);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    bool _1471 = !_1455;
    int _1473 = _1471 ? 0 : 1;
    int _1475 = _1329 * _1449;
    int _1477 = _1475 + _1461;
    int _1479 = abs(_1473);
    bool _1481 = _834 > 0.5;
    int _1483 = _1459 * int(_1437);
    int _1485 = _1483 + _1387;
    int _1487 = _1481 ? as_type<int>(_1021) : as_type<int>(_935);
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    int _1493 = _1401 * _1463;
    int _1495 = _1493 + _1477;
    float _1497 = float(uint(_1485));
    float _1499 = _1491 ? as_type<float>(_1487) : _935;
    int _1501 = _1349 * _1479;
    int _1503 = _1501 + _1495;
    int _1505 = int(_1379) + int(_1469);
    float _1507 = as_type<float>(_820) * _1497;
    int _1509 = ~_686;
    int _1511 = _1509 + 1;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1515 = _1513 != 0;
    float _1517 = trunc(_1507);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    float _1523 = float(uint(_1503));
    int _1525 = _1511 * _1505;
    int _1527 = _1525 + _1337;
    bool _1529 = _668 > 0.5;
    float _1531 = float(uint(_1277));
    float _1533 = as_type<float>(_847) * _1523;
    bool _1535 = uint(_1527) >= uint(_686);
    int _1537 = ~_794;
    int _1539 = _1537 + 1;
    float _1541 = as_type<float>(_790) * _1531;
    bool _1543 = !_1535;
    int _1545 = _1543 ? 0 : (-1);
    float _1547 = trunc(_1533);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    float _1553 = _935;
    int _1555 = as_type<int>(_1021);
    int _1557 = _1273;
    float _1559 = as_type<float>(_1291);
    if (_1515)
    {
        float _1561 = _1529 ? _1021 : _935;
        _1553 = _1561;
    }
    float _1563 = _1553;
    float _1565 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1569 = _1567 != 0;
    int _1571 = ~_1505;
    int _1573 = _1571 + _1545;
    int _1575 = _1573 + 1;
    int _1577 = int(_1437) + int(_1521);
    float _1579 = trunc(_1541);
    float _1581 = precise::max(_1579, 0.0);
    uint _1583 = uint(_1581);
    int _1585 = ~_754;
    int _1587 = _1585 + 1;
    int _1589 = _686 * _1575;
    int _1591 = _1589 + _1337;
    int _1593 = ~_686;
    int _1595 = _1593 + 1;
    int _1597 = _1587 * _1577;
    int _1599 = _1597 + _1387;
    bool _1601 = !_1129;
    int _1603 = _1601 ? _1591 : (-1);
    if (_1569)
    {
        float _1605 = -_678;
        float _1607 = _1605 + 1.0;
        _1555 = as_type<int>(_1607);
    }
    int _1609 = _1555;
    int _1611 = _1539 * int(_1551);
    int _1613 = _1611 + _1503;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1619 = _1603 & 3;
    bool _1621 = _1619 != 0;
    if (_1569)
    {
        float _1623 = _1049 ? as_type<float>(_1609) : _678;
        _730 = _1623;
    }
    float _1625 = _730;
    int _1627 = _1603 & 3;
    bool _1629 = _1627 != 0;
    int _1631 = _1595 * int(_1583);
    int _1633 = _1631 + _1277;
    int _1635 = _1621 ? 0 : 1;
    float _1637 = 1.0 / _1617;
    bool _1639 = uint(_1599) >= uint(_754);
    float _1641 = float(uint(_1613));
    bool _1643 = uint(_1627) >= 2u;
    bool _1645 = !_1639;
    int _1647 = _1645 ? 0 : (-1);
    float _1649 = as_type<float>(_847) * _1641;
    int _1651 = _1643 ? 0 : 1;
    bool _1653 = _1627 != 3;
    float _1655 = trunc(_1649);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    bool _1661 = uint(_1627) > 1u;
    int _1663 = ~_1577;
    int _1665 = _1663 + _1647;
    int _1667 = _1665 + 1;
    int _1669 = ~_1651;
    int _1671 = _1669 + 1;
    int _1673 = _1671 + 1;
    int _1675 = ~_1635;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _754 * _1667;
    int _1683 = _1681 + _1387;
    float _1685 = float(uint(_1401));
    int _1687 = _1673;
    int _1689 = _1679;
    float _1691 = as_type<float>(_1627);
    if (_1653)
    {
        int _1693 = ~_1651;
        int _1695 = _1693 + 1;
        _1687 = _1695;
    }
    int _1697 = _1687;
    bool _1699 = !_1249;
    int _1701 = _1699 ? _1683 : (-1);
    float _1703 = as_type<float>(_847) * _1685;
    if (!_1661)
    {
        int _1705 = ~_1635;
        int _1707 = _1705 + 1;
        _1689 = _1707;
    }
    int _1709 = _1689;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1713 = _1711 != 0;
    float _1715 = in.m_46.x;
    float _1717 = in.m_46.y;
    float _1719 = in.m_46.z;
    int _1721 = _1701 & 3;
    bool _1723 = _1721 != 0;
    bool _1725 = !_1713;
    int _1727 = _1725 ? 0 : 1;
    bool _1729 = uint(_1721) >= 2u;
    int _1731 = _1723 ? 0 : 1;
    int _1733 = int(_1551) + int(_1659);
    bool _1735 = _1721 != 3;
    int _1737 = _1729 ? 0 : 1;
    bool _1739 = uint(_1721) > 1u;
    int _1741 = ~_794;
    int _1743 = _1741 + 1;
    int _1745 = ~_1737;
    int _1747 = _1745 + 1;
    int _1749 = _1747 + 1;
    int _1751 = ~_1731;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    int _1757 = _1743 * _1733;
    int _1759 = _1757 + _1503;
    float _1761 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1763 = _1749;
    int _1765 = _1755;
    float _1767 = as_type<float>(_1721);
    if (_1735)
    {
        int _1769 = ~_1737;
        int _1771 = _1769 + 1;
        _1763 = _1771;
    }
    int _1773 = _1763;
    float _1775 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1777 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1761);
    bool _1779 = uint(_1759) >= uint(_794);
    float _1781 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1775);
    if (!_1739)
    {
        int _1783 = ~_1731;
        int _1785 = _1783 + 1;
        _1765 = _1785;
    }
    int _1787 = _1765;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1791 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1781);
    bool _1793 = !_1779;
    int _1795 = _1793 ? 0 : (-1);
    float _1797 = -_1789;
    float _1799 = fma(_1565, 2.0, _1797);
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1803 = _1801 != 0;
    float _1805 = _1791 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1809 = _1807 != 0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1813 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1815 = float(uint(_1291));
    float _1817 = fma(_1247, -2.0, _1811);
    float _1819 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1813);
    float _1821 = float(uint(_1633));
    float _1823 = as_type<float>(_820) * _1815;
    float _1825 = trunc(_1703);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1839 = as_type<float>(_790) * _1821;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1841;
    float _1845 = _1833 * _1637;
    float _1847 = _1837 * _1083;
    float _1849 = trunc(_1823);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1855;
    int _1859 = ~_794;
    int _1861 = _1859 + 1;
    float _1863 = _1843 * _1097;
    int _1865 = ~_754;
    int _1867 = _1865 + 1;
    float _1869 = _1857 * _1127;
    int _1871 = ~_686;
    int _1873 = _1871 + 1;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1879 = trunc(_1839);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    int _1885 = _1861 * int(_1829);
    int _1887 = _1885 + _1401;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1895 = _1893 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1897 = ~_1733;
    int _1899 = _1897 + _1795;
    int _1901 = _1899 + 1;
    float _1903 = _648 + _654;
    float _1905 = float(uint(_1887));
    float _1907 = _1895 * _1159;
    int _1909 = _1867 * int(_1853);
    int _1911 = _1909 + _1291;
    float _1913 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1819);
    float _1915 = _1903 + (-1.0);
    float _1917 = float(uint(_1911));
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_1891)
    {
        _1557 = 0;
    }
    int _1923 = _1557;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1927 = _1925 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1929 = int(_1583) + int(_1883);
    float _1931 = as_type<float>(_820) * _1917;
    float _1933 = as_type<float>(_847) * _1905;
    int _1935 = _794 * _1901;
    int _1937 = _1935 + _1503;
    float _1939 = _648 * 2.0;
    int _1941 = _1923;
    if (_1891)
    {
        _861 = 0;
    }
    int _1943 = _861;
    int _1945 = _1873 * _1929;
    int _1947 = _1945 + _1277;
    bool _1949 = !_1803;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = 1.0 / _1921;
    bool _1955 = !_1395;
    int _1957 = _1955 ? _1937 : (-1);
    float _1959 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1961 = uint(_1947) >= uint(_686);
    float _1963 = _1913 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1965 = _1943;
    if (!_1891)
    {
        _1965 = 1;
    }
    int _1967 = _1965;
    float _1969 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1817);
    if (!_1891)
    {
        _1941 = 2;
    }
    int _1971 = _1941;
    float _1973 = floor(_1939);
    int _1975 = _1957 & 3;
    bool _1977 = _1975 != 0;
    bool _1979 = !_1809;
    int _1981 = _1979 ? 0 : 1;
    bool _1983 = _1975 != 3;
    bool _1985 = !_1961;
    int _1987 = _1985 ? 0 : (-1);
    float _1989 = trunc(_1931);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    bool _1995 = uint(_1975) >= 2u;
    float _1997 = _1877 * _1953;
    bool _1999 = !_1629;
    int _2001 = _1999 ? 0 : 1;
    int _2003 = _1995 ? 0 : 1;
    float _2005 = fma(_1997, _652, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2007 = uint(_1975) > 1u;
    float _2009 = trunc(_1933);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    int _2015 = ~_2003;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _2019;
    if (_1983)
    {
        int _2023 = ~_2003;
        int _2025 = _2023 + 1;
        _2021 = _2025;
    }
    int _2027 = _2021;
    int _2029 = _1977 ? 0 : 1;
    bool _2031 = _1973 > 0.0;
    float _2033 = 1.0 / _1927;
    bool _2035 = _1973 >= 0.0;
    bool _2037 = isnan(_1973);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    int _2045 = ~_754;
    int _2047 = _2045 + 1;
    int _2049 = int(_1853) + int(_1993);
    float _2051 = _654 * 2.0;
    float _2053 = _668 * 2.0;
    int _2055 = int(_1829) + int(_2013);
    float _2057 = _654 + _668;
    float _2059 = floor(_2051);
    int _2061 = abs(_2001);
    int _2063 = _2047 * _2049;
    int _2065 = _2063 + _1291;
    float _2067 = _720 * _2033;
    int _2069 = ~_2029;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = _2057 + (-1.0);
    int _2077 = _2073;
    if (!_2007)
    {
        int _2079 = ~_2029;
        int _2081 = _2079 + 1;
        _2077 = _2081;
    }
    int _2083 = _2077;
    float _2085 = floor(_2053);
    int _2087 = ~_794;
    int _2089 = _2087 + 1;
    float _2091 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2093 = uint(_2065) >= uint(_754);
    float _2095 = fma(_2067, _662, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2097 = ~_1929;
    int _2099 = _2097 + _1987;
    int _2101 = _2099 + 1;
    int _2103 = _2089 * _2055;
    int _2105 = _2103 + _1401;
    bool _2107 = !_2093;
    int _2109 = _2107 ? 0 : (-1);
    int _2111 = _2043 ? 0 : 1;
    int _2113 = _686 * _2101;
    int _2115 = _2113 + _1277;
    bool _2117 = uint(_2105) >= uint(_794);
    bool _2119 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2121 = isnan(_642);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2127 = _2123 || _2125;
    float _2129 = float(_2127);
    bool _2131 = !_2117;
    int _2133 = _2131 ? 0 : (-1);
    int _2135 = ~_2111;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = -_2129;
    float _2143 = _2141 + 1.0;
    bool _2145 = _2059 > 0.0;
    bool _2147 = _2059 >= 0.0;
    bool _2149 = isnan(_2059);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    int _2157 = _2139;
    if (!_2031)
    {
        int _2159 = ~_2111;
        int _2161 = _2159 + 1;
        _2157 = _2161;
    }
    int _2163 = _2157;
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2167 = _642 + _2165;
    bool _2169 = !_1129;
    int _2171 = _2169 ? _2115 : (-1);
    float _2173 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1777);
    bool _2175 = _2085 > 0.0;
    bool _2177 = _2085 >= 0.0;
    bool _2179 = isnan(_2085);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = _2173 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2189 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2191 = isnan(_642);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2197 = _2193 || _2195;
    float _2199 = float(_2197);
    bool _2201 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2203 = isnan(_642);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2209 = _2205 || _2207;
    float _2211 = float(_2209);
    bool _2213 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2215 = isnan(_642);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2199 * _2143;
    float _2227 = -_2199;
    float _2229 = _2227 + 1.0;
    float _2231 = -_2211;
    float _2233 = _2231 + 1.0;
    float _2235 = fma(_1845, _2167, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2239 = _642 + _2237;
    float _2241 = _2211 * _2229;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2245 = _642 + _2243;
    float _2247 = _750 * _2233;
    float _2249 = -_750;
    float _2251 = _2249 + 1.0;
    float _2253 = fma(_1847, _2239, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2255 = fma(_1863, _2245, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2259 = _642 + _2257;
    bool _2261 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2263 = isnan(_642);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2269 = _2265 || _2267;
    float _2271 = float(_2269);
    float _2273 = _2223 * _2251;
    float _2275 = -_2223;
    float _2277 = _2275 + 1.0;
    float _2279 = fma(_1907, _2259, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2283 = _642 + _2281;
    bool _2285 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2287 = isnan(_642);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = _2271 * _2277;
    float _2299 = -_2271;
    float _2301 = _2299 + 1.0;
    float _2303 = fma(_1869, _2283, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2305 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2307 = isnan(_642);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = -_2295;
    float _2319 = _2317 + 1.0;
    float _2321 = _2295 * _2301;
    int _2323 = _2155 ? 0 : 1;
    bool _2325 = _1971 != 2;
    float _2327 = _2315 * _2319;
    float _2329 = -_2315;
    float _2331 = _2329 + 1.0;
    int _2333 = ~_2049;
    int _2335 = _2333 + _2109;
    int _2337 = _2335 + 1;
    float _2339 = _2235 * _2327;
    int _2341 = ~_2055;
    int _2343 = _2341 + _2133;
    int _2345 = _2343 + 1;
    int _2347 = ~_2323;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2339);
    int _2355 = _754 * _2337;
    int _2357 = _2355 + _1291;
    int _2359 = _2351;
    float _2361 = _2321;
    if (!_2145)
    {
        int _2363 = ~_2323;
        int _2365 = _2363 + 1;
        _2359 = _2365;
    }
    int _2367 = _2359;
    int _2369 = _794 * _2345;
    int _2371 = _2369 + _1401;
    float _2373 = fma(_2253, _2321, _2353);
    if (_2325)
    {
        _1559 = _648;
    }
    float _2375 = _1559;
    float _2377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2379 = _2187 + _2377;
    bool _2381 = _1967 != 1;
    float _2383 = fma(_2255, _2297, _2373);
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2387 = _1963 + _2385;
    float _2389 = _2375;
    if (!_2325)
    {
        _2389 = _668;
    }
    float _2391 = _2389;
    float _2393 = fma(_2279, _2273, _2383);
    int _2395 = _2185 ? 0 : 1;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2399 = !_1249;
    int _2401 = _2399 ? _2357 : (-1);
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2405 = !_1395;
    int _2407 = _2405 ? _2371 : (-1);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2411 = _1805 + _2409;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2415 = _2413 != 0;
    int _2417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2419 = _2417 != 0;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2423 = _2421 != 0;
    float _2425 = -_2397;
    float _2427 = fma(_2403, 2.0, _2425);
    int _2429 = _1603 >> 31;
    float _2431 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2433 = _1701 & 3;
    bool _2435 = _2433 != 0;
    float _2437 = fma(_2303, _2247, _2393);
    int _2439 = _2429 & 3;
    float _2441 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2431);
    bool _2443 = !_2435;
    int _2445 = _2443 ? 0 : 1;
    float _2447 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2449 = int(_2447);
    int _2451 = _1957 & 3;
    bool _2453 = _2451 != 0;
    float _2455 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2441);
    int _2457 = _1701 >> 31;
    float _2459 = fma(_2005, _2241, _2437);
    int _2461 = _1603 + _2439;
    int _2463 = _1957 >> 31;
    float _2465 = fma(_2095, _2225, _2459);
    bool _2467 = !_2453;
    int _2469 = _2467 ? 0 : 1;
    int _2471 = _2457 & 3;
    float _2473 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2465);
    bool _2475 = _1627 != 3;
    int _2477 = _2461 >> 2;
    int _2479 = _2463 & 3;
    out.m_63.x = _2473;
    int _2481 = _1701 + _2471;
    bool _2483 = !_2475;
    int _2485 = _2483 ? 0 : (-1);
    bool _2487 = _1721 != 3;
    int _2489 = _2477 << 4;
    int _2491 = _2489 + 368;
    int _2493 = _1957 + _2479;
    int _2495 = ~_2395;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    int _2501 = _2481 >> 2;
    int _2503 = _2499;
    if (!_2175)
    {
        int _2505 = ~_2395;
        int _2507 = _2505 + 1;
        _2503 = _2507;
    }
    int _2509 = _2503;
    bool _2511 = !_2487;
    int _2513 = _2511 ? 0 : (-1);
    uint _2515 = uint(int(uint(_2491) >> uint(2)));
    uint _2517 = uint(int(uint(int(_2515)) >> uint(2)));
    int _2519 = int(_2515) & 3;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[int(_2517)][_2519];
    int _2523 = int(_2515) + 1;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    int _2527 = _2523 & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    bool _2531 = _1975 != 3;
    int _2533 = _2501 << 4;
    int _2535 = _2533 + 512;
    int _2537 = _2493 >> 2;
    uint _2539 = uint(int(uint(_2535) >> uint(2)));
    uint _2541 = uint(int(uint(int(_2539)) >> uint(2)));
    int _2543 = int(_2539) & 3;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[int(_2541)][_2543];
    int _2547 = int(_2539) + 1;
    uint _2549 = uint(int(uint(_2547) >> uint(2)));
    int _2551 = _2547 & 3;
    float _2553 = (*spvDescriptorSet0.vp_c9)._m0[int(_2549)][_2551];
    int _2555 = _2537 << 4;
    int _2557 = _2555 + 656;
    if (!_2381)
    {
        _1691 = _668;
    }
    float _2559 = _1691;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2563 = _2559;
    if (_2381)
    {
        _2563 = _654;
    }
    float _2565 = _2563;
    int _2567 = abs(_1787);
    uint _2569 = uint(int(uint(_2557) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    if (!_2381)
    {
        _1767 = _654;
    }
    float _2585 = _1767;
    float _2587 = fma(_2565, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2561);
    bool _2589 = !_2531;
    int _2591 = _2589 ? 0 : (-1);
    bool _2593 = _2455 >= 0.0;
    float _2595 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2587);
    int _2597 = abs(_1709);
    int _2599 = _2491 + 8;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    uint _2603 = uint(int(uint(int(_2601)) >> uint(2)));
    int _2605 = int(_2601) & 3;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[int(_2603)][_2605];
    int _2609 = int(_2601) + 1;
    uint _2611 = uint(int(uint(_2609) >> uint(2)));
    int _2613 = _2609 & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    float _2617 = _2585;
    if (!_2381)
    {
        _2361 = _2585;
    }
    float _2619 = _2361;
    float _2621 = _2619;
    if (_2381)
    {
        _2617 = _648;
    }
    float _2623 = _2617;
    float _2625 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2627 = ~_2597;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    int _2633 = _2557 + 8;
    uint _2635 = uint(int(uint(_2633) >> uint(2)));
    uint _2637 = uint(int(uint(int(_2635)) >> uint(2)));
    int _2639 = int(_2635) & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = int(_2635) + 1;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    int _2647 = _2643 & 3;
    float _2649 = (*spvDescriptorSet0.vp_c9)._m0[int(_2645)][_2647];
    if (_2381)
    {
        _2621 = _648;
    }
    float _2651 = _2621;
    float _2653 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2625);
    if (_2593)
    {
        out.m_49.x = 0.0;
    }
    int _2655 = ~_2061;
    int _2657 = _2655 + 1;
    int _2659 = _2657 + 1;
    float _2661 = _2651 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2663 = ~_2567;
    int _2665 = _2663 + 1;
    int _2667 = _2665 + 1;
    int _2669 = _2535 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2689 = abs(_2445);
    int _2691 = abs(_2083);
    int _2693 = abs(_2469);
    int _2695 = _2631 * as_type<int>(_2529);
    float _2697 = -_2687;
    float _2699 = fma(_2661, 2.0, _2697);
    int _2701 = abs(_1773);
    int _2703 = _2659 * as_type<int>(_2521);
    int _2705 = _2703 + _2695;
    int _2707 = abs(_1697);
    float _2709 = -_148;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2699);
    int _2713 = _2667 * as_type<int>(_2553);
    int _2715 = ~_2691;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    float _2721 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2723 = int(_2721);
    int _2725 = ~_2689;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    int _2731 = ~_2693;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = _2719 * as_type<int>(_2583);
    int _2739 = ~_2707;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2729 * as_type<int>(_2545);
    int _2747 = _2745 + _2713;
    int _2749 = abs(_2027);
    int _2751 = _2735 * as_type<int>(_2575);
    int _2753 = _2751 + _2737;
    int _2755 = abs(_2485);
    float _2757 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2759 = int(_2757);
    int _2761 = ~_2749;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    int _2767 = _2743 * as_type<int>(_2607);
    int _2769 = _2767 + _2705;
    int _2771 = ~_2701;
    int _2773 = _2771 + 1;
    int _2775 = _2773 + 1;
    int _2777 = abs(_2513);
    int _2779 = ~_2755;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = abs(_2591);
    int _2787 = _2765 * as_type<int>(_2641);
    int _2789 = _2787 + _2753;
    float _2791 = float(uint(_2723));
    int _2793 = _2783 * as_type<int>(_2615);
    int _2795 = _2793 + _2769;
    int _2797 = abs(_1727);
    int _2799 = ~_2777;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    float _2805 = 1.0 / _2791;
    int _2807 = ~_2785;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    int _2813 = _2775 * as_type<int>(_2677);
    int _2815 = _2813 + _2747;
    int _2817 = abs(_1951);
    float _2819 = float(uint(_2449));
    int _2821 = _2803 * as_type<int>(_2685);
    int _2823 = _2821 + _2815;
    int _2825 = abs(_2449);
    int _2827 = _2811 * as_type<int>(_2649);
    int _2829 = _2827 + _2789;
    float _2831 = 1.0 / _2819;
    int _2833 = ~_2817;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = ~_2797;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = float(uint(_2759));
    int _2847 = _2837 * _2823;
    int _2849 = abs(_1981);
    int _2851 = abs(_2759);
    int _2853 = _2795 * _2843;
    float _2855 = 1.0 / _2845;
    int _2857 = _2401 * _2817;
    int _2859 = _2857 + _2847;
    int _2861 = _2171 * _2797;
    int _2863 = _2861 + _2853;
    int _2865 = abs(_2723);
    float _2867 = float(uint(_2825));
    int _2869 = ~_2849;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    float _2875 = float(uint(_2851));
    float _2877 = float(uint(_2865));
    float _2879 = 1.0 / _2867;
    int _2881 = _2873 * _2829;
    int _2883 = as_type<int>(_2831) + (-2);
    float _2885 = float(uint(_2863));
    int _2887 = _2407 * _2849;
    int _2889 = _2887 + _2881;
    int _2891 = as_type<int>(_2805) + (-2);
    float _2893 = 1.0 / _2877;
    float _2895 = float(uint(_2859));
    float _2897 = as_type<float>(_2883) * _2885;
    int _2899 = ~_2759;
    int _2901 = _2899 + 1;
    int _2903 = as_type<int>(_2855) + (-2);
    float _2905 = as_type<float>(_2891) * _2895;
    float _2907 = float(uint(_2889));
    float _2909 = 1.0 / _2875;
    int _2911 = abs(_2863);
    float _2913 = as_type<float>(_2903) * _2907;
    int _2915 = as_type<int>(_2879) + (-2);
    int _2917 = abs(_2859);
    float _2919 = trunc(_2897);
    float _2921 = precise::max(_2919, 0.0);
    uint _2923 = uint(_2921);
    float _2925 = float(uint(_2911));
    int _2927 = as_type<int>(_2893) + (-2);
    int _2929 = abs(_2889);
    int _2931 = ~_2449;
    int _2933 = _2931 + 1;
    float _2935 = trunc(_2913);
    float _2937 = precise::max(_2935, 0.0);
    uint _2939 = uint(_2937);
    int _2941 = as_type<int>(_2909) + (-2);
    float _2943 = as_type<float>(_2915) * _2925;
    bool _2945 = !_2419;
    int _2947 = _2945 ? 0 : 1;
    float _2949 = float(uint(_2917));
    float _2951 = trunc(_2905);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    int _2957 = abs(_2947);
    float _2959 = as_type<float>(_2927) * _2949;
    float _2961 = float(_2163);
    float _2963 = float(uint(_2929));
    float _2965 = trunc(_2943);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    int _2971 = _2933 * int(_2923);
    int _2973 = _2971 + _2863;
    int _2975 = ~_2723;
    int _2977 = _2975 + 1;
    float _2979 = as_type<float>(_2941) * _2963;
    float _2981 = float(_2957);
    int _2983 = _2901 * int(_2939);
    int _2985 = _2983 + _2889;
    float _2987 = float(uint(_2973));
    float _2989 = trunc(_2959);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    float _2995 = _2687;
    float _2997 = as_type<float>(_2923);
    if (!_2381)
    {
        _2995 = _668;
    }
    float _2999 = _2995;
    float _3001 = _2981 * _2961;
    int _3003 = _2977 * int(_2955);
    int _3005 = _3003 + _2859;
    float _3007 = _2999;
    if (_2381)
    {
        _3007 = _654;
    }
    float _3009 = _3007;
    float _3011 = as_type<float>(_2883) * _2987;
    float _3013 = float(uint(_2985));
    float _3015 = trunc(_2979);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = ~_2825;
    int _3023 = _3021 + 1;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3029 = float(uint(_3005));
    float _3031 = as_type<float>(_2903) * _3013;
    int _3033 = ~_2851;
    int _3035 = _3033 + 1;
    int _3037 = _3023 * int(_2969);
    int _3039 = _3037 + _2911;
    float _3041 = trunc(_3011);
    float _3043 = precise::max(_3041, 0.0);
    uint _3045 = uint(_3043);
    float _3047 = fma(_3027, -2.0, _3025);
    int _3049 = ~_2865;
    int _3051 = _3049 + 1;
    float _3053 = as_type<float>(_2891) * _3029;
    bool _3055 = !_2415;
    int _3057 = _3055 ? 0 : 1;
    int _3059 = _3051 * int(_2993);
    int _3061 = _3059 + _2917;
    float _3063 = float(uint(_3039));
    int _3065 = _3035 * int(_3019);
    int _3067 = _3065 + _2929;
    int _3069 = abs(_3057);
    float _3071 = trunc(_3053);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = float(_2509);
    float _3079 = as_type<float>(_2915) * _3063;
    float _3081 = float(_3069);
    float _3083 = float(uint(_3061));
    float _3085 = float(uint(_3067));
    float _3087 = trunc(_3079);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    int _3093 = int(_2923) + int(_3045);
    float _3095 = _3081 * _3077;
    float _3097 = as_type<float>(_2927) * _3083;
    float _3099 = _3085;
    if (_2325)
    {
        _2997 = _654;
    }
    float _3101 = _2997;
    float _3103 = as_type<float>(_2941) * _3085;
    float _3105 = _3101;
    if (!_2325)
    {
        _3105 = _648;
    }
    float _3107 = _3105;
    float _3109 = _3095 * (-2.0);
    int _3111 = as_type<int>(_3107);
    if (_2593)
    {
        _3099 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3113 = _3099;
    float _3115 = trunc(_3031);
    float _3117 = precise::max(_3115, 0.0);
    uint _3119 = uint(_3117);
    float _3121 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3123 = ~_2449;
    int _3125 = _3123 + 1;
    if (_2593)
    {
        float _3127 = _3113 * 5.0;
        _3111 = as_type<int>(_3127);
    }
    int _3129 = _3111;
    float _3131 = fma(_1959, _3109, _1959);
    int _3133 = ~_2723;
    int _3135 = _3133 + 1;
    float _3137 = in.m_65.x;
    float _3139 = in.m_65.y;
    float _3141 = in.m_65.z;
    float _3143 = trunc(_3097);
    float _3145 = precise::max(_3143, 0.0);
    uint _3147 = uint(_3145);
    if (_2593)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9523 = as_type<float>(_3129);
        out.gl_Position.z = _9523;
    }
    int _3149 = int(_2955) + int(_3075);
    int _3151 = int(_2969) + int(_3091);
    int _3153 = _3125 * _3093;
    int _3155 = _3153 + _2863;
    float _3157 = trunc(_3103);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = int(_2939) + int(_3119);
    int _3165 = ~_2851;
    int _3167 = _3165 + 1;
    bool _3169 = uint(_3155) >= uint(_2449);
    int _3171 = ~_2825;
    int _3173 = _3171 + 1;
    int _3175 = ~_2759;
    int _3177 = _3175 + 1;
    int _3179 = _3135 * _3149;
    int _3181 = _3179 + _2859;
    int _3183 = int(_2993) + int(_3147);
    int _3185 = _3173 * _3151;
    int _3187 = _3185 + _2911;
    int _3189 = ~_2865;
    int _3191 = _3189 + 1;
    int _3193 = _3177 * _3163;
    int _3195 = _3193 + _2889;
    bool _3197 = uint(_3181) >= uint(_2723);
    float _3199 = fma(_3109, _3137, _3137);
    bool _3201 = uint(_3187) >= uint(_2825);
    int _3203 = _3191 * _3183;
    int _3205 = _3203 + _2917;
    bool _3207 = !_3169;
    int _3209 = _3207 ? 0 : (-1);
    float _3211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3213 = !_3197;
    int _3215 = _3213 ? 0 : (-1);
    bool _3217 = uint(_3195) >= uint(_2759);
    int _3219 = ~_3093;
    int _3221 = _3219 + _3209;
    int _3223 = _3221 + 1;
    int _3225 = ~_3149;
    int _3227 = _3225 + _3215;
    int _3229 = _3227 + 1;
    float _3231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3233 = int(_3019) + int(_3161);
    int _3235 = _2449 * _3223;
    int _3237 = _3235 + _2863;
    bool _3239 = uint(_3205) >= uint(_2865);
    int _3241 = _2723 * _3229;
    int _3243 = _3241 + _2859;
    bool _3245 = !_3217;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3167 * _3233;
    int _3251 = _3249 + _2929;
    bool _3253 = _2449 == 0;
    float _3255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3257 = !_3239;
    int _3259 = _3257 ? 0 : (-1);
    bool _3261 = _2723 == 0;
    int _3263 = ~_3163;
    int _3265 = _3263 + _3247;
    int _3267 = _3265 + 1;
    bool _3269 = !_3253;
    int _3271 = _3269 ? _3237 : (-1);
    bool _3273 = !_3261;
    int _3275 = _3273 ? _3243 : (-1);
    int _3277 = _2759 * _3267;
    int _3279 = _3277 + _2889;
    bool _3281 = _2759 == 0;
    bool _3283 = _2759 == 0;
    int _3285 = _2889 ^ _2759;
    float _3287 = _3211 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3289 = ~_3259;
    int _3291 = _3183 + _3289;
    int _3293 = _3291 + 1;
    float _3295 = _3231 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3297 = float(_3271);
    float _3299 = -_148;
    float _3301 = fma(_3299, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1799);
    bool _3303 = uint(_3251) >= uint(_2851);
    float _3305 = fma(_3287, _981, -0.5);
    int _3307 = _2863 ^ _2449;
    float _3309 = fma(_3287, _3297, _3301);
    float _3311 = float(_3275);
    float _3313 = fma(_3295, _1017, -0.5);
    bool _3315 = !_3281;
    int _3317 = _3315 ? _3279 : (-1);
    float _3319 = _3255 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3321 = !_3303;
    int _3323 = _3321 ? 0 : (-1);
    float _3325 = _2411 * _2411;
    bool _3327 = _2723 == 0;
    float _3329 = fma(_3319, _1625, -0.5);
    bool _3331 = !_3201;
    int _3333 = _3331 ? 0 : (-1);
    int _3335 = _2859 ^ _2723;
    uint _3337 = uint(int(uint(_3307) >> uint(31)));
    float _3339 = fma(_3295, _3311, _2711);
    float _3341 = float(_3317);
    float _3343 = -_148;
    float _3345 = fma(_3343, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2427);
    int _3347 = ~_3333;
    int _3349 = _3151 + _3347;
    int _3351 = _3349 + 1;
    float _3353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3355 = ~int(_3337);
    int _3357 = _3355 + 1;
    float _3359 = fma(_3319, _3341, _3345);
    uint _3361 = uint(int(uint(_3335) >> uint(31)));
    int _3363 = _3351 ^ _3357;
    int _3365 = ~int(_3361);
    int _3367 = _3365 + 1;
    uint _3369 = uint(int(uint(_3285) >> uint(31)));
    float _3371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3373 = ~_3357;
    int _3375 = _3373 + _3363;
    int _3377 = _3375 + 1;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3381 = _3293 ^ _3367;
    float _3383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3385 = ~int(_3369);
    int _3387 = _3385 + 1;
    float _3389 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3371);
    int _3391 = ~_3367;
    int _3393 = _3391 + _3381;
    int _3395 = _3393 + 1;
    float _3397 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3379);
    float _3399 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2653);
    bool _3401 = _2449 == 0;
    float _3403 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3389);
    int _3405 = ~_3323;
    int _3407 = _3233 + _3405;
    int _3409 = _3407 + 1;
    float _3411 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3397);
    float _3413 = fma(_3399, _3313, _3339);
    float _3415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3417 = !_3327;
    int _3419 = _3417 ? _3395 : (-1);
    float _3421 = fma(_3403, _3305, _3309);
    bool _3423 = !_3401;
    int _3425 = _3423 ? _3377 : (-1);
    float _3427 = fma(_3411, _3329, _3359);
    float _3429 = _3353 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3431 = _3409 ^ _3387;
    float _3433 = _3383 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3435 = float(_3419);
    float _3437 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3047);
    float _3439 = float(_3425);
    float _3441 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3443 = ~_3387;
    int _3445 = _3443 + _3431;
    int _3447 = _3445 + 1;
    float _3449 = fma(_1095, _3429, -0.5);
    float _3451 = -_3437;
    float _3453 = fma(_3433, _3435, _3451);
    float _3455 = -_1969;
    float _3457 = fma(_3429, _3439, _3455);
    bool _3459 = !_3283;
    int _3461 = _3459 ? _3447 : (-1);
    float _3463 = fma(_3121, -2.0, _3441);
    float _3465 = fma(_1499, _3433, -0.5);
    float _3467 = float(_3461);
    float _3469 = _3415 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3471 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3463);
    float _3473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3477 = log2(_3475);
    float _3479 = -_3471;
    float _3481 = fma(_3469, _3467, _3479);
    float _3483 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3473);
    float _3485 = fma(_2379, _2379, _3325);
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3489 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3491 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3483);
    float _3493 = fma(_2387, _2387, _3485);
    float _3495 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3487);
    float _3497 = fma(_3469, _1563, -0.5);
    float _3499 = fma(_3491, _3449, _3457);
    float _3501 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3495);
    float _3503 = rsqrt(_3493);
    float _3505 = fma(_2595, _3465, _3453);
    float _3507 = _3421 + 0.5;
    float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3511 = 1.0 + _3509;
    float _3513 = fma(_3501, _3497, _3481);
    float _3515 = _3413 + 0.5;
    float _3517 = _3499 + 0.5;
    float _3519 = _3505 + 0.5;
    float _3521 = 1.0 / _3511;
    float _3523 = _3427 + 0.5;
    float _3525 = _3513 + 0.5;
    float _3527 = _3489 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3529 = _3477 * _148;
    out.m_67.x = _3507;
    out.m_67.y = _3517;
    out.m_67.z = _3515;
    out.m_67.w = _3519;
    bool _3531 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3533 = isnan(1.0);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3539 = _3535 || _3537;
    float _3541 = _3527 * _3503;
    out.m_69.x = _3523;
    out.m_69.y = _3525;
    float _3543 = exp2(_3529);
    bool _3545 = !_2423;
    int _3547 = _3545 ? 0 : 1;
    float _3549 = _2379 * _3541;
    float _3551 = _2411 * _3541;
    float _3553 = as_type<float>(_3395);
    float _3555 = as_type<float>(_3149);
    if (_2593)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3557 = -_3551;
    float _3559 = _1805 + _3557;
    float _3561 = _2387 * _3541;
    float _3563 = -_3549;
    float _3565 = _2187 + _3563;
    float _3567 = -_3543;
    float _3569 = _3567 + 1.0;
    float _3571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3573 = _3559 + _3571;
    float _3575 = -_3561;
    float _3577 = _1963 + _3575;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3581 = _3565 + _3579;
    bool _3583 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3585 = isnan(0.0);
    bool _3587 = _3583 || _3585;
    bool _3589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3591 = _3587 || _3589;
    float _3593 = _3573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3597 = _3577 + _3595;
    float _3599 = -_3551;
    float _3601 = _2411 + _3599;
    float _3603 = _3591 ? _3569 : 0.0;
    float _3605 = fma(_3581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3593);
    float _3607 = _648 + (-0.5);
    float _3609 = -_3549;
    float _3611 = _2379 + _3609;
    float _3613 = _3601 * _3601;
    float _3615 = fma(_3597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3605);
    float _3617 = _3593;
    float _3619 = _3581;
    float _3621 = _3561;
    if (_3539)
    {
        float _3623 = _3603 * _3521;
        _150 = _3623;
    }
    float _3625 = _150;
    float _3627 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3199);
    float _3629 = _3001 * (-2.0);
    float _3631 = fma(_3611, _3611, _3613);
    bool _3633 = _3615 >= 0.0;
    float _3635 = -_3561;
    float _3637 = _2387 + _3635;
    float _3639 = fma(_3131, _3625, _3627);
    float _3641 = _654 + (-0.5);
    float _3643 = fma(_3629, _3139, _3139);
    float _3645 = fma(_3637, _3637, _3631);
    float _3647 = _3639 * 0.15915493667125701904296875;
    int _3649 = abs(_3547);
    float _3651 = fma(_3641, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3643);
    float _3653 = float(_2367);
    float _3655 = sqrt(_3645);
    float _3657 = fma(_2091, _3629, _2091);
    if (_3633)
    {
        out.m_49.x = 0.0;
    }
    if (_3633)
    {
        _3617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3659 = _3617;
    float _3661 = float(_3649);
    float _3663 = fma(_3657, _3625, _3651);
    float _3665 = _3647 * 6.283185482025146484375;
    float _3667 = sin(_3665);
    int _3669 = as_type<int>(_3659);
    if (_3633)
    {
        float _3671 = _3659 * 5.0;
        _3669 = as_type<int>(_3671);
    }
    int _3673 = _3669;
    float _3675 = _3661 * _3653;
    if (_3633)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10340 = as_type<float>(_3673);
        out.gl_Position.z = _10340;
    }
    float _3677 = _3647 * 6.283185482025146484375;
    float _3679 = cos(_3677);
    if (_3633)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3681 = -_1805;
    float _3683 = _3681 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3685 = -_2187;
    float _3687 = _3685 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3689 = -_1963;
    float _3691 = _3689 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3693 = _648 + _668;
    float _3695 = _3683 * _3683;
    float _3697 = _3675 * (-2.0);
    float _3699 = _668 + (-0.5);
    float _3701 = _3693 + (-1.0);
    float _3703 = fma(_3687, _3687, _3695);
    float _3705 = fma(_3697, _3141, _3141);
    float _3707 = _3663 * 0.15915493667125701904296875;
    float _3709 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3711 = fma(_3691, _3691, _3703);
    float _3713 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3705);
    float _3715 = _3707 * 6.283185482025146484375;
    float _3717 = sin(_3715);
    float _3719 = fma(_3709, _3697, _3709);
    float _3721 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3723 = fma(_3719, _3625, _3713);
    float _3725 = _3503 * _3655;
    bool _3727 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3729 = isnan(0.5);
    bool _3731 = _3727 || _3729;
    bool _3733 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3735 = _3731 || _3733;
    float _3737 = rsqrt(_3711);
    float _3739 = _3723 * 0.15915493667125701904296875;
    float _3741 = _3489 * _3725;
    float _3743 = in.m_71.x;
    float _3745 = in.m_71.y;
    float _3747 = in.m_71.z;
    float _3749 = _3707 * 6.283185482025146484375;
    float _3751 = cos(_3749);
    float _3753 = _3667 * _3717;
    float _3755 = _3687 * _3737;
    float _3757 = _3691 * _3737;
    float _3759 = _3683 * _3737;
    float _3761 = _3739 * 6.283185482025146484375;
    float _3763 = sin(_3761);
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3767 = _3755 * _3765;
    float _3769 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3771 = _3757 * _3769;
    float _3773 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3775 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3777 = -_3767;
    float _3779 = fma(_3757, _3775, _3777);
    float _3781 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3783 = -_3771;
    float _3785 = fma(_3759, _3781, _3783);
    float _3787 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3789 = _3759 * _3787;
    float _3791 = _3739 * 6.283185482025146484375;
    float _3793 = cos(_3791);
    float _3795 = _3779 * _3779;
    float _3797 = _3679 * _3751;
    float _3799 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3801 = -_3789;
    float _3803 = fma(_3755, _3799, _3801);
    float _3805 = _3725 * _3773;
    float _3807 = fma(_3785, _3785, _3795);
    float _3809 = _3667 * _3751;
    float _3811 = _3725 * _3721;
    float _3813 = fma(_3763, _3797, _3753);
    float _3815 = fma(_3803, _3803, _3807);
    float _3817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3745);
    float _3819 = fma(_3763, _3753, _3797);
    float _3821 = _3679 * _3717;
    float _3823 = _3817 * _3805;
    float _3825 = rsqrt(_3815);
    float _3827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3743);
    float _3829 = _3679 * _3793;
    float _3831 = _3717 * _3793;
    float _3833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3747);
    float _3835 = _3827 * _3741;
    float _3837 = _3829 * _3823;
    float _3839 = -_3821;
    float _3841 = fma(_3763, _3809, _3839);
    float _3843 = -_3809;
    float _3845 = fma(_3763, _3821, _3843);
    float _3847 = _3751 * _3793;
    float _3849 = fma(_3813, _3835, _3837);
    float _3851 = _3667 * _3793;
    float _3853 = _3833 * _3811;
    float _3855 = -_3823;
    float _3857 = _3763 * _3855;
    float _3859 = _3851 * _3823;
    float _3861 = _3785 * _3825;
    float _3863 = _3779 * _3825;
    float _3865 = _3803 * _3825;
    float _3867 = fma(_3847, _3835, _3857);
    float _3869 = _3759 * _3861;
    float _3871 = fma(_3845, _3853, _3849);
    float _3873 = _3757 * _3863;
    float _3875 = fma(_3841, _3835, _3859);
    float _3877 = -_3869;
    float _3879 = fma(_3755, _3863, _3877);
    float _3881 = fma(_3831, _3853, _3867);
    float _3883 = -_3873;
    float _3885 = fma(_3759, _3865, _3883);
    float _3887 = fma(_3819, _3853, _3875);
    float _3889 = _3879 * _3871;
    float _3891 = _3885 * _3871;
    float _3893 = fma(_3865, _3881, _3889);
    float _3895 = fma(_3861, _3881, _3891);
    float _3897 = fma(_3757, _3887, _3893);
    float _3899 = fma(_3755, _3887, _3895);
    float _3901 = _1963 + _3897;
    float _3903 = _2187 + _3899;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3907 = _3901 + _3905;
    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3911 = _3903 + _3909;
    float _3913 = _3907 * _3907;
    float _3915 = fma(_3911, _3911, _3913);
    float _3917 = _3755 * _3865;
    float _3919 = sqrt(_3915);
    float _3921 = -_3917;
    float _3923 = fma(_3757, _3861, _3921);
    float _3925 = _3923 * _3871;
    float _3927 = fma(_3863, _3881, _3925);
    float _3929 = fma(_3759, _3887, _3927);
    bool _3931 = _3919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3933 = _1805 + _3929;
    float _3935 = _3929;
    float _3937 = _3903;
    float _3939 = _3901;
    if (!_3931)
    {
        _3935 = _3933;
    }
    float _3941 = _3935;
    bool _3943 = !_3931;
    float _3945 = _3941;
    if (!_3943)
    {
        float _3947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3951 = _3919 + _3949;
        float _3953 = rsqrt(_3915);
        float _3955 = _3951 * _3947;
        float _3957 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3959 = _3955 * 0.15915493667125701904296875;
        float _3961 = _3959 * 6.283185482025146484375;
        float _3963 = cos(_3961);
        float _3965 = _3959 * 6.283185482025146484375;
        float _3967 = sin(_3965);
        float _3969 = _3963 + (-1.0);
        float _3971 = fma(_3967, _3957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3973 = _3969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3975 = _3953 * _3971;
        float _3977 = fma(_3933, _3963, _3973);
        float _3979 = fma(_3911, _3975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3981 = fma(_3907, _3975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3937 = _3979;
        _3945 = _3977;
        _3939 = _3981;
    }
    float _3983 = _3937;
    float _3985 = _3945;
    float _3987 = _3939;
    float _3989 = -_3549;
    float _3991 = _3989 + _3983;
    float _3993 = -_3551;
    float _3995 = _3993 + _3985;
    float _3997 = -_3561;
    float _3999 = _3997 + _3987;
    float _4001 = _3995;
    float _4003 = _3991;
    float _4005 = _3999;
    if (!_3735)
    {
        float _4007 = _3573 * _3573;
        float _4009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4011 = -_1963;
        float _4013 = _4011 + _3987;
        float _4015 = -_2187;
        float _4017 = _4015 + _3983;
        float _4019 = fma(_3581, _3581, _4007);
        float _4021 = -_1805;
        float _4023 = _4021 + _3985;
        float _4025 = fma(_3597, _3597, _4019);
        float _4027 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4029 = sqrt(_4025);
        float _4031 = 1.0 / _3725;
        float _4033 = _4027 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4035 = precise::min(_4029, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4037 = _4035 * _4009;
        float _4039 = _4037 * _4031;
        float _4041 = _4033 * _4039;
        float _4043 = _4013 * _4039;
        float _4045 = fma(_4017, _4041, _3565);
        float _4047 = fma(_4023, _4041, _3559);
        float _4049 = fma(_4033, _4043, _3577);
        _4001 = _4047;
        _4003 = _4045;
        _4005 = _4049;
        _3619 = _4029;
    }
    float _4051 = _4001;
    float _4053 = _4003;
    float _4055 = _4005;
    float _4057 = _3619;
    float _4059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4061 = _4051 + _4059;
    float _4063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4065 = _4053 + _4063;
    float _4067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4069 = _4055 + _4067;
    float _4071 = _4061 * _4061;
    float _4073 = fma(_4065, _4065, _4071);
    float _4075 = fma(_4069, _4069, _4073);
    float _4077 = rsqrt(_4075);
    float _4079 = sqrt(_4075);
    float _4081 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4083 = _4065 * _4081;
    float _4085 = _4069 * _4081;
    float _4087 = _4083 * _4083;
    float _4089 = _4085 * _4085;
    float _4091 = _4087 + _4089;
    float _4093 = sqrt(_4091);
    bool _4095 = _4093 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4099 = _4093 + _4097;
    float _4101 = _4069;
    float _4103 = _4091;
    float _4105 = _4099;
    float _4107 = _4057;
    float _4109 = _4061;
    if (_4095)
    {
        float _4111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4101 = _4111;
    }
    float _4113 = _4101;
    if (_4095)
    {
        float _4115 = rsqrt(_4091);
        _4103 = _4115;
    }
    float _4117 = _4103;
    float _4119 = _4117;
    if (_4095)
    {
        float _4121 = _4099 * _4113;
        _4105 = _4121;
    }
    float _4123 = _4105;
    if (_4095)
    {
        float _4125 = _4123 * 0.15915493667125701904296875;
        _4107 = _4125;
    }
    float _4127 = _4107;
    float _4129 = _4071;
    float _4131 = _4127;
    if (_4095)
    {
        float _4133 = _4127 * 6.283185482025146484375;
        float _4135 = sin(_4133);
        _4129 = _4135;
    }
    float _4137 = _4129;
    float _4139 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4141 = precise::max(0.0, _4139);
    float _4143 = _4077;
    float _4145 = _4139;
    float _4147 = _4141;
    if (_4095)
    {
        float _4149 = _4127 * 6.283185482025146484375;
        float _4151 = cos(_4149);
        _4143 = _4151;
    }
    float _4153 = _4143;
    float _4155 = -_4081;
    float _4157 = -_4141;
    float _4159 = fma(_4061, _4155, _4157);
    if (_4095)
    {
        float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4145 = _4161;
    }
    float _4163 = _4145;
    float _4165 = _4163;
    if (!_4095)
    {
        _4131 = _4083;
    }
    float _4167 = _4131;
    float _4169 = _4137;
    float _4171 = _4167;
    if (_4095)
    {
        float _4173 = fma(_4137, _4163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4165 = _4173;
    }
    float _4175 = _4165;
    if (!_4095)
    {
        _4169 = _4159;
    }
    float _4177 = _4169;
    float _4179 = _4177;
    float _4181 = _4153;
    if (_4095)
    {
        float _4183 = _4153 + (-1.0);
        _4109 = _4183;
    }
    float _4185 = _4109;
    float _4187 = _4185;
    if (_4095)
    {
        float _4189 = _4117 * _4175;
        _3621 = _4189;
    }
    float _4191 = _3621;
    if (!_4095)
    {
        _4119 = _4089;
    }
    float _4193 = _4119;
    float _4195 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4197 = _4193;
    if (_4095)
    {
        float _4199 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4147 = _4199;
    }
    float _4201 = _4147;
    if (_4095)
    {
        float _4203 = _4083 * _4191;
        _4171 = _4203;
    }
    float _4205 = _4171;
    if (!_4095)
    {
        _4187 = _4085;
    }
    float _4207 = _4187;
    float _4209 = _4207;
    if (_4095)
    {
        float _4211 = _4085 * _4191;
        _4209 = _4211;
    }
    float _4213 = _4209;
    if (_4095)
    {
        float _4215 = fma(_4159, _4153, _4201);
        _4179 = _4215;
    }
    float _4217 = _4179;
    if (!_4095)
    {
        _4181 = _4087;
    }
    float _4219 = _4181;
    float _4221 = _4219;
    if (_4095)
    {
        float _4223 = _4205 * _4205;
        _4221 = _4223;
    }
    float _4225 = _4221;
    if (_4095)
    {
        float _4227 = _4213 * _4213;
        _4197 = _4227;
    }
    float _4229 = _4197;
    float _4231 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4233 = fma(_4217, _4217, _4225);
    float _4235 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4237 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4231);
    float _4239 = _4233 + _4229;
    float _4241 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4235);
    float _4243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4245 = fma(_4079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4243);
    float _4247 = precise::clamp(_4245, 0.0, 1.0);
    float _4249 = fma(_3565, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4251 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4241);
    float _4253 = rsqrt(_4239);
    float _4255 = -_4247;
    float _4257 = _4255 + 1.0;
    float _4259 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4261 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4263 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4237);
    float _4265 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4195);
    float _4267 = _4261 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4269 = abs(_4257);
    float _4271 = log2(_4269);
    float _4273 = _4263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4275 = fma(_3577, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4277 = -_4267;
    float _4279 = fma(_4277, _4259, 1.0);
    float _4281 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4283 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4265);
    float _4285 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4281);
    float _4287 = _4253 * _4205;
    float _4289 = floor(_4249);
    float _4291 = _4253 * _4217;
    float _4293 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4285);
    float _4295 = _4253 * _4213;
    float _4297 = _4287 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4299 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4301 = _4293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4303 = _4283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4305 = -_4297;
    float _4307 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4305);
    float _4309 = floor(_4275);
    float _4311 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4299);
    float _4313 = _4271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4315 = -_4295;
    float _4317 = fma(_4315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4307);
    float _4319 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4311);
    float _4321 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4323 = -_4289;
    float _4325 = _4249 + _4323;
    float _4327 = log2(_4279);
    float _4329 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4319);
    float _4331 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4333 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4321);
    float _4335 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4331);
    float _4337 = exp2(_4313);
    float _4339 = fma(_4317, -0.5, 0.5);
    float _4341 = fma(_4317, 0.5, 0.5);
    float _4343 = -_4309;
    float _4345 = _4275 + _4343;
    float _4347 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4333);
    float _4349 = _4291 + 1.0;
    float _4351 = fma(_4341, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4353 = 1.0 / _4329;
    float _4355 = _4327 * 0.693147182464599609375;
    float _4357 = fma(_4341, _4351, -0.212114393711090087890625);
    float _4359 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4335);
    float _4361 = sqrt(_4339);
    float _4363 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4359);
    float _4365 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4347);
    float _4367 = -_4291;
    float _4369 = fma(_4337, _4349, _4367);
    float2 _11445 = float2(_4325, _4345);
    float _4371 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11445, float2(0.0), isnan(_11445)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11445, float2(0.0), isnan(_11445)), level(0.0)).x;
    float _4373 = fma(_4341, _4357, 1.570728778839111328125);
    float _4375 = _4355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4377 = _4363 * _4353;
    float _4379 = _4365 * _4353;
    float _4381 = fma(_4369, 0.5, 0.5);
    float _4383 = fma(_4377, 0.5, 0.5);
    float _4385 = fma(_4379, -0.5, 0.5);
    float _4387 = _4361 * 0.636619746685028076171875;
    float3 _11479 = float3(_4383, _4385, _4375);
    float _4389 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11479, float3(0.0), isnan(_11479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11479, float3(0.0), isnan(_11479)), level(0.0)).x;
    float _4391 = -_4373;
    float _4393 = fma(_4387, _4391, 1.0);
    float3 _11495 = float3(_4383, _4385, _4375);
    float4 _4396 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11495, float3(0.0), isnan(_11495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11495, float3(0.0), isnan(_11495)), level(0.0)).xyzw;
    float _4398 = _4396.x;
    float _4400 = _4396.y;
    float _4402 = _4396.z;
    float _4404 = _4396.w;
    float2 _11511 = float2(_4393, _4381);
    float3 _4408 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11511, float2(0.0), isnan(_11511)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11511, float2(0.0), isnan(_11511)), level(0.0)).xyz;
    float _4410 = _4408.x;
    float _4412 = _4408.y;
    float _4414 = _4408.z;
    float _4416 = _3559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4418 = _3559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4420 = _3745 != 0.0;
    bool _4422 = isnan(_3745);
    bool _4424 = _4420 || _4422;
    bool _4426 = isnan(0.0);
    bool _4428 = _4424 || _4426;
    float _4430 = _4271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4432 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4416);
    float _4434 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4418);
    bool _4436 = _3743 == 0.0;
    bool _4438 = !_4428;
    bool _4440 = _4436 && _4438;
    float _4442 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4444 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4432);
    float _4446 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4434);
    float _4448 = in.m_73.x;
    float _4450 = in.m_73.y;
    float _4452 = in.m_73.z;
    float _4454 = _4444 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4456 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4458 = _3747 == 0.0;
    bool _4460 = _4458 && _4440;
    float _4462 = exp2(_4430);
    float _4464 = _4456 + _4454;
    float _4466 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4442);
    out.m_75.x = _4053;
    out.m_75.y = _4051;
    out.m_75.z = _4055;
    float _4468 = 1.0 / _4454;
    float _4470 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4466);
    float _4472 = -_4462;
    float _4474 = _4472 + 1.0;
    float _4476 = in.m_77.x;
    float _4478 = in.m_77.y;
    float _4480 = in.m_77.z;
    float _4482 = in.m_77.w;
    float _4484 = _4448;
    float _4486 = _4365;
    if (_4460)
    {
        _3553 = _4450;
    }
    float _4488 = _3553;
    float _4490 = _4488;
    if (_4460)
    {
        _3555 = _4448;
    }
    float _4492 = _3555;
    float _4494 = _4464 * _4468;
    float _4496 = _4494 * 0.5;
    float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4500 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4498);
    float _4502 = 1.0 / _4500;
    float _4504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4506 = _4502 * _4504;
    float _4508 = _4502;
    float _4510 = _4492;
    if (_4460)
    {
        _4508 = _4492;
    }
    float _4512 = _4508;
    float _4514 = _4512;
    if (!_4460)
    {
        _4510 = _4448;
    }
    float _4516 = _4510;
    float _4518 = abs(_4506);
    float _4520 = log2(_4518);
    if (_4460)
    {
        _4484 = _4452;
    }
    float _4522 = _4484;
    float _4524 = _4522;
    if (!_4460)
    {
        float _4526 = fma(_3747, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4452);
        _4524 = _4526;
    }
    float _4528 = _4524;
    if (!_4460)
    {
        float _4530 = fma(_3743, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4516);
        _4514 = _4530;
    }
    float _4532 = _4514;
    float _4534 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4536 = _4520;
    float _4538 = _4532;
    if (_4460)
    {
        _4536 = _4488;
    }
    float _4540 = _4536;
    float _4542 = _4540;
    if (!_4460)
    {
        _4490 = _4450;
    }
    float _4544 = _4490;
    float _4546 = _4480 * _4516;
    float _4548 = exp2(_4534);
    if (!_4460)
    {
        float _4550 = fma(_3745, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4544);
        _4542 = _4550;
    }
    float _4552 = _4542;
    float _4554 = _4478 * _4452;
    float _4556 = _4476 * _4544;
    float _4558 = -_4546;
    float _4560 = fma(_4476, _4452, _4558);
    bool _4562 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4564 = isnan(_4079);
    bool _4566 = _4562 || _4564;
    bool _4568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4570 = _4566 || _4568;
    float _4572 = -_4554;
    float _4574 = fma(_4480, _4544, _4572);
    float _4576 = _4574 * _4482;
    float _4578 = fma(_4548, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4580 = precise::clamp(_4578, 0.0, 1.0);
    float _4582 = -_4556;
    float _4584 = fma(_4478, _4516, _4582);
    float _4586 = _4560 * _4482;
    float _4588 = _3813 * _3923;
    float _4590 = fma(_4580, -2.0, 3.0);
    float _4592 = _4580 * _4580;
    float _4594 = _4584 * _4482;
    float _4596 = _3813 * _3885;
    float _4598 = _3813 * _3879;
    float _4600 = _4592 * _4590;
    float _4602 = _3829 * _3885;
    float _4604 = _3829 * _3923;
    float _4606 = _3829 * _3879;
    float _4608 = _3845 * _3885;
    float _4610 = _3845 * _3923;
    float _4612 = -_3763;
    float _4614 = fma(_4612, _3861, _4602);
    float _4616 = -_3763;
    float _4618 = fma(_4616, _3863, _4604);
    float _4620 = -_3763;
    float _4622 = fma(_4620, _3865, _4606);
    float _4624 = -_4600;
    float _4626 = _4624 + 1.0;
    float _4628 = _3845 * _3879;
    float _4630 = fma(_3847, _3863, _4588);
    float _4632 = fma(_3831, _3863, _4610);
    float _4634 = fma(_3847, _3861, _4596);
    float _4636 = fma(_3847, _3865, _4598);
    float _4638 = fma(_3851, _3755, _4614);
    float _4640 = fma(_3851, _3759, _4618);
    float _4642 = fma(_3851, _3757, _4622);
    float _4644 = fma(_4626, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4600);
    float _4646 = fma(_3831, _3865, _4628);
    bool _4648 = _4506 <= 8000.0;
    bool _4650 = isnan(_4506);
    bool _4652 = _4648 || _4650;
    bool _4654 = isnan(8000.0);
    bool _4656 = _4652 || _4654;
    float _4658 = float(_4656);
    float _4660 = fma(_3831, _3861, _4608);
    float _4662 = fma(_3841, _3755, _4634);
    float _4664 = fma(_3841, _3759, _4630);
    float _4666 = _4638 * _4478;
    float _4668 = _4640 * _4478;
    float _4670 = _4642 * _4478;
    float _4672 = fma(_3841, _3757, _4636);
    float _4674 = _4638 * _4552;
    float _4676 = _4586 * _4638;
    float _4678 = fma(_3819, _3757, _4646);
    float _4680 = _4642 * _4552;
    float _4682 = _4658 * _4644;
    float _4684 = _4640 * _4552;
    float _4686 = _4586 * _4640;
    float _4688 = _4586 * _4642;
    float _4690 = fma(_3819, _3755, _4660);
    float _4692 = fma(_3819, _3759, _4632);
    float _4694 = fma(_4662, _4476, _4666);
    float _4696 = fma(_4664, _4476, _4668);
    float _4698 = in.m_79.x;
    float _4700 = fma(_4672, _4476, _4670);
    float _4702 = fma(_4662, _4532, _4674);
    float _4704 = fma(_4576, _4662, _4676);
    float _4706 = fma(_4664, _4532, _4684);
    float _4708 = fma(_4690, _4480, _4694);
    float _4710 = fma(_4692, _4480, _4696);
    float _4712 = fma(_4576, _4664, _4686);
    float _4714 = fma(_4678, _4480, _4700);
    float _4716 = fma(_4576, _4672, _4688);
    float _4718 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4470);
    float _4720 = fma(_4594, _4690, _4704);
    float _4722 = fma(_4594, _4692, _4712);
    float _4724 = fma(_4594, _4678, _4716);
    float _4726 = _4718 + _4329;
    float _4728 = fma(_4672, _4532, _4680);
    float _4730 = _4682 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4732 = fma(_4690, _4528, _4702);
    float _4734 = _4726 * 0.5;
    float _4736 = fma(_4692, _4528, _4706);
    float _4738 = fma(_4678, _4528, _4728);
    float _4740 = _4474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4720;
    out.m_81.y = _4722;
    out.m_81.z = _4724;
    out.m_83.x = _4708;
    out.m_83.y = _4710;
    out.m_83.z = _4714;
    float _4742 = _4724;
    float _4744 = _4722;
    float _4746 = _4363;
    if (!_4570)
    {
        _4538 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4748 = _4538;
    out.m_85.z = _4734;
    out.m_85.w = _4329;
    out.m_87.x = _4732;
    out.m_87.y = _4736;
    out.m_87.z = _4738;
    float _4750 = _4748;
    float _4752 = _4748;
    if (!_4570)
    {
        _4742 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4754 = _4742;
    float _4756 = _4754;
    float _4758 = _4754;
    if (!_4570)
    {
        _4744 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4760 = _4744;
    out.gl_Position.x = _4363;
    out.gl_Position.y = _4365;
    out.gl_Position.z = _4718;
    out.gl_Position.w = _4329;
    float _4762 = _4760;
    float _4764 = _4760;
    if (!_4570)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4766 = _4486;
    float _4768 = _4766;
    float _4770 = _4766;
    if (!_4570)
    {
        _4746 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4772 = _4746;
    float _4774 = -_4371;
    float _4776 = _4774 + 1.0;
    float _4778 = _4776 * _4730;
    float _4780 = precise::clamp(_4778, 0.0, 1.0);
    float _4782 = -_4780;
    float _4784 = fma(_4782, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4786 = _4784 * _4698;
    float _4788 = _4740 * _4389;
    float _4790 = -_4740;
    float _4792 = _4790 + 1.0;
    float _4794 = _4786 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4796 = _4404 * _4788;
    float _4798 = _4404 * _4792;
    out.m_89.x = _4794;
    float _4800 = _4414 * _4788;
    float _4802 = fma(_4410, _4796, _4398);
    float _4804 = fma(_4412, _4796, _4400);
    float _4806 = _4796;
    float _4808 = _4772;
    float _4810 = _4772;
    if (!_4570)
    {
        _4806 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4812 = _4806;
    float _4814 = fma(_4404, _4800, _4402);
    out.m_91.x = _4802;
    out.m_91.y = _4804;
    out.m_91.z = _4814;
    out.m_91.w = _4798;
    bool _4816 = !_4570;
    float _4818 = _4812;
    float _4820 = _4812;
    if (!_4816)
    {
        bool _4822 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4824 = isnan(_4079);
        bool _4826 = _4822 || _4824;
        bool _4828 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4830 = _4826 || _4828;
        if (!_4830)
        {
            float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4834 = _4079 + _4832;
            float _4836 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4838 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4836;
            float _4840 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4842 = _4840 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4844 = 1.0 / _4838;
            float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4854 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4856 = _4854 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4860 = _4858 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4862 = _4834 * _4844;
            float _4864 = precise::clamp(_4862, 0.0, 1.0);
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4870 = fma(_4864, _4842, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4872 = fma(_4864, _4868, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4874 = fma(_4864, _4848, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4876 = fma(_4864, _4852, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4878 = fma(_4864, _4856, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4880 = fma(_4864, _4860, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4810 = _4874;
            _4764 = _4878;
            _4770 = _4870;
            _4758 = _4876;
            _4752 = _4872;
            _4820 = _4880;
            _4882 = true;
        }
        else
        {
            bool _4884 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4886 = isnan(_4079);
            bool _4888 = _4884 || _4886;
            bool _4890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4892 = _4888 || _4890;
            if (!_4892)
            {
                _4768 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4894 = _4768;
            _4770 = _4894;
            if (!_4892)
            {
                _4808 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4896 = _4808;
            _4810 = _4896;
            if (!_4892)
            {
                _4750 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4898 = _4750;
            _4752 = _4898;
            if (!_4892)
            {
                _4756 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4900 = _4756;
            _4758 = _4900;
            if (!_4892)
            {
                _4762 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4902 = _4762;
            _4764 = _4902;
            if (!_4892)
            {
                _4818 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4904 = _4818;
            bool _4906 = !_4892;
            _4820 = _4904;
            if (!_4906)
            {
                bool _4908 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4910 = isnan(_4079);
                bool _4912 = _4908 || _4910;
                bool _4914 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4916 = _4912 || _4914;
                if (!_4916)
                {
                    float _4918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4920 = _4079 + _4918;
                    float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4924 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4922;
                    float _4926 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4928 = _4926 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4930 = 1.0 / _4924;
                    float _4932 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4934 = _4932 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4936 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4938 = _4936 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4940 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4942 = _4940 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4944 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4946 = _4944 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4948 = _4920 * _4930;
                    float _4950 = precise::clamp(_4948, 0.0, 1.0);
                    float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4954 = _4952 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4956 = fma(_4950, _4928, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4958 = fma(_4950, _4954, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4960 = fma(_4950, _4934, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4962 = fma(_4950, _4938, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4964 = fma(_4950, _4942, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4966 = fma(_4950, _4946, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4810 = _4960;
                    _4764 = _4964;
                    _4770 = _4956;
                    _4758 = _4962;
                    _4752 = _4958;
                    _4820 = _4966;
                    _4882 = true;
                }
                else
                {
                    _4810 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4764 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4770 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4758 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4752 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4820 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4882 = false;
    float _4968 = _4810;
    float _4970 = _4764;
    float _4972 = _4770;
    float _4974 = _4758;
    float _4976 = _4752;
    float _4978 = _4820;
    float _4980 = fma(_4736, -0.5, 0.5);
    float _4982 = precise::clamp(_4980, 0.0, 1.0);
    float _4984 = -_4968;
    float _4986 = _4984 + _4970;
    float _4988 = -_4972;
    float _4990 = _4988 + _4974;
    float _4992 = -_4976;
    float _4994 = _4992 + _4978;
    bool _4996 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4998 = fma(_4982, _4986, _4968);
    float _5000 = fma(_4982, _4990, _4972);
    float _5002 = fma(_4982, _4994, _4976);
    float _5004 = _4998 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _5006 = fma(_5000, 0.298911988735198974609375, _5004);
    float _5008 = fma(_5002, 0.114477999508380889892578125, _5006);
    out.m_93.x = 0.0;
    float _5010 = -_5008;
    float _5012 = _5000 + _5010;
    float _5014 = -_5008;
    float _5016 = _4998 + _5014;
    float _5018 = -_5008;
    float _5020 = _5002 + _5018;
    float _5022 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5024 = fma(_5012, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    float _5026 = fma(_5016, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    float _5028 = fma(_5020, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    out.m_89.w = _5022;
    out.m_95.x = _5024;
    out.m_95.y = _5026;
    out.m_95.z = _5028;
    if (!_4996)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5030 = -_4051;
    float _5032 = _5030 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5034 = -_4053;
    float _5036 = _5034 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5038 = -_4055;
    float _5040 = _5038 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5042 = _5032 * _5032;
    float _5044 = fma(_5036, _5036, _5042);
    float _5046 = fma(_5040, _5040, _5044);
    float _5048 = sqrt(_5046);
    float _5050 = rsqrt(_5046);
    float _5052 = -_5048;
    float _5054 = _5052 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5056 = _5054 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5058 = precise::clamp(_5056, 0.0, 1.0);
    float _5060 = _5036 * _5050;
    float _5062 = _5032 * _5050;
    float _5064 = abs(_5058);
    float _5066 = log2(_5064);
    float _5068 = _5040 * _5050;
    float _5070 = _5060 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5072 = _4736 * _5062;
    float _5074 = -_5062;
    float _5076 = -_5070;
    float _5078 = fma(_5074, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5076);
    float _5080 = fma(_4732, _5060, _5072);
    float _5082 = -_5068;
    float _5084 = fma(_5082, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5078);
    float _5086 = fma(_4738, _5068, _5080);
    float _5088 = precise::clamp(_5086, 0.0, 1.0);
    float _5090 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5092 = _5084 + _5090;
    float _5094 = _5066 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5096 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5098 = precise::clamp(_5096, 0.0, 1.0);
    float _5100 = exp2(_5094);
    float _5102 = _5100 * _5098;
    float _5104 = _5088 * _5102;
    float _5106 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5108 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5110 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _5106;
    out.m_93.y = _5108;
    out.m_93.z = _5110;
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
    bool _4882 = false;
    bool _634 = false;
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
        float _5167 = as_type<float>(_130);
        out.gl_Position.z = _5167;
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
        float _5237 = as_type<float>(_168);
        out.gl_Position.z = _5237;
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
    bool _540 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _542 = isnan(_538);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _556 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _558 = isnan(_538);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _574 = _538 + _572;
    float _576 = -_550;
    float _578 = _576 + 1.0;
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _582 = 1.0 / _554;
    float _584 = _566 * _578;
    float _586 = -_566;
    float _588 = _586 + 1.0;
    float _590 = _570 * _582;
    float _592 = fma(_590, _574, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _594 = _592 * _584;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _594);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _604 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[132].x, _596);
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _606;
    out.m_59.y = _608;
    out.m_59.z = _610;
    out.m_59.w = _612;
    bool _614 = !_580;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_114);
        float _638 = 1.0 / _636;
        float _640 = _148 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _646 = int(_644);
    float _648 = in.m_53.x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _652 = _642 + _650;
    float _654 = in.m_53.y;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _662 = _642 + _660;
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _666 = int(_664);
    float _668 = in.m_53.z;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _676 = _674 != 0;
    float _678 = in.m_61.x;
    float _680 = float(_114);
    float _682 = float(_646);
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _686 = int(_684);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _692 = float(_666);
    float _694 = 1.0 / _682;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _704 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _706 = int(_704);
    float _708 = float(uint(_686));
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _714 = ~_686;
    int _716 = _714 + 1;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _718;
    bool _722 = _668 > 0.5;
    float _724 = 0.0;
    float _726 = _692;
    bool _728 = _658;
    float _730 = _678;
    if (!_672)
    {
        _724 = _678;
    }
    float _732 = _724;
    float _734 = 1.0 / _692;
    float _736 = _694 * _148;
    int _738 = _686 + (-1);
    bool _740 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _742 = isnan(_642);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _754 = int(_752);
    float _756 = float(_706);
    float _758 = _732;
    if (_658)
    {
        _726 = 1.0;
    }
    float _760 = _726;
    float _762 = _760;
    if (!_658)
    {
        _762 = 7.345489978790283203125;
    }
    float _764 = _762;
    float _766 = 1.0 / _708;
    float _768 = _734 * _148;
    float _770 = _764 * _648;
    float _772 = trunc(_736);
    int _774 = int(_772);
    float _776 = float(uint(_754));
    int _778 = ~_754;
    int _780 = _778 + 1;
    int _782 = ~_754;
    int _784 = _782 + 1;
    float _786 = float(_754);
    float _788 = 1.0 / _756;
    int _790 = as_type<int>(_766) + (-2);
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _794 = int(_792);
    float _796 = float(uint(_774));
    float _798 = as_type<float>(_790) * _796;
    float _800 = 1.0 / _776;
    float _802 = trunc(_768);
    int _804 = int(_802);
    float _806 = _788 * _148;
    float _808 = float(uint(_794));
    int _810 = ~_686;
    int _812 = _810 + 1;
    int _814 = ~_794;
    int _816 = _814 + 1;
    float _818 = 1.0 / _808;
    int _820 = as_type<int>(_800) + (-2);
    int _822 = ~_794;
    int _824 = _822 + 1;
    float _826 = float(_794);
    float _828 = trunc(_806);
    int _830 = int(_828);
    float _832 = float(uint(_804));
    float _834 = in.m_53.w;
    float _836 = float(_804);
    float _838 = as_type<float>(_820) * _832;
    float _840 = trunc(_798);
    float _842 = precise::max(_840, 0.0);
    uint _845 = uint(_842);
    int _847 = as_type<int>(_818) + (-2);
    float _849 = float(uint(_830));
    float _851 = trunc(_838);
    float _853 = precise::max(_851, 0.0);
    uint _855 = uint(_853);
    float _857 = as_type<float>(_847) * _849;
    float _859 = _849;
    int _861 = _847;
    if (_658)
    {
        _859 = _648;
    }
    float _863 = _859;
    int _865 = _812 * int(_845);
    int _867 = _865 + _774;
    float _869 = trunc(_857);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    float _875 = _863;
    float _877 = as_type<float>(_867);
    if (!_658)
    {
        _875 = _654;
    }
    float _879 = _875;
    float _881 = float(uint(_867));
    float _883 = _879;
    if (_658)
    {
        _877 = 1.0;
    }
    float _885 = _877;
    float _887 = floor(_770);
    float _889 = as_type<float>(_790) * _881;
    float _891 = _885;
    if (!_658)
    {
        _891 = 1.2345600128173828125;
    }
    float _893 = _891;
    int _895 = _780 * int(_855);
    int _897 = _895 + _804;
    float _899 = trunc(_889);
    float _901 = precise::max(_899, 0.0);
    uint _903 = uint(_901);
    int _905 = _816 * int(_873);
    int _907 = _905 + _830;
    float _909 = _879 * _893;
    float _911 = as_type<float>(_897);
    if (_658)
    {
        _883 = _648;
    }
    float _913 = _883;
    float _915 = float(uint(_897));
    float _917 = _913;
    if (_658)
    {
        _911 = 1.0;
    }
    float _919 = _911;
    float _921 = floor(_909);
    float _923 = float(uint(_907));
    float _925 = as_type<float>(_820) * _915;
    float _927 = _919;
    int _929 = as_type<int>(_925);
    float _931 = _923;
    if (!_658)
    {
        _917 = _668;
    }
    float _933 = _917;
    float _935 = in.m_61.y;
    int _937 = as_type<int>(_933);
    if (!_658)
    {
        _927 = 5.839270114898681640625;
    }
    float _939 = _927;
    float _941 = as_type<float>(_847) * _923;
    if (_672)
    {
        bool _943 = _648 > 0.5;
        _728 = _943;
    }
    bool _945 = _728;
    float _947 = trunc(_925);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    int _953 = int(_845) + int(_903);
    float _955 = _933 * _939;
    if (_672)
    {
        float _957 = -_678;
        float _959 = _957 + 1.0;
        _937 = as_type<int>(_959);
    }
    int _961 = _937;
    float _963 = -_887;
    float _965 = _770 + _963;
    int _967 = _716 * _953;
    int _969 = _967 + _774;
    float _971 = float(_686);
    float _973 = trunc(_941);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    if (_672)
    {
        float _979 = _945 ? as_type<float>(_961) : _678;
        _758 = _979;
    }
    float _981 = _758;
    if (_676)
    {
        float _983 = -_678;
        float _985 = _983 + 1.0;
        _929 = as_type<int>(_985);
    }
    int _987 = _929;
    if (!_676)
    {
        _931 = _678;
    }
    float _989 = _931;
    float _991 = -_921;
    float _993 = _909 + _991;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1005 = _1003 != 0;
    bool _1007 = uint(_969) >= uint(_686);
    float _1009 = floor(_955);
    float _1011 = float(_774);
    float _1013 = _989;
    if (_676)
    {
        float _1015 = _722 ? as_type<float>(_987) : _678;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = -_935;
    float _1021 = _1019 + 1.0;
    bool _1023 = !_1005;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1029 = _1027 != 0;
    float _1031 = 1.0 / _680;
    bool _1033 = _1011 >= _971;
    bool _1035 = isnan(_1011);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_971);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1047 = _1045 != 0;
    bool _1049 = _654 > 0.5;
    int _1051 = int(_855) + int(_951);
    float _1053 = trunc(_1043);
    int _1055 = int(_1053);
    int _1057 = int(_873) + int(_977);
    float _1059 = -_1009;
    float _1061 = _955 + _1059;
    bool _1063 = !_1029;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _784 * _1051;
    int _1069 = _1067 + _804;
    bool _1071 = !_1047;
    int _1073 = _1071 ? 0 : 1;
    int _1075 = _824 * _1057;
    int _1077 = _1075 + _830;
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1081 = _1079 != 0;
    float _1083 = 1.0 / _690;
    int _1085 = _1049 ? as_type<int>(_1021) : as_type<int>(_935);
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1089 = _1087 != 0;
    bool _1091 = !_1007;
    int _1093 = _1091 ? 0 : (-1);
    float _1095 = _1081 ? as_type<float>(_1085) : _935;
    float _1097 = 1.0 / _698;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1105 = _1103 != 0;
    int _1107 = ~_953;
    int _1109 = _1107 + _1093;
    int _1111 = _1109 + 1;
    bool _1113 = !_1089;
    int _1115 = _1113 ? 0 : 1;
    bool _1117 = uint(_1069) >= uint(_754);
    int _1119 = _686 * _1111;
    int _1121 = _1119 + _774;
    bool _1123 = !_1105;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = 1.0 / _702;
    bool _1129 = _686 == 0;
    bool _1131 = _836 >= _786;
    bool _1133 = isnan(_836);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(_786);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _965 * _971;
    bool _1145 = !_1117;
    int _1147 = _1145 ? 0 : (-1);
    float _1149 = _971 * _148;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    float _1159 = 1.0 / _712;
    int _1161 = ~_1055;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    bool _1167 = !_1129;
    int _1169 = _1167 ? _1121 : (-1);
    bool _1171 = !_1101;
    int _1173 = _1171 ? 0 : 1;
    bool _1175 = !_1153;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = trunc(_1141);
    int _1181 = int(_1179);
    int _1183 = _1169 * _1165;
    bool _1185 = uint(_1077) >= uint(_794);
    float _1187 = _786 * _993;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1191 = _1189 != 0;
    float _1193 = _1149 * _1031;
    float _1195 = _1031 * _148;
    bool _1197 = !_1001;
    int _1199 = _1197 ? 0 : 1;
    float _1201 = trunc(_1143);
    int _1203 = int(_1201);
    bool _1205 = !_997;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = _786 * _1195;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1217 = _1215 != 0;
    int _1219 = _1055 * _738;
    int _1221 = _1219 + _1183;
    int _1223 = ~_1051;
    int _1225 = _1223 + _1147;
    int _1227 = _1225 + 1;
    float _1229 = _826 * _1195;
    float _1231 = float(_830);
    float _1233 = trunc(_1187);
    int _1235 = int(_1233);
    int _1237 = abs(_1199);
    int _1239 = _754 * _1227;
    int _1241 = _1239 + _804;
    bool _1243 = !_1217;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1249 = _754 == 0;
    bool _1251 = _1231 >= _826;
    bool _1253 = isnan(_1231);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(_826);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = trunc(_1193);
    int _1265 = int(_1263);
    float _1267 = _826 * _1061;
    int _1269 = abs(_1073);
    int _1271 = abs(_1115);
    int _1273 = abs(_1207);
    int _1275 = _1203 * _1269;
    int _1277 = _1275 + _774;
    float _1279 = trunc(_1209);
    int _1281 = int(_1279);
    int _1283 = ~_1181;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    int _1289 = _1235 * _1271;
    int _1291 = _1289 + _804;
    bool _1293 = !_1249;
    int _1295 = _1293 ? _1241 : (-1);
    int _1297 = _1221 * _1237;
    int _1299 = abs(_1125);
    int _1301 = _1287 * _1295;
    int _1303 = abs(_1025);
    int _1305 = _1265 * _1273;
    int _1307 = _1305 + _1297;
    int _1309 = _754 + (-1);
    float _1311 = trunc(_1261);
    int _1313 = int(_1311);
    int _1315 = abs(_1065);
    int _1317 = _1181 * _1309;
    int _1319 = _1317 + _1301;
    int _1321 = abs(_1173);
    int _1323 = _1277 * _1303;
    int _1325 = _1323 + _1307;
    float _1327 = trunc(_1229);
    int _1329 = int(_1327);
    int _1331 = _1319 * _1299;
    int _1333 = abs(_1177);
    int _1335 = _1203 * _1315;
    int _1337 = _1335 + _1325;
    bool _1339 = !_1185;
    int _1341 = _1339 ? 0 : (-1);
    int _1343 = _1281 * _1321;
    int _1345 = _1343 + _1331;
    float _1347 = trunc(_1267);
    int _1349 = int(_1347);
    float _1351 = float(uint(_1337));
    bool _1353 = !_1157;
    int _1355 = _1353 ? 0 : 1;
    int _1357 = _1291 * _1333;
    int _1359 = _1357 + _1345;
    int _1361 = ~_1057;
    int _1363 = _1361 + _1341;
    int _1365 = _1363 + 1;
    float _1367 = as_type<float>(_790) * _1351;
    int _1369 = abs(_1355);
    bool _1371 = !_1191;
    int _1373 = _1371 ? 0 : 1;
    float _1375 = trunc(_1367);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = !_1213;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = _1235 * _1369;
    int _1387 = _1385 + _1359;
    int _1389 = abs(_1373);
    int _1391 = _794 * _1365;
    int _1393 = _1391 + _830;
    bool _1395 = _794 == 0;
    float _1397 = float(uint(_1387));
    int _1399 = _1349 * _1389;
    int _1401 = _1399 + _830;
    int _1403 = ~_686;
    int _1405 = _1403 + 1;
    int _1407 = ~_1313;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = as_type<float>(_820) * _1397;
    bool _1415 = !_1395;
    int _1417 = _1415 ? _1393 : (-1);
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1421 = _1419 != 0;
    int _1423 = _1405 * int(_1379);
    int _1425 = _1423 + _1337;
    int _1427 = _794 + (-1);
    int _1429 = _1411 * _1417;
    int _1431 = abs(_1245);
    float _1433 = trunc(_1413);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = float(uint(_1425));
    int _1441 = _1313 * _1427;
    int _1443 = _1441 + _1429;
    bool _1445 = !_1421;
    int _1447 = _1445 ? 0 : 1;
    int _1449 = abs(_1383);
    float _1451 = as_type<float>(_790) * _1439;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1455 = _1453 != 0;
    int _1457 = ~_754;
    int _1459 = _1457 + 1;
    int _1461 = _1443 * _1431;
    int _1463 = abs(_1447);
    float _1465 = trunc(_1451);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    bool _1471 = !_1455;
    int _1473 = _1471 ? 0 : 1;
    int _1475 = _1329 * _1449;
    int _1477 = _1475 + _1461;
    int _1479 = abs(_1473);
    bool _1481 = _834 > 0.5;
    int _1483 = _1459 * int(_1437);
    int _1485 = _1483 + _1387;
    int _1487 = _1481 ? as_type<int>(_1021) : as_type<int>(_935);
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    int _1493 = _1401 * _1463;
    int _1495 = _1493 + _1477;
    float _1497 = float(uint(_1485));
    float _1499 = _1491 ? as_type<float>(_1487) : _935;
    int _1501 = _1349 * _1479;
    int _1503 = _1501 + _1495;
    int _1505 = int(_1379) + int(_1469);
    float _1507 = as_type<float>(_820) * _1497;
    int _1509 = ~_686;
    int _1511 = _1509 + 1;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1515 = _1513 != 0;
    float _1517 = trunc(_1507);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    float _1523 = float(uint(_1503));
    int _1525 = _1511 * _1505;
    int _1527 = _1525 + _1337;
    bool _1529 = _668 > 0.5;
    float _1531 = float(uint(_1277));
    float _1533 = as_type<float>(_847) * _1523;
    bool _1535 = uint(_1527) >= uint(_686);
    int _1537 = ~_794;
    int _1539 = _1537 + 1;
    float _1541 = as_type<float>(_790) * _1531;
    bool _1543 = !_1535;
    int _1545 = _1543 ? 0 : (-1);
    float _1547 = trunc(_1533);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    float _1553 = _935;
    int _1555 = as_type<int>(_1021);
    int _1557 = _1273;
    float _1559 = as_type<float>(_1291);
    if (_1515)
    {
        float _1561 = _1529 ? _1021 : _935;
        _1553 = _1561;
    }
    float _1563 = _1553;
    float _1565 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1569 = _1567 != 0;
    int _1571 = ~_1505;
    int _1573 = _1571 + _1545;
    int _1575 = _1573 + 1;
    int _1577 = int(_1437) + int(_1521);
    float _1579 = trunc(_1541);
    float _1581 = precise::max(_1579, 0.0);
    uint _1583 = uint(_1581);
    int _1585 = ~_754;
    int _1587 = _1585 + 1;
    int _1589 = _686 * _1575;
    int _1591 = _1589 + _1337;
    int _1593 = ~_686;
    int _1595 = _1593 + 1;
    int _1597 = _1587 * _1577;
    int _1599 = _1597 + _1387;
    bool _1601 = !_1129;
    int _1603 = _1601 ? _1591 : (-1);
    if (_1569)
    {
        float _1605 = -_678;
        float _1607 = _1605 + 1.0;
        _1555 = as_type<int>(_1607);
    }
    int _1609 = _1555;
    int _1611 = _1539 * int(_1551);
    int _1613 = _1611 + _1503;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1619 = _1603 & 3;
    bool _1621 = _1619 != 0;
    if (_1569)
    {
        float _1623 = _1049 ? as_type<float>(_1609) : _678;
        _730 = _1623;
    }
    float _1625 = _730;
    int _1627 = _1603 & 3;
    bool _1629 = _1627 != 0;
    int _1631 = _1595 * int(_1583);
    int _1633 = _1631 + _1277;
    int _1635 = _1621 ? 0 : 1;
    float _1637 = 1.0 / _1617;
    bool _1639 = uint(_1599) >= uint(_754);
    float _1641 = float(uint(_1613));
    bool _1643 = uint(_1627) >= 2u;
    bool _1645 = !_1639;
    int _1647 = _1645 ? 0 : (-1);
    float _1649 = as_type<float>(_847) * _1641;
    int _1651 = _1643 ? 0 : 1;
    bool _1653 = _1627 != 3;
    float _1655 = trunc(_1649);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    bool _1661 = uint(_1627) > 1u;
    int _1663 = ~_1577;
    int _1665 = _1663 + _1647;
    int _1667 = _1665 + 1;
    int _1669 = ~_1651;
    int _1671 = _1669 + 1;
    int _1673 = _1671 + 1;
    int _1675 = ~_1635;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _754 * _1667;
    int _1683 = _1681 + _1387;
    float _1685 = float(uint(_1401));
    int _1687 = _1673;
    int _1689 = _1679;
    float _1691 = as_type<float>(_1627);
    if (_1653)
    {
        int _1693 = ~_1651;
        int _1695 = _1693 + 1;
        _1687 = _1695;
    }
    int _1697 = _1687;
    bool _1699 = !_1249;
    int _1701 = _1699 ? _1683 : (-1);
    float _1703 = as_type<float>(_847) * _1685;
    if (!_1661)
    {
        int _1705 = ~_1635;
        int _1707 = _1705 + 1;
        _1689 = _1707;
    }
    int _1709 = _1689;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1713 = _1711 != 0;
    float _1715 = in.m_46.x;
    float _1717 = in.m_46.y;
    float _1719 = in.m_46.z;
    int _1721 = _1701 & 3;
    bool _1723 = _1721 != 0;
    bool _1725 = !_1713;
    int _1727 = _1725 ? 0 : 1;
    bool _1729 = uint(_1721) >= 2u;
    int _1731 = _1723 ? 0 : 1;
    int _1733 = int(_1551) + int(_1659);
    bool _1735 = _1721 != 3;
    int _1737 = _1729 ? 0 : 1;
    bool _1739 = uint(_1721) > 1u;
    int _1741 = ~_794;
    int _1743 = _1741 + 1;
    int _1745 = ~_1737;
    int _1747 = _1745 + 1;
    int _1749 = _1747 + 1;
    int _1751 = ~_1731;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    int _1757 = _1743 * _1733;
    int _1759 = _1757 + _1503;
    float _1761 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1763 = _1749;
    int _1765 = _1755;
    float _1767 = as_type<float>(_1721);
    if (_1735)
    {
        int _1769 = ~_1737;
        int _1771 = _1769 + 1;
        _1763 = _1771;
    }
    int _1773 = _1763;
    float _1775 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1777 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1761);
    bool _1779 = uint(_1759) >= uint(_794);
    float _1781 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1775);
    if (!_1739)
    {
        int _1783 = ~_1731;
        int _1785 = _1783 + 1;
        _1765 = _1785;
    }
    int _1787 = _1765;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1791 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1781);
    bool _1793 = !_1779;
    int _1795 = _1793 ? 0 : (-1);
    float _1797 = -_1789;
    float _1799 = fma(_1565, 2.0, _1797);
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1803 = _1801 != 0;
    float _1805 = _1791 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1809 = _1807 != 0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1813 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1815 = float(uint(_1291));
    float _1817 = fma(_1247, -2.0, _1811);
    float _1819 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1813);
    float _1821 = float(uint(_1633));
    float _1823 = as_type<float>(_820) * _1815;
    float _1825 = trunc(_1703);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1839 = as_type<float>(_790) * _1821;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1841;
    float _1845 = _1833 * _1637;
    float _1847 = _1837 * _1083;
    float _1849 = trunc(_1823);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1855;
    int _1859 = ~_794;
    int _1861 = _1859 + 1;
    float _1863 = _1843 * _1097;
    int _1865 = ~_754;
    int _1867 = _1865 + 1;
    float _1869 = _1857 * _1127;
    int _1871 = ~_686;
    int _1873 = _1871 + 1;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1879 = trunc(_1839);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    int _1885 = _1861 * int(_1829);
    int _1887 = _1885 + _1401;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1895 = _1893 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1897 = ~_1733;
    int _1899 = _1897 + _1795;
    int _1901 = _1899 + 1;
    float _1903 = _648 + _654;
    float _1905 = float(uint(_1887));
    float _1907 = _1895 * _1159;
    int _1909 = _1867 * int(_1853);
    int _1911 = _1909 + _1291;
    float _1913 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1819);
    float _1915 = _1903 + (-1.0);
    float _1917 = float(uint(_1911));
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_1891)
    {
        _1557 = 0;
    }
    int _1923 = _1557;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1927 = _1925 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1929 = int(_1583) + int(_1883);
    float _1931 = as_type<float>(_820) * _1917;
    float _1933 = as_type<float>(_847) * _1905;
    int _1935 = _794 * _1901;
    int _1937 = _1935 + _1503;
    float _1939 = _648 * 2.0;
    int _1941 = _1923;
    if (_1891)
    {
        _861 = 0;
    }
    int _1943 = _861;
    int _1945 = _1873 * _1929;
    int _1947 = _1945 + _1277;
    bool _1949 = !_1803;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = 1.0 / _1921;
    bool _1955 = !_1395;
    int _1957 = _1955 ? _1937 : (-1);
    float _1959 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1961 = uint(_1947) >= uint(_686);
    float _1963 = _1913 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1965 = _1943;
    if (!_1891)
    {
        _1965 = 1;
    }
    int _1967 = _1965;
    float _1969 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1817);
    if (!_1891)
    {
        _1941 = 2;
    }
    int _1971 = _1941;
    float _1973 = floor(_1939);
    int _1975 = _1957 & 3;
    bool _1977 = _1975 != 0;
    bool _1979 = !_1809;
    int _1981 = _1979 ? 0 : 1;
    bool _1983 = _1975 != 3;
    bool _1985 = !_1961;
    int _1987 = _1985 ? 0 : (-1);
    float _1989 = trunc(_1931);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    bool _1995 = uint(_1975) >= 2u;
    float _1997 = _1877 * _1953;
    bool _1999 = !_1629;
    int _2001 = _1999 ? 0 : 1;
    int _2003 = _1995 ? 0 : 1;
    float _2005 = fma(_1997, _652, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2007 = uint(_1975) > 1u;
    float _2009 = trunc(_1933);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    int _2015 = ~_2003;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _2019;
    if (_1983)
    {
        int _2023 = ~_2003;
        int _2025 = _2023 + 1;
        _2021 = _2025;
    }
    int _2027 = _2021;
    int _2029 = _1977 ? 0 : 1;
    bool _2031 = _1973 > 0.0;
    float _2033 = 1.0 / _1927;
    bool _2035 = _1973 >= 0.0;
    bool _2037 = isnan(_1973);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    int _2045 = ~_754;
    int _2047 = _2045 + 1;
    int _2049 = int(_1853) + int(_1993);
    float _2051 = _654 * 2.0;
    float _2053 = _668 * 2.0;
    int _2055 = int(_1829) + int(_2013);
    float _2057 = _654 + _668;
    float _2059 = floor(_2051);
    int _2061 = abs(_2001);
    int _2063 = _2047 * _2049;
    int _2065 = _2063 + _1291;
    float _2067 = _720 * _2033;
    int _2069 = ~_2029;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = _2057 + (-1.0);
    int _2077 = _2073;
    if (!_2007)
    {
        int _2079 = ~_2029;
        int _2081 = _2079 + 1;
        _2077 = _2081;
    }
    int _2083 = _2077;
    float _2085 = floor(_2053);
    int _2087 = ~_794;
    int _2089 = _2087 + 1;
    float _2091 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2093 = uint(_2065) >= uint(_754);
    float _2095 = fma(_2067, _662, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2097 = ~_1929;
    int _2099 = _2097 + _1987;
    int _2101 = _2099 + 1;
    int _2103 = _2089 * _2055;
    int _2105 = _2103 + _1401;
    bool _2107 = !_2093;
    int _2109 = _2107 ? 0 : (-1);
    int _2111 = _2043 ? 0 : 1;
    int _2113 = _686 * _2101;
    int _2115 = _2113 + _1277;
    bool _2117 = uint(_2105) >= uint(_794);
    bool _2119 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2121 = isnan(_642);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2127 = _2123 || _2125;
    float _2129 = float(_2127);
    bool _2131 = !_2117;
    int _2133 = _2131 ? 0 : (-1);
    int _2135 = ~_2111;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = -_2129;
    float _2143 = _2141 + 1.0;
    bool _2145 = _2059 > 0.0;
    bool _2147 = _2059 >= 0.0;
    bool _2149 = isnan(_2059);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    int _2157 = _2139;
    if (!_2031)
    {
        int _2159 = ~_2111;
        int _2161 = _2159 + 1;
        _2157 = _2161;
    }
    int _2163 = _2157;
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2167 = _642 + _2165;
    bool _2169 = !_1129;
    int _2171 = _2169 ? _2115 : (-1);
    float _2173 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1777);
    bool _2175 = _2085 > 0.0;
    bool _2177 = _2085 >= 0.0;
    bool _2179 = isnan(_2085);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = _2173 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2189 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2191 = isnan(_642);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2197 = _2193 || _2195;
    float _2199 = float(_2197);
    bool _2201 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2203 = isnan(_642);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2209 = _2205 || _2207;
    float _2211 = float(_2209);
    bool _2213 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2215 = isnan(_642);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2199 * _2143;
    float _2227 = -_2199;
    float _2229 = _2227 + 1.0;
    float _2231 = -_2211;
    float _2233 = _2231 + 1.0;
    float _2235 = fma(_1845, _2167, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2239 = _642 + _2237;
    float _2241 = _2211 * _2229;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2245 = _642 + _2243;
    float _2247 = _750 * _2233;
    float _2249 = -_750;
    float _2251 = _2249 + 1.0;
    float _2253 = fma(_1847, _2239, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2255 = fma(_1863, _2245, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2259 = _642 + _2257;
    bool _2261 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2263 = isnan(_642);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2269 = _2265 || _2267;
    float _2271 = float(_2269);
    float _2273 = _2223 * _2251;
    float _2275 = -_2223;
    float _2277 = _2275 + 1.0;
    float _2279 = fma(_1907, _2259, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2283 = _642 + _2281;
    bool _2285 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2287 = isnan(_642);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = _2271 * _2277;
    float _2299 = -_2271;
    float _2301 = _2299 + 1.0;
    float _2303 = fma(_1869, _2283, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2305 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2307 = isnan(_642);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = -_2295;
    float _2319 = _2317 + 1.0;
    float _2321 = _2295 * _2301;
    int _2323 = _2155 ? 0 : 1;
    bool _2325 = _1971 != 2;
    float _2327 = _2315 * _2319;
    float _2329 = -_2315;
    float _2331 = _2329 + 1.0;
    int _2333 = ~_2049;
    int _2335 = _2333 + _2109;
    int _2337 = _2335 + 1;
    float _2339 = _2235 * _2327;
    int _2341 = ~_2055;
    int _2343 = _2341 + _2133;
    int _2345 = _2343 + 1;
    int _2347 = ~_2323;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2339);
    int _2355 = _754 * _2337;
    int _2357 = _2355 + _1291;
    int _2359 = _2351;
    float _2361 = _2321;
    if (!_2145)
    {
        int _2363 = ~_2323;
        int _2365 = _2363 + 1;
        _2359 = _2365;
    }
    int _2367 = _2359;
    int _2369 = _794 * _2345;
    int _2371 = _2369 + _1401;
    float _2373 = fma(_2253, _2321, _2353);
    if (_2325)
    {
        _1559 = _648;
    }
    float _2375 = _1559;
    float _2377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2379 = _2187 + _2377;
    bool _2381 = _1967 != 1;
    float _2383 = fma(_2255, _2297, _2373);
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2387 = _1963 + _2385;
    float _2389 = _2375;
    if (!_2325)
    {
        _2389 = _668;
    }
    float _2391 = _2389;
    float _2393 = fma(_2279, _2273, _2383);
    int _2395 = _2185 ? 0 : 1;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2399 = !_1249;
    int _2401 = _2399 ? _2357 : (-1);
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2405 = !_1395;
    int _2407 = _2405 ? _2371 : (-1);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2411 = _1805 + _2409;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2415 = _2413 != 0;
    int _2417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2419 = _2417 != 0;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2423 = _2421 != 0;
    float _2425 = -_2397;
    float _2427 = fma(_2403, 2.0, _2425);
    int _2429 = _1603 >> 31;
    float _2431 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2433 = _1701 & 3;
    bool _2435 = _2433 != 0;
    float _2437 = fma(_2303, _2247, _2393);
    int _2439 = _2429 & 3;
    float _2441 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2431);
    bool _2443 = !_2435;
    int _2445 = _2443 ? 0 : 1;
    float _2447 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2449 = int(_2447);
    int _2451 = _1957 & 3;
    bool _2453 = _2451 != 0;
    float _2455 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2441);
    int _2457 = _1701 >> 31;
    float _2459 = fma(_2005, _2241, _2437);
    int _2461 = _1603 + _2439;
    int _2463 = _1957 >> 31;
    float _2465 = fma(_2095, _2225, _2459);
    bool _2467 = !_2453;
    int _2469 = _2467 ? 0 : 1;
    int _2471 = _2457 & 3;
    float _2473 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2465);
    bool _2475 = _1627 != 3;
    int _2477 = _2461 >> 2;
    int _2479 = _2463 & 3;
    out.m_63.x = _2473;
    int _2481 = _1701 + _2471;
    bool _2483 = !_2475;
    int _2485 = _2483 ? 0 : (-1);
    bool _2487 = _1721 != 3;
    int _2489 = _2477 << 4;
    int _2491 = _2489 + 368;
    int _2493 = _1957 + _2479;
    int _2495 = ~_2395;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    int _2501 = _2481 >> 2;
    int _2503 = _2499;
    if (!_2175)
    {
        int _2505 = ~_2395;
        int _2507 = _2505 + 1;
        _2503 = _2507;
    }
    int _2509 = _2503;
    bool _2511 = !_2487;
    int _2513 = _2511 ? 0 : (-1);
    uint _2515 = uint(int(uint(_2491) >> uint(2)));
    uint _2517 = uint(int(uint(int(_2515)) >> uint(2)));
    int _2519 = int(_2515) & 3;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[int(_2517)][_2519];
    int _2523 = int(_2515) + 1;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    int _2527 = _2523 & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    bool _2531 = _1975 != 3;
    int _2533 = _2501 << 4;
    int _2535 = _2533 + 512;
    int _2537 = _2493 >> 2;
    uint _2539 = uint(int(uint(_2535) >> uint(2)));
    uint _2541 = uint(int(uint(int(_2539)) >> uint(2)));
    int _2543 = int(_2539) & 3;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[int(_2541)][_2543];
    int _2547 = int(_2539) + 1;
    uint _2549 = uint(int(uint(_2547) >> uint(2)));
    int _2551 = _2547 & 3;
    float _2553 = (*spvDescriptorSet0.vp_c9)._m0[int(_2549)][_2551];
    int _2555 = _2537 << 4;
    int _2557 = _2555 + 656;
    if (!_2381)
    {
        _1691 = _668;
    }
    float _2559 = _1691;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2563 = _2559;
    if (_2381)
    {
        _2563 = _654;
    }
    float _2565 = _2563;
    int _2567 = abs(_1787);
    uint _2569 = uint(int(uint(_2557) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    if (!_2381)
    {
        _1767 = _654;
    }
    float _2585 = _1767;
    float _2587 = fma(_2565, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2561);
    bool _2589 = !_2531;
    int _2591 = _2589 ? 0 : (-1);
    bool _2593 = _2455 >= 0.0;
    float _2595 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2587);
    int _2597 = abs(_1709);
    int _2599 = _2491 + 8;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    uint _2603 = uint(int(uint(int(_2601)) >> uint(2)));
    int _2605 = int(_2601) & 3;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[int(_2603)][_2605];
    int _2609 = int(_2601) + 1;
    uint _2611 = uint(int(uint(_2609) >> uint(2)));
    int _2613 = _2609 & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    float _2617 = _2585;
    if (!_2381)
    {
        _2361 = _2585;
    }
    float _2619 = _2361;
    float _2621 = _2619;
    if (_2381)
    {
        _2617 = _648;
    }
    float _2623 = _2617;
    float _2625 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2627 = ~_2597;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    int _2633 = _2557 + 8;
    uint _2635 = uint(int(uint(_2633) >> uint(2)));
    uint _2637 = uint(int(uint(int(_2635)) >> uint(2)));
    int _2639 = int(_2635) & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = int(_2635) + 1;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    int _2647 = _2643 & 3;
    float _2649 = (*spvDescriptorSet0.vp_c9)._m0[int(_2645)][_2647];
    if (_2381)
    {
        _2621 = _648;
    }
    float _2651 = _2621;
    float _2653 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2625);
    if (_2593)
    {
        out.m_49.x = 0.0;
    }
    int _2655 = ~_2061;
    int _2657 = _2655 + 1;
    int _2659 = _2657 + 1;
    float _2661 = _2651 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2663 = ~_2567;
    int _2665 = _2663 + 1;
    int _2667 = _2665 + 1;
    int _2669 = _2535 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2689 = abs(_2445);
    int _2691 = abs(_2083);
    int _2693 = abs(_2469);
    int _2695 = _2631 * as_type<int>(_2529);
    float _2697 = -_2687;
    float _2699 = fma(_2661, 2.0, _2697);
    int _2701 = abs(_1773);
    int _2703 = _2659 * as_type<int>(_2521);
    int _2705 = _2703 + _2695;
    int _2707 = abs(_1697);
    float _2709 = -_148;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2699);
    int _2713 = _2667 * as_type<int>(_2553);
    int _2715 = ~_2691;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    float _2721 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2723 = int(_2721);
    int _2725 = ~_2689;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    int _2731 = ~_2693;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = _2719 * as_type<int>(_2583);
    int _2739 = ~_2707;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2729 * as_type<int>(_2545);
    int _2747 = _2745 + _2713;
    int _2749 = abs(_2027);
    int _2751 = _2735 * as_type<int>(_2575);
    int _2753 = _2751 + _2737;
    int _2755 = abs(_2485);
    float _2757 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2759 = int(_2757);
    int _2761 = ~_2749;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    int _2767 = _2743 * as_type<int>(_2607);
    int _2769 = _2767 + _2705;
    int _2771 = ~_2701;
    int _2773 = _2771 + 1;
    int _2775 = _2773 + 1;
    int _2777 = abs(_2513);
    int _2779 = ~_2755;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = abs(_2591);
    int _2787 = _2765 * as_type<int>(_2641);
    int _2789 = _2787 + _2753;
    float _2791 = float(uint(_2723));
    int _2793 = _2783 * as_type<int>(_2615);
    int _2795 = _2793 + _2769;
    int _2797 = abs(_1727);
    int _2799 = ~_2777;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    float _2805 = 1.0 / _2791;
    int _2807 = ~_2785;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    int _2813 = _2775 * as_type<int>(_2677);
    int _2815 = _2813 + _2747;
    int _2817 = abs(_1951);
    float _2819 = float(uint(_2449));
    int _2821 = _2803 * as_type<int>(_2685);
    int _2823 = _2821 + _2815;
    int _2825 = abs(_2449);
    int _2827 = _2811 * as_type<int>(_2649);
    int _2829 = _2827 + _2789;
    float _2831 = 1.0 / _2819;
    int _2833 = ~_2817;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = ~_2797;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = float(uint(_2759));
    int _2847 = _2837 * _2823;
    int _2849 = abs(_1981);
    int _2851 = abs(_2759);
    int _2853 = _2795 * _2843;
    float _2855 = 1.0 / _2845;
    int _2857 = _2401 * _2817;
    int _2859 = _2857 + _2847;
    int _2861 = _2171 * _2797;
    int _2863 = _2861 + _2853;
    int _2865 = abs(_2723);
    float _2867 = float(uint(_2825));
    int _2869 = ~_2849;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    float _2875 = float(uint(_2851));
    float _2877 = float(uint(_2865));
    float _2879 = 1.0 / _2867;
    int _2881 = _2873 * _2829;
    int _2883 = as_type<int>(_2831) + (-2);
    float _2885 = float(uint(_2863));
    int _2887 = _2407 * _2849;
    int _2889 = _2887 + _2881;
    int _2891 = as_type<int>(_2805) + (-2);
    float _2893 = 1.0 / _2877;
    float _2895 = float(uint(_2859));
    float _2897 = as_type<float>(_2883) * _2885;
    int _2899 = ~_2759;
    int _2901 = _2899 + 1;
    int _2903 = as_type<int>(_2855) + (-2);
    float _2905 = as_type<float>(_2891) * _2895;
    float _2907 = float(uint(_2889));
    float _2909 = 1.0 / _2875;
    int _2911 = abs(_2863);
    float _2913 = as_type<float>(_2903) * _2907;
    int _2915 = as_type<int>(_2879) + (-2);
    int _2917 = abs(_2859);
    float _2919 = trunc(_2897);
    float _2921 = precise::max(_2919, 0.0);
    uint _2923 = uint(_2921);
    float _2925 = float(uint(_2911));
    int _2927 = as_type<int>(_2893) + (-2);
    int _2929 = abs(_2889);
    int _2931 = ~_2449;
    int _2933 = _2931 + 1;
    float _2935 = trunc(_2913);
    float _2937 = precise::max(_2935, 0.0);
    uint _2939 = uint(_2937);
    int _2941 = as_type<int>(_2909) + (-2);
    float _2943 = as_type<float>(_2915) * _2925;
    bool _2945 = !_2419;
    int _2947 = _2945 ? 0 : 1;
    float _2949 = float(uint(_2917));
    float _2951 = trunc(_2905);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    int _2957 = abs(_2947);
    float _2959 = as_type<float>(_2927) * _2949;
    float _2961 = float(_2163);
    float _2963 = float(uint(_2929));
    float _2965 = trunc(_2943);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    int _2971 = _2933 * int(_2923);
    int _2973 = _2971 + _2863;
    int _2975 = ~_2723;
    int _2977 = _2975 + 1;
    float _2979 = as_type<float>(_2941) * _2963;
    float _2981 = float(_2957);
    int _2983 = _2901 * int(_2939);
    int _2985 = _2983 + _2889;
    float _2987 = float(uint(_2973));
    float _2989 = trunc(_2959);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    float _2995 = _2687;
    float _2997 = as_type<float>(_2923);
    if (!_2381)
    {
        _2995 = _668;
    }
    float _2999 = _2995;
    float _3001 = _2981 * _2961;
    int _3003 = _2977 * int(_2955);
    int _3005 = _3003 + _2859;
    float _3007 = _2999;
    if (_2381)
    {
        _3007 = _654;
    }
    float _3009 = _3007;
    float _3011 = as_type<float>(_2883) * _2987;
    float _3013 = float(uint(_2985));
    float _3015 = trunc(_2979);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = ~_2825;
    int _3023 = _3021 + 1;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3029 = float(uint(_3005));
    float _3031 = as_type<float>(_2903) * _3013;
    int _3033 = ~_2851;
    int _3035 = _3033 + 1;
    int _3037 = _3023 * int(_2969);
    int _3039 = _3037 + _2911;
    float _3041 = trunc(_3011);
    float _3043 = precise::max(_3041, 0.0);
    uint _3045 = uint(_3043);
    float _3047 = fma(_3027, -2.0, _3025);
    int _3049 = ~_2865;
    int _3051 = _3049 + 1;
    float _3053 = as_type<float>(_2891) * _3029;
    bool _3055 = !_2415;
    int _3057 = _3055 ? 0 : 1;
    int _3059 = _3051 * int(_2993);
    int _3061 = _3059 + _2917;
    float _3063 = float(uint(_3039));
    int _3065 = _3035 * int(_3019);
    int _3067 = _3065 + _2929;
    int _3069 = abs(_3057);
    float _3071 = trunc(_3053);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = float(_2509);
    float _3079 = as_type<float>(_2915) * _3063;
    float _3081 = float(_3069);
    float _3083 = float(uint(_3061));
    float _3085 = float(uint(_3067));
    float _3087 = trunc(_3079);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    int _3093 = int(_2923) + int(_3045);
    float _3095 = _3081 * _3077;
    float _3097 = as_type<float>(_2927) * _3083;
    float _3099 = _3085;
    if (_2325)
    {
        _2997 = _654;
    }
    float _3101 = _2997;
    float _3103 = as_type<float>(_2941) * _3085;
    float _3105 = _3101;
    if (!_2325)
    {
        _3105 = _648;
    }
    float _3107 = _3105;
    float _3109 = _3095 * (-2.0);
    int _3111 = as_type<int>(_3107);
    if (_2593)
    {
        _3099 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3113 = _3099;
    float _3115 = trunc(_3031);
    float _3117 = precise::max(_3115, 0.0);
    uint _3119 = uint(_3117);
    float _3121 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3123 = ~_2449;
    int _3125 = _3123 + 1;
    if (_2593)
    {
        float _3127 = _3113 * 5.0;
        _3111 = as_type<int>(_3127);
    }
    int _3129 = _3111;
    float _3131 = fma(_1959, _3109, _1959);
    int _3133 = ~_2723;
    int _3135 = _3133 + 1;
    float _3137 = in.m_65.x;
    float _3139 = in.m_65.y;
    float _3141 = in.m_65.z;
    float _3143 = trunc(_3097);
    float _3145 = precise::max(_3143, 0.0);
    uint _3147 = uint(_3145);
    if (_2593)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9523 = as_type<float>(_3129);
        out.gl_Position.z = _9523;
    }
    int _3149 = int(_2955) + int(_3075);
    int _3151 = int(_2969) + int(_3091);
    int _3153 = _3125 * _3093;
    int _3155 = _3153 + _2863;
    float _3157 = trunc(_3103);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = int(_2939) + int(_3119);
    int _3165 = ~_2851;
    int _3167 = _3165 + 1;
    bool _3169 = uint(_3155) >= uint(_2449);
    int _3171 = ~_2825;
    int _3173 = _3171 + 1;
    int _3175 = ~_2759;
    int _3177 = _3175 + 1;
    int _3179 = _3135 * _3149;
    int _3181 = _3179 + _2859;
    int _3183 = int(_2993) + int(_3147);
    int _3185 = _3173 * _3151;
    int _3187 = _3185 + _2911;
    int _3189 = ~_2865;
    int _3191 = _3189 + 1;
    int _3193 = _3177 * _3163;
    int _3195 = _3193 + _2889;
    bool _3197 = uint(_3181) >= uint(_2723);
    float _3199 = fma(_3109, _3137, _3137);
    bool _3201 = uint(_3187) >= uint(_2825);
    int _3203 = _3191 * _3183;
    int _3205 = _3203 + _2917;
    bool _3207 = !_3169;
    int _3209 = _3207 ? 0 : (-1);
    float _3211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3213 = !_3197;
    int _3215 = _3213 ? 0 : (-1);
    bool _3217 = uint(_3195) >= uint(_2759);
    int _3219 = ~_3093;
    int _3221 = _3219 + _3209;
    int _3223 = _3221 + 1;
    int _3225 = ~_3149;
    int _3227 = _3225 + _3215;
    int _3229 = _3227 + 1;
    float _3231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3233 = int(_3019) + int(_3161);
    int _3235 = _2449 * _3223;
    int _3237 = _3235 + _2863;
    bool _3239 = uint(_3205) >= uint(_2865);
    int _3241 = _2723 * _3229;
    int _3243 = _3241 + _2859;
    bool _3245 = !_3217;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3167 * _3233;
    int _3251 = _3249 + _2929;
    bool _3253 = _2449 == 0;
    float _3255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3257 = !_3239;
    int _3259 = _3257 ? 0 : (-1);
    bool _3261 = _2723 == 0;
    int _3263 = ~_3163;
    int _3265 = _3263 + _3247;
    int _3267 = _3265 + 1;
    bool _3269 = !_3253;
    int _3271 = _3269 ? _3237 : (-1);
    bool _3273 = !_3261;
    int _3275 = _3273 ? _3243 : (-1);
    int _3277 = _2759 * _3267;
    int _3279 = _3277 + _2889;
    bool _3281 = _2759 == 0;
    bool _3283 = _2759 == 0;
    int _3285 = _2889 ^ _2759;
    float _3287 = _3211 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3289 = ~_3259;
    int _3291 = _3183 + _3289;
    int _3293 = _3291 + 1;
    float _3295 = _3231 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3297 = float(_3271);
    float _3299 = -_148;
    float _3301 = fma(_3299, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1799);
    bool _3303 = uint(_3251) >= uint(_2851);
    float _3305 = fma(_3287, _981, -0.5);
    int _3307 = _2863 ^ _2449;
    float _3309 = fma(_3287, _3297, _3301);
    float _3311 = float(_3275);
    float _3313 = fma(_3295, _1017, -0.5);
    bool _3315 = !_3281;
    int _3317 = _3315 ? _3279 : (-1);
    float _3319 = _3255 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3321 = !_3303;
    int _3323 = _3321 ? 0 : (-1);
    float _3325 = _2411 * _2411;
    bool _3327 = _2723 == 0;
    float _3329 = fma(_3319, _1625, -0.5);
    bool _3331 = !_3201;
    int _3333 = _3331 ? 0 : (-1);
    int _3335 = _2859 ^ _2723;
    uint _3337 = uint(int(uint(_3307) >> uint(31)));
    float _3339 = fma(_3295, _3311, _2711);
    float _3341 = float(_3317);
    float _3343 = -_148;
    float _3345 = fma(_3343, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2427);
    int _3347 = ~_3333;
    int _3349 = _3151 + _3347;
    int _3351 = _3349 + 1;
    float _3353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3355 = ~int(_3337);
    int _3357 = _3355 + 1;
    float _3359 = fma(_3319, _3341, _3345);
    uint _3361 = uint(int(uint(_3335) >> uint(31)));
    int _3363 = _3351 ^ _3357;
    int _3365 = ~int(_3361);
    int _3367 = _3365 + 1;
    uint _3369 = uint(int(uint(_3285) >> uint(31)));
    float _3371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3373 = ~_3357;
    int _3375 = _3373 + _3363;
    int _3377 = _3375 + 1;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3381 = _3293 ^ _3367;
    float _3383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3385 = ~int(_3369);
    int _3387 = _3385 + 1;
    float _3389 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3371);
    int _3391 = ~_3367;
    int _3393 = _3391 + _3381;
    int _3395 = _3393 + 1;
    float _3397 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3379);
    float _3399 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2653);
    bool _3401 = _2449 == 0;
    float _3403 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3389);
    int _3405 = ~_3323;
    int _3407 = _3233 + _3405;
    int _3409 = _3407 + 1;
    float _3411 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3397);
    float _3413 = fma(_3399, _3313, _3339);
    float _3415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3417 = !_3327;
    int _3419 = _3417 ? _3395 : (-1);
    float _3421 = fma(_3403, _3305, _3309);
    bool _3423 = !_3401;
    int _3425 = _3423 ? _3377 : (-1);
    float _3427 = fma(_3411, _3329, _3359);
    float _3429 = _3353 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3431 = _3409 ^ _3387;
    float _3433 = _3383 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3435 = float(_3419);
    float _3437 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3047);
    float _3439 = float(_3425);
    float _3441 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3443 = ~_3387;
    int _3445 = _3443 + _3431;
    int _3447 = _3445 + 1;
    float _3449 = fma(_1095, _3429, -0.5);
    float _3451 = -_3437;
    float _3453 = fma(_3433, _3435, _3451);
    float _3455 = -_1969;
    float _3457 = fma(_3429, _3439, _3455);
    bool _3459 = !_3283;
    int _3461 = _3459 ? _3447 : (-1);
    float _3463 = fma(_3121, -2.0, _3441);
    float _3465 = fma(_1499, _3433, -0.5);
    float _3467 = float(_3461);
    float _3469 = _3415 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3471 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3463);
    float _3473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3477 = log2(_3475);
    float _3479 = -_3471;
    float _3481 = fma(_3469, _3467, _3479);
    float _3483 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3473);
    float _3485 = fma(_2379, _2379, _3325);
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3489 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3491 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3483);
    float _3493 = fma(_2387, _2387, _3485);
    float _3495 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3487);
    float _3497 = fma(_3469, _1563, -0.5);
    float _3499 = fma(_3491, _3449, _3457);
    float _3501 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3495);
    float _3503 = rsqrt(_3493);
    float _3505 = fma(_2595, _3465, _3453);
    float _3507 = _3421 + 0.5;
    float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3511 = 1.0 + _3509;
    float _3513 = fma(_3501, _3497, _3481);
    float _3515 = _3413 + 0.5;
    float _3517 = _3499 + 0.5;
    float _3519 = _3505 + 0.5;
    float _3521 = 1.0 / _3511;
    float _3523 = _3427 + 0.5;
    float _3525 = _3513 + 0.5;
    float _3527 = _3489 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3529 = _3477 * _148;
    out.m_67.x = _3507;
    out.m_67.y = _3517;
    out.m_67.z = _3515;
    out.m_67.w = _3519;
    bool _3531 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3533 = isnan(1.0);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3539 = _3535 || _3537;
    float _3541 = _3527 * _3503;
    out.m_69.x = _3523;
    out.m_69.y = _3525;
    float _3543 = exp2(_3529);
    bool _3545 = !_2423;
    int _3547 = _3545 ? 0 : 1;
    float _3549 = _2379 * _3541;
    float _3551 = _2411 * _3541;
    float _3553 = as_type<float>(_3395);
    float _3555 = as_type<float>(_3149);
    if (_2593)
    {
        return out;
    }
    float _3557 = -_3551;
    float _3559 = _1805 + _3557;
    float _3561 = _2387 * _3541;
    float _3563 = -_3549;
    float _3565 = _2187 + _3563;
    float _3567 = -_3543;
    float _3569 = _3567 + 1.0;
    float _3571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3573 = _3559 + _3571;
    float _3575 = -_3561;
    float _3577 = _1963 + _3575;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3581 = _3565 + _3579;
    bool _3583 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3585 = isnan(0.0);
    bool _3587 = _3583 || _3585;
    bool _3589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3591 = _3587 || _3589;
    float _3593 = _3573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3597 = _3577 + _3595;
    float _3599 = -_3551;
    float _3601 = _2411 + _3599;
    float _3603 = _3591 ? _3569 : 0.0;
    float _3605 = fma(_3581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3593);
    float _3607 = _648 + (-0.5);
    float _3609 = -_3549;
    float _3611 = _2379 + _3609;
    float _3613 = _3601 * _3601;
    float _3615 = fma(_3597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3605);
    float _3617 = _3593;
    float _3619 = _3581;
    float _3621 = _3561;
    if (_3539)
    {
        float _3623 = _3603 * _3521;
        _150 = _3623;
    }
    float _3625 = _150;
    float _3627 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3199);
    float _3629 = _3001 * (-2.0);
    float _3631 = fma(_3611, _3611, _3613);
    bool _3633 = _3615 >= 0.0;
    float _3635 = -_3561;
    float _3637 = _2387 + _3635;
    float _3639 = fma(_3131, _3625, _3627);
    float _3641 = _654 + (-0.5);
    float _3643 = fma(_3629, _3139, _3139);
    float _3645 = fma(_3637, _3637, _3631);
    float _3647 = _3639 * 0.15915493667125701904296875;
    int _3649 = abs(_3547);
    float _3651 = fma(_3641, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3643);
    float _3653 = float(_2367);
    float _3655 = sqrt(_3645);
    float _3657 = fma(_2091, _3629, _2091);
    if (_3633)
    {
        out.m_49.x = 0.0;
    }
    if (_3633)
    {
        _3617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3659 = _3617;
    float _3661 = float(_3649);
    float _3663 = fma(_3657, _3625, _3651);
    float _3665 = _3647 * 6.283185482025146484375;
    float _3667 = sin(_3665);
    int _3669 = as_type<int>(_3659);
    if (_3633)
    {
        float _3671 = _3659 * 5.0;
        _3669 = as_type<int>(_3671);
    }
    int _3673 = _3669;
    float _3675 = _3661 * _3653;
    if (_3633)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10340 = as_type<float>(_3673);
        out.gl_Position.z = _10340;
    }
    float _3677 = _3647 * 6.283185482025146484375;
    float _3679 = cos(_3677);
    if (_3633)
    {
        return out;
    }
    float _3681 = -_1805;
    float _3683 = _3681 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3685 = -_2187;
    float _3687 = _3685 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3689 = -_1963;
    float _3691 = _3689 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3693 = _648 + _668;
    float _3695 = _3683 * _3683;
    float _3697 = _3675 * (-2.0);
    float _3699 = _668 + (-0.5);
    float _3701 = _3693 + (-1.0);
    float _3703 = fma(_3687, _3687, _3695);
    float _3705 = fma(_3697, _3141, _3141);
    float _3707 = _3663 * 0.15915493667125701904296875;
    float _3709 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3711 = fma(_3691, _3691, _3703);
    float _3713 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3705);
    float _3715 = _3707 * 6.283185482025146484375;
    float _3717 = sin(_3715);
    float _3719 = fma(_3709, _3697, _3709);
    float _3721 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3723 = fma(_3719, _3625, _3713);
    float _3725 = _3503 * _3655;
    bool _3727 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3729 = isnan(0.5);
    bool _3731 = _3727 || _3729;
    bool _3733 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3735 = _3731 || _3733;
    float _3737 = rsqrt(_3711);
    float _3739 = _3723 * 0.15915493667125701904296875;
    float _3741 = _3489 * _3725;
    float _3743 = in.m_71.x;
    float _3745 = in.m_71.y;
    float _3747 = in.m_71.z;
    float _3749 = _3707 * 6.283185482025146484375;
    float _3751 = cos(_3749);
    float _3753 = _3667 * _3717;
    float _3755 = _3687 * _3737;
    float _3757 = _3691 * _3737;
    float _3759 = _3683 * _3737;
    float _3761 = _3739 * 6.283185482025146484375;
    float _3763 = sin(_3761);
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3767 = _3755 * _3765;
    float _3769 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3771 = _3757 * _3769;
    float _3773 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3775 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3777 = -_3767;
    float _3779 = fma(_3757, _3775, _3777);
    float _3781 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3783 = -_3771;
    float _3785 = fma(_3759, _3781, _3783);
    float _3787 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3789 = _3759 * _3787;
    float _3791 = _3739 * 6.283185482025146484375;
    float _3793 = cos(_3791);
    float _3795 = _3779 * _3779;
    float _3797 = _3679 * _3751;
    float _3799 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3801 = -_3789;
    float _3803 = fma(_3755, _3799, _3801);
    float _3805 = _3725 * _3773;
    float _3807 = fma(_3785, _3785, _3795);
    float _3809 = _3667 * _3751;
    float _3811 = _3725 * _3721;
    float _3813 = fma(_3763, _3797, _3753);
    float _3815 = fma(_3803, _3803, _3807);
    float _3817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3745);
    float _3819 = fma(_3763, _3753, _3797);
    float _3821 = _3679 * _3717;
    float _3823 = _3817 * _3805;
    float _3825 = rsqrt(_3815);
    float _3827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3743);
    float _3829 = _3679 * _3793;
    float _3831 = _3717 * _3793;
    float _3833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3747);
    float _3835 = _3827 * _3741;
    float _3837 = _3829 * _3823;
    float _3839 = -_3821;
    float _3841 = fma(_3763, _3809, _3839);
    float _3843 = -_3809;
    float _3845 = fma(_3763, _3821, _3843);
    float _3847 = _3751 * _3793;
    float _3849 = fma(_3813, _3835, _3837);
    float _3851 = _3667 * _3793;
    float _3853 = _3833 * _3811;
    float _3855 = -_3823;
    float _3857 = _3763 * _3855;
    float _3859 = _3851 * _3823;
    float _3861 = _3785 * _3825;
    float _3863 = _3779 * _3825;
    float _3865 = _3803 * _3825;
    float _3867 = fma(_3847, _3835, _3857);
    float _3869 = _3759 * _3861;
    float _3871 = fma(_3845, _3853, _3849);
    float _3873 = _3757 * _3863;
    float _3875 = fma(_3841, _3835, _3859);
    float _3877 = -_3869;
    float _3879 = fma(_3755, _3863, _3877);
    float _3881 = fma(_3831, _3853, _3867);
    float _3883 = -_3873;
    float _3885 = fma(_3759, _3865, _3883);
    float _3887 = fma(_3819, _3853, _3875);
    float _3889 = _3879 * _3871;
    float _3891 = _3885 * _3871;
    float _3893 = fma(_3865, _3881, _3889);
    float _3895 = fma(_3861, _3881, _3891);
    float _3897 = fma(_3757, _3887, _3893);
    float _3899 = fma(_3755, _3887, _3895);
    float _3901 = _1963 + _3897;
    float _3903 = _2187 + _3899;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3907 = _3901 + _3905;
    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3911 = _3903 + _3909;
    float _3913 = _3907 * _3907;
    float _3915 = fma(_3911, _3911, _3913);
    float _3917 = _3755 * _3865;
    float _3919 = sqrt(_3915);
    float _3921 = -_3917;
    float _3923 = fma(_3757, _3861, _3921);
    float _3925 = _3923 * _3871;
    float _3927 = fma(_3863, _3881, _3925);
    float _3929 = fma(_3759, _3887, _3927);
    bool _3931 = _3919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3933 = _1805 + _3929;
    float _3935 = _3929;
    float _3937 = _3903;
    float _3939 = _3901;
    if (!_3931)
    {
        _3935 = _3933;
    }
    float _3941 = _3935;
    bool _3943 = !_3931;
    float _3945 = _3941;
    if (!_3943)
    {
        float _3947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3951 = _3919 + _3949;
        float _3953 = rsqrt(_3915);
        float _3955 = _3951 * _3947;
        float _3957 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3959 = _3955 * 0.15915493667125701904296875;
        float _3961 = _3959 * 6.283185482025146484375;
        float _3963 = cos(_3961);
        float _3965 = _3959 * 6.283185482025146484375;
        float _3967 = sin(_3965);
        float _3969 = _3963 + (-1.0);
        float _3971 = fma(_3967, _3957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3973 = _3969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3975 = _3953 * _3971;
        float _3977 = fma(_3933, _3963, _3973);
        float _3979 = fma(_3911, _3975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3981 = fma(_3907, _3975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3937 = _3979;
        _3945 = _3977;
        _3939 = _3981;
    }
    float _3983 = _3937;
    float _3985 = _3945;
    float _3987 = _3939;
    float _3989 = -_3549;
    float _3991 = _3989 + _3983;
    float _3993 = -_3551;
    float _3995 = _3993 + _3985;
    float _3997 = -_3561;
    float _3999 = _3997 + _3987;
    float _4001 = _3995;
    float _4003 = _3991;
    float _4005 = _3999;
    if (!_3735)
    {
        float _4007 = _3573 * _3573;
        float _4009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4011 = -_1963;
        float _4013 = _4011 + _3987;
        float _4015 = -_2187;
        float _4017 = _4015 + _3983;
        float _4019 = fma(_3581, _3581, _4007);
        float _4021 = -_1805;
        float _4023 = _4021 + _3985;
        float _4025 = fma(_3597, _3597, _4019);
        float _4027 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4029 = sqrt(_4025);
        float _4031 = 1.0 / _3725;
        float _4033 = _4027 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4035 = precise::min(_4029, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4037 = _4035 * _4009;
        float _4039 = _4037 * _4031;
        float _4041 = _4033 * _4039;
        float _4043 = _4013 * _4039;
        float _4045 = fma(_4017, _4041, _3565);
        float _4047 = fma(_4023, _4041, _3559);
        float _4049 = fma(_4033, _4043, _3577);
        _4001 = _4047;
        _4003 = _4045;
        _4005 = _4049;
        _3619 = _4029;
    }
    float _4051 = _4001;
    float _4053 = _4003;
    float _4055 = _4005;
    float _4057 = _3619;
    float _4059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4061 = _4051 + _4059;
    float _4063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4065 = _4053 + _4063;
    float _4067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4069 = _4055 + _4067;
    float _4071 = _4061 * _4061;
    float _4073 = fma(_4065, _4065, _4071);
    float _4075 = fma(_4069, _4069, _4073);
    float _4077 = rsqrt(_4075);
    float _4079 = sqrt(_4075);
    float _4081 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4083 = _4065 * _4081;
    float _4085 = _4069 * _4081;
    float _4087 = _4083 * _4083;
    float _4089 = _4085 * _4085;
    float _4091 = _4087 + _4089;
    float _4093 = sqrt(_4091);
    bool _4095 = _4093 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4099 = _4093 + _4097;
    float _4101 = _4069;
    float _4103 = _4091;
    float _4105 = _4099;
    float _4107 = _4057;
    float _4109 = _4061;
    if (_4095)
    {
        float _4111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4101 = _4111;
    }
    float _4113 = _4101;
    if (_4095)
    {
        float _4115 = rsqrt(_4091);
        _4103 = _4115;
    }
    float _4117 = _4103;
    float _4119 = _4117;
    if (_4095)
    {
        float _4121 = _4099 * _4113;
        _4105 = _4121;
    }
    float _4123 = _4105;
    if (_4095)
    {
        float _4125 = _4123 * 0.15915493667125701904296875;
        _4107 = _4125;
    }
    float _4127 = _4107;
    float _4129 = _4071;
    float _4131 = _4127;
    if (_4095)
    {
        float _4133 = _4127 * 6.283185482025146484375;
        float _4135 = sin(_4133);
        _4129 = _4135;
    }
    float _4137 = _4129;
    float _4139 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4141 = precise::max(0.0, _4139);
    float _4143 = _4077;
    float _4145 = _4139;
    float _4147 = _4141;
    if (_4095)
    {
        float _4149 = _4127 * 6.283185482025146484375;
        float _4151 = cos(_4149);
        _4143 = _4151;
    }
    float _4153 = _4143;
    float _4155 = -_4081;
    float _4157 = -_4141;
    float _4159 = fma(_4061, _4155, _4157);
    if (_4095)
    {
        float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4145 = _4161;
    }
    float _4163 = _4145;
    float _4165 = _4163;
    if (!_4095)
    {
        _4131 = _4083;
    }
    float _4167 = _4131;
    float _4169 = _4137;
    float _4171 = _4167;
    if (_4095)
    {
        float _4173 = fma(_4137, _4163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4165 = _4173;
    }
    float _4175 = _4165;
    if (!_4095)
    {
        _4169 = _4159;
    }
    float _4177 = _4169;
    float _4179 = _4177;
    float _4181 = _4153;
    if (_4095)
    {
        float _4183 = _4153 + (-1.0);
        _4109 = _4183;
    }
    float _4185 = _4109;
    float _4187 = _4185;
    if (_4095)
    {
        float _4189 = _4117 * _4175;
        _3621 = _4189;
    }
    float _4191 = _3621;
    if (!_4095)
    {
        _4119 = _4089;
    }
    float _4193 = _4119;
    float _4195 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4197 = _4193;
    if (_4095)
    {
        float _4199 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4147 = _4199;
    }
    float _4201 = _4147;
    if (_4095)
    {
        float _4203 = _4083 * _4191;
        _4171 = _4203;
    }
    float _4205 = _4171;
    if (!_4095)
    {
        _4187 = _4085;
    }
    float _4207 = _4187;
    float _4209 = _4207;
    if (_4095)
    {
        float _4211 = _4085 * _4191;
        _4209 = _4211;
    }
    float _4213 = _4209;
    if (_4095)
    {
        float _4215 = fma(_4159, _4153, _4201);
        _4179 = _4215;
    }
    float _4217 = _4179;
    if (!_4095)
    {
        _4181 = _4087;
    }
    float _4219 = _4181;
    float _4221 = _4219;
    if (_4095)
    {
        float _4223 = _4205 * _4205;
        _4221 = _4223;
    }
    float _4225 = _4221;
    if (_4095)
    {
        float _4227 = _4213 * _4213;
        _4197 = _4227;
    }
    float _4229 = _4197;
    float _4231 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4233 = fma(_4217, _4217, _4225);
    float _4235 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4237 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4231);
    float _4239 = _4233 + _4229;
    float _4241 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4235);
    float _4243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4245 = fma(_4079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4243);
    float _4247 = precise::clamp(_4245, 0.0, 1.0);
    float _4249 = fma(_3565, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4251 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4241);
    float _4253 = rsqrt(_4239);
    float _4255 = -_4247;
    float _4257 = _4255 + 1.0;
    float _4259 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4261 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4263 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4237);
    float _4265 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4195);
    float _4267 = _4261 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4269 = abs(_4257);
    float _4271 = log2(_4269);
    float _4273 = _4263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4275 = fma(_3577, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4277 = -_4267;
    float _4279 = fma(_4277, _4259, 1.0);
    float _4281 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4283 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4265);
    float _4285 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4281);
    float _4287 = _4253 * _4205;
    float _4289 = floor(_4249);
    float _4291 = _4253 * _4217;
    float _4293 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4285);
    float _4295 = _4253 * _4213;
    float _4297 = _4287 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4299 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4301 = _4293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4303 = _4283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4305 = -_4297;
    float _4307 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4305);
    float _4309 = floor(_4275);
    float _4311 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4299);
    float _4313 = _4271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4315 = -_4295;
    float _4317 = fma(_4315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4307);
    float _4319 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4311);
    float _4321 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4323 = -_4289;
    float _4325 = _4249 + _4323;
    float _4327 = log2(_4279);
    float _4329 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4319);
    float _4331 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4333 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4321);
    float _4335 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4331);
    float _4337 = exp2(_4313);
    float _4339 = fma(_4317, -0.5, 0.5);
    float _4341 = fma(_4317, 0.5, 0.5);
    float _4343 = -_4309;
    float _4345 = _4275 + _4343;
    float _4347 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4333);
    float _4349 = _4291 + 1.0;
    float _4351 = fma(_4341, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4353 = 1.0 / _4329;
    float _4355 = _4327 * 0.693147182464599609375;
    float _4357 = fma(_4341, _4351, -0.212114393711090087890625);
    float _4359 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4335);
    float _4361 = sqrt(_4339);
    float _4363 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4359);
    float _4365 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4347);
    float _4367 = -_4291;
    float _4369 = fma(_4337, _4349, _4367);
    float2 _11445 = float2(_4325, _4345);
    float _4371 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11445, float2(0.0), isnan(_11445)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11445, float2(0.0), isnan(_11445)), level(0.0)).x;
    float _4373 = fma(_4341, _4357, 1.570728778839111328125);
    float _4375 = _4355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4377 = _4363 * _4353;
    float _4379 = _4365 * _4353;
    float _4381 = fma(_4369, 0.5, 0.5);
    float _4383 = fma(_4377, 0.5, 0.5);
    float _4385 = fma(_4379, -0.5, 0.5);
    float _4387 = _4361 * 0.636619746685028076171875;
    float3 _11479 = float3(_4383, _4385, _4375);
    float _4389 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11479, float3(0.0), isnan(_11479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11479, float3(0.0), isnan(_11479)), level(0.0)).x;
    float _4391 = -_4373;
    float _4393 = fma(_4387, _4391, 1.0);
    float3 _11495 = float3(_4383, _4385, _4375);
    float4 _4396 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11495, float3(0.0), isnan(_11495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11495, float3(0.0), isnan(_11495)), level(0.0)).xyzw;
    float _4398 = _4396.x;
    float _4400 = _4396.y;
    float _4402 = _4396.z;
    float _4404 = _4396.w;
    float2 _11511 = float2(_4393, _4381);
    float3 _4408 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11511, float2(0.0), isnan(_11511)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11511, float2(0.0), isnan(_11511)), level(0.0)).xyz;
    float _4410 = _4408.x;
    float _4412 = _4408.y;
    float _4414 = _4408.z;
    float _4416 = _3559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4418 = _3559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4420 = _3745 != 0.0;
    bool _4422 = isnan(_3745);
    bool _4424 = _4420 || _4422;
    bool _4426 = isnan(0.0);
    bool _4428 = _4424 || _4426;
    float _4430 = _4271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4432 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4416);
    float _4434 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4418);
    bool _4436 = _3743 == 0.0;
    bool _4438 = !_4428;
    bool _4440 = _4436 && _4438;
    float _4442 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4444 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4432);
    float _4446 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4434);
    float _4448 = in.m_73.x;
    float _4450 = in.m_73.y;
    float _4452 = in.m_73.z;
    float _4454 = _4444 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4456 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4458 = _3747 == 0.0;
    bool _4460 = _4458 && _4440;
    float _4462 = exp2(_4430);
    float _4464 = _4456 + _4454;
    float _4466 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4442);
    out.m_75.x = _4053;
    out.m_75.y = _4051;
    out.m_75.z = _4055;
    float _4468 = 1.0 / _4454;
    float _4470 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4466);
    float _4472 = -_4462;
    float _4474 = _4472 + 1.0;
    float _4476 = in.m_77.x;
    float _4478 = in.m_77.y;
    float _4480 = in.m_77.z;
    float _4482 = in.m_77.w;
    float _4484 = _4448;
    float _4486 = _4365;
    if (_4460)
    {
        _3553 = _4450;
    }
    float _4488 = _3553;
    float _4490 = _4488;
    if (_4460)
    {
        _3555 = _4448;
    }
    float _4492 = _3555;
    float _4494 = _4464 * _4468;
    float _4496 = _4494 * 0.5;
    float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4500 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4498);
    float _4502 = 1.0 / _4500;
    float _4504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4506 = _4502 * _4504;
    float _4508 = _4502;
    float _4510 = _4492;
    if (_4460)
    {
        _4508 = _4492;
    }
    float _4512 = _4508;
    float _4514 = _4512;
    if (!_4460)
    {
        _4510 = _4448;
    }
    float _4516 = _4510;
    float _4518 = abs(_4506);
    float _4520 = log2(_4518);
    if (_4460)
    {
        _4484 = _4452;
    }
    float _4522 = _4484;
    float _4524 = _4522;
    if (!_4460)
    {
        float _4526 = fma(_3747, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4452);
        _4524 = _4526;
    }
    float _4528 = _4524;
    if (!_4460)
    {
        float _4530 = fma(_3743, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4516);
        _4514 = _4530;
    }
    float _4532 = _4514;
    float _4534 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4536 = _4520;
    float _4538 = _4532;
    if (_4460)
    {
        _4536 = _4488;
    }
    float _4540 = _4536;
    float _4542 = _4540;
    if (!_4460)
    {
        _4490 = _4450;
    }
    float _4544 = _4490;
    float _4546 = _4480 * _4516;
    float _4548 = exp2(_4534);
    if (!_4460)
    {
        float _4550 = fma(_3745, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4544);
        _4542 = _4550;
    }
    float _4552 = _4542;
    float _4554 = _4478 * _4452;
    float _4556 = _4476 * _4544;
    float _4558 = -_4546;
    float _4560 = fma(_4476, _4452, _4558);
    bool _4562 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4564 = isnan(_4079);
    bool _4566 = _4562 || _4564;
    bool _4568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4570 = _4566 || _4568;
    float _4572 = -_4554;
    float _4574 = fma(_4480, _4544, _4572);
    float _4576 = _4574 * _4482;
    float _4578 = fma(_4548, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4580 = precise::clamp(_4578, 0.0, 1.0);
    float _4582 = -_4556;
    float _4584 = fma(_4478, _4516, _4582);
    float _4586 = _4560 * _4482;
    float _4588 = _3813 * _3923;
    float _4590 = fma(_4580, -2.0, 3.0);
    float _4592 = _4580 * _4580;
    float _4594 = _4584 * _4482;
    float _4596 = _3813 * _3885;
    float _4598 = _3813 * _3879;
    float _4600 = _4592 * _4590;
    float _4602 = _3829 * _3885;
    float _4604 = _3829 * _3923;
    float _4606 = _3829 * _3879;
    float _4608 = _3845 * _3885;
    float _4610 = _3845 * _3923;
    float _4612 = -_3763;
    float _4614 = fma(_4612, _3861, _4602);
    float _4616 = -_3763;
    float _4618 = fma(_4616, _3863, _4604);
    float _4620 = -_3763;
    float _4622 = fma(_4620, _3865, _4606);
    float _4624 = -_4600;
    float _4626 = _4624 + 1.0;
    float _4628 = _3845 * _3879;
    float _4630 = fma(_3847, _3863, _4588);
    float _4632 = fma(_3831, _3863, _4610);
    float _4634 = fma(_3847, _3861, _4596);
    float _4636 = fma(_3847, _3865, _4598);
    float _4638 = fma(_3851, _3755, _4614);
    float _4640 = fma(_3851, _3759, _4618);
    float _4642 = fma(_3851, _3757, _4622);
    float _4644 = fma(_4626, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4600);
    float _4646 = fma(_3831, _3865, _4628);
    bool _4648 = _4506 <= 8000.0;
    bool _4650 = isnan(_4506);
    bool _4652 = _4648 || _4650;
    bool _4654 = isnan(8000.0);
    bool _4656 = _4652 || _4654;
    float _4658 = float(_4656);
    float _4660 = fma(_3831, _3861, _4608);
    float _4662 = fma(_3841, _3755, _4634);
    float _4664 = fma(_3841, _3759, _4630);
    float _4666 = _4638 * _4478;
    float _4668 = _4640 * _4478;
    float _4670 = _4642 * _4478;
    float _4672 = fma(_3841, _3757, _4636);
    float _4674 = _4638 * _4552;
    float _4676 = _4586 * _4638;
    float _4678 = fma(_3819, _3757, _4646);
    float _4680 = _4642 * _4552;
    float _4682 = _4658 * _4644;
    float _4684 = _4640 * _4552;
    float _4686 = _4586 * _4640;
    float _4688 = _4586 * _4642;
    float _4690 = fma(_3819, _3755, _4660);
    float _4692 = fma(_3819, _3759, _4632);
    float _4694 = fma(_4662, _4476, _4666);
    float _4696 = fma(_4664, _4476, _4668);
    float _4698 = in.m_79.x;
    float _4700 = fma(_4672, _4476, _4670);
    float _4702 = fma(_4662, _4532, _4674);
    float _4704 = fma(_4576, _4662, _4676);
    float _4706 = fma(_4664, _4532, _4684);
    float _4708 = fma(_4690, _4480, _4694);
    float _4710 = fma(_4692, _4480, _4696);
    float _4712 = fma(_4576, _4664, _4686);
    float _4714 = fma(_4678, _4480, _4700);
    float _4716 = fma(_4576, _4672, _4688);
    float _4718 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4470);
    float _4720 = fma(_4594, _4690, _4704);
    float _4722 = fma(_4594, _4692, _4712);
    float _4724 = fma(_4594, _4678, _4716);
    float _4726 = _4718 + _4329;
    float _4728 = fma(_4672, _4532, _4680);
    float _4730 = _4682 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4732 = fma(_4690, _4528, _4702);
    float _4734 = _4726 * 0.5;
    float _4736 = fma(_4692, _4528, _4706);
    float _4738 = fma(_4678, _4528, _4728);
    float _4740 = _4474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4720;
    out.m_81.y = _4722;
    out.m_81.z = _4724;
    out.m_83.x = _4708;
    out.m_83.y = _4710;
    out.m_83.z = _4714;
    float _4742 = _4724;
    float _4744 = _4722;
    float _4746 = _4363;
    if (!_4570)
    {
        _4538 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4748 = _4538;
    out.m_85.z = _4734;
    out.m_85.w = _4329;
    out.m_87.x = _4732;
    out.m_87.y = _4736;
    out.m_87.z = _4738;
    float _4750 = _4748;
    float _4752 = _4748;
    if (!_4570)
    {
        _4742 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4754 = _4742;
    float _4756 = _4754;
    float _4758 = _4754;
    if (!_4570)
    {
        _4744 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4760 = _4744;
    out.gl_Position.x = _4363;
    out.gl_Position.y = _4365;
    out.gl_Position.z = _4718;
    out.gl_Position.w = _4329;
    float _4762 = _4760;
    float _4764 = _4760;
    if (!_4570)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4766 = _4486;
    float _4768 = _4766;
    float _4770 = _4766;
    if (!_4570)
    {
        _4746 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4772 = _4746;
    float _4774 = -_4371;
    float _4776 = _4774 + 1.0;
    float _4778 = _4776 * _4730;
    float _4780 = precise::clamp(_4778, 0.0, 1.0);
    float _4782 = -_4780;
    float _4784 = fma(_4782, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4786 = _4784 * _4698;
    float _4788 = _4740 * _4389;
    float _4790 = -_4740;
    float _4792 = _4790 + 1.0;
    float _4794 = _4786 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4796 = _4404 * _4788;
    float _4798 = _4404 * _4792;
    out.m_89.x = _4794;
    float _4800 = _4414 * _4788;
    float _4802 = fma(_4410, _4796, _4398);
    float _4804 = fma(_4412, _4796, _4400);
    float _4806 = _4796;
    float _4808 = _4772;
    float _4810 = _4772;
    if (!_4570)
    {
        _4806 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4812 = _4806;
    float _4814 = fma(_4404, _4800, _4402);
    out.m_91.x = _4802;
    out.m_91.y = _4804;
    out.m_91.z = _4814;
    out.m_91.w = _4798;
    bool _4816 = !_4570;
    float _4818 = _4812;
    float _4820 = _4812;
    if (!_4816)
    {
        bool _4822 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4824 = isnan(_4079);
        bool _4826 = _4822 || _4824;
        bool _4828 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4830 = _4826 || _4828;
        if (!_4830)
        {
            float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4834 = _4079 + _4832;
            float _4836 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4838 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4836;
            float _4840 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4842 = _4840 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4844 = 1.0 / _4838;
            float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4854 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4856 = _4854 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4860 = _4858 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4862 = _4834 * _4844;
            float _4864 = precise::clamp(_4862, 0.0, 1.0);
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4870 = fma(_4864, _4842, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4872 = fma(_4864, _4868, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4874 = fma(_4864, _4848, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4876 = fma(_4864, _4852, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4878 = fma(_4864, _4856, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4880 = fma(_4864, _4860, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4810 = _4874;
            _4764 = _4878;
            _4770 = _4870;
            _4758 = _4876;
            _4752 = _4872;
            _4820 = _4880;
            _4882 = true;
        }
        else
        {
            bool _4884 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4886 = isnan(_4079);
            bool _4888 = _4884 || _4886;
            bool _4890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4892 = _4888 || _4890;
            if (!_4892)
            {
                _4768 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4894 = _4768;
            _4770 = _4894;
            if (!_4892)
            {
                _4808 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4896 = _4808;
            _4810 = _4896;
            if (!_4892)
            {
                _4750 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4898 = _4750;
            _4752 = _4898;
            if (!_4892)
            {
                _4756 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4900 = _4756;
            _4758 = _4900;
            if (!_4892)
            {
                _4762 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4902 = _4762;
            _4764 = _4902;
            if (!_4892)
            {
                _4818 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4904 = _4818;
            bool _4906 = !_4892;
            _4820 = _4904;
            if (!_4906)
            {
                bool _4908 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4910 = isnan(_4079);
                bool _4912 = _4908 || _4910;
                bool _4914 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4916 = _4912 || _4914;
                if (!_4916)
                {
                    float _4918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4920 = _4079 + _4918;
                    float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4924 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4922;
                    float _4926 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4928 = _4926 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4930 = 1.0 / _4924;
                    float _4932 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4934 = _4932 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4936 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4938 = _4936 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4940 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4942 = _4940 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4944 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4946 = _4944 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4948 = _4920 * _4930;
                    float _4950 = precise::clamp(_4948, 0.0, 1.0);
                    float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4954 = _4952 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4956 = fma(_4950, _4928, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4958 = fma(_4950, _4954, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4960 = fma(_4950, _4934, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4962 = fma(_4950, _4938, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4964 = fma(_4950, _4942, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4966 = fma(_4950, _4946, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4810 = _4960;
                    _4764 = _4964;
                    _4770 = _4956;
                    _4758 = _4962;
                    _4752 = _4958;
                    _4820 = _4966;
                    _4882 = true;
                }
                else
                {
                    _4810 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4764 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4770 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4758 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4752 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4820 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4882 = false;
    float _4968 = _4810;
    float _4970 = _4764;
    float _4972 = _4770;
    float _4974 = _4758;
    float _4976 = _4752;
    float _4978 = _4820;
    float _4980 = fma(_4736, -0.5, 0.5);
    float _4982 = precise::clamp(_4980, 0.0, 1.0);
    float _4984 = -_4968;
    float _4986 = _4984 + _4970;
    float _4988 = -_4972;
    float _4990 = _4988 + _4974;
    float _4992 = -_4976;
    float _4994 = _4992 + _4978;
    bool _4996 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4998 = fma(_4982, _4986, _4968);
    float _5000 = fma(_4982, _4990, _4972);
    float _5002 = fma(_4982, _4994, _4976);
    float _5004 = _4998 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _5006 = fma(_5000, 0.298911988735198974609375, _5004);
    float _5008 = fma(_5002, 0.114477999508380889892578125, _5006);
    out.m_93.x = 0.0;
    float _5010 = -_5008;
    float _5012 = _5000 + _5010;
    float _5014 = -_5008;
    float _5016 = _4998 + _5014;
    float _5018 = -_5008;
    float _5020 = _5002 + _5018;
    float _5022 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5024 = fma(_5012, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    float _5026 = fma(_5016, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    float _5028 = fma(_5020, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    out.m_89.w = _5022;
    out.m_95.x = _5024;
    out.m_95.y = _5026;
    out.m_95.z = _5028;
    if (!_4996)
    {
        return out;
    }
    float _5030 = -_4051;
    float _5032 = _5030 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5034 = -_4053;
    float _5036 = _5034 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5038 = -_4055;
    float _5040 = _5038 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5042 = _5032 * _5032;
    float _5044 = fma(_5036, _5036, _5042);
    float _5046 = fma(_5040, _5040, _5044);
    float _5048 = sqrt(_5046);
    float _5050 = rsqrt(_5046);
    float _5052 = -_5048;
    float _5054 = _5052 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5056 = _5054 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5058 = precise::clamp(_5056, 0.0, 1.0);
    float _5060 = _5036 * _5050;
    float _5062 = _5032 * _5050;
    float _5064 = abs(_5058);
    float _5066 = log2(_5064);
    float _5068 = _5040 * _5050;
    float _5070 = _5060 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5072 = _4736 * _5062;
    float _5074 = -_5062;
    float _5076 = -_5070;
    float _5078 = fma(_5074, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5076);
    float _5080 = fma(_4732, _5060, _5072);
    float _5082 = -_5068;
    float _5084 = fma(_5082, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5078);
    float _5086 = fma(_4738, _5068, _5080);
    float _5088 = precise::clamp(_5086, 0.0, 1.0);
    float _5090 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5092 = _5084 + _5090;
    float _5094 = _5066 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5096 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5098 = precise::clamp(_5096, 0.0, 1.0);
    float _5100 = exp2(_5094);
    float _5102 = _5100 * _5098;
    float _5104 = _5088 * _5102;
    float _5106 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5108 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5110 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _5106;
    out.m_93.y = _5108;
    out.m_93.z = _5110;
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
    bool _4882 = false;
    bool _634 = false;
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
        float _5167 = as_type<float>(_130);
        out.gl_Position.z = _5167;
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
        float _5237 = as_type<float>(_168);
        out.gl_Position.z = _5237;
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
    bool _540 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _542 = isnan(_538);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _556 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _558 = isnan(_538);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _574 = _538 + _572;
    float _576 = -_550;
    float _578 = _576 + 1.0;
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _582 = 1.0 / _554;
    float _584 = _566 * _578;
    float _586 = -_566;
    float _588 = _586 + 1.0;
    float _590 = _570 * _582;
    float _592 = fma(_590, _574, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _594 = _592 * _584;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _594);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _604 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[132].x, _596);
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _606;
    out.m_59.y = _608;
    out.m_59.z = _610;
    out.m_59.w = _612;
    bool _614 = !_580;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_114);
        float _638 = 1.0 / _636;
        float _640 = _148 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _646 = int(_644);
    float _648 = in.m_53.x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _652 = _642 + _650;
    float _654 = in.m_53.y;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _662 = _642 + _660;
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _666 = int(_664);
    float _668 = in.m_53.z;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _676 = _674 != 0;
    float _678 = in.m_61.x;
    float _680 = float(_114);
    float _682 = float(_646);
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _686 = int(_684);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _692 = float(_666);
    float _694 = 1.0 / _682;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _704 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _706 = int(_704);
    float _708 = float(uint(_686));
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _714 = ~_686;
    int _716 = _714 + 1;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _718;
    bool _722 = _668 > 0.5;
    float _724 = 0.0;
    float _726 = _692;
    bool _728 = _658;
    float _730 = _678;
    if (!_672)
    {
        _724 = _678;
    }
    float _732 = _724;
    float _734 = 1.0 / _692;
    float _736 = _694 * _148;
    int _738 = _686 + (-1);
    bool _740 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _742 = isnan(_642);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _754 = int(_752);
    float _756 = float(_706);
    float _758 = _732;
    if (_658)
    {
        _726 = 1.0;
    }
    float _760 = _726;
    float _762 = _760;
    if (!_658)
    {
        _762 = 7.345489978790283203125;
    }
    float _764 = _762;
    float _766 = 1.0 / _708;
    float _768 = _734 * _148;
    float _770 = _764 * _648;
    float _772 = trunc(_736);
    int _774 = int(_772);
    float _776 = float(uint(_754));
    int _778 = ~_754;
    int _780 = _778 + 1;
    int _782 = ~_754;
    int _784 = _782 + 1;
    float _786 = float(_754);
    float _788 = 1.0 / _756;
    int _790 = as_type<int>(_766) + (-2);
    float _792 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _794 = int(_792);
    float _796 = float(uint(_774));
    float _798 = as_type<float>(_790) * _796;
    float _800 = 1.0 / _776;
    float _802 = trunc(_768);
    int _804 = int(_802);
    float _806 = _788 * _148;
    float _808 = float(uint(_794));
    int _810 = ~_686;
    int _812 = _810 + 1;
    int _814 = ~_794;
    int _816 = _814 + 1;
    float _818 = 1.0 / _808;
    int _820 = as_type<int>(_800) + (-2);
    int _822 = ~_794;
    int _824 = _822 + 1;
    float _826 = float(_794);
    float _828 = trunc(_806);
    int _830 = int(_828);
    float _832 = float(uint(_804));
    float _834 = in.m_53.w;
    float _836 = float(_804);
    float _838 = as_type<float>(_820) * _832;
    float _840 = trunc(_798);
    float _842 = precise::max(_840, 0.0);
    uint _845 = uint(_842);
    int _847 = as_type<int>(_818) + (-2);
    float _849 = float(uint(_830));
    float _851 = trunc(_838);
    float _853 = precise::max(_851, 0.0);
    uint _855 = uint(_853);
    float _857 = as_type<float>(_847) * _849;
    float _859 = _849;
    int _861 = _847;
    if (_658)
    {
        _859 = _648;
    }
    float _863 = _859;
    int _865 = _812 * int(_845);
    int _867 = _865 + _774;
    float _869 = trunc(_857);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    float _875 = _863;
    float _877 = as_type<float>(_867);
    if (!_658)
    {
        _875 = _654;
    }
    float _879 = _875;
    float _881 = float(uint(_867));
    float _883 = _879;
    if (_658)
    {
        _877 = 1.0;
    }
    float _885 = _877;
    float _887 = floor(_770);
    float _889 = as_type<float>(_790) * _881;
    float _891 = _885;
    if (!_658)
    {
        _891 = 1.2345600128173828125;
    }
    float _893 = _891;
    int _895 = _780 * int(_855);
    int _897 = _895 + _804;
    float _899 = trunc(_889);
    float _901 = precise::max(_899, 0.0);
    uint _903 = uint(_901);
    int _905 = _816 * int(_873);
    int _907 = _905 + _830;
    float _909 = _879 * _893;
    float _911 = as_type<float>(_897);
    if (_658)
    {
        _883 = _648;
    }
    float _913 = _883;
    float _915 = float(uint(_897));
    float _917 = _913;
    if (_658)
    {
        _911 = 1.0;
    }
    float _919 = _911;
    float _921 = floor(_909);
    float _923 = float(uint(_907));
    float _925 = as_type<float>(_820) * _915;
    float _927 = _919;
    int _929 = as_type<int>(_925);
    float _931 = _923;
    if (!_658)
    {
        _917 = _668;
    }
    float _933 = _917;
    float _935 = in.m_61.y;
    int _937 = as_type<int>(_933);
    if (!_658)
    {
        _927 = 5.839270114898681640625;
    }
    float _939 = _927;
    float _941 = as_type<float>(_847) * _923;
    if (_672)
    {
        bool _943 = _648 > 0.5;
        _728 = _943;
    }
    bool _945 = _728;
    float _947 = trunc(_925);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    int _953 = int(_845) + int(_903);
    float _955 = _933 * _939;
    if (_672)
    {
        float _957 = -_678;
        float _959 = _957 + 1.0;
        _937 = as_type<int>(_959);
    }
    int _961 = _937;
    float _963 = -_887;
    float _965 = _770 + _963;
    int _967 = _716 * _953;
    int _969 = _967 + _774;
    float _971 = float(_686);
    float _973 = trunc(_941);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    if (_672)
    {
        float _979 = _945 ? as_type<float>(_961) : _678;
        _758 = _979;
    }
    float _981 = _758;
    if (_676)
    {
        float _983 = -_678;
        float _985 = _983 + 1.0;
        _929 = as_type<int>(_985);
    }
    int _987 = _929;
    if (!_676)
    {
        _931 = _678;
    }
    float _989 = _931;
    float _991 = -_921;
    float _993 = _909 + _991;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1005 = _1003 != 0;
    bool _1007 = uint(_969) >= uint(_686);
    float _1009 = floor(_955);
    float _1011 = float(_774);
    float _1013 = _989;
    if (_676)
    {
        float _1015 = _722 ? as_type<float>(_987) : _678;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = -_935;
    float _1021 = _1019 + 1.0;
    bool _1023 = !_1005;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1029 = _1027 != 0;
    float _1031 = 1.0 / _680;
    bool _1033 = _1011 >= _971;
    bool _1035 = isnan(_1011);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_971);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1047 = _1045 != 0;
    bool _1049 = _654 > 0.5;
    int _1051 = int(_855) + int(_951);
    float _1053 = trunc(_1043);
    int _1055 = int(_1053);
    int _1057 = int(_873) + int(_977);
    float _1059 = -_1009;
    float _1061 = _955 + _1059;
    bool _1063 = !_1029;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = _784 * _1051;
    int _1069 = _1067 + _804;
    bool _1071 = !_1047;
    int _1073 = _1071 ? 0 : 1;
    int _1075 = _824 * _1057;
    int _1077 = _1075 + _830;
    int _1079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1081 = _1079 != 0;
    float _1083 = 1.0 / _690;
    int _1085 = _1049 ? as_type<int>(_1021) : as_type<int>(_935);
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1089 = _1087 != 0;
    bool _1091 = !_1007;
    int _1093 = _1091 ? 0 : (-1);
    float _1095 = _1081 ? as_type<float>(_1085) : _935;
    float _1097 = 1.0 / _698;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1105 = _1103 != 0;
    int _1107 = ~_953;
    int _1109 = _1107 + _1093;
    int _1111 = _1109 + 1;
    bool _1113 = !_1089;
    int _1115 = _1113 ? 0 : 1;
    bool _1117 = uint(_1069) >= uint(_754);
    int _1119 = _686 * _1111;
    int _1121 = _1119 + _774;
    bool _1123 = !_1105;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = 1.0 / _702;
    bool _1129 = _686 == 0;
    bool _1131 = _836 >= _786;
    bool _1133 = isnan(_836);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(_786);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _965 * _971;
    bool _1145 = !_1117;
    int _1147 = _1145 ? 0 : (-1);
    float _1149 = _971 * _148;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    float _1159 = 1.0 / _712;
    int _1161 = ~_1055;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    bool _1167 = !_1129;
    int _1169 = _1167 ? _1121 : (-1);
    bool _1171 = !_1101;
    int _1173 = _1171 ? 0 : 1;
    bool _1175 = !_1153;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = trunc(_1141);
    int _1181 = int(_1179);
    int _1183 = _1169 * _1165;
    bool _1185 = uint(_1077) >= uint(_794);
    float _1187 = _786 * _993;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1191 = _1189 != 0;
    float _1193 = _1149 * _1031;
    float _1195 = _1031 * _148;
    bool _1197 = !_1001;
    int _1199 = _1197 ? 0 : 1;
    float _1201 = trunc(_1143);
    int _1203 = int(_1201);
    bool _1205 = !_997;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = _786 * _1195;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1217 = _1215 != 0;
    int _1219 = _1055 * _738;
    int _1221 = _1219 + _1183;
    int _1223 = ~_1051;
    int _1225 = _1223 + _1147;
    int _1227 = _1225 + 1;
    float _1229 = _826 * _1195;
    float _1231 = float(_830);
    float _1233 = trunc(_1187);
    int _1235 = int(_1233);
    int _1237 = abs(_1199);
    int _1239 = _754 * _1227;
    int _1241 = _1239 + _804;
    bool _1243 = !_1217;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1249 = _754 == 0;
    bool _1251 = _1231 >= _826;
    bool _1253 = isnan(_1231);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(_826);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = trunc(_1193);
    int _1265 = int(_1263);
    float _1267 = _826 * _1061;
    int _1269 = abs(_1073);
    int _1271 = abs(_1115);
    int _1273 = abs(_1207);
    int _1275 = _1203 * _1269;
    int _1277 = _1275 + _774;
    float _1279 = trunc(_1209);
    int _1281 = int(_1279);
    int _1283 = ~_1181;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    int _1289 = _1235 * _1271;
    int _1291 = _1289 + _804;
    bool _1293 = !_1249;
    int _1295 = _1293 ? _1241 : (-1);
    int _1297 = _1221 * _1237;
    int _1299 = abs(_1125);
    int _1301 = _1287 * _1295;
    int _1303 = abs(_1025);
    int _1305 = _1265 * _1273;
    int _1307 = _1305 + _1297;
    int _1309 = _754 + (-1);
    float _1311 = trunc(_1261);
    int _1313 = int(_1311);
    int _1315 = abs(_1065);
    int _1317 = _1181 * _1309;
    int _1319 = _1317 + _1301;
    int _1321 = abs(_1173);
    int _1323 = _1277 * _1303;
    int _1325 = _1323 + _1307;
    float _1327 = trunc(_1229);
    int _1329 = int(_1327);
    int _1331 = _1319 * _1299;
    int _1333 = abs(_1177);
    int _1335 = _1203 * _1315;
    int _1337 = _1335 + _1325;
    bool _1339 = !_1185;
    int _1341 = _1339 ? 0 : (-1);
    int _1343 = _1281 * _1321;
    int _1345 = _1343 + _1331;
    float _1347 = trunc(_1267);
    int _1349 = int(_1347);
    float _1351 = float(uint(_1337));
    bool _1353 = !_1157;
    int _1355 = _1353 ? 0 : 1;
    int _1357 = _1291 * _1333;
    int _1359 = _1357 + _1345;
    int _1361 = ~_1057;
    int _1363 = _1361 + _1341;
    int _1365 = _1363 + 1;
    float _1367 = as_type<float>(_790) * _1351;
    int _1369 = abs(_1355);
    bool _1371 = !_1191;
    int _1373 = _1371 ? 0 : 1;
    float _1375 = trunc(_1367);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = !_1213;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = _1235 * _1369;
    int _1387 = _1385 + _1359;
    int _1389 = abs(_1373);
    int _1391 = _794 * _1365;
    int _1393 = _1391 + _830;
    bool _1395 = _794 == 0;
    float _1397 = float(uint(_1387));
    int _1399 = _1349 * _1389;
    int _1401 = _1399 + _830;
    int _1403 = ~_686;
    int _1405 = _1403 + 1;
    int _1407 = ~_1313;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = as_type<float>(_820) * _1397;
    bool _1415 = !_1395;
    int _1417 = _1415 ? _1393 : (-1);
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1421 = _1419 != 0;
    int _1423 = _1405 * int(_1379);
    int _1425 = _1423 + _1337;
    int _1427 = _794 + (-1);
    int _1429 = _1411 * _1417;
    int _1431 = abs(_1245);
    float _1433 = trunc(_1413);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = float(uint(_1425));
    int _1441 = _1313 * _1427;
    int _1443 = _1441 + _1429;
    bool _1445 = !_1421;
    int _1447 = _1445 ? 0 : 1;
    int _1449 = abs(_1383);
    float _1451 = as_type<float>(_790) * _1439;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1455 = _1453 != 0;
    int _1457 = ~_754;
    int _1459 = _1457 + 1;
    int _1461 = _1443 * _1431;
    int _1463 = abs(_1447);
    float _1465 = trunc(_1451);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    bool _1471 = !_1455;
    int _1473 = _1471 ? 0 : 1;
    int _1475 = _1329 * _1449;
    int _1477 = _1475 + _1461;
    int _1479 = abs(_1473);
    bool _1481 = _834 > 0.5;
    int _1483 = _1459 * int(_1437);
    int _1485 = _1483 + _1387;
    int _1487 = _1481 ? as_type<int>(_1021) : as_type<int>(_935);
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1491 = _1489 != 0;
    int _1493 = _1401 * _1463;
    int _1495 = _1493 + _1477;
    float _1497 = float(uint(_1485));
    float _1499 = _1491 ? as_type<float>(_1487) : _935;
    int _1501 = _1349 * _1479;
    int _1503 = _1501 + _1495;
    int _1505 = int(_1379) + int(_1469);
    float _1507 = as_type<float>(_820) * _1497;
    int _1509 = ~_686;
    int _1511 = _1509 + 1;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1515 = _1513 != 0;
    float _1517 = trunc(_1507);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    float _1523 = float(uint(_1503));
    int _1525 = _1511 * _1505;
    int _1527 = _1525 + _1337;
    bool _1529 = _668 > 0.5;
    float _1531 = float(uint(_1277));
    float _1533 = as_type<float>(_847) * _1523;
    bool _1535 = uint(_1527) >= uint(_686);
    int _1537 = ~_794;
    int _1539 = _1537 + 1;
    float _1541 = as_type<float>(_790) * _1531;
    bool _1543 = !_1535;
    int _1545 = _1543 ? 0 : (-1);
    float _1547 = trunc(_1533);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    float _1553 = _935;
    int _1555 = as_type<int>(_1021);
    int _1557 = _1273;
    float _1559 = as_type<float>(_1291);
    if (_1515)
    {
        float _1561 = _1529 ? _1021 : _935;
        _1553 = _1561;
    }
    float _1563 = _1553;
    float _1565 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1569 = _1567 != 0;
    int _1571 = ~_1505;
    int _1573 = _1571 + _1545;
    int _1575 = _1573 + 1;
    int _1577 = int(_1437) + int(_1521);
    float _1579 = trunc(_1541);
    float _1581 = precise::max(_1579, 0.0);
    uint _1583 = uint(_1581);
    int _1585 = ~_754;
    int _1587 = _1585 + 1;
    int _1589 = _686 * _1575;
    int _1591 = _1589 + _1337;
    int _1593 = ~_686;
    int _1595 = _1593 + 1;
    int _1597 = _1587 * _1577;
    int _1599 = _1597 + _1387;
    bool _1601 = !_1129;
    int _1603 = _1601 ? _1591 : (-1);
    if (_1569)
    {
        float _1605 = -_678;
        float _1607 = _1605 + 1.0;
        _1555 = as_type<int>(_1607);
    }
    int _1609 = _1555;
    int _1611 = _1539 * int(_1551);
    int _1613 = _1611 + _1503;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1619 = _1603 & 3;
    bool _1621 = _1619 != 0;
    if (_1569)
    {
        float _1623 = _1049 ? as_type<float>(_1609) : _678;
        _730 = _1623;
    }
    float _1625 = _730;
    int _1627 = _1603 & 3;
    bool _1629 = _1627 != 0;
    int _1631 = _1595 * int(_1583);
    int _1633 = _1631 + _1277;
    int _1635 = _1621 ? 0 : 1;
    float _1637 = 1.0 / _1617;
    bool _1639 = uint(_1599) >= uint(_754);
    float _1641 = float(uint(_1613));
    bool _1643 = uint(_1627) >= 2u;
    bool _1645 = !_1639;
    int _1647 = _1645 ? 0 : (-1);
    float _1649 = as_type<float>(_847) * _1641;
    int _1651 = _1643 ? 0 : 1;
    bool _1653 = _1627 != 3;
    float _1655 = trunc(_1649);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    bool _1661 = uint(_1627) > 1u;
    int _1663 = ~_1577;
    int _1665 = _1663 + _1647;
    int _1667 = _1665 + 1;
    int _1669 = ~_1651;
    int _1671 = _1669 + 1;
    int _1673 = _1671 + 1;
    int _1675 = ~_1635;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _754 * _1667;
    int _1683 = _1681 + _1387;
    float _1685 = float(uint(_1401));
    int _1687 = _1673;
    int _1689 = _1679;
    float _1691 = as_type<float>(_1627);
    if (_1653)
    {
        int _1693 = ~_1651;
        int _1695 = _1693 + 1;
        _1687 = _1695;
    }
    int _1697 = _1687;
    bool _1699 = !_1249;
    int _1701 = _1699 ? _1683 : (-1);
    float _1703 = as_type<float>(_847) * _1685;
    if (!_1661)
    {
        int _1705 = ~_1635;
        int _1707 = _1705 + 1;
        _1689 = _1707;
    }
    int _1709 = _1689;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1713 = _1711 != 0;
    float _1715 = in.m_46.x;
    float _1717 = in.m_46.y;
    float _1719 = in.m_46.z;
    int _1721 = _1701 & 3;
    bool _1723 = _1721 != 0;
    bool _1725 = !_1713;
    int _1727 = _1725 ? 0 : 1;
    bool _1729 = uint(_1721) >= 2u;
    int _1731 = _1723 ? 0 : 1;
    int _1733 = int(_1551) + int(_1659);
    bool _1735 = _1721 != 3;
    int _1737 = _1729 ? 0 : 1;
    bool _1739 = uint(_1721) > 1u;
    int _1741 = ~_794;
    int _1743 = _1741 + 1;
    int _1745 = ~_1737;
    int _1747 = _1745 + 1;
    int _1749 = _1747 + 1;
    int _1751 = ~_1731;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    int _1757 = _1743 * _1733;
    int _1759 = _1757 + _1503;
    float _1761 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1763 = _1749;
    int _1765 = _1755;
    float _1767 = as_type<float>(_1721);
    if (_1735)
    {
        int _1769 = ~_1737;
        int _1771 = _1769 + 1;
        _1763 = _1771;
    }
    int _1773 = _1763;
    float _1775 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1777 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1761);
    bool _1779 = uint(_1759) >= uint(_794);
    float _1781 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1775);
    if (!_1739)
    {
        int _1783 = ~_1731;
        int _1785 = _1783 + 1;
        _1765 = _1785;
    }
    int _1787 = _1765;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1791 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1781);
    bool _1793 = !_1779;
    int _1795 = _1793 ? 0 : (-1);
    float _1797 = -_1789;
    float _1799 = fma(_1565, 2.0, _1797);
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1803 = _1801 != 0;
    float _1805 = _1791 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1809 = _1807 != 0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1813 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1815 = float(uint(_1291));
    float _1817 = fma(_1247, -2.0, _1811);
    float _1819 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1813);
    float _1821 = float(uint(_1633));
    float _1823 = as_type<float>(_820) * _1815;
    float _1825 = trunc(_1703);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1839 = as_type<float>(_790) * _1821;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1841;
    float _1845 = _1833 * _1637;
    float _1847 = _1837 * _1083;
    float _1849 = trunc(_1823);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1855;
    int _1859 = ~_794;
    int _1861 = _1859 + 1;
    float _1863 = _1843 * _1097;
    int _1865 = ~_754;
    int _1867 = _1865 + 1;
    float _1869 = _1857 * _1127;
    int _1871 = ~_686;
    int _1873 = _1871 + 1;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1879 = trunc(_1839);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    int _1885 = _1861 * int(_1829);
    int _1887 = _1885 + _1401;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1895 = _1893 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1897 = ~_1733;
    int _1899 = _1897 + _1795;
    int _1901 = _1899 + 1;
    float _1903 = _648 + _654;
    float _1905 = float(uint(_1887));
    float _1907 = _1895 * _1159;
    int _1909 = _1867 * int(_1853);
    int _1911 = _1909 + _1291;
    float _1913 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1819);
    float _1915 = _1903 + (-1.0);
    float _1917 = float(uint(_1911));
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_1891)
    {
        _1557 = 0;
    }
    int _1923 = _1557;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1927 = _1925 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1929 = int(_1583) + int(_1883);
    float _1931 = as_type<float>(_820) * _1917;
    float _1933 = as_type<float>(_847) * _1905;
    int _1935 = _794 * _1901;
    int _1937 = _1935 + _1503;
    float _1939 = _648 * 2.0;
    int _1941 = _1923;
    if (_1891)
    {
        _861 = 0;
    }
    int _1943 = _861;
    int _1945 = _1873 * _1929;
    int _1947 = _1945 + _1277;
    bool _1949 = !_1803;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = 1.0 / _1921;
    bool _1955 = !_1395;
    int _1957 = _1955 ? _1937 : (-1);
    float _1959 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1961 = uint(_1947) >= uint(_686);
    float _1963 = _1913 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1965 = _1943;
    if (!_1891)
    {
        _1965 = 1;
    }
    int _1967 = _1965;
    float _1969 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1817);
    if (!_1891)
    {
        _1941 = 2;
    }
    int _1971 = _1941;
    float _1973 = floor(_1939);
    int _1975 = _1957 & 3;
    bool _1977 = _1975 != 0;
    bool _1979 = !_1809;
    int _1981 = _1979 ? 0 : 1;
    bool _1983 = _1975 != 3;
    bool _1985 = !_1961;
    int _1987 = _1985 ? 0 : (-1);
    float _1989 = trunc(_1931);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    bool _1995 = uint(_1975) >= 2u;
    float _1997 = _1877 * _1953;
    bool _1999 = !_1629;
    int _2001 = _1999 ? 0 : 1;
    int _2003 = _1995 ? 0 : 1;
    float _2005 = fma(_1997, _652, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2007 = uint(_1975) > 1u;
    float _2009 = trunc(_1933);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    int _2015 = ~_2003;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _2019;
    if (_1983)
    {
        int _2023 = ~_2003;
        int _2025 = _2023 + 1;
        _2021 = _2025;
    }
    int _2027 = _2021;
    int _2029 = _1977 ? 0 : 1;
    bool _2031 = _1973 > 0.0;
    float _2033 = 1.0 / _1927;
    bool _2035 = _1973 >= 0.0;
    bool _2037 = isnan(_1973);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    int _2045 = ~_754;
    int _2047 = _2045 + 1;
    int _2049 = int(_1853) + int(_1993);
    float _2051 = _654 * 2.0;
    float _2053 = _668 * 2.0;
    int _2055 = int(_1829) + int(_2013);
    float _2057 = _654 + _668;
    float _2059 = floor(_2051);
    int _2061 = abs(_2001);
    int _2063 = _2047 * _2049;
    int _2065 = _2063 + _1291;
    float _2067 = _720 * _2033;
    int _2069 = ~_2029;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = _2057 + (-1.0);
    int _2077 = _2073;
    if (!_2007)
    {
        int _2079 = ~_2029;
        int _2081 = _2079 + 1;
        _2077 = _2081;
    }
    int _2083 = _2077;
    float _2085 = floor(_2053);
    int _2087 = ~_794;
    int _2089 = _2087 + 1;
    float _2091 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2093 = uint(_2065) >= uint(_754);
    float _2095 = fma(_2067, _662, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2097 = ~_1929;
    int _2099 = _2097 + _1987;
    int _2101 = _2099 + 1;
    int _2103 = _2089 * _2055;
    int _2105 = _2103 + _1401;
    bool _2107 = !_2093;
    int _2109 = _2107 ? 0 : (-1);
    int _2111 = _2043 ? 0 : 1;
    int _2113 = _686 * _2101;
    int _2115 = _2113 + _1277;
    bool _2117 = uint(_2105) >= uint(_794);
    bool _2119 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2121 = isnan(_642);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2127 = _2123 || _2125;
    float _2129 = float(_2127);
    bool _2131 = !_2117;
    int _2133 = _2131 ? 0 : (-1);
    int _2135 = ~_2111;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = -_2129;
    float _2143 = _2141 + 1.0;
    bool _2145 = _2059 > 0.0;
    bool _2147 = _2059 >= 0.0;
    bool _2149 = isnan(_2059);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    int _2157 = _2139;
    if (!_2031)
    {
        int _2159 = ~_2111;
        int _2161 = _2159 + 1;
        _2157 = _2161;
    }
    int _2163 = _2157;
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2167 = _642 + _2165;
    bool _2169 = !_1129;
    int _2171 = _2169 ? _2115 : (-1);
    float _2173 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1777);
    bool _2175 = _2085 > 0.0;
    bool _2177 = _2085 >= 0.0;
    bool _2179 = isnan(_2085);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = _2173 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2189 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2191 = isnan(_642);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2197 = _2193 || _2195;
    float _2199 = float(_2197);
    bool _2201 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2203 = isnan(_642);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2209 = _2205 || _2207;
    float _2211 = float(_2209);
    bool _2213 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2215 = isnan(_642);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2199 * _2143;
    float _2227 = -_2199;
    float _2229 = _2227 + 1.0;
    float _2231 = -_2211;
    float _2233 = _2231 + 1.0;
    float _2235 = fma(_1845, _2167, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2239 = _642 + _2237;
    float _2241 = _2211 * _2229;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2245 = _642 + _2243;
    float _2247 = _750 * _2233;
    float _2249 = -_750;
    float _2251 = _2249 + 1.0;
    float _2253 = fma(_1847, _2239, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2255 = fma(_1863, _2245, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2259 = _642 + _2257;
    bool _2261 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2263 = isnan(_642);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2269 = _2265 || _2267;
    float _2271 = float(_2269);
    float _2273 = _2223 * _2251;
    float _2275 = -_2223;
    float _2277 = _2275 + 1.0;
    float _2279 = fma(_1907, _2259, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2283 = _642 + _2281;
    bool _2285 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2287 = isnan(_642);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = _2271 * _2277;
    float _2299 = -_2271;
    float _2301 = _2299 + 1.0;
    float _2303 = fma(_1869, _2283, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2305 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2307 = isnan(_642);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = -_2295;
    float _2319 = _2317 + 1.0;
    float _2321 = _2295 * _2301;
    int _2323 = _2155 ? 0 : 1;
    bool _2325 = _1971 != 2;
    float _2327 = _2315 * _2319;
    float _2329 = -_2315;
    float _2331 = _2329 + 1.0;
    int _2333 = ~_2049;
    int _2335 = _2333 + _2109;
    int _2337 = _2335 + 1;
    float _2339 = _2235 * _2327;
    int _2341 = ~_2055;
    int _2343 = _2341 + _2133;
    int _2345 = _2343 + 1;
    int _2347 = ~_2323;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2339);
    int _2355 = _754 * _2337;
    int _2357 = _2355 + _1291;
    int _2359 = _2351;
    float _2361 = _2321;
    if (!_2145)
    {
        int _2363 = ~_2323;
        int _2365 = _2363 + 1;
        _2359 = _2365;
    }
    int _2367 = _2359;
    int _2369 = _794 * _2345;
    int _2371 = _2369 + _1401;
    float _2373 = fma(_2253, _2321, _2353);
    if (_2325)
    {
        _1559 = _648;
    }
    float _2375 = _1559;
    float _2377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2379 = _2187 + _2377;
    bool _2381 = _1967 != 1;
    float _2383 = fma(_2255, _2297, _2373);
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2387 = _1963 + _2385;
    float _2389 = _2375;
    if (!_2325)
    {
        _2389 = _668;
    }
    float _2391 = _2389;
    float _2393 = fma(_2279, _2273, _2383);
    int _2395 = _2185 ? 0 : 1;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2399 = !_1249;
    int _2401 = _2399 ? _2357 : (-1);
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2405 = !_1395;
    int _2407 = _2405 ? _2371 : (-1);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2411 = _1805 + _2409;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2415 = _2413 != 0;
    int _2417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2419 = _2417 != 0;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2423 = _2421 != 0;
    float _2425 = -_2397;
    float _2427 = fma(_2403, 2.0, _2425);
    int _2429 = _1603 >> 31;
    float _2431 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2433 = _1701 & 3;
    bool _2435 = _2433 != 0;
    float _2437 = fma(_2303, _2247, _2393);
    int _2439 = _2429 & 3;
    float _2441 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2431);
    bool _2443 = !_2435;
    int _2445 = _2443 ? 0 : 1;
    float _2447 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2449 = int(_2447);
    int _2451 = _1957 & 3;
    bool _2453 = _2451 != 0;
    float _2455 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2441);
    int _2457 = _1701 >> 31;
    float _2459 = fma(_2005, _2241, _2437);
    int _2461 = _1603 + _2439;
    int _2463 = _1957 >> 31;
    float _2465 = fma(_2095, _2225, _2459);
    bool _2467 = !_2453;
    int _2469 = _2467 ? 0 : 1;
    int _2471 = _2457 & 3;
    float _2473 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2465);
    bool _2475 = _1627 != 3;
    int _2477 = _2461 >> 2;
    int _2479 = _2463 & 3;
    out.m_63.x = _2473;
    int _2481 = _1701 + _2471;
    bool _2483 = !_2475;
    int _2485 = _2483 ? 0 : (-1);
    bool _2487 = _1721 != 3;
    int _2489 = _2477 << 4;
    int _2491 = _2489 + 368;
    int _2493 = _1957 + _2479;
    int _2495 = ~_2395;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    int _2501 = _2481 >> 2;
    int _2503 = _2499;
    if (!_2175)
    {
        int _2505 = ~_2395;
        int _2507 = _2505 + 1;
        _2503 = _2507;
    }
    int _2509 = _2503;
    bool _2511 = !_2487;
    int _2513 = _2511 ? 0 : (-1);
    uint _2515 = uint(int(uint(_2491) >> uint(2)));
    uint _2517 = uint(int(uint(int(_2515)) >> uint(2)));
    int _2519 = int(_2515) & 3;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[int(_2517)][_2519];
    int _2523 = int(_2515) + 1;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    int _2527 = _2523 & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    bool _2531 = _1975 != 3;
    int _2533 = _2501 << 4;
    int _2535 = _2533 + 512;
    int _2537 = _2493 >> 2;
    uint _2539 = uint(int(uint(_2535) >> uint(2)));
    uint _2541 = uint(int(uint(int(_2539)) >> uint(2)));
    int _2543 = int(_2539) & 3;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[int(_2541)][_2543];
    int _2547 = int(_2539) + 1;
    uint _2549 = uint(int(uint(_2547) >> uint(2)));
    int _2551 = _2547 & 3;
    float _2553 = (*spvDescriptorSet0.vp_c9)._m0[int(_2549)][_2551];
    int _2555 = _2537 << 4;
    int _2557 = _2555 + 656;
    if (!_2381)
    {
        _1691 = _668;
    }
    float _2559 = _1691;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2563 = _2559;
    if (_2381)
    {
        _2563 = _654;
    }
    float _2565 = _2563;
    int _2567 = abs(_1787);
    uint _2569 = uint(int(uint(_2557) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    if (!_2381)
    {
        _1767 = _654;
    }
    float _2585 = _1767;
    float _2587 = fma(_2565, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2561);
    bool _2589 = !_2531;
    int _2591 = _2589 ? 0 : (-1);
    bool _2593 = _2455 >= 0.0;
    float _2595 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2587);
    int _2597 = abs(_1709);
    int _2599 = _2491 + 8;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    uint _2603 = uint(int(uint(int(_2601)) >> uint(2)));
    int _2605 = int(_2601) & 3;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[int(_2603)][_2605];
    int _2609 = int(_2601) + 1;
    uint _2611 = uint(int(uint(_2609) >> uint(2)));
    int _2613 = _2609 & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    float _2617 = _2585;
    if (!_2381)
    {
        _2361 = _2585;
    }
    float _2619 = _2361;
    float _2621 = _2619;
    if (_2381)
    {
        _2617 = _648;
    }
    float _2623 = _2617;
    float _2625 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2627 = ~_2597;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    int _2633 = _2557 + 8;
    uint _2635 = uint(int(uint(_2633) >> uint(2)));
    uint _2637 = uint(int(uint(int(_2635)) >> uint(2)));
    int _2639 = int(_2635) & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = int(_2635) + 1;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    int _2647 = _2643 & 3;
    float _2649 = (*spvDescriptorSet0.vp_c9)._m0[int(_2645)][_2647];
    if (_2381)
    {
        _2621 = _648;
    }
    float _2651 = _2621;
    float _2653 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2625);
    if (_2593)
    {
        out.m_49.x = 0.0;
    }
    int _2655 = ~_2061;
    int _2657 = _2655 + 1;
    int _2659 = _2657 + 1;
    float _2661 = _2651 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2663 = ~_2567;
    int _2665 = _2663 + 1;
    int _2667 = _2665 + 1;
    int _2669 = _2535 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2689 = abs(_2445);
    int _2691 = abs(_2083);
    int _2693 = abs(_2469);
    int _2695 = _2631 * as_type<int>(_2529);
    float _2697 = -_2687;
    float _2699 = fma(_2661, 2.0, _2697);
    int _2701 = abs(_1773);
    int _2703 = _2659 * as_type<int>(_2521);
    int _2705 = _2703 + _2695;
    int _2707 = abs(_1697);
    float _2709 = -_148;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2699);
    int _2713 = _2667 * as_type<int>(_2553);
    int _2715 = ~_2691;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    float _2721 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2723 = int(_2721);
    int _2725 = ~_2689;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    int _2731 = ~_2693;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = _2719 * as_type<int>(_2583);
    int _2739 = ~_2707;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2729 * as_type<int>(_2545);
    int _2747 = _2745 + _2713;
    int _2749 = abs(_2027);
    int _2751 = _2735 * as_type<int>(_2575);
    int _2753 = _2751 + _2737;
    int _2755 = abs(_2485);
    float _2757 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2759 = int(_2757);
    int _2761 = ~_2749;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    int _2767 = _2743 * as_type<int>(_2607);
    int _2769 = _2767 + _2705;
    int _2771 = ~_2701;
    int _2773 = _2771 + 1;
    int _2775 = _2773 + 1;
    int _2777 = abs(_2513);
    int _2779 = ~_2755;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = abs(_2591);
    int _2787 = _2765 * as_type<int>(_2641);
    int _2789 = _2787 + _2753;
    float _2791 = float(uint(_2723));
    int _2793 = _2783 * as_type<int>(_2615);
    int _2795 = _2793 + _2769;
    int _2797 = abs(_1727);
    int _2799 = ~_2777;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    float _2805 = 1.0 / _2791;
    int _2807 = ~_2785;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    int _2813 = _2775 * as_type<int>(_2677);
    int _2815 = _2813 + _2747;
    int _2817 = abs(_1951);
    float _2819 = float(uint(_2449));
    int _2821 = _2803 * as_type<int>(_2685);
    int _2823 = _2821 + _2815;
    int _2825 = abs(_2449);
    int _2827 = _2811 * as_type<int>(_2649);
    int _2829 = _2827 + _2789;
    float _2831 = 1.0 / _2819;
    int _2833 = ~_2817;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = ~_2797;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = float(uint(_2759));
    int _2847 = _2837 * _2823;
    int _2849 = abs(_1981);
    int _2851 = abs(_2759);
    int _2853 = _2795 * _2843;
    float _2855 = 1.0 / _2845;
    int _2857 = _2401 * _2817;
    int _2859 = _2857 + _2847;
    int _2861 = _2171 * _2797;
    int _2863 = _2861 + _2853;
    int _2865 = abs(_2723);
    float _2867 = float(uint(_2825));
    int _2869 = ~_2849;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    float _2875 = float(uint(_2851));
    float _2877 = float(uint(_2865));
    float _2879 = 1.0 / _2867;
    int _2881 = _2873 * _2829;
    int _2883 = as_type<int>(_2831) + (-2);
    float _2885 = float(uint(_2863));
    int _2887 = _2407 * _2849;
    int _2889 = _2887 + _2881;
    int _2891 = as_type<int>(_2805) + (-2);
    float _2893 = 1.0 / _2877;
    float _2895 = float(uint(_2859));
    float _2897 = as_type<float>(_2883) * _2885;
    int _2899 = ~_2759;
    int _2901 = _2899 + 1;
    int _2903 = as_type<int>(_2855) + (-2);
    float _2905 = as_type<float>(_2891) * _2895;
    float _2907 = float(uint(_2889));
    float _2909 = 1.0 / _2875;
    int _2911 = abs(_2863);
    float _2913 = as_type<float>(_2903) * _2907;
    int _2915 = as_type<int>(_2879) + (-2);
    int _2917 = abs(_2859);
    float _2919 = trunc(_2897);
    float _2921 = precise::max(_2919, 0.0);
    uint _2923 = uint(_2921);
    float _2925 = float(uint(_2911));
    int _2927 = as_type<int>(_2893) + (-2);
    int _2929 = abs(_2889);
    int _2931 = ~_2449;
    int _2933 = _2931 + 1;
    float _2935 = trunc(_2913);
    float _2937 = precise::max(_2935, 0.0);
    uint _2939 = uint(_2937);
    int _2941 = as_type<int>(_2909) + (-2);
    float _2943 = as_type<float>(_2915) * _2925;
    bool _2945 = !_2419;
    int _2947 = _2945 ? 0 : 1;
    float _2949 = float(uint(_2917));
    float _2951 = trunc(_2905);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    int _2957 = abs(_2947);
    float _2959 = as_type<float>(_2927) * _2949;
    float _2961 = float(_2163);
    float _2963 = float(uint(_2929));
    float _2965 = trunc(_2943);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    int _2971 = _2933 * int(_2923);
    int _2973 = _2971 + _2863;
    int _2975 = ~_2723;
    int _2977 = _2975 + 1;
    float _2979 = as_type<float>(_2941) * _2963;
    float _2981 = float(_2957);
    int _2983 = _2901 * int(_2939);
    int _2985 = _2983 + _2889;
    float _2987 = float(uint(_2973));
    float _2989 = trunc(_2959);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    float _2995 = _2687;
    float _2997 = as_type<float>(_2923);
    if (!_2381)
    {
        _2995 = _668;
    }
    float _2999 = _2995;
    float _3001 = _2981 * _2961;
    int _3003 = _2977 * int(_2955);
    int _3005 = _3003 + _2859;
    float _3007 = _2999;
    if (_2381)
    {
        _3007 = _654;
    }
    float _3009 = _3007;
    float _3011 = as_type<float>(_2883) * _2987;
    float _3013 = float(uint(_2985));
    float _3015 = trunc(_2979);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = ~_2825;
    int _3023 = _3021 + 1;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3029 = float(uint(_3005));
    float _3031 = as_type<float>(_2903) * _3013;
    int _3033 = ~_2851;
    int _3035 = _3033 + 1;
    int _3037 = _3023 * int(_2969);
    int _3039 = _3037 + _2911;
    float _3041 = trunc(_3011);
    float _3043 = precise::max(_3041, 0.0);
    uint _3045 = uint(_3043);
    float _3047 = fma(_3027, -2.0, _3025);
    int _3049 = ~_2865;
    int _3051 = _3049 + 1;
    float _3053 = as_type<float>(_2891) * _3029;
    bool _3055 = !_2415;
    int _3057 = _3055 ? 0 : 1;
    int _3059 = _3051 * int(_2993);
    int _3061 = _3059 + _2917;
    float _3063 = float(uint(_3039));
    int _3065 = _3035 * int(_3019);
    int _3067 = _3065 + _2929;
    int _3069 = abs(_3057);
    float _3071 = trunc(_3053);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = float(_2509);
    float _3079 = as_type<float>(_2915) * _3063;
    float _3081 = float(_3069);
    float _3083 = float(uint(_3061));
    float _3085 = float(uint(_3067));
    float _3087 = trunc(_3079);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    int _3093 = int(_2923) + int(_3045);
    float _3095 = _3081 * _3077;
    float _3097 = as_type<float>(_2927) * _3083;
    float _3099 = _3085;
    if (_2325)
    {
        _2997 = _654;
    }
    float _3101 = _2997;
    float _3103 = as_type<float>(_2941) * _3085;
    float _3105 = _3101;
    if (!_2325)
    {
        _3105 = _648;
    }
    float _3107 = _3105;
    float _3109 = _3095 * (-2.0);
    int _3111 = as_type<int>(_3107);
    if (_2593)
    {
        _3099 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3113 = _3099;
    float _3115 = trunc(_3031);
    float _3117 = precise::max(_3115, 0.0);
    uint _3119 = uint(_3117);
    float _3121 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3123 = ~_2449;
    int _3125 = _3123 + 1;
    if (_2593)
    {
        float _3127 = _3113 * 5.0;
        _3111 = as_type<int>(_3127);
    }
    int _3129 = _3111;
    float _3131 = fma(_1959, _3109, _1959);
    int _3133 = ~_2723;
    int _3135 = _3133 + 1;
    float _3137 = in.m_65.x;
    float _3139 = in.m_65.y;
    float _3141 = in.m_65.z;
    float _3143 = trunc(_3097);
    float _3145 = precise::max(_3143, 0.0);
    uint _3147 = uint(_3145);
    if (_2593)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9523 = as_type<float>(_3129);
        out.gl_Position.z = _9523;
    }
    int _3149 = int(_2955) + int(_3075);
    int _3151 = int(_2969) + int(_3091);
    int _3153 = _3125 * _3093;
    int _3155 = _3153 + _2863;
    float _3157 = trunc(_3103);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = int(_2939) + int(_3119);
    int _3165 = ~_2851;
    int _3167 = _3165 + 1;
    bool _3169 = uint(_3155) >= uint(_2449);
    int _3171 = ~_2825;
    int _3173 = _3171 + 1;
    int _3175 = ~_2759;
    int _3177 = _3175 + 1;
    int _3179 = _3135 * _3149;
    int _3181 = _3179 + _2859;
    int _3183 = int(_2993) + int(_3147);
    int _3185 = _3173 * _3151;
    int _3187 = _3185 + _2911;
    int _3189 = ~_2865;
    int _3191 = _3189 + 1;
    int _3193 = _3177 * _3163;
    int _3195 = _3193 + _2889;
    bool _3197 = uint(_3181) >= uint(_2723);
    float _3199 = fma(_3109, _3137, _3137);
    bool _3201 = uint(_3187) >= uint(_2825);
    int _3203 = _3191 * _3183;
    int _3205 = _3203 + _2917;
    bool _3207 = !_3169;
    int _3209 = _3207 ? 0 : (-1);
    float _3211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3213 = !_3197;
    int _3215 = _3213 ? 0 : (-1);
    bool _3217 = uint(_3195) >= uint(_2759);
    int _3219 = ~_3093;
    int _3221 = _3219 + _3209;
    int _3223 = _3221 + 1;
    int _3225 = ~_3149;
    int _3227 = _3225 + _3215;
    int _3229 = _3227 + 1;
    float _3231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3233 = int(_3019) + int(_3161);
    int _3235 = _2449 * _3223;
    int _3237 = _3235 + _2863;
    bool _3239 = uint(_3205) >= uint(_2865);
    int _3241 = _2723 * _3229;
    int _3243 = _3241 + _2859;
    bool _3245 = !_3217;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3167 * _3233;
    int _3251 = _3249 + _2929;
    bool _3253 = _2449 == 0;
    float _3255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3257 = !_3239;
    int _3259 = _3257 ? 0 : (-1);
    bool _3261 = _2723 == 0;
    int _3263 = ~_3163;
    int _3265 = _3263 + _3247;
    int _3267 = _3265 + 1;
    bool _3269 = !_3253;
    int _3271 = _3269 ? _3237 : (-1);
    bool _3273 = !_3261;
    int _3275 = _3273 ? _3243 : (-1);
    int _3277 = _2759 * _3267;
    int _3279 = _3277 + _2889;
    bool _3281 = _2759 == 0;
    bool _3283 = _2759 == 0;
    int _3285 = _2889 ^ _2759;
    float _3287 = _3211 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3289 = ~_3259;
    int _3291 = _3183 + _3289;
    int _3293 = _3291 + 1;
    float _3295 = _3231 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3297 = float(_3271);
    float _3299 = -_148;
    float _3301 = fma(_3299, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1799);
    bool _3303 = uint(_3251) >= uint(_2851);
    float _3305 = fma(_3287, _981, -0.5);
    int _3307 = _2863 ^ _2449;
    float _3309 = fma(_3287, _3297, _3301);
    float _3311 = float(_3275);
    float _3313 = fma(_3295, _1017, -0.5);
    bool _3315 = !_3281;
    int _3317 = _3315 ? _3279 : (-1);
    float _3319 = _3255 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3321 = !_3303;
    int _3323 = _3321 ? 0 : (-1);
    float _3325 = _2411 * _2411;
    bool _3327 = _2723 == 0;
    float _3329 = fma(_3319, _1625, -0.5);
    bool _3331 = !_3201;
    int _3333 = _3331 ? 0 : (-1);
    int _3335 = _2859 ^ _2723;
    uint _3337 = uint(int(uint(_3307) >> uint(31)));
    float _3339 = fma(_3295, _3311, _2711);
    float _3341 = float(_3317);
    float _3343 = -_148;
    float _3345 = fma(_3343, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2427);
    int _3347 = ~_3333;
    int _3349 = _3151 + _3347;
    int _3351 = _3349 + 1;
    float _3353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3355 = ~int(_3337);
    int _3357 = _3355 + 1;
    float _3359 = fma(_3319, _3341, _3345);
    uint _3361 = uint(int(uint(_3335) >> uint(31)));
    int _3363 = _3351 ^ _3357;
    int _3365 = ~int(_3361);
    int _3367 = _3365 + 1;
    uint _3369 = uint(int(uint(_3285) >> uint(31)));
    float _3371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3373 = ~_3357;
    int _3375 = _3373 + _3363;
    int _3377 = _3375 + 1;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3381 = _3293 ^ _3367;
    float _3383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3385 = ~int(_3369);
    int _3387 = _3385 + 1;
    float _3389 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3371);
    int _3391 = ~_3367;
    int _3393 = _3391 + _3381;
    int _3395 = _3393 + 1;
    float _3397 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3379);
    float _3399 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2653);
    bool _3401 = _2449 == 0;
    float _3403 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3389);
    int _3405 = ~_3323;
    int _3407 = _3233 + _3405;
    int _3409 = _3407 + 1;
    float _3411 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3397);
    float _3413 = fma(_3399, _3313, _3339);
    float _3415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3417 = !_3327;
    int _3419 = _3417 ? _3395 : (-1);
    float _3421 = fma(_3403, _3305, _3309);
    bool _3423 = !_3401;
    int _3425 = _3423 ? _3377 : (-1);
    float _3427 = fma(_3411, _3329, _3359);
    float _3429 = _3353 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3431 = _3409 ^ _3387;
    float _3433 = _3383 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3435 = float(_3419);
    float _3437 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3047);
    float _3439 = float(_3425);
    float _3441 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3443 = ~_3387;
    int _3445 = _3443 + _3431;
    int _3447 = _3445 + 1;
    float _3449 = fma(_1095, _3429, -0.5);
    float _3451 = -_3437;
    float _3453 = fma(_3433, _3435, _3451);
    float _3455 = -_1969;
    float _3457 = fma(_3429, _3439, _3455);
    bool _3459 = !_3283;
    int _3461 = _3459 ? _3447 : (-1);
    float _3463 = fma(_3121, -2.0, _3441);
    float _3465 = fma(_1499, _3433, -0.5);
    float _3467 = float(_3461);
    float _3469 = _3415 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3471 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3463);
    float _3473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3477 = log2(_3475);
    float _3479 = -_3471;
    float _3481 = fma(_3469, _3467, _3479);
    float _3483 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3473);
    float _3485 = fma(_2379, _2379, _3325);
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3489 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3491 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3483);
    float _3493 = fma(_2387, _2387, _3485);
    float _3495 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3487);
    float _3497 = fma(_3469, _1563, -0.5);
    float _3499 = fma(_3491, _3449, _3457);
    float _3501 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3495);
    float _3503 = rsqrt(_3493);
    float _3505 = fma(_2595, _3465, _3453);
    float _3507 = _3421 + 0.5;
    float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3511 = 1.0 + _3509;
    float _3513 = fma(_3501, _3497, _3481);
    float _3515 = _3413 + 0.5;
    float _3517 = _3499 + 0.5;
    float _3519 = _3505 + 0.5;
    float _3521 = 1.0 / _3511;
    float _3523 = _3427 + 0.5;
    float _3525 = _3513 + 0.5;
    float _3527 = _3489 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3529 = _3477 * _148;
    out.m_67.x = _3507;
    out.m_67.y = _3517;
    out.m_67.z = _3515;
    out.m_67.w = _3519;
    bool _3531 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3533 = isnan(1.0);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3539 = _3535 || _3537;
    float _3541 = _3527 * _3503;
    out.m_69.x = _3523;
    out.m_69.y = _3525;
    float _3543 = exp2(_3529);
    bool _3545 = !_2423;
    int _3547 = _3545 ? 0 : 1;
    float _3549 = _2379 * _3541;
    float _3551 = _2411 * _3541;
    float _3553 = as_type<float>(_3395);
    float _3555 = as_type<float>(_3149);
    if (_2593)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3557 = -_3551;
    float _3559 = _1805 + _3557;
    float _3561 = _2387 * _3541;
    float _3563 = -_3549;
    float _3565 = _2187 + _3563;
    float _3567 = -_3543;
    float _3569 = _3567 + 1.0;
    float _3571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3573 = _3559 + _3571;
    float _3575 = -_3561;
    float _3577 = _1963 + _3575;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3581 = _3565 + _3579;
    bool _3583 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3585 = isnan(0.0);
    bool _3587 = _3583 || _3585;
    bool _3589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3591 = _3587 || _3589;
    float _3593 = _3573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3597 = _3577 + _3595;
    float _3599 = -_3551;
    float _3601 = _2411 + _3599;
    float _3603 = _3591 ? _3569 : 0.0;
    float _3605 = fma(_3581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3593);
    float _3607 = _648 + (-0.5);
    float _3609 = -_3549;
    float _3611 = _2379 + _3609;
    float _3613 = _3601 * _3601;
    float _3615 = fma(_3597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3605);
    float _3617 = _3593;
    float _3619 = _3581;
    float _3621 = _3561;
    if (_3539)
    {
        float _3623 = _3603 * _3521;
        _150 = _3623;
    }
    float _3625 = _150;
    float _3627 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3199);
    float _3629 = _3001 * (-2.0);
    float _3631 = fma(_3611, _3611, _3613);
    bool _3633 = _3615 >= 0.0;
    float _3635 = -_3561;
    float _3637 = _2387 + _3635;
    float _3639 = fma(_3131, _3625, _3627);
    float _3641 = _654 + (-0.5);
    float _3643 = fma(_3629, _3139, _3139);
    float _3645 = fma(_3637, _3637, _3631);
    float _3647 = _3639 * 0.15915493667125701904296875;
    int _3649 = abs(_3547);
    float _3651 = fma(_3641, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3643);
    float _3653 = float(_2367);
    float _3655 = sqrt(_3645);
    float _3657 = fma(_2091, _3629, _2091);
    if (_3633)
    {
        out.m_49.x = 0.0;
    }
    if (_3633)
    {
        _3617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3659 = _3617;
    float _3661 = float(_3649);
    float _3663 = fma(_3657, _3625, _3651);
    float _3665 = _3647 * 6.283185482025146484375;
    float _3667 = sin(_3665);
    int _3669 = as_type<int>(_3659);
    if (_3633)
    {
        float _3671 = _3659 * 5.0;
        _3669 = as_type<int>(_3671);
    }
    int _3673 = _3669;
    float _3675 = _3661 * _3653;
    if (_3633)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10340 = as_type<float>(_3673);
        out.gl_Position.z = _10340;
    }
    float _3677 = _3647 * 6.283185482025146484375;
    float _3679 = cos(_3677);
    if (_3633)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3681 = -_1805;
    float _3683 = _3681 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3685 = -_2187;
    float _3687 = _3685 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3689 = -_1963;
    float _3691 = _3689 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3693 = _648 + _668;
    float _3695 = _3683 * _3683;
    float _3697 = _3675 * (-2.0);
    float _3699 = _668 + (-0.5);
    float _3701 = _3693 + (-1.0);
    float _3703 = fma(_3687, _3687, _3695);
    float _3705 = fma(_3697, _3141, _3141);
    float _3707 = _3663 * 0.15915493667125701904296875;
    float _3709 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3711 = fma(_3691, _3691, _3703);
    float _3713 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3705);
    float _3715 = _3707 * 6.283185482025146484375;
    float _3717 = sin(_3715);
    float _3719 = fma(_3709, _3697, _3709);
    float _3721 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3723 = fma(_3719, _3625, _3713);
    float _3725 = _3503 * _3655;
    bool _3727 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3729 = isnan(0.5);
    bool _3731 = _3727 || _3729;
    bool _3733 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3735 = _3731 || _3733;
    float _3737 = rsqrt(_3711);
    float _3739 = _3723 * 0.15915493667125701904296875;
    float _3741 = _3489 * _3725;
    float _3743 = in.m_71.x;
    float _3745 = in.m_71.y;
    float _3747 = in.m_71.z;
    float _3749 = _3707 * 6.283185482025146484375;
    float _3751 = cos(_3749);
    float _3753 = _3667 * _3717;
    float _3755 = _3687 * _3737;
    float _3757 = _3691 * _3737;
    float _3759 = _3683 * _3737;
    float _3761 = _3739 * 6.283185482025146484375;
    float _3763 = sin(_3761);
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3767 = _3755 * _3765;
    float _3769 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3771 = _3757 * _3769;
    float _3773 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3775 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3777 = -_3767;
    float _3779 = fma(_3757, _3775, _3777);
    float _3781 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3783 = -_3771;
    float _3785 = fma(_3759, _3781, _3783);
    float _3787 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3789 = _3759 * _3787;
    float _3791 = _3739 * 6.283185482025146484375;
    float _3793 = cos(_3791);
    float _3795 = _3779 * _3779;
    float _3797 = _3679 * _3751;
    float _3799 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3801 = -_3789;
    float _3803 = fma(_3755, _3799, _3801);
    float _3805 = _3725 * _3773;
    float _3807 = fma(_3785, _3785, _3795);
    float _3809 = _3667 * _3751;
    float _3811 = _3725 * _3721;
    float _3813 = fma(_3763, _3797, _3753);
    float _3815 = fma(_3803, _3803, _3807);
    float _3817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3745);
    float _3819 = fma(_3763, _3753, _3797);
    float _3821 = _3679 * _3717;
    float _3823 = _3817 * _3805;
    float _3825 = rsqrt(_3815);
    float _3827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3743);
    float _3829 = _3679 * _3793;
    float _3831 = _3717 * _3793;
    float _3833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3747);
    float _3835 = _3827 * _3741;
    float _3837 = _3829 * _3823;
    float _3839 = -_3821;
    float _3841 = fma(_3763, _3809, _3839);
    float _3843 = -_3809;
    float _3845 = fma(_3763, _3821, _3843);
    float _3847 = _3751 * _3793;
    float _3849 = fma(_3813, _3835, _3837);
    float _3851 = _3667 * _3793;
    float _3853 = _3833 * _3811;
    float _3855 = -_3823;
    float _3857 = _3763 * _3855;
    float _3859 = _3851 * _3823;
    float _3861 = _3785 * _3825;
    float _3863 = _3779 * _3825;
    float _3865 = _3803 * _3825;
    float _3867 = fma(_3847, _3835, _3857);
    float _3869 = _3759 * _3861;
    float _3871 = fma(_3845, _3853, _3849);
    float _3873 = _3757 * _3863;
    float _3875 = fma(_3841, _3835, _3859);
    float _3877 = -_3869;
    float _3879 = fma(_3755, _3863, _3877);
    float _3881 = fma(_3831, _3853, _3867);
    float _3883 = -_3873;
    float _3885 = fma(_3759, _3865, _3883);
    float _3887 = fma(_3819, _3853, _3875);
    float _3889 = _3879 * _3871;
    float _3891 = _3885 * _3871;
    float _3893 = fma(_3865, _3881, _3889);
    float _3895 = fma(_3861, _3881, _3891);
    float _3897 = fma(_3757, _3887, _3893);
    float _3899 = fma(_3755, _3887, _3895);
    float _3901 = _1963 + _3897;
    float _3903 = _2187 + _3899;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3907 = _3901 + _3905;
    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3911 = _3903 + _3909;
    float _3913 = _3907 * _3907;
    float _3915 = fma(_3911, _3911, _3913);
    float _3917 = _3755 * _3865;
    float _3919 = sqrt(_3915);
    float _3921 = -_3917;
    float _3923 = fma(_3757, _3861, _3921);
    float _3925 = _3923 * _3871;
    float _3927 = fma(_3863, _3881, _3925);
    float _3929 = fma(_3759, _3887, _3927);
    bool _3931 = _3919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3933 = _1805 + _3929;
    float _3935 = _3929;
    float _3937 = _3903;
    float _3939 = _3901;
    if (!_3931)
    {
        _3935 = _3933;
    }
    float _3941 = _3935;
    bool _3943 = !_3931;
    float _3945 = _3941;
    if (!_3943)
    {
        float _3947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3951 = _3919 + _3949;
        float _3953 = rsqrt(_3915);
        float _3955 = _3951 * _3947;
        float _3957 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3959 = _3955 * 0.15915493667125701904296875;
        float _3961 = _3959 * 6.283185482025146484375;
        float _3963 = cos(_3961);
        float _3965 = _3959 * 6.283185482025146484375;
        float _3967 = sin(_3965);
        float _3969 = _3963 + (-1.0);
        float _3971 = fma(_3967, _3957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3973 = _3969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3975 = _3953 * _3971;
        float _3977 = fma(_3933, _3963, _3973);
        float _3979 = fma(_3911, _3975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3981 = fma(_3907, _3975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3937 = _3979;
        _3945 = _3977;
        _3939 = _3981;
    }
    float _3983 = _3937;
    float _3985 = _3945;
    float _3987 = _3939;
    float _3989 = -_3549;
    float _3991 = _3989 + _3983;
    float _3993 = -_3551;
    float _3995 = _3993 + _3985;
    float _3997 = -_3561;
    float _3999 = _3997 + _3987;
    float _4001 = _3995;
    float _4003 = _3991;
    float _4005 = _3999;
    if (!_3735)
    {
        float _4007 = _3573 * _3573;
        float _4009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4011 = -_1963;
        float _4013 = _4011 + _3987;
        float _4015 = -_2187;
        float _4017 = _4015 + _3983;
        float _4019 = fma(_3581, _3581, _4007);
        float _4021 = -_1805;
        float _4023 = _4021 + _3985;
        float _4025 = fma(_3597, _3597, _4019);
        float _4027 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4029 = sqrt(_4025);
        float _4031 = 1.0 / _3725;
        float _4033 = _4027 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4035 = precise::min(_4029, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4037 = _4035 * _4009;
        float _4039 = _4037 * _4031;
        float _4041 = _4033 * _4039;
        float _4043 = _4013 * _4039;
        float _4045 = fma(_4017, _4041, _3565);
        float _4047 = fma(_4023, _4041, _3559);
        float _4049 = fma(_4033, _4043, _3577);
        _4001 = _4047;
        _4003 = _4045;
        _4005 = _4049;
        _3619 = _4029;
    }
    float _4051 = _4001;
    float _4053 = _4003;
    float _4055 = _4005;
    float _4057 = _3619;
    float _4059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4061 = _4051 + _4059;
    float _4063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4065 = _4053 + _4063;
    float _4067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4069 = _4055 + _4067;
    float _4071 = _4061 * _4061;
    float _4073 = fma(_4065, _4065, _4071);
    float _4075 = fma(_4069, _4069, _4073);
    float _4077 = rsqrt(_4075);
    float _4079 = sqrt(_4075);
    float _4081 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4083 = _4065 * _4081;
    float _4085 = _4069 * _4081;
    float _4087 = _4083 * _4083;
    float _4089 = _4085 * _4085;
    float _4091 = _4087 + _4089;
    float _4093 = sqrt(_4091);
    bool _4095 = _4093 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4099 = _4093 + _4097;
    float _4101 = _4069;
    float _4103 = _4091;
    float _4105 = _4099;
    float _4107 = _4057;
    float _4109 = _4061;
    if (_4095)
    {
        float _4111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4101 = _4111;
    }
    float _4113 = _4101;
    if (_4095)
    {
        float _4115 = rsqrt(_4091);
        _4103 = _4115;
    }
    float _4117 = _4103;
    float _4119 = _4117;
    if (_4095)
    {
        float _4121 = _4099 * _4113;
        _4105 = _4121;
    }
    float _4123 = _4105;
    if (_4095)
    {
        float _4125 = _4123 * 0.15915493667125701904296875;
        _4107 = _4125;
    }
    float _4127 = _4107;
    float _4129 = _4071;
    float _4131 = _4127;
    if (_4095)
    {
        float _4133 = _4127 * 6.283185482025146484375;
        float _4135 = sin(_4133);
        _4129 = _4135;
    }
    float _4137 = _4129;
    float _4139 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4141 = precise::max(0.0, _4139);
    float _4143 = _4077;
    float _4145 = _4139;
    float _4147 = _4141;
    if (_4095)
    {
        float _4149 = _4127 * 6.283185482025146484375;
        float _4151 = cos(_4149);
        _4143 = _4151;
    }
    float _4153 = _4143;
    float _4155 = -_4081;
    float _4157 = -_4141;
    float _4159 = fma(_4061, _4155, _4157);
    if (_4095)
    {
        float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4145 = _4161;
    }
    float _4163 = _4145;
    float _4165 = _4163;
    if (!_4095)
    {
        _4131 = _4083;
    }
    float _4167 = _4131;
    float _4169 = _4137;
    float _4171 = _4167;
    if (_4095)
    {
        float _4173 = fma(_4137, _4163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4165 = _4173;
    }
    float _4175 = _4165;
    if (!_4095)
    {
        _4169 = _4159;
    }
    float _4177 = _4169;
    float _4179 = _4177;
    float _4181 = _4153;
    if (_4095)
    {
        float _4183 = _4153 + (-1.0);
        _4109 = _4183;
    }
    float _4185 = _4109;
    float _4187 = _4185;
    if (_4095)
    {
        float _4189 = _4117 * _4175;
        _3621 = _4189;
    }
    float _4191 = _3621;
    if (!_4095)
    {
        _4119 = _4089;
    }
    float _4193 = _4119;
    float _4195 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4197 = _4193;
    if (_4095)
    {
        float _4199 = _4185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4147 = _4199;
    }
    float _4201 = _4147;
    if (_4095)
    {
        float _4203 = _4083 * _4191;
        _4171 = _4203;
    }
    float _4205 = _4171;
    if (!_4095)
    {
        _4187 = _4085;
    }
    float _4207 = _4187;
    float _4209 = _4207;
    if (_4095)
    {
        float _4211 = _4085 * _4191;
        _4209 = _4211;
    }
    float _4213 = _4209;
    if (_4095)
    {
        float _4215 = fma(_4159, _4153, _4201);
        _4179 = _4215;
    }
    float _4217 = _4179;
    if (!_4095)
    {
        _4181 = _4087;
    }
    float _4219 = _4181;
    float _4221 = _4219;
    if (_4095)
    {
        float _4223 = _4205 * _4205;
        _4221 = _4223;
    }
    float _4225 = _4221;
    if (_4095)
    {
        float _4227 = _4213 * _4213;
        _4197 = _4227;
    }
    float _4229 = _4197;
    float _4231 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4233 = fma(_4217, _4217, _4225);
    float _4235 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4237 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4231);
    float _4239 = _4233 + _4229;
    float _4241 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4235);
    float _4243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4245 = fma(_4079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4243);
    float _4247 = precise::clamp(_4245, 0.0, 1.0);
    float _4249 = fma(_3565, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4251 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4241);
    float _4253 = rsqrt(_4239);
    float _4255 = -_4247;
    float _4257 = _4255 + 1.0;
    float _4259 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4261 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4263 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4237);
    float _4265 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4195);
    float _4267 = _4261 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4269 = abs(_4257);
    float _4271 = log2(_4269);
    float _4273 = _4263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4275 = fma(_3577, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4277 = -_4267;
    float _4279 = fma(_4277, _4259, 1.0);
    float _4281 = _4051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4283 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4265);
    float _4285 = fma(_4053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4281);
    float _4287 = _4253 * _4205;
    float _4289 = floor(_4249);
    float _4291 = _4253 * _4217;
    float _4293 = fma(_4055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4285);
    float _4295 = _4253 * _4213;
    float _4297 = _4287 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4299 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4301 = _4293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4303 = _4283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4305 = -_4297;
    float _4307 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4305);
    float _4309 = floor(_4275);
    float _4311 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4299);
    float _4313 = _4271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4315 = -_4295;
    float _4317 = fma(_4315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4307);
    float _4319 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4311);
    float _4321 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4323 = -_4289;
    float _4325 = _4249 + _4323;
    float _4327 = log2(_4279);
    float _4329 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4319);
    float _4331 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4333 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4321);
    float _4335 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4331);
    float _4337 = exp2(_4313);
    float _4339 = fma(_4317, -0.5, 0.5);
    float _4341 = fma(_4317, 0.5, 0.5);
    float _4343 = -_4309;
    float _4345 = _4275 + _4343;
    float _4347 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4333);
    float _4349 = _4291 + 1.0;
    float _4351 = fma(_4341, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4353 = 1.0 / _4329;
    float _4355 = _4327 * 0.693147182464599609375;
    float _4357 = fma(_4341, _4351, -0.212114393711090087890625);
    float _4359 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4335);
    float _4361 = sqrt(_4339);
    float _4363 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4359);
    float _4365 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4347);
    float _4367 = -_4291;
    float _4369 = fma(_4337, _4349, _4367);
    float2 _11445 = float2(_4325, _4345);
    float _4371 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11445, float2(0.0), isnan(_11445)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11445, float2(0.0), isnan(_11445)), level(0.0)).x;
    float _4373 = fma(_4341, _4357, 1.570728778839111328125);
    float _4375 = _4355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4377 = _4363 * _4353;
    float _4379 = _4365 * _4353;
    float _4381 = fma(_4369, 0.5, 0.5);
    float _4383 = fma(_4377, 0.5, 0.5);
    float _4385 = fma(_4379, -0.5, 0.5);
    float _4387 = _4361 * 0.636619746685028076171875;
    float3 _11479 = float3(_4383, _4385, _4375);
    float _4389 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11479, float3(0.0), isnan(_11479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11479, float3(0.0), isnan(_11479)), level(0.0)).x;
    float _4391 = -_4373;
    float _4393 = fma(_4387, _4391, 1.0);
    float3 _11495 = float3(_4383, _4385, _4375);
    float4 _4396 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11495, float3(0.0), isnan(_11495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11495, float3(0.0), isnan(_11495)), level(0.0)).xyzw;
    float _4398 = _4396.x;
    float _4400 = _4396.y;
    float _4402 = _4396.z;
    float _4404 = _4396.w;
    float2 _11511 = float2(_4393, _4381);
    float3 _4408 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11511, float2(0.0), isnan(_11511)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11511, float2(0.0), isnan(_11511)), level(0.0)).xyz;
    float _4410 = _4408.x;
    float _4412 = _4408.y;
    float _4414 = _4408.z;
    float _4416 = _3559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4418 = _3559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4420 = _3745 != 0.0;
    bool _4422 = isnan(_3745);
    bool _4424 = _4420 || _4422;
    bool _4426 = isnan(0.0);
    bool _4428 = _4424 || _4426;
    float _4430 = _4271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4432 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4416);
    float _4434 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4418);
    bool _4436 = _3743 == 0.0;
    bool _4438 = !_4428;
    bool _4440 = _4436 && _4438;
    float _4442 = _4273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4444 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4432);
    float _4446 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4434);
    float _4448 = in.m_73.x;
    float _4450 = in.m_73.y;
    float _4452 = in.m_73.z;
    float _4454 = _4444 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4456 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4458 = _3747 == 0.0;
    bool _4460 = _4458 && _4440;
    float _4462 = exp2(_4430);
    float _4464 = _4456 + _4454;
    float _4466 = fma(_4301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4442);
    out.m_75.x = _4053;
    out.m_75.y = _4051;
    out.m_75.z = _4055;
    float _4468 = 1.0 / _4454;
    float _4470 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4466);
    float _4472 = -_4462;
    float _4474 = _4472 + 1.0;
    float _4476 = in.m_77.x;
    float _4478 = in.m_77.y;
    float _4480 = in.m_77.z;
    float _4482 = in.m_77.w;
    float _4484 = _4448;
    float _4486 = _4365;
    if (_4460)
    {
        _3553 = _4450;
    }
    float _4488 = _3553;
    float _4490 = _4488;
    if (_4460)
    {
        _3555 = _4448;
    }
    float _4492 = _3555;
    float _4494 = _4464 * _4468;
    float _4496 = _4494 * 0.5;
    float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4500 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4498);
    float _4502 = 1.0 / _4500;
    float _4504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4506 = _4502 * _4504;
    float _4508 = _4502;
    float _4510 = _4492;
    if (_4460)
    {
        _4508 = _4492;
    }
    float _4512 = _4508;
    float _4514 = _4512;
    if (!_4460)
    {
        _4510 = _4448;
    }
    float _4516 = _4510;
    float _4518 = abs(_4506);
    float _4520 = log2(_4518);
    if (_4460)
    {
        _4484 = _4452;
    }
    float _4522 = _4484;
    float _4524 = _4522;
    if (!_4460)
    {
        float _4526 = fma(_3747, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4452);
        _4524 = _4526;
    }
    float _4528 = _4524;
    if (!_4460)
    {
        float _4530 = fma(_3743, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4516);
        _4514 = _4530;
    }
    float _4532 = _4514;
    float _4534 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4536 = _4520;
    float _4538 = _4532;
    if (_4460)
    {
        _4536 = _4488;
    }
    float _4540 = _4536;
    float _4542 = _4540;
    if (!_4460)
    {
        _4490 = _4450;
    }
    float _4544 = _4490;
    float _4546 = _4480 * _4516;
    float _4548 = exp2(_4534);
    if (!_4460)
    {
        float _4550 = fma(_3745, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4544);
        _4542 = _4550;
    }
    float _4552 = _4542;
    float _4554 = _4478 * _4452;
    float _4556 = _4476 * _4544;
    float _4558 = -_4546;
    float _4560 = fma(_4476, _4452, _4558);
    bool _4562 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4564 = isnan(_4079);
    bool _4566 = _4562 || _4564;
    bool _4568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4570 = _4566 || _4568;
    float _4572 = -_4554;
    float _4574 = fma(_4480, _4544, _4572);
    float _4576 = _4574 * _4482;
    float _4578 = fma(_4548, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4580 = precise::clamp(_4578, 0.0, 1.0);
    float _4582 = -_4556;
    float _4584 = fma(_4478, _4516, _4582);
    float _4586 = _4560 * _4482;
    float _4588 = _3813 * _3923;
    float _4590 = fma(_4580, -2.0, 3.0);
    float _4592 = _4580 * _4580;
    float _4594 = _4584 * _4482;
    float _4596 = _3813 * _3885;
    float _4598 = _3813 * _3879;
    float _4600 = _4592 * _4590;
    float _4602 = _3829 * _3885;
    float _4604 = _3829 * _3923;
    float _4606 = _3829 * _3879;
    float _4608 = _3845 * _3885;
    float _4610 = _3845 * _3923;
    float _4612 = -_3763;
    float _4614 = fma(_4612, _3861, _4602);
    float _4616 = -_3763;
    float _4618 = fma(_4616, _3863, _4604);
    float _4620 = -_3763;
    float _4622 = fma(_4620, _3865, _4606);
    float _4624 = -_4600;
    float _4626 = _4624 + 1.0;
    float _4628 = _3845 * _3879;
    float _4630 = fma(_3847, _3863, _4588);
    float _4632 = fma(_3831, _3863, _4610);
    float _4634 = fma(_3847, _3861, _4596);
    float _4636 = fma(_3847, _3865, _4598);
    float _4638 = fma(_3851, _3755, _4614);
    float _4640 = fma(_3851, _3759, _4618);
    float _4642 = fma(_3851, _3757, _4622);
    float _4644 = fma(_4626, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4600);
    float _4646 = fma(_3831, _3865, _4628);
    bool _4648 = _4506 <= 8000.0;
    bool _4650 = isnan(_4506);
    bool _4652 = _4648 || _4650;
    bool _4654 = isnan(8000.0);
    bool _4656 = _4652 || _4654;
    float _4658 = float(_4656);
    float _4660 = fma(_3831, _3861, _4608);
    float _4662 = fma(_3841, _3755, _4634);
    float _4664 = fma(_3841, _3759, _4630);
    float _4666 = _4638 * _4478;
    float _4668 = _4640 * _4478;
    float _4670 = _4642 * _4478;
    float _4672 = fma(_3841, _3757, _4636);
    float _4674 = _4638 * _4552;
    float _4676 = _4586 * _4638;
    float _4678 = fma(_3819, _3757, _4646);
    float _4680 = _4642 * _4552;
    float _4682 = _4658 * _4644;
    float _4684 = _4640 * _4552;
    float _4686 = _4586 * _4640;
    float _4688 = _4586 * _4642;
    float _4690 = fma(_3819, _3755, _4660);
    float _4692 = fma(_3819, _3759, _4632);
    float _4694 = fma(_4662, _4476, _4666);
    float _4696 = fma(_4664, _4476, _4668);
    float _4698 = in.m_79.x;
    float _4700 = fma(_4672, _4476, _4670);
    float _4702 = fma(_4662, _4532, _4674);
    float _4704 = fma(_4576, _4662, _4676);
    float _4706 = fma(_4664, _4532, _4684);
    float _4708 = fma(_4690, _4480, _4694);
    float _4710 = fma(_4692, _4480, _4696);
    float _4712 = fma(_4576, _4664, _4686);
    float _4714 = fma(_4678, _4480, _4700);
    float _4716 = fma(_4576, _4672, _4688);
    float _4718 = fma(_4303, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4470);
    float _4720 = fma(_4594, _4690, _4704);
    float _4722 = fma(_4594, _4692, _4712);
    float _4724 = fma(_4594, _4678, _4716);
    float _4726 = _4718 + _4329;
    float _4728 = fma(_4672, _4532, _4680);
    float _4730 = _4682 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4732 = fma(_4690, _4528, _4702);
    float _4734 = _4726 * 0.5;
    float _4736 = fma(_4692, _4528, _4706);
    float _4738 = fma(_4678, _4528, _4728);
    float _4740 = _4474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4720;
    out.m_81.y = _4722;
    out.m_81.z = _4724;
    out.m_83.x = _4708;
    out.m_83.y = _4710;
    out.m_83.z = _4714;
    float _4742 = _4724;
    float _4744 = _4722;
    float _4746 = _4363;
    if (!_4570)
    {
        _4538 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4748 = _4538;
    out.m_85.z = _4734;
    out.m_85.w = _4329;
    out.m_87.x = _4732;
    out.m_87.y = _4736;
    out.m_87.z = _4738;
    float _4750 = _4748;
    float _4752 = _4748;
    if (!_4570)
    {
        _4742 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4754 = _4742;
    float _4756 = _4754;
    float _4758 = _4754;
    if (!_4570)
    {
        _4744 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4760 = _4744;
    out.gl_Position.x = _4363;
    out.gl_Position.y = _4365;
    out.gl_Position.z = _4718;
    out.gl_Position.w = _4329;
    float _4762 = _4760;
    float _4764 = _4760;
    if (!_4570)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4766 = _4486;
    float _4768 = _4766;
    float _4770 = _4766;
    if (!_4570)
    {
        _4746 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4772 = _4746;
    float _4774 = -_4371;
    float _4776 = _4774 + 1.0;
    float _4778 = _4776 * _4730;
    float _4780 = precise::clamp(_4778, 0.0, 1.0);
    float _4782 = -_4780;
    float _4784 = fma(_4782, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4786 = _4784 * _4698;
    float _4788 = _4740 * _4389;
    float _4790 = -_4740;
    float _4792 = _4790 + 1.0;
    float _4794 = _4786 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4796 = _4404 * _4788;
    float _4798 = _4404 * _4792;
    out.m_89.x = _4794;
    float _4800 = _4414 * _4788;
    float _4802 = fma(_4410, _4796, _4398);
    float _4804 = fma(_4412, _4796, _4400);
    float _4806 = _4796;
    float _4808 = _4772;
    float _4810 = _4772;
    if (!_4570)
    {
        _4806 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4812 = _4806;
    float _4814 = fma(_4404, _4800, _4402);
    out.m_91.x = _4802;
    out.m_91.y = _4804;
    out.m_91.z = _4814;
    out.m_91.w = _4798;
    bool _4816 = !_4570;
    float _4818 = _4812;
    float _4820 = _4812;
    if (!_4816)
    {
        bool _4822 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4824 = isnan(_4079);
        bool _4826 = _4822 || _4824;
        bool _4828 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4830 = _4826 || _4828;
        if (!_4830)
        {
            float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4834 = _4079 + _4832;
            float _4836 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4838 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4836;
            float _4840 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4842 = _4840 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4844 = 1.0 / _4838;
            float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4854 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4856 = _4854 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4860 = _4858 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4862 = _4834 * _4844;
            float _4864 = precise::clamp(_4862, 0.0, 1.0);
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4870 = fma(_4864, _4842, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4872 = fma(_4864, _4868, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4874 = fma(_4864, _4848, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4876 = fma(_4864, _4852, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4878 = fma(_4864, _4856, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4880 = fma(_4864, _4860, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4810 = _4874;
            _4764 = _4878;
            _4770 = _4870;
            _4758 = _4876;
            _4752 = _4872;
            _4820 = _4880;
            _4882 = true;
        }
        else
        {
            bool _4884 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4886 = isnan(_4079);
            bool _4888 = _4884 || _4886;
            bool _4890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4892 = _4888 || _4890;
            if (!_4892)
            {
                _4768 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4894 = _4768;
            _4770 = _4894;
            if (!_4892)
            {
                _4808 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4896 = _4808;
            _4810 = _4896;
            if (!_4892)
            {
                _4750 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4898 = _4750;
            _4752 = _4898;
            if (!_4892)
            {
                _4756 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4900 = _4756;
            _4758 = _4900;
            if (!_4892)
            {
                _4762 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4902 = _4762;
            _4764 = _4902;
            if (!_4892)
            {
                _4818 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4904 = _4818;
            bool _4906 = !_4892;
            _4820 = _4904;
            if (!_4906)
            {
                bool _4908 = _4079 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4910 = isnan(_4079);
                bool _4912 = _4908 || _4910;
                bool _4914 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4916 = _4912 || _4914;
                if (!_4916)
                {
                    float _4918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4920 = _4079 + _4918;
                    float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4924 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4922;
                    float _4926 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4928 = _4926 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4930 = 1.0 / _4924;
                    float _4932 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4934 = _4932 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4936 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4938 = _4936 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4940 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4942 = _4940 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4944 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4946 = _4944 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4948 = _4920 * _4930;
                    float _4950 = precise::clamp(_4948, 0.0, 1.0);
                    float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4954 = _4952 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4956 = fma(_4950, _4928, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4958 = fma(_4950, _4954, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4960 = fma(_4950, _4934, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4962 = fma(_4950, _4938, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4964 = fma(_4950, _4942, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4966 = fma(_4950, _4946, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4810 = _4960;
                    _4764 = _4964;
                    _4770 = _4956;
                    _4758 = _4962;
                    _4752 = _4958;
                    _4820 = _4966;
                    _4882 = true;
                }
                else
                {
                    _4810 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4764 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4770 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4758 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4752 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4820 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4882 = false;
    float _4968 = _4810;
    float _4970 = _4764;
    float _4972 = _4770;
    float _4974 = _4758;
    float _4976 = _4752;
    float _4978 = _4820;
    float _4980 = fma(_4736, -0.5, 0.5);
    float _4982 = precise::clamp(_4980, 0.0, 1.0);
    float _4984 = -_4968;
    float _4986 = _4984 + _4970;
    float _4988 = -_4972;
    float _4990 = _4988 + _4974;
    float _4992 = -_4976;
    float _4994 = _4992 + _4978;
    bool _4996 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4998 = fma(_4982, _4986, _4968);
    float _5000 = fma(_4982, _4990, _4972);
    float _5002 = fma(_4982, _4994, _4976);
    float _5004 = _4998 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _5006 = fma(_5000, 0.298911988735198974609375, _5004);
    float _5008 = fma(_5002, 0.114477999508380889892578125, _5006);
    out.m_93.x = 0.0;
    float _5010 = -_5008;
    float _5012 = _5000 + _5010;
    float _5014 = -_5008;
    float _5016 = _4998 + _5014;
    float _5018 = -_5008;
    float _5020 = _5002 + _5018;
    float _5022 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5024 = fma(_5012, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    float _5026 = fma(_5016, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    float _5028 = fma(_5020, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5008);
    out.m_89.w = _5022;
    out.m_95.x = _5024;
    out.m_95.y = _5026;
    out.m_95.z = _5028;
    if (!_4996)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5030 = -_4051;
    float _5032 = _5030 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5034 = -_4053;
    float _5036 = _5034 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5038 = -_4055;
    float _5040 = _5038 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5042 = _5032 * _5032;
    float _5044 = fma(_5036, _5036, _5042);
    float _5046 = fma(_5040, _5040, _5044);
    float _5048 = sqrt(_5046);
    float _5050 = rsqrt(_5046);
    float _5052 = -_5048;
    float _5054 = _5052 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5056 = _5054 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5058 = precise::clamp(_5056, 0.0, 1.0);
    float _5060 = _5036 * _5050;
    float _5062 = _5032 * _5050;
    float _5064 = abs(_5058);
    float _5066 = log2(_5064);
    float _5068 = _5040 * _5050;
    float _5070 = _5060 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5072 = _4736 * _5062;
    float _5074 = -_5062;
    float _5076 = -_5070;
    float _5078 = fma(_5074, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5076);
    float _5080 = fma(_4732, _5060, _5072);
    float _5082 = -_5068;
    float _5084 = fma(_5082, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5078);
    float _5086 = fma(_4738, _5068, _5080);
    float _5088 = precise::clamp(_5086, 0.0, 1.0);
    float _5090 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5092 = _5084 + _5090;
    float _5094 = _5066 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5096 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5098 = precise::clamp(_5096, 0.0, 1.0);
    float _5100 = exp2(_5094);
    float _5102 = _5100 * _5098;
    float _5104 = _5088 * _5102;
    float _5106 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5108 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5110 = _5104 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _5106;
    out.m_93.y = _5108;
    out.m_93.z = _5110;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

