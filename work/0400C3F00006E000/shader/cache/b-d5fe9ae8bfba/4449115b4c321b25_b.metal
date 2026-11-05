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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2711 = false;
    bool _2066 = false;
    bool _688 = false;
    bool _544 = false;
    bool _428 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3010 = as_type<float>(_120);
        out.gl_Position.z = _3010;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_51.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3080 = as_type<float>(_158);
        out.gl_Position.z = _3080;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _170 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _174 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _168);
    float _176 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _170);
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _186 = !_166;
    float _204;
    if (!_186)
    {
        float _188 = in.m_55.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        float _208 = float(_104);
        float _210 = 1.0 / _208;
        float _212 = _138 * _210;
        _204 = _212;
    }
    _206 = false;
    float _214 = _204;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = _214 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _214 + _220;
    bool _224 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _214 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = 1.0 / _238;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = 1.0 / _250;
    float _258 = 1.0 / _246;
    float _260 = _218 * _252;
    bool _262 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_214);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -_234;
    float _276 = _274 + 1.0;
    float _278 = _272 * _276;
    float _280 = _222 * _256;
    bool _282 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_214);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    bool _298 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _300 = isnan(_214);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _314 = -_272;
    float _316 = _314 + 1.0;
    float _318 = -_292;
    float _320 = _318 + 1.0;
    float _322 = _242 * _258;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _308 * _320;
    float _334 = fma(_296, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = fma(_326, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = fma(_330, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = _292 * _316;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = _336 * _332;
    float _348 = _338 * _332;
    float _350 = _334 * _332;
    float _352 = -_308;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _362 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _366;
    float _370 = fma(_312, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_358, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_344, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = fma(_370, _340, _360);
    float _386 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _388 = fma(_378, _260, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _390 = fma(_382, _260, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _392 = fma(_372, _340, _362);
    float _394 = fma(_374, _340, _364);
    float _396 = fma(_386, _278, _384);
    float _398 = fma(_388, _278, _392);
    float _400 = fma(_390, _278, _394);
    float _402 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].x, _396);
    float _404 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].y, _398);
    float _406 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].z, _400);
    bool _408 = !_254;
    float _426;
    if (!_408)
    {
        float _410 = in.m_55.x;
        float _412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _414 = _410 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _416 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _418 = _416 * _412;
        float _420 = floor(_418);
        float _422 = -_420;
        float _424 = _418 + _422;
        _426 = _424;
        _428 = true;
    }
    else
    {
        float _430 = float(_104);
        float _432 = 1.0 / _430;
        float _434 = _138 * _432;
        _426 = _434;
    }
    _428 = false;
    float _436 = _426;
    float _438 = in.m_57.x;
    float _440 = in.m_57.y;
    float _442 = in.m_57.z;
    bool _444 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = isnan(_436);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _462 = isnan(_436);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _436 + _476;
    float _480 = -_454;
    float _482 = _480 + 1.0;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _486 = 1.0 / _458;
    float _488 = _470 * _482;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = _406 * _442;
    float _496 = _404 * _440;
    float _498 = _474 * _486;
    float _500 = _402 * _438;
    float _502 = fma(_498, _478, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _504 = _502 * _488;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[115].x, _504);
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[116].x, _510);
    float _520 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = _518 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _524 = !_484;
    float _542;
    if (!_524)
    {
        float _526 = in.m_55.x;
        float _528 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _530 = _526 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _534 = _532 * _528;
        float _536 = floor(_534);
        float _538 = -_536;
        float _540 = _534 + _538;
        _542 = _540;
        _544 = true;
    }
    else
    {
        float _546 = float(_104);
        float _548 = 1.0 / _546;
        float _550 = _138 * _548;
        _542 = _550;
    }
    _544 = false;
    float _552 = _542;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _556 = _552 + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _562 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _564 = isnan(_552);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _578 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _580 = isnan(_552);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _590;
    bool _594 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _596 = isnan(_552);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _560;
    float _608 = -_572;
    float _610 = _608 + 1.0;
    bool _612 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _614 = _588 * _610;
    float _616 = -_588;
    float _618 = _616 + 1.0;
    float _620 = 1.0 / _576;
    float _622 = _592 * _606;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _628 = fma(_622, _556, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _630 = -_604;
    float _632 = _630 + 1.0;
    float _634 = _628 * _614;
    float _636 = _626 * _620;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _640 = _552 + _638;
    float _642 = _572 * _632;
    float _644 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _634);
    float _646 = fma(_636, _640, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _648 = fma(_646, _642, _644);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _656 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[133].x, _648);
    float _658 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _666 = !_612;
    float _668 = _664;
    float _686;
    if (!_666)
    {
        float _670 = in.m_55.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_104);
        float _692 = 1.0 / _690;
        float _694 = _138 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_55.x;
    float _700 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = in.m_55.y;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _710 = in.m_55.z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    float _730 = in.m_55.w;
    bool _732 = !_714;
    int _734 = _732 ? 0 : 1;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _740 = _698 * 2.0;
    float _742 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _744 = _702 * 2.0;
    float _746 = floor(_740);
    float _748 = _728 * _138;
    float _750 = -_724;
    float _752 = fma(_742, 2.0, _750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _754;
    float _758 = _724;
    bool _760 = _718;
    if (!_706)
    {
        _758 = _702;
    }
    float _762 = _758;
    float _764 = -_138;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    float _768 = _762;
    if (_706)
    {
        _768 = _698;
    }
    float _770 = _768;
    float _772 = floor(_744);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _776 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _780 = _730 > 0.5;
    float _782 = _182 * _182;
    float _784 = fma(_776, -2.0, _774);
    float _786 = _774;
    float _788 = _778;
    float _790 = _770;
    bool _792 = _780;
    if (!_706)
    {
        _786 = _702;
    }
    float _794 = _786;
    float _796 = exp2(_748);
    bool _798 = _746 >= 0.0;
    bool _800 = isnan(_746);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[83].z, _778);
    bool _810 = _746 > 0.0;
    float _812 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    int _814 = _806 ? 0 : 1;
    float _816 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _822 = _772 > 0.0;
    bool _824 = _772 >= 0.0;
    bool _826 = isnan(_772);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _710 * 2.0;
    float _836 = _794;
    if (_706)
    {
        _836 = _698;
    }
    float _838 = _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _842 = -_796;
    float _844 = _842 + 1.0;
    if (!_706)
    {
        _788 = _698;
    }
    float _846 = _788;
    float _848 = floor(_834);
    float _850 = _846;
    if (_706)
    {
        _850 = _710;
    }
    float _852 = _850;
    float _854 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _858 = _852;
    if (!_706)
    {
        _790 = _710;
    }
    float _860 = _790;
    float _862 = -_840;
    float _864 = fma(_854, 2.0, _862);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[84].z, _856);
    int _868 = _832 ? 0 : 1;
    float _870 = -_138;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[81].x, _864);
    int _874 = ~_814;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _882 = _878;
    float _884 = _860;
    if (!_810)
    {
        int _886 = ~_814;
        int _888 = _886 + 1;
        _882 = _888;
    }
    int _890 = _882;
    float _892 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _866);
    if (!_706)
    {
        _858 = _860;
    }
    float _894 = _858;
    float _896 = 1.0 / _738;
    bool _898 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _894;
    if (_706)
    {
        _884 = _702;
    }
    float _910 = _884;
    int _912 = ~_868;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = _916;
    if (_706)
    {
        _908 = _702;
    }
    float _920 = _908;
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[83].w, _880);
    if (!_822)
    {
        int _924 = ~_868;
        int _926 = _924 + 1;
        _918 = _926;
    }
    int _928 = _918;
    bool _930 = _848 > 0.0;
    float _932 = _920 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _934 = _848 >= 0.0;
    bool _936 = isnan(_848);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _906 ? _844 : 0.0;
    float _946 = _756 * _896;
    bool _948 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(1.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _960 = 1.0 + _958;
    float _962 = 1.0 / _960;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _968 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].z, _964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _972 = fma(_932, -2.0, _966);
    float _974 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _968);
    float _976 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].w, _970);
    int _978 = _942 ? 0 : 1;
    float _980 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _922);
    float _982 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _972);
    float _984 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _976);
    int _986 = ~_978;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    float _994 = as_type<float>(_928);
    if (_956)
    {
        float _996 = _944 * _962;
        _140 = _996;
    }
    float _998 = _140;
    if (!_930)
    {
        int _1000 = ~_978;
        int _1002 = _1000 + 1;
        _992 = _1002;
    }
    int _1004 = _992;
    float _1006 = in.m_59.x;
    float _1008 = in.m_59.y;
    float _1010 = in.m_59.z;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1022 = _1020 != 0;
    float _1024 = in.m_46.x;
    float _1026 = in.m_46.y;
    float _1028 = in.m_46.z;
    float _1030 = 1.0 / _1014;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1042 = _1040 != 0;
    float _1044 = 1.0 / _1018;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1050 = !_718;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1062 = 1.0 / _1048;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1066 = _820 * _1030;
    int _1068 = abs(_1052);
    float _1070 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1074 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1076 = 1.0 / _1060;
    float _1078 = _700 * _1064;
    float _1080 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1072);
    float _1084 = fma(_180, _180, _782);
    float _1086 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1092 = fma(_184, _184, _1084);
    float _1094 = 1.0 / _1056;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1104;
    float _1108 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1110 = _1098 * _1044;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1116 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1118 = 1.0 / _1090;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1122 = _696 + _1120;
    float _1124 = _1102 * _1062;
    float _1126 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1082);
    bool _1128 = !_722;
    int _1130 = _1128 ? 0 : 1;
    float _1132 = fma(_1110, _1122, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1136 = _696 + _1134;
    float _1138 = _698 + _702;
    float _1140 = rsqrt(_1092);
    float _1142 = _1106 * _1076;
    float _1144 = _1138 + (-1.0);
    float _1146 = in.m_61.x;
    int _1148 = abs(_1130);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1150;
    float _1154 = _1114 * _1118;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1158 = _696 + _1156;
    float _1160 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1162 = _1152 * _1094;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1166 = _696 + _1164;
    float _1168 = fma(_946, _1158, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1170 = float(_890);
    float _1172 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1174 = _182 * _1140;
    float _1176 = fma(_1066, _1166, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _696 + _1178;
    float _1182 = _180 * _1140;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1186 = _184 * _1140;
    float _1188 = fma(_1124, _1180, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1190 = fma(_1142, _1136, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1184);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1196 = _696 + _1194;
    float _1198 = _702 + _710;
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1192);
    float _1202 = fma(_1162, _1196, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1204 = _1198 + (-1.0);
    float _1206 = float(_1068);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1210 = _696 + _1208;
    float _1212 = abs(_1200);
    bool _1214 = _1212 > 0.99989998340606689453125;
    float _1216 = _698 + _710;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1220 = float(_928);
    float _1222 = _1206 * _1170;
    float _1224 = _1216 + (-1.0);
    float _1226 = fma(_1154, _1210, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1230 = in.m_63.x;
    float _1232 = in.m_63.y;
    float _1234 = in.m_63.z;
    int _1236 = abs(_734);
    float _1238 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1240 = float(_1148);
    float _1242 = _1108 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1244 = as_type<float>(_1148);
    float _1246 = _1206;
    float _1248 = _1154;
    float _1250 = _1008;
    if (_1214)
    {
        _1244 = 0.001000000047497451305389404296875;
    }
    float _1252 = _1244;
    if (!_1214)
    {
        _994 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1254 = _994;
    float _1256 = _1240 * _1220;
    float _1258 = 0.0;
    float _1260 = _1254;
    if (!_1214)
    {
        _1258 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1262 = _1258;
    float _1264 = _1262;
    if (_1214)
    {
        float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1260 = _1266;
    }
    float _1268 = _1260;
    if (!_1214)
    {
        _1246 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1270 = _1246;
    float _1272 = _1270;
    if (_1214)
    {
        float _1274 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1264 = _1274;
    }
    float _1276 = _1264;
    if (_1214)
    {
        float _1278 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1272 = _1278;
    }
    float _1280 = _1272;
    float _1282 = _1222 * (-2.0);
    float _1284 = _1256 * (-2.0);
    bool _1286 = _702 > 0.5;
    float _1288 = _702 + (-0.5);
    if (_1034)
    {
        bool _1290 = _710 > 0.5;
        _760 = _1290;
    }
    bool _1292 = _760;
    float _1294 = _710 + (-0.5);
    float _1296 = float(_1236);
    bool _1298 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1300 = isnan(_696);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = fma(_1282, _1232, _1232);
    float _1312 = fma(_1284, _1234, _1234);
    float _1314 = float(_1004);
    float _1316 = fma(_1218, _1282, _1218);
    float _1318 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1310);
    float _1320 = fma(_1228, _1284, _1228);
    float _1322 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1312);
    float _1324 = -_1268;
    float _1326 = _1186 * _1324;
    float _1328 = _1296 * _1314;
    float _1330 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _698);
    float _1332 = fma(_1316, _998, _1318);
    float _1334 = in.m_61.y;
    float _1336 = fma(_1320, _998, _1322);
    float _1338 = -_1280;
    float _1340 = _1174 * _1338;
    float _1342 = -_1280;
    float _1344 = -_1326;
    float _1346 = fma(_1182, _1342, _1344);
    float _1348 = -_1276;
    float _1350 = _1182 * _1348;
    bool _1352 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1354 = isnan(_696);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = _1330 + _1008;
    float _1366 = -_1276;
    float _1368 = -_1340;
    float _1370 = fma(_1186, _1366, _1368);
    float _1372 = -_1268;
    float _1374 = -_1350;
    float _1376 = fma(_1174, _1372, _1374);
    float _1378 = _1328 * (-2.0);
    bool _1380 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1382 = isnan(_696);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1388 = _1384 || _1386;
    float _1390 = float(_1388);
    float _1392 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1394 = -_1362;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1378, _1230, _1230);
    float _1400 = fma(_1160, _1378, _1160);
    bool _1402 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1404 = isnan(_696);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = _1392 * 0.15915493667125701904296875;
    float _1416 = _1390 * _1396;
    float _1418 = -_1390;
    float _1420 = _1418 + 1.0;
    bool _1422 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1424 = isnan(_696);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = -_1412;
    float _1436 = _1434 + 1.0;
    float _1438 = _1332 * 0.15915493667125701904296875;
    float _1440 = _1412 * _1420;
    float _1442 = _698 + (-0.5);
    bool _1444 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1446 = isnan(_696);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = -_1432;
    float _1458 = _1456 + 1.0;
    float _1460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1398);
    float _1464 = -_1334;
    float _1466 = _1464 + 1.0;
    float _1468 = _1454 * _1458;
    float _1470 = -_1454;
    float _1472 = _1470 + 1.0;
    bool _1474 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1476 = isnan(_696);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = in.m_65.x;
    int _1488 = _780 ? as_type<int>(_1466) : as_type<int>(_1334);
    float _1490 = _1414 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = _1334;
    int _1496 = as_type<int>(_1438);
    if (_1022)
    {
        bool _1498 = _698 > 0.5;
        _792 = _1498;
    }
    bool _1500 = _792;
    float _1502 = _1346 * _1346;
    float _1504 = _1432 * _1436;
    float _1506 = _1484 * _1472;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1400, _998, _1462);
    bool _1514 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1516 = isnan(_696);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1528 = fma(_1370, _1370, _1502);
    float _1530 = -_1308;
    float _1532 = _1530 + 1.0;
    float _1534 = _1038 ? as_type<float>(_1488) : _1334;
    float _1536 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1538 = _1308 * _1510;
    float _1540 = _1524 * _1532;
    float _1542 = _1336 * 0.15915493667125701904296875;
    float _1544 = fma(_1534, _1536, -0.5);
    float _1546 = _1512 * 0.15915493667125701904296875;
    float _1548 = fma(_1376, _1376, _1528);
    float _1550 = _1168 * _1540;
    float _1552 = _1438 * 6.283185482025146484375;
    float _1554 = sin(_1552);
    int _1556 = as_type<int>(_1540);
    if (_1042)
    {
        float _1558 = _1286 ? _1466 : _1334;
        _1494 = _1558;
    }
    float _1560 = _1494;
    float _1562 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1564 = _1492;
    if (_1022)
    {
        float _1566 = -_1146;
        float _1568 = _1566 + 1.0;
        _1556 = as_type<int>(_1568);
    }
    int _1570 = _1556;
    float _1572 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1022)
    {
        _1248 = _1146;
    }
    float _1574 = _1248;
    float _1576 = _1562 * _1486;
    float _1578 = _1574;
    if (!_1034)
    {
        _1564 = _1146;
    }
    float _1580 = _1564;
    float _1582 = _1438 * 6.283185482025146484375;
    float _1584 = cos(_1582);
    float _1586 = fma(_1572, _1560, -0.5);
    float _1588 = _1580;
    if (_1022)
    {
        float _1590 = _1500 ? as_type<float>(_1570) : _1146;
        _1578 = _1590;
    }
    float _1592 = _1578;
    float _1594 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1596 = -_1524;
    float _1598 = _1596 + 1.0;
    float _1600 = _1576 + _1006;
    float _1602 = -_812;
    float _1604 = fma(_984, _1586, _1602);
    float _1606 = _1542 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    if (_1034)
    {
        float _1610 = -_1146;
        float _1612 = _1610 + 1.0;
        _1496 = as_type<int>(_1612);
    }
    int _1614 = _1496;
    float _1616 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1550);
    float _1618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    if (_1034)
    {
        float _1620 = _1292 ? as_type<float>(_1614) : _1146;
        _1588 = _1620;
    }
    float _1622 = _1588;
    float _1624 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1626 = _1546 * 6.283185482025146484375;
    float _1628 = sin(_1626);
    float _1630 = _1576 + _1010;
    bool _1632 = _1008 != 0.0;
    bool _1634 = isnan(_1008);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1624 * _1618;
    float _1644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1630);
    float _1646 = -_1006;
    bool _1648 = _1576 == _1646;
    bool _1650 = !_1640;
    bool _1652 = _1648 && _1650;
    float _1654 = _1546 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _1594 * _1644;
    float _1660 = _1584 * _1608;
    float _1662 = _1554 * _1608;
    float _1664 = -_1010;
    bool _1666 = _1576 == _1664;
    bool _1668 = _1666 && _1652;
    float _1670 = in.m_65.w;
    float _1672 = rsqrt(_1548);
    float _1674 = _1628 * _1584;
    float _1676 = _1628 * _1554;
    float _1678 = _1542 * 6.283185482025146484375;
    float _1680 = sin(_1678);
    float _1682 = _1656 * _1608;
    float _1684 = _1682 * _1182;
    float _1686 = _1682 * _1186;
    float _1688 = _1376 * _1672;
    float _1690 = _1656 * _1584;
    float _1692 = _1628 * _1608;
    float _1694 = _1656 * _1554;
    float _1696 = _1370 * _1672;
    float _1698 = _1346 * _1672;
    float _1700 = _1174 * _1688;
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1704 = fma(_1680, _1690, _1676);
    float _1706 = -_1694;
    float _1708 = fma(_1680, _1674, _1706);
    float _1710 = -_1674;
    float _1712 = fma(_1680, _1694, _1710);
    float _1714 = fma(_1680, _1676, _1690);
    float _1716 = _1704 * _1182;
    float _1718 = -_1700;
    float _1720 = fma(_1186, _1698, _1718);
    float _1722 = _1712 * _1182;
    float _1724 = -_1680;
    float _1726 = fma(_1724, _1696, _1684);
    float _1728 = _1182 * _1698;
    float _1730 = fma(_1660, _1696, _1716);
    float _1732 = fma(_1662, _1696, _1722);
    float _1734 = fma(_1692, _1720, _1726);
    float _1736 = _1704 * _1186;
    float _1738 = -_1728;
    float _1740 = fma(_1174, _1696, _1738);
    float _1742 = -_1680;
    float _1744 = fma(_1742, _1688, _1686);
    float _1746 = fma(_1708, _1720, _1730);
    float _1748 = fma(_1714, _1720, _1732);
    float _1750 = _1712 * _1186;
    float _1752 = fma(_1660, _1688, _1736);
    float _1754 = fma(_1692, _1740, _1744);
    float _1756 = _1078 * _1734;
    float _1758 = fma(_1662, _1688, _1750);
    float _1760 = fma(_1708, _1740, _1752);
    float _1762 = _1078 * _1754;
    float _1764 = fma(_1642, _1746, _1756);
    float _1766 = fma(_1714, _1740, _1758);
    float _1768 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1770 = fma(_1642, _1760, _1762);
    float _1772 = fma(_1658, _1748, _1764);
    float _1774 = fma(_1176, _1538, _1616);
    float _1776 = fma(_1768, _1592, -0.5);
    float _1778 = fma(_1658, _1766, _1770);
    float _1780 = _1172 + _1772;
    float _1782 = _892 * (-0.15915493667125701904296875);
    float _1784 = fma(_974, _1776, _766);
    float _1786 = _1238 + _1778;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1790 = _1780 + _1788;
    float _1792 = fma(_1132, _1506, _1774);
    float _1794 = _1186 * _1696;
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1798 = _1786 + _1796;
    float _1800 = _1790 * _1790;
    float _1802 = _1682 * _1174;
    float _1804 = _708 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1806 = _1798 * _1798;
    float _1808 = -_1794;
    float _1810 = fma(_1182, _1688, _1808);
    float _1812 = _1704 * _1174;
    float _1814 = -_1680;
    float _1816 = fma(_1814, _1698, _1802);
    float _1818 = _1800 + _1806;
    float _1820 = fma(_1804, _1622, -0.5);
    float _1822 = fma(_1188, _1468, _1792);
    float _1824 = _1712 * _1174;
    float _1826 = sqrt(_1818);
    float _1828 = in.m_67.x;
    float _1830 = in.m_67.y;
    float _1832 = in.m_67.z;
    float _1834 = fma(_1660, _1698, _1812);
    float _1836 = fma(_1692, _1810, _1816);
    float _1838 = fma(_1190, _1504, _1822);
    float _1840 = fma(_1662, _1698, _1824);
    float _1842 = fma(_1708, _1810, _1834);
    float _1844 = _1078 * _1836;
    float _1846 = _1782 * 6.283185482025146484375;
    float _1848 = sin(_1846);
    float _1850 = fma(_1226, _1440, _1838);
    float _1852 = fma(_1714, _1810, _1840);
    float _1854 = fma(_1642, _1842, _1844);
    float _1856 = fma(_1202, _1416, _1850);
    float _1858 = fma(_1658, _1852, _1854);
    float _1860 = _1782 * 6.283185482025146484375;
    float _1862 = cos(_1860);
    bool _1864 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1856);
    float _1868 = _1242 + _1858;
    float _1870 = fma(_1866, _1486, _1868);
    float _1872 = _1848 * _1544;
    float _1874 = _1830;
    float _1876 = _1800;
    float _1878 = _1806;
    float _1880 = _1780;
    float _1882 = _1786;
    float _1884 = _1826;
    float _1886 = _1828;
    float _1888 = _1832;
    float _1890 = _1670;
    if (!_1668)
    {
        float _1892 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1830);
        _1874 = _1892;
    }
    float _1894 = _1874;
    if (!_1864)
    {
        _1250 = _1870;
    }
    float _1896 = _1250;
    float _1898 = _1862 * _1544;
    float _1900 = -_1872;
    float _1902 = fma(_1862, _1820, _1900);
    float _1904 = fma(_1848, _1820, _1898);
    float _1906 = fma(_816, _1902, _872);
    bool _1908 = !_1864;
    float _1910 = _1896;
    if (!_1908)
    {
        float _1912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1916 = _1826 + _1914;
        float _1918 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1920 = rsqrt(_1818);
        float _1922 = _1916 * _1912;
        float _1924 = _1922 * 0.15915493667125701904296875;
        float _1926 = _1924 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1924 * 6.283185482025146484375;
        float _1932 = cos(_1930);
        float _1934 = fma(_1928, _1918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1936 = _1920 * _1934;
        float _1938 = fma(_1790, _1936, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1940 = _1932 + (-1.0);
        float _1942 = fma(_1798, _1936, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1946 = _1938 + _1944;
        float _1948 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1952 = _1942 + _1950;
        float _1954 = _1946 * _1946;
        float _1956 = fma(_1870, _1932, _1948);
        float _1958 = _1952 * _1952;
        _1910 = _1956;
        _1876 = _1954;
        _1878 = _1958;
        _1880 = _1938;
        _1882 = _1942;
        _1884 = _1948;
    }
    float _1960 = _1910;
    float _1962 = _1876;
    float _1964 = _1878;
    float _1966 = _1880;
    float _1968 = _1882;
    float _1970 = _1884;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1974 = _1960 + _1972;
    float _1976 = _1970;
    if (!_1668)
    {
        float _1978 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1828);
        _1886 = _1978;
    }
    float _1980 = _1886;
    float _1982 = _1734 * _1894;
    if (!_1668)
    {
        float _1984 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1832);
        _1888 = _1984;
    }
    float _1986 = _1888;
    float _1988 = fma(_1974, _1974, _1962);
    float _1990 = _1836 * _1894;
    float _1992 = _1754 * _1894;
    float _1994 = fma(_1746, _1980, _1982);
    float _1996 = _1988 + _1964;
    float _1998 = fma(_1842, _1980, _1990);
    float _2000 = -_982;
    float _2002 = fma(_980, _1904, _2000);
    float _2004 = fma(_1760, _1980, _1992);
    float _2006 = fma(_1748, _1986, _1994);
    float _2008 = fma(_1852, _1986, _1998);
    float _2010 = sqrt(_1996);
    float _2012 = _1604 + 0.5;
    float _2014 = _1784 + 0.5;
    float _2016 = _1906 + 0.5;
    float _2018 = _2002 + 0.5;
    float _2020 = fma(_1766, _1986, _2004);
    out.m_69.x = _514;
    out.m_69.y = _516;
    out.m_69.z = _520;
    out.m_69.w = _522;
    out.m_71.x = _660;
    out.m_71.y = _658;
    out.m_71.z = _662;
    out.m_71.w = _664;
    out.m_73.w = _1670;
    bool _2022 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2024 = isnan(_2010);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2030 = _2026 || _2028;
    out.m_75.x = _2014;
    out.m_75.y = _2012;
    out.m_75.z = _2016;
    out.m_75.w = _2018;
    out.m_77.x = _2006;
    out.m_77.y = _2008;
    out.m_77.z = _2020;
    if (!_2030)
    {
        _1976 = 1.0;
    }
    float _2032 = _1976;
    bool _2034 = !_2030;
    float _2036 = _2032;
    if (!_2034)
    {
        bool _2038 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2040 = isnan(_2010);
        bool _2042 = _2038 || _2040;
        bool _2044 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2046 = _2042 || _2044;
        if (!_2046)
        {
            float _2048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2050 = _2010 + _2048;
            float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2054 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2052;
            float _2056 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2060 = 1.0 / _2054;
            float _2062 = _2050 * _2060;
            float _2064 = fma(_2062, _2058, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2036 = _2064;
            _2066 = true;
        }
        else
        {
            bool _2068 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2070 = isnan(_2010);
            bool _2072 = _2068 || _2070;
            bool _2074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2076 = _2072 || _2074;
            if (!_2076)
            {
                float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2080 = _2010 + _2078;
                float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2084 = _2082 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2086 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2088 = _2086 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2090 = 1.0 / _2084;
                float _2092 = _2080 * _2090;
                float _2094 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2036 = _2094;
                _2066 = true;
            }
            else
            {
                _2036 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2066 = false;
    float _2096 = _2036;
    float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2100 = _1960 + _2098;
    float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2104 = _1966 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2108 = _1968 + _2106;
    float _2110 = fma(_2100, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2112 = fma(_2104, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2114 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2118 = _2110 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2122 = _2112 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2114 + _2124;
    float _2128 = _2118 * _2118;
    float _2130 = fma(_2122, _2122, _2128);
    float _2132 = fma(_2126, _2126, _2130);
    float _2134 = rsqrt(_2132);
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2122 * _2136;
    float _2140 = _2126 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2126;
    float _2158 = _2154;
    float _2160 = _2118;
    if (_2150)
    {
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2162;
    }
    float _2164 = _2156;
    if (_2150)
    {
        float _2166 = rsqrt(_2146);
        _668 = _2166;
    }
    float _2168 = _668;
    float _2170 = _2168;
    if (_2150)
    {
        float _2172 = _2154 * _2164;
        _2158 = _2172;
    }
    float _2174 = _2158;
    if (_2150)
    {
        float _2176 = _2174 * 0.15915493667125701904296875;
        _1890 = _2176;
    }
    float _2178 = _1890;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2182 = _2134;
    if (_2150)
    {
        float _2184 = _2178 * 6.283185482025146484375;
        float _2186 = sin(_2184);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2192 = precise::max(0.0, _2190);
    float _2194 = _2100;
    float _2196 = _2192;
    float _2198 = _2190;
    if (_2150)
    {
        float _2200 = _2178 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        _2194 = _2202;
    }
    float _2204 = _2194;
    float _2206 = -_2136;
    float _2208 = -_2192;
    float _2210 = fma(_2118, _2206, _2208);
    float _2212 = _2210;
    if (!_2150)
    {
        _2196 = _2140;
    }
    float _2214 = _2196;
    float _2216 = _2214;
    if (_2150)
    {
        float _2218 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2198 = _2218;
    }
    float _2220 = _2198;
    float _2222 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2224 = _2188;
    float _2226 = _2220;
    if (_2150)
    {
        float _2228 = fma(_2188, _2220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2160 = _2228;
    }
    float _2230 = _2160;
    float _2232 = _2230;
    if (!_2150)
    {
        _2224 = _2138;
    }
    float _2234 = _2224;
    float _2236 = _2234;
    if (_2150)
    {
        float _2238 = _2168 * _2230;
        _2232 = _2238;
    }
    float _2240 = _2232;
    if (_2150)
    {
        float _2242 = _2204 + (-1.0);
        _2226 = _2242;
    }
    float _2244 = _2226;
    float _2246 = _2244;
    if (!_2150)
    {
        _2170 = _2142;
    }
    float _2248 = _2170;
    float _2250 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2252 = _2248;
    if (_2150)
    {
        float _2254 = _2138 * _2240;
        _2236 = _2254;
    }
    float _2256 = _2236;
    if (_2150)
    {
        float _2258 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2258;
    }
    float _2260 = _2246;
    float _2262 = _2260;
    if (_2150)
    {
        float _2264 = _2140 * _2240;
        _2216 = _2264;
    }
    float _2266 = _2216;
    float _2268 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2150)
    {
        float _2270 = _2256 * _2256;
        _2252 = _2270;
    }
    float _2272 = _2252;
    if (_2150)
    {
        float _2274 = fma(_2210, _2204, _2260);
        _2212 = _2274;
    }
    float _2276 = _2212;
    if (!_2150)
    {
        _2262 = _2144;
    }
    float _2278 = _2262;
    float _2280 = _2278;
    if (_2150)
    {
        float _2282 = _2266 * _2266;
        _2280 = _2282;
    }
    float _2284 = _2280;
    float _2286 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2268);
    float _2288 = fma(_2276, _2276, _2272);
    float _2290 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2222);
    float _2292 = sqrt(_2132);
    float _2294 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2286);
    float _2296 = _2288 + _2284;
    float _2298 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2300 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2302 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2298);
    float _2304 = rsqrt(_2296);
    float _2306 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2290);
    float _2308 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2250);
    float _2310 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2302);
    float _2312 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2314 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2308);
    float _2316 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2320 = fma(_2292, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2318);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2326 = -_2322;
    float _2328 = _2326 + 1.0;
    float _2330 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2332 = -_2324;
    float _2334 = fma(_2332, _2180, 1.0);
    float _2336 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2338 = _2304 * _2276;
    float _2340 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2330);
    float _2342 = abs(_2328);
    float _2344 = log2(_2342);
    float _2346 = _2304 * _2256;
    float _2348 = _2304 * _2266;
    float _2350 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2340);
    float _2352 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2356 = log2(_2334);
    float _2358 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2360 = -_2354;
    float _2362 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2360);
    float _2364 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2358);
    float _2366 = -_2348;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2362);
    float _2370 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2372 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2374 = 1.0 / _2352;
    float _2376 = fma(_2368, -0.5, 0.5);
    float _2378 = fma(_2368, 0.5, 0.5);
    float _2380 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2372);
    float _2382 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2364);
    float _2384 = _2338 + 1.0;
    float _2386 = fma(_2378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2388 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2380);
    float _2390 = exp2(_2370);
    float _2392 = fma(_2378, _2386, -0.212114393711090087890625);
    float _2394 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2388);
    float _2396 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2382);
    float _2398 = fma(_2378, _2392, 1.570728778839111328125);
    float _2400 = sqrt(_2376);
    float _2402 = _2394 * _2374;
    float _2404 = fma(_2402, 0.5, 0.5);
    float _2406 = -_2338;
    float _2408 = fma(_2390, _2384, _2406);
    float _2410 = _2356 * 0.693147182464599609375;
    float _2412 = _2396 * _2374;
    float _2414 = fma(_2408, 0.5, 0.5);
    float _2416 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2418 = fma(_2412, -0.5, 0.5);
    float _2420 = _2400 * 0.636619746685028076171875;
    float _2422 = -_2398;
    float _2424 = fma(_2420, _2422, 1.0);
    float3 _6742 = float3(_2404, _2418, _2416);
    float _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6742, float3(0.0), isnan(_6742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6742, float3(0.0), isnan(_6742)), level(0.0)).x;
    float3 _6753 = float3(_2404, _2418, _2416);
    float4 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6753, float3(0.0), isnan(_6753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6753, float3(0.0), isnan(_6753)), level(0.0)).xyzw;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = _2429.w;
    float2 _6770 = float2(_2424, _2414);
    float3 _2441 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6770, float2(0.0), isnan(_6770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6770, float2(0.0), isnan(_6770)), level(0.0)).xyz;
    float _2443 = _2441.x;
    float _2445 = _2441.y;
    float _2447 = _2441.z;
    float _2449 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2451 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2453 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2455 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2457 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2449);
    float _2459 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2453);
    float _2461 = exp2(_2451);
    float _2463 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2457);
    float _2465 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2455);
    float _2467 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2469 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2471 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(0.5);
    bool _2479 = _2475 || _2477;
    float _2481 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2465);
    float _2483 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2467);
    float _2485 = 1.0 / _2469;
    float _2487 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2489 = _2483 + _2352;
    float _2491 = _2487 + _2469;
    float _2493 = -_2461;
    float _2495 = _2493 + 1.0;
    float _2497 = _2489 * 0.5;
    float _2499 = _2491 * _2485;
    float _2501 = _2499 * 0.5;
    float _2503 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2505 = _2495;
    float _2507 = _2352;
    float _2509 = _2483;
    float _2511 = _2396;
    float _2513 = _2394;
    if (_2479)
    {
        _2505 = 1.0;
    }
    float _2515 = _2505;
    float _2517 = _2515;
    float _2519 = _2433;
    float _2521 = _2431;
    if (!_2479)
    {
        float _2523 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = _2525 * 6.283185482025146484375;
        float _2529 = cos(_2527);
        float _2531 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2533 = _2531 * 0.15915493667125701904296875;
        float _2535 = _2525 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2541 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2539);
        float _2543 = 1.0 / _2529;
        float _2545 = _2533 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = _2537 * _2543;
        float _2551 = 1.0 / _2541;
        float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2555 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2553;
        float _2557 = _2547 * _2549;
        float _2559 = _2533 * 6.283185482025146484375;
        float _2561 = sin(_2559);
        float _2563 = 1.0 / _2557;
        float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2567 = _2551 * _2565;
        float _2569 = 1.0 / _2555;
        float _2571 = _2561 * _2563;
        float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2575 = fma(_2571, _2567, _2573);
        float _2577 = _2575 * _2569;
        float _2579 = precise::clamp(_2577, 0.0, 1.0);
        _2517 = _2579;
    }
    float _2581 = _2517;
    float _2583 = _2503 * _2426;
    float _2585 = -_2503;
    float _2587 = _2585 + 1.0;
    out.m_79.z = _2497;
    out.m_79.w = _2352;
    bool _2589 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2591 = isnan(_2292);
    bool _2593 = _2589 || _2591;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2597 = _2593 || _2595;
    float _2599 = _2437 * _2583;
    float _2601 = _2447 * _2583;
    float _2603 = _2437 * _2587;
    float _2605 = fma(_2443, _2599, _2431);
    float _2607 = fma(_2445, _2599, _2433);
    float _2609 = fma(_2437, _2601, _2435);
    out.gl_Position.x = _2394;
    out.gl_Position.y = _2396;
    out.gl_Position.z = _2483;
    out.gl_Position.w = _2352;
    float _2611 = _2581 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _2605;
    out.m_81.y = _2607;
    out.m_81.z = _2609;
    out.m_81.w = _2603;
    if (!_2597)
    {
        _2519 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2613 = _2519;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2597)
    {
        _2521 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2619 = _2521;
    float _2621 = _2619;
    float _2623 = _2619;
    if (!_2597)
    {
        _2507 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2625 = _2507;
    float _2627 = _2625;
    float _2629 = _2625;
    if (!_2597)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2631 = _2509;
    float _2633 = _2631;
    float _2635 = _2631;
    if (!_2597)
    {
        _2511 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2637 = _2511;
    float _2639 = _2637;
    float _2641 = _2637;
    if (!_2597)
    {
        _2513 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2643 = _2513;
    bool _2645 = !_2597;
    float _2647 = _2643;
    float _2649 = _2643;
    if (!_2645)
    {
        bool _2651 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2653 = isnan(_2292);
        bool _2655 = _2651 || _2653;
        bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2659 = _2655 || _2657;
        if (!_2659)
        {
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2663 = _2292 + _2661;
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2665;
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2673 = 1.0 / _2667;
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2681 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2689 = _2687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2691 = _2663 * _2673;
            float _2693 = precise::clamp(_2691, 0.0, 1.0);
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2699 = fma(_2693, _2671, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2701 = fma(_2693, _2697, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2703 = fma(_2693, _2677, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2705 = fma(_2693, _2681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2707 = fma(_2693, _2685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2709 = fma(_2693, _2689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2623 = _2703;
            _2641 = _2707;
            _2617 = _2699;
            _2635 = _2705;
            _2629 = _2701;
            _2649 = _2709;
            _2711 = true;
        }
        else
        {
            bool _2713 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2715 = isnan(_2292);
            bool _2717 = _2713 || _2715;
            bool _2719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2721 = _2717 || _2719;
            if (!_2721)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2723 = _2615;
            _2617 = _2723;
            if (!_2721)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2725 = _2621;
            _2623 = _2725;
            if (!_2721)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2727 = _2627;
            _2629 = _2727;
            if (!_2721)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2729 = _2633;
            _2635 = _2729;
            if (!_2721)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2731 = _2639;
            _2641 = _2731;
            if (!_2721)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2733 = _2647;
            bool _2735 = !_2721;
            _2649 = _2733;
            if (!_2735)
            {
                bool _2737 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2739 = isnan(_2292);
                bool _2741 = _2737 || _2739;
                bool _2743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2745 = _2741 || _2743;
                if (!_2745)
                {
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2749 = _2292 + _2747;
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2751;
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2759 = 1.0 / _2753;
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2777 = _2749 * _2759;
                    float _2779 = precise::clamp(_2777, 0.0, 1.0);
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2785 = fma(_2779, _2757, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2787 = fma(_2779, _2783, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2789 = fma(_2779, _2763, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2791 = fma(_2779, _2767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2793 = fma(_2779, _2771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2795 = fma(_2779, _2775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2623 = _2789;
                    _2641 = _2793;
                    _2617 = _2785;
                    _2635 = _2791;
                    _2629 = _2787;
                    _2649 = _2795;
                    _2711 = true;
                }
                else
                {
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2711 = false;
    float _2797 = _2623;
    float _2799 = _2641;
    float _2801 = _2617;
    float _2803 = _2635;
    float _2805 = _2629;
    float _2807 = _2649;
    float _2809 = _2611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2811 = fma(_2008, -0.5, 0.5);
    float _2813 = precise::clamp(_2811, 0.0, 1.0);
    float _2815 = -_2797;
    float _2817 = _2815 + _2799;
    float _2819 = -_2801;
    float _2821 = _2819 + _2803;
    out.m_83.x = 0.0;
    float _2823 = fma(_2813, _2817, _2797);
    float _2825 = -_2805;
    float _2827 = _2825 + _2807;
    float _2829 = fma(_2813, _2821, _2801);
    float _2831 = _2823 * 0.586610972881317138671875;
    bool _2833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2835 = fma(_2813, _2827, _2805);
    out.m_49.x = _2809;
    float _2837 = fma(_2829, 0.298911988735198974609375, _2831);
    bool _2839 = _2581 > 0.0;
    bool _2841 = isnan(_2581);
    bool _2843 = _2839 || _2841;
    bool _2845 = isnan(0.0);
    bool _2847 = _2843 || _2845;
    float _2849 = fma(_2835, 0.114477999508380889892578125, _2837);
    float _2851 = -_2849;
    float _2853 = _2829 + _2851;
    float _2855 = -_2849;
    float _2857 = _2823 + _2855;
    float _2859 = -_2849;
    float _2861 = _2835 + _2859;
    float _2863 = fma(_2853, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    float _2865 = fma(_2857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    float _2867 = fma(_2861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    bool _2869 = !_2833;
    if (!_2869)
    {
        float _2871 = -_2110;
        float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2875 = -_2112;
        float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2879 = -_2114;
        float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2883 = _2873 * _2873;
        float _2885 = fma(_2877, _2877, _2883);
        float _2887 = fma(_2881, _2881, _2885);
        float _2889 = sqrt(_2887);
        float _2891 = rsqrt(_2887);
        float _2893 = -_2889;
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2897 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        float _2901 = _2877 * _2891;
        float _2903 = _2873 * _2891;
        float _2905 = abs(_2899);
        float _2907 = log2(_2905);
        float _2909 = _2881 * _2891;
        float _2911 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2913 = _2008 * _2903;
        float _2915 = -_2903;
        float _2917 = -_2911;
        float _2919 = fma(_2915, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2917);
        float _2921 = fma(_2006, _2901, _2913);
        float _2923 = -_2909;
        float _2925 = fma(_2923, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2919);
        float _2927 = fma(_2020, _2909, _2921);
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2933 = _2925 + _2931;
        float _2935 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2937 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2939 = precise::clamp(_2937, 0.0, 1.0);
        float _2941 = exp2(_2935);
        float _2943 = _2941 * _2939;
        float _2945 = _2929 * _2943;
        float _2947 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2949 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2951 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2947;
        out.m_83.y = _2949;
        out.m_83.z = _2951;
    }
    out.m_85.x = _2863;
    out.m_85.y = _2865;
    out.m_85.z = _2867;
    if (_2847)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2953 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2953;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2711 = false;
    bool _2066 = false;
    bool _688 = false;
    bool _544 = false;
    bool _428 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3010 = as_type<float>(_120);
        out.gl_Position.z = _3010;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_51.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3080 = as_type<float>(_158);
        out.gl_Position.z = _3080;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _170 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _174 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _168);
    float _176 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _170);
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _186 = !_166;
    float _204;
    if (!_186)
    {
        float _188 = in.m_55.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        float _208 = float(_104);
        float _210 = 1.0 / _208;
        float _212 = _138 * _210;
        _204 = _212;
    }
    _206 = false;
    float _214 = _204;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = _214 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _214 + _220;
    bool _224 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _214 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = 1.0 / _238;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = 1.0 / _250;
    float _258 = 1.0 / _246;
    float _260 = _218 * _252;
    bool _262 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_214);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -_234;
    float _276 = _274 + 1.0;
    float _278 = _272 * _276;
    float _280 = _222 * _256;
    bool _282 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_214);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    bool _298 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _300 = isnan(_214);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _314 = -_272;
    float _316 = _314 + 1.0;
    float _318 = -_292;
    float _320 = _318 + 1.0;
    float _322 = _242 * _258;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _308 * _320;
    float _334 = fma(_296, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = fma(_326, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = fma(_330, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = _292 * _316;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = _336 * _332;
    float _348 = _338 * _332;
    float _350 = _334 * _332;
    float _352 = -_308;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _362 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _366;
    float _370 = fma(_312, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_358, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_344, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = fma(_370, _340, _360);
    float _386 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _388 = fma(_378, _260, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _390 = fma(_382, _260, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _392 = fma(_372, _340, _362);
    float _394 = fma(_374, _340, _364);
    float _396 = fma(_386, _278, _384);
    float _398 = fma(_388, _278, _392);
    float _400 = fma(_390, _278, _394);
    float _402 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].x, _396);
    float _404 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].y, _398);
    float _406 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].z, _400);
    bool _408 = !_254;
    float _426;
    if (!_408)
    {
        float _410 = in.m_55.x;
        float _412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _414 = _410 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _416 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _418 = _416 * _412;
        float _420 = floor(_418);
        float _422 = -_420;
        float _424 = _418 + _422;
        _426 = _424;
        _428 = true;
    }
    else
    {
        float _430 = float(_104);
        float _432 = 1.0 / _430;
        float _434 = _138 * _432;
        _426 = _434;
    }
    _428 = false;
    float _436 = _426;
    float _438 = in.m_57.x;
    float _440 = in.m_57.y;
    float _442 = in.m_57.z;
    bool _444 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = isnan(_436);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _462 = isnan(_436);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _436 + _476;
    float _480 = -_454;
    float _482 = _480 + 1.0;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _486 = 1.0 / _458;
    float _488 = _470 * _482;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = _406 * _442;
    float _496 = _404 * _440;
    float _498 = _474 * _486;
    float _500 = _402 * _438;
    float _502 = fma(_498, _478, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _504 = _502 * _488;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[115].x, _504);
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[116].x, _510);
    float _520 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = _518 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _524 = !_484;
    float _542;
    if (!_524)
    {
        float _526 = in.m_55.x;
        float _528 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _530 = _526 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _534 = _532 * _528;
        float _536 = floor(_534);
        float _538 = -_536;
        float _540 = _534 + _538;
        _542 = _540;
        _544 = true;
    }
    else
    {
        float _546 = float(_104);
        float _548 = 1.0 / _546;
        float _550 = _138 * _548;
        _542 = _550;
    }
    _544 = false;
    float _552 = _542;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _556 = _552 + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _562 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _564 = isnan(_552);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _578 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _580 = isnan(_552);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _590;
    bool _594 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _596 = isnan(_552);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _560;
    float _608 = -_572;
    float _610 = _608 + 1.0;
    bool _612 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _614 = _588 * _610;
    float _616 = -_588;
    float _618 = _616 + 1.0;
    float _620 = 1.0 / _576;
    float _622 = _592 * _606;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _628 = fma(_622, _556, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _630 = -_604;
    float _632 = _630 + 1.0;
    float _634 = _628 * _614;
    float _636 = _626 * _620;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _640 = _552 + _638;
    float _642 = _572 * _632;
    float _644 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _634);
    float _646 = fma(_636, _640, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _648 = fma(_646, _642, _644);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _656 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[133].x, _648);
    float _658 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _666 = !_612;
    float _668 = _664;
    float _686;
    if (!_666)
    {
        float _670 = in.m_55.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_104);
        float _692 = 1.0 / _690;
        float _694 = _138 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_55.x;
    float _700 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = in.m_55.y;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _710 = in.m_55.z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    float _730 = in.m_55.w;
    bool _732 = !_714;
    int _734 = _732 ? 0 : 1;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _740 = _698 * 2.0;
    float _742 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _744 = _702 * 2.0;
    float _746 = floor(_740);
    float _748 = _728 * _138;
    float _750 = -_724;
    float _752 = fma(_742, 2.0, _750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _754;
    float _758 = _724;
    bool _760 = _718;
    if (!_706)
    {
        _758 = _702;
    }
    float _762 = _758;
    float _764 = -_138;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    float _768 = _762;
    if (_706)
    {
        _768 = _698;
    }
    float _770 = _768;
    float _772 = floor(_744);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _776 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _780 = _730 > 0.5;
    float _782 = _182 * _182;
    float _784 = fma(_776, -2.0, _774);
    float _786 = _774;
    float _788 = _778;
    float _790 = _770;
    bool _792 = _780;
    if (!_706)
    {
        _786 = _702;
    }
    float _794 = _786;
    float _796 = exp2(_748);
    bool _798 = _746 >= 0.0;
    bool _800 = isnan(_746);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[83].z, _778);
    bool _810 = _746 > 0.0;
    float _812 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    int _814 = _806 ? 0 : 1;
    float _816 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _822 = _772 > 0.0;
    bool _824 = _772 >= 0.0;
    bool _826 = isnan(_772);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _710 * 2.0;
    float _836 = _794;
    if (_706)
    {
        _836 = _698;
    }
    float _838 = _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _842 = -_796;
    float _844 = _842 + 1.0;
    if (!_706)
    {
        _788 = _698;
    }
    float _846 = _788;
    float _848 = floor(_834);
    float _850 = _846;
    if (_706)
    {
        _850 = _710;
    }
    float _852 = _850;
    float _854 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _858 = _852;
    if (!_706)
    {
        _790 = _710;
    }
    float _860 = _790;
    float _862 = -_840;
    float _864 = fma(_854, 2.0, _862);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[84].z, _856);
    int _868 = _832 ? 0 : 1;
    float _870 = -_138;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[81].x, _864);
    int _874 = ~_814;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _882 = _878;
    float _884 = _860;
    if (!_810)
    {
        int _886 = ~_814;
        int _888 = _886 + 1;
        _882 = _888;
    }
    int _890 = _882;
    float _892 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _866);
    if (!_706)
    {
        _858 = _860;
    }
    float _894 = _858;
    float _896 = 1.0 / _738;
    bool _898 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _894;
    if (_706)
    {
        _884 = _702;
    }
    float _910 = _884;
    int _912 = ~_868;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = _916;
    if (_706)
    {
        _908 = _702;
    }
    float _920 = _908;
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[83].w, _880);
    if (!_822)
    {
        int _924 = ~_868;
        int _926 = _924 + 1;
        _918 = _926;
    }
    int _928 = _918;
    bool _930 = _848 > 0.0;
    float _932 = _920 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _934 = _848 >= 0.0;
    bool _936 = isnan(_848);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _906 ? _844 : 0.0;
    float _946 = _756 * _896;
    bool _948 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(1.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _960 = 1.0 + _958;
    float _962 = 1.0 / _960;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _968 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].z, _964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _972 = fma(_932, -2.0, _966);
    float _974 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _968);
    float _976 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].w, _970);
    int _978 = _942 ? 0 : 1;
    float _980 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _922);
    float _982 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _972);
    float _984 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _976);
    int _986 = ~_978;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    float _994 = as_type<float>(_928);
    if (_956)
    {
        float _996 = _944 * _962;
        _140 = _996;
    }
    float _998 = _140;
    if (!_930)
    {
        int _1000 = ~_978;
        int _1002 = _1000 + 1;
        _992 = _1002;
    }
    int _1004 = _992;
    float _1006 = in.m_59.x;
    float _1008 = in.m_59.y;
    float _1010 = in.m_59.z;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1022 = _1020 != 0;
    float _1024 = in.m_46.x;
    float _1026 = in.m_46.y;
    float _1028 = in.m_46.z;
    float _1030 = 1.0 / _1014;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1042 = _1040 != 0;
    float _1044 = 1.0 / _1018;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1050 = !_718;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1062 = 1.0 / _1048;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1066 = _820 * _1030;
    int _1068 = abs(_1052);
    float _1070 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1074 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1076 = 1.0 / _1060;
    float _1078 = _700 * _1064;
    float _1080 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1072);
    float _1084 = fma(_180, _180, _782);
    float _1086 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1092 = fma(_184, _184, _1084);
    float _1094 = 1.0 / _1056;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1104;
    float _1108 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1110 = _1098 * _1044;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1116 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1118 = 1.0 / _1090;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1122 = _696 + _1120;
    float _1124 = _1102 * _1062;
    float _1126 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1082);
    bool _1128 = !_722;
    int _1130 = _1128 ? 0 : 1;
    float _1132 = fma(_1110, _1122, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1136 = _696 + _1134;
    float _1138 = _698 + _702;
    float _1140 = rsqrt(_1092);
    float _1142 = _1106 * _1076;
    float _1144 = _1138 + (-1.0);
    float _1146 = in.m_61.x;
    int _1148 = abs(_1130);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1150;
    float _1154 = _1114 * _1118;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1158 = _696 + _1156;
    float _1160 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1162 = _1152 * _1094;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1166 = _696 + _1164;
    float _1168 = fma(_946, _1158, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1170 = float(_890);
    float _1172 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1174 = _182 * _1140;
    float _1176 = fma(_1066, _1166, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _696 + _1178;
    float _1182 = _180 * _1140;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1186 = _184 * _1140;
    float _1188 = fma(_1124, _1180, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1190 = fma(_1142, _1136, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1184);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1196 = _696 + _1194;
    float _1198 = _702 + _710;
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1192);
    float _1202 = fma(_1162, _1196, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1204 = _1198 + (-1.0);
    float _1206 = float(_1068);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1210 = _696 + _1208;
    float _1212 = abs(_1200);
    bool _1214 = _1212 > 0.99989998340606689453125;
    float _1216 = _698 + _710;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1220 = float(_928);
    float _1222 = _1206 * _1170;
    float _1224 = _1216 + (-1.0);
    float _1226 = fma(_1154, _1210, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1230 = in.m_63.x;
    float _1232 = in.m_63.y;
    float _1234 = in.m_63.z;
    int _1236 = abs(_734);
    float _1238 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1240 = float(_1148);
    float _1242 = _1108 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1244 = as_type<float>(_1148);
    float _1246 = _1206;
    float _1248 = _1154;
    float _1250 = _1008;
    if (_1214)
    {
        _1244 = 0.001000000047497451305389404296875;
    }
    float _1252 = _1244;
    if (!_1214)
    {
        _994 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1254 = _994;
    float _1256 = _1240 * _1220;
    float _1258 = 0.0;
    float _1260 = _1254;
    if (!_1214)
    {
        _1258 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1262 = _1258;
    float _1264 = _1262;
    if (_1214)
    {
        float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1260 = _1266;
    }
    float _1268 = _1260;
    if (!_1214)
    {
        _1246 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1270 = _1246;
    float _1272 = _1270;
    if (_1214)
    {
        float _1274 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1264 = _1274;
    }
    float _1276 = _1264;
    if (_1214)
    {
        float _1278 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1272 = _1278;
    }
    float _1280 = _1272;
    float _1282 = _1222 * (-2.0);
    float _1284 = _1256 * (-2.0);
    bool _1286 = _702 > 0.5;
    float _1288 = _702 + (-0.5);
    if (_1034)
    {
        bool _1290 = _710 > 0.5;
        _760 = _1290;
    }
    bool _1292 = _760;
    float _1294 = _710 + (-0.5);
    float _1296 = float(_1236);
    bool _1298 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1300 = isnan(_696);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = fma(_1282, _1232, _1232);
    float _1312 = fma(_1284, _1234, _1234);
    float _1314 = float(_1004);
    float _1316 = fma(_1218, _1282, _1218);
    float _1318 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1310);
    float _1320 = fma(_1228, _1284, _1228);
    float _1322 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1312);
    float _1324 = -_1268;
    float _1326 = _1186 * _1324;
    float _1328 = _1296 * _1314;
    float _1330 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _698);
    float _1332 = fma(_1316, _998, _1318);
    float _1334 = in.m_61.y;
    float _1336 = fma(_1320, _998, _1322);
    float _1338 = -_1280;
    float _1340 = _1174 * _1338;
    float _1342 = -_1280;
    float _1344 = -_1326;
    float _1346 = fma(_1182, _1342, _1344);
    float _1348 = -_1276;
    float _1350 = _1182 * _1348;
    bool _1352 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1354 = isnan(_696);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = _1330 + _1008;
    float _1366 = -_1276;
    float _1368 = -_1340;
    float _1370 = fma(_1186, _1366, _1368);
    float _1372 = -_1268;
    float _1374 = -_1350;
    float _1376 = fma(_1174, _1372, _1374);
    float _1378 = _1328 * (-2.0);
    bool _1380 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1382 = isnan(_696);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1388 = _1384 || _1386;
    float _1390 = float(_1388);
    float _1392 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1394 = -_1362;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1378, _1230, _1230);
    float _1400 = fma(_1160, _1378, _1160);
    bool _1402 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1404 = isnan(_696);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = _1392 * 0.15915493667125701904296875;
    float _1416 = _1390 * _1396;
    float _1418 = -_1390;
    float _1420 = _1418 + 1.0;
    bool _1422 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1424 = isnan(_696);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = -_1412;
    float _1436 = _1434 + 1.0;
    float _1438 = _1332 * 0.15915493667125701904296875;
    float _1440 = _1412 * _1420;
    float _1442 = _698 + (-0.5);
    bool _1444 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1446 = isnan(_696);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = -_1432;
    float _1458 = _1456 + 1.0;
    float _1460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1398);
    float _1464 = -_1334;
    float _1466 = _1464 + 1.0;
    float _1468 = _1454 * _1458;
    float _1470 = -_1454;
    float _1472 = _1470 + 1.0;
    bool _1474 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1476 = isnan(_696);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = in.m_65.x;
    int _1488 = _780 ? as_type<int>(_1466) : as_type<int>(_1334);
    float _1490 = _1414 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = _1334;
    int _1496 = as_type<int>(_1438);
    if (_1022)
    {
        bool _1498 = _698 > 0.5;
        _792 = _1498;
    }
    bool _1500 = _792;
    float _1502 = _1346 * _1346;
    float _1504 = _1432 * _1436;
    float _1506 = _1484 * _1472;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1400, _998, _1462);
    bool _1514 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1516 = isnan(_696);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1528 = fma(_1370, _1370, _1502);
    float _1530 = -_1308;
    float _1532 = _1530 + 1.0;
    float _1534 = _1038 ? as_type<float>(_1488) : _1334;
    float _1536 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1538 = _1308 * _1510;
    float _1540 = _1524 * _1532;
    float _1542 = _1336 * 0.15915493667125701904296875;
    float _1544 = fma(_1534, _1536, -0.5);
    float _1546 = _1512 * 0.15915493667125701904296875;
    float _1548 = fma(_1376, _1376, _1528);
    float _1550 = _1168 * _1540;
    float _1552 = _1438 * 6.283185482025146484375;
    float _1554 = sin(_1552);
    int _1556 = as_type<int>(_1540);
    if (_1042)
    {
        float _1558 = _1286 ? _1466 : _1334;
        _1494 = _1558;
    }
    float _1560 = _1494;
    float _1562 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1564 = _1492;
    if (_1022)
    {
        float _1566 = -_1146;
        float _1568 = _1566 + 1.0;
        _1556 = as_type<int>(_1568);
    }
    int _1570 = _1556;
    float _1572 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1022)
    {
        _1248 = _1146;
    }
    float _1574 = _1248;
    float _1576 = _1562 * _1486;
    float _1578 = _1574;
    if (!_1034)
    {
        _1564 = _1146;
    }
    float _1580 = _1564;
    float _1582 = _1438 * 6.283185482025146484375;
    float _1584 = cos(_1582);
    float _1586 = fma(_1572, _1560, -0.5);
    float _1588 = _1580;
    if (_1022)
    {
        float _1590 = _1500 ? as_type<float>(_1570) : _1146;
        _1578 = _1590;
    }
    float _1592 = _1578;
    float _1594 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1596 = -_1524;
    float _1598 = _1596 + 1.0;
    float _1600 = _1576 + _1006;
    float _1602 = -_812;
    float _1604 = fma(_984, _1586, _1602);
    float _1606 = _1542 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    if (_1034)
    {
        float _1610 = -_1146;
        float _1612 = _1610 + 1.0;
        _1496 = as_type<int>(_1612);
    }
    int _1614 = _1496;
    float _1616 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1550);
    float _1618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    if (_1034)
    {
        float _1620 = _1292 ? as_type<float>(_1614) : _1146;
        _1588 = _1620;
    }
    float _1622 = _1588;
    float _1624 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1626 = _1546 * 6.283185482025146484375;
    float _1628 = sin(_1626);
    float _1630 = _1576 + _1010;
    bool _1632 = _1008 != 0.0;
    bool _1634 = isnan(_1008);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1624 * _1618;
    float _1644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1630);
    float _1646 = -_1006;
    bool _1648 = _1576 == _1646;
    bool _1650 = !_1640;
    bool _1652 = _1648 && _1650;
    float _1654 = _1546 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _1594 * _1644;
    float _1660 = _1584 * _1608;
    float _1662 = _1554 * _1608;
    float _1664 = -_1010;
    bool _1666 = _1576 == _1664;
    bool _1668 = _1666 && _1652;
    float _1670 = in.m_65.w;
    float _1672 = rsqrt(_1548);
    float _1674 = _1628 * _1584;
    float _1676 = _1628 * _1554;
    float _1678 = _1542 * 6.283185482025146484375;
    float _1680 = sin(_1678);
    float _1682 = _1656 * _1608;
    float _1684 = _1682 * _1182;
    float _1686 = _1682 * _1186;
    float _1688 = _1376 * _1672;
    float _1690 = _1656 * _1584;
    float _1692 = _1628 * _1608;
    float _1694 = _1656 * _1554;
    float _1696 = _1370 * _1672;
    float _1698 = _1346 * _1672;
    float _1700 = _1174 * _1688;
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1704 = fma(_1680, _1690, _1676);
    float _1706 = -_1694;
    float _1708 = fma(_1680, _1674, _1706);
    float _1710 = -_1674;
    float _1712 = fma(_1680, _1694, _1710);
    float _1714 = fma(_1680, _1676, _1690);
    float _1716 = _1704 * _1182;
    float _1718 = -_1700;
    float _1720 = fma(_1186, _1698, _1718);
    float _1722 = _1712 * _1182;
    float _1724 = -_1680;
    float _1726 = fma(_1724, _1696, _1684);
    float _1728 = _1182 * _1698;
    float _1730 = fma(_1660, _1696, _1716);
    float _1732 = fma(_1662, _1696, _1722);
    float _1734 = fma(_1692, _1720, _1726);
    float _1736 = _1704 * _1186;
    float _1738 = -_1728;
    float _1740 = fma(_1174, _1696, _1738);
    float _1742 = -_1680;
    float _1744 = fma(_1742, _1688, _1686);
    float _1746 = fma(_1708, _1720, _1730);
    float _1748 = fma(_1714, _1720, _1732);
    float _1750 = _1712 * _1186;
    float _1752 = fma(_1660, _1688, _1736);
    float _1754 = fma(_1692, _1740, _1744);
    float _1756 = _1078 * _1734;
    float _1758 = fma(_1662, _1688, _1750);
    float _1760 = fma(_1708, _1740, _1752);
    float _1762 = _1078 * _1754;
    float _1764 = fma(_1642, _1746, _1756);
    float _1766 = fma(_1714, _1740, _1758);
    float _1768 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1770 = fma(_1642, _1760, _1762);
    float _1772 = fma(_1658, _1748, _1764);
    float _1774 = fma(_1176, _1538, _1616);
    float _1776 = fma(_1768, _1592, -0.5);
    float _1778 = fma(_1658, _1766, _1770);
    float _1780 = _1172 + _1772;
    float _1782 = _892 * (-0.15915493667125701904296875);
    float _1784 = fma(_974, _1776, _766);
    float _1786 = _1238 + _1778;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1790 = _1780 + _1788;
    float _1792 = fma(_1132, _1506, _1774);
    float _1794 = _1186 * _1696;
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1798 = _1786 + _1796;
    float _1800 = _1790 * _1790;
    float _1802 = _1682 * _1174;
    float _1804 = _708 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1806 = _1798 * _1798;
    float _1808 = -_1794;
    float _1810 = fma(_1182, _1688, _1808);
    float _1812 = _1704 * _1174;
    float _1814 = -_1680;
    float _1816 = fma(_1814, _1698, _1802);
    float _1818 = _1800 + _1806;
    float _1820 = fma(_1804, _1622, -0.5);
    float _1822 = fma(_1188, _1468, _1792);
    float _1824 = _1712 * _1174;
    float _1826 = sqrt(_1818);
    float _1828 = in.m_67.x;
    float _1830 = in.m_67.y;
    float _1832 = in.m_67.z;
    float _1834 = fma(_1660, _1698, _1812);
    float _1836 = fma(_1692, _1810, _1816);
    float _1838 = fma(_1190, _1504, _1822);
    float _1840 = fma(_1662, _1698, _1824);
    float _1842 = fma(_1708, _1810, _1834);
    float _1844 = _1078 * _1836;
    float _1846 = _1782 * 6.283185482025146484375;
    float _1848 = sin(_1846);
    float _1850 = fma(_1226, _1440, _1838);
    float _1852 = fma(_1714, _1810, _1840);
    float _1854 = fma(_1642, _1842, _1844);
    float _1856 = fma(_1202, _1416, _1850);
    float _1858 = fma(_1658, _1852, _1854);
    float _1860 = _1782 * 6.283185482025146484375;
    float _1862 = cos(_1860);
    bool _1864 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1856);
    float _1868 = _1242 + _1858;
    float _1870 = fma(_1866, _1486, _1868);
    float _1872 = _1848 * _1544;
    float _1874 = _1830;
    float _1876 = _1800;
    float _1878 = _1806;
    float _1880 = _1780;
    float _1882 = _1786;
    float _1884 = _1826;
    float _1886 = _1828;
    float _1888 = _1832;
    float _1890 = _1670;
    if (!_1668)
    {
        float _1892 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1830);
        _1874 = _1892;
    }
    float _1894 = _1874;
    if (!_1864)
    {
        _1250 = _1870;
    }
    float _1896 = _1250;
    float _1898 = _1862 * _1544;
    float _1900 = -_1872;
    float _1902 = fma(_1862, _1820, _1900);
    float _1904 = fma(_1848, _1820, _1898);
    float _1906 = fma(_816, _1902, _872);
    bool _1908 = !_1864;
    float _1910 = _1896;
    if (!_1908)
    {
        float _1912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1916 = _1826 + _1914;
        float _1918 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1920 = rsqrt(_1818);
        float _1922 = _1916 * _1912;
        float _1924 = _1922 * 0.15915493667125701904296875;
        float _1926 = _1924 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1924 * 6.283185482025146484375;
        float _1932 = cos(_1930);
        float _1934 = fma(_1928, _1918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1936 = _1920 * _1934;
        float _1938 = fma(_1790, _1936, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1940 = _1932 + (-1.0);
        float _1942 = fma(_1798, _1936, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1946 = _1938 + _1944;
        float _1948 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1952 = _1942 + _1950;
        float _1954 = _1946 * _1946;
        float _1956 = fma(_1870, _1932, _1948);
        float _1958 = _1952 * _1952;
        _1910 = _1956;
        _1876 = _1954;
        _1878 = _1958;
        _1880 = _1938;
        _1882 = _1942;
        _1884 = _1948;
    }
    float _1960 = _1910;
    float _1962 = _1876;
    float _1964 = _1878;
    float _1966 = _1880;
    float _1968 = _1882;
    float _1970 = _1884;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1974 = _1960 + _1972;
    float _1976 = _1970;
    if (!_1668)
    {
        float _1978 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1828);
        _1886 = _1978;
    }
    float _1980 = _1886;
    float _1982 = _1734 * _1894;
    if (!_1668)
    {
        float _1984 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1832);
        _1888 = _1984;
    }
    float _1986 = _1888;
    float _1988 = fma(_1974, _1974, _1962);
    float _1990 = _1836 * _1894;
    float _1992 = _1754 * _1894;
    float _1994 = fma(_1746, _1980, _1982);
    float _1996 = _1988 + _1964;
    float _1998 = fma(_1842, _1980, _1990);
    float _2000 = -_982;
    float _2002 = fma(_980, _1904, _2000);
    float _2004 = fma(_1760, _1980, _1992);
    float _2006 = fma(_1748, _1986, _1994);
    float _2008 = fma(_1852, _1986, _1998);
    float _2010 = sqrt(_1996);
    float _2012 = _1604 + 0.5;
    float _2014 = _1784 + 0.5;
    float _2016 = _1906 + 0.5;
    float _2018 = _2002 + 0.5;
    float _2020 = fma(_1766, _1986, _2004);
    out.m_69.x = _514;
    out.m_69.y = _516;
    out.m_69.z = _520;
    out.m_69.w = _522;
    out.m_71.x = _660;
    out.m_71.y = _658;
    out.m_71.z = _662;
    out.m_71.w = _664;
    out.m_73.w = _1670;
    bool _2022 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2024 = isnan(_2010);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2030 = _2026 || _2028;
    out.m_75.x = _2014;
    out.m_75.y = _2012;
    out.m_75.z = _2016;
    out.m_75.w = _2018;
    out.m_77.x = _2006;
    out.m_77.y = _2008;
    out.m_77.z = _2020;
    if (!_2030)
    {
        _1976 = 1.0;
    }
    float _2032 = _1976;
    bool _2034 = !_2030;
    float _2036 = _2032;
    if (!_2034)
    {
        bool _2038 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2040 = isnan(_2010);
        bool _2042 = _2038 || _2040;
        bool _2044 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2046 = _2042 || _2044;
        if (!_2046)
        {
            float _2048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2050 = _2010 + _2048;
            float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2054 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2052;
            float _2056 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2060 = 1.0 / _2054;
            float _2062 = _2050 * _2060;
            float _2064 = fma(_2062, _2058, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2036 = _2064;
            _2066 = true;
        }
        else
        {
            bool _2068 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2070 = isnan(_2010);
            bool _2072 = _2068 || _2070;
            bool _2074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2076 = _2072 || _2074;
            if (!_2076)
            {
                float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2080 = _2010 + _2078;
                float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2084 = _2082 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2086 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2088 = _2086 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2090 = 1.0 / _2084;
                float _2092 = _2080 * _2090;
                float _2094 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2036 = _2094;
                _2066 = true;
            }
            else
            {
                _2036 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2066 = false;
    float _2096 = _2036;
    float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2100 = _1960 + _2098;
    float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2104 = _1966 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2108 = _1968 + _2106;
    float _2110 = fma(_2100, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2112 = fma(_2104, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2114 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2118 = _2110 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2122 = _2112 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2114 + _2124;
    float _2128 = _2118 * _2118;
    float _2130 = fma(_2122, _2122, _2128);
    float _2132 = fma(_2126, _2126, _2130);
    float _2134 = rsqrt(_2132);
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2122 * _2136;
    float _2140 = _2126 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2126;
    float _2158 = _2154;
    float _2160 = _2118;
    if (_2150)
    {
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2162;
    }
    float _2164 = _2156;
    if (_2150)
    {
        float _2166 = rsqrt(_2146);
        _668 = _2166;
    }
    float _2168 = _668;
    float _2170 = _2168;
    if (_2150)
    {
        float _2172 = _2154 * _2164;
        _2158 = _2172;
    }
    float _2174 = _2158;
    if (_2150)
    {
        float _2176 = _2174 * 0.15915493667125701904296875;
        _1890 = _2176;
    }
    float _2178 = _1890;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2182 = _2134;
    if (_2150)
    {
        float _2184 = _2178 * 6.283185482025146484375;
        float _2186 = sin(_2184);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2192 = precise::max(0.0, _2190);
    float _2194 = _2100;
    float _2196 = _2192;
    float _2198 = _2190;
    if (_2150)
    {
        float _2200 = _2178 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        _2194 = _2202;
    }
    float _2204 = _2194;
    float _2206 = -_2136;
    float _2208 = -_2192;
    float _2210 = fma(_2118, _2206, _2208);
    float _2212 = _2210;
    if (!_2150)
    {
        _2196 = _2140;
    }
    float _2214 = _2196;
    float _2216 = _2214;
    if (_2150)
    {
        float _2218 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2198 = _2218;
    }
    float _2220 = _2198;
    float _2222 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2224 = _2188;
    float _2226 = _2220;
    if (_2150)
    {
        float _2228 = fma(_2188, _2220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2160 = _2228;
    }
    float _2230 = _2160;
    float _2232 = _2230;
    if (!_2150)
    {
        _2224 = _2138;
    }
    float _2234 = _2224;
    float _2236 = _2234;
    if (_2150)
    {
        float _2238 = _2168 * _2230;
        _2232 = _2238;
    }
    float _2240 = _2232;
    if (_2150)
    {
        float _2242 = _2204 + (-1.0);
        _2226 = _2242;
    }
    float _2244 = _2226;
    float _2246 = _2244;
    if (!_2150)
    {
        _2170 = _2142;
    }
    float _2248 = _2170;
    float _2250 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2252 = _2248;
    if (_2150)
    {
        float _2254 = _2138 * _2240;
        _2236 = _2254;
    }
    float _2256 = _2236;
    if (_2150)
    {
        float _2258 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2258;
    }
    float _2260 = _2246;
    float _2262 = _2260;
    if (_2150)
    {
        float _2264 = _2140 * _2240;
        _2216 = _2264;
    }
    float _2266 = _2216;
    float _2268 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2150)
    {
        float _2270 = _2256 * _2256;
        _2252 = _2270;
    }
    float _2272 = _2252;
    if (_2150)
    {
        float _2274 = fma(_2210, _2204, _2260);
        _2212 = _2274;
    }
    float _2276 = _2212;
    if (!_2150)
    {
        _2262 = _2144;
    }
    float _2278 = _2262;
    float _2280 = _2278;
    if (_2150)
    {
        float _2282 = _2266 * _2266;
        _2280 = _2282;
    }
    float _2284 = _2280;
    float _2286 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2268);
    float _2288 = fma(_2276, _2276, _2272);
    float _2290 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2222);
    float _2292 = sqrt(_2132);
    float _2294 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2286);
    float _2296 = _2288 + _2284;
    float _2298 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2300 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2302 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2298);
    float _2304 = rsqrt(_2296);
    float _2306 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2290);
    float _2308 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2250);
    float _2310 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2302);
    float _2312 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2314 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2308);
    float _2316 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2320 = fma(_2292, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2318);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2326 = -_2322;
    float _2328 = _2326 + 1.0;
    float _2330 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2332 = -_2324;
    float _2334 = fma(_2332, _2180, 1.0);
    float _2336 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2338 = _2304 * _2276;
    float _2340 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2330);
    float _2342 = abs(_2328);
    float _2344 = log2(_2342);
    float _2346 = _2304 * _2256;
    float _2348 = _2304 * _2266;
    float _2350 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2340);
    float _2352 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2356 = log2(_2334);
    float _2358 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2360 = -_2354;
    float _2362 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2360);
    float _2364 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2358);
    float _2366 = -_2348;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2362);
    float _2370 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2372 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2374 = 1.0 / _2352;
    float _2376 = fma(_2368, -0.5, 0.5);
    float _2378 = fma(_2368, 0.5, 0.5);
    float _2380 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2372);
    float _2382 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2364);
    float _2384 = _2338 + 1.0;
    float _2386 = fma(_2378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2388 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2380);
    float _2390 = exp2(_2370);
    float _2392 = fma(_2378, _2386, -0.212114393711090087890625);
    float _2394 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2388);
    float _2396 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2382);
    float _2398 = fma(_2378, _2392, 1.570728778839111328125);
    float _2400 = sqrt(_2376);
    float _2402 = _2394 * _2374;
    float _2404 = fma(_2402, 0.5, 0.5);
    float _2406 = -_2338;
    float _2408 = fma(_2390, _2384, _2406);
    float _2410 = _2356 * 0.693147182464599609375;
    float _2412 = _2396 * _2374;
    float _2414 = fma(_2408, 0.5, 0.5);
    float _2416 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2418 = fma(_2412, -0.5, 0.5);
    float _2420 = _2400 * 0.636619746685028076171875;
    float _2422 = -_2398;
    float _2424 = fma(_2420, _2422, 1.0);
    float3 _6742 = float3(_2404, _2418, _2416);
    float _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6742, float3(0.0), isnan(_6742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6742, float3(0.0), isnan(_6742)), level(0.0)).x;
    float3 _6753 = float3(_2404, _2418, _2416);
    float4 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6753, float3(0.0), isnan(_6753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6753, float3(0.0), isnan(_6753)), level(0.0)).xyzw;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = _2429.w;
    float2 _6770 = float2(_2424, _2414);
    float3 _2441 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6770, float2(0.0), isnan(_6770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6770, float2(0.0), isnan(_6770)), level(0.0)).xyz;
    float _2443 = _2441.x;
    float _2445 = _2441.y;
    float _2447 = _2441.z;
    float _2449 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2451 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2453 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2455 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2457 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2449);
    float _2459 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2453);
    float _2461 = exp2(_2451);
    float _2463 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2457);
    float _2465 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2455);
    float _2467 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2469 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2471 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(0.5);
    bool _2479 = _2475 || _2477;
    float _2481 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2465);
    float _2483 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2467);
    float _2485 = 1.0 / _2469;
    float _2487 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2489 = _2483 + _2352;
    float _2491 = _2487 + _2469;
    float _2493 = -_2461;
    float _2495 = _2493 + 1.0;
    float _2497 = _2489 * 0.5;
    float _2499 = _2491 * _2485;
    float _2501 = _2499 * 0.5;
    float _2503 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2505 = _2495;
    float _2507 = _2352;
    float _2509 = _2483;
    float _2511 = _2396;
    float _2513 = _2394;
    if (_2479)
    {
        _2505 = 1.0;
    }
    float _2515 = _2505;
    float _2517 = _2515;
    float _2519 = _2433;
    float _2521 = _2431;
    if (!_2479)
    {
        float _2523 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = _2525 * 6.283185482025146484375;
        float _2529 = cos(_2527);
        float _2531 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2533 = _2531 * 0.15915493667125701904296875;
        float _2535 = _2525 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2541 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2539);
        float _2543 = 1.0 / _2529;
        float _2545 = _2533 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = _2537 * _2543;
        float _2551 = 1.0 / _2541;
        float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2555 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2553;
        float _2557 = _2547 * _2549;
        float _2559 = _2533 * 6.283185482025146484375;
        float _2561 = sin(_2559);
        float _2563 = 1.0 / _2557;
        float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2567 = _2551 * _2565;
        float _2569 = 1.0 / _2555;
        float _2571 = _2561 * _2563;
        float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2575 = fma(_2571, _2567, _2573);
        float _2577 = _2575 * _2569;
        float _2579 = precise::clamp(_2577, 0.0, 1.0);
        _2517 = _2579;
    }
    float _2581 = _2517;
    float _2583 = _2503 * _2426;
    float _2585 = -_2503;
    float _2587 = _2585 + 1.0;
    out.m_79.z = _2497;
    out.m_79.w = _2352;
    bool _2589 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2591 = isnan(_2292);
    bool _2593 = _2589 || _2591;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2597 = _2593 || _2595;
    float _2599 = _2437 * _2583;
    float _2601 = _2447 * _2583;
    float _2603 = _2437 * _2587;
    float _2605 = fma(_2443, _2599, _2431);
    float _2607 = fma(_2445, _2599, _2433);
    float _2609 = fma(_2437, _2601, _2435);
    out.gl_Position.x = _2394;
    out.gl_Position.y = _2396;
    out.gl_Position.z = _2483;
    out.gl_Position.w = _2352;
    float _2611 = _2581 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _2605;
    out.m_81.y = _2607;
    out.m_81.z = _2609;
    out.m_81.w = _2603;
    if (!_2597)
    {
        _2519 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2613 = _2519;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2597)
    {
        _2521 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2619 = _2521;
    float _2621 = _2619;
    float _2623 = _2619;
    if (!_2597)
    {
        _2507 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2625 = _2507;
    float _2627 = _2625;
    float _2629 = _2625;
    if (!_2597)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2631 = _2509;
    float _2633 = _2631;
    float _2635 = _2631;
    if (!_2597)
    {
        _2511 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2637 = _2511;
    float _2639 = _2637;
    float _2641 = _2637;
    if (!_2597)
    {
        _2513 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2643 = _2513;
    bool _2645 = !_2597;
    float _2647 = _2643;
    float _2649 = _2643;
    if (!_2645)
    {
        bool _2651 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2653 = isnan(_2292);
        bool _2655 = _2651 || _2653;
        bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2659 = _2655 || _2657;
        if (!_2659)
        {
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2663 = _2292 + _2661;
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2665;
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2673 = 1.0 / _2667;
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2681 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2689 = _2687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2691 = _2663 * _2673;
            float _2693 = precise::clamp(_2691, 0.0, 1.0);
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2699 = fma(_2693, _2671, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2701 = fma(_2693, _2697, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2703 = fma(_2693, _2677, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2705 = fma(_2693, _2681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2707 = fma(_2693, _2685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2709 = fma(_2693, _2689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2623 = _2703;
            _2641 = _2707;
            _2617 = _2699;
            _2635 = _2705;
            _2629 = _2701;
            _2649 = _2709;
            _2711 = true;
        }
        else
        {
            bool _2713 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2715 = isnan(_2292);
            bool _2717 = _2713 || _2715;
            bool _2719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2721 = _2717 || _2719;
            if (!_2721)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2723 = _2615;
            _2617 = _2723;
            if (!_2721)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2725 = _2621;
            _2623 = _2725;
            if (!_2721)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2727 = _2627;
            _2629 = _2727;
            if (!_2721)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2729 = _2633;
            _2635 = _2729;
            if (!_2721)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2731 = _2639;
            _2641 = _2731;
            if (!_2721)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2733 = _2647;
            bool _2735 = !_2721;
            _2649 = _2733;
            if (!_2735)
            {
                bool _2737 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2739 = isnan(_2292);
                bool _2741 = _2737 || _2739;
                bool _2743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2745 = _2741 || _2743;
                if (!_2745)
                {
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2749 = _2292 + _2747;
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2751;
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2759 = 1.0 / _2753;
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2777 = _2749 * _2759;
                    float _2779 = precise::clamp(_2777, 0.0, 1.0);
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2785 = fma(_2779, _2757, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2787 = fma(_2779, _2783, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2789 = fma(_2779, _2763, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2791 = fma(_2779, _2767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2793 = fma(_2779, _2771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2795 = fma(_2779, _2775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2623 = _2789;
                    _2641 = _2793;
                    _2617 = _2785;
                    _2635 = _2791;
                    _2629 = _2787;
                    _2649 = _2795;
                    _2711 = true;
                }
                else
                {
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2711 = false;
    float _2797 = _2623;
    float _2799 = _2641;
    float _2801 = _2617;
    float _2803 = _2635;
    float _2805 = _2629;
    float _2807 = _2649;
    float _2809 = _2611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2811 = fma(_2008, -0.5, 0.5);
    float _2813 = precise::clamp(_2811, 0.0, 1.0);
    float _2815 = -_2797;
    float _2817 = _2815 + _2799;
    float _2819 = -_2801;
    float _2821 = _2819 + _2803;
    out.m_83.x = 0.0;
    float _2823 = fma(_2813, _2817, _2797);
    float _2825 = -_2805;
    float _2827 = _2825 + _2807;
    float _2829 = fma(_2813, _2821, _2801);
    float _2831 = _2823 * 0.586610972881317138671875;
    bool _2833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2835 = fma(_2813, _2827, _2805);
    out.m_49.x = _2809;
    float _2837 = fma(_2829, 0.298911988735198974609375, _2831);
    bool _2839 = _2581 > 0.0;
    bool _2841 = isnan(_2581);
    bool _2843 = _2839 || _2841;
    bool _2845 = isnan(0.0);
    bool _2847 = _2843 || _2845;
    float _2849 = fma(_2835, 0.114477999508380889892578125, _2837);
    float _2851 = -_2849;
    float _2853 = _2829 + _2851;
    float _2855 = -_2849;
    float _2857 = _2823 + _2855;
    float _2859 = -_2849;
    float _2861 = _2835 + _2859;
    float _2863 = fma(_2853, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    float _2865 = fma(_2857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    float _2867 = fma(_2861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    bool _2869 = !_2833;
    if (!_2869)
    {
        float _2871 = -_2110;
        float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2875 = -_2112;
        float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2879 = -_2114;
        float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2883 = _2873 * _2873;
        float _2885 = fma(_2877, _2877, _2883);
        float _2887 = fma(_2881, _2881, _2885);
        float _2889 = sqrt(_2887);
        float _2891 = rsqrt(_2887);
        float _2893 = -_2889;
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2897 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        float _2901 = _2877 * _2891;
        float _2903 = _2873 * _2891;
        float _2905 = abs(_2899);
        float _2907 = log2(_2905);
        float _2909 = _2881 * _2891;
        float _2911 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2913 = _2008 * _2903;
        float _2915 = -_2903;
        float _2917 = -_2911;
        float _2919 = fma(_2915, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2917);
        float _2921 = fma(_2006, _2901, _2913);
        float _2923 = -_2909;
        float _2925 = fma(_2923, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2919);
        float _2927 = fma(_2020, _2909, _2921);
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2933 = _2925 + _2931;
        float _2935 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2937 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2939 = precise::clamp(_2937, 0.0, 1.0);
        float _2941 = exp2(_2935);
        float _2943 = _2941 * _2939;
        float _2945 = _2929 * _2943;
        float _2947 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2949 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2951 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2947;
        out.m_83.y = _2949;
        out.m_83.z = _2951;
    }
    out.m_85.x = _2863;
    out.m_85.y = _2865;
    out.m_85.z = _2867;
    if (_2847)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2953 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2953;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2711 = false;
    bool _2066 = false;
    bool _688 = false;
    bool _544 = false;
    bool _428 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3010 = as_type<float>(_120);
        out.gl_Position.z = _3010;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_51.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3080 = as_type<float>(_158);
        out.gl_Position.z = _3080;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _170 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _174 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _168);
    float _176 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _170);
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _186 = !_166;
    float _204;
    if (!_186)
    {
        float _188 = in.m_55.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        float _208 = float(_104);
        float _210 = 1.0 / _208;
        float _212 = _138 * _210;
        _204 = _212;
    }
    _206 = false;
    float _214 = _204;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = _214 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _214 + _220;
    bool _224 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _214 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = 1.0 / _238;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = 1.0 / _250;
    float _258 = 1.0 / _246;
    float _260 = _218 * _252;
    bool _262 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_214);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -_234;
    float _276 = _274 + 1.0;
    float _278 = _272 * _276;
    float _280 = _222 * _256;
    bool _282 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_214);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    bool _298 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _300 = isnan(_214);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _314 = -_272;
    float _316 = _314 + 1.0;
    float _318 = -_292;
    float _320 = _318 + 1.0;
    float _322 = _242 * _258;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _308 * _320;
    float _334 = fma(_296, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = fma(_326, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = fma(_330, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = _292 * _316;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = _336 * _332;
    float _348 = _338 * _332;
    float _350 = _334 * _332;
    float _352 = -_308;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _362 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _366;
    float _370 = fma(_312, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_358, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_344, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = fma(_370, _340, _360);
    float _386 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _388 = fma(_378, _260, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _390 = fma(_382, _260, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _392 = fma(_372, _340, _362);
    float _394 = fma(_374, _340, _364);
    float _396 = fma(_386, _278, _384);
    float _398 = fma(_388, _278, _392);
    float _400 = fma(_390, _278, _394);
    float _402 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].x, _396);
    float _404 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].y, _398);
    float _406 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[146].z, _400);
    bool _408 = !_254;
    float _426;
    if (!_408)
    {
        float _410 = in.m_55.x;
        float _412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _414 = _410 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _416 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _418 = _416 * _412;
        float _420 = floor(_418);
        float _422 = -_420;
        float _424 = _418 + _422;
        _426 = _424;
        _428 = true;
    }
    else
    {
        float _430 = float(_104);
        float _432 = 1.0 / _430;
        float _434 = _138 * _432;
        _426 = _434;
    }
    _428 = false;
    float _436 = _426;
    float _438 = in.m_57.x;
    float _440 = in.m_57.y;
    float _442 = in.m_57.z;
    bool _444 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = isnan(_436);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _462 = isnan(_436);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _436 + _476;
    float _480 = -_454;
    float _482 = _480 + 1.0;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _486 = 1.0 / _458;
    float _488 = _470 * _482;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = _406 * _442;
    float _496 = _404 * _440;
    float _498 = _474 * _486;
    float _500 = _402 * _438;
    float _502 = fma(_498, _478, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _504 = _502 * _488;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[115].x, _504);
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[116].x, _510);
    float _520 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = _518 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _524 = !_484;
    float _542;
    if (!_524)
    {
        float _526 = in.m_55.x;
        float _528 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _530 = _526 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _534 = _532 * _528;
        float _536 = floor(_534);
        float _538 = -_536;
        float _540 = _534 + _538;
        _542 = _540;
        _544 = true;
    }
    else
    {
        float _546 = float(_104);
        float _548 = 1.0 / _546;
        float _550 = _138 * _548;
        _542 = _550;
    }
    _544 = false;
    float _552 = _542;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _556 = _552 + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _562 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _564 = isnan(_552);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _578 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _580 = isnan(_552);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _590;
    bool _594 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _596 = isnan(_552);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _560;
    float _608 = -_572;
    float _610 = _608 + 1.0;
    bool _612 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _614 = _588 * _610;
    float _616 = -_588;
    float _618 = _616 + 1.0;
    float _620 = 1.0 / _576;
    float _622 = _592 * _606;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _628 = fma(_622, _556, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _630 = -_604;
    float _632 = _630 + 1.0;
    float _634 = _628 * _614;
    float _636 = _626 * _620;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _640 = _552 + _638;
    float _642 = _572 * _632;
    float _644 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _634);
    float _646 = fma(_636, _640, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _648 = fma(_646, _642, _644);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _656 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[133].x, _648);
    float _658 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _666 = !_612;
    float _668 = _664;
    float _686;
    if (!_666)
    {
        float _670 = in.m_55.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_104);
        float _692 = 1.0 / _690;
        float _694 = _138 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_55.x;
    float _700 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = in.m_55.y;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _710 = in.m_55.z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    float _730 = in.m_55.w;
    bool _732 = !_714;
    int _734 = _732 ? 0 : 1;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _740 = _698 * 2.0;
    float _742 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _744 = _702 * 2.0;
    float _746 = floor(_740);
    float _748 = _728 * _138;
    float _750 = -_724;
    float _752 = fma(_742, 2.0, _750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _754;
    float _758 = _724;
    bool _760 = _718;
    if (!_706)
    {
        _758 = _702;
    }
    float _762 = _758;
    float _764 = -_138;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    float _768 = _762;
    if (_706)
    {
        _768 = _698;
    }
    float _770 = _768;
    float _772 = floor(_744);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _776 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _780 = _730 > 0.5;
    float _782 = _182 * _182;
    float _784 = fma(_776, -2.0, _774);
    float _786 = _774;
    float _788 = _778;
    float _790 = _770;
    bool _792 = _780;
    if (!_706)
    {
        _786 = _702;
    }
    float _794 = _786;
    float _796 = exp2(_748);
    bool _798 = _746 >= 0.0;
    bool _800 = isnan(_746);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[83].z, _778);
    bool _810 = _746 > 0.0;
    float _812 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    int _814 = _806 ? 0 : 1;
    float _816 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _822 = _772 > 0.0;
    bool _824 = _772 >= 0.0;
    bool _826 = isnan(_772);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _710 * 2.0;
    float _836 = _794;
    if (_706)
    {
        _836 = _698;
    }
    float _838 = _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _842 = -_796;
    float _844 = _842 + 1.0;
    if (!_706)
    {
        _788 = _698;
    }
    float _846 = _788;
    float _848 = floor(_834);
    float _850 = _846;
    if (_706)
    {
        _850 = _710;
    }
    float _852 = _850;
    float _854 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _858 = _852;
    if (!_706)
    {
        _790 = _710;
    }
    float _860 = _790;
    float _862 = -_840;
    float _864 = fma(_854, 2.0, _862);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[84].z, _856);
    int _868 = _832 ? 0 : 1;
    float _870 = -_138;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[81].x, _864);
    int _874 = ~_814;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _882 = _878;
    float _884 = _860;
    if (!_810)
    {
        int _886 = ~_814;
        int _888 = _886 + 1;
        _882 = _888;
    }
    int _890 = _882;
    float _892 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _866);
    if (!_706)
    {
        _858 = _860;
    }
    float _894 = _858;
    float _896 = 1.0 / _738;
    bool _898 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _894;
    if (_706)
    {
        _884 = _702;
    }
    float _910 = _884;
    int _912 = ~_868;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = _916;
    if (_706)
    {
        _908 = _702;
    }
    float _920 = _908;
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[83].w, _880);
    if (!_822)
    {
        int _924 = ~_868;
        int _926 = _924 + 1;
        _918 = _926;
    }
    int _928 = _918;
    bool _930 = _848 > 0.0;
    float _932 = _920 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _934 = _848 >= 0.0;
    bool _936 = isnan(_848);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _906 ? _844 : 0.0;
    float _946 = _756 * _896;
    bool _948 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(1.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _960 = 1.0 + _958;
    float _962 = 1.0 / _960;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _968 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].z, _964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _972 = fma(_932, -2.0, _966);
    float _974 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _968);
    float _976 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].w, _970);
    int _978 = _942 ? 0 : 1;
    float _980 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _922);
    float _982 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _972);
    float _984 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _976);
    int _986 = ~_978;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    float _994 = as_type<float>(_928);
    if (_956)
    {
        float _996 = _944 * _962;
        _140 = _996;
    }
    float _998 = _140;
    if (!_930)
    {
        int _1000 = ~_978;
        int _1002 = _1000 + 1;
        _992 = _1002;
    }
    int _1004 = _992;
    float _1006 = in.m_59.x;
    float _1008 = in.m_59.y;
    float _1010 = in.m_59.z;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1022 = _1020 != 0;
    float _1024 = in.m_46.x;
    float _1026 = in.m_46.y;
    float _1028 = in.m_46.z;
    float _1030 = 1.0 / _1014;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1042 = _1040 != 0;
    float _1044 = 1.0 / _1018;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1050 = !_718;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1062 = 1.0 / _1048;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1008);
    float _1066 = _820 * _1030;
    int _1068 = abs(_1052);
    float _1070 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1074 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1076 = 1.0 / _1060;
    float _1078 = _700 * _1064;
    float _1080 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1072);
    float _1084 = fma(_180, _180, _782);
    float _1086 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1092 = fma(_184, _184, _1084);
    float _1094 = 1.0 / _1056;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1104;
    float _1108 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1110 = _1098 * _1044;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1116 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1118 = 1.0 / _1090;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1122 = _696 + _1120;
    float _1124 = _1102 * _1062;
    float _1126 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1082);
    bool _1128 = !_722;
    int _1130 = _1128 ? 0 : 1;
    float _1132 = fma(_1110, _1122, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1136 = _696 + _1134;
    float _1138 = _698 + _702;
    float _1140 = rsqrt(_1092);
    float _1142 = _1106 * _1076;
    float _1144 = _1138 + (-1.0);
    float _1146 = in.m_61.x;
    int _1148 = abs(_1130);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1150;
    float _1154 = _1114 * _1118;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1158 = _696 + _1156;
    float _1160 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1162 = _1152 * _1094;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1166 = _696 + _1164;
    float _1168 = fma(_946, _1158, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1170 = float(_890);
    float _1172 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1174 = _182 * _1140;
    float _1176 = fma(_1066, _1166, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _696 + _1178;
    float _1182 = _180 * _1140;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1186 = _184 * _1140;
    float _1188 = fma(_1124, _1180, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1190 = fma(_1142, _1136, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1184);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1196 = _696 + _1194;
    float _1198 = _702 + _710;
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1192);
    float _1202 = fma(_1162, _1196, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1204 = _1198 + (-1.0);
    float _1206 = float(_1068);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1210 = _696 + _1208;
    float _1212 = abs(_1200);
    bool _1214 = _1212 > 0.99989998340606689453125;
    float _1216 = _698 + _710;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1220 = float(_928);
    float _1222 = _1206 * _1170;
    float _1224 = _1216 + (-1.0);
    float _1226 = fma(_1154, _1210, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1230 = in.m_63.x;
    float _1232 = in.m_63.y;
    float _1234 = in.m_63.z;
    int _1236 = abs(_734);
    float _1238 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1240 = float(_1148);
    float _1242 = _1108 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1244 = as_type<float>(_1148);
    float _1246 = _1206;
    float _1248 = _1154;
    float _1250 = _1008;
    if (_1214)
    {
        _1244 = 0.001000000047497451305389404296875;
    }
    float _1252 = _1244;
    if (!_1214)
    {
        _994 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1254 = _994;
    float _1256 = _1240 * _1220;
    float _1258 = 0.0;
    float _1260 = _1254;
    if (!_1214)
    {
        _1258 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1262 = _1258;
    float _1264 = _1262;
    if (_1214)
    {
        float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1260 = _1266;
    }
    float _1268 = _1260;
    if (!_1214)
    {
        _1246 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1270 = _1246;
    float _1272 = _1270;
    if (_1214)
    {
        float _1274 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1264 = _1274;
    }
    float _1276 = _1264;
    if (_1214)
    {
        float _1278 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1272 = _1278;
    }
    float _1280 = _1272;
    float _1282 = _1222 * (-2.0);
    float _1284 = _1256 * (-2.0);
    bool _1286 = _702 > 0.5;
    float _1288 = _702 + (-0.5);
    if (_1034)
    {
        bool _1290 = _710 > 0.5;
        _760 = _1290;
    }
    bool _1292 = _760;
    float _1294 = _710 + (-0.5);
    float _1296 = float(_1236);
    bool _1298 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1300 = isnan(_696);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = fma(_1282, _1232, _1232);
    float _1312 = fma(_1284, _1234, _1234);
    float _1314 = float(_1004);
    float _1316 = fma(_1218, _1282, _1218);
    float _1318 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1310);
    float _1320 = fma(_1228, _1284, _1228);
    float _1322 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1312);
    float _1324 = -_1268;
    float _1326 = _1186 * _1324;
    float _1328 = _1296 * _1314;
    float _1330 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].x, _698);
    float _1332 = fma(_1316, _998, _1318);
    float _1334 = in.m_61.y;
    float _1336 = fma(_1320, _998, _1322);
    float _1338 = -_1280;
    float _1340 = _1174 * _1338;
    float _1342 = -_1280;
    float _1344 = -_1326;
    float _1346 = fma(_1182, _1342, _1344);
    float _1348 = -_1276;
    float _1350 = _1182 * _1348;
    bool _1352 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1354 = isnan(_696);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = _1330 + _1008;
    float _1366 = -_1276;
    float _1368 = -_1340;
    float _1370 = fma(_1186, _1366, _1368);
    float _1372 = -_1268;
    float _1374 = -_1350;
    float _1376 = fma(_1174, _1372, _1374);
    float _1378 = _1328 * (-2.0);
    bool _1380 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1382 = isnan(_696);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1388 = _1384 || _1386;
    float _1390 = float(_1388);
    float _1392 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1394 = -_1362;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1378, _1230, _1230);
    float _1400 = fma(_1160, _1378, _1160);
    bool _1402 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1404 = isnan(_696);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = _1392 * 0.15915493667125701904296875;
    float _1416 = _1390 * _1396;
    float _1418 = -_1390;
    float _1420 = _1418 + 1.0;
    bool _1422 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1424 = isnan(_696);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = -_1412;
    float _1436 = _1434 + 1.0;
    float _1438 = _1332 * 0.15915493667125701904296875;
    float _1440 = _1412 * _1420;
    float _1442 = _698 + (-0.5);
    bool _1444 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1446 = isnan(_696);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = -_1432;
    float _1458 = _1456 + 1.0;
    float _1460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1398);
    float _1464 = -_1334;
    float _1466 = _1464 + 1.0;
    float _1468 = _1454 * _1458;
    float _1470 = -_1454;
    float _1472 = _1470 + 1.0;
    bool _1474 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1476 = isnan(_696);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = in.m_65.x;
    int _1488 = _780 ? as_type<int>(_1466) : as_type<int>(_1334);
    float _1490 = _1414 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = _1334;
    int _1496 = as_type<int>(_1438);
    if (_1022)
    {
        bool _1498 = _698 > 0.5;
        _792 = _1498;
    }
    bool _1500 = _792;
    float _1502 = _1346 * _1346;
    float _1504 = _1432 * _1436;
    float _1506 = _1484 * _1472;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1400, _998, _1462);
    bool _1514 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1516 = isnan(_696);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1528 = fma(_1370, _1370, _1502);
    float _1530 = -_1308;
    float _1532 = _1530 + 1.0;
    float _1534 = _1038 ? as_type<float>(_1488) : _1334;
    float _1536 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1538 = _1308 * _1510;
    float _1540 = _1524 * _1532;
    float _1542 = _1336 * 0.15915493667125701904296875;
    float _1544 = fma(_1534, _1536, -0.5);
    float _1546 = _1512 * 0.15915493667125701904296875;
    float _1548 = fma(_1376, _1376, _1528);
    float _1550 = _1168 * _1540;
    float _1552 = _1438 * 6.283185482025146484375;
    float _1554 = sin(_1552);
    int _1556 = as_type<int>(_1540);
    if (_1042)
    {
        float _1558 = _1286 ? _1466 : _1334;
        _1494 = _1558;
    }
    float _1560 = _1494;
    float _1562 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1564 = _1492;
    if (_1022)
    {
        float _1566 = -_1146;
        float _1568 = _1566 + 1.0;
        _1556 = as_type<int>(_1568);
    }
    int _1570 = _1556;
    float _1572 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1022)
    {
        _1248 = _1146;
    }
    float _1574 = _1248;
    float _1576 = _1562 * _1486;
    float _1578 = _1574;
    if (!_1034)
    {
        _1564 = _1146;
    }
    float _1580 = _1564;
    float _1582 = _1438 * 6.283185482025146484375;
    float _1584 = cos(_1582);
    float _1586 = fma(_1572, _1560, -0.5);
    float _1588 = _1580;
    if (_1022)
    {
        float _1590 = _1500 ? as_type<float>(_1570) : _1146;
        _1578 = _1590;
    }
    float _1592 = _1578;
    float _1594 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1596 = -_1524;
    float _1598 = _1596 + 1.0;
    float _1600 = _1576 + _1006;
    float _1602 = -_812;
    float _1604 = fma(_984, _1586, _1602);
    float _1606 = _1542 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    if (_1034)
    {
        float _1610 = -_1146;
        float _1612 = _1610 + 1.0;
        _1496 = as_type<int>(_1612);
    }
    int _1614 = _1496;
    float _1616 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1550);
    float _1618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    if (_1034)
    {
        float _1620 = _1292 ? as_type<float>(_1614) : _1146;
        _1588 = _1620;
    }
    float _1622 = _1588;
    float _1624 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1626 = _1546 * 6.283185482025146484375;
    float _1628 = sin(_1626);
    float _1630 = _1576 + _1010;
    bool _1632 = _1008 != 0.0;
    bool _1634 = isnan(_1008);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1624 * _1618;
    float _1644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1630);
    float _1646 = -_1006;
    bool _1648 = _1576 == _1646;
    bool _1650 = !_1640;
    bool _1652 = _1648 && _1650;
    float _1654 = _1546 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _1594 * _1644;
    float _1660 = _1584 * _1608;
    float _1662 = _1554 * _1608;
    float _1664 = -_1010;
    bool _1666 = _1576 == _1664;
    bool _1668 = _1666 && _1652;
    float _1670 = in.m_65.w;
    float _1672 = rsqrt(_1548);
    float _1674 = _1628 * _1584;
    float _1676 = _1628 * _1554;
    float _1678 = _1542 * 6.283185482025146484375;
    float _1680 = sin(_1678);
    float _1682 = _1656 * _1608;
    float _1684 = _1682 * _1182;
    float _1686 = _1682 * _1186;
    float _1688 = _1376 * _1672;
    float _1690 = _1656 * _1584;
    float _1692 = _1628 * _1608;
    float _1694 = _1656 * _1554;
    float _1696 = _1370 * _1672;
    float _1698 = _1346 * _1672;
    float _1700 = _1174 * _1688;
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1704 = fma(_1680, _1690, _1676);
    float _1706 = -_1694;
    float _1708 = fma(_1680, _1674, _1706);
    float _1710 = -_1674;
    float _1712 = fma(_1680, _1694, _1710);
    float _1714 = fma(_1680, _1676, _1690);
    float _1716 = _1704 * _1182;
    float _1718 = -_1700;
    float _1720 = fma(_1186, _1698, _1718);
    float _1722 = _1712 * _1182;
    float _1724 = -_1680;
    float _1726 = fma(_1724, _1696, _1684);
    float _1728 = _1182 * _1698;
    float _1730 = fma(_1660, _1696, _1716);
    float _1732 = fma(_1662, _1696, _1722);
    float _1734 = fma(_1692, _1720, _1726);
    float _1736 = _1704 * _1186;
    float _1738 = -_1728;
    float _1740 = fma(_1174, _1696, _1738);
    float _1742 = -_1680;
    float _1744 = fma(_1742, _1688, _1686);
    float _1746 = fma(_1708, _1720, _1730);
    float _1748 = fma(_1714, _1720, _1732);
    float _1750 = _1712 * _1186;
    float _1752 = fma(_1660, _1688, _1736);
    float _1754 = fma(_1692, _1740, _1744);
    float _1756 = _1078 * _1734;
    float _1758 = fma(_1662, _1688, _1750);
    float _1760 = fma(_1708, _1740, _1752);
    float _1762 = _1078 * _1754;
    float _1764 = fma(_1642, _1746, _1756);
    float _1766 = fma(_1714, _1740, _1758);
    float _1768 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1770 = fma(_1642, _1760, _1762);
    float _1772 = fma(_1658, _1748, _1764);
    float _1774 = fma(_1176, _1538, _1616);
    float _1776 = fma(_1768, _1592, -0.5);
    float _1778 = fma(_1658, _1766, _1770);
    float _1780 = _1172 + _1772;
    float _1782 = _892 * (-0.15915493667125701904296875);
    float _1784 = fma(_974, _1776, _766);
    float _1786 = _1238 + _1778;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1790 = _1780 + _1788;
    float _1792 = fma(_1132, _1506, _1774);
    float _1794 = _1186 * _1696;
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1798 = _1786 + _1796;
    float _1800 = _1790 * _1790;
    float _1802 = _1682 * _1174;
    float _1804 = _708 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1806 = _1798 * _1798;
    float _1808 = -_1794;
    float _1810 = fma(_1182, _1688, _1808);
    float _1812 = _1704 * _1174;
    float _1814 = -_1680;
    float _1816 = fma(_1814, _1698, _1802);
    float _1818 = _1800 + _1806;
    float _1820 = fma(_1804, _1622, -0.5);
    float _1822 = fma(_1188, _1468, _1792);
    float _1824 = _1712 * _1174;
    float _1826 = sqrt(_1818);
    float _1828 = in.m_67.x;
    float _1830 = in.m_67.y;
    float _1832 = in.m_67.z;
    float _1834 = fma(_1660, _1698, _1812);
    float _1836 = fma(_1692, _1810, _1816);
    float _1838 = fma(_1190, _1504, _1822);
    float _1840 = fma(_1662, _1698, _1824);
    float _1842 = fma(_1708, _1810, _1834);
    float _1844 = _1078 * _1836;
    float _1846 = _1782 * 6.283185482025146484375;
    float _1848 = sin(_1846);
    float _1850 = fma(_1226, _1440, _1838);
    float _1852 = fma(_1714, _1810, _1840);
    float _1854 = fma(_1642, _1842, _1844);
    float _1856 = fma(_1202, _1416, _1850);
    float _1858 = fma(_1658, _1852, _1854);
    float _1860 = _1782 * 6.283185482025146484375;
    float _1862 = cos(_1860);
    bool _1864 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1856);
    float _1868 = _1242 + _1858;
    float _1870 = fma(_1866, _1486, _1868);
    float _1872 = _1848 * _1544;
    float _1874 = _1830;
    float _1876 = _1800;
    float _1878 = _1806;
    float _1880 = _1780;
    float _1882 = _1786;
    float _1884 = _1826;
    float _1886 = _1828;
    float _1888 = _1832;
    float _1890 = _1670;
    if (!_1668)
    {
        float _1892 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1830);
        _1874 = _1892;
    }
    float _1894 = _1874;
    if (!_1864)
    {
        _1250 = _1870;
    }
    float _1896 = _1250;
    float _1898 = _1862 * _1544;
    float _1900 = -_1872;
    float _1902 = fma(_1862, _1820, _1900);
    float _1904 = fma(_1848, _1820, _1898);
    float _1906 = fma(_816, _1902, _872);
    bool _1908 = !_1864;
    float _1910 = _1896;
    if (!_1908)
    {
        float _1912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1916 = _1826 + _1914;
        float _1918 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1920 = rsqrt(_1818);
        float _1922 = _1916 * _1912;
        float _1924 = _1922 * 0.15915493667125701904296875;
        float _1926 = _1924 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1924 * 6.283185482025146484375;
        float _1932 = cos(_1930);
        float _1934 = fma(_1928, _1918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1936 = _1920 * _1934;
        float _1938 = fma(_1790, _1936, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1940 = _1932 + (-1.0);
        float _1942 = fma(_1798, _1936, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1946 = _1938 + _1944;
        float _1948 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1952 = _1942 + _1950;
        float _1954 = _1946 * _1946;
        float _1956 = fma(_1870, _1932, _1948);
        float _1958 = _1952 * _1952;
        _1910 = _1956;
        _1876 = _1954;
        _1878 = _1958;
        _1880 = _1938;
        _1882 = _1942;
        _1884 = _1948;
    }
    float _1960 = _1910;
    float _1962 = _1876;
    float _1964 = _1878;
    float _1966 = _1880;
    float _1968 = _1882;
    float _1970 = _1884;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1974 = _1960 + _1972;
    float _1976 = _1970;
    if (!_1668)
    {
        float _1978 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1828);
        _1886 = _1978;
    }
    float _1980 = _1886;
    float _1982 = _1734 * _1894;
    if (!_1668)
    {
        float _1984 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1832);
        _1888 = _1984;
    }
    float _1986 = _1888;
    float _1988 = fma(_1974, _1974, _1962);
    float _1990 = _1836 * _1894;
    float _1992 = _1754 * _1894;
    float _1994 = fma(_1746, _1980, _1982);
    float _1996 = _1988 + _1964;
    float _1998 = fma(_1842, _1980, _1990);
    float _2000 = -_982;
    float _2002 = fma(_980, _1904, _2000);
    float _2004 = fma(_1760, _1980, _1992);
    float _2006 = fma(_1748, _1986, _1994);
    float _2008 = fma(_1852, _1986, _1998);
    float _2010 = sqrt(_1996);
    float _2012 = _1604 + 0.5;
    float _2014 = _1784 + 0.5;
    float _2016 = _1906 + 0.5;
    float _2018 = _2002 + 0.5;
    float _2020 = fma(_1766, _1986, _2004);
    out.m_69.x = _514;
    out.m_69.y = _516;
    out.m_69.z = _520;
    out.m_69.w = _522;
    out.m_71.x = _660;
    out.m_71.y = _658;
    out.m_71.z = _662;
    out.m_71.w = _664;
    out.m_73.w = _1670;
    bool _2022 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2024 = isnan(_2010);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2030 = _2026 || _2028;
    out.m_75.x = _2014;
    out.m_75.y = _2012;
    out.m_75.z = _2016;
    out.m_75.w = _2018;
    out.m_77.x = _2006;
    out.m_77.y = _2008;
    out.m_77.z = _2020;
    if (!_2030)
    {
        _1976 = 1.0;
    }
    float _2032 = _1976;
    bool _2034 = !_2030;
    float _2036 = _2032;
    if (!_2034)
    {
        bool _2038 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2040 = isnan(_2010);
        bool _2042 = _2038 || _2040;
        bool _2044 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2046 = _2042 || _2044;
        if (!_2046)
        {
            float _2048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2050 = _2010 + _2048;
            float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2054 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2052;
            float _2056 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2060 = 1.0 / _2054;
            float _2062 = _2050 * _2060;
            float _2064 = fma(_2062, _2058, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2036 = _2064;
            _2066 = true;
        }
        else
        {
            bool _2068 = _2010 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2070 = isnan(_2010);
            bool _2072 = _2068 || _2070;
            bool _2074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2076 = _2072 || _2074;
            if (!_2076)
            {
                float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2080 = _2010 + _2078;
                float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2084 = _2082 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2086 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2088 = _2086 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2090 = 1.0 / _2084;
                float _2092 = _2080 * _2090;
                float _2094 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2036 = _2094;
                _2066 = true;
            }
            else
            {
                _2036 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2066 = false;
    float _2096 = _2036;
    float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2100 = _1960 + _2098;
    float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2104 = _1966 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2108 = _1968 + _2106;
    float _2110 = fma(_2100, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2112 = fma(_2104, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2114 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2118 = _2110 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2122 = _2112 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2114 + _2124;
    float _2128 = _2118 * _2118;
    float _2130 = fma(_2122, _2122, _2128);
    float _2132 = fma(_2126, _2126, _2130);
    float _2134 = rsqrt(_2132);
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2122 * _2136;
    float _2140 = _2126 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2126;
    float _2158 = _2154;
    float _2160 = _2118;
    if (_2150)
    {
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2162;
    }
    float _2164 = _2156;
    if (_2150)
    {
        float _2166 = rsqrt(_2146);
        _668 = _2166;
    }
    float _2168 = _668;
    float _2170 = _2168;
    if (_2150)
    {
        float _2172 = _2154 * _2164;
        _2158 = _2172;
    }
    float _2174 = _2158;
    if (_2150)
    {
        float _2176 = _2174 * 0.15915493667125701904296875;
        _1890 = _2176;
    }
    float _2178 = _1890;
    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2182 = _2134;
    if (_2150)
    {
        float _2184 = _2178 * 6.283185482025146484375;
        float _2186 = sin(_2184);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2192 = precise::max(0.0, _2190);
    float _2194 = _2100;
    float _2196 = _2192;
    float _2198 = _2190;
    if (_2150)
    {
        float _2200 = _2178 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        _2194 = _2202;
    }
    float _2204 = _2194;
    float _2206 = -_2136;
    float _2208 = -_2192;
    float _2210 = fma(_2118, _2206, _2208);
    float _2212 = _2210;
    if (!_2150)
    {
        _2196 = _2140;
    }
    float _2214 = _2196;
    float _2216 = _2214;
    if (_2150)
    {
        float _2218 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2198 = _2218;
    }
    float _2220 = _2198;
    float _2222 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2224 = _2188;
    float _2226 = _2220;
    if (_2150)
    {
        float _2228 = fma(_2188, _2220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2160 = _2228;
    }
    float _2230 = _2160;
    float _2232 = _2230;
    if (!_2150)
    {
        _2224 = _2138;
    }
    float _2234 = _2224;
    float _2236 = _2234;
    if (_2150)
    {
        float _2238 = _2168 * _2230;
        _2232 = _2238;
    }
    float _2240 = _2232;
    if (_2150)
    {
        float _2242 = _2204 + (-1.0);
        _2226 = _2242;
    }
    float _2244 = _2226;
    float _2246 = _2244;
    if (!_2150)
    {
        _2170 = _2142;
    }
    float _2248 = _2170;
    float _2250 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2252 = _2248;
    if (_2150)
    {
        float _2254 = _2138 * _2240;
        _2236 = _2254;
    }
    float _2256 = _2236;
    if (_2150)
    {
        float _2258 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2258;
    }
    float _2260 = _2246;
    float _2262 = _2260;
    if (_2150)
    {
        float _2264 = _2140 * _2240;
        _2216 = _2264;
    }
    float _2266 = _2216;
    float _2268 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2150)
    {
        float _2270 = _2256 * _2256;
        _2252 = _2270;
    }
    float _2272 = _2252;
    if (_2150)
    {
        float _2274 = fma(_2210, _2204, _2260);
        _2212 = _2274;
    }
    float _2276 = _2212;
    if (!_2150)
    {
        _2262 = _2144;
    }
    float _2278 = _2262;
    float _2280 = _2278;
    if (_2150)
    {
        float _2282 = _2266 * _2266;
        _2280 = _2282;
    }
    float _2284 = _2280;
    float _2286 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2268);
    float _2288 = fma(_2276, _2276, _2272);
    float _2290 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2222);
    float _2292 = sqrt(_2132);
    float _2294 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2286);
    float _2296 = _2288 + _2284;
    float _2298 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2300 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2302 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2298);
    float _2304 = rsqrt(_2296);
    float _2306 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2290);
    float _2308 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2250);
    float _2310 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2302);
    float _2312 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2314 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2308);
    float _2316 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2320 = fma(_2292, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2318);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2326 = -_2322;
    float _2328 = _2326 + 1.0;
    float _2330 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2332 = -_2324;
    float _2334 = fma(_2332, _2180, 1.0);
    float _2336 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2338 = _2304 * _2276;
    float _2340 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2330);
    float _2342 = abs(_2328);
    float _2344 = log2(_2342);
    float _2346 = _2304 * _2256;
    float _2348 = _2304 * _2266;
    float _2350 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2340);
    float _2352 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2356 = log2(_2334);
    float _2358 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2360 = -_2354;
    float _2362 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2360);
    float _2364 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2358);
    float _2366 = -_2348;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2362);
    float _2370 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2372 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2374 = 1.0 / _2352;
    float _2376 = fma(_2368, -0.5, 0.5);
    float _2378 = fma(_2368, 0.5, 0.5);
    float _2380 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2372);
    float _2382 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2364);
    float _2384 = _2338 + 1.0;
    float _2386 = fma(_2378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2388 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2380);
    float _2390 = exp2(_2370);
    float _2392 = fma(_2378, _2386, -0.212114393711090087890625);
    float _2394 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2388);
    float _2396 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2382);
    float _2398 = fma(_2378, _2392, 1.570728778839111328125);
    float _2400 = sqrt(_2376);
    float _2402 = _2394 * _2374;
    float _2404 = fma(_2402, 0.5, 0.5);
    float _2406 = -_2338;
    float _2408 = fma(_2390, _2384, _2406);
    float _2410 = _2356 * 0.693147182464599609375;
    float _2412 = _2396 * _2374;
    float _2414 = fma(_2408, 0.5, 0.5);
    float _2416 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2418 = fma(_2412, -0.5, 0.5);
    float _2420 = _2400 * 0.636619746685028076171875;
    float _2422 = -_2398;
    float _2424 = fma(_2420, _2422, 1.0);
    float3 _6742 = float3(_2404, _2418, _2416);
    float _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6742, float3(0.0), isnan(_6742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6742, float3(0.0), isnan(_6742)), level(0.0)).x;
    float3 _6753 = float3(_2404, _2418, _2416);
    float4 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6753, float3(0.0), isnan(_6753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6753, float3(0.0), isnan(_6753)), level(0.0)).xyzw;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = _2429.w;
    float2 _6770 = float2(_2424, _2414);
    float3 _2441 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6770, float2(0.0), isnan(_6770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6770, float2(0.0), isnan(_6770)), level(0.0)).xyz;
    float _2443 = _2441.x;
    float _2445 = _2441.y;
    float _2447 = _2441.z;
    float _2449 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2451 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2453 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2455 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2457 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2449);
    float _2459 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2453);
    float _2461 = exp2(_2451);
    float _2463 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2457);
    float _2465 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2455);
    float _2467 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2469 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2471 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan(0.5);
    bool _2479 = _2475 || _2477;
    float _2481 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2465);
    float _2483 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2467);
    float _2485 = 1.0 / _2469;
    float _2487 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2489 = _2483 + _2352;
    float _2491 = _2487 + _2469;
    float _2493 = -_2461;
    float _2495 = _2493 + 1.0;
    float _2497 = _2489 * 0.5;
    float _2499 = _2491 * _2485;
    float _2501 = _2499 * 0.5;
    float _2503 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2505 = _2495;
    float _2507 = _2352;
    float _2509 = _2483;
    float _2511 = _2396;
    float _2513 = _2394;
    if (_2479)
    {
        _2505 = 1.0;
    }
    float _2515 = _2505;
    float _2517 = _2515;
    float _2519 = _2433;
    float _2521 = _2431;
    if (!_2479)
    {
        float _2523 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = _2525 * 6.283185482025146484375;
        float _2529 = cos(_2527);
        float _2531 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2533 = _2531 * 0.15915493667125701904296875;
        float _2535 = _2525 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2541 = fma(_2501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2539);
        float _2543 = 1.0 / _2529;
        float _2545 = _2533 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = _2537 * _2543;
        float _2551 = 1.0 / _2541;
        float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2555 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2553;
        float _2557 = _2547 * _2549;
        float _2559 = _2533 * 6.283185482025146484375;
        float _2561 = sin(_2559);
        float _2563 = 1.0 / _2557;
        float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2567 = _2551 * _2565;
        float _2569 = 1.0 / _2555;
        float _2571 = _2561 * _2563;
        float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2575 = fma(_2571, _2567, _2573);
        float _2577 = _2575 * _2569;
        float _2579 = precise::clamp(_2577, 0.0, 1.0);
        _2517 = _2579;
    }
    float _2581 = _2517;
    float _2583 = _2503 * _2426;
    float _2585 = -_2503;
    float _2587 = _2585 + 1.0;
    out.m_79.z = _2497;
    out.m_79.w = _2352;
    bool _2589 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2591 = isnan(_2292);
    bool _2593 = _2589 || _2591;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2597 = _2593 || _2595;
    float _2599 = _2437 * _2583;
    float _2601 = _2447 * _2583;
    float _2603 = _2437 * _2587;
    float _2605 = fma(_2443, _2599, _2431);
    float _2607 = fma(_2445, _2599, _2433);
    float _2609 = fma(_2437, _2601, _2435);
    out.gl_Position.x = _2394;
    out.gl_Position.y = _2396;
    out.gl_Position.z = _2483;
    out.gl_Position.w = _2352;
    float _2611 = _2581 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _2605;
    out.m_81.y = _2607;
    out.m_81.z = _2609;
    out.m_81.w = _2603;
    if (!_2597)
    {
        _2519 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2613 = _2519;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2597)
    {
        _2521 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2619 = _2521;
    float _2621 = _2619;
    float _2623 = _2619;
    if (!_2597)
    {
        _2507 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2625 = _2507;
    float _2627 = _2625;
    float _2629 = _2625;
    if (!_2597)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2631 = _2509;
    float _2633 = _2631;
    float _2635 = _2631;
    if (!_2597)
    {
        _2511 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2637 = _2511;
    float _2639 = _2637;
    float _2641 = _2637;
    if (!_2597)
    {
        _2513 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2643 = _2513;
    bool _2645 = !_2597;
    float _2647 = _2643;
    float _2649 = _2643;
    if (!_2645)
    {
        bool _2651 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2653 = isnan(_2292);
        bool _2655 = _2651 || _2653;
        bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2659 = _2655 || _2657;
        if (!_2659)
        {
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2663 = _2292 + _2661;
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2665;
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2673 = 1.0 / _2667;
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2681 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2689 = _2687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2691 = _2663 * _2673;
            float _2693 = precise::clamp(_2691, 0.0, 1.0);
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2699 = fma(_2693, _2671, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2701 = fma(_2693, _2697, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2703 = fma(_2693, _2677, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2705 = fma(_2693, _2681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2707 = fma(_2693, _2685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2709 = fma(_2693, _2689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2623 = _2703;
            _2641 = _2707;
            _2617 = _2699;
            _2635 = _2705;
            _2629 = _2701;
            _2649 = _2709;
            _2711 = true;
        }
        else
        {
            bool _2713 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2715 = isnan(_2292);
            bool _2717 = _2713 || _2715;
            bool _2719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2721 = _2717 || _2719;
            if (!_2721)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2723 = _2615;
            _2617 = _2723;
            if (!_2721)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2725 = _2621;
            _2623 = _2725;
            if (!_2721)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2727 = _2627;
            _2629 = _2727;
            if (!_2721)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2729 = _2633;
            _2635 = _2729;
            if (!_2721)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2731 = _2639;
            _2641 = _2731;
            if (!_2721)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2733 = _2647;
            bool _2735 = !_2721;
            _2649 = _2733;
            if (!_2735)
            {
                bool _2737 = _2292 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2739 = isnan(_2292);
                bool _2741 = _2737 || _2739;
                bool _2743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2745 = _2741 || _2743;
                if (!_2745)
                {
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2749 = _2292 + _2747;
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2751;
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2759 = 1.0 / _2753;
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2777 = _2749 * _2759;
                    float _2779 = precise::clamp(_2777, 0.0, 1.0);
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2785 = fma(_2779, _2757, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2787 = fma(_2779, _2783, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2789 = fma(_2779, _2763, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2791 = fma(_2779, _2767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2793 = fma(_2779, _2771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2795 = fma(_2779, _2775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2623 = _2789;
                    _2641 = _2793;
                    _2617 = _2785;
                    _2635 = _2791;
                    _2629 = _2787;
                    _2649 = _2795;
                    _2711 = true;
                }
                else
                {
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2711 = false;
    float _2797 = _2623;
    float _2799 = _2641;
    float _2801 = _2617;
    float _2803 = _2635;
    float _2805 = _2629;
    float _2807 = _2649;
    float _2809 = _2611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2811 = fma(_2008, -0.5, 0.5);
    float _2813 = precise::clamp(_2811, 0.0, 1.0);
    float _2815 = -_2797;
    float _2817 = _2815 + _2799;
    float _2819 = -_2801;
    float _2821 = _2819 + _2803;
    out.m_83.x = 0.0;
    float _2823 = fma(_2813, _2817, _2797);
    float _2825 = -_2805;
    float _2827 = _2825 + _2807;
    float _2829 = fma(_2813, _2821, _2801);
    float _2831 = _2823 * 0.586610972881317138671875;
    bool _2833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2835 = fma(_2813, _2827, _2805);
    out.m_49.x = _2809;
    float _2837 = fma(_2829, 0.298911988735198974609375, _2831);
    bool _2839 = _2581 > 0.0;
    bool _2841 = isnan(_2581);
    bool _2843 = _2839 || _2841;
    bool _2845 = isnan(0.0);
    bool _2847 = _2843 || _2845;
    float _2849 = fma(_2835, 0.114477999508380889892578125, _2837);
    float _2851 = -_2849;
    float _2853 = _2829 + _2851;
    float _2855 = -_2849;
    float _2857 = _2823 + _2855;
    float _2859 = -_2849;
    float _2861 = _2835 + _2859;
    float _2863 = fma(_2853, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    float _2865 = fma(_2857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    float _2867 = fma(_2861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2849);
    bool _2869 = !_2833;
    if (!_2869)
    {
        float _2871 = -_2110;
        float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2875 = -_2112;
        float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2879 = -_2114;
        float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2883 = _2873 * _2873;
        float _2885 = fma(_2877, _2877, _2883);
        float _2887 = fma(_2881, _2881, _2885);
        float _2889 = sqrt(_2887);
        float _2891 = rsqrt(_2887);
        float _2893 = -_2889;
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2897 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        float _2901 = _2877 * _2891;
        float _2903 = _2873 * _2891;
        float _2905 = abs(_2899);
        float _2907 = log2(_2905);
        float _2909 = _2881 * _2891;
        float _2911 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2913 = _2008 * _2903;
        float _2915 = -_2903;
        float _2917 = -_2911;
        float _2919 = fma(_2915, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2917);
        float _2921 = fma(_2006, _2901, _2913);
        float _2923 = -_2909;
        float _2925 = fma(_2923, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2919);
        float _2927 = fma(_2020, _2909, _2921);
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2933 = _2925 + _2931;
        float _2935 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2937 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2939 = precise::clamp(_2937, 0.0, 1.0);
        float _2941 = exp2(_2935);
        float _2943 = _2941 * _2939;
        float _2945 = _2929 * _2943;
        float _2947 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2949 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2951 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2947;
        out.m_83.y = _2949;
        out.m_83.z = _2951;
    }
    out.m_85.x = _2863;
    out.m_85.y = _2865;
    out.m_85.z = _2867;
    if (_2847)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2953 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2953;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

