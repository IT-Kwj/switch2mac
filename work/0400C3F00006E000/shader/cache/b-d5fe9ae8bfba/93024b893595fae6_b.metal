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
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4788 = false;
    bool _634 = false;
    bool _518 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5073 = as_type<float>(_126);
        out.gl_Position.z = _5073;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5142 = as_type<float>(_164);
        out.gl_Position.z = _5142;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = 1.0 / _204;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _220;
    float _224 = 1.0 / _212;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _196 + _226;
    float _230 = 1.0 / _208;
    float _232 = _228 * _218;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _196 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = fma(_240, _232, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _246 = 1.0 / _216;
    float _248 = _236 * _224;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _196 + _262;
    bool _266 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _268 = isnan(_196);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = 1.0 / _222;
    float _280 = _200 * _230;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = _196 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _286;
    bool _290 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _292 = isnan(_196);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = fma(_288, _232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = _264 * _246;
    float _310 = -_260;
    float _312 = _310 + 1.0;
    bool _314 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_196);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _276 * _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = _300 * _304;
    float _334 = _284 * _278;
    bool _336 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_196);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = fma(_330, _232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = -_324;
    float _352 = _350 + 1.0;
    bool _354 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _356 = isnan(_196);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_300;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = _346 * _352;
    float _376 = -_346;
    float _378 = _376 + 1.0;
    float _380 = _324 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _364 * _378;
    float _392 = -_364;
    float _394 = _392 + 1.0;
    float _396 = fma(_372, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = _306 * _390;
    float _402 = _348 * _390;
    float _404 = _244 * _390;
    float _406 = fma(_388, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _408;
    float _412 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _426;
    float _430 = fma(_410, _248, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_396, _374, _412);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _434;
    float _438 = fma(_424, _308, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _440 = fma(_428, _248, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_398, _374, _414);
    float _444 = fma(_430, _380, _432);
    float _446 = fma(_436, _248, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _448 = fma(_406, _374, _416);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_440, _380, _442);
    float _456 = fma(_446, _380, _448);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = fma(_420, _308, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _468 = fma(_452, _308, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _470;
    float _474 = fma(_460, _334, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _476 = fma(_464, _334, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _478 = fma(_466, _332, _444);
    float _480 = fma(_472, _334, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _482 = fma(_438, _332, _454);
    float _484 = fma(_468, _332, _456);
    float _486 = fma(_474, _326, _478);
    float _488 = fma(_476, _326, _482);
    float _490 = fma(_480, _326, _484);
    float _492 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].x, _486);
    float _494 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].y, _488);
    float _496 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].z, _490);
    bool _498 = !_242;
    float _516;
    if (!_498)
    {
        float _500 = in.m_53.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_110);
        float _522 = 1.0 / _520;
        float _524 = _144 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_55.x;
    float _530 = in.m_55.y;
    float _532 = in.m_55.z;
    bool _534 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _536 = isnan(_526);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_526);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _526 + _566;
    float _570 = -_544;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _548;
    float _578 = _560 * _572;
    float _580 = -_560;
    float _582 = _580 + 1.0;
    float _584 = _496 * _532;
    float _586 = _494 * _530;
    float _588 = _564 * _576;
    float _590 = _492 * _528;
    float _592 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = _592 * _578;
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[116].x, _596);
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _606;
    out.m_57.y = _608;
    out.m_57.z = _610;
    out.m_57.w = _612;
    bool _614 = !_574;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_110);
        float _638 = 1.0 / _636;
        float _640 = _144 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _646 = int(_644);
    float _648 = in.m_53.x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _642 + _650;
    float _654 = in.m_53.y;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _662 = int(_660);
    float _664 = in.m_59.x;
    float _666 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _668 = in.m_53.w;
    float _670 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _666);
    float _672 = float(_646);
    float _674 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _676 = int(_674);
    float _678 = in.m_53.z;
    float _680 = in.m_59.y;
    float _682 = 1.0 / _672;
    float _684 = float(_662);
    float _686 = _648 + _654;
    bool _688 = _654 > 0.5;
    float _690 = float(uint(_676));
    float _692 = 1.0 / _684;
    int _694 = ~_676;
    int _696 = _694 + 1;
    bool _698 = _668 > 0.5;
    float _700 = _668;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_658)
    {
        _700 = _648;
    }
    float _704 = _700;
    float _706 = _682 * _144;
    float _708 = 1.0 / _690;
    float _710 = _704;
    float _712 = _680;
    if (!_658)
    {
        _710 = _678;
    }
    float _714 = _710;
    int _716 = ~_676;
    int _718 = _716 + 1;
    float _720 = trunc(_706);
    int _722 = int(_720);
    float _724 = _692 * _144;
    float _726 = _692;
    if (_658)
    {
        _726 = _648;
    }
    float _728 = _726;
    float _730 = _728;
    if (!_658)
    {
        _730 = _654;
    }
    float _732 = _730;
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _736 = int(_734);
    int _738 = as_type<int>(_708) + (-2);
    float _740 = _708;
    if (_658)
    {
        _740 = 1.0;
    }
    float _742 = _740;
    float _744 = _742;
    if (!_658)
    {
        _744 = 1.2345600128173828125;
    }
    float _746 = _744;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _750 = int(_748);
    float _752 = float(uint(_722));
    float _754 = _732 * _746;
    float _756 = as_type<float>(_738) * _752;
    float _758 = float(uint(_736));
    float _760 = trunc(_724);
    int _762 = int(_760);
    int _764 = ~_736;
    int _766 = _764 + 1;
    float _768 = float(_750);
    float _770 = 1.0 / _758;
    float _772 = trunc(_756);
    float _774 = precise::max(_772, 0.0);
    uint _777 = uint(_774);
    float _779 = float(uint(_762));
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _787 = _785 != 0;
    float _789 = 1.0 / _768;
    int _791 = as_type<int>(_770) + (-2);
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _795 = _793 != 0;
    int _797 = _696 * int(_777);
    int _799 = _797 + _722;
    float _801 = _768;
    float _803 = _752;
    float _805 = _770;
    bool _807 = _795;
    if (_658)
    {
        _801 = 1.0;
    }
    float _809 = _801;
    float _811 = as_type<float>(_791) * _779;
    float _813 = _809;
    if (!_658)
    {
        _813 = 7.345489978790283203125;
    }
    float _815 = _813;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _819 = int(_817);
    float _821 = _815;
    if (!_783)
    {
        _803 = _664;
    }
    float _823 = _803;
    float _825 = _815 * _648;
    float _827 = _823;
    if (_658)
    {
        _821 = 1.0;
    }
    float _829 = _821;
    float _831 = _789 * _144;
    float _833 = _829;
    if (!_783)
    {
        _805 = _823;
    }
    float _835 = _805;
    float _837 = trunc(_811);
    float _839 = precise::max(_837, 0.0);
    uint _841 = uint(_839);
    float _843 = _835;
    if (!_658)
    {
        _833 = 5.839270114898681640625;
    }
    float _845 = _833;
    if (_783)
    {
        _827 = _664;
    }
    float _847 = _827;
    float _849 = float(uint(_799));
    float _851 = _714 * _845;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _855 = _853 != 0;
    float _857 = floor(_825);
    float _859 = float(uint(_819));
    float _861 = as_type<float>(_738) * _849;
    float _863 = -_680;
    float _865 = _863 + 1.0;
    int _867 = ~_819;
    int _869 = _867 + 1;
    float _871 = trunc(_861);
    float _873 = precise::max(_871, 0.0);
    uint _875 = uint(_873);
    int _877 = _766 * int(_841);
    int _879 = _877 + _762;
    int _881 = _688 ? as_type<int>(_865) : as_type<int>(_680);
    int _883 = _698 ? as_type<int>(_865) : as_type<int>(_680);
    float _885 = float(uint(_879));
    float _887 = -_857;
    float _889 = _825 + _887;
    float _891 = float(_676);
    float _893 = floor(_851);
    float _895 = _787 ? as_type<float>(_881) : _680;
    float _897 = _795 ? as_type<float>(_883) : _680;
    float _899 = _889 * _891;
    float _901 = as_type<float>(_791) * _885;
    int _903 = int(_777) + int(_875);
    int _905 = as_type<int>(_889);
    float _907 = _847;
    float _909 = as_type<float>(_869);
    if (_783)
    {
        float _911 = -_847;
        float _913 = _911 + 1.0;
        _905 = as_type<int>(_913);
    }
    int _915 = _905;
    float _917 = float(_722);
    float _919 = 1.0 / _859;
    bool _921 = _678 > 0.5;
    int _923 = _718 * _903;
    int _925 = _923 + _722;
    float _927 = as_type<float>(_915);
    if (_783)
    {
        bool _929 = _648 > 0.5;
        _807 = _929;
    }
    bool _931 = _807;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _935 = _933 != 0;
    bool _937 = _917 >= _891;
    bool _939 = isnan(_917);
    bool _941 = _937 || _939;
    bool _943 = isnan(_891);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = trunc(_831);
    int _951 = int(_949);
    if (_855)
    {
        float _953 = _921 ? _865 : _680;
        _712 = _953;
    }
    float _955 = _712;
    if (_783)
    {
        float _957 = _931 ? as_type<float>(_915) : _847;
        _843 = _957;
    }
    float _959 = _843;
    bool _961 = !_935;
    int _963 = _961 ? 0 : 1;
    bool _965 = uint(_925) >= uint(_676);
    float _967 = trunc(_901);
    float _969 = precise::max(_967, 0.0);
    uint _971 = uint(_969);
    int _973 = abs(_963);
    float _975 = -_893;
    float _977 = _851 + _975;
    bool _979 = !_965;
    int _981 = _979 ? 0 : (-1);
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _985 = _983 != 0;
    int _987 = ~_903;
    int _989 = _987 + _981;
    int _991 = _989 + 1;
    float _993 = trunc(_899);
    int _995 = int(_993);
    float _997 = float(_110);
    int _999 = as_type<int>(_919) + (-2);
    int _1001 = _676 * _991;
    int _1003 = _1001 + _722;
    float _1005 = float(uint(_951));
    bool _1007 = _676 == 0;
    float _1009 = trunc(_947);
    int _1011 = int(_1009);
    int _1013 = int(_841) + int(_971);
    float _1015 = as_type<float>(_999) * _1005;
    int _1017 = ~_736;
    int _1019 = _1017 + 1;
    int _1021 = 0;
    if (_985)
    {
        float _1023 = -_847;
        float _1025 = _1023 + 1.0;
        _1021 = as_type<int>(_1025);
    }
    int _1027 = _1021;
    bool _1029 = !_1007;
    int _1031 = _1029 ? _1003 : (-1);
    if (!_985)
    {
        _927 = _847;
    }
    float _1033 = _927;
    float _1035 = floor(_754);
    int _1037 = _995 * _973;
    int _1039 = _1037 + _722;
    int _1041 = _1019 * _1013;
    int _1043 = _1041 + _762;
    float _1045 = _1033;
    if (_985)
    {
        float _1047 = _921 ? as_type<float>(_1027) : _847;
        _1045 = _1047;
    }
    float _1049 = _1045;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1053 = _1051 != 0;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1061 = _1059 != 0;
    int _1063 = ~_1011;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    float _1069 = 1.0 / _997;
    bool _1071 = uint(_1043) >= uint(_736);
    float _1073 = float(_762);
    int _1075 = _1031 * _1067;
    bool _1077 = !_1057;
    int _1079 = _1077 ? 0 : 1;
    float _1081 = -_1035;
    float _1083 = _754 + _1081;
    int _1085 = _676 + (-1);
    float _1087 = trunc(_1015);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = float(_736);
    int _1095 = abs(_1079);
    int _1097 = _1011 * _1085;
    int _1099 = _1097 + _1075;
    bool _1101 = !_1071;
    int _1103 = _1101 ? 0 : (-1);
    float _1105 = _1093 * _1083;
    bool _1107 = _1073 >= _1093;
    bool _1109 = isnan(_1073);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(_1093);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    int _1119 = ~_1013;
    int _1121 = _1119 + _1103;
    int _1123 = _1121 + 1;
    float _1125 = _891 * _144;
    float _1127 = trunc(_1117);
    int _1129 = int(_1127);
    int _1131 = ~_819;
    int _1133 = _1131 + 1;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1137 = _1135 != 0;
    int _1139 = _736 * _1123;
    int _1141 = _1139 + _762;
    int _1143 = _1099 * _1095;
    bool _1145 = !_1137;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = trunc(_1105);
    int _1151 = int(_1149);
    float _1153 = _1125 * _1069;
    int _1155 = _1133 * int(_1091);
    int _1157 = _1155 + _951;
    bool _1159 = !_1053;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1061;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = float(uint(_1157));
    float _1169 = trunc(_1153);
    int _1171 = int(_1169);
    int _1173 = abs(_1147);
    int _1175 = abs(_1161);
    float _1177 = as_type<float>(_999) * _1167;
    int _1179 = abs(_1165);
    bool _1181 = _736 == 0;
    int _1183 = _1151 * _1173;
    int _1185 = _1183 + _762;
    float _1187 = trunc(_1177);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1195 = _1193 != 0;
    int _1197 = ~_1129;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    bool _1203 = !_1181;
    int _1205 = _1203 ? _1141 : (-1);
    int _1207 = _1171 * _1175;
    int _1209 = _1207 + _1143;
    bool _1211 = !_1195;
    int _1213 = _1211 ? 0 : 1;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1217 = _1215 != 0;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1221 = _1219 != 0;
    int _1223 = _1039 * _1179;
    int _1225 = _1223 + _1209;
    float _1227 = _1069 * _144;
    int _1229 = _1201 * _1205;
    int _1231 = _736 + (-1);
    int _1233 = abs(_1213);
    float _1235 = _1093 * _1227;
    int _1237 = int(_1091) + int(_1191);
    int _1239 = _1129 * _1231;
    int _1241 = _1239 + _1229;
    bool _1243 = !_1221;
    int _1245 = _1243 ? 0 : 1;
    int _1247 = _995 * _1233;
    int _1249 = _1247 + _1225;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1235);
    int _1261 = int(_1259);
    int _1263 = abs(_1245);
    float _1265 = float(uint(_1249));
    int _1267 = ~_819;
    int _1269 = _1267 + 1;
    int _1271 = _1241 * _1263;
    bool _1273 = !_1217;
    int _1275 = _1273 ? 0 : 1;
    float _1277 = as_type<float>(_738) * _1265;
    float _1279 = float(_819);
    int _1281 = _1269 * _1237;
    int _1283 = _1281 + _951;
    float _1285 = float(_951);
    int _1287 = abs(_1275);
    float _1289 = trunc(_1277);
    float _1291 = precise::max(_1289, 0.0);
    uint _1293 = uint(_1291);
    bool _1295 = !_1253;
    int _1297 = _1295 ? 0 : 1;
    bool _1299 = _1285 >= _1279;
    bool _1301 = isnan(_1285);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(_1279);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    int _1311 = _1261 * _1287;
    int _1313 = _1311 + _1271;
    int _1315 = abs(_1297);
    bool _1317 = uint(_1283) >= uint(_819);
    float _1319 = _1279 * _1227;
    float _1321 = trunc(_1309);
    int _1323 = int(_1321);
    float _1325 = _1279 * _977;
    bool _1327 = !_1317;
    int _1329 = _1327 ? 0 : (-1);
    int _1331 = ~_676;
    int _1333 = _1331 + 1;
    int _1335 = ~_1237;
    int _1337 = _1335 + _1329;
    int _1339 = _1337 + 1;
    int _1341 = _1185 * _1315;
    int _1343 = _1341 + _1313;
    bool _1345 = !_1257;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = trunc(_1319);
    int _1351 = int(_1349);
    int _1353 = _819 * _1339;
    int _1355 = _1353 + _951;
    bool _1357 = _819 == 0;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1361 = _1359 != 0;
    int _1363 = abs(_1347);
    int _1365 = _1333 * int(_1293);
    int _1367 = _1365 + _1249;
    int _1369 = ~_1323;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    bool _1375 = !_1357;
    int _1377 = _1375 ? _1355 : (-1);
    int _1379 = _1151 * _1363;
    int _1381 = _1379 + _1343;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1385 = _1383 != 0;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1389 = _1387 != 0;
    float _1391 = float(uint(_1367));
    int _1393 = _1373 * _1377;
    int _1395 = _819 + (-1);
    float _1397 = trunc(_1325);
    int _1399 = int(_1397);
    bool _1401 = !_1361;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = as_type<float>(_738) * _1391;
    bool _1407 = !_1389;
    int _1409 = _1407 ? 0 : 1;
    int _1411 = _1323 * _1395;
    int _1413 = _1411 + _1393;
    int _1415 = abs(_1403);
    int _1417 = abs(_1409);
    float _1419 = trunc(_1405);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    float _1425 = float(uint(_1381));
    int _1427 = _1413 * _1417;
    float _1429 = float(uint(_1039));
    float _1431 = as_type<float>(_791) * _1425;
    bool _1433 = !_1385;
    int _1435 = _1433 ? 0 : 1;
    int _1437 = _1399 * _1415;
    int _1439 = _1437 + _951;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1443 = _1441 != 0;
    float _1445 = trunc(_1431);
    float _1447 = precise::max(_1445, 0.0);
    uint _1449 = uint(_1447);
    float _1451 = as_type<float>(_738) * _1429;
    int _1453 = abs(_1435);
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1457 = _1455 != 0;
    float _1459 = trunc(_1451);
    float _1461 = precise::max(_1459, 0.0);
    uint _1463 = uint(_1461);
    int _1465 = ~_736;
    int _1467 = _1465 + 1;
    int _1469 = int(_1293) + int(_1423);
    int _1471 = _1351 * _1453;
    int _1473 = _1471 + _1427;
    bool _1475 = !_1443;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1481 = _1479 != 0;
    int _1483 = _1467 * int(_1449);
    int _1485 = _1483 + _1381;
    float _1487 = float(uint(_1185));
    int _1489 = int(_1423);
    if (_1457)
    {
        float _1491 = -_847;
        float _1493 = _1491 + 1.0;
        _1489 = as_type<int>(_1493);
    }
    int _1495 = _1489;
    int _1497 = abs(_1477);
    int _1499 = ~_676;
    int _1501 = _1499 + 1;
    float _1503 = as_type<float>(_791) * _1487;
    bool _1505 = !_1481;
    int _1507 = _1505 ? 0 : 1;
    int _1509 = _1439 * _1497;
    int _1511 = _1509 + _1473;
    float _1513 = float(uint(_1485));
    int _1515 = ~_676;
    int _1517 = _1515 + 1;
    float _1519 = trunc(_1503);
    float _1521 = precise::max(_1519, 0.0);
    uint _1523 = uint(_1521);
    int _1525 = abs(_1507);
    int _1527 = _1501 * int(_1463);
    int _1529 = _1527 + _1039;
    float _1531 = as_type<float>(_791) * _1513;
    int _1533 = _1517 * _1469;
    int _1535 = _1533 + _1249;
    float _1537 = float(uint(_1529));
    bool _1539 = uint(_1535) >= uint(_676);
    float _1541 = trunc(_1531);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    int _1547 = _1399 * _1525;
    int _1549 = _1547 + _1511;
    float _1551 = as_type<float>(_738) * _1537;
    int _1553 = ~_736;
    int _1555 = _1553 + 1;
    bool _1557 = !_1539;
    int _1559 = _1557 ? 0 : (-1);
    float _1561 = trunc(_1551);
    float _1563 = precise::max(_1561, 0.0);
    uint _1565 = uint(_1563);
    float _1567 = float(uint(_1549));
    int _1569 = ~_1469;
    int _1571 = _1569 + _1559;
    int _1573 = _1571 + 1;
    int _1575 = _1555 * int(_1523);
    int _1577 = _1575 + _1185;
    bool _1579 = _676 == 0;
    float _1581 = as_type<float>(_999) * _1567;
    int _1583 = ~_736;
    int _1585 = _1583 + 1;
    int _1587 = _676 * _1573;
    int _1589 = _1587 + _1249;
    bool _1591 = _654 > 0.5;
    float _1593 = float(uint(_1577));
    float _1595 = trunc(_1581);
    float _1597 = precise::max(_1595, 0.0);
    uint _1599 = uint(_1597);
    bool _1601 = !_1579;
    int _1603 = _1601 ? _1589 : (-1);
    int _1605 = int(_1449) + int(_1545);
    float _1607 = as_type<float>(_791) * _1593;
    if (_1457)
    {
        float _1609 = _1591 ? as_type<float>(_1495) : _847;
        _907 = _1609;
    }
    float _1611 = _907;
    int _1613 = _1603 & 3;
    bool _1615 = _1613 != 0;
    int _1617 = _1585 * _1605;
    int _1619 = _1617 + _1381;
    int _1621 = _1603 & 3;
    bool _1623 = _1621 != 0;
    int _1625 = _1615 ? 0 : 1;
    bool _1627 = uint(_1621) >= 2u;
    bool _1629 = uint(_1619) >= uint(_736);
    int _1631 = ~_819;
    int _1633 = _1631 + 1;
    int _1635 = _1627 ? 0 : 1;
    bool _1637 = uint(_1621) > 1u;
    int _1639 = _1633 * int(_1599);
    int _1641 = _1639 + _1549;
    bool _1643 = !_1629;
    int _1645 = _1643 ? 0 : (-1);
    int _1647 = int(_1463) + int(_1565);
    int _1649 = ~_676;
    int _1651 = _1649 + 1;
    float _1653 = trunc(_1607);
    float _1655 = precise::max(_1653, 0.0);
    uint _1657 = uint(_1655);
    int _1659 = ~_1605;
    int _1661 = _1659 + _1645;
    int _1663 = _1661 + 1;
    bool _1665 = _1621 != 3;
    int _1667 = _1651 * _1647;
    int _1669 = _1667 + _1039;
    float _1671 = float(uint(_1641));
    int _1673 = _736 * _1663;
    int _1675 = _1673 + _1381;
    int _1677 = ~_1625;
    int _1679 = _1677 + 1;
    int _1681 = _1679 + 1;
    int _1683 = _1681;
    if (!_1637)
    {
        int _1685 = ~_1625;
        int _1687 = _1685 + 1;
        _1683 = _1687;
    }
    int _1689 = _1683;
    float _1691 = as_type<float>(_999) * _1671;
    bool _1693 = uint(_1669) >= uint(_676);
    bool _1695 = !_1181;
    int _1697 = _1695 ? _1675 : (-1);
    float _1699 = trunc(_1691);
    float _1701 = precise::max(_1699, 0.0);
    uint _1703 = uint(_1701);
    int _1705 = ~_1635;
    int _1707 = _1705 + 1;
    int _1709 = _1707 + 1;
    bool _1711 = !_1693;
    int _1713 = _1711 ? 0 : (-1);
    int _1715 = _1709;
    if (_1665)
    {
        int _1717 = ~_1635;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    int _1723 = _1697 & 3;
    bool _1725 = _1723 != 0;
    float _1727 = in.m_46.x;
    float _1729 = in.m_46.y;
    float _1731 = in.m_46.z;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1735 = _1733 != 0;
    int _1737 = _1725 ? 0 : 1;
    bool _1739 = !_1735;
    int _1741 = _1739 ? 0 : 1;
    bool _1743 = uint(_1723) >= 2u;
    bool _1745 = _1723 != 3;
    int _1747 = _1743 ? 0 : 1;
    bool _1749 = uint(_1723) > 1u;
    int _1751 = int(_1523) + int(_1657);
    int _1753 = int(_1599) + int(_1703);
    int _1755 = ~_819;
    int _1757 = _1755 + 1;
    int _1759 = ~_1747;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (_1745)
    {
        int _1767 = ~_1747;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = _1757 * _1753;
    int _1775 = _1773 + _1549;
    float _1777 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1779 = ~_1737;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _1787 = _1783;
    if (!_1749)
    {
        int _1789 = ~_1737;
        int _1791 = _1789 + 1;
        _1787 = _1791;
    }
    int _1793 = _1787;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1797 = uint(_1775) >= uint(_819);
    float _1799 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1801 = ~_736;
    int _1803 = _1801 + 1;
    float _1805 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1785);
    float _1807 = fma(_1799, -2.0, _1795);
    float _1809 = float(uint(_1439));
    int _1811 = _1803 * _1751;
    int _1813 = _1811 + _1185;
    float _1815 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1805);
    bool _1817 = !_1797;
    int _1819 = _1817 ? 0 : (-1);
    float _1821 = as_type<float>(_999) * _1809;
    bool _1823 = uint(_1813) >= uint(_736);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1831 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1833 = !_1823;
    int _1835 = _1833 ? 0 : (-1);
    float _1837 = trunc(_1821);
    float _1839 = precise::max(_1837, 0.0);
    uint _1841 = uint(_1839);
    int _1843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1845 = _1843 != 0;
    float _1847 = -_1829;
    float _1849 = fma(_1831, 2.0, _1847);
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1853 = _1851 != 0;
    float _1855 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1857 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _1859 = ~_1647;
    int _1861 = _1859 + _1713;
    int _1863 = _1861 + 1;
    float _1865 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1777);
    float _1867 = 1.0 / _1827;
    int _1869 = ~_1753;
    int _1871 = _1869 + _1819;
    int _1873 = _1871 + 1;
    float _1875 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1855);
    float _1877 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1857);
    int _1879 = _676 * _1863;
    int _1881 = _1879 + _1039;
    int _1883 = ~_1751;
    int _1885 = _1883 + _1835;
    int _1887 = _1885 + 1;
    int _1889 = _819 * _1873;
    int _1891 = _1889 + _1549;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1895 = _1893 != 0;
    float _1897 = _686 + (-1.0);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1899;
    int _1903 = _869 * int(_1841);
    int _1905 = _1903 + _1439;
    bool _1907 = !_1357;
    int _1909 = _1907 ? _1891 : (-1);
    int _1911 = _736 * _1887;
    int _1913 = _1911 + _1185;
    bool _1915 = !_1845;
    int _1917 = _1915 ? 0 : 1;
    float _1919 = _648 * 2.0;
    float _1921 = _1901 * _1867;
    float _1923 = float(uint(_1905));
    float _1925 = _654 * 2.0;
    int _1927 = _1909 & 3;
    bool _1929 = _1927 != 0;
    float _1931 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1933 = as_type<float>(_999) * _1923;
    bool _1935 = !_1181;
    int _1937 = _1935 ? _1913 : (-1);
    float _1939 = floor(_1919);
    bool _1941 = _1927 != 3;
    float _1943 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _1945 = _1873;
    if (_1895)
    {
        _702 = 0;
    }
    int _1947 = _702;
    float _1949 = fma(_1921, _652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1951 = _1947;
    if (_1895)
    {
        _1945 = 0;
    }
    int _1953 = _1945;
    float _1955 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1943);
    int _1957 = _1953;
    if (!_1895)
    {
        _1951 = 1;
    }
    int _1959 = _1951;
    float _1961 = trunc(_1933);
    float _1963 = precise::max(_1961, 0.0);
    uint _1965 = uint(_1963);
    if (!_1895)
    {
        _1957 = 2;
    }
    int _1967 = _1957;
    float _1969 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1877);
    bool _1971 = uint(_1927) >= 2u;
    float _1973 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1875);
    bool _1975 = !_1579;
    int _1977 = _1975 ? _1881 : (-1);
    float _1979 = _1969 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    bool _1981 = uint(_1927) > 1u;
    float _1983 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1865);
    int _1985 = _1971 ? 0 : 1;
    float _1987 = -_144;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1849);
    int _1991 = int(_1357);
    int _1993 = _1853 ? 2 : 0;
    int _1995 = _1991 | _1993;
    int _1997 = _1623 ? 4 : 0;
    int _1999 = _1995 | _1997;
    int _2001 = _1929 ? 8 : 0;
    int _2003 = _1999 | _2001;
    int _2005 = _1971 ? 16 : 0;
    int _2007 = _2003 | _2005;
    int _2009 = _1981 ? 32 : 0;
    int _2011 = _2007 | _2009;
    int _2013 = _1941 ? 64 : 0;
    int _2015 = _2011 | _2013;
    int _2017 = _2015 & 32;
    float _2019 = _1983 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _2021 = ~_1985;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    int _2027 = _2025;
    float _2029 = as_type<float>(_2017);
    float _2031 = _1983;
    if (_1941)
    {
        int _2033 = ~_1985;
        int _2035 = _2033 + 1;
        _2027 = _2035;
    }
    int _2037 = _2027;
    bool _2039 = _2017 != 0;
    bool _2041 = !_1853;
    int _2043 = _2041 ? 0 : 1;
    bool _2045 = _1939 > 0.0;
    float _2047 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _2049 = _1939 >= 0.0;
    bool _2051 = isnan(_1939);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan(0.0);
    bool _2057 = _2053 || _2055;
    int _2059 = _1929 ? 0 : 1;
    float _2061 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2047);
    int _2063 = int(_1841) + int(_1965);
    int _2065 = ~_819;
    int _2067 = _2065 + 1;
    int _2069 = ~_2059;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    int _2075 = _2073;
    if (!_2039)
    {
        int _2077 = ~_2059;
        int _2079 = _2077 + 1;
        _2075 = _2079;
    }
    int _2081 = _2075;
    int _2083 = _2067 * _2063;
    int _2085 = _2083 + _1439;
    bool _2087 = _1959 != 1;
    int _2089 = _1909 & 3;
    bool _2091 = _2089 != 0;
    float _2093 = floor(_1925);
    bool _2095 = _1621 != 3;
    bool _2097 = !_2091;
    int _2099 = _2097 ? 0 : 1;
    bool _2101 = uint(_2085) >= uint(_819);
    float _2103 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _670);
    float _2105 = _678 * 2.0;
    bool _2107 = !_1623;
    int _2109 = _2107 ? 0 : 1;
    float _2111 = floor(_2105);
    int _2113 = _1697 & 3;
    bool _2115 = _2113 != 0;
    float _2117 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1955);
    bool _2119 = !_2101;
    int _2121 = _2119 ? 0 : (-1);
    int _2123 = _2057 ? 0 : 1;
    float _2125 = (*spvDescriptorSet0.vp_c10)._m0[18].z;
    if (!_2087)
    {
        _2029 = _654;
    }
    float _2127 = _2029;
    float _2129 = sqrt(_2103);
    bool _2131 = !_2115;
    int _2133 = _2131 ? 0 : 1;
    bool _2135 = !_2095;
    int _2137 = _2135 ? 0 : (-1);
    bool _2139 = _1723 != 3;
    bool _2141 = _1927 != 3;
    bool _2143 = _2093 > 0.0;
    bool _2145 = _2093 >= 0.0;
    bool _2147 = isnan(_2093);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2093;
    float _2157 = _2127;
    if (!_2087)
    {
        _2125 = _678;
    }
    float _2159 = _2125;
    float _2161 = _2159;
    if (!_2087)
    {
        _909 = _2127;
    }
    float _2163 = _909;
    float _2165 = _2163;
    if (!_2087)
    {
        _2155 = _678;
    }
    float _2167 = _2155;
    float _2169 = _2167;
    if (_2087)
    {
        _2165 = _648;
    }
    float _2171 = _2165;
    if (_2087)
    {
        _2157 = _648;
    }
    float _2173 = _2157;
    if (_2087)
    {
        _2161 = _654;
    }
    float _2175 = _2161;
    float _2177 = _2171 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2087)
    {
        _2169 = _654;
    }
    float _2179 = _2169;
    bool _2181 = !_2139;
    int _2183 = _2181 ? 0 : (-1);
    bool _2185 = !_2141;
    int _2187 = _2185 ? 0 : (-1);
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2191 = _2189 != 0;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2195 = _2193 != 0;
    int _2197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2199 = _2197 != 0;
    int _2201 = ~_2123;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = sqrt(_2117);
    int _2209 = _2205;
    if (!_2045)
    {
        int _2211 = ~_2123;
        int _2213 = _2211 + 1;
        _2209 = _2213;
    }
    int _2215 = _2209;
    float _2217 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2061);
    bool _2219 = !_2195;
    int _2221 = _2219 ? 0 : 1;
    bool _2223 = _2111 > 0.0;
    bool _2225 = _2111 >= 0.0;
    bool _2227 = isnan(_2111);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(0.0);
    bool _2233 = _2229 || _2231;
    bool _2235 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2237 = isnan(_642);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    bool _2247 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2249 = isnan(_642);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    int _2259 = _2233 ? 0 : 1;
    float _2261 = -_2245;
    float _2263 = _2261 + 1.0;
    bool _2265 = _1967 != 2;
    float _2267 = _2207 * _1979;
    float _2269 = _2257 * _2263;
    float _2271 = -_2257;
    float _2273 = _2271 + 1.0;
    float _2275 = sqrt(_2217);
    int _2277 = abs(_2221);
    float _2279 = _1949 * _2269;
    float _2281 = _1973 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2283 = _1909 >> 31;
    float _2285 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2287 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2279);
    float _2289 = _2129 * _2281;
    int _2291 = ~_2259;
    int _2293 = _2291 + 1;
    int _2295 = _2293 + 1;
    float _2297 = fma(_2173, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2285);
    int _2299 = _2295;
    if (!_2223)
    {
        int _2301 = ~_2259;
        int _2303 = _2301 + 1;
        _2299 = _2303;
    }
    int _2305 = _2299;
    float _2307 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_2265)
    {
        _2031 = _648;
    }
    float _2309 = _2031;
    float _2311 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2287);
    float _2313 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2307);
    float _2315 = _2309;
    if (!_2265)
    {
        _2315 = _678;
    }
    float _2317 = _2315;
    float _2319 = _2275 * _2019;
    float _2321 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2325 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2313);
    int _2331 = _1603 >> 31;
    float _2333 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2321);
    float _2335 = -_2323;
    float _2337 = fma(_2327, 2.0, _2335);
    int _2339 = _1697 >> 31;
    float _2341 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    int _2343 = _2331 & 3;
    float _2345 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2333);
    int _2347 = _2339 & 3;
    float _2349 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2341);
    int _2351 = _1603 + _2343;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2355 = _1697 + _2347;
    float _2357 = -_144;
    float _2359 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2337);
    int _2361 = _2351 >> 2;
    int _2363 = _2283 & 3;
    int _2365 = _2355 >> 2;
    int _2367 = _2361 << 4;
    int _2369 = _2367 + 368;
    int _2371 = _1909 + _2363;
    int _2373 = _2365 << 4;
    int _2375 = _2373 + 512;
    uint _2377 = uint(int(uint(_2369) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    int _2393 = _2371 >> 2;
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    uint _2397 = uint(int(uint(_2375) >> uint(2)));
    uint _2399 = uint(int(uint(int(_2397)) >> uint(2)));
    int _2401 = int(_2397) & 3;
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[int(_2399)][_2401];
    int _2405 = int(_2397) + 1;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    int _2409 = _2405 & 3;
    float _2411 = (*spvDescriptorSet0.vp_c9)._m0[int(_2407)][_2409];
    int _2413 = _2393 << 4;
    int _2415 = _2413 + 656;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2419 = abs(_1689);
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2423 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2427 = uint(int(uint(_2415) >> uint(2)));
    uint _2429 = uint(int(uint(int(_2427)) >> uint(2)));
    int _2431 = int(_2427) & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = int(_2427) + 1;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    int _2439 = _2435 & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    float _2443 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2445 = _2311 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2451 = _1815 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _2453 = float(_2215);
    out.m_61.x = _2423;
    out.m_61.y = _2443;
    out.m_61.z = _2425;
    out.m_61.w = _2445;
    float _2455 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2447);
    float _2457 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2329);
    int _2459 = _2369 + 8;
    uint _2461 = uint(int(uint(_2459) >> uint(2)));
    uint _2463 = uint(int(uint(int(_2461)) >> uint(2)));
    int _2465 = int(_2461) & 3;
    float _2467 = (*spvDescriptorSet0.vp_c9)._m0[int(_2463)][_2465];
    int _2469 = int(_2461) + 1;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    int _2473 = _2469 & 3;
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[int(_2471)][_2473];
    int _2477 = ~_2063;
    int _2479 = _2477 + _2121;
    int _2481 = _2479 + 1;
    float _2483 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2455);
    int _2485 = abs(_1793);
    int _2487 = ~_2419;
    int _2489 = _2487 + 1;
    int _2491 = _2489 + 1;
    int _2493 = _819 * _2481;
    int _2495 = _2493 + _1439;
    int _2497 = ~_2485;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2505 = int(_2503);
    int _2507 = abs(_2099);
    int _2509 = _2375 + 8;
    uint _2511 = uint(int(uint(_2509) >> uint(2)));
    uint _2513 = uint(int(uint(int(_2511)) >> uint(2)));
    int _2515 = int(_2511) & 3;
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[int(_2513)][_2515];
    int _2519 = int(_2511) + 1;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    int _2523 = _2519 & 3;
    float _2525 = (*spvDescriptorSet0.vp_c9)._m0[int(_2521)][_2523];
    float _2527 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2529 = float(_2277);
    float _2531 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2349);
    int _2533 = abs(_1721);
    float _2535 = fma(_2527, -2.0, _2353);
    int _2537 = abs(_2187);
    float _2539 = _2529 * _2453;
    int _2541 = abs(_2081);
    int _2543 = _2415 + 8;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    uint _2547 = uint(int(uint(int(_2545)) >> uint(2)));
    int _2549 = int(_2545) & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    int _2553 = int(_2545) + 1;
    uint _2555 = uint(int(uint(_2553) >> uint(2)));
    int _2557 = _2553 & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = ~_2533;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2491 * as_type<int>(_2391);
    int _2569 = abs(_2109);
    float _2571 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2573 = int(_2571);
    int _2575 = ~_2541;
    int _2577 = _2575 + 1;
    int _2579 = _2577 + 1;
    float _2581 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2345);
    int _2583 = ~_2569;
    int _2585 = _2583 + 1;
    int _2587 = _2585 + 1;
    float _2589 = -_2449;
    float _2591 = fma(_2177, 2.0, _2589);
    int _2593 = abs(_1771);
    int _2595 = _2501 * as_type<int>(_2411);
    int _2597 = abs(_2133);
    int _2599 = _2587 * as_type<int>(_2383);
    int _2601 = _2599 + _2567;
    int _2603 = ~_2507;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    float _2609 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2611 = int(_2609);
    int _2613 = ~_2597;
    int _2615 = _2613 + 1;
    int _2617 = _2615 + 1;
    float _2619 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2535);
    int _2621 = _2579 * as_type<int>(_2441);
    bool _2623 = !_1357;
    int _2625 = _2623 ? _2495 : (-1);
    int _2627 = _2617 * as_type<int>(_2403);
    int _2629 = _2627 + _2595;
    int _2631 = ~_2593;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    int _2637 = _2607 * as_type<int>(_2433);
    int _2639 = _2637 + _2621;
    int _2641 = abs(_2037);
    float _2643 = float(uint(_2505));
    int _2645 = ~_2641;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2565 * as_type<int>(_2467);
    int _2653 = _2651 + _2601;
    int _2655 = abs(_1741);
    int _2657 = abs(_2183);
    float _2659 = 1.0 / _2643;
    int _2661 = abs(_1917);
    int _2663 = abs(_2043);
    float _2665 = float(uint(_2611));
    int _2667 = _2635 * as_type<int>(_2517);
    int _2669 = _2667 + _2629;
    int _2671 = abs(_2137);
    float _2673 = float(uint(_2573));
    float _2675 = 1.0 / _2665;
    int _2677 = ~_2671;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2649 * as_type<int>(_2551);
    int _2685 = _2683 + _2639;
    int _2687 = _2681 * as_type<int>(_2475);
    int _2689 = _2687 + _2653;
    int _2691 = ~_2657;
    int _2693 = _2691 + 1;
    int _2695 = _2693 + 1;
    float _2697 = 1.0 / _2673;
    int _2699 = ~_2655;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    int _2705 = abs(_2505);
    int _2707 = _2695 * as_type<int>(_2525);
    int _2709 = _2707 + _2669;
    int _2711 = abs(_2573);
    int _2713 = _2689 * _2703;
    int _2715 = ~_2661;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    int _2721 = _1977 * _2655;
    int _2723 = _2721 + _2713;
    int _2725 = _2719 * _2709;
    int _2727 = ~_2537;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    float _2733 = float(uint(_2705));
    int _2735 = _1937 * _2661;
    int _2737 = _2735 + _2725;
    float _2739 = float(uint(_2711));
    int _2741 = _2731 * as_type<int>(_2559);
    int _2743 = _2741 + _2685;
    int _2745 = as_type<int>(_2659) + (-2);
    float _2747 = float(uint(_2723));
    float _2749 = 1.0 / _2733;
    int _2751 = ~_2663;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = abs(_2611);
    float _2759 = as_type<float>(_2745) * _2747;
    int _2761 = as_type<int>(_2697) + (-2);
    int _2763 = _2755 * _2743;
    float _2765 = float(uint(_2757));
    float _2767 = 1.0 / _2739;
    float _2769 = float(uint(_2737));
    int _2771 = _2625 * _2663;
    int _2773 = _2771 + _2763;
    int _2775 = ~_2505;
    int _2777 = _2775 + 1;
    int _2779 = ~_2573;
    int _2781 = _2779 + 1;
    float _2783 = as_type<float>(_2761) * _2769;
    float _2785 = trunc(_2759);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    int _2791 = as_type<int>(_2675) + (-2);
    float _2793 = float(uint(_2773));
    int _2795 = abs(_2723);
    float _2797 = 1.0 / _2765;
    int _2799 = as_type<int>(_2749) + (-2);
    float _2801 = as_type<float>(_2791) * _2793;
    int _2803 = as_type<int>(_2767) + (-2);
    float _2805 = float(uint(_2795));
    bool _2807 = !_2191;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = trunc(_2783);
    float _2813 = precise::max(_2811, 0.0);
    uint _2815 = uint(_2813);
    int _2817 = abs(_2737);
    float _2819 = as_type<float>(_2799) * _2805;
    int _2821 = abs(_2773);
    int _2823 = abs(_2809);
    int _2825 = _2777 * int(_2789);
    int _2827 = _2825 + _2723;
    float _2829 = float(uint(_2817));
    float _2831 = trunc(_2801);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = as_type<int>(_2797) + (-2);
    float _2839 = float(uint(_2821));
    float _2841 = as_type<float>(_2803) * _2829;
    float _2843 = float(uint(_2827));
    float _2845 = _2531 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2847 = float(_2305);
    float _2849 = as_type<float>(_2837) * _2839;
    int _2851 = _2781 * int(_2815);
    int _2853 = _2851 + _2737;
    float _2855 = trunc(_2819);
    float _2857 = precise::max(_2855, 0.0);
    uint _2859 = uint(_2857);
    float _2861 = float(_2823);
    float _2863 = as_type<float>(_2745) * _2843;
    int _2865 = ~_2611;
    int _2867 = _2865 + 1;
    float _2869 = _2581 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2871 = float(uint(_2853));
    float _2873 = _2861 * _2847;
    int _2875 = ~_2711;
    int _2877 = _2875 + 1;
    float _2879 = trunc(_2841);
    float _2881 = precise::max(_2879, 0.0);
    uint _2883 = uint(_2881);
    int _2885 = _2867 * int(_2835);
    int _2887 = _2885 + _2773;
    float _2889 = as_type<float>(_2761) * _2871;
    float _2891 = _2457 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2895 = _2869 + _2893;
    int _2897 = ~_2757;
    int _2899 = _2897 + 1;
    float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2903 = _2845 + _2901;
    int _2905 = ~_2705;
    int _2907 = _2905 + 1;
    float _2909 = trunc(_2849);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    float _2915 = float(uint(_2887));
    float _2917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2919 = _2891 + _2917;
    float _2921 = _2895 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2923 = _2907 * int(_2859);
    int _2925 = _2923 + _2795;
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2921);
    float _2929 = trunc(_2863);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = as_type<float>(_2791) * _2915;
    int _2937 = _2877 * int(_2883);
    int _2939 = _2937 + _2817;
    float _2941 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2927);
    float _2943 = float(uint(_2925));
    int _2945 = ~_2573;
    int _2947 = _2945 + 1;
    int _2949 = _2899 * int(_2913);
    int _2951 = _2949 + _2821;
    float _2953 = trunc(_2889);
    float _2955 = precise::max(_2953, 0.0);
    uint _2957 = uint(_2955);
    float _2959 = float(uint(_2939));
    float _2961 = as_type<float>(_2799) * _2943;
    bool _2963 = _2941 >= 0.0;
    float _2965 = float(uint(_2951));
    int _2967 = int(_2789) + int(_2933);
    float _2969 = as_type<float>(_2803) * _2959;
    float _2971 = trunc(_2935);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    float _2977 = as_type<float>(_2837) * _2965;
    float _2979 = as_type<float>(_2799);
    float _2981 = _2591;
    float _2983 = as_type<float>(_2951);
    if (_2265)
    {
        _2979 = _654;
    }
    float _2985 = _2979;
    float _2987 = _2985;
    if (!_2265)
    {
        _2987 = _648;
    }
    float _2989 = _2987;
    int _2991 = as_type<int>(_2989);
    if (_2963)
    {
        out.m_49.x = 0.0;
    }
    float _2993 = trunc(_2961);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    int _2999 = int(_2815) + int(_2957);
    float _3001 = as_type<float>(_2957);
    if (_2963)
    {
        _3001 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3003 = _3001;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3007 = ~_2505;
    int _3009 = _3007 + 1;
    int _3011 = _2947 * _2999;
    int _3013 = _3011 + _2737;
    float _3015 = trunc(_2969);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    float _3021 = _2989 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2963)
    {
        float _3023 = _3003 * 5.0;
        _2991 = as_type<int>(_3023);
    }
    int _3025 = _2991;
    int _3027 = _3009 * _2967;
    int _3029 = _3027 + _2723;
    int _3031 = int(_2835) + int(_2975);
    float _3033 = fma(_3021, -2.0, _3005);
    int _3035 = ~_2711;
    int _3037 = _3035 + 1;
    if (_2963)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9333 = as_type<float>(_3025);
        out.gl_Position.z = _9333;
    }
    float _3039 = trunc(_2977);
    float _3041 = precise::max(_3039, 0.0);
    uint _3043 = uint(_3041);
    int _3045 = int(_2859) + int(_2997);
    int _3047 = ~_2705;
    int _3049 = _3047 + 1;
    int _3051 = ~_2611;
    int _3053 = _3051 + 1;
    bool _3055 = uint(_3029) >= uint(_2505);
    int _3057 = int(_2883) + int(_3019);
    int _3059 = _3053 * _3031;
    int _3061 = _3059 + _2773;
    bool _3063 = uint(_3013) >= uint(_2573);
    int _3065 = _3049 * _3045;
    int _3067 = _3065 + _2795;
    bool _3069 = !_3055;
    int _3071 = _3069 ? 0 : (-1);
    int _3073 = _3037 * _3057;
    int _3075 = _3073 + _2817;
    int _3077 = ~_2757;
    int _3079 = _3077 + 1;
    int _3081 = int(_2913) + int(_3043);
    int _3083 = ~_2967;
    int _3085 = _3083 + _3071;
    int _3087 = _3085 + 1;
    bool _3089 = !_3063;
    int _3091 = _3089 ? 0 : (-1);
    int _3093 = _3079 * _3081;
    int _3095 = _3093 + _2821;
    bool _3097 = uint(_3061) >= uint(_2611);
    int _3099 = _2505 * _3087;
    int _3101 = _3099 + _2723;
    bool _3103 = uint(_3067) >= uint(_2705);
    float _3105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3107 = ~_2999;
    int _3109 = _3107 + _3091;
    int _3111 = _3109 + 1;
    bool _3113 = !_3103;
    int _3115 = _3113 ? 0 : (-1);
    bool _3117 = !_3097;
    int _3119 = _3117 ? 0 : (-1);
    bool _3121 = _2505 == 0;
    bool _3123 = uint(_3075) >= uint(_2711);
    int _3125 = _2573 * _3111;
    int _3127 = _3125 + _2737;
    bool _3129 = _2505 == 0;
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3133 = _2723 ^ _2505;
    int _3135 = ~_3031;
    int _3137 = _3135 + _3119;
    int _3139 = _3137 + 1;
    bool _3141 = !_3121;
    int _3143 = _3141 ? _3101 : (-1);
    bool _3145 = !_3123;
    int _3147 = _3145 ? 0 : (-1);
    float _3149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3151 = _2573 == 0;
    bool _3153 = uint(_3095) >= uint(_2757);
    int _3155 = _2611 * _3139;
    int _3157 = _3155 + _2773;
    bool _3159 = !_3151;
    int _3161 = _3159 ? _3127 : (-1);
    bool _3163 = !_3153;
    int _3165 = _3163 ? 0 : (-1);
    bool _3167 = _2611 == 0;
    bool _3169 = _2573 == 0;
    int _3171 = _2737 ^ _2573;
    int _3173 = _2773 ^ _2611;
    float _3175 = _3105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3177 = float(_3143);
    float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3181 = !_3167;
    int _3183 = _3181 ? _3157 : (-1);
    float _3185 = fma(_3175, _959, -0.5);
    int _3187 = ~_3115;
    int _3189 = _3045 + _3187;
    int _3191 = _3189 + 1;
    float _3193 = fma(_3175, _3177, _1989);
    bool _3195 = _2611 == 0;
    float _3197 = _3149 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3199 = float(_3161);
    float _3201 = -_144;
    float _3203 = fma(_3201, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2591);
    float _3205 = float(_3183);
    float _3207 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3209 = uint(int(uint(_3133) >> uint(31)));
    float _3211 = fma(_3197, _3199, _3203);
    float _3213 = fma(_3197, _1049, -0.5);
    float _3215 = fma(_3207, _1611, -0.5);
    float _3217 = fma(_3207, _3205, _2359);
    float _3219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3221 = ~int(_3209);
    int _3223 = _3221 + 1;
    float _3225 = _3179 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _3227 = uint(int(uint(_3171) >> uint(31)));
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3231 = _3191 ^ _3223;
    float _3233 = fma(_895, _3225, -0.5);
    int _3235 = ~_3147;
    int _3237 = _3057 + _3235;
    int _3239 = _3237 + 1;
    float _3241 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3229);
    int _3243 = ~int(_3227);
    int _3245 = _3243 + 1;
    float _3247 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2297);
    int _3249 = ~_3223;
    int _3251 = _3249 + _3231;
    int _3253 = _3251 + 1;
    float _3255 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3241);
    uint _3257 = uint(int(uint(_3173) >> uint(31)));
    float _3259 = fma(_3247, _3213, _3211);
    int _3261 = _3239 ^ _3245;
    float _3263 = fma(_3255, _3185, _3193);
    bool _3265 = !_3129;
    int _3267 = _3265 ? _3253 : (-1);
    float _3269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3271 = ~_3165;
    int _3273 = _3081 + _3271;
    int _3275 = _3273 + 1;
    float _3277 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1807);
    int _3279 = ~int(_3257);
    int _3281 = _3279 + 1;
    float _3283 = _3219 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3285 = ~_3245;
    int _3287 = _3285 + _3261;
    int _3289 = _3287 + 1;
    float _3291 = _3263 + 0.5;
    float _3293 = float(_3267);
    float _3295 = fma(_897, _3283, -0.5);
    int _3297 = _3275 ^ _3281;
    float _3299 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3301 = log2(_3299);
    float _3303 = -_3277;
    float _3305 = fma(_3225, _3293, _3303);
    bool _3307 = !_3169;
    int _3309 = _3307 ? _3289 : (-1);
    float _3311 = _3259 + 0.5;
    int _3313 = ~_3281;
    int _3315 = _3313 + _3297;
    int _3317 = _3315 + 1;
    float _3319 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3321 = float(_3309);
    float _3323 = _3269 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3325 = !_3195;
    int _3327 = _3325 ? _3317 : (-1);
    float _3329 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3319);
    float _3331 = -_2619;
    float _3333 = fma(_3283, _3321, _3331);
    float _3335 = float(_3327);
    float _3337 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3033);
    float _3339 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3329);
    float _3341 = fma(_3323, _955, -0.5);
    float _3343 = -_3337;
    float _3345 = fma(_3323, _3335, _3343);
    float _3347 = fma(_2483, _3295, _3333);
    float _3349 = fma(_3339, _3233, _3305);
    float _3351 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3353 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3355 = _2895 * _2895;
    float _3357 = _3301 * _144;
    float _3359 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3351);
    float _3361 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3353);
    float _3363 = fma(_2919, _2919, _3355);
    float _3365 = exp2(_3357);
    float _3367 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3359);
    float _3369 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3361);
    float _3371 = fma(_2903, _2903, _3363);
    float _3373 = _3349 + 0.5;
    float _3375 = fma(_3367, _3215, _3217);
    float _3377 = fma(_3369, _3341, _3345);
    float _3379 = _3347 + 0.5;
    float _3381 = _3375 + 0.5;
    float _3383 = _3377 + 0.5;
    float _3385 = rsqrt(_3371);
    float _3387 = in.m_63.x;
    float _3389 = in.m_63.y;
    float _3391 = in.m_63.z;
    float _3393 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3395 = 1.0 + _3393;
    bool _3397 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3399 = isnan(0.0);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3405 = _3401 || _3403;
    float _3407 = -_3365;
    float _3409 = _3407 + 1.0;
    out.m_65.x = _3291;
    out.m_65.y = _3373;
    out.m_65.z = _3311;
    out.m_65.w = _3379;
    bool _3411 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3413 = isnan(1.0);
    bool _3415 = _3411 || _3413;
    bool _3417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3419 = _3415 || _3417;
    float _3421 = 1.0 / _3395;
    out.m_67.x = _3381;
    out.m_67.y = _3383;
    float _3423 = _3405 ? _3409 : 0.0;
    float _3425 = _2895 * _3385;
    float _3427 = _2919 * _3385;
    bool _3429 = !_2199;
    int _3431 = _3429 ? 0 : 1;
    if (_2963)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3433 = -_3425;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2869);
    float _3437 = _2873 * (-2.0);
    float _3439 = _2903 * _3385;
    float _3441 = -_3427;
    float _3443 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2891);
    float _3445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3447 = _3435 + _3445;
    float _3449 = fma(_1931, _3437, _1931);
    float _3451 = -_3439;
    float _3453 = fma(_3451, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2845);
    float _3455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3457 = _3443 + _3455;
    float _3459 = _3447 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3461 = _3439;
    float _3463 = _3457;
    if (_3419)
    {
        float _3465 = _3423 * _3421;
        _148 = _3465;
    }
    float _3467 = _148;
    float _3469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3471 = _3453 + _3469;
    float _3473 = fma(_3437, _3387, _3387);
    float _3475 = fma(_3457, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3459);
    float _3477 = _648 + (-0.5);
    float _3479 = _654 + _678;
    float _3481 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3475);
    float _3483 = fma(_3477, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3473);
    float _3485 = _3479 + (-1.0);
    float _3487 = _654 + (-0.5);
    int _3489 = _2153 ? 0 : 1;
    float _3491 = fma(_3449, _3467, _3483);
    bool _3493 = _3481 >= 0.0;
    float _3495 = _2539 * (-2.0);
    float _3497 = fma(_3485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _3499 = ~_3489;
    int _3501 = _3499 + 1;
    int _3503 = _3501 + 1;
    float _3505 = _3491 * 0.15915493667125701904296875;
    float _3507 = fma(_3495, _3389, _3389);
    float _3509 = fma(_3497, _3495, _3497);
    int _3511 = _3503;
    float _3513 = _3507;
    if (!_2143)
    {
        int _3515 = ~_3489;
        int _3517 = _3515 + 1;
        _3511 = _3517;
    }
    int _3519 = _3511;
    float _3521 = _3505 * 6.283185482025146484375;
    float _3523 = sin(_3521);
    float _3525 = fma(_3487, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3507);
    int _3527 = abs(_3431);
    float _3529 = _648 + _678;
    float _3531 = float(_3519);
    float _3533 = fma(_3509, _3467, _3525);
    if (_3493)
    {
        out.m_49.x = 0.0;
    }
    if (_3493)
    {
        _3513 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3535 = _3513;
    float _3537 = _3533 * 0.15915493667125701904296875;
    float _3539 = _3505 * 6.283185482025146484375;
    float _3541 = cos(_3539);
    float _3543 = float(_3527);
    int _3545 = as_type<int>(_3535);
    if (_3493)
    {
        float _3547 = _3535 * 5.0;
        _3545 = as_type<int>(_3547);
    }
    int _3549 = _3545;
    float _3551 = _3529 + (-1.0);
    float _3553 = _3543 * _3531;
    float _3555 = _3537 * 6.283185482025146484375;
    float _3557 = sin(_3555);
    if (_3493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10128 = as_type<float>(_3549);
        out.gl_Position.z = _10128;
    }
    float _3559 = _3553 * (-2.0);
    if (_3493)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3561 = -_2869;
    float _3563 = _3561 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3565 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3567 = -_2891;
    float _3569 = _3567 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3571 = -_2845;
    float _3573 = _3571 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3575 = _3563 * _3563;
    float _3577 = fma(_3559, _3391, _3391);
    float _3579 = _678 + (-0.5);
    float _3581 = fma(_3565, _3559, _3565);
    float _3583 = fma(_3569, _3569, _3575);
    float _3585 = -_3425;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2895);
    float _3589 = fma(_3579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3577);
    float _3591 = -_3427;
    float _3593 = fma(_3591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2919);
    float _3595 = fma(_3573, _3573, _3583);
    float _3597 = _3587 * _3587;
    float _3599 = fma(_3581, _3467, _3589);
    float _3601 = _3537 * 6.283185482025146484375;
    float _3603 = cos(_3601);
    float _3605 = -_3439;
    float _3607 = fma(_3605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2903);
    float _3609 = fma(_3593, _3593, _3597);
    float _3611 = _3599 * 0.15915493667125701904296875;
    float _3613 = in.m_69.x;
    float _3615 = in.m_69.y;
    float _3617 = in.m_69.z;
    float _3619 = _3523 * _3557;
    float _3621 = fma(_3607, _3607, _3609);
    float _3623 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3625 = rsqrt(_3595);
    float _3627 = _3611 * 6.283185482025146484375;
    float _3629 = sin(_3627);
    float _3631 = _3541 * _3603;
    float _3633 = _3523 * _3603;
    float _3635 = _3569 * _3625;
    float _3637 = _3573 * _3625;
    float _3639 = _3563 * _3625;
    float _3641 = sqrt(_3621);
    float _3643 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3645 = _3635 * _3643;
    float _3647 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3649 = _3637 * _3647;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3653 = _3639 * _3651;
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3657 = -_3645;
    float _3659 = fma(_3637, _3655, _3657);
    float _3661 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3663 = -_3649;
    float _3665 = fma(_3639, _3661, _3663);
    float _3667 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3669 = -_3653;
    float _3671 = fma(_3635, _3667, _3669);
    float _3673 = fma(_3629, _3631, _3619);
    float _3675 = _3659 * _3659;
    float _3677 = fma(_3629, _3619, _3631);
    float _3679 = _3611 * 6.283185482025146484375;
    float _3681 = cos(_3679);
    float _3683 = fma(_3665, _3665, _3675);
    float _3685 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _3687 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3689 = isnan(0.5);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3695 = _3691 || _3693;
    float _3697 = _3385 * _3641;
    float _3699 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3615);
    float _3703 = _3541 * _3557;
    float _3705 = _3697 * _3623;
    float _3707 = fma(_3671, _3671, _3683);
    float _3709 = _3697 * _3699;
    float _3711 = -_3703;
    float _3713 = fma(_3629, _3633, _3711);
    float _3715 = -_3633;
    float _3717 = fma(_3629, _3703, _3715);
    float _3719 = rsqrt(_3707);
    float _3721 = _3701 * _3709;
    float _3723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3617);
    float _3725 = _3603 * _3681;
    float _3727 = _3541 * _3681;
    float _3729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3613);
    float _3731 = _3523 * _3681;
    float _3733 = _3557 * _3681;
    float _3735 = _3697 * _3685;
    float _3737 = _3729 * _3705;
    float _3739 = _3727 * _3721;
    float _3741 = _3723 * _3735;
    float _3743 = -_3721;
    float _3745 = _3629 * _3743;
    float _3747 = fma(_3673, _3737, _3739);
    float _3749 = _3731 * _3721;
    float _3751 = _3665 * _3719;
    float _3753 = _3659 * _3719;
    float _3755 = _3671 * _3719;
    float _3757 = fma(_3725, _3737, _3745);
    float _3759 = _3639 * _3751;
    float _3761 = fma(_3717, _3741, _3747);
    float _3763 = _3637 * _3753;
    float _3765 = fma(_3713, _3737, _3749);
    float _3767 = -_3759;
    float _3769 = fma(_3635, _3753, _3767);
    float _3771 = fma(_3733, _3741, _3757);
    float _3773 = -_3763;
    float _3775 = fma(_3639, _3755, _3773);
    float _3777 = fma(_3677, _3741, _3765);
    float _3779 = _3769 * _3761;
    float _3781 = _3775 * _3761;
    float _3783 = fma(_3755, _3771, _3779);
    float _3785 = fma(_3751, _3771, _3781);
    float _3787 = fma(_3637, _3777, _3783);
    float _3789 = fma(_3635, _3777, _3785);
    float _3791 = _2845 + _3787;
    float _3793 = _2891 + _3789;
    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3797 = _3791 + _3795;
    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3801 = _3793 + _3799;
    float _3803 = _3797 * _3797;
    float _3805 = fma(_3801, _3801, _3803);
    float _3807 = _3635 * _3755;
    float _3809 = sqrt(_3805);
    float _3811 = -_3807;
    float _3813 = fma(_3637, _3751, _3811);
    float _3815 = _3813 * _3761;
    float _3817 = fma(_3753, _3771, _3815);
    float _3819 = fma(_3639, _3777, _3817);
    bool _3821 = _3809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3823 = _2869 + _3819;
    float _3825 = _3819;
    float _3827 = _3807;
    float _3829 = _3777;
    float _3831 = _3809;
    if (!_3821)
    {
        _3825 = _3793;
    }
    float _3833 = _3825;
    float _3835 = _3833;
    if (!_3821)
    {
        _3827 = _3791;
    }
    float _3837 = _3827;
    float _3839 = _3837;
    if (!_3821)
    {
        _3829 = _3823;
    }
    float _3841 = _3829;
    bool _3843 = !_3821;
    float _3845 = _3841;
    if (!_3843)
    {
        float _3847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3851 = _3809 + _3849;
        float _3853 = rsqrt(_3805);
        float _3855 = _3851 * _3847;
        float _3857 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3859 = _3855 * 0.15915493667125701904296875;
        float _3861 = _3859 * 6.283185482025146484375;
        float _3863 = cos(_3861);
        float _3865 = _3859 * 6.283185482025146484375;
        float _3867 = sin(_3865);
        float _3869 = _3863 + (-1.0);
        float _3871 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3873 = fma(_3867, _3857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3875 = fma(_3823, _3863, _3871);
        float _3877 = _3853 * _3873;
        float _3879 = fma(_3801, _3877, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3881 = fma(_3797, _3877, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3845 = _3875;
        _3839 = _3881;
        _3835 = _3879;
        _3831 = _3871;
    }
    float _3883 = _3845;
    float _3885 = _3839;
    float _3887 = _3835;
    float _3889 = _3831;
    float _3891 = -_3425;
    float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3883);
    float _3895 = -_3439;
    float _3897 = fma(_3895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3885);
    float _3899 = -_3427;
    float _3901 = fma(_3899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3887);
    float _3903 = _3901;
    float _3905 = _3897;
    float _3907 = _3889;
    if (_3695)
    {
        _3461 = _3893;
    }
    float _3909 = _3461;
    float _3911 = _3909;
    if (!_3695)
    {
        float _3913 = _3447 * _3447;
        float _3915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3917 = -_2845;
        float _3919 = _3917 + _3885;
        float _3921 = -_2891;
        float _3923 = _3921 + _3887;
        float _3925 = fma(_3457, _3457, _3913);
        float _3927 = -_2869;
        float _3929 = _3927 + _3883;
        float _3931 = fma(_3471, _3471, _3925);
        float _3933 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3935 = sqrt(_3931);
        float _3937 = 1.0 / _3697;
        float _3939 = _3933 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3941 = precise::min(_3935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3943 = _3941 * _3915;
        float _3945 = _3943 * _3937;
        float _3947 = _3939 * _3945;
        float _3949 = _3919 * _3945;
        float _3951 = fma(_3923, _3947, _3443);
        float _3953 = fma(_3929, _3947, _3435);
        float _3955 = fma(_3939, _3949, _3453);
        _3911 = _3953;
        _3903 = _3951;
        _3905 = _3955;
        _3463 = _3935;
    }
    float _3957 = _3911;
    float _3959 = _3903;
    float _3961 = _3905;
    float _3963 = _3463;
    float _3965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3967 = _3957 + _3965;
    float _3969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3971 = _3959 + _3969;
    float _3973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3975 = _3961 + _3973;
    float _3977 = _3967 * _3967;
    float _3979 = fma(_3971, _3971, _3977);
    float _3981 = fma(_3975, _3975, _3979);
    float _3983 = rsqrt(_3981);
    float _3985 = sqrt(_3981);
    float _3987 = _3983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3989 = _3971 * _3987;
    float _3991 = _3975 * _3987;
    float _3993 = _3989 * _3989;
    float _3995 = _3991 * _3991;
    float _3997 = _3993 + _3995;
    float _3999 = sqrt(_3997);
    bool _4001 = _3999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4005 = _3999 + _4003;
    float _4007 = _3975;
    float _4009 = _3997;
    float _4011 = _4005;
    float _4013 = _3967;
    float _4015 = _3963;
    if (_4001)
    {
        float _4017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4007 = _4017;
    }
    float _4019 = _4007;
    if (_4001)
    {
        float _4021 = rsqrt(_3997);
        _4009 = _4021;
    }
    float _4023 = _4009;
    float _4025 = _4023;
    if (_4001)
    {
        float _4027 = _4005 * _4019;
        _4011 = _4027;
    }
    float _4029 = _4011;
    if (_4001)
    {
        float _4031 = _4029 * 0.15915493667125701904296875;
        _3907 = _4031;
    }
    float _4033 = _3907;
    float _4035 = _3977;
    float _4037 = _4033;
    if (_4001)
    {
        float _4039 = _4033 * 6.283185482025146484375;
        float _4041 = sin(_4039);
        _4035 = _4041;
    }
    float _4043 = _4035;
    float _4045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4047 = precise::max(0.0, _4045);
    float _4049 = _3983;
    float _4051 = _4045;
    float _4053 = _4047;
    if (_4001)
    {
        float _4055 = _4033 * 6.283185482025146484375;
        float _4057 = cos(_4055);
        _4049 = _4057;
    }
    float _4059 = _4049;
    float _4061 = -_3987;
    float _4063 = -_4047;
    float _4065 = fma(_3967, _4061, _4063);
    if (_4001)
    {
        float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4051 = _4067;
    }
    float _4069 = _4051;
    float _4071 = _4069;
    if (!_4001)
    {
        _4037 = _3989;
    }
    float _4073 = _4037;
    float _4075 = _4043;
    float _4077 = _4073;
    if (_4001)
    {
        float _4079 = fma(_4043, _4069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4071 = _4079;
    }
    float _4081 = _4071;
    if (!_4001)
    {
        _4075 = _4065;
    }
    float _4083 = _4075;
    float _4085 = _4083;
    float _4087 = _4059;
    if (_4001)
    {
        float _4089 = _4059 + (-1.0);
        _4013 = _4089;
    }
    float _4091 = _4013;
    float _4093 = _4091;
    if (_4001)
    {
        float _4095 = _4023 * _4081;
        _4015 = _4095;
    }
    float _4097 = _4015;
    if (!_4001)
    {
        _4025 = _3995;
    }
    float _4099 = _4025;
    float _4101 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4103 = _4099;
    if (_4001)
    {
        float _4105 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4053 = _4105;
    }
    float _4107 = _4053;
    if (_4001)
    {
        float _4109 = _3989 * _4097;
        _4077 = _4109;
    }
    float _4111 = _4077;
    if (!_4001)
    {
        _4093 = _3991;
    }
    float _4113 = _4093;
    float _4115 = _4113;
    if (_4001)
    {
        float _4117 = _3991 * _4097;
        _4115 = _4117;
    }
    float _4119 = _4115;
    if (_4001)
    {
        float _4121 = fma(_4065, _4059, _4107);
        _4085 = _4121;
    }
    float _4123 = _4085;
    if (!_4001)
    {
        _4087 = _3993;
    }
    float _4125 = _4087;
    float _4127 = _4125;
    if (_4001)
    {
        float _4129 = _4111 * _4111;
        _4127 = _4129;
    }
    float _4131 = _4127;
    if (_4001)
    {
        float _4133 = _4119 * _4119;
        _4103 = _4133;
    }
    float _4135 = _4103;
    float _4137 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4101);
    float _4139 = fma(_4123, _4123, _4131);
    float _4141 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4143 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4137);
    float _4145 = _4139 + _4135;
    float _4147 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4141);
    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4151 = fma(_3985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4149);
    float _4153 = precise::clamp(_4151, 0.0, 1.0);
    float _4155 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4157 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4147);
    float _4159 = rsqrt(_4145);
    float _4161 = -_4153;
    float _4163 = _4161 + 1.0;
    float _4165 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4167 = _4157 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4169 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4171 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4155);
    float _4173 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4175 = abs(_4163);
    float _4177 = log2(_4175);
    float _4179 = _4143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4181 = fma(_3443, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4183 = -_4173;
    float _4185 = fma(_4183, _4165, 1.0);
    float _4187 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4189 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4171);
    float _4191 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4187);
    float _4193 = _4159 * _4111;
    float _4195 = floor(_4181);
    float _4197 = _4189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4199 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4191);
    float _4201 = _4159 * _4123;
    float _4203 = _4159 * _4119;
    float _4205 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4207 = _4199 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4209 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4211 = floor(_4169);
    float _4213 = -_4205;
    float _4215 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4213);
    float _4217 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4219 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4209);
    float _4221 = -_4203;
    float _4223 = fma(_4221, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4215);
    float _4225 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4219);
    float _4227 = -_4195;
    float _4229 = _4181 + _4227;
    float _4231 = fma(_4223, -0.5, 0.5);
    float _4233 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4225);
    float _4235 = fma(_4223, 0.5, 0.5);
    float _4237 = exp2(_4217);
    float _4239 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4241 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4243 = fma(_4235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4245 = -_4211;
    float _4247 = _4169 + _4245;
    float _4249 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4239);
    float _4251 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4241);
    float _4253 = fma(_4235, _4243, -0.212114393711090087890625);
    float _4255 = log2(_4185);
    float _4257 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4249);
    float _4259 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4251);
    float _4261 = 1.0 / _4233;
    float _4263 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4257);
    float _4265 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4259);
    float2 _11269 = float2(_4229, _4247);
    float _4267 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11269, float2(0.0), isnan(_11269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11269, float2(0.0), isnan(_11269)), level(0.0)).x;
    float _4269 = fma(_4235, _4253, 1.570728778839111328125);
    float _4271 = sqrt(_4231);
    float _4273 = _4255 * 0.693147182464599609375;
    float _4275 = _4263 * _4261;
    float _4277 = _4201 + 1.0;
    float _4279 = fma(_4275, 0.5, 0.5);
    float _4281 = -_4201;
    float _4283 = fma(_4237, _4277, _4281);
    float _4285 = _4265 * _4261;
    float _4287 = _4273 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4289 = _4271 * 0.636619746685028076171875;
    float _4291 = fma(_4283, 0.5, 0.5);
    float _4293 = fma(_4285, -0.5, 0.5);
    float _4295 = -_4269;
    float _4297 = fma(_4289, _4295, 1.0);
    float3 _11321 = float3(_4279, _4293, _4287);
    float _4299 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11321, float3(0.0), isnan(_11321)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11321, float3(0.0), isnan(_11321)), level(0.0)).x;
    float3 _11332 = float3(_4279, _4293, _4287);
    float4 _4302 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11332, float3(0.0), isnan(_11332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11332, float3(0.0), isnan(_11332)), level(0.0)).xyzw;
    float _4304 = _4302.x;
    float _4306 = _4302.y;
    float _4308 = _4302.z;
    float _4310 = _4302.w;
    float2 _11348 = float2(_4297, _4291);
    float3 _4314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11348, float2(0.0), isnan(_11348)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11348, float2(0.0), isnan(_11348)), level(0.0)).xyz;
    float _4316 = _4314.x;
    float _4318 = _4314.y;
    float _4320 = _4314.z;
    float _4322 = _3435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4324 = _3435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4326 = _3615 != 0.0;
    bool _4328 = isnan(_3615);
    bool _4330 = _4326 || _4328;
    bool _4332 = isnan(0.0);
    bool _4334 = _4330 || _4332;
    float _4336 = _3727 * _3769;
    float _4338 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4322);
    float _4340 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4324);
    bool _4342 = _3613 == 0.0;
    bool _4344 = !_4334;
    bool _4346 = _4342 && _4344;
    float _4348 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4350 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4338);
    float _4352 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4340);
    float _4354 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4356 = _4350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4358 = _4352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4360 = _3617 == 0.0;
    bool _4362 = _4360 && _4346;
    float _4364 = exp2(_4348);
    float _4366 = _4358 + _4356;
    float _4368 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4354);
    float _4370 = 1.0 / _4356;
    float _4372 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4368);
    float _4374 = -_4364;
    float _4376 = _4374 + 1.0;
    float _4378 = in.m_71.x;
    float _4380 = in.m_71.y;
    float _4382 = in.m_71.z;
    float _4384 = in.m_71.w;
    float _4386 = _4376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4388 = _4366 * _4370;
    float _4390 = _4388 * 0.5;
    float _4392 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4394 = fma(_4390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4392);
    float _4396 = in.m_73.x;
    float _4398 = in.m_73.y;
    float _4400 = in.m_73.z;
    float _4402 = 1.0 / _4394;
    float _4404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4406 = _4402 * _4404;
    float _4408 = abs(_4406);
    float _4410 = log2(_4408);
    float _4412 = _4402;
    float _4414 = _4396;
    float _4416 = _4233;
    float _4418 = _4265;
    if (_4362)
    {
        _2981 = _4398;
    }
    float _4420 = _2981;
    float _4422 = _4420;
    if (_4362)
    {
        _2983 = _4396;
    }
    float _4424 = _2983;
    float _4426 = _4424;
    if (_4362)
    {
        _4412 = _4420;
    }
    float _4428 = _4412;
    float _4430 = _4428;
    if (!_4362)
    {
        _4422 = _4398;
    }
    float _4432 = _4422;
    if (!_4362)
    {
        float _4434 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4432);
        _4430 = _4434;
    }
    float _4436 = _4430;
    float _4438 = _4380 * _4400;
    float _4440 = _4410 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4442 = _4410;
    if (_4362)
    {
        _4442 = _4424;
    }
    float _4444 = _4442;
    float _4446 = _4444;
    if (!_4362)
    {
        _4426 = _4396;
    }
    float _4448 = _4426;
    if (_4362)
    {
        _4414 = _4400;
    }
    float _4450 = _4414;
    float _4452 = exp2(_4440);
    float _4454 = _4450;
    if (!_4362)
    {
        float _4456 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4400);
        _4454 = _4456;
    }
    float _4458 = _4454;
    if (!_4362)
    {
        float _4460 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4448);
        _4446 = _4460;
    }
    float _4462 = _4446;
    float _4464 = _4382 * _4448;
    float _4466 = _4378 * _4432;
    float _4468 = -_4438;
    float _4470 = fma(_4382, _4432, _4468);
    bool _4472 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4474 = isnan(_3985);
    bool _4476 = _4472 || _4474;
    bool _4478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4480 = _4476 || _4478;
    float _4482 = -_4464;
    float _4484 = fma(_4378, _4400, _4482);
    float _4486 = _4470 * _4384;
    float _4488 = fma(_4452, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4490 = precise::clamp(_4488, 0.0, 1.0);
    float _4492 = -_4466;
    float _4494 = fma(_4380, _4448, _4492);
    float _4496 = _4484 * _4384;
    float _4498 = _3673 * _3775;
    float _4500 = fma(_4490, -2.0, 3.0);
    float _4502 = _4490 * _4490;
    float _4504 = _4494 * _4384;
    float _4506 = _3673 * _3813;
    float _4508 = _3673 * _3769;
    float _4510 = _3727 * _3775;
    float _4512 = _3727 * _3813;
    float _4514 = _4502 * _4500;
    float _4516 = _3717 * _3775;
    float _4518 = _3717 * _3813;
    float _4520 = _3717 * _3769;
    float _4522 = -_3629;
    float _4524 = fma(_4522, _3751, _4510);
    float _4526 = -_3629;
    float _4528 = fma(_4526, _3753, _4512);
    float _4530 = -_3629;
    float _4532 = fma(_4530, _3755, _4336);
    float _4534 = -_4514;
    float _4536 = _4534 + 1.0;
    float _4538 = fma(_3725, _3751, _4498);
    float _4540 = fma(_3725, _3753, _4506);
    float _4542 = fma(_3725, _3755, _4508);
    float _4544 = fma(_3733, _3753, _4518);
    float _4546 = fma(_4536, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4514);
    float _4548 = fma(_3713, _3635, _4538);
    float _4550 = fma(_3713, _3639, _4540);
    float _4552 = fma(_3713, _3637, _4542);
    float _4554 = fma(_3733, _3751, _4516);
    bool _4556 = _4406 <= 8000.0;
    bool _4558 = isnan(_4406);
    bool _4560 = _4556 || _4558;
    bool _4562 = isnan(8000.0);
    bool _4564 = _4560 || _4562;
    float _4566 = float(_4564);
    float _4568 = fma(_3733, _3755, _4520);
    float _4570 = fma(_3731, _3635, _4524);
    float _4572 = fma(_3731, _3639, _4528);
    float _4574 = fma(_3731, _3637, _4532);
    float _4576 = fma(_3677, _3635, _4554);
    float _4578 = _4566 * _4546;
    float _4580 = fma(_3677, _3639, _4544);
    float _4582 = fma(_3677, _3637, _4568);
    float _4584 = _4570 * _4380;
    float _4586 = _4572 * _4380;
    float _4588 = _4574 * _4380;
    float _4590 = _4574 * _4436;
    float _4592 = _4570 * _4436;
    float _4594 = _4496 * _4570;
    float _4596 = _4496 * _4574;
    float _4598 = _4572 * _4436;
    float _4600 = _4496 * _4572;
    float _4602 = fma(_4548, _4378, _4584);
    float _4604 = fma(_4548, _4462, _4592);
    float _4606 = fma(_4486, _4548, _4594);
    float _4608 = fma(_4486, _4552, _4596);
    float _4610 = fma(_4550, _4378, _4586);
    float _4612 = in.m_75.x;
    float _4614 = fma(_4550, _4462, _4598);
    float _4616 = fma(_4486, _4550, _4600);
    float _4618 = fma(_4580, _4382, _4610);
    float _4620 = fma(_4552, _4378, _4588);
    float _4622 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4372);
    float _4624 = fma(_4576, _4382, _4602);
    float _4626 = fma(_4504, _4576, _4606);
    float _4628 = fma(_4504, _4580, _4616);
    float _4630 = fma(_4504, _4582, _4608);
    float _4632 = _4622 + _4233;
    float _4634 = fma(_4582, _4382, _4620);
    float _4636 = _4578 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4638 = fma(_4552, _4462, _4590);
    float _4640 = _4632 * 0.5;
    float _4642 = fma(_4576, _4458, _4604);
    out.m_77.x = _4624;
    out.m_77.y = _4618;
    out.m_77.z = _4634;
    float _4644 = fma(_4580, _4458, _4614);
    float _4646 = fma(_4582, _4458, _4638);
    out.m_79.x = _4626;
    out.m_79.y = _4628;
    out.m_79.z = _4630;
    out.m_81.z = _4640;
    out.m_81.w = _4233;
    out.m_83.x = _4642;
    out.m_83.y = _4644;
    out.m_83.z = _4646;
    float _4648 = -_4386;
    float _4650 = _4648 + 1.0;
    out.gl_Position.x = _4263;
    out.gl_Position.y = _4265;
    out.gl_Position.z = _4622;
    out.gl_Position.w = _4233;
    float _4652 = _4630;
    float _4654 = _4628;
    float _4656 = _4263;
    float _4658 = _4650;
    if (!_4480)
    {
        _4652 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4660 = _4652;
    float _4662 = _4660;
    float _4664 = _4660;
    if (!_4480)
    {
        _4654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4666 = _4654;
    float _4668 = _4666;
    float _4670 = _4666;
    if (!_4480)
    {
        _4416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4672 = _4416;
    float _4674 = _4672;
    float _4676 = _4672;
    if (!_4480)
    {
        _4656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4678 = _4656;
    float _4680 = _4678;
    float _4682 = _4678;
    if (!_4480)
    {
        _4418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4684 = _4418;
    float _4686 = -_4267;
    float _4688 = _4686 + 1.0;
    float _4690 = _4688 * _4636;
    float _4692 = precise::clamp(_4690, 0.0, 1.0);
    float _4694 = -_4692;
    float _4696 = fma(_4694, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4698 = _4696 * _4612;
    float _4700 = _4698 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _4700;
    float _4702 = _4386 * _4299;
    float _4704 = _4310 * _4650;
    float _4706 = _4684;
    float _4708 = _4684;
    if (!_4480)
    {
        _4658 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4710 = _4658;
    float _4712 = _4310 * _4702;
    float _4714 = _4320 * _4702;
    float _4716 = fma(_4316, _4712, _4304);
    float _4718 = fma(_4318, _4712, _4306);
    float _4720 = fma(_4310, _4714, _4308);
    out.m_87.x = _4716;
    out.m_87.y = _4718;
    out.m_87.z = _4720;
    out.m_87.w = _4704;
    bool _4722 = !_4480;
    float _4724 = _4710;
    float _4726 = _4710;
    if (!_4722)
    {
        bool _4728 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4730 = isnan(_3985);
        bool _4732 = _4728 || _4730;
        bool _4734 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4736 = _4732 || _4734;
        if (!_4736)
        {
            float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4740 = _3985 + _4738;
            float _4742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4744 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4742;
            float _4746 = 1.0 / _4744;
            float _4748 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4750 = _4748 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4752 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4754 = _4752 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4756 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4760 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4762 = _4760 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4764 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4768 = _4740 * _4746;
            float _4770 = precise::clamp(_4768, 0.0, 1.0);
            float _4772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4776 = fma(_4770, _4754, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4778 = fma(_4770, _4774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4780 = fma(_4770, _4750, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4782 = fma(_4770, _4758, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4784 = fma(_4770, _4762, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4786 = fma(_4770, _4766, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4670 = _4780;
            _4682 = _4784;
            _4664 = _4778;
            _4676 = _4782;
            _4726 = _4776;
            _4708 = _4786;
            _4788 = true;
        }
        else
        {
            bool _4790 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4792 = isnan(_3985);
            bool _4794 = _4790 || _4792;
            bool _4796 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4798 = _4794 || _4796;
            if (!_4798)
            {
                _4674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4800 = _4674;
            _4676 = _4800;
            if (!_4798)
            {
                _4680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4802 = _4680;
            _4682 = _4802;
            if (!_4798)
            {
                _4706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4804 = _4706;
            _4708 = _4804;
            if (!_4798)
            {
                _4662 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4806 = _4662;
            _4664 = _4806;
            if (!_4798)
            {
                _4668 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4808 = _4668;
            _4670 = _4808;
            if (!_4798)
            {
                _4724 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4810 = _4724;
            bool _4812 = !_4798;
            _4726 = _4810;
            if (!_4812)
            {
                bool _4814 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4816 = isnan(_3985);
                bool _4818 = _4814 || _4816;
                bool _4820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4822 = _4818 || _4820;
                if (!_4822)
                {
                    float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4826 = _3985 + _4824;
                    float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4830 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4828;
                    float _4832 = 1.0 / _4830;
                    float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4842 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4854 = _4826 * _4832;
                    float _4856 = precise::clamp(_4854, 0.0, 1.0);
                    float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4860 = _4858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4862 = fma(_4856, _4840, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4864 = fma(_4856, _4860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4866 = fma(_4856, _4836, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4868 = fma(_4856, _4844, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4870 = fma(_4856, _4848, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4872 = fma(_4856, _4852, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4670 = _4866;
                    _4682 = _4870;
                    _4664 = _4864;
                    _4676 = _4868;
                    _4726 = _4862;
                    _4708 = _4872;
                    _4788 = true;
                }
                else
                {
                    _4670 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4664 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4726 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4788 = false;
    float _4874 = _4670;
    float _4876 = _4682;
    float _4878 = _4664;
    float _4880 = _4676;
    float _4882 = _4726;
    float _4884 = _4708;
    float _4886 = fma(_4644, -0.5, 0.5);
    float _4888 = precise::clamp(_4886, 0.0, 1.0);
    float _4890 = -_4874;
    float _4892 = _4876 + _4890;
    float _4894 = -_4878;
    float _4896 = _4880 + _4894;
    float _4898 = -_4882;
    float _4900 = _4884 + _4898;
    bool _4902 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4904 = fma(_4888, _4892, _4874);
    float _4906 = fma(_4888, _4896, _4878);
    float _4908 = fma(_4888, _4900, _4882);
    float _4910 = _4904 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _4912 = fma(_4906, 0.298911988735198974609375, _4910);
    float _4914 = fma(_4908, 0.114477999508380889892578125, _4912);
    out.m_89.x = 0.0;
    float _4916 = -_4914;
    float _4918 = _4906 + _4916;
    float _4920 = -_4914;
    float _4922 = _4904 + _4920;
    float _4924 = -_4914;
    float _4926 = _4908 + _4924;
    float _4928 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4930 = fma(_4918, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    float _4932 = fma(_4922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    float _4934 = fma(_4926, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    out.m_85.w = _4928;
    out.m_91.x = _4930;
    out.m_91.y = _4932;
    out.m_91.z = _4934;
    if (!_4902)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4936 = -_3957;
    float _4938 = _4936 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4940 = -_3959;
    float _4942 = _4940 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4944 = -_3961;
    float _4946 = _4944 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4948 = _4938 * _4938;
    float _4950 = fma(_4942, _4942, _4948);
    float _4952 = fma(_4946, _4946, _4950);
    float _4954 = sqrt(_4952);
    float _4956 = rsqrt(_4952);
    float _4958 = -_4954;
    float _4960 = _4958 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4962 = _4960 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4964 = precise::clamp(_4962, 0.0, 1.0);
    float _4966 = _4942 * _4956;
    float _4968 = _4938 * _4956;
    float _4970 = abs(_4964);
    float _4972 = log2(_4970);
    float _4974 = _4946 * _4956;
    float _4976 = _4966 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4978 = _4644 * _4968;
    float _4980 = -_4968;
    float _4982 = -_4976;
    float _4984 = fma(_4980, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4982);
    float _4986 = fma(_4642, _4966, _4978);
    float _4988 = -_4974;
    float _4990 = fma(_4988, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4984);
    float _4992 = fma(_4646, _4974, _4986);
    float _4994 = precise::clamp(_4992, 0.0, 1.0);
    float _4996 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4998 = _4990 + _4996;
    float _5000 = _4972 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5002 = _4998 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5004 = precise::clamp(_5002, 0.0, 1.0);
    float _5006 = exp2(_5000);
    float _5008 = _5006 * _5004;
    float _5010 = _4994 * _5008;
    float _5012 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5014 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5016 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _5012;
    out.m_89.y = _5014;
    out.m_89.z = _5016;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4788 = false;
    bool _634 = false;
    bool _518 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5073 = as_type<float>(_126);
        out.gl_Position.z = _5073;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5142 = as_type<float>(_164);
        out.gl_Position.z = _5142;
    }
    if (_158)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = 1.0 / _204;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _220;
    float _224 = 1.0 / _212;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _196 + _226;
    float _230 = 1.0 / _208;
    float _232 = _228 * _218;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _196 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = fma(_240, _232, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _246 = 1.0 / _216;
    float _248 = _236 * _224;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _196 + _262;
    bool _266 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _268 = isnan(_196);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = 1.0 / _222;
    float _280 = _200 * _230;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = _196 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _286;
    bool _290 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _292 = isnan(_196);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = fma(_288, _232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = _264 * _246;
    float _310 = -_260;
    float _312 = _310 + 1.0;
    bool _314 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_196);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _276 * _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = _300 * _304;
    float _334 = _284 * _278;
    bool _336 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_196);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = fma(_330, _232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = -_324;
    float _352 = _350 + 1.0;
    bool _354 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _356 = isnan(_196);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_300;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = _346 * _352;
    float _376 = -_346;
    float _378 = _376 + 1.0;
    float _380 = _324 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _364 * _378;
    float _392 = -_364;
    float _394 = _392 + 1.0;
    float _396 = fma(_372, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = _306 * _390;
    float _402 = _348 * _390;
    float _404 = _244 * _390;
    float _406 = fma(_388, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _408;
    float _412 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _426;
    float _430 = fma(_410, _248, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_396, _374, _412);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _434;
    float _438 = fma(_424, _308, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _440 = fma(_428, _248, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_398, _374, _414);
    float _444 = fma(_430, _380, _432);
    float _446 = fma(_436, _248, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _448 = fma(_406, _374, _416);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_440, _380, _442);
    float _456 = fma(_446, _380, _448);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = fma(_420, _308, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _468 = fma(_452, _308, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _470;
    float _474 = fma(_460, _334, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _476 = fma(_464, _334, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _478 = fma(_466, _332, _444);
    float _480 = fma(_472, _334, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _482 = fma(_438, _332, _454);
    float _484 = fma(_468, _332, _456);
    float _486 = fma(_474, _326, _478);
    float _488 = fma(_476, _326, _482);
    float _490 = fma(_480, _326, _484);
    float _492 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].x, _486);
    float _494 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].y, _488);
    float _496 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].z, _490);
    bool _498 = !_242;
    float _516;
    if (!_498)
    {
        float _500 = in.m_53.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_110);
        float _522 = 1.0 / _520;
        float _524 = _144 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_55.x;
    float _530 = in.m_55.y;
    float _532 = in.m_55.z;
    bool _534 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _536 = isnan(_526);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_526);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _526 + _566;
    float _570 = -_544;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _548;
    float _578 = _560 * _572;
    float _580 = -_560;
    float _582 = _580 + 1.0;
    float _584 = _496 * _532;
    float _586 = _494 * _530;
    float _588 = _564 * _576;
    float _590 = _492 * _528;
    float _592 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = _592 * _578;
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[116].x, _596);
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _606;
    out.m_57.y = _608;
    out.m_57.z = _610;
    out.m_57.w = _612;
    bool _614 = !_574;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_110);
        float _638 = 1.0 / _636;
        float _640 = _144 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _646 = int(_644);
    float _648 = in.m_53.x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _642 + _650;
    float _654 = in.m_53.y;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _662 = int(_660);
    float _664 = in.m_59.x;
    float _666 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _668 = in.m_53.w;
    float _670 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _666);
    float _672 = float(_646);
    float _674 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _676 = int(_674);
    float _678 = in.m_53.z;
    float _680 = in.m_59.y;
    float _682 = 1.0 / _672;
    float _684 = float(_662);
    float _686 = _648 + _654;
    bool _688 = _654 > 0.5;
    float _690 = float(uint(_676));
    float _692 = 1.0 / _684;
    int _694 = ~_676;
    int _696 = _694 + 1;
    bool _698 = _668 > 0.5;
    float _700 = _668;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_658)
    {
        _700 = _648;
    }
    float _704 = _700;
    float _706 = _682 * _144;
    float _708 = 1.0 / _690;
    float _710 = _704;
    float _712 = _680;
    if (!_658)
    {
        _710 = _678;
    }
    float _714 = _710;
    int _716 = ~_676;
    int _718 = _716 + 1;
    float _720 = trunc(_706);
    int _722 = int(_720);
    float _724 = _692 * _144;
    float _726 = _692;
    if (_658)
    {
        _726 = _648;
    }
    float _728 = _726;
    float _730 = _728;
    if (!_658)
    {
        _730 = _654;
    }
    float _732 = _730;
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _736 = int(_734);
    int _738 = as_type<int>(_708) + (-2);
    float _740 = _708;
    if (_658)
    {
        _740 = 1.0;
    }
    float _742 = _740;
    float _744 = _742;
    if (!_658)
    {
        _744 = 1.2345600128173828125;
    }
    float _746 = _744;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _750 = int(_748);
    float _752 = float(uint(_722));
    float _754 = _732 * _746;
    float _756 = as_type<float>(_738) * _752;
    float _758 = float(uint(_736));
    float _760 = trunc(_724);
    int _762 = int(_760);
    int _764 = ~_736;
    int _766 = _764 + 1;
    float _768 = float(_750);
    float _770 = 1.0 / _758;
    float _772 = trunc(_756);
    float _774 = precise::max(_772, 0.0);
    uint _777 = uint(_774);
    float _779 = float(uint(_762));
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _787 = _785 != 0;
    float _789 = 1.0 / _768;
    int _791 = as_type<int>(_770) + (-2);
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _795 = _793 != 0;
    int _797 = _696 * int(_777);
    int _799 = _797 + _722;
    float _801 = _768;
    float _803 = _752;
    float _805 = _770;
    bool _807 = _795;
    if (_658)
    {
        _801 = 1.0;
    }
    float _809 = _801;
    float _811 = as_type<float>(_791) * _779;
    float _813 = _809;
    if (!_658)
    {
        _813 = 7.345489978790283203125;
    }
    float _815 = _813;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _819 = int(_817);
    float _821 = _815;
    if (!_783)
    {
        _803 = _664;
    }
    float _823 = _803;
    float _825 = _815 * _648;
    float _827 = _823;
    if (_658)
    {
        _821 = 1.0;
    }
    float _829 = _821;
    float _831 = _789 * _144;
    float _833 = _829;
    if (!_783)
    {
        _805 = _823;
    }
    float _835 = _805;
    float _837 = trunc(_811);
    float _839 = precise::max(_837, 0.0);
    uint _841 = uint(_839);
    float _843 = _835;
    if (!_658)
    {
        _833 = 5.839270114898681640625;
    }
    float _845 = _833;
    if (_783)
    {
        _827 = _664;
    }
    float _847 = _827;
    float _849 = float(uint(_799));
    float _851 = _714 * _845;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _855 = _853 != 0;
    float _857 = floor(_825);
    float _859 = float(uint(_819));
    float _861 = as_type<float>(_738) * _849;
    float _863 = -_680;
    float _865 = _863 + 1.0;
    int _867 = ~_819;
    int _869 = _867 + 1;
    float _871 = trunc(_861);
    float _873 = precise::max(_871, 0.0);
    uint _875 = uint(_873);
    int _877 = _766 * int(_841);
    int _879 = _877 + _762;
    int _881 = _688 ? as_type<int>(_865) : as_type<int>(_680);
    int _883 = _698 ? as_type<int>(_865) : as_type<int>(_680);
    float _885 = float(uint(_879));
    float _887 = -_857;
    float _889 = _825 + _887;
    float _891 = float(_676);
    float _893 = floor(_851);
    float _895 = _787 ? as_type<float>(_881) : _680;
    float _897 = _795 ? as_type<float>(_883) : _680;
    float _899 = _889 * _891;
    float _901 = as_type<float>(_791) * _885;
    int _903 = int(_777) + int(_875);
    int _905 = as_type<int>(_889);
    float _907 = _847;
    float _909 = as_type<float>(_869);
    if (_783)
    {
        float _911 = -_847;
        float _913 = _911 + 1.0;
        _905 = as_type<int>(_913);
    }
    int _915 = _905;
    float _917 = float(_722);
    float _919 = 1.0 / _859;
    bool _921 = _678 > 0.5;
    int _923 = _718 * _903;
    int _925 = _923 + _722;
    float _927 = as_type<float>(_915);
    if (_783)
    {
        bool _929 = _648 > 0.5;
        _807 = _929;
    }
    bool _931 = _807;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _935 = _933 != 0;
    bool _937 = _917 >= _891;
    bool _939 = isnan(_917);
    bool _941 = _937 || _939;
    bool _943 = isnan(_891);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = trunc(_831);
    int _951 = int(_949);
    if (_855)
    {
        float _953 = _921 ? _865 : _680;
        _712 = _953;
    }
    float _955 = _712;
    if (_783)
    {
        float _957 = _931 ? as_type<float>(_915) : _847;
        _843 = _957;
    }
    float _959 = _843;
    bool _961 = !_935;
    int _963 = _961 ? 0 : 1;
    bool _965 = uint(_925) >= uint(_676);
    float _967 = trunc(_901);
    float _969 = precise::max(_967, 0.0);
    uint _971 = uint(_969);
    int _973 = abs(_963);
    float _975 = -_893;
    float _977 = _851 + _975;
    bool _979 = !_965;
    int _981 = _979 ? 0 : (-1);
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _985 = _983 != 0;
    int _987 = ~_903;
    int _989 = _987 + _981;
    int _991 = _989 + 1;
    float _993 = trunc(_899);
    int _995 = int(_993);
    float _997 = float(_110);
    int _999 = as_type<int>(_919) + (-2);
    int _1001 = _676 * _991;
    int _1003 = _1001 + _722;
    float _1005 = float(uint(_951));
    bool _1007 = _676 == 0;
    float _1009 = trunc(_947);
    int _1011 = int(_1009);
    int _1013 = int(_841) + int(_971);
    float _1015 = as_type<float>(_999) * _1005;
    int _1017 = ~_736;
    int _1019 = _1017 + 1;
    int _1021 = 0;
    if (_985)
    {
        float _1023 = -_847;
        float _1025 = _1023 + 1.0;
        _1021 = as_type<int>(_1025);
    }
    int _1027 = _1021;
    bool _1029 = !_1007;
    int _1031 = _1029 ? _1003 : (-1);
    if (!_985)
    {
        _927 = _847;
    }
    float _1033 = _927;
    float _1035 = floor(_754);
    int _1037 = _995 * _973;
    int _1039 = _1037 + _722;
    int _1041 = _1019 * _1013;
    int _1043 = _1041 + _762;
    float _1045 = _1033;
    if (_985)
    {
        float _1047 = _921 ? as_type<float>(_1027) : _847;
        _1045 = _1047;
    }
    float _1049 = _1045;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1053 = _1051 != 0;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1061 = _1059 != 0;
    int _1063 = ~_1011;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    float _1069 = 1.0 / _997;
    bool _1071 = uint(_1043) >= uint(_736);
    float _1073 = float(_762);
    int _1075 = _1031 * _1067;
    bool _1077 = !_1057;
    int _1079 = _1077 ? 0 : 1;
    float _1081 = -_1035;
    float _1083 = _754 + _1081;
    int _1085 = _676 + (-1);
    float _1087 = trunc(_1015);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = float(_736);
    int _1095 = abs(_1079);
    int _1097 = _1011 * _1085;
    int _1099 = _1097 + _1075;
    bool _1101 = !_1071;
    int _1103 = _1101 ? 0 : (-1);
    float _1105 = _1093 * _1083;
    bool _1107 = _1073 >= _1093;
    bool _1109 = isnan(_1073);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(_1093);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    int _1119 = ~_1013;
    int _1121 = _1119 + _1103;
    int _1123 = _1121 + 1;
    float _1125 = _891 * _144;
    float _1127 = trunc(_1117);
    int _1129 = int(_1127);
    int _1131 = ~_819;
    int _1133 = _1131 + 1;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1137 = _1135 != 0;
    int _1139 = _736 * _1123;
    int _1141 = _1139 + _762;
    int _1143 = _1099 * _1095;
    bool _1145 = !_1137;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = trunc(_1105);
    int _1151 = int(_1149);
    float _1153 = _1125 * _1069;
    int _1155 = _1133 * int(_1091);
    int _1157 = _1155 + _951;
    bool _1159 = !_1053;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1061;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = float(uint(_1157));
    float _1169 = trunc(_1153);
    int _1171 = int(_1169);
    int _1173 = abs(_1147);
    int _1175 = abs(_1161);
    float _1177 = as_type<float>(_999) * _1167;
    int _1179 = abs(_1165);
    bool _1181 = _736 == 0;
    int _1183 = _1151 * _1173;
    int _1185 = _1183 + _762;
    float _1187 = trunc(_1177);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1195 = _1193 != 0;
    int _1197 = ~_1129;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    bool _1203 = !_1181;
    int _1205 = _1203 ? _1141 : (-1);
    int _1207 = _1171 * _1175;
    int _1209 = _1207 + _1143;
    bool _1211 = !_1195;
    int _1213 = _1211 ? 0 : 1;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1217 = _1215 != 0;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1221 = _1219 != 0;
    int _1223 = _1039 * _1179;
    int _1225 = _1223 + _1209;
    float _1227 = _1069 * _144;
    int _1229 = _1201 * _1205;
    int _1231 = _736 + (-1);
    int _1233 = abs(_1213);
    float _1235 = _1093 * _1227;
    int _1237 = int(_1091) + int(_1191);
    int _1239 = _1129 * _1231;
    int _1241 = _1239 + _1229;
    bool _1243 = !_1221;
    int _1245 = _1243 ? 0 : 1;
    int _1247 = _995 * _1233;
    int _1249 = _1247 + _1225;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1235);
    int _1261 = int(_1259);
    int _1263 = abs(_1245);
    float _1265 = float(uint(_1249));
    int _1267 = ~_819;
    int _1269 = _1267 + 1;
    int _1271 = _1241 * _1263;
    bool _1273 = !_1217;
    int _1275 = _1273 ? 0 : 1;
    float _1277 = as_type<float>(_738) * _1265;
    float _1279 = float(_819);
    int _1281 = _1269 * _1237;
    int _1283 = _1281 + _951;
    float _1285 = float(_951);
    int _1287 = abs(_1275);
    float _1289 = trunc(_1277);
    float _1291 = precise::max(_1289, 0.0);
    uint _1293 = uint(_1291);
    bool _1295 = !_1253;
    int _1297 = _1295 ? 0 : 1;
    bool _1299 = _1285 >= _1279;
    bool _1301 = isnan(_1285);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(_1279);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    int _1311 = _1261 * _1287;
    int _1313 = _1311 + _1271;
    int _1315 = abs(_1297);
    bool _1317 = uint(_1283) >= uint(_819);
    float _1319 = _1279 * _1227;
    float _1321 = trunc(_1309);
    int _1323 = int(_1321);
    float _1325 = _1279 * _977;
    bool _1327 = !_1317;
    int _1329 = _1327 ? 0 : (-1);
    int _1331 = ~_676;
    int _1333 = _1331 + 1;
    int _1335 = ~_1237;
    int _1337 = _1335 + _1329;
    int _1339 = _1337 + 1;
    int _1341 = _1185 * _1315;
    int _1343 = _1341 + _1313;
    bool _1345 = !_1257;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = trunc(_1319);
    int _1351 = int(_1349);
    int _1353 = _819 * _1339;
    int _1355 = _1353 + _951;
    bool _1357 = _819 == 0;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1361 = _1359 != 0;
    int _1363 = abs(_1347);
    int _1365 = _1333 * int(_1293);
    int _1367 = _1365 + _1249;
    int _1369 = ~_1323;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    bool _1375 = !_1357;
    int _1377 = _1375 ? _1355 : (-1);
    int _1379 = _1151 * _1363;
    int _1381 = _1379 + _1343;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1385 = _1383 != 0;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1389 = _1387 != 0;
    float _1391 = float(uint(_1367));
    int _1393 = _1373 * _1377;
    int _1395 = _819 + (-1);
    float _1397 = trunc(_1325);
    int _1399 = int(_1397);
    bool _1401 = !_1361;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = as_type<float>(_738) * _1391;
    bool _1407 = !_1389;
    int _1409 = _1407 ? 0 : 1;
    int _1411 = _1323 * _1395;
    int _1413 = _1411 + _1393;
    int _1415 = abs(_1403);
    int _1417 = abs(_1409);
    float _1419 = trunc(_1405);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    float _1425 = float(uint(_1381));
    int _1427 = _1413 * _1417;
    float _1429 = float(uint(_1039));
    float _1431 = as_type<float>(_791) * _1425;
    bool _1433 = !_1385;
    int _1435 = _1433 ? 0 : 1;
    int _1437 = _1399 * _1415;
    int _1439 = _1437 + _951;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1443 = _1441 != 0;
    float _1445 = trunc(_1431);
    float _1447 = precise::max(_1445, 0.0);
    uint _1449 = uint(_1447);
    float _1451 = as_type<float>(_738) * _1429;
    int _1453 = abs(_1435);
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1457 = _1455 != 0;
    float _1459 = trunc(_1451);
    float _1461 = precise::max(_1459, 0.0);
    uint _1463 = uint(_1461);
    int _1465 = ~_736;
    int _1467 = _1465 + 1;
    int _1469 = int(_1293) + int(_1423);
    int _1471 = _1351 * _1453;
    int _1473 = _1471 + _1427;
    bool _1475 = !_1443;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1481 = _1479 != 0;
    int _1483 = _1467 * int(_1449);
    int _1485 = _1483 + _1381;
    float _1487 = float(uint(_1185));
    int _1489 = int(_1423);
    if (_1457)
    {
        float _1491 = -_847;
        float _1493 = _1491 + 1.0;
        _1489 = as_type<int>(_1493);
    }
    int _1495 = _1489;
    int _1497 = abs(_1477);
    int _1499 = ~_676;
    int _1501 = _1499 + 1;
    float _1503 = as_type<float>(_791) * _1487;
    bool _1505 = !_1481;
    int _1507 = _1505 ? 0 : 1;
    int _1509 = _1439 * _1497;
    int _1511 = _1509 + _1473;
    float _1513 = float(uint(_1485));
    int _1515 = ~_676;
    int _1517 = _1515 + 1;
    float _1519 = trunc(_1503);
    float _1521 = precise::max(_1519, 0.0);
    uint _1523 = uint(_1521);
    int _1525 = abs(_1507);
    int _1527 = _1501 * int(_1463);
    int _1529 = _1527 + _1039;
    float _1531 = as_type<float>(_791) * _1513;
    int _1533 = _1517 * _1469;
    int _1535 = _1533 + _1249;
    float _1537 = float(uint(_1529));
    bool _1539 = uint(_1535) >= uint(_676);
    float _1541 = trunc(_1531);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    int _1547 = _1399 * _1525;
    int _1549 = _1547 + _1511;
    float _1551 = as_type<float>(_738) * _1537;
    int _1553 = ~_736;
    int _1555 = _1553 + 1;
    bool _1557 = !_1539;
    int _1559 = _1557 ? 0 : (-1);
    float _1561 = trunc(_1551);
    float _1563 = precise::max(_1561, 0.0);
    uint _1565 = uint(_1563);
    float _1567 = float(uint(_1549));
    int _1569 = ~_1469;
    int _1571 = _1569 + _1559;
    int _1573 = _1571 + 1;
    int _1575 = _1555 * int(_1523);
    int _1577 = _1575 + _1185;
    bool _1579 = _676 == 0;
    float _1581 = as_type<float>(_999) * _1567;
    int _1583 = ~_736;
    int _1585 = _1583 + 1;
    int _1587 = _676 * _1573;
    int _1589 = _1587 + _1249;
    bool _1591 = _654 > 0.5;
    float _1593 = float(uint(_1577));
    float _1595 = trunc(_1581);
    float _1597 = precise::max(_1595, 0.0);
    uint _1599 = uint(_1597);
    bool _1601 = !_1579;
    int _1603 = _1601 ? _1589 : (-1);
    int _1605 = int(_1449) + int(_1545);
    float _1607 = as_type<float>(_791) * _1593;
    if (_1457)
    {
        float _1609 = _1591 ? as_type<float>(_1495) : _847;
        _907 = _1609;
    }
    float _1611 = _907;
    int _1613 = _1603 & 3;
    bool _1615 = _1613 != 0;
    int _1617 = _1585 * _1605;
    int _1619 = _1617 + _1381;
    int _1621 = _1603 & 3;
    bool _1623 = _1621 != 0;
    int _1625 = _1615 ? 0 : 1;
    bool _1627 = uint(_1621) >= 2u;
    bool _1629 = uint(_1619) >= uint(_736);
    int _1631 = ~_819;
    int _1633 = _1631 + 1;
    int _1635 = _1627 ? 0 : 1;
    bool _1637 = uint(_1621) > 1u;
    int _1639 = _1633 * int(_1599);
    int _1641 = _1639 + _1549;
    bool _1643 = !_1629;
    int _1645 = _1643 ? 0 : (-1);
    int _1647 = int(_1463) + int(_1565);
    int _1649 = ~_676;
    int _1651 = _1649 + 1;
    float _1653 = trunc(_1607);
    float _1655 = precise::max(_1653, 0.0);
    uint _1657 = uint(_1655);
    int _1659 = ~_1605;
    int _1661 = _1659 + _1645;
    int _1663 = _1661 + 1;
    bool _1665 = _1621 != 3;
    int _1667 = _1651 * _1647;
    int _1669 = _1667 + _1039;
    float _1671 = float(uint(_1641));
    int _1673 = _736 * _1663;
    int _1675 = _1673 + _1381;
    int _1677 = ~_1625;
    int _1679 = _1677 + 1;
    int _1681 = _1679 + 1;
    int _1683 = _1681;
    if (!_1637)
    {
        int _1685 = ~_1625;
        int _1687 = _1685 + 1;
        _1683 = _1687;
    }
    int _1689 = _1683;
    float _1691 = as_type<float>(_999) * _1671;
    bool _1693 = uint(_1669) >= uint(_676);
    bool _1695 = !_1181;
    int _1697 = _1695 ? _1675 : (-1);
    float _1699 = trunc(_1691);
    float _1701 = precise::max(_1699, 0.0);
    uint _1703 = uint(_1701);
    int _1705 = ~_1635;
    int _1707 = _1705 + 1;
    int _1709 = _1707 + 1;
    bool _1711 = !_1693;
    int _1713 = _1711 ? 0 : (-1);
    int _1715 = _1709;
    if (_1665)
    {
        int _1717 = ~_1635;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    int _1723 = _1697 & 3;
    bool _1725 = _1723 != 0;
    float _1727 = in.m_46.x;
    float _1729 = in.m_46.y;
    float _1731 = in.m_46.z;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1735 = _1733 != 0;
    int _1737 = _1725 ? 0 : 1;
    bool _1739 = !_1735;
    int _1741 = _1739 ? 0 : 1;
    bool _1743 = uint(_1723) >= 2u;
    bool _1745 = _1723 != 3;
    int _1747 = _1743 ? 0 : 1;
    bool _1749 = uint(_1723) > 1u;
    int _1751 = int(_1523) + int(_1657);
    int _1753 = int(_1599) + int(_1703);
    int _1755 = ~_819;
    int _1757 = _1755 + 1;
    int _1759 = ~_1747;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (_1745)
    {
        int _1767 = ~_1747;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = _1757 * _1753;
    int _1775 = _1773 + _1549;
    float _1777 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1779 = ~_1737;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _1787 = _1783;
    if (!_1749)
    {
        int _1789 = ~_1737;
        int _1791 = _1789 + 1;
        _1787 = _1791;
    }
    int _1793 = _1787;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1797 = uint(_1775) >= uint(_819);
    float _1799 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1801 = ~_736;
    int _1803 = _1801 + 1;
    float _1805 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1785);
    float _1807 = fma(_1799, -2.0, _1795);
    float _1809 = float(uint(_1439));
    int _1811 = _1803 * _1751;
    int _1813 = _1811 + _1185;
    float _1815 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1805);
    bool _1817 = !_1797;
    int _1819 = _1817 ? 0 : (-1);
    float _1821 = as_type<float>(_999) * _1809;
    bool _1823 = uint(_1813) >= uint(_736);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1831 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1833 = !_1823;
    int _1835 = _1833 ? 0 : (-1);
    float _1837 = trunc(_1821);
    float _1839 = precise::max(_1837, 0.0);
    uint _1841 = uint(_1839);
    int _1843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1845 = _1843 != 0;
    float _1847 = -_1829;
    float _1849 = fma(_1831, 2.0, _1847);
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1853 = _1851 != 0;
    float _1855 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1857 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _1859 = ~_1647;
    int _1861 = _1859 + _1713;
    int _1863 = _1861 + 1;
    float _1865 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1777);
    float _1867 = 1.0 / _1827;
    int _1869 = ~_1753;
    int _1871 = _1869 + _1819;
    int _1873 = _1871 + 1;
    float _1875 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1855);
    float _1877 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1857);
    int _1879 = _676 * _1863;
    int _1881 = _1879 + _1039;
    int _1883 = ~_1751;
    int _1885 = _1883 + _1835;
    int _1887 = _1885 + 1;
    int _1889 = _819 * _1873;
    int _1891 = _1889 + _1549;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1895 = _1893 != 0;
    float _1897 = _686 + (-1.0);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1899;
    int _1903 = _869 * int(_1841);
    int _1905 = _1903 + _1439;
    bool _1907 = !_1357;
    int _1909 = _1907 ? _1891 : (-1);
    int _1911 = _736 * _1887;
    int _1913 = _1911 + _1185;
    bool _1915 = !_1845;
    int _1917 = _1915 ? 0 : 1;
    float _1919 = _648 * 2.0;
    float _1921 = _1901 * _1867;
    float _1923 = float(uint(_1905));
    float _1925 = _654 * 2.0;
    int _1927 = _1909 & 3;
    bool _1929 = _1927 != 0;
    float _1931 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1933 = as_type<float>(_999) * _1923;
    bool _1935 = !_1181;
    int _1937 = _1935 ? _1913 : (-1);
    float _1939 = floor(_1919);
    bool _1941 = _1927 != 3;
    float _1943 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _1945 = _1873;
    if (_1895)
    {
        _702 = 0;
    }
    int _1947 = _702;
    float _1949 = fma(_1921, _652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1951 = _1947;
    if (_1895)
    {
        _1945 = 0;
    }
    int _1953 = _1945;
    float _1955 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1943);
    int _1957 = _1953;
    if (!_1895)
    {
        _1951 = 1;
    }
    int _1959 = _1951;
    float _1961 = trunc(_1933);
    float _1963 = precise::max(_1961, 0.0);
    uint _1965 = uint(_1963);
    if (!_1895)
    {
        _1957 = 2;
    }
    int _1967 = _1957;
    float _1969 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1877);
    bool _1971 = uint(_1927) >= 2u;
    float _1973 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1875);
    bool _1975 = !_1579;
    int _1977 = _1975 ? _1881 : (-1);
    float _1979 = _1969 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    bool _1981 = uint(_1927) > 1u;
    float _1983 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1865);
    int _1985 = _1971 ? 0 : 1;
    float _1987 = -_144;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1849);
    int _1991 = int(_1357);
    int _1993 = _1853 ? 2 : 0;
    int _1995 = _1991 | _1993;
    int _1997 = _1623 ? 4 : 0;
    int _1999 = _1995 | _1997;
    int _2001 = _1929 ? 8 : 0;
    int _2003 = _1999 | _2001;
    int _2005 = _1971 ? 16 : 0;
    int _2007 = _2003 | _2005;
    int _2009 = _1981 ? 32 : 0;
    int _2011 = _2007 | _2009;
    int _2013 = _1941 ? 64 : 0;
    int _2015 = _2011 | _2013;
    int _2017 = _2015 & 32;
    float _2019 = _1983 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _2021 = ~_1985;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    int _2027 = _2025;
    float _2029 = as_type<float>(_2017);
    float _2031 = _1983;
    if (_1941)
    {
        int _2033 = ~_1985;
        int _2035 = _2033 + 1;
        _2027 = _2035;
    }
    int _2037 = _2027;
    bool _2039 = _2017 != 0;
    bool _2041 = !_1853;
    int _2043 = _2041 ? 0 : 1;
    bool _2045 = _1939 > 0.0;
    float _2047 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _2049 = _1939 >= 0.0;
    bool _2051 = isnan(_1939);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan(0.0);
    bool _2057 = _2053 || _2055;
    int _2059 = _1929 ? 0 : 1;
    float _2061 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2047);
    int _2063 = int(_1841) + int(_1965);
    int _2065 = ~_819;
    int _2067 = _2065 + 1;
    int _2069 = ~_2059;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    int _2075 = _2073;
    if (!_2039)
    {
        int _2077 = ~_2059;
        int _2079 = _2077 + 1;
        _2075 = _2079;
    }
    int _2081 = _2075;
    int _2083 = _2067 * _2063;
    int _2085 = _2083 + _1439;
    bool _2087 = _1959 != 1;
    int _2089 = _1909 & 3;
    bool _2091 = _2089 != 0;
    float _2093 = floor(_1925);
    bool _2095 = _1621 != 3;
    bool _2097 = !_2091;
    int _2099 = _2097 ? 0 : 1;
    bool _2101 = uint(_2085) >= uint(_819);
    float _2103 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _670);
    float _2105 = _678 * 2.0;
    bool _2107 = !_1623;
    int _2109 = _2107 ? 0 : 1;
    float _2111 = floor(_2105);
    int _2113 = _1697 & 3;
    bool _2115 = _2113 != 0;
    float _2117 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1955);
    bool _2119 = !_2101;
    int _2121 = _2119 ? 0 : (-1);
    int _2123 = _2057 ? 0 : 1;
    float _2125 = (*spvDescriptorSet0.vp_c10)._m0[18].z;
    if (!_2087)
    {
        _2029 = _654;
    }
    float _2127 = _2029;
    float _2129 = sqrt(_2103);
    bool _2131 = !_2115;
    int _2133 = _2131 ? 0 : 1;
    bool _2135 = !_2095;
    int _2137 = _2135 ? 0 : (-1);
    bool _2139 = _1723 != 3;
    bool _2141 = _1927 != 3;
    bool _2143 = _2093 > 0.0;
    bool _2145 = _2093 >= 0.0;
    bool _2147 = isnan(_2093);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2093;
    float _2157 = _2127;
    if (!_2087)
    {
        _2125 = _678;
    }
    float _2159 = _2125;
    float _2161 = _2159;
    if (!_2087)
    {
        _909 = _2127;
    }
    float _2163 = _909;
    float _2165 = _2163;
    if (!_2087)
    {
        _2155 = _678;
    }
    float _2167 = _2155;
    float _2169 = _2167;
    if (_2087)
    {
        _2165 = _648;
    }
    float _2171 = _2165;
    if (_2087)
    {
        _2157 = _648;
    }
    float _2173 = _2157;
    if (_2087)
    {
        _2161 = _654;
    }
    float _2175 = _2161;
    float _2177 = _2171 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2087)
    {
        _2169 = _654;
    }
    float _2179 = _2169;
    bool _2181 = !_2139;
    int _2183 = _2181 ? 0 : (-1);
    bool _2185 = !_2141;
    int _2187 = _2185 ? 0 : (-1);
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2191 = _2189 != 0;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2195 = _2193 != 0;
    int _2197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2199 = _2197 != 0;
    int _2201 = ~_2123;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = sqrt(_2117);
    int _2209 = _2205;
    if (!_2045)
    {
        int _2211 = ~_2123;
        int _2213 = _2211 + 1;
        _2209 = _2213;
    }
    int _2215 = _2209;
    float _2217 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2061);
    bool _2219 = !_2195;
    int _2221 = _2219 ? 0 : 1;
    bool _2223 = _2111 > 0.0;
    bool _2225 = _2111 >= 0.0;
    bool _2227 = isnan(_2111);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(0.0);
    bool _2233 = _2229 || _2231;
    bool _2235 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2237 = isnan(_642);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    bool _2247 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2249 = isnan(_642);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    int _2259 = _2233 ? 0 : 1;
    float _2261 = -_2245;
    float _2263 = _2261 + 1.0;
    bool _2265 = _1967 != 2;
    float _2267 = _2207 * _1979;
    float _2269 = _2257 * _2263;
    float _2271 = -_2257;
    float _2273 = _2271 + 1.0;
    float _2275 = sqrt(_2217);
    int _2277 = abs(_2221);
    float _2279 = _1949 * _2269;
    float _2281 = _1973 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2283 = _1909 >> 31;
    float _2285 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2287 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2279);
    float _2289 = _2129 * _2281;
    int _2291 = ~_2259;
    int _2293 = _2291 + 1;
    int _2295 = _2293 + 1;
    float _2297 = fma(_2173, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2285);
    int _2299 = _2295;
    if (!_2223)
    {
        int _2301 = ~_2259;
        int _2303 = _2301 + 1;
        _2299 = _2303;
    }
    int _2305 = _2299;
    float _2307 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_2265)
    {
        _2031 = _648;
    }
    float _2309 = _2031;
    float _2311 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2287);
    float _2313 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2307);
    float _2315 = _2309;
    if (!_2265)
    {
        _2315 = _678;
    }
    float _2317 = _2315;
    float _2319 = _2275 * _2019;
    float _2321 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2325 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2313);
    int _2331 = _1603 >> 31;
    float _2333 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2321);
    float _2335 = -_2323;
    float _2337 = fma(_2327, 2.0, _2335);
    int _2339 = _1697 >> 31;
    float _2341 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    int _2343 = _2331 & 3;
    float _2345 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2333);
    int _2347 = _2339 & 3;
    float _2349 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2341);
    int _2351 = _1603 + _2343;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2355 = _1697 + _2347;
    float _2357 = -_144;
    float _2359 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2337);
    int _2361 = _2351 >> 2;
    int _2363 = _2283 & 3;
    int _2365 = _2355 >> 2;
    int _2367 = _2361 << 4;
    int _2369 = _2367 + 368;
    int _2371 = _1909 + _2363;
    int _2373 = _2365 << 4;
    int _2375 = _2373 + 512;
    uint _2377 = uint(int(uint(_2369) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    int _2393 = _2371 >> 2;
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    uint _2397 = uint(int(uint(_2375) >> uint(2)));
    uint _2399 = uint(int(uint(int(_2397)) >> uint(2)));
    int _2401 = int(_2397) & 3;
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[int(_2399)][_2401];
    int _2405 = int(_2397) + 1;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    int _2409 = _2405 & 3;
    float _2411 = (*spvDescriptorSet0.vp_c9)._m0[int(_2407)][_2409];
    int _2413 = _2393 << 4;
    int _2415 = _2413 + 656;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2419 = abs(_1689);
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2423 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2427 = uint(int(uint(_2415) >> uint(2)));
    uint _2429 = uint(int(uint(int(_2427)) >> uint(2)));
    int _2431 = int(_2427) & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = int(_2427) + 1;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    int _2439 = _2435 & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    float _2443 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2445 = _2311 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2451 = _1815 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _2453 = float(_2215);
    out.m_61.x = _2423;
    out.m_61.y = _2443;
    out.m_61.z = _2425;
    out.m_61.w = _2445;
    float _2455 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2447);
    float _2457 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2329);
    int _2459 = _2369 + 8;
    uint _2461 = uint(int(uint(_2459) >> uint(2)));
    uint _2463 = uint(int(uint(int(_2461)) >> uint(2)));
    int _2465 = int(_2461) & 3;
    float _2467 = (*spvDescriptorSet0.vp_c9)._m0[int(_2463)][_2465];
    int _2469 = int(_2461) + 1;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    int _2473 = _2469 & 3;
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[int(_2471)][_2473];
    int _2477 = ~_2063;
    int _2479 = _2477 + _2121;
    int _2481 = _2479 + 1;
    float _2483 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2455);
    int _2485 = abs(_1793);
    int _2487 = ~_2419;
    int _2489 = _2487 + 1;
    int _2491 = _2489 + 1;
    int _2493 = _819 * _2481;
    int _2495 = _2493 + _1439;
    int _2497 = ~_2485;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2505 = int(_2503);
    int _2507 = abs(_2099);
    int _2509 = _2375 + 8;
    uint _2511 = uint(int(uint(_2509) >> uint(2)));
    uint _2513 = uint(int(uint(int(_2511)) >> uint(2)));
    int _2515 = int(_2511) & 3;
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[int(_2513)][_2515];
    int _2519 = int(_2511) + 1;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    int _2523 = _2519 & 3;
    float _2525 = (*spvDescriptorSet0.vp_c9)._m0[int(_2521)][_2523];
    float _2527 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2529 = float(_2277);
    float _2531 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2349);
    int _2533 = abs(_1721);
    float _2535 = fma(_2527, -2.0, _2353);
    int _2537 = abs(_2187);
    float _2539 = _2529 * _2453;
    int _2541 = abs(_2081);
    int _2543 = _2415 + 8;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    uint _2547 = uint(int(uint(int(_2545)) >> uint(2)));
    int _2549 = int(_2545) & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    int _2553 = int(_2545) + 1;
    uint _2555 = uint(int(uint(_2553) >> uint(2)));
    int _2557 = _2553 & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = ~_2533;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2491 * as_type<int>(_2391);
    int _2569 = abs(_2109);
    float _2571 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2573 = int(_2571);
    int _2575 = ~_2541;
    int _2577 = _2575 + 1;
    int _2579 = _2577 + 1;
    float _2581 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2345);
    int _2583 = ~_2569;
    int _2585 = _2583 + 1;
    int _2587 = _2585 + 1;
    float _2589 = -_2449;
    float _2591 = fma(_2177, 2.0, _2589);
    int _2593 = abs(_1771);
    int _2595 = _2501 * as_type<int>(_2411);
    int _2597 = abs(_2133);
    int _2599 = _2587 * as_type<int>(_2383);
    int _2601 = _2599 + _2567;
    int _2603 = ~_2507;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    float _2609 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2611 = int(_2609);
    int _2613 = ~_2597;
    int _2615 = _2613 + 1;
    int _2617 = _2615 + 1;
    float _2619 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2535);
    int _2621 = _2579 * as_type<int>(_2441);
    bool _2623 = !_1357;
    int _2625 = _2623 ? _2495 : (-1);
    int _2627 = _2617 * as_type<int>(_2403);
    int _2629 = _2627 + _2595;
    int _2631 = ~_2593;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    int _2637 = _2607 * as_type<int>(_2433);
    int _2639 = _2637 + _2621;
    int _2641 = abs(_2037);
    float _2643 = float(uint(_2505));
    int _2645 = ~_2641;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2565 * as_type<int>(_2467);
    int _2653 = _2651 + _2601;
    int _2655 = abs(_1741);
    int _2657 = abs(_2183);
    float _2659 = 1.0 / _2643;
    int _2661 = abs(_1917);
    int _2663 = abs(_2043);
    float _2665 = float(uint(_2611));
    int _2667 = _2635 * as_type<int>(_2517);
    int _2669 = _2667 + _2629;
    int _2671 = abs(_2137);
    float _2673 = float(uint(_2573));
    float _2675 = 1.0 / _2665;
    int _2677 = ~_2671;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2649 * as_type<int>(_2551);
    int _2685 = _2683 + _2639;
    int _2687 = _2681 * as_type<int>(_2475);
    int _2689 = _2687 + _2653;
    int _2691 = ~_2657;
    int _2693 = _2691 + 1;
    int _2695 = _2693 + 1;
    float _2697 = 1.0 / _2673;
    int _2699 = ~_2655;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    int _2705 = abs(_2505);
    int _2707 = _2695 * as_type<int>(_2525);
    int _2709 = _2707 + _2669;
    int _2711 = abs(_2573);
    int _2713 = _2689 * _2703;
    int _2715 = ~_2661;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    int _2721 = _1977 * _2655;
    int _2723 = _2721 + _2713;
    int _2725 = _2719 * _2709;
    int _2727 = ~_2537;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    float _2733 = float(uint(_2705));
    int _2735 = _1937 * _2661;
    int _2737 = _2735 + _2725;
    float _2739 = float(uint(_2711));
    int _2741 = _2731 * as_type<int>(_2559);
    int _2743 = _2741 + _2685;
    int _2745 = as_type<int>(_2659) + (-2);
    float _2747 = float(uint(_2723));
    float _2749 = 1.0 / _2733;
    int _2751 = ~_2663;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = abs(_2611);
    float _2759 = as_type<float>(_2745) * _2747;
    int _2761 = as_type<int>(_2697) + (-2);
    int _2763 = _2755 * _2743;
    float _2765 = float(uint(_2757));
    float _2767 = 1.0 / _2739;
    float _2769 = float(uint(_2737));
    int _2771 = _2625 * _2663;
    int _2773 = _2771 + _2763;
    int _2775 = ~_2505;
    int _2777 = _2775 + 1;
    int _2779 = ~_2573;
    int _2781 = _2779 + 1;
    float _2783 = as_type<float>(_2761) * _2769;
    float _2785 = trunc(_2759);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    int _2791 = as_type<int>(_2675) + (-2);
    float _2793 = float(uint(_2773));
    int _2795 = abs(_2723);
    float _2797 = 1.0 / _2765;
    int _2799 = as_type<int>(_2749) + (-2);
    float _2801 = as_type<float>(_2791) * _2793;
    int _2803 = as_type<int>(_2767) + (-2);
    float _2805 = float(uint(_2795));
    bool _2807 = !_2191;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = trunc(_2783);
    float _2813 = precise::max(_2811, 0.0);
    uint _2815 = uint(_2813);
    int _2817 = abs(_2737);
    float _2819 = as_type<float>(_2799) * _2805;
    int _2821 = abs(_2773);
    int _2823 = abs(_2809);
    int _2825 = _2777 * int(_2789);
    int _2827 = _2825 + _2723;
    float _2829 = float(uint(_2817));
    float _2831 = trunc(_2801);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = as_type<int>(_2797) + (-2);
    float _2839 = float(uint(_2821));
    float _2841 = as_type<float>(_2803) * _2829;
    float _2843 = float(uint(_2827));
    float _2845 = _2531 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2847 = float(_2305);
    float _2849 = as_type<float>(_2837) * _2839;
    int _2851 = _2781 * int(_2815);
    int _2853 = _2851 + _2737;
    float _2855 = trunc(_2819);
    float _2857 = precise::max(_2855, 0.0);
    uint _2859 = uint(_2857);
    float _2861 = float(_2823);
    float _2863 = as_type<float>(_2745) * _2843;
    int _2865 = ~_2611;
    int _2867 = _2865 + 1;
    float _2869 = _2581 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2871 = float(uint(_2853));
    float _2873 = _2861 * _2847;
    int _2875 = ~_2711;
    int _2877 = _2875 + 1;
    float _2879 = trunc(_2841);
    float _2881 = precise::max(_2879, 0.0);
    uint _2883 = uint(_2881);
    int _2885 = _2867 * int(_2835);
    int _2887 = _2885 + _2773;
    float _2889 = as_type<float>(_2761) * _2871;
    float _2891 = _2457 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2895 = _2869 + _2893;
    int _2897 = ~_2757;
    int _2899 = _2897 + 1;
    float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2903 = _2845 + _2901;
    int _2905 = ~_2705;
    int _2907 = _2905 + 1;
    float _2909 = trunc(_2849);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    float _2915 = float(uint(_2887));
    float _2917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2919 = _2891 + _2917;
    float _2921 = _2895 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2923 = _2907 * int(_2859);
    int _2925 = _2923 + _2795;
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2921);
    float _2929 = trunc(_2863);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = as_type<float>(_2791) * _2915;
    int _2937 = _2877 * int(_2883);
    int _2939 = _2937 + _2817;
    float _2941 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2927);
    float _2943 = float(uint(_2925));
    int _2945 = ~_2573;
    int _2947 = _2945 + 1;
    int _2949 = _2899 * int(_2913);
    int _2951 = _2949 + _2821;
    float _2953 = trunc(_2889);
    float _2955 = precise::max(_2953, 0.0);
    uint _2957 = uint(_2955);
    float _2959 = float(uint(_2939));
    float _2961 = as_type<float>(_2799) * _2943;
    bool _2963 = _2941 >= 0.0;
    float _2965 = float(uint(_2951));
    int _2967 = int(_2789) + int(_2933);
    float _2969 = as_type<float>(_2803) * _2959;
    float _2971 = trunc(_2935);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    float _2977 = as_type<float>(_2837) * _2965;
    float _2979 = as_type<float>(_2799);
    float _2981 = _2591;
    float _2983 = as_type<float>(_2951);
    if (_2265)
    {
        _2979 = _654;
    }
    float _2985 = _2979;
    float _2987 = _2985;
    if (!_2265)
    {
        _2987 = _648;
    }
    float _2989 = _2987;
    int _2991 = as_type<int>(_2989);
    if (_2963)
    {
        out.m_49.x = 0.0;
    }
    float _2993 = trunc(_2961);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    int _2999 = int(_2815) + int(_2957);
    float _3001 = as_type<float>(_2957);
    if (_2963)
    {
        _3001 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3003 = _3001;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3007 = ~_2505;
    int _3009 = _3007 + 1;
    int _3011 = _2947 * _2999;
    int _3013 = _3011 + _2737;
    float _3015 = trunc(_2969);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    float _3021 = _2989 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2963)
    {
        float _3023 = _3003 * 5.0;
        _2991 = as_type<int>(_3023);
    }
    int _3025 = _2991;
    int _3027 = _3009 * _2967;
    int _3029 = _3027 + _2723;
    int _3031 = int(_2835) + int(_2975);
    float _3033 = fma(_3021, -2.0, _3005);
    int _3035 = ~_2711;
    int _3037 = _3035 + 1;
    if (_2963)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9333 = as_type<float>(_3025);
        out.gl_Position.z = _9333;
    }
    float _3039 = trunc(_2977);
    float _3041 = precise::max(_3039, 0.0);
    uint _3043 = uint(_3041);
    int _3045 = int(_2859) + int(_2997);
    int _3047 = ~_2705;
    int _3049 = _3047 + 1;
    int _3051 = ~_2611;
    int _3053 = _3051 + 1;
    bool _3055 = uint(_3029) >= uint(_2505);
    int _3057 = int(_2883) + int(_3019);
    int _3059 = _3053 * _3031;
    int _3061 = _3059 + _2773;
    bool _3063 = uint(_3013) >= uint(_2573);
    int _3065 = _3049 * _3045;
    int _3067 = _3065 + _2795;
    bool _3069 = !_3055;
    int _3071 = _3069 ? 0 : (-1);
    int _3073 = _3037 * _3057;
    int _3075 = _3073 + _2817;
    int _3077 = ~_2757;
    int _3079 = _3077 + 1;
    int _3081 = int(_2913) + int(_3043);
    int _3083 = ~_2967;
    int _3085 = _3083 + _3071;
    int _3087 = _3085 + 1;
    bool _3089 = !_3063;
    int _3091 = _3089 ? 0 : (-1);
    int _3093 = _3079 * _3081;
    int _3095 = _3093 + _2821;
    bool _3097 = uint(_3061) >= uint(_2611);
    int _3099 = _2505 * _3087;
    int _3101 = _3099 + _2723;
    bool _3103 = uint(_3067) >= uint(_2705);
    float _3105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3107 = ~_2999;
    int _3109 = _3107 + _3091;
    int _3111 = _3109 + 1;
    bool _3113 = !_3103;
    int _3115 = _3113 ? 0 : (-1);
    bool _3117 = !_3097;
    int _3119 = _3117 ? 0 : (-1);
    bool _3121 = _2505 == 0;
    bool _3123 = uint(_3075) >= uint(_2711);
    int _3125 = _2573 * _3111;
    int _3127 = _3125 + _2737;
    bool _3129 = _2505 == 0;
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3133 = _2723 ^ _2505;
    int _3135 = ~_3031;
    int _3137 = _3135 + _3119;
    int _3139 = _3137 + 1;
    bool _3141 = !_3121;
    int _3143 = _3141 ? _3101 : (-1);
    bool _3145 = !_3123;
    int _3147 = _3145 ? 0 : (-1);
    float _3149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3151 = _2573 == 0;
    bool _3153 = uint(_3095) >= uint(_2757);
    int _3155 = _2611 * _3139;
    int _3157 = _3155 + _2773;
    bool _3159 = !_3151;
    int _3161 = _3159 ? _3127 : (-1);
    bool _3163 = !_3153;
    int _3165 = _3163 ? 0 : (-1);
    bool _3167 = _2611 == 0;
    bool _3169 = _2573 == 0;
    int _3171 = _2737 ^ _2573;
    int _3173 = _2773 ^ _2611;
    float _3175 = _3105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3177 = float(_3143);
    float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3181 = !_3167;
    int _3183 = _3181 ? _3157 : (-1);
    float _3185 = fma(_3175, _959, -0.5);
    int _3187 = ~_3115;
    int _3189 = _3045 + _3187;
    int _3191 = _3189 + 1;
    float _3193 = fma(_3175, _3177, _1989);
    bool _3195 = _2611 == 0;
    float _3197 = _3149 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3199 = float(_3161);
    float _3201 = -_144;
    float _3203 = fma(_3201, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2591);
    float _3205 = float(_3183);
    float _3207 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3209 = uint(int(uint(_3133) >> uint(31)));
    float _3211 = fma(_3197, _3199, _3203);
    float _3213 = fma(_3197, _1049, -0.5);
    float _3215 = fma(_3207, _1611, -0.5);
    float _3217 = fma(_3207, _3205, _2359);
    float _3219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3221 = ~int(_3209);
    int _3223 = _3221 + 1;
    float _3225 = _3179 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _3227 = uint(int(uint(_3171) >> uint(31)));
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3231 = _3191 ^ _3223;
    float _3233 = fma(_895, _3225, -0.5);
    int _3235 = ~_3147;
    int _3237 = _3057 + _3235;
    int _3239 = _3237 + 1;
    float _3241 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3229);
    int _3243 = ~int(_3227);
    int _3245 = _3243 + 1;
    float _3247 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2297);
    int _3249 = ~_3223;
    int _3251 = _3249 + _3231;
    int _3253 = _3251 + 1;
    float _3255 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3241);
    uint _3257 = uint(int(uint(_3173) >> uint(31)));
    float _3259 = fma(_3247, _3213, _3211);
    int _3261 = _3239 ^ _3245;
    float _3263 = fma(_3255, _3185, _3193);
    bool _3265 = !_3129;
    int _3267 = _3265 ? _3253 : (-1);
    float _3269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3271 = ~_3165;
    int _3273 = _3081 + _3271;
    int _3275 = _3273 + 1;
    float _3277 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1807);
    int _3279 = ~int(_3257);
    int _3281 = _3279 + 1;
    float _3283 = _3219 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3285 = ~_3245;
    int _3287 = _3285 + _3261;
    int _3289 = _3287 + 1;
    float _3291 = _3263 + 0.5;
    float _3293 = float(_3267);
    float _3295 = fma(_897, _3283, -0.5);
    int _3297 = _3275 ^ _3281;
    float _3299 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3301 = log2(_3299);
    float _3303 = -_3277;
    float _3305 = fma(_3225, _3293, _3303);
    bool _3307 = !_3169;
    int _3309 = _3307 ? _3289 : (-1);
    float _3311 = _3259 + 0.5;
    int _3313 = ~_3281;
    int _3315 = _3313 + _3297;
    int _3317 = _3315 + 1;
    float _3319 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3321 = float(_3309);
    float _3323 = _3269 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3325 = !_3195;
    int _3327 = _3325 ? _3317 : (-1);
    float _3329 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3319);
    float _3331 = -_2619;
    float _3333 = fma(_3283, _3321, _3331);
    float _3335 = float(_3327);
    float _3337 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3033);
    float _3339 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3329);
    float _3341 = fma(_3323, _955, -0.5);
    float _3343 = -_3337;
    float _3345 = fma(_3323, _3335, _3343);
    float _3347 = fma(_2483, _3295, _3333);
    float _3349 = fma(_3339, _3233, _3305);
    float _3351 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3353 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3355 = _2895 * _2895;
    float _3357 = _3301 * _144;
    float _3359 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3351);
    float _3361 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3353);
    float _3363 = fma(_2919, _2919, _3355);
    float _3365 = exp2(_3357);
    float _3367 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3359);
    float _3369 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3361);
    float _3371 = fma(_2903, _2903, _3363);
    float _3373 = _3349 + 0.5;
    float _3375 = fma(_3367, _3215, _3217);
    float _3377 = fma(_3369, _3341, _3345);
    float _3379 = _3347 + 0.5;
    float _3381 = _3375 + 0.5;
    float _3383 = _3377 + 0.5;
    float _3385 = rsqrt(_3371);
    float _3387 = in.m_63.x;
    float _3389 = in.m_63.y;
    float _3391 = in.m_63.z;
    float _3393 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3395 = 1.0 + _3393;
    bool _3397 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3399 = isnan(0.0);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3405 = _3401 || _3403;
    float _3407 = -_3365;
    float _3409 = _3407 + 1.0;
    out.m_65.x = _3291;
    out.m_65.y = _3373;
    out.m_65.z = _3311;
    out.m_65.w = _3379;
    bool _3411 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3413 = isnan(1.0);
    bool _3415 = _3411 || _3413;
    bool _3417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3419 = _3415 || _3417;
    float _3421 = 1.0 / _3395;
    out.m_67.x = _3381;
    out.m_67.y = _3383;
    float _3423 = _3405 ? _3409 : 0.0;
    float _3425 = _2895 * _3385;
    float _3427 = _2919 * _3385;
    bool _3429 = !_2199;
    int _3431 = _3429 ? 0 : 1;
    if (_2963)
    {
        return out;
    }
    float _3433 = -_3425;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2869);
    float _3437 = _2873 * (-2.0);
    float _3439 = _2903 * _3385;
    float _3441 = -_3427;
    float _3443 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2891);
    float _3445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3447 = _3435 + _3445;
    float _3449 = fma(_1931, _3437, _1931);
    float _3451 = -_3439;
    float _3453 = fma(_3451, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2845);
    float _3455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3457 = _3443 + _3455;
    float _3459 = _3447 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3461 = _3439;
    float _3463 = _3457;
    if (_3419)
    {
        float _3465 = _3423 * _3421;
        _148 = _3465;
    }
    float _3467 = _148;
    float _3469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3471 = _3453 + _3469;
    float _3473 = fma(_3437, _3387, _3387);
    float _3475 = fma(_3457, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3459);
    float _3477 = _648 + (-0.5);
    float _3479 = _654 + _678;
    float _3481 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3475);
    float _3483 = fma(_3477, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3473);
    float _3485 = _3479 + (-1.0);
    float _3487 = _654 + (-0.5);
    int _3489 = _2153 ? 0 : 1;
    float _3491 = fma(_3449, _3467, _3483);
    bool _3493 = _3481 >= 0.0;
    float _3495 = _2539 * (-2.0);
    float _3497 = fma(_3485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _3499 = ~_3489;
    int _3501 = _3499 + 1;
    int _3503 = _3501 + 1;
    float _3505 = _3491 * 0.15915493667125701904296875;
    float _3507 = fma(_3495, _3389, _3389);
    float _3509 = fma(_3497, _3495, _3497);
    int _3511 = _3503;
    float _3513 = _3507;
    if (!_2143)
    {
        int _3515 = ~_3489;
        int _3517 = _3515 + 1;
        _3511 = _3517;
    }
    int _3519 = _3511;
    float _3521 = _3505 * 6.283185482025146484375;
    float _3523 = sin(_3521);
    float _3525 = fma(_3487, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3507);
    int _3527 = abs(_3431);
    float _3529 = _648 + _678;
    float _3531 = float(_3519);
    float _3533 = fma(_3509, _3467, _3525);
    if (_3493)
    {
        out.m_49.x = 0.0;
    }
    if (_3493)
    {
        _3513 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3535 = _3513;
    float _3537 = _3533 * 0.15915493667125701904296875;
    float _3539 = _3505 * 6.283185482025146484375;
    float _3541 = cos(_3539);
    float _3543 = float(_3527);
    int _3545 = as_type<int>(_3535);
    if (_3493)
    {
        float _3547 = _3535 * 5.0;
        _3545 = as_type<int>(_3547);
    }
    int _3549 = _3545;
    float _3551 = _3529 + (-1.0);
    float _3553 = _3543 * _3531;
    float _3555 = _3537 * 6.283185482025146484375;
    float _3557 = sin(_3555);
    if (_3493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10128 = as_type<float>(_3549);
        out.gl_Position.z = _10128;
    }
    float _3559 = _3553 * (-2.0);
    if (_3493)
    {
        return out;
    }
    float _3561 = -_2869;
    float _3563 = _3561 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3565 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3567 = -_2891;
    float _3569 = _3567 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3571 = -_2845;
    float _3573 = _3571 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3575 = _3563 * _3563;
    float _3577 = fma(_3559, _3391, _3391);
    float _3579 = _678 + (-0.5);
    float _3581 = fma(_3565, _3559, _3565);
    float _3583 = fma(_3569, _3569, _3575);
    float _3585 = -_3425;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2895);
    float _3589 = fma(_3579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3577);
    float _3591 = -_3427;
    float _3593 = fma(_3591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2919);
    float _3595 = fma(_3573, _3573, _3583);
    float _3597 = _3587 * _3587;
    float _3599 = fma(_3581, _3467, _3589);
    float _3601 = _3537 * 6.283185482025146484375;
    float _3603 = cos(_3601);
    float _3605 = -_3439;
    float _3607 = fma(_3605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2903);
    float _3609 = fma(_3593, _3593, _3597);
    float _3611 = _3599 * 0.15915493667125701904296875;
    float _3613 = in.m_69.x;
    float _3615 = in.m_69.y;
    float _3617 = in.m_69.z;
    float _3619 = _3523 * _3557;
    float _3621 = fma(_3607, _3607, _3609);
    float _3623 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3625 = rsqrt(_3595);
    float _3627 = _3611 * 6.283185482025146484375;
    float _3629 = sin(_3627);
    float _3631 = _3541 * _3603;
    float _3633 = _3523 * _3603;
    float _3635 = _3569 * _3625;
    float _3637 = _3573 * _3625;
    float _3639 = _3563 * _3625;
    float _3641 = sqrt(_3621);
    float _3643 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3645 = _3635 * _3643;
    float _3647 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3649 = _3637 * _3647;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3653 = _3639 * _3651;
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3657 = -_3645;
    float _3659 = fma(_3637, _3655, _3657);
    float _3661 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3663 = -_3649;
    float _3665 = fma(_3639, _3661, _3663);
    float _3667 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3669 = -_3653;
    float _3671 = fma(_3635, _3667, _3669);
    float _3673 = fma(_3629, _3631, _3619);
    float _3675 = _3659 * _3659;
    float _3677 = fma(_3629, _3619, _3631);
    float _3679 = _3611 * 6.283185482025146484375;
    float _3681 = cos(_3679);
    float _3683 = fma(_3665, _3665, _3675);
    float _3685 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _3687 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3689 = isnan(0.5);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3695 = _3691 || _3693;
    float _3697 = _3385 * _3641;
    float _3699 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3615);
    float _3703 = _3541 * _3557;
    float _3705 = _3697 * _3623;
    float _3707 = fma(_3671, _3671, _3683);
    float _3709 = _3697 * _3699;
    float _3711 = -_3703;
    float _3713 = fma(_3629, _3633, _3711);
    float _3715 = -_3633;
    float _3717 = fma(_3629, _3703, _3715);
    float _3719 = rsqrt(_3707);
    float _3721 = _3701 * _3709;
    float _3723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3617);
    float _3725 = _3603 * _3681;
    float _3727 = _3541 * _3681;
    float _3729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3613);
    float _3731 = _3523 * _3681;
    float _3733 = _3557 * _3681;
    float _3735 = _3697 * _3685;
    float _3737 = _3729 * _3705;
    float _3739 = _3727 * _3721;
    float _3741 = _3723 * _3735;
    float _3743 = -_3721;
    float _3745 = _3629 * _3743;
    float _3747 = fma(_3673, _3737, _3739);
    float _3749 = _3731 * _3721;
    float _3751 = _3665 * _3719;
    float _3753 = _3659 * _3719;
    float _3755 = _3671 * _3719;
    float _3757 = fma(_3725, _3737, _3745);
    float _3759 = _3639 * _3751;
    float _3761 = fma(_3717, _3741, _3747);
    float _3763 = _3637 * _3753;
    float _3765 = fma(_3713, _3737, _3749);
    float _3767 = -_3759;
    float _3769 = fma(_3635, _3753, _3767);
    float _3771 = fma(_3733, _3741, _3757);
    float _3773 = -_3763;
    float _3775 = fma(_3639, _3755, _3773);
    float _3777 = fma(_3677, _3741, _3765);
    float _3779 = _3769 * _3761;
    float _3781 = _3775 * _3761;
    float _3783 = fma(_3755, _3771, _3779);
    float _3785 = fma(_3751, _3771, _3781);
    float _3787 = fma(_3637, _3777, _3783);
    float _3789 = fma(_3635, _3777, _3785);
    float _3791 = _2845 + _3787;
    float _3793 = _2891 + _3789;
    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3797 = _3791 + _3795;
    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3801 = _3793 + _3799;
    float _3803 = _3797 * _3797;
    float _3805 = fma(_3801, _3801, _3803);
    float _3807 = _3635 * _3755;
    float _3809 = sqrt(_3805);
    float _3811 = -_3807;
    float _3813 = fma(_3637, _3751, _3811);
    float _3815 = _3813 * _3761;
    float _3817 = fma(_3753, _3771, _3815);
    float _3819 = fma(_3639, _3777, _3817);
    bool _3821 = _3809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3823 = _2869 + _3819;
    float _3825 = _3819;
    float _3827 = _3807;
    float _3829 = _3777;
    float _3831 = _3809;
    if (!_3821)
    {
        _3825 = _3793;
    }
    float _3833 = _3825;
    float _3835 = _3833;
    if (!_3821)
    {
        _3827 = _3791;
    }
    float _3837 = _3827;
    float _3839 = _3837;
    if (!_3821)
    {
        _3829 = _3823;
    }
    float _3841 = _3829;
    bool _3843 = !_3821;
    float _3845 = _3841;
    if (!_3843)
    {
        float _3847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3851 = _3809 + _3849;
        float _3853 = rsqrt(_3805);
        float _3855 = _3851 * _3847;
        float _3857 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3859 = _3855 * 0.15915493667125701904296875;
        float _3861 = _3859 * 6.283185482025146484375;
        float _3863 = cos(_3861);
        float _3865 = _3859 * 6.283185482025146484375;
        float _3867 = sin(_3865);
        float _3869 = _3863 + (-1.0);
        float _3871 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3873 = fma(_3867, _3857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3875 = fma(_3823, _3863, _3871);
        float _3877 = _3853 * _3873;
        float _3879 = fma(_3801, _3877, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3881 = fma(_3797, _3877, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3845 = _3875;
        _3839 = _3881;
        _3835 = _3879;
        _3831 = _3871;
    }
    float _3883 = _3845;
    float _3885 = _3839;
    float _3887 = _3835;
    float _3889 = _3831;
    float _3891 = -_3425;
    float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3883);
    float _3895 = -_3439;
    float _3897 = fma(_3895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3885);
    float _3899 = -_3427;
    float _3901 = fma(_3899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3887);
    float _3903 = _3901;
    float _3905 = _3897;
    float _3907 = _3889;
    if (_3695)
    {
        _3461 = _3893;
    }
    float _3909 = _3461;
    float _3911 = _3909;
    if (!_3695)
    {
        float _3913 = _3447 * _3447;
        float _3915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3917 = -_2845;
        float _3919 = _3917 + _3885;
        float _3921 = -_2891;
        float _3923 = _3921 + _3887;
        float _3925 = fma(_3457, _3457, _3913);
        float _3927 = -_2869;
        float _3929 = _3927 + _3883;
        float _3931 = fma(_3471, _3471, _3925);
        float _3933 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3935 = sqrt(_3931);
        float _3937 = 1.0 / _3697;
        float _3939 = _3933 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3941 = precise::min(_3935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3943 = _3941 * _3915;
        float _3945 = _3943 * _3937;
        float _3947 = _3939 * _3945;
        float _3949 = _3919 * _3945;
        float _3951 = fma(_3923, _3947, _3443);
        float _3953 = fma(_3929, _3947, _3435);
        float _3955 = fma(_3939, _3949, _3453);
        _3911 = _3953;
        _3903 = _3951;
        _3905 = _3955;
        _3463 = _3935;
    }
    float _3957 = _3911;
    float _3959 = _3903;
    float _3961 = _3905;
    float _3963 = _3463;
    float _3965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3967 = _3957 + _3965;
    float _3969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3971 = _3959 + _3969;
    float _3973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3975 = _3961 + _3973;
    float _3977 = _3967 * _3967;
    float _3979 = fma(_3971, _3971, _3977);
    float _3981 = fma(_3975, _3975, _3979);
    float _3983 = rsqrt(_3981);
    float _3985 = sqrt(_3981);
    float _3987 = _3983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3989 = _3971 * _3987;
    float _3991 = _3975 * _3987;
    float _3993 = _3989 * _3989;
    float _3995 = _3991 * _3991;
    float _3997 = _3993 + _3995;
    float _3999 = sqrt(_3997);
    bool _4001 = _3999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4005 = _3999 + _4003;
    float _4007 = _3975;
    float _4009 = _3997;
    float _4011 = _4005;
    float _4013 = _3967;
    float _4015 = _3963;
    if (_4001)
    {
        float _4017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4007 = _4017;
    }
    float _4019 = _4007;
    if (_4001)
    {
        float _4021 = rsqrt(_3997);
        _4009 = _4021;
    }
    float _4023 = _4009;
    float _4025 = _4023;
    if (_4001)
    {
        float _4027 = _4005 * _4019;
        _4011 = _4027;
    }
    float _4029 = _4011;
    if (_4001)
    {
        float _4031 = _4029 * 0.15915493667125701904296875;
        _3907 = _4031;
    }
    float _4033 = _3907;
    float _4035 = _3977;
    float _4037 = _4033;
    if (_4001)
    {
        float _4039 = _4033 * 6.283185482025146484375;
        float _4041 = sin(_4039);
        _4035 = _4041;
    }
    float _4043 = _4035;
    float _4045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4047 = precise::max(0.0, _4045);
    float _4049 = _3983;
    float _4051 = _4045;
    float _4053 = _4047;
    if (_4001)
    {
        float _4055 = _4033 * 6.283185482025146484375;
        float _4057 = cos(_4055);
        _4049 = _4057;
    }
    float _4059 = _4049;
    float _4061 = -_3987;
    float _4063 = -_4047;
    float _4065 = fma(_3967, _4061, _4063);
    if (_4001)
    {
        float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4051 = _4067;
    }
    float _4069 = _4051;
    float _4071 = _4069;
    if (!_4001)
    {
        _4037 = _3989;
    }
    float _4073 = _4037;
    float _4075 = _4043;
    float _4077 = _4073;
    if (_4001)
    {
        float _4079 = fma(_4043, _4069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4071 = _4079;
    }
    float _4081 = _4071;
    if (!_4001)
    {
        _4075 = _4065;
    }
    float _4083 = _4075;
    float _4085 = _4083;
    float _4087 = _4059;
    if (_4001)
    {
        float _4089 = _4059 + (-1.0);
        _4013 = _4089;
    }
    float _4091 = _4013;
    float _4093 = _4091;
    if (_4001)
    {
        float _4095 = _4023 * _4081;
        _4015 = _4095;
    }
    float _4097 = _4015;
    if (!_4001)
    {
        _4025 = _3995;
    }
    float _4099 = _4025;
    float _4101 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4103 = _4099;
    if (_4001)
    {
        float _4105 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4053 = _4105;
    }
    float _4107 = _4053;
    if (_4001)
    {
        float _4109 = _3989 * _4097;
        _4077 = _4109;
    }
    float _4111 = _4077;
    if (!_4001)
    {
        _4093 = _3991;
    }
    float _4113 = _4093;
    float _4115 = _4113;
    if (_4001)
    {
        float _4117 = _3991 * _4097;
        _4115 = _4117;
    }
    float _4119 = _4115;
    if (_4001)
    {
        float _4121 = fma(_4065, _4059, _4107);
        _4085 = _4121;
    }
    float _4123 = _4085;
    if (!_4001)
    {
        _4087 = _3993;
    }
    float _4125 = _4087;
    float _4127 = _4125;
    if (_4001)
    {
        float _4129 = _4111 * _4111;
        _4127 = _4129;
    }
    float _4131 = _4127;
    if (_4001)
    {
        float _4133 = _4119 * _4119;
        _4103 = _4133;
    }
    float _4135 = _4103;
    float _4137 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4101);
    float _4139 = fma(_4123, _4123, _4131);
    float _4141 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4143 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4137);
    float _4145 = _4139 + _4135;
    float _4147 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4141);
    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4151 = fma(_3985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4149);
    float _4153 = precise::clamp(_4151, 0.0, 1.0);
    float _4155 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4157 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4147);
    float _4159 = rsqrt(_4145);
    float _4161 = -_4153;
    float _4163 = _4161 + 1.0;
    float _4165 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4167 = _4157 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4169 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4171 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4155);
    float _4173 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4175 = abs(_4163);
    float _4177 = log2(_4175);
    float _4179 = _4143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4181 = fma(_3443, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4183 = -_4173;
    float _4185 = fma(_4183, _4165, 1.0);
    float _4187 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4189 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4171);
    float _4191 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4187);
    float _4193 = _4159 * _4111;
    float _4195 = floor(_4181);
    float _4197 = _4189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4199 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4191);
    float _4201 = _4159 * _4123;
    float _4203 = _4159 * _4119;
    float _4205 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4207 = _4199 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4209 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4211 = floor(_4169);
    float _4213 = -_4205;
    float _4215 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4213);
    float _4217 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4219 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4209);
    float _4221 = -_4203;
    float _4223 = fma(_4221, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4215);
    float _4225 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4219);
    float _4227 = -_4195;
    float _4229 = _4181 + _4227;
    float _4231 = fma(_4223, -0.5, 0.5);
    float _4233 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4225);
    float _4235 = fma(_4223, 0.5, 0.5);
    float _4237 = exp2(_4217);
    float _4239 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4241 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4243 = fma(_4235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4245 = -_4211;
    float _4247 = _4169 + _4245;
    float _4249 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4239);
    float _4251 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4241);
    float _4253 = fma(_4235, _4243, -0.212114393711090087890625);
    float _4255 = log2(_4185);
    float _4257 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4249);
    float _4259 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4251);
    float _4261 = 1.0 / _4233;
    float _4263 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4257);
    float _4265 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4259);
    float2 _11269 = float2(_4229, _4247);
    float _4267 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11269, float2(0.0), isnan(_11269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11269, float2(0.0), isnan(_11269)), level(0.0)).x;
    float _4269 = fma(_4235, _4253, 1.570728778839111328125);
    float _4271 = sqrt(_4231);
    float _4273 = _4255 * 0.693147182464599609375;
    float _4275 = _4263 * _4261;
    float _4277 = _4201 + 1.0;
    float _4279 = fma(_4275, 0.5, 0.5);
    float _4281 = -_4201;
    float _4283 = fma(_4237, _4277, _4281);
    float _4285 = _4265 * _4261;
    float _4287 = _4273 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4289 = _4271 * 0.636619746685028076171875;
    float _4291 = fma(_4283, 0.5, 0.5);
    float _4293 = fma(_4285, -0.5, 0.5);
    float _4295 = -_4269;
    float _4297 = fma(_4289, _4295, 1.0);
    float3 _11321 = float3(_4279, _4293, _4287);
    float _4299 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11321, float3(0.0), isnan(_11321)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11321, float3(0.0), isnan(_11321)), level(0.0)).x;
    float3 _11332 = float3(_4279, _4293, _4287);
    float4 _4302 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11332, float3(0.0), isnan(_11332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11332, float3(0.0), isnan(_11332)), level(0.0)).xyzw;
    float _4304 = _4302.x;
    float _4306 = _4302.y;
    float _4308 = _4302.z;
    float _4310 = _4302.w;
    float2 _11348 = float2(_4297, _4291);
    float3 _4314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11348, float2(0.0), isnan(_11348)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11348, float2(0.0), isnan(_11348)), level(0.0)).xyz;
    float _4316 = _4314.x;
    float _4318 = _4314.y;
    float _4320 = _4314.z;
    float _4322 = _3435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4324 = _3435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4326 = _3615 != 0.0;
    bool _4328 = isnan(_3615);
    bool _4330 = _4326 || _4328;
    bool _4332 = isnan(0.0);
    bool _4334 = _4330 || _4332;
    float _4336 = _3727 * _3769;
    float _4338 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4322);
    float _4340 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4324);
    bool _4342 = _3613 == 0.0;
    bool _4344 = !_4334;
    bool _4346 = _4342 && _4344;
    float _4348 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4350 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4338);
    float _4352 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4340);
    float _4354 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4356 = _4350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4358 = _4352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4360 = _3617 == 0.0;
    bool _4362 = _4360 && _4346;
    float _4364 = exp2(_4348);
    float _4366 = _4358 + _4356;
    float _4368 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4354);
    float _4370 = 1.0 / _4356;
    float _4372 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4368);
    float _4374 = -_4364;
    float _4376 = _4374 + 1.0;
    float _4378 = in.m_71.x;
    float _4380 = in.m_71.y;
    float _4382 = in.m_71.z;
    float _4384 = in.m_71.w;
    float _4386 = _4376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4388 = _4366 * _4370;
    float _4390 = _4388 * 0.5;
    float _4392 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4394 = fma(_4390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4392);
    float _4396 = in.m_73.x;
    float _4398 = in.m_73.y;
    float _4400 = in.m_73.z;
    float _4402 = 1.0 / _4394;
    float _4404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4406 = _4402 * _4404;
    float _4408 = abs(_4406);
    float _4410 = log2(_4408);
    float _4412 = _4402;
    float _4414 = _4396;
    float _4416 = _4233;
    float _4418 = _4265;
    if (_4362)
    {
        _2981 = _4398;
    }
    float _4420 = _2981;
    float _4422 = _4420;
    if (_4362)
    {
        _2983 = _4396;
    }
    float _4424 = _2983;
    float _4426 = _4424;
    if (_4362)
    {
        _4412 = _4420;
    }
    float _4428 = _4412;
    float _4430 = _4428;
    if (!_4362)
    {
        _4422 = _4398;
    }
    float _4432 = _4422;
    if (!_4362)
    {
        float _4434 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4432);
        _4430 = _4434;
    }
    float _4436 = _4430;
    float _4438 = _4380 * _4400;
    float _4440 = _4410 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4442 = _4410;
    if (_4362)
    {
        _4442 = _4424;
    }
    float _4444 = _4442;
    float _4446 = _4444;
    if (!_4362)
    {
        _4426 = _4396;
    }
    float _4448 = _4426;
    if (_4362)
    {
        _4414 = _4400;
    }
    float _4450 = _4414;
    float _4452 = exp2(_4440);
    float _4454 = _4450;
    if (!_4362)
    {
        float _4456 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4400);
        _4454 = _4456;
    }
    float _4458 = _4454;
    if (!_4362)
    {
        float _4460 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4448);
        _4446 = _4460;
    }
    float _4462 = _4446;
    float _4464 = _4382 * _4448;
    float _4466 = _4378 * _4432;
    float _4468 = -_4438;
    float _4470 = fma(_4382, _4432, _4468);
    bool _4472 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4474 = isnan(_3985);
    bool _4476 = _4472 || _4474;
    bool _4478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4480 = _4476 || _4478;
    float _4482 = -_4464;
    float _4484 = fma(_4378, _4400, _4482);
    float _4486 = _4470 * _4384;
    float _4488 = fma(_4452, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4490 = precise::clamp(_4488, 0.0, 1.0);
    float _4492 = -_4466;
    float _4494 = fma(_4380, _4448, _4492);
    float _4496 = _4484 * _4384;
    float _4498 = _3673 * _3775;
    float _4500 = fma(_4490, -2.0, 3.0);
    float _4502 = _4490 * _4490;
    float _4504 = _4494 * _4384;
    float _4506 = _3673 * _3813;
    float _4508 = _3673 * _3769;
    float _4510 = _3727 * _3775;
    float _4512 = _3727 * _3813;
    float _4514 = _4502 * _4500;
    float _4516 = _3717 * _3775;
    float _4518 = _3717 * _3813;
    float _4520 = _3717 * _3769;
    float _4522 = -_3629;
    float _4524 = fma(_4522, _3751, _4510);
    float _4526 = -_3629;
    float _4528 = fma(_4526, _3753, _4512);
    float _4530 = -_3629;
    float _4532 = fma(_4530, _3755, _4336);
    float _4534 = -_4514;
    float _4536 = _4534 + 1.0;
    float _4538 = fma(_3725, _3751, _4498);
    float _4540 = fma(_3725, _3753, _4506);
    float _4542 = fma(_3725, _3755, _4508);
    float _4544 = fma(_3733, _3753, _4518);
    float _4546 = fma(_4536, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4514);
    float _4548 = fma(_3713, _3635, _4538);
    float _4550 = fma(_3713, _3639, _4540);
    float _4552 = fma(_3713, _3637, _4542);
    float _4554 = fma(_3733, _3751, _4516);
    bool _4556 = _4406 <= 8000.0;
    bool _4558 = isnan(_4406);
    bool _4560 = _4556 || _4558;
    bool _4562 = isnan(8000.0);
    bool _4564 = _4560 || _4562;
    float _4566 = float(_4564);
    float _4568 = fma(_3733, _3755, _4520);
    float _4570 = fma(_3731, _3635, _4524);
    float _4572 = fma(_3731, _3639, _4528);
    float _4574 = fma(_3731, _3637, _4532);
    float _4576 = fma(_3677, _3635, _4554);
    float _4578 = _4566 * _4546;
    float _4580 = fma(_3677, _3639, _4544);
    float _4582 = fma(_3677, _3637, _4568);
    float _4584 = _4570 * _4380;
    float _4586 = _4572 * _4380;
    float _4588 = _4574 * _4380;
    float _4590 = _4574 * _4436;
    float _4592 = _4570 * _4436;
    float _4594 = _4496 * _4570;
    float _4596 = _4496 * _4574;
    float _4598 = _4572 * _4436;
    float _4600 = _4496 * _4572;
    float _4602 = fma(_4548, _4378, _4584);
    float _4604 = fma(_4548, _4462, _4592);
    float _4606 = fma(_4486, _4548, _4594);
    float _4608 = fma(_4486, _4552, _4596);
    float _4610 = fma(_4550, _4378, _4586);
    float _4612 = in.m_75.x;
    float _4614 = fma(_4550, _4462, _4598);
    float _4616 = fma(_4486, _4550, _4600);
    float _4618 = fma(_4580, _4382, _4610);
    float _4620 = fma(_4552, _4378, _4588);
    float _4622 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4372);
    float _4624 = fma(_4576, _4382, _4602);
    float _4626 = fma(_4504, _4576, _4606);
    float _4628 = fma(_4504, _4580, _4616);
    float _4630 = fma(_4504, _4582, _4608);
    float _4632 = _4622 + _4233;
    float _4634 = fma(_4582, _4382, _4620);
    float _4636 = _4578 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4638 = fma(_4552, _4462, _4590);
    float _4640 = _4632 * 0.5;
    float _4642 = fma(_4576, _4458, _4604);
    out.m_77.x = _4624;
    out.m_77.y = _4618;
    out.m_77.z = _4634;
    float _4644 = fma(_4580, _4458, _4614);
    float _4646 = fma(_4582, _4458, _4638);
    out.m_79.x = _4626;
    out.m_79.y = _4628;
    out.m_79.z = _4630;
    out.m_81.z = _4640;
    out.m_81.w = _4233;
    out.m_83.x = _4642;
    out.m_83.y = _4644;
    out.m_83.z = _4646;
    float _4648 = -_4386;
    float _4650 = _4648 + 1.0;
    out.gl_Position.x = _4263;
    out.gl_Position.y = _4265;
    out.gl_Position.z = _4622;
    out.gl_Position.w = _4233;
    float _4652 = _4630;
    float _4654 = _4628;
    float _4656 = _4263;
    float _4658 = _4650;
    if (!_4480)
    {
        _4652 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4660 = _4652;
    float _4662 = _4660;
    float _4664 = _4660;
    if (!_4480)
    {
        _4654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4666 = _4654;
    float _4668 = _4666;
    float _4670 = _4666;
    if (!_4480)
    {
        _4416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4672 = _4416;
    float _4674 = _4672;
    float _4676 = _4672;
    if (!_4480)
    {
        _4656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4678 = _4656;
    float _4680 = _4678;
    float _4682 = _4678;
    if (!_4480)
    {
        _4418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4684 = _4418;
    float _4686 = -_4267;
    float _4688 = _4686 + 1.0;
    float _4690 = _4688 * _4636;
    float _4692 = precise::clamp(_4690, 0.0, 1.0);
    float _4694 = -_4692;
    float _4696 = fma(_4694, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4698 = _4696 * _4612;
    float _4700 = _4698 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _4700;
    float _4702 = _4386 * _4299;
    float _4704 = _4310 * _4650;
    float _4706 = _4684;
    float _4708 = _4684;
    if (!_4480)
    {
        _4658 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4710 = _4658;
    float _4712 = _4310 * _4702;
    float _4714 = _4320 * _4702;
    float _4716 = fma(_4316, _4712, _4304);
    float _4718 = fma(_4318, _4712, _4306);
    float _4720 = fma(_4310, _4714, _4308);
    out.m_87.x = _4716;
    out.m_87.y = _4718;
    out.m_87.z = _4720;
    out.m_87.w = _4704;
    bool _4722 = !_4480;
    float _4724 = _4710;
    float _4726 = _4710;
    if (!_4722)
    {
        bool _4728 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4730 = isnan(_3985);
        bool _4732 = _4728 || _4730;
        bool _4734 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4736 = _4732 || _4734;
        if (!_4736)
        {
            float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4740 = _3985 + _4738;
            float _4742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4744 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4742;
            float _4746 = 1.0 / _4744;
            float _4748 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4750 = _4748 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4752 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4754 = _4752 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4756 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4760 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4762 = _4760 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4764 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4768 = _4740 * _4746;
            float _4770 = precise::clamp(_4768, 0.0, 1.0);
            float _4772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4776 = fma(_4770, _4754, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4778 = fma(_4770, _4774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4780 = fma(_4770, _4750, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4782 = fma(_4770, _4758, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4784 = fma(_4770, _4762, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4786 = fma(_4770, _4766, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4670 = _4780;
            _4682 = _4784;
            _4664 = _4778;
            _4676 = _4782;
            _4726 = _4776;
            _4708 = _4786;
            _4788 = true;
        }
        else
        {
            bool _4790 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4792 = isnan(_3985);
            bool _4794 = _4790 || _4792;
            bool _4796 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4798 = _4794 || _4796;
            if (!_4798)
            {
                _4674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4800 = _4674;
            _4676 = _4800;
            if (!_4798)
            {
                _4680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4802 = _4680;
            _4682 = _4802;
            if (!_4798)
            {
                _4706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4804 = _4706;
            _4708 = _4804;
            if (!_4798)
            {
                _4662 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4806 = _4662;
            _4664 = _4806;
            if (!_4798)
            {
                _4668 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4808 = _4668;
            _4670 = _4808;
            if (!_4798)
            {
                _4724 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4810 = _4724;
            bool _4812 = !_4798;
            _4726 = _4810;
            if (!_4812)
            {
                bool _4814 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4816 = isnan(_3985);
                bool _4818 = _4814 || _4816;
                bool _4820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4822 = _4818 || _4820;
                if (!_4822)
                {
                    float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4826 = _3985 + _4824;
                    float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4830 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4828;
                    float _4832 = 1.0 / _4830;
                    float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4842 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4854 = _4826 * _4832;
                    float _4856 = precise::clamp(_4854, 0.0, 1.0);
                    float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4860 = _4858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4862 = fma(_4856, _4840, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4864 = fma(_4856, _4860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4866 = fma(_4856, _4836, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4868 = fma(_4856, _4844, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4870 = fma(_4856, _4848, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4872 = fma(_4856, _4852, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4670 = _4866;
                    _4682 = _4870;
                    _4664 = _4864;
                    _4676 = _4868;
                    _4726 = _4862;
                    _4708 = _4872;
                    _4788 = true;
                }
                else
                {
                    _4670 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4664 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4726 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4788 = false;
    float _4874 = _4670;
    float _4876 = _4682;
    float _4878 = _4664;
    float _4880 = _4676;
    float _4882 = _4726;
    float _4884 = _4708;
    float _4886 = fma(_4644, -0.5, 0.5);
    float _4888 = precise::clamp(_4886, 0.0, 1.0);
    float _4890 = -_4874;
    float _4892 = _4876 + _4890;
    float _4894 = -_4878;
    float _4896 = _4880 + _4894;
    float _4898 = -_4882;
    float _4900 = _4884 + _4898;
    bool _4902 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4904 = fma(_4888, _4892, _4874);
    float _4906 = fma(_4888, _4896, _4878);
    float _4908 = fma(_4888, _4900, _4882);
    float _4910 = _4904 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _4912 = fma(_4906, 0.298911988735198974609375, _4910);
    float _4914 = fma(_4908, 0.114477999508380889892578125, _4912);
    out.m_89.x = 0.0;
    float _4916 = -_4914;
    float _4918 = _4906 + _4916;
    float _4920 = -_4914;
    float _4922 = _4904 + _4920;
    float _4924 = -_4914;
    float _4926 = _4908 + _4924;
    float _4928 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4930 = fma(_4918, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    float _4932 = fma(_4922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    float _4934 = fma(_4926, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    out.m_85.w = _4928;
    out.m_91.x = _4930;
    out.m_91.y = _4932;
    out.m_91.z = _4934;
    if (!_4902)
    {
        return out;
    }
    float _4936 = -_3957;
    float _4938 = _4936 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4940 = -_3959;
    float _4942 = _4940 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4944 = -_3961;
    float _4946 = _4944 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4948 = _4938 * _4938;
    float _4950 = fma(_4942, _4942, _4948);
    float _4952 = fma(_4946, _4946, _4950);
    float _4954 = sqrt(_4952);
    float _4956 = rsqrt(_4952);
    float _4958 = -_4954;
    float _4960 = _4958 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4962 = _4960 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4964 = precise::clamp(_4962, 0.0, 1.0);
    float _4966 = _4942 * _4956;
    float _4968 = _4938 * _4956;
    float _4970 = abs(_4964);
    float _4972 = log2(_4970);
    float _4974 = _4946 * _4956;
    float _4976 = _4966 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4978 = _4644 * _4968;
    float _4980 = -_4968;
    float _4982 = -_4976;
    float _4984 = fma(_4980, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4982);
    float _4986 = fma(_4642, _4966, _4978);
    float _4988 = -_4974;
    float _4990 = fma(_4988, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4984);
    float _4992 = fma(_4646, _4974, _4986);
    float _4994 = precise::clamp(_4992, 0.0, 1.0);
    float _4996 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4998 = _4990 + _4996;
    float _5000 = _4972 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5002 = _4998 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5004 = precise::clamp(_5002, 0.0, 1.0);
    float _5006 = exp2(_5000);
    float _5008 = _5006 * _5004;
    float _5010 = _4994 * _5008;
    float _5012 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5014 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5016 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _5012;
    out.m_89.y = _5014;
    out.m_89.z = _5016;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4788 = false;
    bool _634 = false;
    bool _518 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5073 = as_type<float>(_126);
        out.gl_Position.z = _5073;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5142 = as_type<float>(_164);
        out.gl_Position.z = _5142;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = 1.0 / _204;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _220;
    float _224 = 1.0 / _212;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _196 + _226;
    float _230 = 1.0 / _208;
    float _232 = _228 * _218;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _196 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = fma(_240, _232, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _246 = 1.0 / _216;
    float _248 = _236 * _224;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _196 + _262;
    bool _266 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _268 = isnan(_196);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = 1.0 / _222;
    float _280 = _200 * _230;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = _196 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _286;
    bool _290 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _292 = isnan(_196);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = fma(_288, _232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = _264 * _246;
    float _310 = -_260;
    float _312 = _310 + 1.0;
    bool _314 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_196);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _276 * _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = _300 * _304;
    float _334 = _284 * _278;
    bool _336 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_196);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = fma(_330, _232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = -_324;
    float _352 = _350 + 1.0;
    bool _354 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _356 = isnan(_196);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_300;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = _346 * _352;
    float _376 = -_346;
    float _378 = _376 + 1.0;
    float _380 = _324 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _364 * _378;
    float _392 = -_364;
    float _394 = _392 + 1.0;
    float _396 = fma(_372, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = _306 * _390;
    float _402 = _348 * _390;
    float _404 = _244 * _390;
    float _406 = fma(_388, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _408;
    float _412 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _426;
    float _430 = fma(_410, _248, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_396, _374, _412);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _434;
    float _438 = fma(_424, _308, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _440 = fma(_428, _248, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_398, _374, _414);
    float _444 = fma(_430, _380, _432);
    float _446 = fma(_436, _248, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _448 = fma(_406, _374, _416);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_440, _380, _442);
    float _456 = fma(_446, _380, _448);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = fma(_420, _308, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _468 = fma(_452, _308, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _470;
    float _474 = fma(_460, _334, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _476 = fma(_464, _334, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _478 = fma(_466, _332, _444);
    float _480 = fma(_472, _334, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _482 = fma(_438, _332, _454);
    float _484 = fma(_468, _332, _456);
    float _486 = fma(_474, _326, _478);
    float _488 = fma(_476, _326, _482);
    float _490 = fma(_480, _326, _484);
    float _492 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].x, _486);
    float _494 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].y, _488);
    float _496 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[148].z, _490);
    bool _498 = !_242;
    float _516;
    if (!_498)
    {
        float _500 = in.m_53.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_110);
        float _522 = 1.0 / _520;
        float _524 = _144 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_55.x;
    float _530 = in.m_55.y;
    float _532 = in.m_55.z;
    bool _534 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _536 = isnan(_526);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_526);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _526 + _566;
    float _570 = -_544;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _548;
    float _578 = _560 * _572;
    float _580 = -_560;
    float _582 = _580 + 1.0;
    float _584 = _496 * _532;
    float _586 = _494 * _530;
    float _588 = _564 * _576;
    float _590 = _492 * _528;
    float _592 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = _592 * _578;
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[116].x, _596);
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _606;
    out.m_57.y = _608;
    out.m_57.z = _610;
    out.m_57.w = _612;
    bool _614 = !_574;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_110);
        float _638 = 1.0 / _636;
        float _640 = _144 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _646 = int(_644);
    float _648 = in.m_53.x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _642 + _650;
    float _654 = in.m_53.y;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _658 = _656 != 0;
    float _660 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _662 = int(_660);
    float _664 = in.m_59.x;
    float _666 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _668 = in.m_53.w;
    float _670 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _666);
    float _672 = float(_646);
    float _674 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _676 = int(_674);
    float _678 = in.m_53.z;
    float _680 = in.m_59.y;
    float _682 = 1.0 / _672;
    float _684 = float(_662);
    float _686 = _648 + _654;
    bool _688 = _654 > 0.5;
    float _690 = float(uint(_676));
    float _692 = 1.0 / _684;
    int _694 = ~_676;
    int _696 = _694 + 1;
    bool _698 = _668 > 0.5;
    float _700 = _668;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_658)
    {
        _700 = _648;
    }
    float _704 = _700;
    float _706 = _682 * _144;
    float _708 = 1.0 / _690;
    float _710 = _704;
    float _712 = _680;
    if (!_658)
    {
        _710 = _678;
    }
    float _714 = _710;
    int _716 = ~_676;
    int _718 = _716 + 1;
    float _720 = trunc(_706);
    int _722 = int(_720);
    float _724 = _692 * _144;
    float _726 = _692;
    if (_658)
    {
        _726 = _648;
    }
    float _728 = _726;
    float _730 = _728;
    if (!_658)
    {
        _730 = _654;
    }
    float _732 = _730;
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _736 = int(_734);
    int _738 = as_type<int>(_708) + (-2);
    float _740 = _708;
    if (_658)
    {
        _740 = 1.0;
    }
    float _742 = _740;
    float _744 = _742;
    if (!_658)
    {
        _744 = 1.2345600128173828125;
    }
    float _746 = _744;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _750 = int(_748);
    float _752 = float(uint(_722));
    float _754 = _732 * _746;
    float _756 = as_type<float>(_738) * _752;
    float _758 = float(uint(_736));
    float _760 = trunc(_724);
    int _762 = int(_760);
    int _764 = ~_736;
    int _766 = _764 + 1;
    float _768 = float(_750);
    float _770 = 1.0 / _758;
    float _772 = trunc(_756);
    float _774 = precise::max(_772, 0.0);
    uint _777 = uint(_774);
    float _779 = float(uint(_762));
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _787 = _785 != 0;
    float _789 = 1.0 / _768;
    int _791 = as_type<int>(_770) + (-2);
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _795 = _793 != 0;
    int _797 = _696 * int(_777);
    int _799 = _797 + _722;
    float _801 = _768;
    float _803 = _752;
    float _805 = _770;
    bool _807 = _795;
    if (_658)
    {
        _801 = 1.0;
    }
    float _809 = _801;
    float _811 = as_type<float>(_791) * _779;
    float _813 = _809;
    if (!_658)
    {
        _813 = 7.345489978790283203125;
    }
    float _815 = _813;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _819 = int(_817);
    float _821 = _815;
    if (!_783)
    {
        _803 = _664;
    }
    float _823 = _803;
    float _825 = _815 * _648;
    float _827 = _823;
    if (_658)
    {
        _821 = 1.0;
    }
    float _829 = _821;
    float _831 = _789 * _144;
    float _833 = _829;
    if (!_783)
    {
        _805 = _823;
    }
    float _835 = _805;
    float _837 = trunc(_811);
    float _839 = precise::max(_837, 0.0);
    uint _841 = uint(_839);
    float _843 = _835;
    if (!_658)
    {
        _833 = 5.839270114898681640625;
    }
    float _845 = _833;
    if (_783)
    {
        _827 = _664;
    }
    float _847 = _827;
    float _849 = float(uint(_799));
    float _851 = _714 * _845;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _855 = _853 != 0;
    float _857 = floor(_825);
    float _859 = float(uint(_819));
    float _861 = as_type<float>(_738) * _849;
    float _863 = -_680;
    float _865 = _863 + 1.0;
    int _867 = ~_819;
    int _869 = _867 + 1;
    float _871 = trunc(_861);
    float _873 = precise::max(_871, 0.0);
    uint _875 = uint(_873);
    int _877 = _766 * int(_841);
    int _879 = _877 + _762;
    int _881 = _688 ? as_type<int>(_865) : as_type<int>(_680);
    int _883 = _698 ? as_type<int>(_865) : as_type<int>(_680);
    float _885 = float(uint(_879));
    float _887 = -_857;
    float _889 = _825 + _887;
    float _891 = float(_676);
    float _893 = floor(_851);
    float _895 = _787 ? as_type<float>(_881) : _680;
    float _897 = _795 ? as_type<float>(_883) : _680;
    float _899 = _889 * _891;
    float _901 = as_type<float>(_791) * _885;
    int _903 = int(_777) + int(_875);
    int _905 = as_type<int>(_889);
    float _907 = _847;
    float _909 = as_type<float>(_869);
    if (_783)
    {
        float _911 = -_847;
        float _913 = _911 + 1.0;
        _905 = as_type<int>(_913);
    }
    int _915 = _905;
    float _917 = float(_722);
    float _919 = 1.0 / _859;
    bool _921 = _678 > 0.5;
    int _923 = _718 * _903;
    int _925 = _923 + _722;
    float _927 = as_type<float>(_915);
    if (_783)
    {
        bool _929 = _648 > 0.5;
        _807 = _929;
    }
    bool _931 = _807;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _935 = _933 != 0;
    bool _937 = _917 >= _891;
    bool _939 = isnan(_917);
    bool _941 = _937 || _939;
    bool _943 = isnan(_891);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = trunc(_831);
    int _951 = int(_949);
    if (_855)
    {
        float _953 = _921 ? _865 : _680;
        _712 = _953;
    }
    float _955 = _712;
    if (_783)
    {
        float _957 = _931 ? as_type<float>(_915) : _847;
        _843 = _957;
    }
    float _959 = _843;
    bool _961 = !_935;
    int _963 = _961 ? 0 : 1;
    bool _965 = uint(_925) >= uint(_676);
    float _967 = trunc(_901);
    float _969 = precise::max(_967, 0.0);
    uint _971 = uint(_969);
    int _973 = abs(_963);
    float _975 = -_893;
    float _977 = _851 + _975;
    bool _979 = !_965;
    int _981 = _979 ? 0 : (-1);
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _985 = _983 != 0;
    int _987 = ~_903;
    int _989 = _987 + _981;
    int _991 = _989 + 1;
    float _993 = trunc(_899);
    int _995 = int(_993);
    float _997 = float(_110);
    int _999 = as_type<int>(_919) + (-2);
    int _1001 = _676 * _991;
    int _1003 = _1001 + _722;
    float _1005 = float(uint(_951));
    bool _1007 = _676 == 0;
    float _1009 = trunc(_947);
    int _1011 = int(_1009);
    int _1013 = int(_841) + int(_971);
    float _1015 = as_type<float>(_999) * _1005;
    int _1017 = ~_736;
    int _1019 = _1017 + 1;
    int _1021 = 0;
    if (_985)
    {
        float _1023 = -_847;
        float _1025 = _1023 + 1.0;
        _1021 = as_type<int>(_1025);
    }
    int _1027 = _1021;
    bool _1029 = !_1007;
    int _1031 = _1029 ? _1003 : (-1);
    if (!_985)
    {
        _927 = _847;
    }
    float _1033 = _927;
    float _1035 = floor(_754);
    int _1037 = _995 * _973;
    int _1039 = _1037 + _722;
    int _1041 = _1019 * _1013;
    int _1043 = _1041 + _762;
    float _1045 = _1033;
    if (_985)
    {
        float _1047 = _921 ? as_type<float>(_1027) : _847;
        _1045 = _1047;
    }
    float _1049 = _1045;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1053 = _1051 != 0;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1061 = _1059 != 0;
    int _1063 = ~_1011;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    float _1069 = 1.0 / _997;
    bool _1071 = uint(_1043) >= uint(_736);
    float _1073 = float(_762);
    int _1075 = _1031 * _1067;
    bool _1077 = !_1057;
    int _1079 = _1077 ? 0 : 1;
    float _1081 = -_1035;
    float _1083 = _754 + _1081;
    int _1085 = _676 + (-1);
    float _1087 = trunc(_1015);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = float(_736);
    int _1095 = abs(_1079);
    int _1097 = _1011 * _1085;
    int _1099 = _1097 + _1075;
    bool _1101 = !_1071;
    int _1103 = _1101 ? 0 : (-1);
    float _1105 = _1093 * _1083;
    bool _1107 = _1073 >= _1093;
    bool _1109 = isnan(_1073);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(_1093);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    int _1119 = ~_1013;
    int _1121 = _1119 + _1103;
    int _1123 = _1121 + 1;
    float _1125 = _891 * _144;
    float _1127 = trunc(_1117);
    int _1129 = int(_1127);
    int _1131 = ~_819;
    int _1133 = _1131 + 1;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1137 = _1135 != 0;
    int _1139 = _736 * _1123;
    int _1141 = _1139 + _762;
    int _1143 = _1099 * _1095;
    bool _1145 = !_1137;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = trunc(_1105);
    int _1151 = int(_1149);
    float _1153 = _1125 * _1069;
    int _1155 = _1133 * int(_1091);
    int _1157 = _1155 + _951;
    bool _1159 = !_1053;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1061;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = float(uint(_1157));
    float _1169 = trunc(_1153);
    int _1171 = int(_1169);
    int _1173 = abs(_1147);
    int _1175 = abs(_1161);
    float _1177 = as_type<float>(_999) * _1167;
    int _1179 = abs(_1165);
    bool _1181 = _736 == 0;
    int _1183 = _1151 * _1173;
    int _1185 = _1183 + _762;
    float _1187 = trunc(_1177);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1195 = _1193 != 0;
    int _1197 = ~_1129;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    bool _1203 = !_1181;
    int _1205 = _1203 ? _1141 : (-1);
    int _1207 = _1171 * _1175;
    int _1209 = _1207 + _1143;
    bool _1211 = !_1195;
    int _1213 = _1211 ? 0 : 1;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1217 = _1215 != 0;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1221 = _1219 != 0;
    int _1223 = _1039 * _1179;
    int _1225 = _1223 + _1209;
    float _1227 = _1069 * _144;
    int _1229 = _1201 * _1205;
    int _1231 = _736 + (-1);
    int _1233 = abs(_1213);
    float _1235 = _1093 * _1227;
    int _1237 = int(_1091) + int(_1191);
    int _1239 = _1129 * _1231;
    int _1241 = _1239 + _1229;
    bool _1243 = !_1221;
    int _1245 = _1243 ? 0 : 1;
    int _1247 = _995 * _1233;
    int _1249 = _1247 + _1225;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1235);
    int _1261 = int(_1259);
    int _1263 = abs(_1245);
    float _1265 = float(uint(_1249));
    int _1267 = ~_819;
    int _1269 = _1267 + 1;
    int _1271 = _1241 * _1263;
    bool _1273 = !_1217;
    int _1275 = _1273 ? 0 : 1;
    float _1277 = as_type<float>(_738) * _1265;
    float _1279 = float(_819);
    int _1281 = _1269 * _1237;
    int _1283 = _1281 + _951;
    float _1285 = float(_951);
    int _1287 = abs(_1275);
    float _1289 = trunc(_1277);
    float _1291 = precise::max(_1289, 0.0);
    uint _1293 = uint(_1291);
    bool _1295 = !_1253;
    int _1297 = _1295 ? 0 : 1;
    bool _1299 = _1285 >= _1279;
    bool _1301 = isnan(_1285);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(_1279);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    int _1311 = _1261 * _1287;
    int _1313 = _1311 + _1271;
    int _1315 = abs(_1297);
    bool _1317 = uint(_1283) >= uint(_819);
    float _1319 = _1279 * _1227;
    float _1321 = trunc(_1309);
    int _1323 = int(_1321);
    float _1325 = _1279 * _977;
    bool _1327 = !_1317;
    int _1329 = _1327 ? 0 : (-1);
    int _1331 = ~_676;
    int _1333 = _1331 + 1;
    int _1335 = ~_1237;
    int _1337 = _1335 + _1329;
    int _1339 = _1337 + 1;
    int _1341 = _1185 * _1315;
    int _1343 = _1341 + _1313;
    bool _1345 = !_1257;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = trunc(_1319);
    int _1351 = int(_1349);
    int _1353 = _819 * _1339;
    int _1355 = _1353 + _951;
    bool _1357 = _819 == 0;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1361 = _1359 != 0;
    int _1363 = abs(_1347);
    int _1365 = _1333 * int(_1293);
    int _1367 = _1365 + _1249;
    int _1369 = ~_1323;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    bool _1375 = !_1357;
    int _1377 = _1375 ? _1355 : (-1);
    int _1379 = _1151 * _1363;
    int _1381 = _1379 + _1343;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1385 = _1383 != 0;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1389 = _1387 != 0;
    float _1391 = float(uint(_1367));
    int _1393 = _1373 * _1377;
    int _1395 = _819 + (-1);
    float _1397 = trunc(_1325);
    int _1399 = int(_1397);
    bool _1401 = !_1361;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = as_type<float>(_738) * _1391;
    bool _1407 = !_1389;
    int _1409 = _1407 ? 0 : 1;
    int _1411 = _1323 * _1395;
    int _1413 = _1411 + _1393;
    int _1415 = abs(_1403);
    int _1417 = abs(_1409);
    float _1419 = trunc(_1405);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    float _1425 = float(uint(_1381));
    int _1427 = _1413 * _1417;
    float _1429 = float(uint(_1039));
    float _1431 = as_type<float>(_791) * _1425;
    bool _1433 = !_1385;
    int _1435 = _1433 ? 0 : 1;
    int _1437 = _1399 * _1415;
    int _1439 = _1437 + _951;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1443 = _1441 != 0;
    float _1445 = trunc(_1431);
    float _1447 = precise::max(_1445, 0.0);
    uint _1449 = uint(_1447);
    float _1451 = as_type<float>(_738) * _1429;
    int _1453 = abs(_1435);
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1457 = _1455 != 0;
    float _1459 = trunc(_1451);
    float _1461 = precise::max(_1459, 0.0);
    uint _1463 = uint(_1461);
    int _1465 = ~_736;
    int _1467 = _1465 + 1;
    int _1469 = int(_1293) + int(_1423);
    int _1471 = _1351 * _1453;
    int _1473 = _1471 + _1427;
    bool _1475 = !_1443;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1481 = _1479 != 0;
    int _1483 = _1467 * int(_1449);
    int _1485 = _1483 + _1381;
    float _1487 = float(uint(_1185));
    int _1489 = int(_1423);
    if (_1457)
    {
        float _1491 = -_847;
        float _1493 = _1491 + 1.0;
        _1489 = as_type<int>(_1493);
    }
    int _1495 = _1489;
    int _1497 = abs(_1477);
    int _1499 = ~_676;
    int _1501 = _1499 + 1;
    float _1503 = as_type<float>(_791) * _1487;
    bool _1505 = !_1481;
    int _1507 = _1505 ? 0 : 1;
    int _1509 = _1439 * _1497;
    int _1511 = _1509 + _1473;
    float _1513 = float(uint(_1485));
    int _1515 = ~_676;
    int _1517 = _1515 + 1;
    float _1519 = trunc(_1503);
    float _1521 = precise::max(_1519, 0.0);
    uint _1523 = uint(_1521);
    int _1525 = abs(_1507);
    int _1527 = _1501 * int(_1463);
    int _1529 = _1527 + _1039;
    float _1531 = as_type<float>(_791) * _1513;
    int _1533 = _1517 * _1469;
    int _1535 = _1533 + _1249;
    float _1537 = float(uint(_1529));
    bool _1539 = uint(_1535) >= uint(_676);
    float _1541 = trunc(_1531);
    float _1543 = precise::max(_1541, 0.0);
    uint _1545 = uint(_1543);
    int _1547 = _1399 * _1525;
    int _1549 = _1547 + _1511;
    float _1551 = as_type<float>(_738) * _1537;
    int _1553 = ~_736;
    int _1555 = _1553 + 1;
    bool _1557 = !_1539;
    int _1559 = _1557 ? 0 : (-1);
    float _1561 = trunc(_1551);
    float _1563 = precise::max(_1561, 0.0);
    uint _1565 = uint(_1563);
    float _1567 = float(uint(_1549));
    int _1569 = ~_1469;
    int _1571 = _1569 + _1559;
    int _1573 = _1571 + 1;
    int _1575 = _1555 * int(_1523);
    int _1577 = _1575 + _1185;
    bool _1579 = _676 == 0;
    float _1581 = as_type<float>(_999) * _1567;
    int _1583 = ~_736;
    int _1585 = _1583 + 1;
    int _1587 = _676 * _1573;
    int _1589 = _1587 + _1249;
    bool _1591 = _654 > 0.5;
    float _1593 = float(uint(_1577));
    float _1595 = trunc(_1581);
    float _1597 = precise::max(_1595, 0.0);
    uint _1599 = uint(_1597);
    bool _1601 = !_1579;
    int _1603 = _1601 ? _1589 : (-1);
    int _1605 = int(_1449) + int(_1545);
    float _1607 = as_type<float>(_791) * _1593;
    if (_1457)
    {
        float _1609 = _1591 ? as_type<float>(_1495) : _847;
        _907 = _1609;
    }
    float _1611 = _907;
    int _1613 = _1603 & 3;
    bool _1615 = _1613 != 0;
    int _1617 = _1585 * _1605;
    int _1619 = _1617 + _1381;
    int _1621 = _1603 & 3;
    bool _1623 = _1621 != 0;
    int _1625 = _1615 ? 0 : 1;
    bool _1627 = uint(_1621) >= 2u;
    bool _1629 = uint(_1619) >= uint(_736);
    int _1631 = ~_819;
    int _1633 = _1631 + 1;
    int _1635 = _1627 ? 0 : 1;
    bool _1637 = uint(_1621) > 1u;
    int _1639 = _1633 * int(_1599);
    int _1641 = _1639 + _1549;
    bool _1643 = !_1629;
    int _1645 = _1643 ? 0 : (-1);
    int _1647 = int(_1463) + int(_1565);
    int _1649 = ~_676;
    int _1651 = _1649 + 1;
    float _1653 = trunc(_1607);
    float _1655 = precise::max(_1653, 0.0);
    uint _1657 = uint(_1655);
    int _1659 = ~_1605;
    int _1661 = _1659 + _1645;
    int _1663 = _1661 + 1;
    bool _1665 = _1621 != 3;
    int _1667 = _1651 * _1647;
    int _1669 = _1667 + _1039;
    float _1671 = float(uint(_1641));
    int _1673 = _736 * _1663;
    int _1675 = _1673 + _1381;
    int _1677 = ~_1625;
    int _1679 = _1677 + 1;
    int _1681 = _1679 + 1;
    int _1683 = _1681;
    if (!_1637)
    {
        int _1685 = ~_1625;
        int _1687 = _1685 + 1;
        _1683 = _1687;
    }
    int _1689 = _1683;
    float _1691 = as_type<float>(_999) * _1671;
    bool _1693 = uint(_1669) >= uint(_676);
    bool _1695 = !_1181;
    int _1697 = _1695 ? _1675 : (-1);
    float _1699 = trunc(_1691);
    float _1701 = precise::max(_1699, 0.0);
    uint _1703 = uint(_1701);
    int _1705 = ~_1635;
    int _1707 = _1705 + 1;
    int _1709 = _1707 + 1;
    bool _1711 = !_1693;
    int _1713 = _1711 ? 0 : (-1);
    int _1715 = _1709;
    if (_1665)
    {
        int _1717 = ~_1635;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    int _1723 = _1697 & 3;
    bool _1725 = _1723 != 0;
    float _1727 = in.m_46.x;
    float _1729 = in.m_46.y;
    float _1731 = in.m_46.z;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1735 = _1733 != 0;
    int _1737 = _1725 ? 0 : 1;
    bool _1739 = !_1735;
    int _1741 = _1739 ? 0 : 1;
    bool _1743 = uint(_1723) >= 2u;
    bool _1745 = _1723 != 3;
    int _1747 = _1743 ? 0 : 1;
    bool _1749 = uint(_1723) > 1u;
    int _1751 = int(_1523) + int(_1657);
    int _1753 = int(_1599) + int(_1703);
    int _1755 = ~_819;
    int _1757 = _1755 + 1;
    int _1759 = ~_1747;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (_1745)
    {
        int _1767 = ~_1747;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = _1757 * _1753;
    int _1775 = _1773 + _1549;
    float _1777 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1779 = ~_1737;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _1787 = _1783;
    if (!_1749)
    {
        int _1789 = ~_1737;
        int _1791 = _1789 + 1;
        _1787 = _1791;
    }
    int _1793 = _1787;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1797 = uint(_1775) >= uint(_819);
    float _1799 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1801 = ~_736;
    int _1803 = _1801 + 1;
    float _1805 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1785);
    float _1807 = fma(_1799, -2.0, _1795);
    float _1809 = float(uint(_1439));
    int _1811 = _1803 * _1751;
    int _1813 = _1811 + _1185;
    float _1815 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1805);
    bool _1817 = !_1797;
    int _1819 = _1817 ? 0 : (-1);
    float _1821 = as_type<float>(_999) * _1809;
    bool _1823 = uint(_1813) >= uint(_736);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1831 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1833 = !_1823;
    int _1835 = _1833 ? 0 : (-1);
    float _1837 = trunc(_1821);
    float _1839 = precise::max(_1837, 0.0);
    uint _1841 = uint(_1839);
    int _1843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1845 = _1843 != 0;
    float _1847 = -_1829;
    float _1849 = fma(_1831, 2.0, _1847);
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1853 = _1851 != 0;
    float _1855 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1857 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _1859 = ~_1647;
    int _1861 = _1859 + _1713;
    int _1863 = _1861 + 1;
    float _1865 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1777);
    float _1867 = 1.0 / _1827;
    int _1869 = ~_1753;
    int _1871 = _1869 + _1819;
    int _1873 = _1871 + 1;
    float _1875 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1855);
    float _1877 = fma(_1727, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1857);
    int _1879 = _676 * _1863;
    int _1881 = _1879 + _1039;
    int _1883 = ~_1751;
    int _1885 = _1883 + _1835;
    int _1887 = _1885 + 1;
    int _1889 = _819 * _1873;
    int _1891 = _1889 + _1549;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1895 = _1893 != 0;
    float _1897 = _686 + (-1.0);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1899;
    int _1903 = _869 * int(_1841);
    int _1905 = _1903 + _1439;
    bool _1907 = !_1357;
    int _1909 = _1907 ? _1891 : (-1);
    int _1911 = _736 * _1887;
    int _1913 = _1911 + _1185;
    bool _1915 = !_1845;
    int _1917 = _1915 ? 0 : 1;
    float _1919 = _648 * 2.0;
    float _1921 = _1901 * _1867;
    float _1923 = float(uint(_1905));
    float _1925 = _654 * 2.0;
    int _1927 = _1909 & 3;
    bool _1929 = _1927 != 0;
    float _1931 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1933 = as_type<float>(_999) * _1923;
    bool _1935 = !_1181;
    int _1937 = _1935 ? _1913 : (-1);
    float _1939 = floor(_1919);
    bool _1941 = _1927 != 3;
    float _1943 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _1945 = _1873;
    if (_1895)
    {
        _702 = 0;
    }
    int _1947 = _702;
    float _1949 = fma(_1921, _652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1951 = _1947;
    if (_1895)
    {
        _1945 = 0;
    }
    int _1953 = _1945;
    float _1955 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1943);
    int _1957 = _1953;
    if (!_1895)
    {
        _1951 = 1;
    }
    int _1959 = _1951;
    float _1961 = trunc(_1933);
    float _1963 = precise::max(_1961, 0.0);
    uint _1965 = uint(_1963);
    if (!_1895)
    {
        _1957 = 2;
    }
    int _1967 = _1957;
    float _1969 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1877);
    bool _1971 = uint(_1927) >= 2u;
    float _1973 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1875);
    bool _1975 = !_1579;
    int _1977 = _1975 ? _1881 : (-1);
    float _1979 = _1969 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    bool _1981 = uint(_1927) > 1u;
    float _1983 = fma(_1731, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1865);
    int _1985 = _1971 ? 0 : 1;
    float _1987 = -_144;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1849);
    int _1991 = int(_1357);
    int _1993 = _1853 ? 2 : 0;
    int _1995 = _1991 | _1993;
    int _1997 = _1623 ? 4 : 0;
    int _1999 = _1995 | _1997;
    int _2001 = _1929 ? 8 : 0;
    int _2003 = _1999 | _2001;
    int _2005 = _1971 ? 16 : 0;
    int _2007 = _2003 | _2005;
    int _2009 = _1981 ? 32 : 0;
    int _2011 = _2007 | _2009;
    int _2013 = _1941 ? 64 : 0;
    int _2015 = _2011 | _2013;
    int _2017 = _2015 & 32;
    float _2019 = _1983 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _2021 = ~_1985;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    int _2027 = _2025;
    float _2029 = as_type<float>(_2017);
    float _2031 = _1983;
    if (_1941)
    {
        int _2033 = ~_1985;
        int _2035 = _2033 + 1;
        _2027 = _2035;
    }
    int _2037 = _2027;
    bool _2039 = _2017 != 0;
    bool _2041 = !_1853;
    int _2043 = _2041 ? 0 : 1;
    bool _2045 = _1939 > 0.0;
    float _2047 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _2049 = _1939 >= 0.0;
    bool _2051 = isnan(_1939);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan(0.0);
    bool _2057 = _2053 || _2055;
    int _2059 = _1929 ? 0 : 1;
    float _2061 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2047);
    int _2063 = int(_1841) + int(_1965);
    int _2065 = ~_819;
    int _2067 = _2065 + 1;
    int _2069 = ~_2059;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    int _2075 = _2073;
    if (!_2039)
    {
        int _2077 = ~_2059;
        int _2079 = _2077 + 1;
        _2075 = _2079;
    }
    int _2081 = _2075;
    int _2083 = _2067 * _2063;
    int _2085 = _2083 + _1439;
    bool _2087 = _1959 != 1;
    int _2089 = _1909 & 3;
    bool _2091 = _2089 != 0;
    float _2093 = floor(_1925);
    bool _2095 = _1621 != 3;
    bool _2097 = !_2091;
    int _2099 = _2097 ? 0 : 1;
    bool _2101 = uint(_2085) >= uint(_819);
    float _2103 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _670);
    float _2105 = _678 * 2.0;
    bool _2107 = !_1623;
    int _2109 = _2107 ? 0 : 1;
    float _2111 = floor(_2105);
    int _2113 = _1697 & 3;
    bool _2115 = _2113 != 0;
    float _2117 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1955);
    bool _2119 = !_2101;
    int _2121 = _2119 ? 0 : (-1);
    int _2123 = _2057 ? 0 : 1;
    float _2125 = (*spvDescriptorSet0.vp_c10)._m0[18].z;
    if (!_2087)
    {
        _2029 = _654;
    }
    float _2127 = _2029;
    float _2129 = sqrt(_2103);
    bool _2131 = !_2115;
    int _2133 = _2131 ? 0 : 1;
    bool _2135 = !_2095;
    int _2137 = _2135 ? 0 : (-1);
    bool _2139 = _1723 != 3;
    bool _2141 = _1927 != 3;
    bool _2143 = _2093 > 0.0;
    bool _2145 = _2093 >= 0.0;
    bool _2147 = isnan(_2093);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2093;
    float _2157 = _2127;
    if (!_2087)
    {
        _2125 = _678;
    }
    float _2159 = _2125;
    float _2161 = _2159;
    if (!_2087)
    {
        _909 = _2127;
    }
    float _2163 = _909;
    float _2165 = _2163;
    if (!_2087)
    {
        _2155 = _678;
    }
    float _2167 = _2155;
    float _2169 = _2167;
    if (_2087)
    {
        _2165 = _648;
    }
    float _2171 = _2165;
    if (_2087)
    {
        _2157 = _648;
    }
    float _2173 = _2157;
    if (_2087)
    {
        _2161 = _654;
    }
    float _2175 = _2161;
    float _2177 = _2171 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2087)
    {
        _2169 = _654;
    }
    float _2179 = _2169;
    bool _2181 = !_2139;
    int _2183 = _2181 ? 0 : (-1);
    bool _2185 = !_2141;
    int _2187 = _2185 ? 0 : (-1);
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2191 = _2189 != 0;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2195 = _2193 != 0;
    int _2197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2199 = _2197 != 0;
    int _2201 = ~_2123;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = sqrt(_2117);
    int _2209 = _2205;
    if (!_2045)
    {
        int _2211 = ~_2123;
        int _2213 = _2211 + 1;
        _2209 = _2213;
    }
    int _2215 = _2209;
    float _2217 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2061);
    bool _2219 = !_2195;
    int _2221 = _2219 ? 0 : 1;
    bool _2223 = _2111 > 0.0;
    bool _2225 = _2111 >= 0.0;
    bool _2227 = isnan(_2111);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(0.0);
    bool _2233 = _2229 || _2231;
    bool _2235 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2237 = isnan(_642);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    bool _2247 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2249 = isnan(_642);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    int _2259 = _2233 ? 0 : 1;
    float _2261 = -_2245;
    float _2263 = _2261 + 1.0;
    bool _2265 = _1967 != 2;
    float _2267 = _2207 * _1979;
    float _2269 = _2257 * _2263;
    float _2271 = -_2257;
    float _2273 = _2271 + 1.0;
    float _2275 = sqrt(_2217);
    int _2277 = abs(_2221);
    float _2279 = _1949 * _2269;
    float _2281 = _1973 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2283 = _1909 >> 31;
    float _2285 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2287 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2279);
    float _2289 = _2129 * _2281;
    int _2291 = ~_2259;
    int _2293 = _2291 + 1;
    int _2295 = _2293 + 1;
    float _2297 = fma(_2173, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2285);
    int _2299 = _2295;
    if (!_2223)
    {
        int _2301 = ~_2259;
        int _2303 = _2301 + 1;
        _2299 = _2303;
    }
    int _2305 = _2299;
    float _2307 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_2265)
    {
        _2031 = _648;
    }
    float _2309 = _2031;
    float _2311 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2287);
    float _2313 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2307);
    float _2315 = _2309;
    if (!_2265)
    {
        _2315 = _678;
    }
    float _2317 = _2315;
    float _2319 = _2275 * _2019;
    float _2321 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2325 = _2267 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2313);
    int _2331 = _1603 >> 31;
    float _2333 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2321);
    float _2335 = -_2323;
    float _2337 = fma(_2327, 2.0, _2335);
    int _2339 = _1697 >> 31;
    float _2341 = fma(_2289, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    int _2343 = _2331 & 3;
    float _2345 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2333);
    int _2347 = _2339 & 3;
    float _2349 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2341);
    int _2351 = _1603 + _2343;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2355 = _1697 + _2347;
    float _2357 = -_144;
    float _2359 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2337);
    int _2361 = _2351 >> 2;
    int _2363 = _2283 & 3;
    int _2365 = _2355 >> 2;
    int _2367 = _2361 << 4;
    int _2369 = _2367 + 368;
    int _2371 = _1909 + _2363;
    int _2373 = _2365 << 4;
    int _2375 = _2373 + 512;
    uint _2377 = uint(int(uint(_2369) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    int _2393 = _2371 >> 2;
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    uint _2397 = uint(int(uint(_2375) >> uint(2)));
    uint _2399 = uint(int(uint(int(_2397)) >> uint(2)));
    int _2401 = int(_2397) & 3;
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[int(_2399)][_2401];
    int _2405 = int(_2397) + 1;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    int _2409 = _2405 & 3;
    float _2411 = (*spvDescriptorSet0.vp_c9)._m0[int(_2407)][_2409];
    int _2413 = _2393 << 4;
    int _2415 = _2413 + 656;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2419 = abs(_1689);
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2423 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2427 = uint(int(uint(_2415) >> uint(2)));
    uint _2429 = uint(int(uint(int(_2427)) >> uint(2)));
    int _2431 = int(_2427) & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = int(_2427) + 1;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    int _2439 = _2435 & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    float _2443 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2445 = _2311 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2451 = _1815 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _2453 = float(_2215);
    out.m_61.x = _2423;
    out.m_61.y = _2443;
    out.m_61.z = _2425;
    out.m_61.w = _2445;
    float _2455 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2447);
    float _2457 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2329);
    int _2459 = _2369 + 8;
    uint _2461 = uint(int(uint(_2459) >> uint(2)));
    uint _2463 = uint(int(uint(int(_2461)) >> uint(2)));
    int _2465 = int(_2461) & 3;
    float _2467 = (*spvDescriptorSet0.vp_c9)._m0[int(_2463)][_2465];
    int _2469 = int(_2461) + 1;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    int _2473 = _2469 & 3;
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[int(_2471)][_2473];
    int _2477 = ~_2063;
    int _2479 = _2477 + _2121;
    int _2481 = _2479 + 1;
    float _2483 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2455);
    int _2485 = abs(_1793);
    int _2487 = ~_2419;
    int _2489 = _2487 + 1;
    int _2491 = _2489 + 1;
    int _2493 = _819 * _2481;
    int _2495 = _2493 + _1439;
    int _2497 = ~_2485;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2505 = int(_2503);
    int _2507 = abs(_2099);
    int _2509 = _2375 + 8;
    uint _2511 = uint(int(uint(_2509) >> uint(2)));
    uint _2513 = uint(int(uint(int(_2511)) >> uint(2)));
    int _2515 = int(_2511) & 3;
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[int(_2513)][_2515];
    int _2519 = int(_2511) + 1;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    int _2523 = _2519 & 3;
    float _2525 = (*spvDescriptorSet0.vp_c9)._m0[int(_2521)][_2523];
    float _2527 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2529 = float(_2277);
    float _2531 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2349);
    int _2533 = abs(_1721);
    float _2535 = fma(_2527, -2.0, _2353);
    int _2537 = abs(_2187);
    float _2539 = _2529 * _2453;
    int _2541 = abs(_2081);
    int _2543 = _2415 + 8;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    uint _2547 = uint(int(uint(int(_2545)) >> uint(2)));
    int _2549 = int(_2545) & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    int _2553 = int(_2545) + 1;
    uint _2555 = uint(int(uint(_2553) >> uint(2)));
    int _2557 = _2553 & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = ~_2533;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2491 * as_type<int>(_2391);
    int _2569 = abs(_2109);
    float _2571 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2573 = int(_2571);
    int _2575 = ~_2541;
    int _2577 = _2575 + 1;
    int _2579 = _2577 + 1;
    float _2581 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2345);
    int _2583 = ~_2569;
    int _2585 = _2583 + 1;
    int _2587 = _2585 + 1;
    float _2589 = -_2449;
    float _2591 = fma(_2177, 2.0, _2589);
    int _2593 = abs(_1771);
    int _2595 = _2501 * as_type<int>(_2411);
    int _2597 = abs(_2133);
    int _2599 = _2587 * as_type<int>(_2383);
    int _2601 = _2599 + _2567;
    int _2603 = ~_2507;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    float _2609 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2611 = int(_2609);
    int _2613 = ~_2597;
    int _2615 = _2613 + 1;
    int _2617 = _2615 + 1;
    float _2619 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2535);
    int _2621 = _2579 * as_type<int>(_2441);
    bool _2623 = !_1357;
    int _2625 = _2623 ? _2495 : (-1);
    int _2627 = _2617 * as_type<int>(_2403);
    int _2629 = _2627 + _2595;
    int _2631 = ~_2593;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    int _2637 = _2607 * as_type<int>(_2433);
    int _2639 = _2637 + _2621;
    int _2641 = abs(_2037);
    float _2643 = float(uint(_2505));
    int _2645 = ~_2641;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2565 * as_type<int>(_2467);
    int _2653 = _2651 + _2601;
    int _2655 = abs(_1741);
    int _2657 = abs(_2183);
    float _2659 = 1.0 / _2643;
    int _2661 = abs(_1917);
    int _2663 = abs(_2043);
    float _2665 = float(uint(_2611));
    int _2667 = _2635 * as_type<int>(_2517);
    int _2669 = _2667 + _2629;
    int _2671 = abs(_2137);
    float _2673 = float(uint(_2573));
    float _2675 = 1.0 / _2665;
    int _2677 = ~_2671;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2649 * as_type<int>(_2551);
    int _2685 = _2683 + _2639;
    int _2687 = _2681 * as_type<int>(_2475);
    int _2689 = _2687 + _2653;
    int _2691 = ~_2657;
    int _2693 = _2691 + 1;
    int _2695 = _2693 + 1;
    float _2697 = 1.0 / _2673;
    int _2699 = ~_2655;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    int _2705 = abs(_2505);
    int _2707 = _2695 * as_type<int>(_2525);
    int _2709 = _2707 + _2669;
    int _2711 = abs(_2573);
    int _2713 = _2689 * _2703;
    int _2715 = ~_2661;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    int _2721 = _1977 * _2655;
    int _2723 = _2721 + _2713;
    int _2725 = _2719 * _2709;
    int _2727 = ~_2537;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    float _2733 = float(uint(_2705));
    int _2735 = _1937 * _2661;
    int _2737 = _2735 + _2725;
    float _2739 = float(uint(_2711));
    int _2741 = _2731 * as_type<int>(_2559);
    int _2743 = _2741 + _2685;
    int _2745 = as_type<int>(_2659) + (-2);
    float _2747 = float(uint(_2723));
    float _2749 = 1.0 / _2733;
    int _2751 = ~_2663;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = abs(_2611);
    float _2759 = as_type<float>(_2745) * _2747;
    int _2761 = as_type<int>(_2697) + (-2);
    int _2763 = _2755 * _2743;
    float _2765 = float(uint(_2757));
    float _2767 = 1.0 / _2739;
    float _2769 = float(uint(_2737));
    int _2771 = _2625 * _2663;
    int _2773 = _2771 + _2763;
    int _2775 = ~_2505;
    int _2777 = _2775 + 1;
    int _2779 = ~_2573;
    int _2781 = _2779 + 1;
    float _2783 = as_type<float>(_2761) * _2769;
    float _2785 = trunc(_2759);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    int _2791 = as_type<int>(_2675) + (-2);
    float _2793 = float(uint(_2773));
    int _2795 = abs(_2723);
    float _2797 = 1.0 / _2765;
    int _2799 = as_type<int>(_2749) + (-2);
    float _2801 = as_type<float>(_2791) * _2793;
    int _2803 = as_type<int>(_2767) + (-2);
    float _2805 = float(uint(_2795));
    bool _2807 = !_2191;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = trunc(_2783);
    float _2813 = precise::max(_2811, 0.0);
    uint _2815 = uint(_2813);
    int _2817 = abs(_2737);
    float _2819 = as_type<float>(_2799) * _2805;
    int _2821 = abs(_2773);
    int _2823 = abs(_2809);
    int _2825 = _2777 * int(_2789);
    int _2827 = _2825 + _2723;
    float _2829 = float(uint(_2817));
    float _2831 = trunc(_2801);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = as_type<int>(_2797) + (-2);
    float _2839 = float(uint(_2821));
    float _2841 = as_type<float>(_2803) * _2829;
    float _2843 = float(uint(_2827));
    float _2845 = _2531 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2847 = float(_2305);
    float _2849 = as_type<float>(_2837) * _2839;
    int _2851 = _2781 * int(_2815);
    int _2853 = _2851 + _2737;
    float _2855 = trunc(_2819);
    float _2857 = precise::max(_2855, 0.0);
    uint _2859 = uint(_2857);
    float _2861 = float(_2823);
    float _2863 = as_type<float>(_2745) * _2843;
    int _2865 = ~_2611;
    int _2867 = _2865 + 1;
    float _2869 = _2581 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2871 = float(uint(_2853));
    float _2873 = _2861 * _2847;
    int _2875 = ~_2711;
    int _2877 = _2875 + 1;
    float _2879 = trunc(_2841);
    float _2881 = precise::max(_2879, 0.0);
    uint _2883 = uint(_2881);
    int _2885 = _2867 * int(_2835);
    int _2887 = _2885 + _2773;
    float _2889 = as_type<float>(_2761) * _2871;
    float _2891 = _2457 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2895 = _2869 + _2893;
    int _2897 = ~_2757;
    int _2899 = _2897 + 1;
    float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2903 = _2845 + _2901;
    int _2905 = ~_2705;
    int _2907 = _2905 + 1;
    float _2909 = trunc(_2849);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    float _2915 = float(uint(_2887));
    float _2917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2919 = _2891 + _2917;
    float _2921 = _2895 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2923 = _2907 * int(_2859);
    int _2925 = _2923 + _2795;
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2921);
    float _2929 = trunc(_2863);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = as_type<float>(_2791) * _2915;
    int _2937 = _2877 * int(_2883);
    int _2939 = _2937 + _2817;
    float _2941 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2927);
    float _2943 = float(uint(_2925));
    int _2945 = ~_2573;
    int _2947 = _2945 + 1;
    int _2949 = _2899 * int(_2913);
    int _2951 = _2949 + _2821;
    float _2953 = trunc(_2889);
    float _2955 = precise::max(_2953, 0.0);
    uint _2957 = uint(_2955);
    float _2959 = float(uint(_2939));
    float _2961 = as_type<float>(_2799) * _2943;
    bool _2963 = _2941 >= 0.0;
    float _2965 = float(uint(_2951));
    int _2967 = int(_2789) + int(_2933);
    float _2969 = as_type<float>(_2803) * _2959;
    float _2971 = trunc(_2935);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    float _2977 = as_type<float>(_2837) * _2965;
    float _2979 = as_type<float>(_2799);
    float _2981 = _2591;
    float _2983 = as_type<float>(_2951);
    if (_2265)
    {
        _2979 = _654;
    }
    float _2985 = _2979;
    float _2987 = _2985;
    if (!_2265)
    {
        _2987 = _648;
    }
    float _2989 = _2987;
    int _2991 = as_type<int>(_2989);
    if (_2963)
    {
        out.m_49.x = 0.0;
    }
    float _2993 = trunc(_2961);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    int _2999 = int(_2815) + int(_2957);
    float _3001 = as_type<float>(_2957);
    if (_2963)
    {
        _3001 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3003 = _3001;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3007 = ~_2505;
    int _3009 = _3007 + 1;
    int _3011 = _2947 * _2999;
    int _3013 = _3011 + _2737;
    float _3015 = trunc(_2969);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    float _3021 = _2989 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2963)
    {
        float _3023 = _3003 * 5.0;
        _2991 = as_type<int>(_3023);
    }
    int _3025 = _2991;
    int _3027 = _3009 * _2967;
    int _3029 = _3027 + _2723;
    int _3031 = int(_2835) + int(_2975);
    float _3033 = fma(_3021, -2.0, _3005);
    int _3035 = ~_2711;
    int _3037 = _3035 + 1;
    if (_2963)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9333 = as_type<float>(_3025);
        out.gl_Position.z = _9333;
    }
    float _3039 = trunc(_2977);
    float _3041 = precise::max(_3039, 0.0);
    uint _3043 = uint(_3041);
    int _3045 = int(_2859) + int(_2997);
    int _3047 = ~_2705;
    int _3049 = _3047 + 1;
    int _3051 = ~_2611;
    int _3053 = _3051 + 1;
    bool _3055 = uint(_3029) >= uint(_2505);
    int _3057 = int(_2883) + int(_3019);
    int _3059 = _3053 * _3031;
    int _3061 = _3059 + _2773;
    bool _3063 = uint(_3013) >= uint(_2573);
    int _3065 = _3049 * _3045;
    int _3067 = _3065 + _2795;
    bool _3069 = !_3055;
    int _3071 = _3069 ? 0 : (-1);
    int _3073 = _3037 * _3057;
    int _3075 = _3073 + _2817;
    int _3077 = ~_2757;
    int _3079 = _3077 + 1;
    int _3081 = int(_2913) + int(_3043);
    int _3083 = ~_2967;
    int _3085 = _3083 + _3071;
    int _3087 = _3085 + 1;
    bool _3089 = !_3063;
    int _3091 = _3089 ? 0 : (-1);
    int _3093 = _3079 * _3081;
    int _3095 = _3093 + _2821;
    bool _3097 = uint(_3061) >= uint(_2611);
    int _3099 = _2505 * _3087;
    int _3101 = _3099 + _2723;
    bool _3103 = uint(_3067) >= uint(_2705);
    float _3105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3107 = ~_2999;
    int _3109 = _3107 + _3091;
    int _3111 = _3109 + 1;
    bool _3113 = !_3103;
    int _3115 = _3113 ? 0 : (-1);
    bool _3117 = !_3097;
    int _3119 = _3117 ? 0 : (-1);
    bool _3121 = _2505 == 0;
    bool _3123 = uint(_3075) >= uint(_2711);
    int _3125 = _2573 * _3111;
    int _3127 = _3125 + _2737;
    bool _3129 = _2505 == 0;
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3133 = _2723 ^ _2505;
    int _3135 = ~_3031;
    int _3137 = _3135 + _3119;
    int _3139 = _3137 + 1;
    bool _3141 = !_3121;
    int _3143 = _3141 ? _3101 : (-1);
    bool _3145 = !_3123;
    int _3147 = _3145 ? 0 : (-1);
    float _3149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3151 = _2573 == 0;
    bool _3153 = uint(_3095) >= uint(_2757);
    int _3155 = _2611 * _3139;
    int _3157 = _3155 + _2773;
    bool _3159 = !_3151;
    int _3161 = _3159 ? _3127 : (-1);
    bool _3163 = !_3153;
    int _3165 = _3163 ? 0 : (-1);
    bool _3167 = _2611 == 0;
    bool _3169 = _2573 == 0;
    int _3171 = _2737 ^ _2573;
    int _3173 = _2773 ^ _2611;
    float _3175 = _3105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3177 = float(_3143);
    float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3181 = !_3167;
    int _3183 = _3181 ? _3157 : (-1);
    float _3185 = fma(_3175, _959, -0.5);
    int _3187 = ~_3115;
    int _3189 = _3045 + _3187;
    int _3191 = _3189 + 1;
    float _3193 = fma(_3175, _3177, _1989);
    bool _3195 = _2611 == 0;
    float _3197 = _3149 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3199 = float(_3161);
    float _3201 = -_144;
    float _3203 = fma(_3201, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2591);
    float _3205 = float(_3183);
    float _3207 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3209 = uint(int(uint(_3133) >> uint(31)));
    float _3211 = fma(_3197, _3199, _3203);
    float _3213 = fma(_3197, _1049, -0.5);
    float _3215 = fma(_3207, _1611, -0.5);
    float _3217 = fma(_3207, _3205, _2359);
    float _3219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3221 = ~int(_3209);
    int _3223 = _3221 + 1;
    float _3225 = _3179 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _3227 = uint(int(uint(_3171) >> uint(31)));
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3231 = _3191 ^ _3223;
    float _3233 = fma(_895, _3225, -0.5);
    int _3235 = ~_3147;
    int _3237 = _3057 + _3235;
    int _3239 = _3237 + 1;
    float _3241 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3229);
    int _3243 = ~int(_3227);
    int _3245 = _3243 + 1;
    float _3247 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2297);
    int _3249 = ~_3223;
    int _3251 = _3249 + _3231;
    int _3253 = _3251 + 1;
    float _3255 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3241);
    uint _3257 = uint(int(uint(_3173) >> uint(31)));
    float _3259 = fma(_3247, _3213, _3211);
    int _3261 = _3239 ^ _3245;
    float _3263 = fma(_3255, _3185, _3193);
    bool _3265 = !_3129;
    int _3267 = _3265 ? _3253 : (-1);
    float _3269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3271 = ~_3165;
    int _3273 = _3081 + _3271;
    int _3275 = _3273 + 1;
    float _3277 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1807);
    int _3279 = ~int(_3257);
    int _3281 = _3279 + 1;
    float _3283 = _3219 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3285 = ~_3245;
    int _3287 = _3285 + _3261;
    int _3289 = _3287 + 1;
    float _3291 = _3263 + 0.5;
    float _3293 = float(_3267);
    float _3295 = fma(_897, _3283, -0.5);
    int _3297 = _3275 ^ _3281;
    float _3299 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3301 = log2(_3299);
    float _3303 = -_3277;
    float _3305 = fma(_3225, _3293, _3303);
    bool _3307 = !_3169;
    int _3309 = _3307 ? _3289 : (-1);
    float _3311 = _3259 + 0.5;
    int _3313 = ~_3281;
    int _3315 = _3313 + _3297;
    int _3317 = _3315 + 1;
    float _3319 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3321 = float(_3309);
    float _3323 = _3269 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3325 = !_3195;
    int _3327 = _3325 ? _3317 : (-1);
    float _3329 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3319);
    float _3331 = -_2619;
    float _3333 = fma(_3283, _3321, _3331);
    float _3335 = float(_3327);
    float _3337 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3033);
    float _3339 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3329);
    float _3341 = fma(_3323, _955, -0.5);
    float _3343 = -_3337;
    float _3345 = fma(_3323, _3335, _3343);
    float _3347 = fma(_2483, _3295, _3333);
    float _3349 = fma(_3339, _3233, _3305);
    float _3351 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3353 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3355 = _2895 * _2895;
    float _3357 = _3301 * _144;
    float _3359 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3351);
    float _3361 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3353);
    float _3363 = fma(_2919, _2919, _3355);
    float _3365 = exp2(_3357);
    float _3367 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3359);
    float _3369 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3361);
    float _3371 = fma(_2903, _2903, _3363);
    float _3373 = _3349 + 0.5;
    float _3375 = fma(_3367, _3215, _3217);
    float _3377 = fma(_3369, _3341, _3345);
    float _3379 = _3347 + 0.5;
    float _3381 = _3375 + 0.5;
    float _3383 = _3377 + 0.5;
    float _3385 = rsqrt(_3371);
    float _3387 = in.m_63.x;
    float _3389 = in.m_63.y;
    float _3391 = in.m_63.z;
    float _3393 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3395 = 1.0 + _3393;
    bool _3397 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3399 = isnan(0.0);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3405 = _3401 || _3403;
    float _3407 = -_3365;
    float _3409 = _3407 + 1.0;
    out.m_65.x = _3291;
    out.m_65.y = _3373;
    out.m_65.z = _3311;
    out.m_65.w = _3379;
    bool _3411 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3413 = isnan(1.0);
    bool _3415 = _3411 || _3413;
    bool _3417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3419 = _3415 || _3417;
    float _3421 = 1.0 / _3395;
    out.m_67.x = _3381;
    out.m_67.y = _3383;
    float _3423 = _3405 ? _3409 : 0.0;
    float _3425 = _2895 * _3385;
    float _3427 = _2919 * _3385;
    bool _3429 = !_2199;
    int _3431 = _3429 ? 0 : 1;
    if (_2963)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3433 = -_3425;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2869);
    float _3437 = _2873 * (-2.0);
    float _3439 = _2903 * _3385;
    float _3441 = -_3427;
    float _3443 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2891);
    float _3445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3447 = _3435 + _3445;
    float _3449 = fma(_1931, _3437, _1931);
    float _3451 = -_3439;
    float _3453 = fma(_3451, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2845);
    float _3455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3457 = _3443 + _3455;
    float _3459 = _3447 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3461 = _3439;
    float _3463 = _3457;
    if (_3419)
    {
        float _3465 = _3423 * _3421;
        _148 = _3465;
    }
    float _3467 = _148;
    float _3469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3471 = _3453 + _3469;
    float _3473 = fma(_3437, _3387, _3387);
    float _3475 = fma(_3457, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3459);
    float _3477 = _648 + (-0.5);
    float _3479 = _654 + _678;
    float _3481 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3475);
    float _3483 = fma(_3477, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3473);
    float _3485 = _3479 + (-1.0);
    float _3487 = _654 + (-0.5);
    int _3489 = _2153 ? 0 : 1;
    float _3491 = fma(_3449, _3467, _3483);
    bool _3493 = _3481 >= 0.0;
    float _3495 = _2539 * (-2.0);
    float _3497 = fma(_3485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _3499 = ~_3489;
    int _3501 = _3499 + 1;
    int _3503 = _3501 + 1;
    float _3505 = _3491 * 0.15915493667125701904296875;
    float _3507 = fma(_3495, _3389, _3389);
    float _3509 = fma(_3497, _3495, _3497);
    int _3511 = _3503;
    float _3513 = _3507;
    if (!_2143)
    {
        int _3515 = ~_3489;
        int _3517 = _3515 + 1;
        _3511 = _3517;
    }
    int _3519 = _3511;
    float _3521 = _3505 * 6.283185482025146484375;
    float _3523 = sin(_3521);
    float _3525 = fma(_3487, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3507);
    int _3527 = abs(_3431);
    float _3529 = _648 + _678;
    float _3531 = float(_3519);
    float _3533 = fma(_3509, _3467, _3525);
    if (_3493)
    {
        out.m_49.x = 0.0;
    }
    if (_3493)
    {
        _3513 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3535 = _3513;
    float _3537 = _3533 * 0.15915493667125701904296875;
    float _3539 = _3505 * 6.283185482025146484375;
    float _3541 = cos(_3539);
    float _3543 = float(_3527);
    int _3545 = as_type<int>(_3535);
    if (_3493)
    {
        float _3547 = _3535 * 5.0;
        _3545 = as_type<int>(_3547);
    }
    int _3549 = _3545;
    float _3551 = _3529 + (-1.0);
    float _3553 = _3543 * _3531;
    float _3555 = _3537 * 6.283185482025146484375;
    float _3557 = sin(_3555);
    if (_3493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10128 = as_type<float>(_3549);
        out.gl_Position.z = _10128;
    }
    float _3559 = _3553 * (-2.0);
    if (_3493)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3561 = -_2869;
    float _3563 = _3561 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3565 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3567 = -_2891;
    float _3569 = _3567 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3571 = -_2845;
    float _3573 = _3571 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3575 = _3563 * _3563;
    float _3577 = fma(_3559, _3391, _3391);
    float _3579 = _678 + (-0.5);
    float _3581 = fma(_3565, _3559, _3565);
    float _3583 = fma(_3569, _3569, _3575);
    float _3585 = -_3425;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2895);
    float _3589 = fma(_3579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3577);
    float _3591 = -_3427;
    float _3593 = fma(_3591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2919);
    float _3595 = fma(_3573, _3573, _3583);
    float _3597 = _3587 * _3587;
    float _3599 = fma(_3581, _3467, _3589);
    float _3601 = _3537 * 6.283185482025146484375;
    float _3603 = cos(_3601);
    float _3605 = -_3439;
    float _3607 = fma(_3605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2903);
    float _3609 = fma(_3593, _3593, _3597);
    float _3611 = _3599 * 0.15915493667125701904296875;
    float _3613 = in.m_69.x;
    float _3615 = in.m_69.y;
    float _3617 = in.m_69.z;
    float _3619 = _3523 * _3557;
    float _3621 = fma(_3607, _3607, _3609);
    float _3623 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3625 = rsqrt(_3595);
    float _3627 = _3611 * 6.283185482025146484375;
    float _3629 = sin(_3627);
    float _3631 = _3541 * _3603;
    float _3633 = _3523 * _3603;
    float _3635 = _3569 * _3625;
    float _3637 = _3573 * _3625;
    float _3639 = _3563 * _3625;
    float _3641 = sqrt(_3621);
    float _3643 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3645 = _3635 * _3643;
    float _3647 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3649 = _3637 * _3647;
    float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3653 = _3639 * _3651;
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3657 = -_3645;
    float _3659 = fma(_3637, _3655, _3657);
    float _3661 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3663 = -_3649;
    float _3665 = fma(_3639, _3661, _3663);
    float _3667 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3669 = -_3653;
    float _3671 = fma(_3635, _3667, _3669);
    float _3673 = fma(_3629, _3631, _3619);
    float _3675 = _3659 * _3659;
    float _3677 = fma(_3629, _3619, _3631);
    float _3679 = _3611 * 6.283185482025146484375;
    float _3681 = cos(_3679);
    float _3683 = fma(_3665, _3665, _3675);
    float _3685 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _3687 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3689 = isnan(0.5);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3695 = _3691 || _3693;
    float _3697 = _3385 * _3641;
    float _3699 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3615);
    float _3703 = _3541 * _3557;
    float _3705 = _3697 * _3623;
    float _3707 = fma(_3671, _3671, _3683);
    float _3709 = _3697 * _3699;
    float _3711 = -_3703;
    float _3713 = fma(_3629, _3633, _3711);
    float _3715 = -_3633;
    float _3717 = fma(_3629, _3703, _3715);
    float _3719 = rsqrt(_3707);
    float _3721 = _3701 * _3709;
    float _3723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3617);
    float _3725 = _3603 * _3681;
    float _3727 = _3541 * _3681;
    float _3729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3613);
    float _3731 = _3523 * _3681;
    float _3733 = _3557 * _3681;
    float _3735 = _3697 * _3685;
    float _3737 = _3729 * _3705;
    float _3739 = _3727 * _3721;
    float _3741 = _3723 * _3735;
    float _3743 = -_3721;
    float _3745 = _3629 * _3743;
    float _3747 = fma(_3673, _3737, _3739);
    float _3749 = _3731 * _3721;
    float _3751 = _3665 * _3719;
    float _3753 = _3659 * _3719;
    float _3755 = _3671 * _3719;
    float _3757 = fma(_3725, _3737, _3745);
    float _3759 = _3639 * _3751;
    float _3761 = fma(_3717, _3741, _3747);
    float _3763 = _3637 * _3753;
    float _3765 = fma(_3713, _3737, _3749);
    float _3767 = -_3759;
    float _3769 = fma(_3635, _3753, _3767);
    float _3771 = fma(_3733, _3741, _3757);
    float _3773 = -_3763;
    float _3775 = fma(_3639, _3755, _3773);
    float _3777 = fma(_3677, _3741, _3765);
    float _3779 = _3769 * _3761;
    float _3781 = _3775 * _3761;
    float _3783 = fma(_3755, _3771, _3779);
    float _3785 = fma(_3751, _3771, _3781);
    float _3787 = fma(_3637, _3777, _3783);
    float _3789 = fma(_3635, _3777, _3785);
    float _3791 = _2845 + _3787;
    float _3793 = _2891 + _3789;
    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3797 = _3791 + _3795;
    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3801 = _3793 + _3799;
    float _3803 = _3797 * _3797;
    float _3805 = fma(_3801, _3801, _3803);
    float _3807 = _3635 * _3755;
    float _3809 = sqrt(_3805);
    float _3811 = -_3807;
    float _3813 = fma(_3637, _3751, _3811);
    float _3815 = _3813 * _3761;
    float _3817 = fma(_3753, _3771, _3815);
    float _3819 = fma(_3639, _3777, _3817);
    bool _3821 = _3809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3823 = _2869 + _3819;
    float _3825 = _3819;
    float _3827 = _3807;
    float _3829 = _3777;
    float _3831 = _3809;
    if (!_3821)
    {
        _3825 = _3793;
    }
    float _3833 = _3825;
    float _3835 = _3833;
    if (!_3821)
    {
        _3827 = _3791;
    }
    float _3837 = _3827;
    float _3839 = _3837;
    if (!_3821)
    {
        _3829 = _3823;
    }
    float _3841 = _3829;
    bool _3843 = !_3821;
    float _3845 = _3841;
    if (!_3843)
    {
        float _3847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3851 = _3809 + _3849;
        float _3853 = rsqrt(_3805);
        float _3855 = _3851 * _3847;
        float _3857 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3859 = _3855 * 0.15915493667125701904296875;
        float _3861 = _3859 * 6.283185482025146484375;
        float _3863 = cos(_3861);
        float _3865 = _3859 * 6.283185482025146484375;
        float _3867 = sin(_3865);
        float _3869 = _3863 + (-1.0);
        float _3871 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3873 = fma(_3867, _3857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3875 = fma(_3823, _3863, _3871);
        float _3877 = _3853 * _3873;
        float _3879 = fma(_3801, _3877, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3881 = fma(_3797, _3877, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3845 = _3875;
        _3839 = _3881;
        _3835 = _3879;
        _3831 = _3871;
    }
    float _3883 = _3845;
    float _3885 = _3839;
    float _3887 = _3835;
    float _3889 = _3831;
    float _3891 = -_3425;
    float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3883);
    float _3895 = -_3439;
    float _3897 = fma(_3895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3885);
    float _3899 = -_3427;
    float _3901 = fma(_3899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3887);
    float _3903 = _3901;
    float _3905 = _3897;
    float _3907 = _3889;
    if (_3695)
    {
        _3461 = _3893;
    }
    float _3909 = _3461;
    float _3911 = _3909;
    if (!_3695)
    {
        float _3913 = _3447 * _3447;
        float _3915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3917 = -_2845;
        float _3919 = _3917 + _3885;
        float _3921 = -_2891;
        float _3923 = _3921 + _3887;
        float _3925 = fma(_3457, _3457, _3913);
        float _3927 = -_2869;
        float _3929 = _3927 + _3883;
        float _3931 = fma(_3471, _3471, _3925);
        float _3933 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3935 = sqrt(_3931);
        float _3937 = 1.0 / _3697;
        float _3939 = _3933 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3941 = precise::min(_3935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3943 = _3941 * _3915;
        float _3945 = _3943 * _3937;
        float _3947 = _3939 * _3945;
        float _3949 = _3919 * _3945;
        float _3951 = fma(_3923, _3947, _3443);
        float _3953 = fma(_3929, _3947, _3435);
        float _3955 = fma(_3939, _3949, _3453);
        _3911 = _3953;
        _3903 = _3951;
        _3905 = _3955;
        _3463 = _3935;
    }
    float _3957 = _3911;
    float _3959 = _3903;
    float _3961 = _3905;
    float _3963 = _3463;
    float _3965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3967 = _3957 + _3965;
    float _3969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3971 = _3959 + _3969;
    float _3973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3975 = _3961 + _3973;
    float _3977 = _3967 * _3967;
    float _3979 = fma(_3971, _3971, _3977);
    float _3981 = fma(_3975, _3975, _3979);
    float _3983 = rsqrt(_3981);
    float _3985 = sqrt(_3981);
    float _3987 = _3983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3989 = _3971 * _3987;
    float _3991 = _3975 * _3987;
    float _3993 = _3989 * _3989;
    float _3995 = _3991 * _3991;
    float _3997 = _3993 + _3995;
    float _3999 = sqrt(_3997);
    bool _4001 = _3999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4005 = _3999 + _4003;
    float _4007 = _3975;
    float _4009 = _3997;
    float _4011 = _4005;
    float _4013 = _3967;
    float _4015 = _3963;
    if (_4001)
    {
        float _4017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4007 = _4017;
    }
    float _4019 = _4007;
    if (_4001)
    {
        float _4021 = rsqrt(_3997);
        _4009 = _4021;
    }
    float _4023 = _4009;
    float _4025 = _4023;
    if (_4001)
    {
        float _4027 = _4005 * _4019;
        _4011 = _4027;
    }
    float _4029 = _4011;
    if (_4001)
    {
        float _4031 = _4029 * 0.15915493667125701904296875;
        _3907 = _4031;
    }
    float _4033 = _3907;
    float _4035 = _3977;
    float _4037 = _4033;
    if (_4001)
    {
        float _4039 = _4033 * 6.283185482025146484375;
        float _4041 = sin(_4039);
        _4035 = _4041;
    }
    float _4043 = _4035;
    float _4045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4047 = precise::max(0.0, _4045);
    float _4049 = _3983;
    float _4051 = _4045;
    float _4053 = _4047;
    if (_4001)
    {
        float _4055 = _4033 * 6.283185482025146484375;
        float _4057 = cos(_4055);
        _4049 = _4057;
    }
    float _4059 = _4049;
    float _4061 = -_3987;
    float _4063 = -_4047;
    float _4065 = fma(_3967, _4061, _4063);
    if (_4001)
    {
        float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4051 = _4067;
    }
    float _4069 = _4051;
    float _4071 = _4069;
    if (!_4001)
    {
        _4037 = _3989;
    }
    float _4073 = _4037;
    float _4075 = _4043;
    float _4077 = _4073;
    if (_4001)
    {
        float _4079 = fma(_4043, _4069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4071 = _4079;
    }
    float _4081 = _4071;
    if (!_4001)
    {
        _4075 = _4065;
    }
    float _4083 = _4075;
    float _4085 = _4083;
    float _4087 = _4059;
    if (_4001)
    {
        float _4089 = _4059 + (-1.0);
        _4013 = _4089;
    }
    float _4091 = _4013;
    float _4093 = _4091;
    if (_4001)
    {
        float _4095 = _4023 * _4081;
        _4015 = _4095;
    }
    float _4097 = _4015;
    if (!_4001)
    {
        _4025 = _3995;
    }
    float _4099 = _4025;
    float _4101 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4103 = _4099;
    if (_4001)
    {
        float _4105 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4053 = _4105;
    }
    float _4107 = _4053;
    if (_4001)
    {
        float _4109 = _3989 * _4097;
        _4077 = _4109;
    }
    float _4111 = _4077;
    if (!_4001)
    {
        _4093 = _3991;
    }
    float _4113 = _4093;
    float _4115 = _4113;
    if (_4001)
    {
        float _4117 = _3991 * _4097;
        _4115 = _4117;
    }
    float _4119 = _4115;
    if (_4001)
    {
        float _4121 = fma(_4065, _4059, _4107);
        _4085 = _4121;
    }
    float _4123 = _4085;
    if (!_4001)
    {
        _4087 = _3993;
    }
    float _4125 = _4087;
    float _4127 = _4125;
    if (_4001)
    {
        float _4129 = _4111 * _4111;
        _4127 = _4129;
    }
    float _4131 = _4127;
    if (_4001)
    {
        float _4133 = _4119 * _4119;
        _4103 = _4133;
    }
    float _4135 = _4103;
    float _4137 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4101);
    float _4139 = fma(_4123, _4123, _4131);
    float _4141 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4143 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4137);
    float _4145 = _4139 + _4135;
    float _4147 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4141);
    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4151 = fma(_3985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4149);
    float _4153 = precise::clamp(_4151, 0.0, 1.0);
    float _4155 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4157 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4147);
    float _4159 = rsqrt(_4145);
    float _4161 = -_4153;
    float _4163 = _4161 + 1.0;
    float _4165 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4167 = _4157 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4169 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4171 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4155);
    float _4173 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4175 = abs(_4163);
    float _4177 = log2(_4175);
    float _4179 = _4143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4181 = fma(_3443, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4183 = -_4173;
    float _4185 = fma(_4183, _4165, 1.0);
    float _4187 = _3957 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4189 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4171);
    float _4191 = fma(_3959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4187);
    float _4193 = _4159 * _4111;
    float _4195 = floor(_4181);
    float _4197 = _4189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4199 = fma(_3961, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4191);
    float _4201 = _4159 * _4123;
    float _4203 = _4159 * _4119;
    float _4205 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4207 = _4199 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4209 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4211 = floor(_4169);
    float _4213 = -_4205;
    float _4215 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4213);
    float _4217 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4219 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4209);
    float _4221 = -_4203;
    float _4223 = fma(_4221, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4215);
    float _4225 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4219);
    float _4227 = -_4195;
    float _4229 = _4181 + _4227;
    float _4231 = fma(_4223, -0.5, 0.5);
    float _4233 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4225);
    float _4235 = fma(_4223, 0.5, 0.5);
    float _4237 = exp2(_4217);
    float _4239 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4241 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4243 = fma(_4235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4245 = -_4211;
    float _4247 = _4169 + _4245;
    float _4249 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4239);
    float _4251 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4241);
    float _4253 = fma(_4235, _4243, -0.212114393711090087890625);
    float _4255 = log2(_4185);
    float _4257 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4249);
    float _4259 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4251);
    float _4261 = 1.0 / _4233;
    float _4263 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4257);
    float _4265 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4259);
    float2 _11269 = float2(_4229, _4247);
    float _4267 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11269, float2(0.0), isnan(_11269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11269, float2(0.0), isnan(_11269)), level(0.0)).x;
    float _4269 = fma(_4235, _4253, 1.570728778839111328125);
    float _4271 = sqrt(_4231);
    float _4273 = _4255 * 0.693147182464599609375;
    float _4275 = _4263 * _4261;
    float _4277 = _4201 + 1.0;
    float _4279 = fma(_4275, 0.5, 0.5);
    float _4281 = -_4201;
    float _4283 = fma(_4237, _4277, _4281);
    float _4285 = _4265 * _4261;
    float _4287 = _4273 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4289 = _4271 * 0.636619746685028076171875;
    float _4291 = fma(_4283, 0.5, 0.5);
    float _4293 = fma(_4285, -0.5, 0.5);
    float _4295 = -_4269;
    float _4297 = fma(_4289, _4295, 1.0);
    float3 _11321 = float3(_4279, _4293, _4287);
    float _4299 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11321, float3(0.0), isnan(_11321)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11321, float3(0.0), isnan(_11321)), level(0.0)).x;
    float3 _11332 = float3(_4279, _4293, _4287);
    float4 _4302 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11332, float3(0.0), isnan(_11332)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11332, float3(0.0), isnan(_11332)), level(0.0)).xyzw;
    float _4304 = _4302.x;
    float _4306 = _4302.y;
    float _4308 = _4302.z;
    float _4310 = _4302.w;
    float2 _11348 = float2(_4297, _4291);
    float3 _4314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11348, float2(0.0), isnan(_11348)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11348, float2(0.0), isnan(_11348)), level(0.0)).xyz;
    float _4316 = _4314.x;
    float _4318 = _4314.y;
    float _4320 = _4314.z;
    float _4322 = _3435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4324 = _3435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4326 = _3615 != 0.0;
    bool _4328 = isnan(_3615);
    bool _4330 = _4326 || _4328;
    bool _4332 = isnan(0.0);
    bool _4334 = _4330 || _4332;
    float _4336 = _3727 * _3769;
    float _4338 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4322);
    float _4340 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4324);
    bool _4342 = _3613 == 0.0;
    bool _4344 = !_4334;
    bool _4346 = _4342 && _4344;
    float _4348 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4350 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4338);
    float _4352 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4340);
    float _4354 = _4197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4356 = _4350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4358 = _4352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4360 = _3617 == 0.0;
    bool _4362 = _4360 && _4346;
    float _4364 = exp2(_4348);
    float _4366 = _4358 + _4356;
    float _4368 = fma(_4207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4354);
    float _4370 = 1.0 / _4356;
    float _4372 = fma(_4167, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4368);
    float _4374 = -_4364;
    float _4376 = _4374 + 1.0;
    float _4378 = in.m_71.x;
    float _4380 = in.m_71.y;
    float _4382 = in.m_71.z;
    float _4384 = in.m_71.w;
    float _4386 = _4376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4388 = _4366 * _4370;
    float _4390 = _4388 * 0.5;
    float _4392 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4394 = fma(_4390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4392);
    float _4396 = in.m_73.x;
    float _4398 = in.m_73.y;
    float _4400 = in.m_73.z;
    float _4402 = 1.0 / _4394;
    float _4404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4406 = _4402 * _4404;
    float _4408 = abs(_4406);
    float _4410 = log2(_4408);
    float _4412 = _4402;
    float _4414 = _4396;
    float _4416 = _4233;
    float _4418 = _4265;
    if (_4362)
    {
        _2981 = _4398;
    }
    float _4420 = _2981;
    float _4422 = _4420;
    if (_4362)
    {
        _2983 = _4396;
    }
    float _4424 = _2983;
    float _4426 = _4424;
    if (_4362)
    {
        _4412 = _4420;
    }
    float _4428 = _4412;
    float _4430 = _4428;
    if (!_4362)
    {
        _4422 = _4398;
    }
    float _4432 = _4422;
    if (!_4362)
    {
        float _4434 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4432);
        _4430 = _4434;
    }
    float _4436 = _4430;
    float _4438 = _4380 * _4400;
    float _4440 = _4410 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4442 = _4410;
    if (_4362)
    {
        _4442 = _4424;
    }
    float _4444 = _4442;
    float _4446 = _4444;
    if (!_4362)
    {
        _4426 = _4396;
    }
    float _4448 = _4426;
    if (_4362)
    {
        _4414 = _4400;
    }
    float _4450 = _4414;
    float _4452 = exp2(_4440);
    float _4454 = _4450;
    if (!_4362)
    {
        float _4456 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4400);
        _4454 = _4456;
    }
    float _4458 = _4454;
    if (!_4362)
    {
        float _4460 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4448);
        _4446 = _4460;
    }
    float _4462 = _4446;
    float _4464 = _4382 * _4448;
    float _4466 = _4378 * _4432;
    float _4468 = -_4438;
    float _4470 = fma(_4382, _4432, _4468);
    bool _4472 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4474 = isnan(_3985);
    bool _4476 = _4472 || _4474;
    bool _4478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4480 = _4476 || _4478;
    float _4482 = -_4464;
    float _4484 = fma(_4378, _4400, _4482);
    float _4486 = _4470 * _4384;
    float _4488 = fma(_4452, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4490 = precise::clamp(_4488, 0.0, 1.0);
    float _4492 = -_4466;
    float _4494 = fma(_4380, _4448, _4492);
    float _4496 = _4484 * _4384;
    float _4498 = _3673 * _3775;
    float _4500 = fma(_4490, -2.0, 3.0);
    float _4502 = _4490 * _4490;
    float _4504 = _4494 * _4384;
    float _4506 = _3673 * _3813;
    float _4508 = _3673 * _3769;
    float _4510 = _3727 * _3775;
    float _4512 = _3727 * _3813;
    float _4514 = _4502 * _4500;
    float _4516 = _3717 * _3775;
    float _4518 = _3717 * _3813;
    float _4520 = _3717 * _3769;
    float _4522 = -_3629;
    float _4524 = fma(_4522, _3751, _4510);
    float _4526 = -_3629;
    float _4528 = fma(_4526, _3753, _4512);
    float _4530 = -_3629;
    float _4532 = fma(_4530, _3755, _4336);
    float _4534 = -_4514;
    float _4536 = _4534 + 1.0;
    float _4538 = fma(_3725, _3751, _4498);
    float _4540 = fma(_3725, _3753, _4506);
    float _4542 = fma(_3725, _3755, _4508);
    float _4544 = fma(_3733, _3753, _4518);
    float _4546 = fma(_4536, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4514);
    float _4548 = fma(_3713, _3635, _4538);
    float _4550 = fma(_3713, _3639, _4540);
    float _4552 = fma(_3713, _3637, _4542);
    float _4554 = fma(_3733, _3751, _4516);
    bool _4556 = _4406 <= 8000.0;
    bool _4558 = isnan(_4406);
    bool _4560 = _4556 || _4558;
    bool _4562 = isnan(8000.0);
    bool _4564 = _4560 || _4562;
    float _4566 = float(_4564);
    float _4568 = fma(_3733, _3755, _4520);
    float _4570 = fma(_3731, _3635, _4524);
    float _4572 = fma(_3731, _3639, _4528);
    float _4574 = fma(_3731, _3637, _4532);
    float _4576 = fma(_3677, _3635, _4554);
    float _4578 = _4566 * _4546;
    float _4580 = fma(_3677, _3639, _4544);
    float _4582 = fma(_3677, _3637, _4568);
    float _4584 = _4570 * _4380;
    float _4586 = _4572 * _4380;
    float _4588 = _4574 * _4380;
    float _4590 = _4574 * _4436;
    float _4592 = _4570 * _4436;
    float _4594 = _4496 * _4570;
    float _4596 = _4496 * _4574;
    float _4598 = _4572 * _4436;
    float _4600 = _4496 * _4572;
    float _4602 = fma(_4548, _4378, _4584);
    float _4604 = fma(_4548, _4462, _4592);
    float _4606 = fma(_4486, _4548, _4594);
    float _4608 = fma(_4486, _4552, _4596);
    float _4610 = fma(_4550, _4378, _4586);
    float _4612 = in.m_75.x;
    float _4614 = fma(_4550, _4462, _4598);
    float _4616 = fma(_4486, _4550, _4600);
    float _4618 = fma(_4580, _4382, _4610);
    float _4620 = fma(_4552, _4378, _4588);
    float _4622 = fma(_4179, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4372);
    float _4624 = fma(_4576, _4382, _4602);
    float _4626 = fma(_4504, _4576, _4606);
    float _4628 = fma(_4504, _4580, _4616);
    float _4630 = fma(_4504, _4582, _4608);
    float _4632 = _4622 + _4233;
    float _4634 = fma(_4582, _4382, _4620);
    float _4636 = _4578 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4638 = fma(_4552, _4462, _4590);
    float _4640 = _4632 * 0.5;
    float _4642 = fma(_4576, _4458, _4604);
    out.m_77.x = _4624;
    out.m_77.y = _4618;
    out.m_77.z = _4634;
    float _4644 = fma(_4580, _4458, _4614);
    float _4646 = fma(_4582, _4458, _4638);
    out.m_79.x = _4626;
    out.m_79.y = _4628;
    out.m_79.z = _4630;
    out.m_81.z = _4640;
    out.m_81.w = _4233;
    out.m_83.x = _4642;
    out.m_83.y = _4644;
    out.m_83.z = _4646;
    float _4648 = -_4386;
    float _4650 = _4648 + 1.0;
    out.gl_Position.x = _4263;
    out.gl_Position.y = _4265;
    out.gl_Position.z = _4622;
    out.gl_Position.w = _4233;
    float _4652 = _4630;
    float _4654 = _4628;
    float _4656 = _4263;
    float _4658 = _4650;
    if (!_4480)
    {
        _4652 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4660 = _4652;
    float _4662 = _4660;
    float _4664 = _4660;
    if (!_4480)
    {
        _4654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4666 = _4654;
    float _4668 = _4666;
    float _4670 = _4666;
    if (!_4480)
    {
        _4416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4672 = _4416;
    float _4674 = _4672;
    float _4676 = _4672;
    if (!_4480)
    {
        _4656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4678 = _4656;
    float _4680 = _4678;
    float _4682 = _4678;
    if (!_4480)
    {
        _4418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4684 = _4418;
    float _4686 = -_4267;
    float _4688 = _4686 + 1.0;
    float _4690 = _4688 * _4636;
    float _4692 = precise::clamp(_4690, 0.0, 1.0);
    float _4694 = -_4692;
    float _4696 = fma(_4694, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4698 = _4696 * _4612;
    float _4700 = _4698 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _4700;
    float _4702 = _4386 * _4299;
    float _4704 = _4310 * _4650;
    float _4706 = _4684;
    float _4708 = _4684;
    if (!_4480)
    {
        _4658 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4710 = _4658;
    float _4712 = _4310 * _4702;
    float _4714 = _4320 * _4702;
    float _4716 = fma(_4316, _4712, _4304);
    float _4718 = fma(_4318, _4712, _4306);
    float _4720 = fma(_4310, _4714, _4308);
    out.m_87.x = _4716;
    out.m_87.y = _4718;
    out.m_87.z = _4720;
    out.m_87.w = _4704;
    bool _4722 = !_4480;
    float _4724 = _4710;
    float _4726 = _4710;
    if (!_4722)
    {
        bool _4728 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4730 = isnan(_3985);
        bool _4732 = _4728 || _4730;
        bool _4734 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4736 = _4732 || _4734;
        if (!_4736)
        {
            float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4740 = _3985 + _4738;
            float _4742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4744 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4742;
            float _4746 = 1.0 / _4744;
            float _4748 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4750 = _4748 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4752 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4754 = _4752 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4756 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4760 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4762 = _4760 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4764 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4768 = _4740 * _4746;
            float _4770 = precise::clamp(_4768, 0.0, 1.0);
            float _4772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4776 = fma(_4770, _4754, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4778 = fma(_4770, _4774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4780 = fma(_4770, _4750, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4782 = fma(_4770, _4758, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4784 = fma(_4770, _4762, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4786 = fma(_4770, _4766, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4670 = _4780;
            _4682 = _4784;
            _4664 = _4778;
            _4676 = _4782;
            _4726 = _4776;
            _4708 = _4786;
            _4788 = true;
        }
        else
        {
            bool _4790 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4792 = isnan(_3985);
            bool _4794 = _4790 || _4792;
            bool _4796 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4798 = _4794 || _4796;
            if (!_4798)
            {
                _4674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4800 = _4674;
            _4676 = _4800;
            if (!_4798)
            {
                _4680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4802 = _4680;
            _4682 = _4802;
            if (!_4798)
            {
                _4706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4804 = _4706;
            _4708 = _4804;
            if (!_4798)
            {
                _4662 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4806 = _4662;
            _4664 = _4806;
            if (!_4798)
            {
                _4668 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4808 = _4668;
            _4670 = _4808;
            if (!_4798)
            {
                _4724 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4810 = _4724;
            bool _4812 = !_4798;
            _4726 = _4810;
            if (!_4812)
            {
                bool _4814 = _3985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4816 = isnan(_3985);
                bool _4818 = _4814 || _4816;
                bool _4820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4822 = _4818 || _4820;
                if (!_4822)
                {
                    float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4826 = _3985 + _4824;
                    float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4830 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4828;
                    float _4832 = 1.0 / _4830;
                    float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4842 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4854 = _4826 * _4832;
                    float _4856 = precise::clamp(_4854, 0.0, 1.0);
                    float _4858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4860 = _4858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4862 = fma(_4856, _4840, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4864 = fma(_4856, _4860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4866 = fma(_4856, _4836, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4868 = fma(_4856, _4844, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4870 = fma(_4856, _4848, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4872 = fma(_4856, _4852, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4670 = _4866;
                    _4682 = _4870;
                    _4664 = _4864;
                    _4676 = _4868;
                    _4726 = _4862;
                    _4708 = _4872;
                    _4788 = true;
                }
                else
                {
                    _4670 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4664 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4726 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4788 = false;
    float _4874 = _4670;
    float _4876 = _4682;
    float _4878 = _4664;
    float _4880 = _4676;
    float _4882 = _4726;
    float _4884 = _4708;
    float _4886 = fma(_4644, -0.5, 0.5);
    float _4888 = precise::clamp(_4886, 0.0, 1.0);
    float _4890 = -_4874;
    float _4892 = _4876 + _4890;
    float _4894 = -_4878;
    float _4896 = _4880 + _4894;
    float _4898 = -_4882;
    float _4900 = _4884 + _4898;
    bool _4902 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4904 = fma(_4888, _4892, _4874);
    float _4906 = fma(_4888, _4896, _4878);
    float _4908 = fma(_4888, _4900, _4882);
    float _4910 = _4904 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _4912 = fma(_4906, 0.298911988735198974609375, _4910);
    float _4914 = fma(_4908, 0.114477999508380889892578125, _4912);
    out.m_89.x = 0.0;
    float _4916 = -_4914;
    float _4918 = _4906 + _4916;
    float _4920 = -_4914;
    float _4922 = _4904 + _4920;
    float _4924 = -_4914;
    float _4926 = _4908 + _4924;
    float _4928 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4930 = fma(_4918, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    float _4932 = fma(_4922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    float _4934 = fma(_4926, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4914);
    out.m_85.w = _4928;
    out.m_91.x = _4930;
    out.m_91.y = _4932;
    out.m_91.z = _4934;
    if (!_4902)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4936 = -_3957;
    float _4938 = _4936 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4940 = -_3959;
    float _4942 = _4940 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4944 = -_3961;
    float _4946 = _4944 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4948 = _4938 * _4938;
    float _4950 = fma(_4942, _4942, _4948);
    float _4952 = fma(_4946, _4946, _4950);
    float _4954 = sqrt(_4952);
    float _4956 = rsqrt(_4952);
    float _4958 = -_4954;
    float _4960 = _4958 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4962 = _4960 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4964 = precise::clamp(_4962, 0.0, 1.0);
    float _4966 = _4942 * _4956;
    float _4968 = _4938 * _4956;
    float _4970 = abs(_4964);
    float _4972 = log2(_4970);
    float _4974 = _4946 * _4956;
    float _4976 = _4966 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4978 = _4644 * _4968;
    float _4980 = -_4968;
    float _4982 = -_4976;
    float _4984 = fma(_4980, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4982);
    float _4986 = fma(_4642, _4966, _4978);
    float _4988 = -_4974;
    float _4990 = fma(_4988, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4984);
    float _4992 = fma(_4646, _4974, _4986);
    float _4994 = precise::clamp(_4992, 0.0, 1.0);
    float _4996 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4998 = _4990 + _4996;
    float _5000 = _4972 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5002 = _4998 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5004 = precise::clamp(_5002, 0.0, 1.0);
    float _5006 = exp2(_5000);
    float _5008 = _5006 * _5004;
    float _5010 = _4994 * _5008;
    float _5012 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5014 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5016 = _5010 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _5012;
    out.m_89.y = _5014;
    out.m_89.z = _5016;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

