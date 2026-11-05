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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_59 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
    float4 m_65 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_69 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3746 = false;
    bool _716 = false;
    bool _538 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4051 = as_type<float>(_132);
        out.gl_Position.z = _4051;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4121 = as_type<float>(_170);
        out.gl_Position.z = _4121;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_53.x;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _176 = _150 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _178 = _150 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _188 = _176 * _174;
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _192 = _178 * _186;
    float _194 = floor(_190);
    float _196 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].y, _192);
    float _198 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _200 = _190 * 6.283185482025146484375;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _208 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _210 = floor(_196);
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _214 = _212 != 0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _218 = _216 != 0;
    float _220 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _206);
    float _222 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _208);
    float _224 = _200 * 0.15915493667125701904296875;
    float _226 = _196 * 6.283185482025146484375;
    float _228 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _198);
    float _230 = -_194;
    float _232 = _190 + _230;
    bool _234 = !_214;
    int _236 = _234 ? 0 : 1;
    float _238 = _226 * 0.15915493667125701904296875;
    float _240 = _224 * 6.283185482025146484375;
    float _242 = cos(_240);
    int _244 = abs(_236);
    bool _246 = !_204;
    int _248 = _246 ? 0 : 1;
    float _250 = -_210;
    float _252 = _196 + _250;
    float _254 = _238 * 6.283185482025146484375;
    float _256 = cos(_254);
    int _258 = abs(_248);
    float _260 = -_232;
    float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _264 = float(_244);
    float _266 = -_252;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _272 = !_218;
    int _274 = _272 ? 0 : 1;
    float _276 = fma(_242, 0.5, 0.5);
    bool _278 = _252 < 0.5;
    float _280 = float(_278);
    float _282 = abs(_262);
    float _284 = _264 * _282;
    float _286 = abs(_268);
    float _288 = _264 * _286;
    bool _290 = _232 < 0.5;
    float _292 = float(_290);
    float _294 = -_276;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _298 = abs(_274);
    float _300 = -_280;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _304 = fma(_256, 0.5, 0.5);
    float _306 = float(_258);
    float _308 = -_292;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = float(_298);
    float _314 = -_304;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _318 = fma(_306, _296, _284);
    float _320 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _228);
    float _322 = fma(_306, _316, _288);
    float _324 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _220);
    float _326 = abs(_310);
    float _328 = fma(_312, _326, _318);
    float _330 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _222);
    float _332 = abs(_302);
    float _334 = fma(_312, _332, _322);
    bool _336 = !_270;
    float _338 = _324;
    float _340 = _320;
    float _342 = _330;
    float _358;
    if (!_336)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_116);
        float _364 = 1.0 / _362;
        float _366 = _150 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _368 + _370;
    bool _374 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _368 + _386;
    bool _390 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_368);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _410 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _412 = isnan(_368);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -_384;
    float _424 = _422 + 1.0;
    float _426 = 1.0 / _408;
    float _428 = _420 * _424;
    float _430 = -_420;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _404;
    float _442 = _400 * _432;
    float _444 = -_400;
    float _446 = _444 + 1.0;
    float _448 = _388 * _426;
    float _450 = _372 * _440;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _456;
    float _460 = fma(_436, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_454, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = fma(_458, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    float _472 = _460 * _442;
    float _474 = _462 * _442;
    float _476 = _464 * _442;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _492 = fma(_480, _448, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_484, _448, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _498 = fma(_488, _448, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _502 = fma(_492, _428, _490);
    float _504 = fma(_494, _428, _496);
    float _506 = fma(_498, _428, _500);
    float _508 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].x, _502);
    float _510 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].y, _504);
    float _512 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].z, _506);
    float _514 = _508 * _466;
    float _516 = _510 * _468;
    float _518 = _512 * _470;
    bool _520 = !_438;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_116);
        float _542 = 1.0 / _540;
        float _544 = _150 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _562 = isnan(_546);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _576 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_546);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = 1.0 / _554;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -_570;
    float _596 = _594 + 1.0;
    bool _598 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_546);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _612 = 1.0 / _558;
    float _614 = 1.0 / _574;
    float _616 = _592 * _588;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = _586 * _596;
    float _624 = -_586;
    float _626 = _624 + 1.0;
    float _628 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _630 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _632 = isnan(_546);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = _608 * _626;
    float _644 = _620 * _612;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _546 + _650;
    float _654 = _628 * _642;
    float _656 = -_608;
    float _658 = _656 + 1.0;
    float _660 = -_640;
    float _662 = _660 + 1.0;
    float _664 = fma(_644, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = _648 * _614;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _546 + _668;
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[115].x, _654);
    float _674 = _570 * _662;
    float _676 = fma(_666, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _678 = fma(_664, _622, _672);
    float _680 = fma(_676, _674, _678);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[118].x, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _690;
    out.m_59.y = _692;
    out.m_59.z = _694;
    out.m_59.w = _696;
    bool _698 = !_610;
    float _714;
    if (!_698)
    {
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _702 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_116);
        float _720 = 1.0 / _718;
        float _722 = _150 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = in.m_46.x;
    float _728 = in.m_46.y;
    float _730 = in.m_46.z;
    float _732 = _328 * _514;
    float _734 = in.m_53.y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = in.m_53.z;
    float _744 = _334 * _516;
    float _746 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _752 = _728 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _754 = _728 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _756 = _728 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _758 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[5].x, _752);
    float _760 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[4].x, _754);
    float _762 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[6].x, _756);
    float _764 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[5].z, _758);
    float _766 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    float _768 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[6].z, _762);
    float _770 = _172 * 2.0;
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _774 = _766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _780 = -_772;
    float _782 = _780 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _784 = -_774;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = -_776;
    float _790 = _788 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _792 = floor(_770);
    float _794 = _782 * _782;
    float _796 = fma(_778, -2.0, _736);
    float _798 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = fma(_786, _786, _794);
    float _804 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _806 = -_800;
    float _808 = fma(_798, 2.0, _806);
    float _810 = fma(_790, _790, _802);
    float _812 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _814 = rsqrt(_810);
    float _816 = -_812;
    float _818 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _816);
    bool _820 = _792 > 0.0;
    bool _822 = _792 >= 0.0;
    bool _824 = isnan(_792);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _834 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _836 = _734 * 2.0;
    float _838 = -_832;
    float _840 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _838);
    float _842 = -_834;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _842);
    float _846 = floor(_836);
    float _848 = _172 + _734;
    float _850 = _786 * _814;
    float _852 = _790 * _814;
    float _854 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _856 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _858 = _850 * _850;
    float _860 = _848 + (-1.0);
    float _862 = -_854;
    float _864 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _862);
    float _866 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _868 = fma(_852, _852, _858);
    float _870 = -_856;
    float _872 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _870);
    float _874 = _742 * 2.0;
    float _876 = -_866;
    float _878 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _876);
    float _880 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _882 = _734 + _742;
    float _884 = rsqrt(_868);
    bool _886 = _846 > 0.0;
    float _888 = _844 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _890 = _846 >= 0.0;
    bool _892 = isnan(_846);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = _882 + (-1.0);
    float _902 = _840 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _904 = -_888;
    float _906 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[1].x, _904);
    float _908 = floor(_874);
    float _910 = _782 * _814;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _914 = -_902;
    float _916 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[1].y, _914);
    float _918 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].w, _906);
    float _920 = _844 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _922 = _872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[1].w, _916);
    float _926 = _852 * _884;
    float _928 = _850 * _884;
    float _930 = _918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _932 = -_920;
    float _934 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _936 = -_926;
    float _938 = _852 * _936;
    float _940 = -_922;
    float _942 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[1].x, _940);
    float _944 = -_930;
    float _946 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _948 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].w, _934);
    float _950 = -_938;
    float _952 = fma(_850, _928, _950);
    float _954 = _910 * _928;
    float _956 = -_926;
    float _958 = _910 * _956;
    bool _960 = _908 > 0.0;
    float _962 = _952 * _952;
    bool _964 = _908 >= 0.0;
    bool _966 = isnan(_908);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].z, _946);
    float _976 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _942);
    float _978 = fma(_954, _954, _962);
    float _980 = _844 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _982 = _840 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _984 = -_976;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].w, _974);
    float _988 = fma(_958, _958, _978);
    float _990 = -_980;
    float _992 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[0].x, _990);
    float _994 = _976;
    float _996 = _974;
    if (_740)
    {
        _994 = _172;
    }
    float _998 = _994;
    float _1000 = 1.0 / _986;
    float _1002 = _998;
    if (!_740)
    {
        _1002 = _742;
    }
    float _1004 = _1002;
    float _1006 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].w, _992);
    float _1008 = -_982;
    float _1010 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1008);
    float _1012 = _844 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1014 = _830 ? 0 : 1;
    float _1016 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_740)
    {
        _996 = _734;
    }
    float _1018 = _996;
    float _1020 = rsqrt(_988);
    float _1022 = -_1012;
    float _1024 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1022);
    float _1026 = _1018;
    if (!_740)
    {
        _1026 = _172;
    }
    float _1028 = _1026;
    float _1030 = -_750;
    float _1032 = fma(_1016, 2.0, _1030);
    int _1034 = ~_1014;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1042 = _1038;
    if (!_820)
    {
        int _1044 = ~_1014;
        int _1046 = _1044 + 1;
        _1042 = _1046;
    }
    int _1048 = _1042;
    float _1050 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1052 = log2(_1050);
    float _1054 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1010);
    float _1056 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1058 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1024);
    int _1060 = _972 ? 0 : 1;
    float _1062 = fma(_1006, _1000, -1.0);
    float _1064 = fma(_1056, -2.0, _1040);
    float _1066 = _952 * _1020;
    float _1068 = precise::clamp(_1066, 0.0, 1.0);
    float _1070 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1072 = int(_1070);
    int _1074 = _898 ? 0 : 1;
    float _1076 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1064);
    float _1078 = -_1068;
    float _1080 = _1078 + 1.0;
    int _1082 = ~_1060;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = -_150;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1032);
    int _1092 = _1086;
    if (!_960)
    {
        int _1094 = ~_1060;
        int _1096 = _1094 + 1;
        _1092 = _1096;
    }
    int _1098 = _1092;
    float _1100 = _1052 * _150;
    float _1102 = _1080 * _1000;
    float _1104 = fma(_1080, _1062, 1.0);
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1116 = _1114 != 0;
    float _1118 = exp2(_1100);
    float _1120 = _1054 * _1102;
    float _1122 = _1058 * _1102;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1126 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1134 = _1130 || _1132;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1138 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1140 = isnan(1.0);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1146 = _1142 || _1144;
    float _1148 = -_150;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _1152 = _1104 * _1104;
    bool _1154 = !_1112;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1160 = !_1108;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = fma(_1120, _1120, _1152);
    bool _1166 = !_1116;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1124);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1182 = _1180 != 0;
    float _1184 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1136);
    float _1186 = float(_1072);
    float _1188 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1158);
    float _1190 = fma(_1122, _1122, _1164);
    bool _1192 = !_1178;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = 1.0 / _1186;
    bool _1198 = !_1174;
    int _1200 = _1198 ? 0 : 1;
    float _1202 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1170);
    int _1204 = ~_1074;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1212 = 1.0 + _1210;
    int _1214 = _1208;
    if (!_886)
    {
        int _1216 = ~_1074;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    float _1222 = -_1118;
    float _1224 = _1222 + 1.0;
    float _1226 = rsqrt(_1190);
    float _1228 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1184);
    int _1230 = abs(_1194);
    float _1232 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1188);
    int _1234 = abs(_1200);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1240 = _772 + _1238;
    float _1242 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1244 = int(_1242);
    float _1246 = float(_1048);
    float _1248 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1236);
    float _1250 = float(_1230);
    float _1252 = _1196 * _150;
    float _1254 = _1134 ? _1224 : 0.0;
    float _1256 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1248);
    float _1258 = float(_1234);
    float _1260 = 1.0 / _1212;
    float _1262 = _1122 * _1226;
    float _1264 = _1104 * _1226;
    float _1266 = _1120 * _1226;
    float _1268 = float(_1098);
    float _1270 = -_1262;
    float _1272 = _850 * _1270;
    float _1274 = _852 * _1264;
    float _1276 = _1240 * _1240;
    float _1278 = float(_1244);
    float _1280 = _1250 * _1246;
    float _1282 = -_1266;
    float _1284 = -_1272;
    float _1286 = fma(_852, _1282, _1284);
    float _1288 = in.m_61.x;
    float _1290 = in.m_61.y;
    float _1292 = in.m_61.z;
    float _1294 = -_1262;
    float _1296 = -_1274;
    float _1298 = fma(_910, _1294, _1296);
    float _1300 = _1278 * _150;
    float _1302 = -_1266;
    float _1304 = _910 * _1302;
    float _1306 = _1286 * _1286;
    if (_1146)
    {
        float _1308 = _1254 * _1260;
        _152 = _1308;
    }
    float _1310 = _152;
    float _1312 = _1258 * _1268;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1316 = _774 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _776 + _1318;
    float _1322 = -_1304;
    float _1324 = fma(_850, _1264, _1322);
    float _1326 = fma(_1298, _1298, _1306);
    float _1328 = fma(_1316, _1316, _1276);
    float _1330 = _1280 * (-2.0);
    float _1332 = _734 + (-0.5);
    float _1334 = fma(_1324, _1324, _1326);
    float _1336 = fma(_1320, _1320, _1328);
    bool _1338 = !_1182;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = fma(_912, _1330, _912);
    float _1344 = rsqrt(_1334);
    float _1346 = _1312 * (-2.0);
    int _1348 = abs(_1340);
    float _1350 = float(_1220);
    float _1352 = fma(_1330, _1290, _1290);
    float _1354 = float(_1348);
    float _1356 = sqrt(_1336);
    float _1358 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1360 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1362 = fma(_1346, _1288, _1288);
    float _1364 = _172 + _742;
    float _1366 = _1354 * _1350;
    float _1368 = fma(_1342, _1310, _1360);
    float _1370 = fma(_880, _1346, _880);
    float _1372 = rsqrt(_1336);
    float _1374 = _1368 * 0.15915493667125701904296875;
    float _1376 = _172 + (-0.5);
    float _1378 = _1364 + (-1.0);
    float _1380 = _1298 * _1344;
    float _1382 = _1366 * (-2.0);
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1362);
    float _1386 = _1358 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1388 = _1356 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1392 = _1286 * _1344;
    float _1394 = _1324 * _1344;
    float _1396 = _852 * _1380;
    float _1398 = precise::min(_1386, _1388);
    float _1400 = fma(_1382, _1292, _1292);
    float _1402 = _910 * _1394;
    float _1404 = _850 * _1392;
    float _1406 = -_1396;
    float _1408 = fma(_850, _1394, _1406);
    float _1410 = _1372 * _1398;
    float _1412 = -_1402;
    float _1414 = fma(_852, _1392, _1412);
    float _1416 = -_1404;
    float _1418 = fma(_910, _1380, _1416);
    float _1420 = _1408 * _1408;
    float _1422 = _742 + (-0.5);
    float _1424 = _1240 * _1410;
    float _1426 = _1316 * _1410;
    float _1428 = fma(_1414, _1414, _1420);
    float _1430 = fma(_1390, _1382, _1390);
    float _1432 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1400);
    float _1434 = -_1424;
    float _1436 = _1240 + _1434;
    float _1438 = fma(_1370, _1310, _1384);
    float _1440 = fma(_1418, _1418, _1428);
    float _1442 = fma(_1430, _1310, _1432);
    float _1444 = -_1426;
    float _1446 = _1316 + _1444;
    float _1448 = _1436 * _1436;
    float _1450 = _1320 * _1410;
    float _1452 = _1374 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1438 * 0.15915493667125701904296875;
    float _1458 = fma(_1446, _1446, _1448);
    float _1460 = -_1450;
    float _1462 = _1320 + _1460;
    float _1464 = _1442 * 0.15915493667125701904296875;
    float _1466 = fma(_1462, _1462, _1458);
    float _1468 = _1374 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = rsqrt(_1440);
    float _1474 = _1456 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = _1456 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _1418 * _1472;
    float _1484 = _1414 * _1472;
    float _1486 = _1408 * _1472;
    float _1488 = _850 * _1482;
    float _1490 = _1464 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = in.m_63.x;
    float _1496 = in.m_63.y;
    float _1498 = in.m_63.z;
    float _1500 = _1476 * _1454;
    float _1502 = _1476 * _1470;
    float _1504 = -_1488;
    float _1506 = fma(_852, _1484, _1504);
    float _1508 = sqrt(_1466);
    float _1510 = _1480 * _1470;
    float _1512 = _1480 * _1454;
    float _1514 = _1506 * _1506;
    float _1516 = _1476 * _1492;
    float _1518 = _1470 * _1492;
    float _1520 = _1480 * _1492;
    float _1522 = _1454 * _1492;
    float _1524 = _852 * _1486;
    float _1526 = _1464 * 6.283185482025146484375;
    float _1528 = sin(_1526);
    float _1530 = _1372 * _1508;
    float _1532 = _910 * _1484;
    float _1534 = -_1524;
    float _1536 = fma(_910, _1482, _1534);
    float _1538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1494);
    float _1540 = _748 * _1530;
    float _1542 = -_1532;
    float _1544 = fma(_850, _1486, _1542);
    float _1546 = fma(_1536, _1536, _1514);
    float _1548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1496);
    float _1550 = _1358 * _1530;
    float _1552 = _746 * _1530;
    float _1554 = fma(_1544, _1544, _1546);
    float _1556 = _1540 * _1548;
    float _1558 = _1550 * _1538;
    float _1560 = fma(_1528, _1510, _1500);
    float _1562 = rsqrt(_1554);
    float _1564 = _1520 * _1556;
    float _1566 = -_1502;
    float _1568 = fma(_1528, _1512, _1566);
    float _1570 = _1552 * _1498;
    float _1572 = -_1556;
    float _1574 = _1528 * _1572;
    float _1576 = fma(_1560, _1558, _1564);
    float _1578 = -_1512;
    float _1580 = fma(_1528, _1502, _1578);
    float _1582 = _1516 * _1556;
    float _1584 = fma(_1518, _1558, _1574);
    float _1586 = fma(_1568, _1570, _1576);
    float _1588 = fma(_1528, _1500, _1510);
    float _1590 = fma(_1580, _1558, _1582);
    float _1592 = fma(_1522, _1570, _1584);
    float _1594 = _1482 * _1586;
    float _1596 = fma(_1588, _1570, _1590);
    float _1598 = _1544 * _1562;
    float _1600 = _1484 * _1586;
    float _1602 = _1536 * _1562;
    float _1604 = _1486 * _1586;
    float _1606 = fma(_1598, _1592, _1594);
    float _1608 = _1506 * _1562;
    float _1610 = fma(_1602, _1592, _1600);
    float _1612 = -_1424;
    float _1614 = _772 + _1612;
    float _1616 = fma(_852, _1596, _1606);
    float _1618 = fma(_1608, _1592, _1604);
    float _1620 = fma(_850, _1596, _1610);
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1624 = _776 + _1616;
    float _1626 = fma(_910, _1596, _1618);
    float _1628 = _774 + _1620;
    float _1630 = -_1450;
    float _1632 = _776 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1636 = _1624 + _1634;
    float _1638 = _772 + _1626;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1642 = _1628 + _1640;
    float _1644 = _1636 * _1636;
    float _1646 = fma(_1642, _1642, _1644);
    float _1648 = -_1426;
    float _1650 = _774 + _1648;
    float _1652 = sqrt(_1646);
    float _1654 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1622);
    float _1656 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1654);
    bool _1658 = _1652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = _1626;
    float _1662 = _1628;
    float _1664 = _1596;
    float _1666 = _1424;
    float _1668 = _1450;
    float _1670 = _1646;
    int _1672 = as_type<int>(_1494);
    if (!_1658)
    {
        _1660 = _1628;
    }
    float _1674 = _1660;
    float _1676 = _1674;
    if (!_1658)
    {
        _1662 = _1624;
    }
    float _1678 = _1662;
    float _1680 = _1678;
    if (!_1658)
    {
        _1664 = _1638;
    }
    float _1682 = _1664;
    bool _1684 = !_1658;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1652 + _1690;
        float _1694 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1646);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1642, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1636, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1638, _1708, _1720);
        _1686 = _1722;
        _1676 = _1716;
        _1680 = _1718;
    }
    float _1724 = _1686;
    float _1726 = _1676;
    float _1728 = _1680;
    float _1730 = -_772;
    float _1732 = _1730 + _1724;
    float _1734 = -_774;
    float _1736 = _1734 + _1726;
    float _1738 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1740 = _1614 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1742 = _1732 * _1732;
    float _1744 = -_776;
    float _1746 = _1744 + _1728;
    float _1748 = 1.0 / _1738;
    float _1750 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1740);
    float _1752 = fma(_1736, _1736, _1742);
    float _1754 = -_1426;
    float _1756 = _1754 + _1726;
    float _1758 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1750);
    float _1760 = fma(_1746, _1746, _1752);
    float _1762 = -_1450;
    float _1764 = _1762 + _1728;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1768 = sqrt(_1760);
    float _1770 = _1766 + _1738;
    float _1772 = _1770 * _1748;
    float _1774 = _1772 * 0.5;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1778 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1776);
    float _1780 = 1.0 / _1778;
    bool _1782 = _1768 > 0.0;
    bool _1784 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.5);
    bool _1792 = _1788 || _1790;
    bool _1794 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan(0.5);
    bool _1802 = _1798 || _1800;
    float _1804 = -_1424;
    float _1806 = _1804 + _1724;
    float _1808 = _1728;
    float _1810 = _1724;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1814 = _1738;
    float _1816 = _1778;
    float _1818 = _1732;
    float _1820 = _1806;
    if (!_1782)
    {
        _1666 = _1756;
    }
    float _1822 = _1666;
    float _1824 = _1822;
    float _1826 = _1822;
    if (!_1782)
    {
        _1808 = _1806;
    }
    float _1828 = _1808;
    float _1830 = _1828;
    if (!_1782)
    {
        _1668 = _1764;
    }
    float _1832 = _1668;
    bool _1834 = !_1782;
    float _1836 = _1832;
    if (!_1834)
    {
        float _1838 = _320 * _320;
        float _1840 = rsqrt(_1760);
        float _1842 = fma(_324, _324, _1838);
        float _1844 = fma(_330, _330, _1842);
        float _1846 = sqrt(_1844);
        float _1848 = _1736 * _1840;
        float _1850 = _1732 * _1840;
        float _1852 = _1746 * _1840;
        bool _1854 = _1846 > 0.0;
        float _1856 = _1840;
        float _1858 = _1846;
        _1810 = _1844;
        _1812 = _1848;
        if (!_1854)
        {
            _1824 = _1756;
        }
        float _1860 = _1824;
        _1826 = _1860;
        if (!_1854)
        {
            _1856 = _1806;
        }
        float _1862 = _1856;
        _1830 = _1862;
        if (!_1854)
        {
            _1858 = _1764;
        }
        float _1864 = _1858;
        bool _1866 = !_1854;
        _1836 = _1864;
        if (!_1866)
        {
            float _1868 = rsqrt(_1844);
            float _1870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1872 = _320 * _1868;
            float _1874 = _324 * _1868;
            float _1876 = _330 * _1868;
            float _1878 = _1850 * _1872;
            float _1880 = fma(_1848, _1874, _1878);
            float _1882 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1884 = fma(_1852, _1876, _1880);
            float _1886 = _1884 * _1882;
            float _1888 = fma(_324, _1886, _1756);
            float _1890 = fma(_320, _1886, _1806);
            float _1892 = fma(_330, _1886, _1764);
            _1826 = _1888;
            _1830 = _1890;
            _1836 = _1892;
        }
    }
    float _1894 = _1826;
    float _1896 = _1830;
    float _1898 = _1836;
    float _1900 = _1810;
    float _1902 = _1812;
    float _1904 = _1900;
    float _1906 = _1902;
    if (_1792)
    {
        _1814 = 1.0;
    }
    float _1908 = _1814;
    float _1910 = _1908;
    if (_1802)
    {
        _338 = _1894;
    }
    float _1912 = _338;
    float _1914 = _1912;
    if (_1802)
    {
        _340 = _1896;
    }
    float _1916 = _340;
    float _1918 = _1916;
    if (_1802)
    {
        _342 = _1898;
    }
    float _1920 = _342;
    float _1922 = _1920;
    if (!_1802)
    {
        float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1926 = _1614 + _1924;
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1930 = _1650 + _1928;
        float _1932 = -_1650;
        float _1934 = _1932 + _1894;
        float _1936 = -_1614;
        float _1938 = _1936 + _1896;
        float _1940 = _1926 * _1926;
        float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1944 = _1632 + _1942;
        float _1946 = -_1632;
        float _1948 = _1946 + _1898;
        float _1950 = fma(_1930, _1930, _1940);
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1954 = fma(_1944, _1944, _1950);
        float _1956 = sqrt(_1954);
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1960 = _1956 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1962 = isnan(_1956);
        bool _1964 = _1960 || _1962;
        bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1968 = _1964 || _1966;
        float _1970 = precise::min(_1956, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1972 = _1970 * _1952;
        float _1974 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1976 = _1974 * _1972;
        float _1978 = _1778;
        float _1980 = _1974;
        if (_1968)
        {
            float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1978 = _1982;
        }
        float _1984 = _1978;
        if (_1968)
        {
            float _1986 = precise::max(_1956, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1904 = _1986;
        }
        float _1988 = _1904;
        float _1990 = fma(_1934, _1976, _1650);
        float _1992 = fma(_1938, _1976, _1614);
        float _1994 = fma(_1948, _1976, _1632);
        float _1996 = _1988;
        float _1998 = _1992;
        float _2000 = _1990;
        _1816 = _1984;
        if (_1968)
        {
            float _2002 = _1988 * _1984;
            _1996 = _2002;
        }
        float _2004 = _1996;
        float _2006 = _2004;
        if (_1968)
        {
            float _2008 = _1974 * _2004;
            _2006 = _2008;
        }
        float _2010 = _2006;
        if (!_1968)
        {
            _1980 = _1992;
        }
        float _2012 = _1980;
        float _2014 = _2012;
        if (!_1968)
        {
            _1998 = _1994;
        }
        float _2016 = _1998;
        _1922 = _2016;
        if (_1968)
        {
            float _2018 = fma(_1934, _2010, _1650);
            _2000 = _2018;
        }
        float _2020 = _2000;
        _1914 = _2020;
        if (_1968)
        {
            float _2022 = fma(_1938, _2010, _1614);
            _2014 = _2022;
        }
        float _2024 = _2014;
        _1918 = _2024;
        if (_1968)
        {
            float _2026 = fma(_1948, _2010, _1632);
            _1922 = _2026;
        }
    }
    float _2028 = _1918;
    float _2030 = _1914;
    float _2032 = _1922;
    float _2034 = _1816;
    float _2036 = _2034;
    if (_1792)
    {
        _1818 = 1.0;
    }
    float _2038 = _1818;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2042 = _1780 * _2040;
    float _2044 = _2038;
    if (!_1792)
    {
        float _2046 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2050 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2048;
        float _2052 = _2046 * 0.15915493667125701904296875;
        float _2054 = 1.0 / _2050;
        float _2056 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2058 = _2052 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = _2056 * 0.15915493667125701904296875;
        float _2064 = _2052 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        float _2068 = 1.0 / _2060;
        float _2070 = _2062 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        float _2074 = _2066 * _2068;
        float _2076 = _2062 * 6.283185482025146484375;
        float _2078 = sin(_2076);
        float _2080 = _2072 * _2074;
        float _2082 = 1.0 / _2080;
        float _2084 = _2078 * _2082;
        float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2088 = fma(_2042, _2084, _2086);
        float _2090 = _2088 * _2054;
        float _2092 = precise::clamp(_2090, 0.0, 1.0);
        _1820 = _2074;
        _1906 = _2052;
        _2036 = _2062;
        _1910 = _2092;
    }
    float _2094 = _1820;
    float _2096 = _1906;
    float _2098 = _2036;
    float _2100 = _1910;
    float _2102 = _2096;
    float _2104 = _2094;
    if (!_1792)
    {
        float _2106 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2108 = _2106 * 0.15915493667125701904296875;
        float _2110 = _2108 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        float _2114 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2116 = _2114 * 0.15915493667125701904296875;
        float _2118 = _2108 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = 1.0 / _2112;
        float _2124 = _2116 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = _2116 * 6.283185482025146484375;
        float _2132 = sin(_2130);
        float _2134 = _2126 * _2128;
        float _2136 = 1.0 / _2134;
        float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2140 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2138;
        float _2142 = 1.0 / _2140;
        float _2144 = _2132 * _2136;
        float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2148 = fma(_2042, _2144, _2146);
        float _2150 = _2148 * _2142;
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = -_2152;
        float _2156 = _2154 + 1.0;
        _2102 = _2134;
        _2104 = _2122;
        _2044 = _2156;
    }
    float _2158 = _2102;
    float _2160 = _2104;
    float _2162 = _2044;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2166 = _2028 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2170 = _2030 + _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2174 = _2032 + _2172;
    float _2176 = _2166 * _2166;
    float _2178 = fma(_2170, _2170, _2176);
    float _2180 = fma(_2174, _2174, _2178);
    float _2182 = rsqrt(_2180);
    float _2184 = sqrt(_2180);
    float _2186 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2188 = _2170 * _2186;
    float _2190 = _2174 * _2186;
    float _2192 = _2188 * _2188;
    float _2194 = _2190 * _2190;
    float _2196 = _2192 + _2194;
    float _2198 = sqrt(_2196);
    bool _2200 = _2198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2204 = _2198 + _2202;
    float _2206 = _2174;
    float _2208 = _2176;
    float _2210 = _2204;
    float _2212 = _2158;
    float _2214 = _2186;
    float _2216 = _2160;
    if (_2200)
    {
        float _2218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2206 = _2218;
    }
    float _2220 = _2206;
    if (_2200)
    {
        float _2222 = rsqrt(_2196);
        _2208 = _2222;
    }
    float _2224 = _2208;
    float _2226 = _2224;
    if (_2200)
    {
        float _2228 = _2204 * _2220;
        _2210 = _2228;
    }
    float _2230 = _2210;
    float _2232 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2200)
    {
        float _2234 = _2230 * 0.15915493667125701904296875;
        _2212 = _2234;
    }
    float _2236 = _2212;
    float _2238 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2232);
    float _2240 = _2220;
    float _2242 = _2236;
    if (_2200)
    {
        float _2244 = _2236 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2252 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2238);
    float _2254 = precise::max(0.0, _2250);
    float _2256 = _2098;
    if (_2200)
    {
        float _2258 = _2236 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        _2256 = _2260;
    }
    float _2262 = _2256;
    float _2264 = -_2186;
    float _2266 = -_2254;
    float _2268 = fma(_2166, _2264, _2266);
    if (_2200)
    {
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2270;
    }
    float _2272 = _2214;
    float _2274 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2276 = _2248;
    float _2278 = _2272;
    if (_2200)
    {
        float _2280 = fma(_2248, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2216 = _2280;
    }
    float _2282 = _2216;
    float _2284 = _2282;
    if (!_2200)
    {
        _2276 = _2188;
    }
    float _2286 = _2276;
    float _2288 = floor(_2274);
    float _2290 = _2286;
    float _2292 = _2262;
    if (_2200)
    {
        float _2294 = _2262 + (-1.0);
        _2278 = _2294;
    }
    float _2296 = _2278;
    float _2298 = _2296;
    if (_2200)
    {
        float _2300 = _2224 * _2282;
        _1670 = _2300;
    }
    float _2302 = _1670;
    if (!_2200)
    {
        _2226 = _2268;
    }
    float _2304 = _2226;
    float _2306 = _2304;
    if (_2200)
    {
        float _2308 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2308;
    }
    float _2310 = _2242;
    if (_2200)
    {
        float _2312 = _2188 * _2302;
        _2290 = _2312;
    }
    float _2314 = _2290;
    if (!_2200)
    {
        _2298 = _2190;
    }
    float _2316 = _2298;
    float _2318 = _2316;
    if (_2200)
    {
        float _2320 = _2190 * _2302;
        _2318 = _2320;
    }
    float _2322 = _2318;
    if (!_2200)
    {
        _2284 = _2192;
    }
    float _2324 = _2284;
    float _2326 = _2324;
    if (_2200)
    {
        float _2328 = fma(_2268, _2262, _2310);
        _2306 = _2328;
    }
    float _2330 = _2306;
    if (_2200)
    {
        float _2332 = _2314 * _2314;
        _2326 = _2332;
    }
    float _2334 = _2326;
    if (!_2200)
    {
        _2292 = _2194;
    }
    float _2336 = _2292;
    float _2338 = _2336;
    if (_2200)
    {
        float _2340 = _2322 * _2322;
        _2338 = _2340;
    }
    float _2342 = _2338;
    float _2344 = fma(_2330, _2330, _2334);
    float _2346 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2348 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2350 = fma(_1632, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2352 = _2344 + _2342;
    float _2354 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2356 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2346);
    float _2358 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2348);
    float _2360 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2354);
    float _2362 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2356);
    float _2364 = rsqrt(_2352);
    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2368 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2366);
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2358);
    float _2374 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2360);
    float _2376 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2378 = -_2370;
    float _2380 = _2378 + 1.0;
    float _2382 = _2372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2384 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2388 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2390 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2392 = abs(_2380);
    float _2394 = log2(_2392);
    float _2396 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2386);
    float _2398 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = -_2390;
    float _2402 = fma(_2400, _2388, 1.0);
    float _2404 = -_2288;
    float _2406 = _2274 + _2404;
    float _2408 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2410 = _2364 * _2314;
    float _2412 = _2364 * _2322;
    float _2414 = floor(_2350);
    float _2416 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2408);
    float _2418 = _2364 * _2330;
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2422 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2424 = _2418 + 1.0;
    float _2426 = -_2420;
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2426);
    float _2430 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = log2(_2402);
    float _2434 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2422);
    float _2436 = -_2412;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2428);
    float _2440 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2442 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2434);
    float _2444 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2440);
    float _2446 = exp2(_2430);
    float _2448 = fma(_2438, -0.5, 0.5);
    float _2450 = fma(_2438, 0.5, 0.5);
    float _2452 = -_2414;
    float _2454 = _2350 + _2452;
    float _2456 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2444);
    float _2458 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2442);
    float _2460 = fma(_2450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2462 = 1.0 / _2416;
    float _2464 = _2432 * 0.693147182464599609375;
    float _2466 = fma(_2450, _2460, -0.212114393711090087890625);
    float _2468 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = fma(_2450, _2466, 1.570728778839111328125);
    float _2472 = sqrt(_2448);
    float _2474 = -_2418;
    float _2476 = fma(_2446, _2424, _2474);
    float _2478 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2456);
    float _2480 = fma(_2476, 0.5, 0.5);
    float _2482 = _2458 * _2462;
    float _2484 = _2478 * _2462;
    float _2486 = fma(_2482, 0.5, 0.5);
    float _2488 = fma(_2484, -0.5, 0.5);
    float _2490 = _2472 * 0.636619746685028076171875;
    float2 _7746 = float2(_2406, _2454);
    float _2492 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7746, float2(0.0), isnan(_7746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7746, float2(0.0), isnan(_7746)), level(0.0)).x;
    float3 _7757 = float3(_2486, _2488, _2468);
    float _2494 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7757, float3(0.0), isnan(_7757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7757, float3(0.0), isnan(_7757)), level(0.0)).x;
    float _2496 = -_2470;
    float _2498 = fma(_2490, _2496, 1.0);
    float3 _7773 = float3(_2486, _2488, _2468);
    float4 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7773, float3(0.0), isnan(_7773)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7773, float3(0.0), isnan(_7773)), level(0.0)).xyzw;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = _2501.w;
    float2 _7789 = float2(_2498, _2480);
    float3 _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7789, float2(0.0), isnan(_7789)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7789, float2(0.0), isnan(_7789)), level(0.0)).xyz;
    float _2515 = _2513.x;
    float _2517 = _2513.y;
    float _2519 = _2513.z;
    float _2521 = float(uint(_1244));
    float _2523 = trunc(_1252);
    int _2525 = int(_2523);
    int _2527 = ~_1244;
    int _2529 = _2527 + 1;
    out.m_65.x = _1650;
    out.m_65.y = _1614;
    out.m_65.z = _1632;
    bool _2531 = _1244 == 0;
    float _2533 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2535 = abs(_1156);
    out.m_67.w = _1398;
    bool _2537 = _734 > 0.5;
    float _2539 = 1.0 / _2521;
    int _2541 = ~_1244;
    int _2543 = _2541 + 1;
    float _2545 = in.m_69.x;
    float _2547 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2549 = _1568 * _1484;
    bool _2551 = _2042 <= 8000.0;
    bool _2553 = isnan(_2042);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(8000.0);
    bool _2559 = _2555 || _2557;
    float _2561 = float(_2559);
    float _2563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2565 = float(uint(_2525));
    float _2567 = fma(_1522, _1602, _2549);
    float _2569 = float(_116);
    float _2571 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2547);
    float _2573 = float(_2525);
    out.m_71.x = _1550;
    int _2575 = as_type<int>(_2539) + (-2);
    float _2577 = 1.0 / _2569;
    bool _2579 = _2573 >= _1278;
    bool _2581 = isnan(_2573);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan(_1278);
    bool _2587 = _2583 || _2585;
    float _2589 = float(_2587);
    float _2591 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2571);
    out.m_73.x = _2030;
    out.m_73.y = _2028;
    out.m_73.z = _2032;
    float _2593 = as_type<float>(_2575) * _2565;
    float _2595 = trunc(_2589);
    int _2597 = int(_2595);
    float _2599 = trunc(_2593);
    float _2601 = precise::max(_2599, 0.0);
    uint _2604 = uint(_2601);
    float _2606 = _1300 * _2577;
    bool _2608 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2610 = isnan(_724);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = trunc(_2606);
    int _2622 = int(_2620);
    int _2624 = _2543 * int(_2604);
    int _2626 = _2624 + _2525;
    float _2628 = exp2(_2533);
    float _2630 = float(uint(_2626));
    float _2632 = as_type<float>(_2575) * _2630;
    bool _2634 = !_740;
    float _2636 = _2634 ? 7.345489978790283203125 : 1.0;
    float _2638 = trunc(_2632);
    float _2640 = precise::max(_2638, 0.0);
    uint _2642 = uint(_2640);
    float _2644 = -_2628;
    float _2646 = _2644 + 1.0;
    float _2648 = _2636 * _172;
    float _2650 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = floor(_2648);
    int _2654 = int(_2604) + int(_2642);
    int _2656 = _2529 * _2654;
    int _2658 = _2656 + _2525;
    float _2660 = -_2652;
    float _2662 = _2648 + _2660;
    bool _2664 = uint(_2658) >= uint(_1244);
    float _2666 = _2662 * _1278;
    int _2668 = _1244 + (-1);
    bool _2670 = !_2664;
    int _2672 = _2670 ? 0 : (-1);
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2676 = _2674 != 0;
    float _2678 = trunc(_2666);
    int _2680 = int(_2678);
    int _2682 = ~_2654;
    int _2684 = _2682 + _2672;
    int _2686 = _2684 + 1;
    bool _2688 = !_2676;
    int _2690 = _2688 ? 0 : 1;
    int _2692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2694 = _2692 != 0;
    int _2696 = _1244 * _2686;
    int _2698 = _2696 + _2525;
    int _2700 = ~_2597;
    int _2702 = _2700 + 1;
    int _2704 = _2702 + 1;
    int _2706 = abs(_2690);
    bool _2708 = !_2531;
    int _2710 = _2708 ? _2698 : (-1);
    bool _2712 = !_2694;
    int _2714 = _2712 ? 0 : 1;
    int _2716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2718 = _2716 != 0;
    int _2720 = _2710 * _2704;
    int _2722 = abs(_2714);
    int _2724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2726 = _2724 != 0;
    int _2728 = _2597 * _2668;
    int _2730 = _2728 + _2720;
    int _2732 = abs(_1162);
    int _2734 = _2730 * _2535;
    int _2736 = abs(_1168);
    int _2738 = _2680 * _2706;
    int _2740 = _2738 + _2525;
    float _2742 = in.m_75.w;
    int _2744 = ~_1244;
    int _2746 = _2744 + 1;
    int _2748 = _2622 * _2732;
    int _2750 = _2748 + _2734;
    float _2752 = in.m_69.y;
    int _2754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2756 = _2754 != 0;
    int _2758 = _2740 * _2736;
    int _2760 = _2758 + _2750;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2764 = _2762 != 0;
    int _2766 = _2680 * _2722;
    int _2768 = _2766 + _2760;
    int _2770 = ~_1244;
    int _2772 = _2770 + 1;
    float _2774 = float(uint(_2768));
    float _2776 = as_type<float>(_2575) * _2774;
    out.m_77.w = _2742;
    float _2778 = trunc(_2776);
    float _2780 = precise::max(_2778, 0.0);
    uint _2782 = uint(_2780);
    int _2784 = _2772 * int(_2782);
    int _2786 = _2784 + _2768;
    float _2788 = float(uint(_2786));
    float _2790 = as_type<float>(_2575) * _2788;
    float _2792 = trunc(_2790);
    float _2794 = precise::max(_2792, 0.0);
    uint _2796 = uint(_2794);
    int _2798 = int(_2782) + int(_2796);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2804 = 1.0 / _2802;
    int _2806 = _2746 * _2798;
    int _2808 = _2806 + _2768;
    float _2810 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2814 = uint(_2808) >= uint(_1244);
    float _2816 = -_2752;
    float _2818 = _2816 + 1.0;
    float _2820 = 1.0 / _2812;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2824 = _2822 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2826 = !_2814;
    int _2828 = _2826 ? 0 : (-1);
    int _2830 = _2537 ? as_type<int>(_2818) : as_type<int>(_2752);
    int _2832 = ~_2798;
    int _2834 = _2832 + _2828;
    int _2836 = _2834 + 1;
    float _2838 = _2726 ? as_type<float>(_2830) : _2752;
    int _2840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2842 = _2840 != 0;
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2844;
    bool _2848 = _742 > 0.5;
    int _2850 = _1244 * _2836;
    int _2852 = _2850 + _2768;
    float _2854 = float(uint(_2740));
    float _2856 = _2846 * _2804;
    float _2858 = _2752;
    bool _2860 = _2848;
    float _2862 = as_type<float>(_2575);
    float _2864 = _2458;
    if (_2718)
    {
        float _2866 = _2848 ? _2818 : _2752;
        _2858 = _2866;
    }
    float _2868 = _2858;
    float _2870 = _2824 * _2820;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2874 = _724 + _2872;
    float _2876 = as_type<float>(_2575) * _2854;
    bool _2878 = !_2531;
    int _2880 = _2878 ? _2852 : (-1);
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2884 = _724 + _2882;
    float _2886 = _2884;
    if (_2756)
    {
        bool _2888 = _172 > 0.5;
        _2860 = _2888;
    }
    bool _2890 = _2860;
    float _2892 = trunc(_2876);
    float _2894 = precise::max(_2892, 0.0);
    uint _2896 = uint(_2894);
    int _2898 = _2880 >> 31;
    float _2900 = fma(_2856, _2874, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2902 = _1496 != 0.0;
    bool _2904 = isnan(_1496);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan(0.0);
    bool _2910 = _2906 || _2908;
    float _2912 = in.m_79.x;
    float _2914 = in.m_79.y;
    float _2916 = in.m_79.z;
    int _2918 = _2898 & 3;
    float _2920 = fma(_2870, _2884, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2922 = ~_1244;
    int _2924 = _2922 + 1;
    int _2926 = _2880 + _2918;
    bool _2928 = _1494 == 0.0;
    bool _2930 = !_2910;
    bool _2932 = _2928 && _2930;
    float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2936 = _2926 >> 2;
    int _2938 = _2924 * int(_2896);
    int _2940 = _2938 + _2740;
    bool _2942 = _1498 == 0.0;
    bool _2944 = _2942 && _2932;
    int _2946 = _2936 << 4;
    int _2948 = _2946 + 368;
    bool _2950 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2952 = isnan(_724);
    bool _2954 = _2950 || _2952;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2958 = _2954 || _2956;
    float _2960 = float(_2958);
    bool _2962 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2964 = isnan(_724);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    float _2974 = float(uint(_2940));
    float _2976 = -_2960;
    float _2978 = _2976 + 1.0;
    uint _2980 = uint(int(uint(_2948) >> uint(2)));
    uint _2982 = uint(int(uint(int(_2980)) >> uint(2)));
    int _2984 = int(_2980) & 3;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[int(_2982)][_2984];
    int _2988 = int(_2980) + 1;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    int _2992 = _2988 & 3;
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[int(_2990)][_2992];
    if (!_2756)
    {
        _2886 = _2545;
    }
    float _2996 = _2886;
    float _2998 = _2912;
    float _3000 = _2914;
    float _3002 = _2916;
    float _3004 = _2996;
    if (!_2944)
    {
        float _3006 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2912);
        _2998 = _3006;
    }
    float _3008 = _2998;
    if (_2842)
    {
        float _3010 = -_2545;
        float _3012 = _3010 + 1.0;
        _1672 = as_type<int>(_3012);
    }
    int _3014 = _1672;
    float _3016 = _2972 * _2978;
    float _3018 = -_2972;
    float _3020 = _3018 + 1.0;
    float _3022 = as_type<float>(_2575) * _2974;
    if (!_2842)
    {
        _2862 = _2545;
    }
    float _3024 = _2862;
    float _3026 = _3024;
    if (!_2944)
    {
        float _3028 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2914);
        _3000 = _3028;
    }
    float _3030 = _3000;
    if (_2842)
    {
        float _3032 = _2537 ? as_type<float>(_3014) : _2545;
        _3026 = _3032;
    }
    float _3034 = _3026;
    if (!_2944)
    {
        float _3036 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2916);
        _3002 = _3036;
    }
    float _3038 = _3002;
    int _3040 = _2880 & 3;
    bool _3042 = _3040 != 0;
    float _3044 = _2618 * _3020;
    int _3046 = _2880 & 3;
    bool _3048 = _3046 != 0;
    float _3050 = trunc(_3022);
    float _3052 = precise::max(_3050, 0.0);
    uint _3054 = uint(_3052);
    int _3056 = _3042 ? 0 : 1;
    float _3058 = _2900 * _3044;
    bool _3060 = uint(_3046) > 1u;
    float _3062 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3064 = _2948 + 8;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    uint _3068 = uint(int(uint(int(_3066)) >> uint(2)));
    int _3070 = int(_3066) & 3;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[int(_3068)][_3070];
    int _3074 = int(_3066) + 1;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    int _3078 = _3074 & 3;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[int(_3076)][_3078];
    float _3082 = _2934 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3084 = -_2618;
    float _3086 = _3084 + 1.0;
    float _3088 = fma(_3062, _2868, -0.5);
    int _3090 = ~_1244;
    int _3092 = _3090 + 1;
    float _3094 = fma(_3082, _3034, -0.5);
    float _3096 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3058);
    float _3098 = -_1076;
    float _3100 = fma(_1202, _3088, _3098);
    float _3102 = fma(_1232, _3094, _1090);
    int _3104 = ~_3056;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    float _3110 = fma(_2920, _3016, _3096);
    int _3112 = _3108;
    if (!_3060)
    {
        int _3114 = ~_3056;
        int _3116 = _3114 + 1;
        _3112 = _3116;
    }
    int _3118 = _3112;
    float _3120 = abs(_2042);
    float _3122 = log2(_3120);
    int _3124 = int(_2896) + int(_3054);
    float _3126 = -_2492;
    float _3128 = _3126 + 1.0;
    bool _3130 = !_3048;
    int _3132 = _3130 ? 0 : 1;
    float _3134 = _2650 * _2494;
    int _3136 = abs(_3118);
    int _3138 = _3092 * _3124;
    int _3140 = _3138 + _2740;
    bool _3142 = uint(_3046) >= 2u;
    float _3144 = -_2650;
    float _3146 = _3144 + 1.0;
    int _3148 = abs(_3132);
    int _3150 = _3142 ? 0 : 1;
    bool _3152 = _3046 != 3;
    float _3154 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3156 = uint(_3140) >= uint(_1244);
    int _3158 = ~_3136;
    int _3160 = _3158 + 1;
    int _3162 = _3160 + 1;
    float _3164 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3166 = int(_3164);
    int _3168 = ~_3148;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    bool _3174 = !_3156;
    int _3176 = _3174 ? 0 : (-1);
    int _3178 = _3162 * as_type<int>(_2994);
    bool _3180 = _3046 != 3;
    int _3182 = ~_3150;
    int _3184 = _3182 + 1;
    int _3186 = _3184 + 1;
    int _3188 = _3172 * as_type<int>(_2986);
    int _3190 = _3188 + _3178;
    bool _3192 = !_3180;
    int _3194 = _3192 ? 0 : (-1);
    float _3196 = exp2(_3154);
    int _3198 = _3186;
    if (_3152)
    {
        int _3200 = ~_3150;
        int _3202 = _3200 + 1;
        _3198 = _3202;
    }
    int _3204 = _3198;
    bool _3206 = !_2764;
    int _3208 = _3206 ? 0 : 1;
    int _3210 = abs(_3194);
    int _3212 = abs(_3204);
    int _3214 = abs(_3208);
    float _3216 = float(uint(_3166));
    int _3218 = ~_3212;
    int _3220 = _3218 + 1;
    int _3222 = _3220 + 1;
    int _3224 = ~_3124;
    int _3226 = _3224 + _3176;
    int _3228 = _3226 + 1;
    int _3230 = ~_3210;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    int _3236 = _3222 * as_type<int>(_3072);
    int _3238 = _3236 + _3190;
    float _3240 = 1.0 / _3216;
    int _3242 = abs(_3166);
    int _3244 = _1244 * _3228;
    int _3246 = _3244 + _2740;
    int _3248 = ~_3214;
    int _3250 = _3248 + 1;
    int _3252 = _3250 + 1;
    int _3254 = _3234 * as_type<int>(_3080);
    int _3256 = _3254 + _3238;
    float _3258 = float(uint(_3242));
    float _3260 = fma(_2960, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3110);
    bool _3262 = !_2531;
    int _3264 = _3262 ? _3246 : (-1);
    int _3266 = _3256 * _3252;
    float _3268 = 1.0 / _3258;
    float _3270 = _3260 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3272 = _3264 * _3214;
    int _3274 = _3272 + _3266;
    float _3276 = _3100 + 0.5;
    float _3278 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3280 = precise::clamp(_3278, 0.0, 1.0);
    int _3282 = as_type<int>(_3240) + (-2);
    int _3284 = _3214;
    if (_2756)
    {
        float _3286 = -_2545;
        float _3288 = _3286 + 1.0;
        _3284 = as_type<int>(_3288);
    }
    int _3290 = _3284;
    int _3292 = abs(_3274);
    float _3294 = float(uint(_3274));
    float _3296 = _3102 + 0.5;
    float _3298 = fma(_3280, -2.0, 3.0);
    int _3300 = as_type<int>(_3268) + (-2);
    float _3302 = _3280 * _3280;
    float _3304 = float(uint(_3292));
    float _3306 = as_type<float>(_3282) * _3294;
    if (_2756)
    {
        float _3308 = _2890 ? as_type<float>(_3290) : _2545;
        _3004 = _3308;
    }
    float _3310 = _3004;
    float _3312 = _3302 * _3298;
    int _3314 = ~_3242;
    int _3316 = _3314 + 1;
    float _3318 = as_type<float>(_3300) * _3304;
    int _3320 = ~_3166;
    int _3322 = _3320 + 1;
    float _3324 = trunc(_3306);
    float _3326 = precise::max(_3324, 0.0);
    uint _3328 = uint(_3326);
    float _3330 = -_3312;
    float _3332 = _3330 + 1.0;
    out.m_81.x = _3296;
    out.m_81.y = _3276;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3312);
    float _3336 = trunc(_3318);
    float _3338 = precise::max(_3336, 0.0);
    uint _3340 = uint(_3338);
    float _3342 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3344 = _1520 * _1484;
    float _3346 = _2561 * _3334;
    float _3348 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3350 = _3342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3352 = _3322 * int(_3328);
    int _3354 = _3352 + _3274;
    float _3356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3358 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3360 = _1520 * _1486;
    float _3362 = _1520 * _1482;
    float _3364 = float(uint(_3354));
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3368 = -_1528;
    float _3370 = fma(_3368, _1602, _3344);
    int _3372 = _3316 * int(_3340);
    int _3374 = _3372 + _3292;
    int _3376 = ~_3242;
    int _3378 = _3376 + 1;
    float _3380 = as_type<float>(_3282) * _3364;
    out.m_83.x = _3350;
    out.m_83.y = _3358;
    out.m_83.z = _3366;
    out.m_83.w = _3270;
    float _3382 = _1560 * _1486;
    float _3384 = float(uint(_3374));
    float _3386 = -_1528;
    float _3388 = fma(_3386, _1608, _3360);
    float _3390 = -_1528;
    float _3392 = fma(_3390, _1598, _3362);
    float _3394 = trunc(_3380);
    float _3396 = precise::max(_3394, 0.0);
    uint _3398 = uint(_3396);
    float _3400 = fma(_1518, _1608, _3382);
    float _3402 = as_type<float>(_3300) * _3384;
    float _3404 = _1560 * _1484;
    float _3406 = _1560 * _1482;
    float _3408 = _1568 * _1486;
    float _3410 = _1568 * _1482;
    float _3412 = fma(_1518, _1602, _3404);
    float _3414 = trunc(_3402);
    float _3416 = precise::max(_3414, 0.0);
    uint _3418 = uint(_3416);
    float _3420 = _1516 * _850;
    float _3422 = _1580 * _850;
    float _3424 = _1580 * _910;
    float _3426 = _1588 * _850;
    float _3428 = _3420 + _3370;
    int _3430 = ~_3166;
    int _3432 = _3430 + 1;
    float _3434 = _3422 + _3412;
    int _3436 = int(_3328) + int(_3398);
    float _3438 = _1516 * _910;
    float _3440 = _1516 * _852;
    float _3442 = _3428 * _3030;
    float _3444 = _1580 * _852;
    int _3446 = _3432 * _3436;
    int _3448 = _3446 + _3274;
    float _3450 = _3424 + _3400;
    int _3452 = _3274 ^ _3166;
    float _3454 = _3438 + _3388;
    int _3456 = int(_3340) + int(_3418);
    float _3458 = _3440 + _3392;
    bool _3460 = uint(_3448) >= uint(_3166);
    float _3462 = _3454 * _3030;
    uint _3464 = uint(int(uint(_3452) >> uint(31)));
    int _3466 = _3378 * _3456;
    int _3468 = _3466 + _3292;
    float _3470 = _3426 + _2567;
    bool _3472 = !_3460;
    int _3474 = _3472 ? 0 : (-1);
    float _3476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3478 = ~int(_3464);
    int _3480 = _3478 + 1;
    float _3482 = _3458 * _3030;
    bool _3484 = uint(_3468) >= uint(_3242);
    float _3486 = fma(_1518, _1598, _3406);
    int _3488 = ~_3436;
    int _3490 = _3488 + _3474;
    int _3492 = _3490 + 1;
    float _3494 = fma(_1522, _1608, _3408);
    bool _3496 = !_3484;
    int _3498 = _3496 ? 0 : (-1);
    float _3500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3502 = _3166 == 0;
    int _3504 = _3166 * _3492;
    int _3506 = _3504 + _3274;
    int _3508 = ~_3498;
    int _3510 = _3456 + _3508;
    int _3512 = _3510 + 1;
    float _3514 = _1588 * _852;
    bool _3516 = _3166 == 0;
    float _3518 = fma(_1522, _1598, _3410);
    int _3520 = _3512 ^ _3480;
    float _3522 = _3476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3524 = !_3502;
    int _3526 = _3524 ? _3506 : (-1);
    float _3528 = _1588 * _910;
    int _3530 = ~_3480;
    int _3532 = _3530 + _3520;
    int _3534 = _3532 + 1;
    float _3536 = _3444 + _3486;
    float _3538 = float(_3526);
    float _3540 = _3514 + _3518;
    bool _3542 = !_3516;
    int _3544 = _3542 ? _3534 : (-1);
    float _3546 = _3500 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3548 = _3528 + _3494;
    float _3550 = fma(_3434, _3008, _3442);
    float _3552 = float(_3544);
    float _3554 = fma(_3450, _3008, _3462);
    float _3556 = fma(_3536, _3008, _3482);
    float _3558 = fma(_3546, _2838, -0.5);
    float _3560 = fma(_3522, _3310, -0.5);
    float _3562 = -_804;
    float _3564 = fma(_3546, _3552, _3562);
    float _3566 = fma(_3522, _3538, _1150);
    float _3568 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3570 = fma(_3470, _3038, _3550);
    float _3572 = fma(_3548, _3038, _3554);
    float _3574 = fma(_3540, _3038, _3556);
    float _3576 = fma(_1256, _3558, _3564);
    float _3578 = in.m_85.x;
    float _3580 = _3128 * _3568;
    float _3582 = precise::clamp(_3580, 0.0, 1.0);
    float _3584 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2591);
    float _3586 = fma(_1228, _3560, _3566);
    float _3588 = _2416 * 0.5;
    float _3590 = -_3582;
    float _3592 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3594 = _3584 + _2416;
    float _3596 = _2458 + _2416;
    float _3598 = _2509 * _3134;
    float _3600 = _2519 * _3134;
    float _3602 = fma(_2478, -0.5, _3588);
    float _3604 = _3594 * 0.5;
    float _3606 = _3596 * 0.5;
    float _3608 = fma(_2515, _3598, _2503);
    float _3610 = fma(_2517, _3598, _2505);
    float _3612 = _2509 * _3146;
    float _3614 = fma(_2509, _3600, _2507);
    out.m_87.x = _3606;
    out.m_87.y = _3602;
    out.m_87.z = _3604;
    out.m_87.w = _2416;
    bool _3616 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3618 = isnan(_2184);
    bool _3620 = _3616 || _3618;
    bool _3622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3624 = _3620 || _3622;
    float _3626 = _3586 + 0.5;
    float _3628 = _3576 + 0.5;
    out.m_89.x = _3608;
    out.m_89.y = _3610;
    out.m_89.z = _3614;
    out.m_89.w = _3612;
    float _3630 = _3592 * _3578;
    out.m_91.x = _3570;
    out.m_91.y = _3572;
    out.m_91.z = _3574;
    float _3632 = _3630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3634 = _2100 * _2162;
    out.gl_Position.x = _2458;
    out.gl_Position.y = _2478;
    out.gl_Position.z = _3584;
    out.gl_Position.w = _2416;
    float _3636 = _3578;
    float _3638 = _3628;
    float _3640 = _3626;
    float _3642 = _3632;
    float _3644 = _3634;
    if (!_3624)
    {
        _3636 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3646 = _3636;
    out.m_93.x = _3626;
    out.m_93.y = _3628;
    out.m_95.x = _3632;
    float _3648 = _3634 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3650 = _3646;
    float _3652 = _3646;
    if (!_3624)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3654 = _2864;
    float _3656 = _3654;
    float _3658 = _3654;
    if (!_3624)
    {
        _3638 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3660 = _3638;
    float _3662 = _3660;
    float _3664 = _3660;
    if (!_3624)
    {
        _3640 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3666 = _3640;
    float _3668 = _3666;
    float _3670 = _3666;
    if (!_3624)
    {
        _3642 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3672 = _3642;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3624)
    {
        _3644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3678 = _3644;
    bool _3680 = !_3624;
    float _3682 = _3678;
    float _3684 = _3678;
    if (!_3680)
    {
        bool _3686 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3688 = isnan(_2184);
        bool _3690 = _3686 || _3688;
        bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3694 = _3690 || _3692;
        if (!_3694)
        {
            float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3698 = _2184 + _3696;
            float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3702 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3700;
            float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3706 = _3704 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3708 = 1.0 / _3702;
            float _3710 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3712 = _3710 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3714 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3716 = _3714 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3720 = _3718 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3726 = _3698 * _3708;
            float _3728 = precise::clamp(_3726, 0.0, 1.0);
            float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3734 = fma(_3728, _3706, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3736 = fma(_3728, _3732, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3738 = fma(_3728, _3712, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3740 = fma(_3728, _3716, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3742 = fma(_3728, _3720, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3744 = fma(_3728, _3724, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3658 = _3738;
            _3676 = _3742;
            _3652 = _3734;
            _3670 = _3740;
            _3664 = _3736;
            _3684 = _3744;
            _3746 = true;
        }
        else
        {
            bool _3748 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3750 = isnan(_2184);
            bool _3752 = _3748 || _3750;
            bool _3754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3756 = _3752 || _3754;
            if (!_3756)
            {
                _3650 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3758 = _3650;
            _3652 = _3758;
            if (!_3756)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3760 = _3656;
            _3658 = _3760;
            if (!_3756)
            {
                _3662 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3762 = _3662;
            _3664 = _3762;
            if (!_3756)
            {
                _3668 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3764 = _3668;
            _3670 = _3764;
            if (!_3756)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3766 = _3674;
            _3676 = _3766;
            if (!_3756)
            {
                _3682 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3768 = _3682;
            bool _3770 = !_3756;
            _3684 = _3768;
            if (!_3770)
            {
                bool _3772 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3774 = isnan(_2184);
                bool _3776 = _3772 || _3774;
                bool _3778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3780 = _3776 || _3778;
                if (!_3780)
                {
                    float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3784 = _2184 + _3782;
                    float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3788 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3786;
                    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3792 = _3790 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3794 = 1.0 / _3788;
                    float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3812 = _3784 * _3794;
                    float _3814 = precise::clamp(_3812, 0.0, 1.0);
                    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3820 = fma(_3814, _3792, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3822 = fma(_3814, _3818, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3824 = fma(_3814, _3798, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3826 = fma(_3814, _3802, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3828 = fma(_3814, _3806, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3830 = fma(_3814, _3810, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3658 = _3824;
                    _3676 = _3828;
                    _3652 = _3820;
                    _3670 = _3826;
                    _3664 = _3822;
                    _3684 = _3830;
                    _3746 = true;
                }
                else
                {
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3652 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3670 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3664 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3684 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3746 = false;
    float _3832 = _3658;
    float _3834 = _3676;
    float _3836 = _3652;
    float _3838 = _3670;
    float _3840 = _3664;
    float _3842 = _3684;
    float _3844 = fma(_3572, -0.5, 0.5);
    float _3846 = precise::clamp(_3844, 0.0, 1.0);
    float _3848 = -_3832;
    float _3850 = _3848 + _3834;
    float _3852 = _3648 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3854 = -_3836;
    float _3856 = _3854 + _3838;
    float _3858 = fma(_3846, _3850, _3832);
    out.m_97.x = 0.0;
    float _3860 = -_3840;
    float _3862 = _3860 + _3842;
    float _3864 = fma(_3846, _3856, _3836);
    float _3866 = _3858 * 0.586610972881317138671875;
    out.m_49.x = _3852;
    bool _3868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3870 = fma(_3846, _3862, _3840);
    float _3872 = fma(_3864, 0.298911988735198974609375, _3866);
    bool _3874 = _2100 > 0.0;
    bool _3876 = isnan(_2100);
    bool _3878 = _3874 || _3876;
    bool _3880 = isnan(0.0);
    bool _3882 = _3878 || _3880;
    float _3884 = fma(_3870, 0.114477999508380889892578125, _3872);
    bool _3886 = _2162 <= 0.0;
    bool _3888 = !_3882;
    bool _3890 = _3886 || _3888;
    float _3892 = -_3884;
    float _3894 = _3864 + _3892;
    float _3896 = -_3884;
    float _3898 = _3858 + _3896;
    float _3900 = -_3884;
    float _3902 = _3870 + _3900;
    float _3904 = fma(_3894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    float _3906 = fma(_3898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    float _3908 = fma(_3902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    bool _3910 = !_3868;
    if (!_3910)
    {
        float _3912 = -_2028;
        float _3914 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3916 = -_2030;
        float _3918 = _3916 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3920 = -_2032;
        float _3922 = _3920 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3924 = _3914 * _3914;
        float _3926 = fma(_3918, _3918, _3924);
        float _3928 = fma(_3922, _3922, _3926);
        float _3930 = sqrt(_3928);
        float _3932 = rsqrt(_3928);
        float _3934 = -_3930;
        float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3938 = _3936 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3940 = precise::clamp(_3938, 0.0, 1.0);
        float _3942 = _3918 * _3932;
        float _3944 = _3914 * _3932;
        float _3946 = abs(_3940);
        float _3948 = log2(_3946);
        float _3950 = _3922 * _3932;
        float _3952 = _3942 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3954 = _3572 * _3944;
        float _3956 = -_3944;
        float _3958 = -_3952;
        float _3960 = fma(_3956, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3958);
        float _3962 = fma(_3570, _3942, _3954);
        float _3964 = -_3950;
        float _3966 = fma(_3964, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3960);
        float _3968 = fma(_3574, _3950, _3962);
        float _3970 = precise::clamp(_3968, 0.0, 1.0);
        float _3972 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3974 = _3966 + _3972;
        float _3976 = _3948 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3978 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3980 = precise::clamp(_3978, 0.0, 1.0);
        float _3982 = exp2(_3976);
        float _3984 = _3982 * _3980;
        float _3986 = _3970 * _3984;
        float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3990 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3992 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3988;
        out.m_97.y = _3990;
        out.m_97.z = _3992;
    }
    out.m_67.x = _3904;
    out.m_67.y = _3906;
    out.m_67.z = _3908;
    if (!_3890)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3994 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3994;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3746 = false;
    bool _716 = false;
    bool _538 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4051 = as_type<float>(_132);
        out.gl_Position.z = _4051;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4121 = as_type<float>(_170);
        out.gl_Position.z = _4121;
    }
    if (_162)
    {
        return out;
    }
    float _172 = in.m_53.x;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _176 = _150 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _178 = _150 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _188 = _176 * _174;
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _192 = _178 * _186;
    float _194 = floor(_190);
    float _196 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].y, _192);
    float _198 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _200 = _190 * 6.283185482025146484375;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _208 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _210 = floor(_196);
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _214 = _212 != 0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _218 = _216 != 0;
    float _220 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _206);
    float _222 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _208);
    float _224 = _200 * 0.15915493667125701904296875;
    float _226 = _196 * 6.283185482025146484375;
    float _228 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _198);
    float _230 = -_194;
    float _232 = _190 + _230;
    bool _234 = !_214;
    int _236 = _234 ? 0 : 1;
    float _238 = _226 * 0.15915493667125701904296875;
    float _240 = _224 * 6.283185482025146484375;
    float _242 = cos(_240);
    int _244 = abs(_236);
    bool _246 = !_204;
    int _248 = _246 ? 0 : 1;
    float _250 = -_210;
    float _252 = _196 + _250;
    float _254 = _238 * 6.283185482025146484375;
    float _256 = cos(_254);
    int _258 = abs(_248);
    float _260 = -_232;
    float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _264 = float(_244);
    float _266 = -_252;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _272 = !_218;
    int _274 = _272 ? 0 : 1;
    float _276 = fma(_242, 0.5, 0.5);
    bool _278 = _252 < 0.5;
    float _280 = float(_278);
    float _282 = abs(_262);
    float _284 = _264 * _282;
    float _286 = abs(_268);
    float _288 = _264 * _286;
    bool _290 = _232 < 0.5;
    float _292 = float(_290);
    float _294 = -_276;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _298 = abs(_274);
    float _300 = -_280;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _304 = fma(_256, 0.5, 0.5);
    float _306 = float(_258);
    float _308 = -_292;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = float(_298);
    float _314 = -_304;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _318 = fma(_306, _296, _284);
    float _320 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _228);
    float _322 = fma(_306, _316, _288);
    float _324 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _220);
    float _326 = abs(_310);
    float _328 = fma(_312, _326, _318);
    float _330 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _222);
    float _332 = abs(_302);
    float _334 = fma(_312, _332, _322);
    bool _336 = !_270;
    float _338 = _324;
    float _340 = _320;
    float _342 = _330;
    float _358;
    if (!_336)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_116);
        float _364 = 1.0 / _362;
        float _366 = _150 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _368 + _370;
    bool _374 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _368 + _386;
    bool _390 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_368);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _410 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _412 = isnan(_368);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -_384;
    float _424 = _422 + 1.0;
    float _426 = 1.0 / _408;
    float _428 = _420 * _424;
    float _430 = -_420;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _404;
    float _442 = _400 * _432;
    float _444 = -_400;
    float _446 = _444 + 1.0;
    float _448 = _388 * _426;
    float _450 = _372 * _440;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _456;
    float _460 = fma(_436, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_454, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = fma(_458, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    float _472 = _460 * _442;
    float _474 = _462 * _442;
    float _476 = _464 * _442;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _492 = fma(_480, _448, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_484, _448, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _498 = fma(_488, _448, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _502 = fma(_492, _428, _490);
    float _504 = fma(_494, _428, _496);
    float _506 = fma(_498, _428, _500);
    float _508 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].x, _502);
    float _510 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].y, _504);
    float _512 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].z, _506);
    float _514 = _508 * _466;
    float _516 = _510 * _468;
    float _518 = _512 * _470;
    bool _520 = !_438;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_116);
        float _542 = 1.0 / _540;
        float _544 = _150 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _562 = isnan(_546);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _576 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_546);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = 1.0 / _554;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -_570;
    float _596 = _594 + 1.0;
    bool _598 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_546);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _612 = 1.0 / _558;
    float _614 = 1.0 / _574;
    float _616 = _592 * _588;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = _586 * _596;
    float _624 = -_586;
    float _626 = _624 + 1.0;
    float _628 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _630 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _632 = isnan(_546);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = _608 * _626;
    float _644 = _620 * _612;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _546 + _650;
    float _654 = _628 * _642;
    float _656 = -_608;
    float _658 = _656 + 1.0;
    float _660 = -_640;
    float _662 = _660 + 1.0;
    float _664 = fma(_644, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = _648 * _614;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _546 + _668;
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[115].x, _654);
    float _674 = _570 * _662;
    float _676 = fma(_666, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _678 = fma(_664, _622, _672);
    float _680 = fma(_676, _674, _678);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[118].x, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _690;
    out.m_59.y = _692;
    out.m_59.z = _694;
    out.m_59.w = _696;
    bool _698 = !_610;
    float _714;
    if (!_698)
    {
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _702 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_116);
        float _720 = 1.0 / _718;
        float _722 = _150 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = in.m_46.x;
    float _728 = in.m_46.y;
    float _730 = in.m_46.z;
    float _732 = _328 * _514;
    float _734 = in.m_53.y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = in.m_53.z;
    float _744 = _334 * _516;
    float _746 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _752 = _728 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _754 = _728 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _756 = _728 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _758 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[5].x, _752);
    float _760 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[4].x, _754);
    float _762 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[6].x, _756);
    float _764 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[5].z, _758);
    float _766 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    float _768 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[6].z, _762);
    float _770 = _172 * 2.0;
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _774 = _766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _780 = -_772;
    float _782 = _780 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _784 = -_774;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = -_776;
    float _790 = _788 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _792 = floor(_770);
    float _794 = _782 * _782;
    float _796 = fma(_778, -2.0, _736);
    float _798 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = fma(_786, _786, _794);
    float _804 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _806 = -_800;
    float _808 = fma(_798, 2.0, _806);
    float _810 = fma(_790, _790, _802);
    float _812 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _814 = rsqrt(_810);
    float _816 = -_812;
    float _818 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _816);
    bool _820 = _792 > 0.0;
    bool _822 = _792 >= 0.0;
    bool _824 = isnan(_792);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _834 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _836 = _734 * 2.0;
    float _838 = -_832;
    float _840 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _838);
    float _842 = -_834;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _842);
    float _846 = floor(_836);
    float _848 = _172 + _734;
    float _850 = _786 * _814;
    float _852 = _790 * _814;
    float _854 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _856 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _858 = _850 * _850;
    float _860 = _848 + (-1.0);
    float _862 = -_854;
    float _864 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _862);
    float _866 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _868 = fma(_852, _852, _858);
    float _870 = -_856;
    float _872 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _870);
    float _874 = _742 * 2.0;
    float _876 = -_866;
    float _878 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _876);
    float _880 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _882 = _734 + _742;
    float _884 = rsqrt(_868);
    bool _886 = _846 > 0.0;
    float _888 = _844 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _890 = _846 >= 0.0;
    bool _892 = isnan(_846);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = _882 + (-1.0);
    float _902 = _840 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _904 = -_888;
    float _906 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[1].x, _904);
    float _908 = floor(_874);
    float _910 = _782 * _814;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _914 = -_902;
    float _916 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[1].y, _914);
    float _918 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].w, _906);
    float _920 = _844 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _922 = _872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[1].w, _916);
    float _926 = _852 * _884;
    float _928 = _850 * _884;
    float _930 = _918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _932 = -_920;
    float _934 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _936 = -_926;
    float _938 = _852 * _936;
    float _940 = -_922;
    float _942 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[1].x, _940);
    float _944 = -_930;
    float _946 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _948 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].w, _934);
    float _950 = -_938;
    float _952 = fma(_850, _928, _950);
    float _954 = _910 * _928;
    float _956 = -_926;
    float _958 = _910 * _956;
    bool _960 = _908 > 0.0;
    float _962 = _952 * _952;
    bool _964 = _908 >= 0.0;
    bool _966 = isnan(_908);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].z, _946);
    float _976 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _942);
    float _978 = fma(_954, _954, _962);
    float _980 = _844 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _982 = _840 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _984 = -_976;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].w, _974);
    float _988 = fma(_958, _958, _978);
    float _990 = -_980;
    float _992 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[0].x, _990);
    float _994 = _976;
    float _996 = _974;
    if (_740)
    {
        _994 = _172;
    }
    float _998 = _994;
    float _1000 = 1.0 / _986;
    float _1002 = _998;
    if (!_740)
    {
        _1002 = _742;
    }
    float _1004 = _1002;
    float _1006 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].w, _992);
    float _1008 = -_982;
    float _1010 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1008);
    float _1012 = _844 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1014 = _830 ? 0 : 1;
    float _1016 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_740)
    {
        _996 = _734;
    }
    float _1018 = _996;
    float _1020 = rsqrt(_988);
    float _1022 = -_1012;
    float _1024 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1022);
    float _1026 = _1018;
    if (!_740)
    {
        _1026 = _172;
    }
    float _1028 = _1026;
    float _1030 = -_750;
    float _1032 = fma(_1016, 2.0, _1030);
    int _1034 = ~_1014;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1042 = _1038;
    if (!_820)
    {
        int _1044 = ~_1014;
        int _1046 = _1044 + 1;
        _1042 = _1046;
    }
    int _1048 = _1042;
    float _1050 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1052 = log2(_1050);
    float _1054 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1010);
    float _1056 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1058 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1024);
    int _1060 = _972 ? 0 : 1;
    float _1062 = fma(_1006, _1000, -1.0);
    float _1064 = fma(_1056, -2.0, _1040);
    float _1066 = _952 * _1020;
    float _1068 = precise::clamp(_1066, 0.0, 1.0);
    float _1070 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1072 = int(_1070);
    int _1074 = _898 ? 0 : 1;
    float _1076 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1064);
    float _1078 = -_1068;
    float _1080 = _1078 + 1.0;
    int _1082 = ~_1060;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = -_150;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1032);
    int _1092 = _1086;
    if (!_960)
    {
        int _1094 = ~_1060;
        int _1096 = _1094 + 1;
        _1092 = _1096;
    }
    int _1098 = _1092;
    float _1100 = _1052 * _150;
    float _1102 = _1080 * _1000;
    float _1104 = fma(_1080, _1062, 1.0);
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1116 = _1114 != 0;
    float _1118 = exp2(_1100);
    float _1120 = _1054 * _1102;
    float _1122 = _1058 * _1102;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1126 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1134 = _1130 || _1132;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1138 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1140 = isnan(1.0);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1146 = _1142 || _1144;
    float _1148 = -_150;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _1152 = _1104 * _1104;
    bool _1154 = !_1112;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1160 = !_1108;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = fma(_1120, _1120, _1152);
    bool _1166 = !_1116;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1124);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1182 = _1180 != 0;
    float _1184 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1136);
    float _1186 = float(_1072);
    float _1188 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1158);
    float _1190 = fma(_1122, _1122, _1164);
    bool _1192 = !_1178;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = 1.0 / _1186;
    bool _1198 = !_1174;
    int _1200 = _1198 ? 0 : 1;
    float _1202 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1170);
    int _1204 = ~_1074;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1212 = 1.0 + _1210;
    int _1214 = _1208;
    if (!_886)
    {
        int _1216 = ~_1074;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    float _1222 = -_1118;
    float _1224 = _1222 + 1.0;
    float _1226 = rsqrt(_1190);
    float _1228 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1184);
    int _1230 = abs(_1194);
    float _1232 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1188);
    int _1234 = abs(_1200);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1240 = _772 + _1238;
    float _1242 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1244 = int(_1242);
    float _1246 = float(_1048);
    float _1248 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1236);
    float _1250 = float(_1230);
    float _1252 = _1196 * _150;
    float _1254 = _1134 ? _1224 : 0.0;
    float _1256 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1248);
    float _1258 = float(_1234);
    float _1260 = 1.0 / _1212;
    float _1262 = _1122 * _1226;
    float _1264 = _1104 * _1226;
    float _1266 = _1120 * _1226;
    float _1268 = float(_1098);
    float _1270 = -_1262;
    float _1272 = _850 * _1270;
    float _1274 = _852 * _1264;
    float _1276 = _1240 * _1240;
    float _1278 = float(_1244);
    float _1280 = _1250 * _1246;
    float _1282 = -_1266;
    float _1284 = -_1272;
    float _1286 = fma(_852, _1282, _1284);
    float _1288 = in.m_61.x;
    float _1290 = in.m_61.y;
    float _1292 = in.m_61.z;
    float _1294 = -_1262;
    float _1296 = -_1274;
    float _1298 = fma(_910, _1294, _1296);
    float _1300 = _1278 * _150;
    float _1302 = -_1266;
    float _1304 = _910 * _1302;
    float _1306 = _1286 * _1286;
    if (_1146)
    {
        float _1308 = _1254 * _1260;
        _152 = _1308;
    }
    float _1310 = _152;
    float _1312 = _1258 * _1268;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1316 = _774 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _776 + _1318;
    float _1322 = -_1304;
    float _1324 = fma(_850, _1264, _1322);
    float _1326 = fma(_1298, _1298, _1306);
    float _1328 = fma(_1316, _1316, _1276);
    float _1330 = _1280 * (-2.0);
    float _1332 = _734 + (-0.5);
    float _1334 = fma(_1324, _1324, _1326);
    float _1336 = fma(_1320, _1320, _1328);
    bool _1338 = !_1182;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = fma(_912, _1330, _912);
    float _1344 = rsqrt(_1334);
    float _1346 = _1312 * (-2.0);
    int _1348 = abs(_1340);
    float _1350 = float(_1220);
    float _1352 = fma(_1330, _1290, _1290);
    float _1354 = float(_1348);
    float _1356 = sqrt(_1336);
    float _1358 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1360 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1362 = fma(_1346, _1288, _1288);
    float _1364 = _172 + _742;
    float _1366 = _1354 * _1350;
    float _1368 = fma(_1342, _1310, _1360);
    float _1370 = fma(_880, _1346, _880);
    float _1372 = rsqrt(_1336);
    float _1374 = _1368 * 0.15915493667125701904296875;
    float _1376 = _172 + (-0.5);
    float _1378 = _1364 + (-1.0);
    float _1380 = _1298 * _1344;
    float _1382 = _1366 * (-2.0);
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1362);
    float _1386 = _1358 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1388 = _1356 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1392 = _1286 * _1344;
    float _1394 = _1324 * _1344;
    float _1396 = _852 * _1380;
    float _1398 = precise::min(_1386, _1388);
    float _1400 = fma(_1382, _1292, _1292);
    float _1402 = _910 * _1394;
    float _1404 = _850 * _1392;
    float _1406 = -_1396;
    float _1408 = fma(_850, _1394, _1406);
    float _1410 = _1372 * _1398;
    float _1412 = -_1402;
    float _1414 = fma(_852, _1392, _1412);
    float _1416 = -_1404;
    float _1418 = fma(_910, _1380, _1416);
    float _1420 = _1408 * _1408;
    float _1422 = _742 + (-0.5);
    float _1424 = _1240 * _1410;
    float _1426 = _1316 * _1410;
    float _1428 = fma(_1414, _1414, _1420);
    float _1430 = fma(_1390, _1382, _1390);
    float _1432 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1400);
    float _1434 = -_1424;
    float _1436 = _1240 + _1434;
    float _1438 = fma(_1370, _1310, _1384);
    float _1440 = fma(_1418, _1418, _1428);
    float _1442 = fma(_1430, _1310, _1432);
    float _1444 = -_1426;
    float _1446 = _1316 + _1444;
    float _1448 = _1436 * _1436;
    float _1450 = _1320 * _1410;
    float _1452 = _1374 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1438 * 0.15915493667125701904296875;
    float _1458 = fma(_1446, _1446, _1448);
    float _1460 = -_1450;
    float _1462 = _1320 + _1460;
    float _1464 = _1442 * 0.15915493667125701904296875;
    float _1466 = fma(_1462, _1462, _1458);
    float _1468 = _1374 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = rsqrt(_1440);
    float _1474 = _1456 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = _1456 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _1418 * _1472;
    float _1484 = _1414 * _1472;
    float _1486 = _1408 * _1472;
    float _1488 = _850 * _1482;
    float _1490 = _1464 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = in.m_63.x;
    float _1496 = in.m_63.y;
    float _1498 = in.m_63.z;
    float _1500 = _1476 * _1454;
    float _1502 = _1476 * _1470;
    float _1504 = -_1488;
    float _1506 = fma(_852, _1484, _1504);
    float _1508 = sqrt(_1466);
    float _1510 = _1480 * _1470;
    float _1512 = _1480 * _1454;
    float _1514 = _1506 * _1506;
    float _1516 = _1476 * _1492;
    float _1518 = _1470 * _1492;
    float _1520 = _1480 * _1492;
    float _1522 = _1454 * _1492;
    float _1524 = _852 * _1486;
    float _1526 = _1464 * 6.283185482025146484375;
    float _1528 = sin(_1526);
    float _1530 = _1372 * _1508;
    float _1532 = _910 * _1484;
    float _1534 = -_1524;
    float _1536 = fma(_910, _1482, _1534);
    float _1538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1494);
    float _1540 = _748 * _1530;
    float _1542 = -_1532;
    float _1544 = fma(_850, _1486, _1542);
    float _1546 = fma(_1536, _1536, _1514);
    float _1548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1496);
    float _1550 = _1358 * _1530;
    float _1552 = _746 * _1530;
    float _1554 = fma(_1544, _1544, _1546);
    float _1556 = _1540 * _1548;
    float _1558 = _1550 * _1538;
    float _1560 = fma(_1528, _1510, _1500);
    float _1562 = rsqrt(_1554);
    float _1564 = _1520 * _1556;
    float _1566 = -_1502;
    float _1568 = fma(_1528, _1512, _1566);
    float _1570 = _1552 * _1498;
    float _1572 = -_1556;
    float _1574 = _1528 * _1572;
    float _1576 = fma(_1560, _1558, _1564);
    float _1578 = -_1512;
    float _1580 = fma(_1528, _1502, _1578);
    float _1582 = _1516 * _1556;
    float _1584 = fma(_1518, _1558, _1574);
    float _1586 = fma(_1568, _1570, _1576);
    float _1588 = fma(_1528, _1500, _1510);
    float _1590 = fma(_1580, _1558, _1582);
    float _1592 = fma(_1522, _1570, _1584);
    float _1594 = _1482 * _1586;
    float _1596 = fma(_1588, _1570, _1590);
    float _1598 = _1544 * _1562;
    float _1600 = _1484 * _1586;
    float _1602 = _1536 * _1562;
    float _1604 = _1486 * _1586;
    float _1606 = fma(_1598, _1592, _1594);
    float _1608 = _1506 * _1562;
    float _1610 = fma(_1602, _1592, _1600);
    float _1612 = -_1424;
    float _1614 = _772 + _1612;
    float _1616 = fma(_852, _1596, _1606);
    float _1618 = fma(_1608, _1592, _1604);
    float _1620 = fma(_850, _1596, _1610);
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1624 = _776 + _1616;
    float _1626 = fma(_910, _1596, _1618);
    float _1628 = _774 + _1620;
    float _1630 = -_1450;
    float _1632 = _776 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1636 = _1624 + _1634;
    float _1638 = _772 + _1626;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1642 = _1628 + _1640;
    float _1644 = _1636 * _1636;
    float _1646 = fma(_1642, _1642, _1644);
    float _1648 = -_1426;
    float _1650 = _774 + _1648;
    float _1652 = sqrt(_1646);
    float _1654 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1622);
    float _1656 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1654);
    bool _1658 = _1652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = _1626;
    float _1662 = _1628;
    float _1664 = _1596;
    float _1666 = _1424;
    float _1668 = _1450;
    float _1670 = _1646;
    int _1672 = as_type<int>(_1494);
    if (!_1658)
    {
        _1660 = _1628;
    }
    float _1674 = _1660;
    float _1676 = _1674;
    if (!_1658)
    {
        _1662 = _1624;
    }
    float _1678 = _1662;
    float _1680 = _1678;
    if (!_1658)
    {
        _1664 = _1638;
    }
    float _1682 = _1664;
    bool _1684 = !_1658;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1652 + _1690;
        float _1694 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1646);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1642, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1636, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1638, _1708, _1720);
        _1686 = _1722;
        _1676 = _1716;
        _1680 = _1718;
    }
    float _1724 = _1686;
    float _1726 = _1676;
    float _1728 = _1680;
    float _1730 = -_772;
    float _1732 = _1730 + _1724;
    float _1734 = -_774;
    float _1736 = _1734 + _1726;
    float _1738 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1740 = _1614 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1742 = _1732 * _1732;
    float _1744 = -_776;
    float _1746 = _1744 + _1728;
    float _1748 = 1.0 / _1738;
    float _1750 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1740);
    float _1752 = fma(_1736, _1736, _1742);
    float _1754 = -_1426;
    float _1756 = _1754 + _1726;
    float _1758 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1750);
    float _1760 = fma(_1746, _1746, _1752);
    float _1762 = -_1450;
    float _1764 = _1762 + _1728;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1768 = sqrt(_1760);
    float _1770 = _1766 + _1738;
    float _1772 = _1770 * _1748;
    float _1774 = _1772 * 0.5;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1778 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1776);
    float _1780 = 1.0 / _1778;
    bool _1782 = _1768 > 0.0;
    bool _1784 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.5);
    bool _1792 = _1788 || _1790;
    bool _1794 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan(0.5);
    bool _1802 = _1798 || _1800;
    float _1804 = -_1424;
    float _1806 = _1804 + _1724;
    float _1808 = _1728;
    float _1810 = _1724;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1814 = _1738;
    float _1816 = _1778;
    float _1818 = _1732;
    float _1820 = _1806;
    if (!_1782)
    {
        _1666 = _1756;
    }
    float _1822 = _1666;
    float _1824 = _1822;
    float _1826 = _1822;
    if (!_1782)
    {
        _1808 = _1806;
    }
    float _1828 = _1808;
    float _1830 = _1828;
    if (!_1782)
    {
        _1668 = _1764;
    }
    float _1832 = _1668;
    bool _1834 = !_1782;
    float _1836 = _1832;
    if (!_1834)
    {
        float _1838 = _320 * _320;
        float _1840 = rsqrt(_1760);
        float _1842 = fma(_324, _324, _1838);
        float _1844 = fma(_330, _330, _1842);
        float _1846 = sqrt(_1844);
        float _1848 = _1736 * _1840;
        float _1850 = _1732 * _1840;
        float _1852 = _1746 * _1840;
        bool _1854 = _1846 > 0.0;
        float _1856 = _1840;
        float _1858 = _1846;
        _1810 = _1844;
        _1812 = _1848;
        if (!_1854)
        {
            _1824 = _1756;
        }
        float _1860 = _1824;
        _1826 = _1860;
        if (!_1854)
        {
            _1856 = _1806;
        }
        float _1862 = _1856;
        _1830 = _1862;
        if (!_1854)
        {
            _1858 = _1764;
        }
        float _1864 = _1858;
        bool _1866 = !_1854;
        _1836 = _1864;
        if (!_1866)
        {
            float _1868 = rsqrt(_1844);
            float _1870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1872 = _320 * _1868;
            float _1874 = _324 * _1868;
            float _1876 = _330 * _1868;
            float _1878 = _1850 * _1872;
            float _1880 = fma(_1848, _1874, _1878);
            float _1882 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1884 = fma(_1852, _1876, _1880);
            float _1886 = _1884 * _1882;
            float _1888 = fma(_324, _1886, _1756);
            float _1890 = fma(_320, _1886, _1806);
            float _1892 = fma(_330, _1886, _1764);
            _1826 = _1888;
            _1830 = _1890;
            _1836 = _1892;
        }
    }
    float _1894 = _1826;
    float _1896 = _1830;
    float _1898 = _1836;
    float _1900 = _1810;
    float _1902 = _1812;
    float _1904 = _1900;
    float _1906 = _1902;
    if (_1792)
    {
        _1814 = 1.0;
    }
    float _1908 = _1814;
    float _1910 = _1908;
    if (_1802)
    {
        _338 = _1894;
    }
    float _1912 = _338;
    float _1914 = _1912;
    if (_1802)
    {
        _340 = _1896;
    }
    float _1916 = _340;
    float _1918 = _1916;
    if (_1802)
    {
        _342 = _1898;
    }
    float _1920 = _342;
    float _1922 = _1920;
    if (!_1802)
    {
        float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1926 = _1614 + _1924;
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1930 = _1650 + _1928;
        float _1932 = -_1650;
        float _1934 = _1932 + _1894;
        float _1936 = -_1614;
        float _1938 = _1936 + _1896;
        float _1940 = _1926 * _1926;
        float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1944 = _1632 + _1942;
        float _1946 = -_1632;
        float _1948 = _1946 + _1898;
        float _1950 = fma(_1930, _1930, _1940);
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1954 = fma(_1944, _1944, _1950);
        float _1956 = sqrt(_1954);
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1960 = _1956 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1962 = isnan(_1956);
        bool _1964 = _1960 || _1962;
        bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1968 = _1964 || _1966;
        float _1970 = precise::min(_1956, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1972 = _1970 * _1952;
        float _1974 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1976 = _1974 * _1972;
        float _1978 = _1778;
        float _1980 = _1974;
        if (_1968)
        {
            float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1978 = _1982;
        }
        float _1984 = _1978;
        if (_1968)
        {
            float _1986 = precise::max(_1956, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1904 = _1986;
        }
        float _1988 = _1904;
        float _1990 = fma(_1934, _1976, _1650);
        float _1992 = fma(_1938, _1976, _1614);
        float _1994 = fma(_1948, _1976, _1632);
        float _1996 = _1988;
        float _1998 = _1992;
        float _2000 = _1990;
        _1816 = _1984;
        if (_1968)
        {
            float _2002 = _1988 * _1984;
            _1996 = _2002;
        }
        float _2004 = _1996;
        float _2006 = _2004;
        if (_1968)
        {
            float _2008 = _1974 * _2004;
            _2006 = _2008;
        }
        float _2010 = _2006;
        if (!_1968)
        {
            _1980 = _1992;
        }
        float _2012 = _1980;
        float _2014 = _2012;
        if (!_1968)
        {
            _1998 = _1994;
        }
        float _2016 = _1998;
        _1922 = _2016;
        if (_1968)
        {
            float _2018 = fma(_1934, _2010, _1650);
            _2000 = _2018;
        }
        float _2020 = _2000;
        _1914 = _2020;
        if (_1968)
        {
            float _2022 = fma(_1938, _2010, _1614);
            _2014 = _2022;
        }
        float _2024 = _2014;
        _1918 = _2024;
        if (_1968)
        {
            float _2026 = fma(_1948, _2010, _1632);
            _1922 = _2026;
        }
    }
    float _2028 = _1918;
    float _2030 = _1914;
    float _2032 = _1922;
    float _2034 = _1816;
    float _2036 = _2034;
    if (_1792)
    {
        _1818 = 1.0;
    }
    float _2038 = _1818;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2042 = _1780 * _2040;
    float _2044 = _2038;
    if (!_1792)
    {
        float _2046 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2050 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2048;
        float _2052 = _2046 * 0.15915493667125701904296875;
        float _2054 = 1.0 / _2050;
        float _2056 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2058 = _2052 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = _2056 * 0.15915493667125701904296875;
        float _2064 = _2052 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        float _2068 = 1.0 / _2060;
        float _2070 = _2062 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        float _2074 = _2066 * _2068;
        float _2076 = _2062 * 6.283185482025146484375;
        float _2078 = sin(_2076);
        float _2080 = _2072 * _2074;
        float _2082 = 1.0 / _2080;
        float _2084 = _2078 * _2082;
        float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2088 = fma(_2042, _2084, _2086);
        float _2090 = _2088 * _2054;
        float _2092 = precise::clamp(_2090, 0.0, 1.0);
        _1820 = _2074;
        _1906 = _2052;
        _2036 = _2062;
        _1910 = _2092;
    }
    float _2094 = _1820;
    float _2096 = _1906;
    float _2098 = _2036;
    float _2100 = _1910;
    float _2102 = _2096;
    float _2104 = _2094;
    if (!_1792)
    {
        float _2106 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2108 = _2106 * 0.15915493667125701904296875;
        float _2110 = _2108 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        float _2114 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2116 = _2114 * 0.15915493667125701904296875;
        float _2118 = _2108 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = 1.0 / _2112;
        float _2124 = _2116 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = _2116 * 6.283185482025146484375;
        float _2132 = sin(_2130);
        float _2134 = _2126 * _2128;
        float _2136 = 1.0 / _2134;
        float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2140 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2138;
        float _2142 = 1.0 / _2140;
        float _2144 = _2132 * _2136;
        float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2148 = fma(_2042, _2144, _2146);
        float _2150 = _2148 * _2142;
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = -_2152;
        float _2156 = _2154 + 1.0;
        _2102 = _2134;
        _2104 = _2122;
        _2044 = _2156;
    }
    float _2158 = _2102;
    float _2160 = _2104;
    float _2162 = _2044;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2166 = _2028 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2170 = _2030 + _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2174 = _2032 + _2172;
    float _2176 = _2166 * _2166;
    float _2178 = fma(_2170, _2170, _2176);
    float _2180 = fma(_2174, _2174, _2178);
    float _2182 = rsqrt(_2180);
    float _2184 = sqrt(_2180);
    float _2186 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2188 = _2170 * _2186;
    float _2190 = _2174 * _2186;
    float _2192 = _2188 * _2188;
    float _2194 = _2190 * _2190;
    float _2196 = _2192 + _2194;
    float _2198 = sqrt(_2196);
    bool _2200 = _2198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2204 = _2198 + _2202;
    float _2206 = _2174;
    float _2208 = _2176;
    float _2210 = _2204;
    float _2212 = _2158;
    float _2214 = _2186;
    float _2216 = _2160;
    if (_2200)
    {
        float _2218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2206 = _2218;
    }
    float _2220 = _2206;
    if (_2200)
    {
        float _2222 = rsqrt(_2196);
        _2208 = _2222;
    }
    float _2224 = _2208;
    float _2226 = _2224;
    if (_2200)
    {
        float _2228 = _2204 * _2220;
        _2210 = _2228;
    }
    float _2230 = _2210;
    float _2232 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2200)
    {
        float _2234 = _2230 * 0.15915493667125701904296875;
        _2212 = _2234;
    }
    float _2236 = _2212;
    float _2238 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2232);
    float _2240 = _2220;
    float _2242 = _2236;
    if (_2200)
    {
        float _2244 = _2236 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2252 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2238);
    float _2254 = precise::max(0.0, _2250);
    float _2256 = _2098;
    if (_2200)
    {
        float _2258 = _2236 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        _2256 = _2260;
    }
    float _2262 = _2256;
    float _2264 = -_2186;
    float _2266 = -_2254;
    float _2268 = fma(_2166, _2264, _2266);
    if (_2200)
    {
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2270;
    }
    float _2272 = _2214;
    float _2274 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2276 = _2248;
    float _2278 = _2272;
    if (_2200)
    {
        float _2280 = fma(_2248, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2216 = _2280;
    }
    float _2282 = _2216;
    float _2284 = _2282;
    if (!_2200)
    {
        _2276 = _2188;
    }
    float _2286 = _2276;
    float _2288 = floor(_2274);
    float _2290 = _2286;
    float _2292 = _2262;
    if (_2200)
    {
        float _2294 = _2262 + (-1.0);
        _2278 = _2294;
    }
    float _2296 = _2278;
    float _2298 = _2296;
    if (_2200)
    {
        float _2300 = _2224 * _2282;
        _1670 = _2300;
    }
    float _2302 = _1670;
    if (!_2200)
    {
        _2226 = _2268;
    }
    float _2304 = _2226;
    float _2306 = _2304;
    if (_2200)
    {
        float _2308 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2308;
    }
    float _2310 = _2242;
    if (_2200)
    {
        float _2312 = _2188 * _2302;
        _2290 = _2312;
    }
    float _2314 = _2290;
    if (!_2200)
    {
        _2298 = _2190;
    }
    float _2316 = _2298;
    float _2318 = _2316;
    if (_2200)
    {
        float _2320 = _2190 * _2302;
        _2318 = _2320;
    }
    float _2322 = _2318;
    if (!_2200)
    {
        _2284 = _2192;
    }
    float _2324 = _2284;
    float _2326 = _2324;
    if (_2200)
    {
        float _2328 = fma(_2268, _2262, _2310);
        _2306 = _2328;
    }
    float _2330 = _2306;
    if (_2200)
    {
        float _2332 = _2314 * _2314;
        _2326 = _2332;
    }
    float _2334 = _2326;
    if (!_2200)
    {
        _2292 = _2194;
    }
    float _2336 = _2292;
    float _2338 = _2336;
    if (_2200)
    {
        float _2340 = _2322 * _2322;
        _2338 = _2340;
    }
    float _2342 = _2338;
    float _2344 = fma(_2330, _2330, _2334);
    float _2346 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2348 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2350 = fma(_1632, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2352 = _2344 + _2342;
    float _2354 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2356 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2346);
    float _2358 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2348);
    float _2360 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2354);
    float _2362 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2356);
    float _2364 = rsqrt(_2352);
    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2368 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2366);
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2358);
    float _2374 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2360);
    float _2376 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2378 = -_2370;
    float _2380 = _2378 + 1.0;
    float _2382 = _2372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2384 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2388 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2390 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2392 = abs(_2380);
    float _2394 = log2(_2392);
    float _2396 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2386);
    float _2398 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = -_2390;
    float _2402 = fma(_2400, _2388, 1.0);
    float _2404 = -_2288;
    float _2406 = _2274 + _2404;
    float _2408 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2410 = _2364 * _2314;
    float _2412 = _2364 * _2322;
    float _2414 = floor(_2350);
    float _2416 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2408);
    float _2418 = _2364 * _2330;
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2422 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2424 = _2418 + 1.0;
    float _2426 = -_2420;
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2426);
    float _2430 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = log2(_2402);
    float _2434 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2422);
    float _2436 = -_2412;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2428);
    float _2440 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2442 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2434);
    float _2444 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2440);
    float _2446 = exp2(_2430);
    float _2448 = fma(_2438, -0.5, 0.5);
    float _2450 = fma(_2438, 0.5, 0.5);
    float _2452 = -_2414;
    float _2454 = _2350 + _2452;
    float _2456 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2444);
    float _2458 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2442);
    float _2460 = fma(_2450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2462 = 1.0 / _2416;
    float _2464 = _2432 * 0.693147182464599609375;
    float _2466 = fma(_2450, _2460, -0.212114393711090087890625);
    float _2468 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = fma(_2450, _2466, 1.570728778839111328125);
    float _2472 = sqrt(_2448);
    float _2474 = -_2418;
    float _2476 = fma(_2446, _2424, _2474);
    float _2478 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2456);
    float _2480 = fma(_2476, 0.5, 0.5);
    float _2482 = _2458 * _2462;
    float _2484 = _2478 * _2462;
    float _2486 = fma(_2482, 0.5, 0.5);
    float _2488 = fma(_2484, -0.5, 0.5);
    float _2490 = _2472 * 0.636619746685028076171875;
    float2 _7746 = float2(_2406, _2454);
    float _2492 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7746, float2(0.0), isnan(_7746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7746, float2(0.0), isnan(_7746)), level(0.0)).x;
    float3 _7757 = float3(_2486, _2488, _2468);
    float _2494 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7757, float3(0.0), isnan(_7757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7757, float3(0.0), isnan(_7757)), level(0.0)).x;
    float _2496 = -_2470;
    float _2498 = fma(_2490, _2496, 1.0);
    float3 _7773 = float3(_2486, _2488, _2468);
    float4 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7773, float3(0.0), isnan(_7773)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7773, float3(0.0), isnan(_7773)), level(0.0)).xyzw;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = _2501.w;
    float2 _7789 = float2(_2498, _2480);
    float3 _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7789, float2(0.0), isnan(_7789)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7789, float2(0.0), isnan(_7789)), level(0.0)).xyz;
    float _2515 = _2513.x;
    float _2517 = _2513.y;
    float _2519 = _2513.z;
    float _2521 = float(uint(_1244));
    float _2523 = trunc(_1252);
    int _2525 = int(_2523);
    int _2527 = ~_1244;
    int _2529 = _2527 + 1;
    out.m_65.x = _1650;
    out.m_65.y = _1614;
    out.m_65.z = _1632;
    bool _2531 = _1244 == 0;
    float _2533 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2535 = abs(_1156);
    out.m_67.w = _1398;
    bool _2537 = _734 > 0.5;
    float _2539 = 1.0 / _2521;
    int _2541 = ~_1244;
    int _2543 = _2541 + 1;
    float _2545 = in.m_69.x;
    float _2547 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2549 = _1568 * _1484;
    bool _2551 = _2042 <= 8000.0;
    bool _2553 = isnan(_2042);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(8000.0);
    bool _2559 = _2555 || _2557;
    float _2561 = float(_2559);
    float _2563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2565 = float(uint(_2525));
    float _2567 = fma(_1522, _1602, _2549);
    float _2569 = float(_116);
    float _2571 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2547);
    float _2573 = float(_2525);
    out.m_71.x = _1550;
    int _2575 = as_type<int>(_2539) + (-2);
    float _2577 = 1.0 / _2569;
    bool _2579 = _2573 >= _1278;
    bool _2581 = isnan(_2573);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan(_1278);
    bool _2587 = _2583 || _2585;
    float _2589 = float(_2587);
    float _2591 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2571);
    out.m_73.x = _2030;
    out.m_73.y = _2028;
    out.m_73.z = _2032;
    float _2593 = as_type<float>(_2575) * _2565;
    float _2595 = trunc(_2589);
    int _2597 = int(_2595);
    float _2599 = trunc(_2593);
    float _2601 = precise::max(_2599, 0.0);
    uint _2604 = uint(_2601);
    float _2606 = _1300 * _2577;
    bool _2608 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2610 = isnan(_724);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = trunc(_2606);
    int _2622 = int(_2620);
    int _2624 = _2543 * int(_2604);
    int _2626 = _2624 + _2525;
    float _2628 = exp2(_2533);
    float _2630 = float(uint(_2626));
    float _2632 = as_type<float>(_2575) * _2630;
    bool _2634 = !_740;
    float _2636 = _2634 ? 7.345489978790283203125 : 1.0;
    float _2638 = trunc(_2632);
    float _2640 = precise::max(_2638, 0.0);
    uint _2642 = uint(_2640);
    float _2644 = -_2628;
    float _2646 = _2644 + 1.0;
    float _2648 = _2636 * _172;
    float _2650 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = floor(_2648);
    int _2654 = int(_2604) + int(_2642);
    int _2656 = _2529 * _2654;
    int _2658 = _2656 + _2525;
    float _2660 = -_2652;
    float _2662 = _2648 + _2660;
    bool _2664 = uint(_2658) >= uint(_1244);
    float _2666 = _2662 * _1278;
    int _2668 = _1244 + (-1);
    bool _2670 = !_2664;
    int _2672 = _2670 ? 0 : (-1);
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2676 = _2674 != 0;
    float _2678 = trunc(_2666);
    int _2680 = int(_2678);
    int _2682 = ~_2654;
    int _2684 = _2682 + _2672;
    int _2686 = _2684 + 1;
    bool _2688 = !_2676;
    int _2690 = _2688 ? 0 : 1;
    int _2692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2694 = _2692 != 0;
    int _2696 = _1244 * _2686;
    int _2698 = _2696 + _2525;
    int _2700 = ~_2597;
    int _2702 = _2700 + 1;
    int _2704 = _2702 + 1;
    int _2706 = abs(_2690);
    bool _2708 = !_2531;
    int _2710 = _2708 ? _2698 : (-1);
    bool _2712 = !_2694;
    int _2714 = _2712 ? 0 : 1;
    int _2716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2718 = _2716 != 0;
    int _2720 = _2710 * _2704;
    int _2722 = abs(_2714);
    int _2724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2726 = _2724 != 0;
    int _2728 = _2597 * _2668;
    int _2730 = _2728 + _2720;
    int _2732 = abs(_1162);
    int _2734 = _2730 * _2535;
    int _2736 = abs(_1168);
    int _2738 = _2680 * _2706;
    int _2740 = _2738 + _2525;
    float _2742 = in.m_75.w;
    int _2744 = ~_1244;
    int _2746 = _2744 + 1;
    int _2748 = _2622 * _2732;
    int _2750 = _2748 + _2734;
    float _2752 = in.m_69.y;
    int _2754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2756 = _2754 != 0;
    int _2758 = _2740 * _2736;
    int _2760 = _2758 + _2750;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2764 = _2762 != 0;
    int _2766 = _2680 * _2722;
    int _2768 = _2766 + _2760;
    int _2770 = ~_1244;
    int _2772 = _2770 + 1;
    float _2774 = float(uint(_2768));
    float _2776 = as_type<float>(_2575) * _2774;
    out.m_77.w = _2742;
    float _2778 = trunc(_2776);
    float _2780 = precise::max(_2778, 0.0);
    uint _2782 = uint(_2780);
    int _2784 = _2772 * int(_2782);
    int _2786 = _2784 + _2768;
    float _2788 = float(uint(_2786));
    float _2790 = as_type<float>(_2575) * _2788;
    float _2792 = trunc(_2790);
    float _2794 = precise::max(_2792, 0.0);
    uint _2796 = uint(_2794);
    int _2798 = int(_2782) + int(_2796);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2804 = 1.0 / _2802;
    int _2806 = _2746 * _2798;
    int _2808 = _2806 + _2768;
    float _2810 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2814 = uint(_2808) >= uint(_1244);
    float _2816 = -_2752;
    float _2818 = _2816 + 1.0;
    float _2820 = 1.0 / _2812;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2824 = _2822 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2826 = !_2814;
    int _2828 = _2826 ? 0 : (-1);
    int _2830 = _2537 ? as_type<int>(_2818) : as_type<int>(_2752);
    int _2832 = ~_2798;
    int _2834 = _2832 + _2828;
    int _2836 = _2834 + 1;
    float _2838 = _2726 ? as_type<float>(_2830) : _2752;
    int _2840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2842 = _2840 != 0;
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2844;
    bool _2848 = _742 > 0.5;
    int _2850 = _1244 * _2836;
    int _2852 = _2850 + _2768;
    float _2854 = float(uint(_2740));
    float _2856 = _2846 * _2804;
    float _2858 = _2752;
    bool _2860 = _2848;
    float _2862 = as_type<float>(_2575);
    float _2864 = _2458;
    if (_2718)
    {
        float _2866 = _2848 ? _2818 : _2752;
        _2858 = _2866;
    }
    float _2868 = _2858;
    float _2870 = _2824 * _2820;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2874 = _724 + _2872;
    float _2876 = as_type<float>(_2575) * _2854;
    bool _2878 = !_2531;
    int _2880 = _2878 ? _2852 : (-1);
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2884 = _724 + _2882;
    float _2886 = _2884;
    if (_2756)
    {
        bool _2888 = _172 > 0.5;
        _2860 = _2888;
    }
    bool _2890 = _2860;
    float _2892 = trunc(_2876);
    float _2894 = precise::max(_2892, 0.0);
    uint _2896 = uint(_2894);
    int _2898 = _2880 >> 31;
    float _2900 = fma(_2856, _2874, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2902 = _1496 != 0.0;
    bool _2904 = isnan(_1496);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan(0.0);
    bool _2910 = _2906 || _2908;
    float _2912 = in.m_79.x;
    float _2914 = in.m_79.y;
    float _2916 = in.m_79.z;
    int _2918 = _2898 & 3;
    float _2920 = fma(_2870, _2884, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2922 = ~_1244;
    int _2924 = _2922 + 1;
    int _2926 = _2880 + _2918;
    bool _2928 = _1494 == 0.0;
    bool _2930 = !_2910;
    bool _2932 = _2928 && _2930;
    float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2936 = _2926 >> 2;
    int _2938 = _2924 * int(_2896);
    int _2940 = _2938 + _2740;
    bool _2942 = _1498 == 0.0;
    bool _2944 = _2942 && _2932;
    int _2946 = _2936 << 4;
    int _2948 = _2946 + 368;
    bool _2950 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2952 = isnan(_724);
    bool _2954 = _2950 || _2952;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2958 = _2954 || _2956;
    float _2960 = float(_2958);
    bool _2962 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2964 = isnan(_724);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    float _2974 = float(uint(_2940));
    float _2976 = -_2960;
    float _2978 = _2976 + 1.0;
    uint _2980 = uint(int(uint(_2948) >> uint(2)));
    uint _2982 = uint(int(uint(int(_2980)) >> uint(2)));
    int _2984 = int(_2980) & 3;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[int(_2982)][_2984];
    int _2988 = int(_2980) + 1;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    int _2992 = _2988 & 3;
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[int(_2990)][_2992];
    if (!_2756)
    {
        _2886 = _2545;
    }
    float _2996 = _2886;
    float _2998 = _2912;
    float _3000 = _2914;
    float _3002 = _2916;
    float _3004 = _2996;
    if (!_2944)
    {
        float _3006 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2912);
        _2998 = _3006;
    }
    float _3008 = _2998;
    if (_2842)
    {
        float _3010 = -_2545;
        float _3012 = _3010 + 1.0;
        _1672 = as_type<int>(_3012);
    }
    int _3014 = _1672;
    float _3016 = _2972 * _2978;
    float _3018 = -_2972;
    float _3020 = _3018 + 1.0;
    float _3022 = as_type<float>(_2575) * _2974;
    if (!_2842)
    {
        _2862 = _2545;
    }
    float _3024 = _2862;
    float _3026 = _3024;
    if (!_2944)
    {
        float _3028 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2914);
        _3000 = _3028;
    }
    float _3030 = _3000;
    if (_2842)
    {
        float _3032 = _2537 ? as_type<float>(_3014) : _2545;
        _3026 = _3032;
    }
    float _3034 = _3026;
    if (!_2944)
    {
        float _3036 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2916);
        _3002 = _3036;
    }
    float _3038 = _3002;
    int _3040 = _2880 & 3;
    bool _3042 = _3040 != 0;
    float _3044 = _2618 * _3020;
    int _3046 = _2880 & 3;
    bool _3048 = _3046 != 0;
    float _3050 = trunc(_3022);
    float _3052 = precise::max(_3050, 0.0);
    uint _3054 = uint(_3052);
    int _3056 = _3042 ? 0 : 1;
    float _3058 = _2900 * _3044;
    bool _3060 = uint(_3046) > 1u;
    float _3062 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3064 = _2948 + 8;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    uint _3068 = uint(int(uint(int(_3066)) >> uint(2)));
    int _3070 = int(_3066) & 3;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[int(_3068)][_3070];
    int _3074 = int(_3066) + 1;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    int _3078 = _3074 & 3;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[int(_3076)][_3078];
    float _3082 = _2934 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3084 = -_2618;
    float _3086 = _3084 + 1.0;
    float _3088 = fma(_3062, _2868, -0.5);
    int _3090 = ~_1244;
    int _3092 = _3090 + 1;
    float _3094 = fma(_3082, _3034, -0.5);
    float _3096 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3058);
    float _3098 = -_1076;
    float _3100 = fma(_1202, _3088, _3098);
    float _3102 = fma(_1232, _3094, _1090);
    int _3104 = ~_3056;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    float _3110 = fma(_2920, _3016, _3096);
    int _3112 = _3108;
    if (!_3060)
    {
        int _3114 = ~_3056;
        int _3116 = _3114 + 1;
        _3112 = _3116;
    }
    int _3118 = _3112;
    float _3120 = abs(_2042);
    float _3122 = log2(_3120);
    int _3124 = int(_2896) + int(_3054);
    float _3126 = -_2492;
    float _3128 = _3126 + 1.0;
    bool _3130 = !_3048;
    int _3132 = _3130 ? 0 : 1;
    float _3134 = _2650 * _2494;
    int _3136 = abs(_3118);
    int _3138 = _3092 * _3124;
    int _3140 = _3138 + _2740;
    bool _3142 = uint(_3046) >= 2u;
    float _3144 = -_2650;
    float _3146 = _3144 + 1.0;
    int _3148 = abs(_3132);
    int _3150 = _3142 ? 0 : 1;
    bool _3152 = _3046 != 3;
    float _3154 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3156 = uint(_3140) >= uint(_1244);
    int _3158 = ~_3136;
    int _3160 = _3158 + 1;
    int _3162 = _3160 + 1;
    float _3164 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3166 = int(_3164);
    int _3168 = ~_3148;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    bool _3174 = !_3156;
    int _3176 = _3174 ? 0 : (-1);
    int _3178 = _3162 * as_type<int>(_2994);
    bool _3180 = _3046 != 3;
    int _3182 = ~_3150;
    int _3184 = _3182 + 1;
    int _3186 = _3184 + 1;
    int _3188 = _3172 * as_type<int>(_2986);
    int _3190 = _3188 + _3178;
    bool _3192 = !_3180;
    int _3194 = _3192 ? 0 : (-1);
    float _3196 = exp2(_3154);
    int _3198 = _3186;
    if (_3152)
    {
        int _3200 = ~_3150;
        int _3202 = _3200 + 1;
        _3198 = _3202;
    }
    int _3204 = _3198;
    bool _3206 = !_2764;
    int _3208 = _3206 ? 0 : 1;
    int _3210 = abs(_3194);
    int _3212 = abs(_3204);
    int _3214 = abs(_3208);
    float _3216 = float(uint(_3166));
    int _3218 = ~_3212;
    int _3220 = _3218 + 1;
    int _3222 = _3220 + 1;
    int _3224 = ~_3124;
    int _3226 = _3224 + _3176;
    int _3228 = _3226 + 1;
    int _3230 = ~_3210;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    int _3236 = _3222 * as_type<int>(_3072);
    int _3238 = _3236 + _3190;
    float _3240 = 1.0 / _3216;
    int _3242 = abs(_3166);
    int _3244 = _1244 * _3228;
    int _3246 = _3244 + _2740;
    int _3248 = ~_3214;
    int _3250 = _3248 + 1;
    int _3252 = _3250 + 1;
    int _3254 = _3234 * as_type<int>(_3080);
    int _3256 = _3254 + _3238;
    float _3258 = float(uint(_3242));
    float _3260 = fma(_2960, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3110);
    bool _3262 = !_2531;
    int _3264 = _3262 ? _3246 : (-1);
    int _3266 = _3256 * _3252;
    float _3268 = 1.0 / _3258;
    float _3270 = _3260 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3272 = _3264 * _3214;
    int _3274 = _3272 + _3266;
    float _3276 = _3100 + 0.5;
    float _3278 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3280 = precise::clamp(_3278, 0.0, 1.0);
    int _3282 = as_type<int>(_3240) + (-2);
    int _3284 = _3214;
    if (_2756)
    {
        float _3286 = -_2545;
        float _3288 = _3286 + 1.0;
        _3284 = as_type<int>(_3288);
    }
    int _3290 = _3284;
    int _3292 = abs(_3274);
    float _3294 = float(uint(_3274));
    float _3296 = _3102 + 0.5;
    float _3298 = fma(_3280, -2.0, 3.0);
    int _3300 = as_type<int>(_3268) + (-2);
    float _3302 = _3280 * _3280;
    float _3304 = float(uint(_3292));
    float _3306 = as_type<float>(_3282) * _3294;
    if (_2756)
    {
        float _3308 = _2890 ? as_type<float>(_3290) : _2545;
        _3004 = _3308;
    }
    float _3310 = _3004;
    float _3312 = _3302 * _3298;
    int _3314 = ~_3242;
    int _3316 = _3314 + 1;
    float _3318 = as_type<float>(_3300) * _3304;
    int _3320 = ~_3166;
    int _3322 = _3320 + 1;
    float _3324 = trunc(_3306);
    float _3326 = precise::max(_3324, 0.0);
    uint _3328 = uint(_3326);
    float _3330 = -_3312;
    float _3332 = _3330 + 1.0;
    out.m_81.x = _3296;
    out.m_81.y = _3276;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3312);
    float _3336 = trunc(_3318);
    float _3338 = precise::max(_3336, 0.0);
    uint _3340 = uint(_3338);
    float _3342 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3344 = _1520 * _1484;
    float _3346 = _2561 * _3334;
    float _3348 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3350 = _3342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3352 = _3322 * int(_3328);
    int _3354 = _3352 + _3274;
    float _3356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3358 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3360 = _1520 * _1486;
    float _3362 = _1520 * _1482;
    float _3364 = float(uint(_3354));
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3368 = -_1528;
    float _3370 = fma(_3368, _1602, _3344);
    int _3372 = _3316 * int(_3340);
    int _3374 = _3372 + _3292;
    int _3376 = ~_3242;
    int _3378 = _3376 + 1;
    float _3380 = as_type<float>(_3282) * _3364;
    out.m_83.x = _3350;
    out.m_83.y = _3358;
    out.m_83.z = _3366;
    out.m_83.w = _3270;
    float _3382 = _1560 * _1486;
    float _3384 = float(uint(_3374));
    float _3386 = -_1528;
    float _3388 = fma(_3386, _1608, _3360);
    float _3390 = -_1528;
    float _3392 = fma(_3390, _1598, _3362);
    float _3394 = trunc(_3380);
    float _3396 = precise::max(_3394, 0.0);
    uint _3398 = uint(_3396);
    float _3400 = fma(_1518, _1608, _3382);
    float _3402 = as_type<float>(_3300) * _3384;
    float _3404 = _1560 * _1484;
    float _3406 = _1560 * _1482;
    float _3408 = _1568 * _1486;
    float _3410 = _1568 * _1482;
    float _3412 = fma(_1518, _1602, _3404);
    float _3414 = trunc(_3402);
    float _3416 = precise::max(_3414, 0.0);
    uint _3418 = uint(_3416);
    float _3420 = _1516 * _850;
    float _3422 = _1580 * _850;
    float _3424 = _1580 * _910;
    float _3426 = _1588 * _850;
    float _3428 = _3420 + _3370;
    int _3430 = ~_3166;
    int _3432 = _3430 + 1;
    float _3434 = _3422 + _3412;
    int _3436 = int(_3328) + int(_3398);
    float _3438 = _1516 * _910;
    float _3440 = _1516 * _852;
    float _3442 = _3428 * _3030;
    float _3444 = _1580 * _852;
    int _3446 = _3432 * _3436;
    int _3448 = _3446 + _3274;
    float _3450 = _3424 + _3400;
    int _3452 = _3274 ^ _3166;
    float _3454 = _3438 + _3388;
    int _3456 = int(_3340) + int(_3418);
    float _3458 = _3440 + _3392;
    bool _3460 = uint(_3448) >= uint(_3166);
    float _3462 = _3454 * _3030;
    uint _3464 = uint(int(uint(_3452) >> uint(31)));
    int _3466 = _3378 * _3456;
    int _3468 = _3466 + _3292;
    float _3470 = _3426 + _2567;
    bool _3472 = !_3460;
    int _3474 = _3472 ? 0 : (-1);
    float _3476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3478 = ~int(_3464);
    int _3480 = _3478 + 1;
    float _3482 = _3458 * _3030;
    bool _3484 = uint(_3468) >= uint(_3242);
    float _3486 = fma(_1518, _1598, _3406);
    int _3488 = ~_3436;
    int _3490 = _3488 + _3474;
    int _3492 = _3490 + 1;
    float _3494 = fma(_1522, _1608, _3408);
    bool _3496 = !_3484;
    int _3498 = _3496 ? 0 : (-1);
    float _3500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3502 = _3166 == 0;
    int _3504 = _3166 * _3492;
    int _3506 = _3504 + _3274;
    int _3508 = ~_3498;
    int _3510 = _3456 + _3508;
    int _3512 = _3510 + 1;
    float _3514 = _1588 * _852;
    bool _3516 = _3166 == 0;
    float _3518 = fma(_1522, _1598, _3410);
    int _3520 = _3512 ^ _3480;
    float _3522 = _3476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3524 = !_3502;
    int _3526 = _3524 ? _3506 : (-1);
    float _3528 = _1588 * _910;
    int _3530 = ~_3480;
    int _3532 = _3530 + _3520;
    int _3534 = _3532 + 1;
    float _3536 = _3444 + _3486;
    float _3538 = float(_3526);
    float _3540 = _3514 + _3518;
    bool _3542 = !_3516;
    int _3544 = _3542 ? _3534 : (-1);
    float _3546 = _3500 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3548 = _3528 + _3494;
    float _3550 = fma(_3434, _3008, _3442);
    float _3552 = float(_3544);
    float _3554 = fma(_3450, _3008, _3462);
    float _3556 = fma(_3536, _3008, _3482);
    float _3558 = fma(_3546, _2838, -0.5);
    float _3560 = fma(_3522, _3310, -0.5);
    float _3562 = -_804;
    float _3564 = fma(_3546, _3552, _3562);
    float _3566 = fma(_3522, _3538, _1150);
    float _3568 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3570 = fma(_3470, _3038, _3550);
    float _3572 = fma(_3548, _3038, _3554);
    float _3574 = fma(_3540, _3038, _3556);
    float _3576 = fma(_1256, _3558, _3564);
    float _3578 = in.m_85.x;
    float _3580 = _3128 * _3568;
    float _3582 = precise::clamp(_3580, 0.0, 1.0);
    float _3584 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2591);
    float _3586 = fma(_1228, _3560, _3566);
    float _3588 = _2416 * 0.5;
    float _3590 = -_3582;
    float _3592 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3594 = _3584 + _2416;
    float _3596 = _2458 + _2416;
    float _3598 = _2509 * _3134;
    float _3600 = _2519 * _3134;
    float _3602 = fma(_2478, -0.5, _3588);
    float _3604 = _3594 * 0.5;
    float _3606 = _3596 * 0.5;
    float _3608 = fma(_2515, _3598, _2503);
    float _3610 = fma(_2517, _3598, _2505);
    float _3612 = _2509 * _3146;
    float _3614 = fma(_2509, _3600, _2507);
    out.m_87.x = _3606;
    out.m_87.y = _3602;
    out.m_87.z = _3604;
    out.m_87.w = _2416;
    bool _3616 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3618 = isnan(_2184);
    bool _3620 = _3616 || _3618;
    bool _3622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3624 = _3620 || _3622;
    float _3626 = _3586 + 0.5;
    float _3628 = _3576 + 0.5;
    out.m_89.x = _3608;
    out.m_89.y = _3610;
    out.m_89.z = _3614;
    out.m_89.w = _3612;
    float _3630 = _3592 * _3578;
    out.m_91.x = _3570;
    out.m_91.y = _3572;
    out.m_91.z = _3574;
    float _3632 = _3630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3634 = _2100 * _2162;
    out.gl_Position.x = _2458;
    out.gl_Position.y = _2478;
    out.gl_Position.z = _3584;
    out.gl_Position.w = _2416;
    float _3636 = _3578;
    float _3638 = _3628;
    float _3640 = _3626;
    float _3642 = _3632;
    float _3644 = _3634;
    if (!_3624)
    {
        _3636 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3646 = _3636;
    out.m_93.x = _3626;
    out.m_93.y = _3628;
    out.m_95.x = _3632;
    float _3648 = _3634 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3650 = _3646;
    float _3652 = _3646;
    if (!_3624)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3654 = _2864;
    float _3656 = _3654;
    float _3658 = _3654;
    if (!_3624)
    {
        _3638 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3660 = _3638;
    float _3662 = _3660;
    float _3664 = _3660;
    if (!_3624)
    {
        _3640 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3666 = _3640;
    float _3668 = _3666;
    float _3670 = _3666;
    if (!_3624)
    {
        _3642 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3672 = _3642;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3624)
    {
        _3644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3678 = _3644;
    bool _3680 = !_3624;
    float _3682 = _3678;
    float _3684 = _3678;
    if (!_3680)
    {
        bool _3686 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3688 = isnan(_2184);
        bool _3690 = _3686 || _3688;
        bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3694 = _3690 || _3692;
        if (!_3694)
        {
            float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3698 = _2184 + _3696;
            float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3702 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3700;
            float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3706 = _3704 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3708 = 1.0 / _3702;
            float _3710 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3712 = _3710 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3714 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3716 = _3714 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3720 = _3718 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3726 = _3698 * _3708;
            float _3728 = precise::clamp(_3726, 0.0, 1.0);
            float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3734 = fma(_3728, _3706, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3736 = fma(_3728, _3732, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3738 = fma(_3728, _3712, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3740 = fma(_3728, _3716, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3742 = fma(_3728, _3720, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3744 = fma(_3728, _3724, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3658 = _3738;
            _3676 = _3742;
            _3652 = _3734;
            _3670 = _3740;
            _3664 = _3736;
            _3684 = _3744;
            _3746 = true;
        }
        else
        {
            bool _3748 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3750 = isnan(_2184);
            bool _3752 = _3748 || _3750;
            bool _3754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3756 = _3752 || _3754;
            if (!_3756)
            {
                _3650 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3758 = _3650;
            _3652 = _3758;
            if (!_3756)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3760 = _3656;
            _3658 = _3760;
            if (!_3756)
            {
                _3662 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3762 = _3662;
            _3664 = _3762;
            if (!_3756)
            {
                _3668 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3764 = _3668;
            _3670 = _3764;
            if (!_3756)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3766 = _3674;
            _3676 = _3766;
            if (!_3756)
            {
                _3682 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3768 = _3682;
            bool _3770 = !_3756;
            _3684 = _3768;
            if (!_3770)
            {
                bool _3772 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3774 = isnan(_2184);
                bool _3776 = _3772 || _3774;
                bool _3778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3780 = _3776 || _3778;
                if (!_3780)
                {
                    float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3784 = _2184 + _3782;
                    float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3788 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3786;
                    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3792 = _3790 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3794 = 1.0 / _3788;
                    float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3812 = _3784 * _3794;
                    float _3814 = precise::clamp(_3812, 0.0, 1.0);
                    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3820 = fma(_3814, _3792, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3822 = fma(_3814, _3818, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3824 = fma(_3814, _3798, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3826 = fma(_3814, _3802, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3828 = fma(_3814, _3806, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3830 = fma(_3814, _3810, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3658 = _3824;
                    _3676 = _3828;
                    _3652 = _3820;
                    _3670 = _3826;
                    _3664 = _3822;
                    _3684 = _3830;
                    _3746 = true;
                }
                else
                {
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3652 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3670 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3664 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3684 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3746 = false;
    float _3832 = _3658;
    float _3834 = _3676;
    float _3836 = _3652;
    float _3838 = _3670;
    float _3840 = _3664;
    float _3842 = _3684;
    float _3844 = fma(_3572, -0.5, 0.5);
    float _3846 = precise::clamp(_3844, 0.0, 1.0);
    float _3848 = -_3832;
    float _3850 = _3848 + _3834;
    float _3852 = _3648 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3854 = -_3836;
    float _3856 = _3854 + _3838;
    float _3858 = fma(_3846, _3850, _3832);
    out.m_97.x = 0.0;
    float _3860 = -_3840;
    float _3862 = _3860 + _3842;
    float _3864 = fma(_3846, _3856, _3836);
    float _3866 = _3858 * 0.586610972881317138671875;
    out.m_49.x = _3852;
    bool _3868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3870 = fma(_3846, _3862, _3840);
    float _3872 = fma(_3864, 0.298911988735198974609375, _3866);
    bool _3874 = _2100 > 0.0;
    bool _3876 = isnan(_2100);
    bool _3878 = _3874 || _3876;
    bool _3880 = isnan(0.0);
    bool _3882 = _3878 || _3880;
    float _3884 = fma(_3870, 0.114477999508380889892578125, _3872);
    bool _3886 = _2162 <= 0.0;
    bool _3888 = !_3882;
    bool _3890 = _3886 || _3888;
    float _3892 = -_3884;
    float _3894 = _3864 + _3892;
    float _3896 = -_3884;
    float _3898 = _3858 + _3896;
    float _3900 = -_3884;
    float _3902 = _3870 + _3900;
    float _3904 = fma(_3894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    float _3906 = fma(_3898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    float _3908 = fma(_3902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    bool _3910 = !_3868;
    if (!_3910)
    {
        float _3912 = -_2028;
        float _3914 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3916 = -_2030;
        float _3918 = _3916 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3920 = -_2032;
        float _3922 = _3920 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3924 = _3914 * _3914;
        float _3926 = fma(_3918, _3918, _3924);
        float _3928 = fma(_3922, _3922, _3926);
        float _3930 = sqrt(_3928);
        float _3932 = rsqrt(_3928);
        float _3934 = -_3930;
        float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3938 = _3936 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3940 = precise::clamp(_3938, 0.0, 1.0);
        float _3942 = _3918 * _3932;
        float _3944 = _3914 * _3932;
        float _3946 = abs(_3940);
        float _3948 = log2(_3946);
        float _3950 = _3922 * _3932;
        float _3952 = _3942 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3954 = _3572 * _3944;
        float _3956 = -_3944;
        float _3958 = -_3952;
        float _3960 = fma(_3956, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3958);
        float _3962 = fma(_3570, _3942, _3954);
        float _3964 = -_3950;
        float _3966 = fma(_3964, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3960);
        float _3968 = fma(_3574, _3950, _3962);
        float _3970 = precise::clamp(_3968, 0.0, 1.0);
        float _3972 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3974 = _3966 + _3972;
        float _3976 = _3948 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3978 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3980 = precise::clamp(_3978, 0.0, 1.0);
        float _3982 = exp2(_3976);
        float _3984 = _3982 * _3980;
        float _3986 = _3970 * _3984;
        float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3990 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3992 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3988;
        out.m_97.y = _3990;
        out.m_97.z = _3992;
    }
    out.m_67.x = _3904;
    out.m_67.y = _3906;
    out.m_67.z = _3908;
    if (!_3890)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3994 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3994;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3746 = false;
    bool _716 = false;
    bool _538 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4051 = as_type<float>(_132);
        out.gl_Position.z = _4051;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4121 = as_type<float>(_170);
        out.gl_Position.z = _4121;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_53.x;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _176 = _150 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _178 = _150 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _188 = _176 * _174;
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _192 = _178 * _186;
    float _194 = floor(_190);
    float _196 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].y, _192);
    float _198 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _200 = _190 * 6.283185482025146484375;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _208 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _210 = floor(_196);
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _214 = _212 != 0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _218 = _216 != 0;
    float _220 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _206);
    float _222 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _208);
    float _224 = _200 * 0.15915493667125701904296875;
    float _226 = _196 * 6.283185482025146484375;
    float _228 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _198);
    float _230 = -_194;
    float _232 = _190 + _230;
    bool _234 = !_214;
    int _236 = _234 ? 0 : 1;
    float _238 = _226 * 0.15915493667125701904296875;
    float _240 = _224 * 6.283185482025146484375;
    float _242 = cos(_240);
    int _244 = abs(_236);
    bool _246 = !_204;
    int _248 = _246 ? 0 : 1;
    float _250 = -_210;
    float _252 = _196 + _250;
    float _254 = _238 * 6.283185482025146484375;
    float _256 = cos(_254);
    int _258 = abs(_248);
    float _260 = -_232;
    float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _264 = float(_244);
    float _266 = -_252;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _272 = !_218;
    int _274 = _272 ? 0 : 1;
    float _276 = fma(_242, 0.5, 0.5);
    bool _278 = _252 < 0.5;
    float _280 = float(_278);
    float _282 = abs(_262);
    float _284 = _264 * _282;
    float _286 = abs(_268);
    float _288 = _264 * _286;
    bool _290 = _232 < 0.5;
    float _292 = float(_290);
    float _294 = -_276;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _298 = abs(_274);
    float _300 = -_280;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _304 = fma(_256, 0.5, 0.5);
    float _306 = float(_258);
    float _308 = -_292;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = float(_298);
    float _314 = -_304;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _318 = fma(_306, _296, _284);
    float _320 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _228);
    float _322 = fma(_306, _316, _288);
    float _324 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _220);
    float _326 = abs(_310);
    float _328 = fma(_312, _326, _318);
    float _330 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _222);
    float _332 = abs(_302);
    float _334 = fma(_312, _332, _322);
    bool _336 = !_270;
    float _338 = _324;
    float _340 = _320;
    float _342 = _330;
    float _358;
    if (!_336)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_116);
        float _364 = 1.0 / _362;
        float _366 = _150 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _368 + _370;
    bool _374 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _368 + _386;
    bool _390 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_368);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _410 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _412 = isnan(_368);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -_384;
    float _424 = _422 + 1.0;
    float _426 = 1.0 / _408;
    float _428 = _420 * _424;
    float _430 = -_420;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _404;
    float _442 = _400 * _432;
    float _444 = -_400;
    float _446 = _444 + 1.0;
    float _448 = _388 * _426;
    float _450 = _372 * _440;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _456;
    float _460 = fma(_436, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_454, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = fma(_458, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    float _472 = _460 * _442;
    float _474 = _462 * _442;
    float _476 = _464 * _442;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _492 = fma(_480, _448, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_484, _448, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _498 = fma(_488, _448, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _502 = fma(_492, _428, _490);
    float _504 = fma(_494, _428, _496);
    float _506 = fma(_498, _428, _500);
    float _508 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].x, _502);
    float _510 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].y, _504);
    float _512 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[145].z, _506);
    float _514 = _508 * _466;
    float _516 = _510 * _468;
    float _518 = _512 * _470;
    bool _520 = !_438;
    float _536;
    if (!_520)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _172 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_116);
        float _542 = 1.0 / _540;
        float _544 = _150 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _562 = isnan(_546);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _576 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_546);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = 1.0 / _554;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -_570;
    float _596 = _594 + 1.0;
    bool _598 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _600 = isnan(_546);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _612 = 1.0 / _558;
    float _614 = 1.0 / _574;
    float _616 = _592 * _588;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = _586 * _596;
    float _624 = -_586;
    float _626 = _624 + 1.0;
    float _628 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _630 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _632 = isnan(_546);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = _608 * _626;
    float _644 = _620 * _612;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _546 + _650;
    float _654 = _628 * _642;
    float _656 = -_608;
    float _658 = _656 + 1.0;
    float _660 = -_640;
    float _662 = _660 + 1.0;
    float _664 = fma(_644, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = _648 * _614;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _546 + _668;
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[115].x, _654);
    float _674 = _570 * _662;
    float _676 = fma(_666, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _678 = fma(_664, _622, _672);
    float _680 = fma(_676, _674, _678);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[118].x, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _690;
    out.m_59.y = _692;
    out.m_59.z = _694;
    out.m_59.w = _696;
    bool _698 = !_610;
    float _714;
    if (!_698)
    {
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _702 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_116);
        float _720 = 1.0 / _718;
        float _722 = _150 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = in.m_46.x;
    float _728 = in.m_46.y;
    float _730 = in.m_46.z;
    float _732 = _328 * _514;
    float _734 = in.m_53.y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = in.m_53.z;
    float _744 = _334 * _516;
    float _746 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _752 = _728 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _754 = _728 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _756 = _728 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _758 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[5].x, _752);
    float _760 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[4].x, _754);
    float _762 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[6].x, _756);
    float _764 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[5].z, _758);
    float _766 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    float _768 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[6].z, _762);
    float _770 = _172 * 2.0;
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _774 = _766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _780 = -_772;
    float _782 = _780 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _784 = -_774;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = -_776;
    float _790 = _788 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _792 = floor(_770);
    float _794 = _782 * _782;
    float _796 = fma(_778, -2.0, _736);
    float _798 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = fma(_786, _786, _794);
    float _804 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _806 = -_800;
    float _808 = fma(_798, 2.0, _806);
    float _810 = fma(_790, _790, _802);
    float _812 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _814 = rsqrt(_810);
    float _816 = -_812;
    float _818 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _816);
    bool _820 = _792 > 0.0;
    bool _822 = _792 >= 0.0;
    bool _824 = isnan(_792);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _834 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _836 = _734 * 2.0;
    float _838 = -_832;
    float _840 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _838);
    float _842 = -_834;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _842);
    float _846 = floor(_836);
    float _848 = _172 + _734;
    float _850 = _786 * _814;
    float _852 = _790 * _814;
    float _854 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _856 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _858 = _850 * _850;
    float _860 = _848 + (-1.0);
    float _862 = -_854;
    float _864 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _862);
    float _866 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _868 = fma(_852, _852, _858);
    float _870 = -_856;
    float _872 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _870);
    float _874 = _742 * 2.0;
    float _876 = -_866;
    float _878 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _876);
    float _880 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _882 = _734 + _742;
    float _884 = rsqrt(_868);
    bool _886 = _846 > 0.0;
    float _888 = _844 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _890 = _846 >= 0.0;
    bool _892 = isnan(_846);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = _882 + (-1.0);
    float _902 = _840 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _904 = -_888;
    float _906 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[1].x, _904);
    float _908 = floor(_874);
    float _910 = _782 * _814;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _914 = -_902;
    float _916 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[1].y, _914);
    float _918 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].w, _906);
    float _920 = _844 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _922 = _872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[1].w, _916);
    float _926 = _852 * _884;
    float _928 = _850 * _884;
    float _930 = _918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _932 = -_920;
    float _934 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _936 = -_926;
    float _938 = _852 * _936;
    float _940 = -_922;
    float _942 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[1].x, _940);
    float _944 = -_930;
    float _946 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _948 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].w, _934);
    float _950 = -_938;
    float _952 = fma(_850, _928, _950);
    float _954 = _910 * _928;
    float _956 = -_926;
    float _958 = _910 * _956;
    bool _960 = _908 > 0.0;
    float _962 = _952 * _952;
    bool _964 = _908 >= 0.0;
    bool _966 = isnan(_908);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].z, _946);
    float _976 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _942);
    float _978 = fma(_954, _954, _962);
    float _980 = _844 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _982 = _840 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _984 = -_976;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].w, _974);
    float _988 = fma(_958, _958, _978);
    float _990 = -_980;
    float _992 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[0].x, _990);
    float _994 = _976;
    float _996 = _974;
    if (_740)
    {
        _994 = _172;
    }
    float _998 = _994;
    float _1000 = 1.0 / _986;
    float _1002 = _998;
    if (!_740)
    {
        _1002 = _742;
    }
    float _1004 = _1002;
    float _1006 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].w, _992);
    float _1008 = -_982;
    float _1010 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1008);
    float _1012 = _844 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1014 = _830 ? 0 : 1;
    float _1016 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_740)
    {
        _996 = _734;
    }
    float _1018 = _996;
    float _1020 = rsqrt(_988);
    float _1022 = -_1012;
    float _1024 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1022);
    float _1026 = _1018;
    if (!_740)
    {
        _1026 = _172;
    }
    float _1028 = _1026;
    float _1030 = -_750;
    float _1032 = fma(_1016, 2.0, _1030);
    int _1034 = ~_1014;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1042 = _1038;
    if (!_820)
    {
        int _1044 = ~_1014;
        int _1046 = _1044 + 1;
        _1042 = _1046;
    }
    int _1048 = _1042;
    float _1050 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1052 = log2(_1050);
    float _1054 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1010);
    float _1056 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1058 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1024);
    int _1060 = _972 ? 0 : 1;
    float _1062 = fma(_1006, _1000, -1.0);
    float _1064 = fma(_1056, -2.0, _1040);
    float _1066 = _952 * _1020;
    float _1068 = precise::clamp(_1066, 0.0, 1.0);
    float _1070 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1072 = int(_1070);
    int _1074 = _898 ? 0 : 1;
    float _1076 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1064);
    float _1078 = -_1068;
    float _1080 = _1078 + 1.0;
    int _1082 = ~_1060;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = -_150;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1032);
    int _1092 = _1086;
    if (!_960)
    {
        int _1094 = ~_1060;
        int _1096 = _1094 + 1;
        _1092 = _1096;
    }
    int _1098 = _1092;
    float _1100 = _1052 * _150;
    float _1102 = _1080 * _1000;
    float _1104 = fma(_1080, _1062, 1.0);
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1116 = _1114 != 0;
    float _1118 = exp2(_1100);
    float _1120 = _1054 * _1102;
    float _1122 = _1058 * _1102;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1126 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1134 = _1130 || _1132;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1138 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1140 = isnan(1.0);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1146 = _1142 || _1144;
    float _1148 = -_150;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _1152 = _1104 * _1104;
    bool _1154 = !_1112;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1160 = !_1108;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = fma(_1120, _1120, _1152);
    bool _1166 = !_1116;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1124);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1182 = _1180 != 0;
    float _1184 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1136);
    float _1186 = float(_1072);
    float _1188 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1158);
    float _1190 = fma(_1122, _1122, _1164);
    bool _1192 = !_1178;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = 1.0 / _1186;
    bool _1198 = !_1174;
    int _1200 = _1198 ? 0 : 1;
    float _1202 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1170);
    int _1204 = ~_1074;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1212 = 1.0 + _1210;
    int _1214 = _1208;
    if (!_886)
    {
        int _1216 = ~_1074;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    float _1222 = -_1118;
    float _1224 = _1222 + 1.0;
    float _1226 = rsqrt(_1190);
    float _1228 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1184);
    int _1230 = abs(_1194);
    float _1232 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1188);
    int _1234 = abs(_1200);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1240 = _772 + _1238;
    float _1242 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1244 = int(_1242);
    float _1246 = float(_1048);
    float _1248 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1236);
    float _1250 = float(_1230);
    float _1252 = _1196 * _150;
    float _1254 = _1134 ? _1224 : 0.0;
    float _1256 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1248);
    float _1258 = float(_1234);
    float _1260 = 1.0 / _1212;
    float _1262 = _1122 * _1226;
    float _1264 = _1104 * _1226;
    float _1266 = _1120 * _1226;
    float _1268 = float(_1098);
    float _1270 = -_1262;
    float _1272 = _850 * _1270;
    float _1274 = _852 * _1264;
    float _1276 = _1240 * _1240;
    float _1278 = float(_1244);
    float _1280 = _1250 * _1246;
    float _1282 = -_1266;
    float _1284 = -_1272;
    float _1286 = fma(_852, _1282, _1284);
    float _1288 = in.m_61.x;
    float _1290 = in.m_61.y;
    float _1292 = in.m_61.z;
    float _1294 = -_1262;
    float _1296 = -_1274;
    float _1298 = fma(_910, _1294, _1296);
    float _1300 = _1278 * _150;
    float _1302 = -_1266;
    float _1304 = _910 * _1302;
    float _1306 = _1286 * _1286;
    if (_1146)
    {
        float _1308 = _1254 * _1260;
        _152 = _1308;
    }
    float _1310 = _152;
    float _1312 = _1258 * _1268;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1316 = _774 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _776 + _1318;
    float _1322 = -_1304;
    float _1324 = fma(_850, _1264, _1322);
    float _1326 = fma(_1298, _1298, _1306);
    float _1328 = fma(_1316, _1316, _1276);
    float _1330 = _1280 * (-2.0);
    float _1332 = _734 + (-0.5);
    float _1334 = fma(_1324, _1324, _1326);
    float _1336 = fma(_1320, _1320, _1328);
    bool _1338 = !_1182;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = fma(_912, _1330, _912);
    float _1344 = rsqrt(_1334);
    float _1346 = _1312 * (-2.0);
    int _1348 = abs(_1340);
    float _1350 = float(_1220);
    float _1352 = fma(_1330, _1290, _1290);
    float _1354 = float(_1348);
    float _1356 = sqrt(_1336);
    float _1358 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1360 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1362 = fma(_1346, _1288, _1288);
    float _1364 = _172 + _742;
    float _1366 = _1354 * _1350;
    float _1368 = fma(_1342, _1310, _1360);
    float _1370 = fma(_880, _1346, _880);
    float _1372 = rsqrt(_1336);
    float _1374 = _1368 * 0.15915493667125701904296875;
    float _1376 = _172 + (-0.5);
    float _1378 = _1364 + (-1.0);
    float _1380 = _1298 * _1344;
    float _1382 = _1366 * (-2.0);
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1362);
    float _1386 = _1358 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1388 = _1356 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1392 = _1286 * _1344;
    float _1394 = _1324 * _1344;
    float _1396 = _852 * _1380;
    float _1398 = precise::min(_1386, _1388);
    float _1400 = fma(_1382, _1292, _1292);
    float _1402 = _910 * _1394;
    float _1404 = _850 * _1392;
    float _1406 = -_1396;
    float _1408 = fma(_850, _1394, _1406);
    float _1410 = _1372 * _1398;
    float _1412 = -_1402;
    float _1414 = fma(_852, _1392, _1412);
    float _1416 = -_1404;
    float _1418 = fma(_910, _1380, _1416);
    float _1420 = _1408 * _1408;
    float _1422 = _742 + (-0.5);
    float _1424 = _1240 * _1410;
    float _1426 = _1316 * _1410;
    float _1428 = fma(_1414, _1414, _1420);
    float _1430 = fma(_1390, _1382, _1390);
    float _1432 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1400);
    float _1434 = -_1424;
    float _1436 = _1240 + _1434;
    float _1438 = fma(_1370, _1310, _1384);
    float _1440 = fma(_1418, _1418, _1428);
    float _1442 = fma(_1430, _1310, _1432);
    float _1444 = -_1426;
    float _1446 = _1316 + _1444;
    float _1448 = _1436 * _1436;
    float _1450 = _1320 * _1410;
    float _1452 = _1374 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1438 * 0.15915493667125701904296875;
    float _1458 = fma(_1446, _1446, _1448);
    float _1460 = -_1450;
    float _1462 = _1320 + _1460;
    float _1464 = _1442 * 0.15915493667125701904296875;
    float _1466 = fma(_1462, _1462, _1458);
    float _1468 = _1374 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = rsqrt(_1440);
    float _1474 = _1456 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = _1456 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _1418 * _1472;
    float _1484 = _1414 * _1472;
    float _1486 = _1408 * _1472;
    float _1488 = _850 * _1482;
    float _1490 = _1464 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = in.m_63.x;
    float _1496 = in.m_63.y;
    float _1498 = in.m_63.z;
    float _1500 = _1476 * _1454;
    float _1502 = _1476 * _1470;
    float _1504 = -_1488;
    float _1506 = fma(_852, _1484, _1504);
    float _1508 = sqrt(_1466);
    float _1510 = _1480 * _1470;
    float _1512 = _1480 * _1454;
    float _1514 = _1506 * _1506;
    float _1516 = _1476 * _1492;
    float _1518 = _1470 * _1492;
    float _1520 = _1480 * _1492;
    float _1522 = _1454 * _1492;
    float _1524 = _852 * _1486;
    float _1526 = _1464 * 6.283185482025146484375;
    float _1528 = sin(_1526);
    float _1530 = _1372 * _1508;
    float _1532 = _910 * _1484;
    float _1534 = -_1524;
    float _1536 = fma(_910, _1482, _1534);
    float _1538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1494);
    float _1540 = _748 * _1530;
    float _1542 = -_1532;
    float _1544 = fma(_850, _1486, _1542);
    float _1546 = fma(_1536, _1536, _1514);
    float _1548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1496);
    float _1550 = _1358 * _1530;
    float _1552 = _746 * _1530;
    float _1554 = fma(_1544, _1544, _1546);
    float _1556 = _1540 * _1548;
    float _1558 = _1550 * _1538;
    float _1560 = fma(_1528, _1510, _1500);
    float _1562 = rsqrt(_1554);
    float _1564 = _1520 * _1556;
    float _1566 = -_1502;
    float _1568 = fma(_1528, _1512, _1566);
    float _1570 = _1552 * _1498;
    float _1572 = -_1556;
    float _1574 = _1528 * _1572;
    float _1576 = fma(_1560, _1558, _1564);
    float _1578 = -_1512;
    float _1580 = fma(_1528, _1502, _1578);
    float _1582 = _1516 * _1556;
    float _1584 = fma(_1518, _1558, _1574);
    float _1586 = fma(_1568, _1570, _1576);
    float _1588 = fma(_1528, _1500, _1510);
    float _1590 = fma(_1580, _1558, _1582);
    float _1592 = fma(_1522, _1570, _1584);
    float _1594 = _1482 * _1586;
    float _1596 = fma(_1588, _1570, _1590);
    float _1598 = _1544 * _1562;
    float _1600 = _1484 * _1586;
    float _1602 = _1536 * _1562;
    float _1604 = _1486 * _1586;
    float _1606 = fma(_1598, _1592, _1594);
    float _1608 = _1506 * _1562;
    float _1610 = fma(_1602, _1592, _1600);
    float _1612 = -_1424;
    float _1614 = _772 + _1612;
    float _1616 = fma(_852, _1596, _1606);
    float _1618 = fma(_1608, _1592, _1604);
    float _1620 = fma(_850, _1596, _1610);
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1624 = _776 + _1616;
    float _1626 = fma(_910, _1596, _1618);
    float _1628 = _774 + _1620;
    float _1630 = -_1450;
    float _1632 = _776 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1636 = _1624 + _1634;
    float _1638 = _772 + _1626;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1642 = _1628 + _1640;
    float _1644 = _1636 * _1636;
    float _1646 = fma(_1642, _1642, _1644);
    float _1648 = -_1426;
    float _1650 = _774 + _1648;
    float _1652 = sqrt(_1646);
    float _1654 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1622);
    float _1656 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1654);
    bool _1658 = _1652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = _1626;
    float _1662 = _1628;
    float _1664 = _1596;
    float _1666 = _1424;
    float _1668 = _1450;
    float _1670 = _1646;
    int _1672 = as_type<int>(_1494);
    if (!_1658)
    {
        _1660 = _1628;
    }
    float _1674 = _1660;
    float _1676 = _1674;
    if (!_1658)
    {
        _1662 = _1624;
    }
    float _1678 = _1662;
    float _1680 = _1678;
    if (!_1658)
    {
        _1664 = _1638;
    }
    float _1682 = _1664;
    bool _1684 = !_1658;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1652 + _1690;
        float _1694 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1646);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1642, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1636, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1638, _1708, _1720);
        _1686 = _1722;
        _1676 = _1716;
        _1680 = _1718;
    }
    float _1724 = _1686;
    float _1726 = _1676;
    float _1728 = _1680;
    float _1730 = -_772;
    float _1732 = _1730 + _1724;
    float _1734 = -_774;
    float _1736 = _1734 + _1726;
    float _1738 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1740 = _1614 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1742 = _1732 * _1732;
    float _1744 = -_776;
    float _1746 = _1744 + _1728;
    float _1748 = 1.0 / _1738;
    float _1750 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1740);
    float _1752 = fma(_1736, _1736, _1742);
    float _1754 = -_1426;
    float _1756 = _1754 + _1726;
    float _1758 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1750);
    float _1760 = fma(_1746, _1746, _1752);
    float _1762 = -_1450;
    float _1764 = _1762 + _1728;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1768 = sqrt(_1760);
    float _1770 = _1766 + _1738;
    float _1772 = _1770 * _1748;
    float _1774 = _1772 * 0.5;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1778 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1776);
    float _1780 = 1.0 / _1778;
    bool _1782 = _1768 > 0.0;
    bool _1784 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.5);
    bool _1792 = _1788 || _1790;
    bool _1794 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan(0.5);
    bool _1802 = _1798 || _1800;
    float _1804 = -_1424;
    float _1806 = _1804 + _1724;
    float _1808 = _1728;
    float _1810 = _1724;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1814 = _1738;
    float _1816 = _1778;
    float _1818 = _1732;
    float _1820 = _1806;
    if (!_1782)
    {
        _1666 = _1756;
    }
    float _1822 = _1666;
    float _1824 = _1822;
    float _1826 = _1822;
    if (!_1782)
    {
        _1808 = _1806;
    }
    float _1828 = _1808;
    float _1830 = _1828;
    if (!_1782)
    {
        _1668 = _1764;
    }
    float _1832 = _1668;
    bool _1834 = !_1782;
    float _1836 = _1832;
    if (!_1834)
    {
        float _1838 = _320 * _320;
        float _1840 = rsqrt(_1760);
        float _1842 = fma(_324, _324, _1838);
        float _1844 = fma(_330, _330, _1842);
        float _1846 = sqrt(_1844);
        float _1848 = _1736 * _1840;
        float _1850 = _1732 * _1840;
        float _1852 = _1746 * _1840;
        bool _1854 = _1846 > 0.0;
        float _1856 = _1840;
        float _1858 = _1846;
        _1810 = _1844;
        _1812 = _1848;
        if (!_1854)
        {
            _1824 = _1756;
        }
        float _1860 = _1824;
        _1826 = _1860;
        if (!_1854)
        {
            _1856 = _1806;
        }
        float _1862 = _1856;
        _1830 = _1862;
        if (!_1854)
        {
            _1858 = _1764;
        }
        float _1864 = _1858;
        bool _1866 = !_1854;
        _1836 = _1864;
        if (!_1866)
        {
            float _1868 = rsqrt(_1844);
            float _1870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1872 = _320 * _1868;
            float _1874 = _324 * _1868;
            float _1876 = _330 * _1868;
            float _1878 = _1850 * _1872;
            float _1880 = fma(_1848, _1874, _1878);
            float _1882 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1884 = fma(_1852, _1876, _1880);
            float _1886 = _1884 * _1882;
            float _1888 = fma(_324, _1886, _1756);
            float _1890 = fma(_320, _1886, _1806);
            float _1892 = fma(_330, _1886, _1764);
            _1826 = _1888;
            _1830 = _1890;
            _1836 = _1892;
        }
    }
    float _1894 = _1826;
    float _1896 = _1830;
    float _1898 = _1836;
    float _1900 = _1810;
    float _1902 = _1812;
    float _1904 = _1900;
    float _1906 = _1902;
    if (_1792)
    {
        _1814 = 1.0;
    }
    float _1908 = _1814;
    float _1910 = _1908;
    if (_1802)
    {
        _338 = _1894;
    }
    float _1912 = _338;
    float _1914 = _1912;
    if (_1802)
    {
        _340 = _1896;
    }
    float _1916 = _340;
    float _1918 = _1916;
    if (_1802)
    {
        _342 = _1898;
    }
    float _1920 = _342;
    float _1922 = _1920;
    if (!_1802)
    {
        float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1926 = _1614 + _1924;
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1930 = _1650 + _1928;
        float _1932 = -_1650;
        float _1934 = _1932 + _1894;
        float _1936 = -_1614;
        float _1938 = _1936 + _1896;
        float _1940 = _1926 * _1926;
        float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1944 = _1632 + _1942;
        float _1946 = -_1632;
        float _1948 = _1946 + _1898;
        float _1950 = fma(_1930, _1930, _1940);
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1954 = fma(_1944, _1944, _1950);
        float _1956 = sqrt(_1954);
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1960 = _1956 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1962 = isnan(_1956);
        bool _1964 = _1960 || _1962;
        bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1968 = _1964 || _1966;
        float _1970 = precise::min(_1956, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1972 = _1970 * _1952;
        float _1974 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1976 = _1974 * _1972;
        float _1978 = _1778;
        float _1980 = _1974;
        if (_1968)
        {
            float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1978 = _1982;
        }
        float _1984 = _1978;
        if (_1968)
        {
            float _1986 = precise::max(_1956, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1904 = _1986;
        }
        float _1988 = _1904;
        float _1990 = fma(_1934, _1976, _1650);
        float _1992 = fma(_1938, _1976, _1614);
        float _1994 = fma(_1948, _1976, _1632);
        float _1996 = _1988;
        float _1998 = _1992;
        float _2000 = _1990;
        _1816 = _1984;
        if (_1968)
        {
            float _2002 = _1988 * _1984;
            _1996 = _2002;
        }
        float _2004 = _1996;
        float _2006 = _2004;
        if (_1968)
        {
            float _2008 = _1974 * _2004;
            _2006 = _2008;
        }
        float _2010 = _2006;
        if (!_1968)
        {
            _1980 = _1992;
        }
        float _2012 = _1980;
        float _2014 = _2012;
        if (!_1968)
        {
            _1998 = _1994;
        }
        float _2016 = _1998;
        _1922 = _2016;
        if (_1968)
        {
            float _2018 = fma(_1934, _2010, _1650);
            _2000 = _2018;
        }
        float _2020 = _2000;
        _1914 = _2020;
        if (_1968)
        {
            float _2022 = fma(_1938, _2010, _1614);
            _2014 = _2022;
        }
        float _2024 = _2014;
        _1918 = _2024;
        if (_1968)
        {
            float _2026 = fma(_1948, _2010, _1632);
            _1922 = _2026;
        }
    }
    float _2028 = _1918;
    float _2030 = _1914;
    float _2032 = _1922;
    float _2034 = _1816;
    float _2036 = _2034;
    if (_1792)
    {
        _1818 = 1.0;
    }
    float _2038 = _1818;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2042 = _1780 * _2040;
    float _2044 = _2038;
    if (!_1792)
    {
        float _2046 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2050 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2048;
        float _2052 = _2046 * 0.15915493667125701904296875;
        float _2054 = 1.0 / _2050;
        float _2056 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2058 = _2052 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = _2056 * 0.15915493667125701904296875;
        float _2064 = _2052 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        float _2068 = 1.0 / _2060;
        float _2070 = _2062 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        float _2074 = _2066 * _2068;
        float _2076 = _2062 * 6.283185482025146484375;
        float _2078 = sin(_2076);
        float _2080 = _2072 * _2074;
        float _2082 = 1.0 / _2080;
        float _2084 = _2078 * _2082;
        float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2088 = fma(_2042, _2084, _2086);
        float _2090 = _2088 * _2054;
        float _2092 = precise::clamp(_2090, 0.0, 1.0);
        _1820 = _2074;
        _1906 = _2052;
        _2036 = _2062;
        _1910 = _2092;
    }
    float _2094 = _1820;
    float _2096 = _1906;
    float _2098 = _2036;
    float _2100 = _1910;
    float _2102 = _2096;
    float _2104 = _2094;
    if (!_1792)
    {
        float _2106 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2108 = _2106 * 0.15915493667125701904296875;
        float _2110 = _2108 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        float _2114 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2116 = _2114 * 0.15915493667125701904296875;
        float _2118 = _2108 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = 1.0 / _2112;
        float _2124 = _2116 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = _2116 * 6.283185482025146484375;
        float _2132 = sin(_2130);
        float _2134 = _2126 * _2128;
        float _2136 = 1.0 / _2134;
        float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2140 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2138;
        float _2142 = 1.0 / _2140;
        float _2144 = _2132 * _2136;
        float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2148 = fma(_2042, _2144, _2146);
        float _2150 = _2148 * _2142;
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = -_2152;
        float _2156 = _2154 + 1.0;
        _2102 = _2134;
        _2104 = _2122;
        _2044 = _2156;
    }
    float _2158 = _2102;
    float _2160 = _2104;
    float _2162 = _2044;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2166 = _2028 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2170 = _2030 + _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2174 = _2032 + _2172;
    float _2176 = _2166 * _2166;
    float _2178 = fma(_2170, _2170, _2176);
    float _2180 = fma(_2174, _2174, _2178);
    float _2182 = rsqrt(_2180);
    float _2184 = sqrt(_2180);
    float _2186 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2188 = _2170 * _2186;
    float _2190 = _2174 * _2186;
    float _2192 = _2188 * _2188;
    float _2194 = _2190 * _2190;
    float _2196 = _2192 + _2194;
    float _2198 = sqrt(_2196);
    bool _2200 = _2198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2204 = _2198 + _2202;
    float _2206 = _2174;
    float _2208 = _2176;
    float _2210 = _2204;
    float _2212 = _2158;
    float _2214 = _2186;
    float _2216 = _2160;
    if (_2200)
    {
        float _2218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2206 = _2218;
    }
    float _2220 = _2206;
    if (_2200)
    {
        float _2222 = rsqrt(_2196);
        _2208 = _2222;
    }
    float _2224 = _2208;
    float _2226 = _2224;
    if (_2200)
    {
        float _2228 = _2204 * _2220;
        _2210 = _2228;
    }
    float _2230 = _2210;
    float _2232 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2200)
    {
        float _2234 = _2230 * 0.15915493667125701904296875;
        _2212 = _2234;
    }
    float _2236 = _2212;
    float _2238 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2232);
    float _2240 = _2220;
    float _2242 = _2236;
    if (_2200)
    {
        float _2244 = _2236 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2252 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2238);
    float _2254 = precise::max(0.0, _2250);
    float _2256 = _2098;
    if (_2200)
    {
        float _2258 = _2236 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        _2256 = _2260;
    }
    float _2262 = _2256;
    float _2264 = -_2186;
    float _2266 = -_2254;
    float _2268 = fma(_2166, _2264, _2266);
    if (_2200)
    {
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2270;
    }
    float _2272 = _2214;
    float _2274 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2276 = _2248;
    float _2278 = _2272;
    if (_2200)
    {
        float _2280 = fma(_2248, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2216 = _2280;
    }
    float _2282 = _2216;
    float _2284 = _2282;
    if (!_2200)
    {
        _2276 = _2188;
    }
    float _2286 = _2276;
    float _2288 = floor(_2274);
    float _2290 = _2286;
    float _2292 = _2262;
    if (_2200)
    {
        float _2294 = _2262 + (-1.0);
        _2278 = _2294;
    }
    float _2296 = _2278;
    float _2298 = _2296;
    if (_2200)
    {
        float _2300 = _2224 * _2282;
        _1670 = _2300;
    }
    float _2302 = _1670;
    if (!_2200)
    {
        _2226 = _2268;
    }
    float _2304 = _2226;
    float _2306 = _2304;
    if (_2200)
    {
        float _2308 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2308;
    }
    float _2310 = _2242;
    if (_2200)
    {
        float _2312 = _2188 * _2302;
        _2290 = _2312;
    }
    float _2314 = _2290;
    if (!_2200)
    {
        _2298 = _2190;
    }
    float _2316 = _2298;
    float _2318 = _2316;
    if (_2200)
    {
        float _2320 = _2190 * _2302;
        _2318 = _2320;
    }
    float _2322 = _2318;
    if (!_2200)
    {
        _2284 = _2192;
    }
    float _2324 = _2284;
    float _2326 = _2324;
    if (_2200)
    {
        float _2328 = fma(_2268, _2262, _2310);
        _2306 = _2328;
    }
    float _2330 = _2306;
    if (_2200)
    {
        float _2332 = _2314 * _2314;
        _2326 = _2332;
    }
    float _2334 = _2326;
    if (!_2200)
    {
        _2292 = _2194;
    }
    float _2336 = _2292;
    float _2338 = _2336;
    if (_2200)
    {
        float _2340 = _2322 * _2322;
        _2338 = _2340;
    }
    float _2342 = _2338;
    float _2344 = fma(_2330, _2330, _2334);
    float _2346 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2348 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2350 = fma(_1632, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2352 = _2344 + _2342;
    float _2354 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2356 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2346);
    float _2358 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2348);
    float _2360 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2354);
    float _2362 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2356);
    float _2364 = rsqrt(_2352);
    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2368 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2366);
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2358);
    float _2374 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2360);
    float _2376 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2378 = -_2370;
    float _2380 = _2378 + 1.0;
    float _2382 = _2372 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2384 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2388 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2390 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2392 = abs(_2380);
    float _2394 = log2(_2392);
    float _2396 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2386);
    float _2398 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = -_2390;
    float _2402 = fma(_2400, _2388, 1.0);
    float _2404 = -_2288;
    float _2406 = _2274 + _2404;
    float _2408 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2410 = _2364 * _2314;
    float _2412 = _2364 * _2322;
    float _2414 = floor(_2350);
    float _2416 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2408);
    float _2418 = _2364 * _2330;
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2422 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2424 = _2418 + 1.0;
    float _2426 = -_2420;
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2426);
    float _2430 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = log2(_2402);
    float _2434 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2422);
    float _2436 = -_2412;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2428);
    float _2440 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2442 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2434);
    float _2444 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2440);
    float _2446 = exp2(_2430);
    float _2448 = fma(_2438, -0.5, 0.5);
    float _2450 = fma(_2438, 0.5, 0.5);
    float _2452 = -_2414;
    float _2454 = _2350 + _2452;
    float _2456 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2444);
    float _2458 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2442);
    float _2460 = fma(_2450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2462 = 1.0 / _2416;
    float _2464 = _2432 * 0.693147182464599609375;
    float _2466 = fma(_2450, _2460, -0.212114393711090087890625);
    float _2468 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = fma(_2450, _2466, 1.570728778839111328125);
    float _2472 = sqrt(_2448);
    float _2474 = -_2418;
    float _2476 = fma(_2446, _2424, _2474);
    float _2478 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2456);
    float _2480 = fma(_2476, 0.5, 0.5);
    float _2482 = _2458 * _2462;
    float _2484 = _2478 * _2462;
    float _2486 = fma(_2482, 0.5, 0.5);
    float _2488 = fma(_2484, -0.5, 0.5);
    float _2490 = _2472 * 0.636619746685028076171875;
    float2 _7746 = float2(_2406, _2454);
    float _2492 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7746, float2(0.0), isnan(_7746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7746, float2(0.0), isnan(_7746)), level(0.0)).x;
    float3 _7757 = float3(_2486, _2488, _2468);
    float _2494 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7757, float3(0.0), isnan(_7757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7757, float3(0.0), isnan(_7757)), level(0.0)).x;
    float _2496 = -_2470;
    float _2498 = fma(_2490, _2496, 1.0);
    float3 _7773 = float3(_2486, _2488, _2468);
    float4 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7773, float3(0.0), isnan(_7773)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7773, float3(0.0), isnan(_7773)), level(0.0)).xyzw;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = _2501.w;
    float2 _7789 = float2(_2498, _2480);
    float3 _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7789, float2(0.0), isnan(_7789)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7789, float2(0.0), isnan(_7789)), level(0.0)).xyz;
    float _2515 = _2513.x;
    float _2517 = _2513.y;
    float _2519 = _2513.z;
    float _2521 = float(uint(_1244));
    float _2523 = trunc(_1252);
    int _2525 = int(_2523);
    int _2527 = ~_1244;
    int _2529 = _2527 + 1;
    out.m_65.x = _1650;
    out.m_65.y = _1614;
    out.m_65.z = _1632;
    bool _2531 = _1244 == 0;
    float _2533 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2535 = abs(_1156);
    out.m_67.w = _1398;
    bool _2537 = _734 > 0.5;
    float _2539 = 1.0 / _2521;
    int _2541 = ~_1244;
    int _2543 = _2541 + 1;
    float _2545 = in.m_69.x;
    float _2547 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2549 = _1568 * _1484;
    bool _2551 = _2042 <= 8000.0;
    bool _2553 = isnan(_2042);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(8000.0);
    bool _2559 = _2555 || _2557;
    float _2561 = float(_2559);
    float _2563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2565 = float(uint(_2525));
    float _2567 = fma(_1522, _1602, _2549);
    float _2569 = float(_116);
    float _2571 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2547);
    float _2573 = float(_2525);
    out.m_71.x = _1550;
    int _2575 = as_type<int>(_2539) + (-2);
    float _2577 = 1.0 / _2569;
    bool _2579 = _2573 >= _1278;
    bool _2581 = isnan(_2573);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan(_1278);
    bool _2587 = _2583 || _2585;
    float _2589 = float(_2587);
    float _2591 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2571);
    out.m_73.x = _2030;
    out.m_73.y = _2028;
    out.m_73.z = _2032;
    float _2593 = as_type<float>(_2575) * _2565;
    float _2595 = trunc(_2589);
    int _2597 = int(_2595);
    float _2599 = trunc(_2593);
    float _2601 = precise::max(_2599, 0.0);
    uint _2604 = uint(_2601);
    float _2606 = _1300 * _2577;
    bool _2608 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2610 = isnan(_724);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = trunc(_2606);
    int _2622 = int(_2620);
    int _2624 = _2543 * int(_2604);
    int _2626 = _2624 + _2525;
    float _2628 = exp2(_2533);
    float _2630 = float(uint(_2626));
    float _2632 = as_type<float>(_2575) * _2630;
    bool _2634 = !_740;
    float _2636 = _2634 ? 7.345489978790283203125 : 1.0;
    float _2638 = trunc(_2632);
    float _2640 = precise::max(_2638, 0.0);
    uint _2642 = uint(_2640);
    float _2644 = -_2628;
    float _2646 = _2644 + 1.0;
    float _2648 = _2636 * _172;
    float _2650 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = floor(_2648);
    int _2654 = int(_2604) + int(_2642);
    int _2656 = _2529 * _2654;
    int _2658 = _2656 + _2525;
    float _2660 = -_2652;
    float _2662 = _2648 + _2660;
    bool _2664 = uint(_2658) >= uint(_1244);
    float _2666 = _2662 * _1278;
    int _2668 = _1244 + (-1);
    bool _2670 = !_2664;
    int _2672 = _2670 ? 0 : (-1);
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2676 = _2674 != 0;
    float _2678 = trunc(_2666);
    int _2680 = int(_2678);
    int _2682 = ~_2654;
    int _2684 = _2682 + _2672;
    int _2686 = _2684 + 1;
    bool _2688 = !_2676;
    int _2690 = _2688 ? 0 : 1;
    int _2692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2694 = _2692 != 0;
    int _2696 = _1244 * _2686;
    int _2698 = _2696 + _2525;
    int _2700 = ~_2597;
    int _2702 = _2700 + 1;
    int _2704 = _2702 + 1;
    int _2706 = abs(_2690);
    bool _2708 = !_2531;
    int _2710 = _2708 ? _2698 : (-1);
    bool _2712 = !_2694;
    int _2714 = _2712 ? 0 : 1;
    int _2716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2718 = _2716 != 0;
    int _2720 = _2710 * _2704;
    int _2722 = abs(_2714);
    int _2724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2726 = _2724 != 0;
    int _2728 = _2597 * _2668;
    int _2730 = _2728 + _2720;
    int _2732 = abs(_1162);
    int _2734 = _2730 * _2535;
    int _2736 = abs(_1168);
    int _2738 = _2680 * _2706;
    int _2740 = _2738 + _2525;
    float _2742 = in.m_75.w;
    int _2744 = ~_1244;
    int _2746 = _2744 + 1;
    int _2748 = _2622 * _2732;
    int _2750 = _2748 + _2734;
    float _2752 = in.m_69.y;
    int _2754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2756 = _2754 != 0;
    int _2758 = _2740 * _2736;
    int _2760 = _2758 + _2750;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2764 = _2762 != 0;
    int _2766 = _2680 * _2722;
    int _2768 = _2766 + _2760;
    int _2770 = ~_1244;
    int _2772 = _2770 + 1;
    float _2774 = float(uint(_2768));
    float _2776 = as_type<float>(_2575) * _2774;
    out.m_77.w = _2742;
    float _2778 = trunc(_2776);
    float _2780 = precise::max(_2778, 0.0);
    uint _2782 = uint(_2780);
    int _2784 = _2772 * int(_2782);
    int _2786 = _2784 + _2768;
    float _2788 = float(uint(_2786));
    float _2790 = as_type<float>(_2575) * _2788;
    float _2792 = trunc(_2790);
    float _2794 = precise::max(_2792, 0.0);
    uint _2796 = uint(_2794);
    int _2798 = int(_2782) + int(_2796);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2804 = 1.0 / _2802;
    int _2806 = _2746 * _2798;
    int _2808 = _2806 + _2768;
    float _2810 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2814 = uint(_2808) >= uint(_1244);
    float _2816 = -_2752;
    float _2818 = _2816 + 1.0;
    float _2820 = 1.0 / _2812;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2824 = _2822 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2826 = !_2814;
    int _2828 = _2826 ? 0 : (-1);
    int _2830 = _2537 ? as_type<int>(_2818) : as_type<int>(_2752);
    int _2832 = ~_2798;
    int _2834 = _2832 + _2828;
    int _2836 = _2834 + 1;
    float _2838 = _2726 ? as_type<float>(_2830) : _2752;
    int _2840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2842 = _2840 != 0;
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2844;
    bool _2848 = _742 > 0.5;
    int _2850 = _1244 * _2836;
    int _2852 = _2850 + _2768;
    float _2854 = float(uint(_2740));
    float _2856 = _2846 * _2804;
    float _2858 = _2752;
    bool _2860 = _2848;
    float _2862 = as_type<float>(_2575);
    float _2864 = _2458;
    if (_2718)
    {
        float _2866 = _2848 ? _2818 : _2752;
        _2858 = _2866;
    }
    float _2868 = _2858;
    float _2870 = _2824 * _2820;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2874 = _724 + _2872;
    float _2876 = as_type<float>(_2575) * _2854;
    bool _2878 = !_2531;
    int _2880 = _2878 ? _2852 : (-1);
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2884 = _724 + _2882;
    float _2886 = _2884;
    if (_2756)
    {
        bool _2888 = _172 > 0.5;
        _2860 = _2888;
    }
    bool _2890 = _2860;
    float _2892 = trunc(_2876);
    float _2894 = precise::max(_2892, 0.0);
    uint _2896 = uint(_2894);
    int _2898 = _2880 >> 31;
    float _2900 = fma(_2856, _2874, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2902 = _1496 != 0.0;
    bool _2904 = isnan(_1496);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan(0.0);
    bool _2910 = _2906 || _2908;
    float _2912 = in.m_79.x;
    float _2914 = in.m_79.y;
    float _2916 = in.m_79.z;
    int _2918 = _2898 & 3;
    float _2920 = fma(_2870, _2884, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2922 = ~_1244;
    int _2924 = _2922 + 1;
    int _2926 = _2880 + _2918;
    bool _2928 = _1494 == 0.0;
    bool _2930 = !_2910;
    bool _2932 = _2928 && _2930;
    float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2936 = _2926 >> 2;
    int _2938 = _2924 * int(_2896);
    int _2940 = _2938 + _2740;
    bool _2942 = _1498 == 0.0;
    bool _2944 = _2942 && _2932;
    int _2946 = _2936 << 4;
    int _2948 = _2946 + 368;
    bool _2950 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2952 = isnan(_724);
    bool _2954 = _2950 || _2952;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2958 = _2954 || _2956;
    float _2960 = float(_2958);
    bool _2962 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2964 = isnan(_724);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    float _2974 = float(uint(_2940));
    float _2976 = -_2960;
    float _2978 = _2976 + 1.0;
    uint _2980 = uint(int(uint(_2948) >> uint(2)));
    uint _2982 = uint(int(uint(int(_2980)) >> uint(2)));
    int _2984 = int(_2980) & 3;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[int(_2982)][_2984];
    int _2988 = int(_2980) + 1;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    int _2992 = _2988 & 3;
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[int(_2990)][_2992];
    if (!_2756)
    {
        _2886 = _2545;
    }
    float _2996 = _2886;
    float _2998 = _2912;
    float _3000 = _2914;
    float _3002 = _2916;
    float _3004 = _2996;
    if (!_2944)
    {
        float _3006 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2912);
        _2998 = _3006;
    }
    float _3008 = _2998;
    if (_2842)
    {
        float _3010 = -_2545;
        float _3012 = _3010 + 1.0;
        _1672 = as_type<int>(_3012);
    }
    int _3014 = _1672;
    float _3016 = _2972 * _2978;
    float _3018 = -_2972;
    float _3020 = _3018 + 1.0;
    float _3022 = as_type<float>(_2575) * _2974;
    if (!_2842)
    {
        _2862 = _2545;
    }
    float _3024 = _2862;
    float _3026 = _3024;
    if (!_2944)
    {
        float _3028 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2914);
        _3000 = _3028;
    }
    float _3030 = _3000;
    if (_2842)
    {
        float _3032 = _2537 ? as_type<float>(_3014) : _2545;
        _3026 = _3032;
    }
    float _3034 = _3026;
    if (!_2944)
    {
        float _3036 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2916);
        _3002 = _3036;
    }
    float _3038 = _3002;
    int _3040 = _2880 & 3;
    bool _3042 = _3040 != 0;
    float _3044 = _2618 * _3020;
    int _3046 = _2880 & 3;
    bool _3048 = _3046 != 0;
    float _3050 = trunc(_3022);
    float _3052 = precise::max(_3050, 0.0);
    uint _3054 = uint(_3052);
    int _3056 = _3042 ? 0 : 1;
    float _3058 = _2900 * _3044;
    bool _3060 = uint(_3046) > 1u;
    float _3062 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3064 = _2948 + 8;
    uint _3066 = uint(int(uint(_3064) >> uint(2)));
    uint _3068 = uint(int(uint(int(_3066)) >> uint(2)));
    int _3070 = int(_3066) & 3;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[int(_3068)][_3070];
    int _3074 = int(_3066) + 1;
    uint _3076 = uint(int(uint(_3074) >> uint(2)));
    int _3078 = _3074 & 3;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[int(_3076)][_3078];
    float _3082 = _2934 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3084 = -_2618;
    float _3086 = _3084 + 1.0;
    float _3088 = fma(_3062, _2868, -0.5);
    int _3090 = ~_1244;
    int _3092 = _3090 + 1;
    float _3094 = fma(_3082, _3034, -0.5);
    float _3096 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3058);
    float _3098 = -_1076;
    float _3100 = fma(_1202, _3088, _3098);
    float _3102 = fma(_1232, _3094, _1090);
    int _3104 = ~_3056;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    float _3110 = fma(_2920, _3016, _3096);
    int _3112 = _3108;
    if (!_3060)
    {
        int _3114 = ~_3056;
        int _3116 = _3114 + 1;
        _3112 = _3116;
    }
    int _3118 = _3112;
    float _3120 = abs(_2042);
    float _3122 = log2(_3120);
    int _3124 = int(_2896) + int(_3054);
    float _3126 = -_2492;
    float _3128 = _3126 + 1.0;
    bool _3130 = !_3048;
    int _3132 = _3130 ? 0 : 1;
    float _3134 = _2650 * _2494;
    int _3136 = abs(_3118);
    int _3138 = _3092 * _3124;
    int _3140 = _3138 + _2740;
    bool _3142 = uint(_3046) >= 2u;
    float _3144 = -_2650;
    float _3146 = _3144 + 1.0;
    int _3148 = abs(_3132);
    int _3150 = _3142 ? 0 : 1;
    bool _3152 = _3046 != 3;
    float _3154 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3156 = uint(_3140) >= uint(_1244);
    int _3158 = ~_3136;
    int _3160 = _3158 + 1;
    int _3162 = _3160 + 1;
    float _3164 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3166 = int(_3164);
    int _3168 = ~_3148;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    bool _3174 = !_3156;
    int _3176 = _3174 ? 0 : (-1);
    int _3178 = _3162 * as_type<int>(_2994);
    bool _3180 = _3046 != 3;
    int _3182 = ~_3150;
    int _3184 = _3182 + 1;
    int _3186 = _3184 + 1;
    int _3188 = _3172 * as_type<int>(_2986);
    int _3190 = _3188 + _3178;
    bool _3192 = !_3180;
    int _3194 = _3192 ? 0 : (-1);
    float _3196 = exp2(_3154);
    int _3198 = _3186;
    if (_3152)
    {
        int _3200 = ~_3150;
        int _3202 = _3200 + 1;
        _3198 = _3202;
    }
    int _3204 = _3198;
    bool _3206 = !_2764;
    int _3208 = _3206 ? 0 : 1;
    int _3210 = abs(_3194);
    int _3212 = abs(_3204);
    int _3214 = abs(_3208);
    float _3216 = float(uint(_3166));
    int _3218 = ~_3212;
    int _3220 = _3218 + 1;
    int _3222 = _3220 + 1;
    int _3224 = ~_3124;
    int _3226 = _3224 + _3176;
    int _3228 = _3226 + 1;
    int _3230 = ~_3210;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    int _3236 = _3222 * as_type<int>(_3072);
    int _3238 = _3236 + _3190;
    float _3240 = 1.0 / _3216;
    int _3242 = abs(_3166);
    int _3244 = _1244 * _3228;
    int _3246 = _3244 + _2740;
    int _3248 = ~_3214;
    int _3250 = _3248 + 1;
    int _3252 = _3250 + 1;
    int _3254 = _3234 * as_type<int>(_3080);
    int _3256 = _3254 + _3238;
    float _3258 = float(uint(_3242));
    float _3260 = fma(_2960, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3110);
    bool _3262 = !_2531;
    int _3264 = _3262 ? _3246 : (-1);
    int _3266 = _3256 * _3252;
    float _3268 = 1.0 / _3258;
    float _3270 = _3260 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3272 = _3264 * _3214;
    int _3274 = _3272 + _3266;
    float _3276 = _3100 + 0.5;
    float _3278 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3280 = precise::clamp(_3278, 0.0, 1.0);
    int _3282 = as_type<int>(_3240) + (-2);
    int _3284 = _3214;
    if (_2756)
    {
        float _3286 = -_2545;
        float _3288 = _3286 + 1.0;
        _3284 = as_type<int>(_3288);
    }
    int _3290 = _3284;
    int _3292 = abs(_3274);
    float _3294 = float(uint(_3274));
    float _3296 = _3102 + 0.5;
    float _3298 = fma(_3280, -2.0, 3.0);
    int _3300 = as_type<int>(_3268) + (-2);
    float _3302 = _3280 * _3280;
    float _3304 = float(uint(_3292));
    float _3306 = as_type<float>(_3282) * _3294;
    if (_2756)
    {
        float _3308 = _2890 ? as_type<float>(_3290) : _2545;
        _3004 = _3308;
    }
    float _3310 = _3004;
    float _3312 = _3302 * _3298;
    int _3314 = ~_3242;
    int _3316 = _3314 + 1;
    float _3318 = as_type<float>(_3300) * _3304;
    int _3320 = ~_3166;
    int _3322 = _3320 + 1;
    float _3324 = trunc(_3306);
    float _3326 = precise::max(_3324, 0.0);
    uint _3328 = uint(_3326);
    float _3330 = -_3312;
    float _3332 = _3330 + 1.0;
    out.m_81.x = _3296;
    out.m_81.y = _3276;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3312);
    float _3336 = trunc(_3318);
    float _3338 = precise::max(_3336, 0.0);
    uint _3340 = uint(_3338);
    float _3342 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3344 = _1520 * _1484;
    float _3346 = _2561 * _3334;
    float _3348 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3350 = _3342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3352 = _3322 * int(_3328);
    int _3354 = _3352 + _3274;
    float _3356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3358 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3360 = _1520 * _1486;
    float _3362 = _1520 * _1482;
    float _3364 = float(uint(_3354));
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3368 = -_1528;
    float _3370 = fma(_3368, _1602, _3344);
    int _3372 = _3316 * int(_3340);
    int _3374 = _3372 + _3292;
    int _3376 = ~_3242;
    int _3378 = _3376 + 1;
    float _3380 = as_type<float>(_3282) * _3364;
    out.m_83.x = _3350;
    out.m_83.y = _3358;
    out.m_83.z = _3366;
    out.m_83.w = _3270;
    float _3382 = _1560 * _1486;
    float _3384 = float(uint(_3374));
    float _3386 = -_1528;
    float _3388 = fma(_3386, _1608, _3360);
    float _3390 = -_1528;
    float _3392 = fma(_3390, _1598, _3362);
    float _3394 = trunc(_3380);
    float _3396 = precise::max(_3394, 0.0);
    uint _3398 = uint(_3396);
    float _3400 = fma(_1518, _1608, _3382);
    float _3402 = as_type<float>(_3300) * _3384;
    float _3404 = _1560 * _1484;
    float _3406 = _1560 * _1482;
    float _3408 = _1568 * _1486;
    float _3410 = _1568 * _1482;
    float _3412 = fma(_1518, _1602, _3404);
    float _3414 = trunc(_3402);
    float _3416 = precise::max(_3414, 0.0);
    uint _3418 = uint(_3416);
    float _3420 = _1516 * _850;
    float _3422 = _1580 * _850;
    float _3424 = _1580 * _910;
    float _3426 = _1588 * _850;
    float _3428 = _3420 + _3370;
    int _3430 = ~_3166;
    int _3432 = _3430 + 1;
    float _3434 = _3422 + _3412;
    int _3436 = int(_3328) + int(_3398);
    float _3438 = _1516 * _910;
    float _3440 = _1516 * _852;
    float _3442 = _3428 * _3030;
    float _3444 = _1580 * _852;
    int _3446 = _3432 * _3436;
    int _3448 = _3446 + _3274;
    float _3450 = _3424 + _3400;
    int _3452 = _3274 ^ _3166;
    float _3454 = _3438 + _3388;
    int _3456 = int(_3340) + int(_3418);
    float _3458 = _3440 + _3392;
    bool _3460 = uint(_3448) >= uint(_3166);
    float _3462 = _3454 * _3030;
    uint _3464 = uint(int(uint(_3452) >> uint(31)));
    int _3466 = _3378 * _3456;
    int _3468 = _3466 + _3292;
    float _3470 = _3426 + _2567;
    bool _3472 = !_3460;
    int _3474 = _3472 ? 0 : (-1);
    float _3476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3478 = ~int(_3464);
    int _3480 = _3478 + 1;
    float _3482 = _3458 * _3030;
    bool _3484 = uint(_3468) >= uint(_3242);
    float _3486 = fma(_1518, _1598, _3406);
    int _3488 = ~_3436;
    int _3490 = _3488 + _3474;
    int _3492 = _3490 + 1;
    float _3494 = fma(_1522, _1608, _3408);
    bool _3496 = !_3484;
    int _3498 = _3496 ? 0 : (-1);
    float _3500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3502 = _3166 == 0;
    int _3504 = _3166 * _3492;
    int _3506 = _3504 + _3274;
    int _3508 = ~_3498;
    int _3510 = _3456 + _3508;
    int _3512 = _3510 + 1;
    float _3514 = _1588 * _852;
    bool _3516 = _3166 == 0;
    float _3518 = fma(_1522, _1598, _3410);
    int _3520 = _3512 ^ _3480;
    float _3522 = _3476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3524 = !_3502;
    int _3526 = _3524 ? _3506 : (-1);
    float _3528 = _1588 * _910;
    int _3530 = ~_3480;
    int _3532 = _3530 + _3520;
    int _3534 = _3532 + 1;
    float _3536 = _3444 + _3486;
    float _3538 = float(_3526);
    float _3540 = _3514 + _3518;
    bool _3542 = !_3516;
    int _3544 = _3542 ? _3534 : (-1);
    float _3546 = _3500 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3548 = _3528 + _3494;
    float _3550 = fma(_3434, _3008, _3442);
    float _3552 = float(_3544);
    float _3554 = fma(_3450, _3008, _3462);
    float _3556 = fma(_3536, _3008, _3482);
    float _3558 = fma(_3546, _2838, -0.5);
    float _3560 = fma(_3522, _3310, -0.5);
    float _3562 = -_804;
    float _3564 = fma(_3546, _3552, _3562);
    float _3566 = fma(_3522, _3538, _1150);
    float _3568 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3570 = fma(_3470, _3038, _3550);
    float _3572 = fma(_3548, _3038, _3554);
    float _3574 = fma(_3540, _3038, _3556);
    float _3576 = fma(_1256, _3558, _3564);
    float _3578 = in.m_85.x;
    float _3580 = _3128 * _3568;
    float _3582 = precise::clamp(_3580, 0.0, 1.0);
    float _3584 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2591);
    float _3586 = fma(_1228, _3560, _3566);
    float _3588 = _2416 * 0.5;
    float _3590 = -_3582;
    float _3592 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3594 = _3584 + _2416;
    float _3596 = _2458 + _2416;
    float _3598 = _2509 * _3134;
    float _3600 = _2519 * _3134;
    float _3602 = fma(_2478, -0.5, _3588);
    float _3604 = _3594 * 0.5;
    float _3606 = _3596 * 0.5;
    float _3608 = fma(_2515, _3598, _2503);
    float _3610 = fma(_2517, _3598, _2505);
    float _3612 = _2509 * _3146;
    float _3614 = fma(_2509, _3600, _2507);
    out.m_87.x = _3606;
    out.m_87.y = _3602;
    out.m_87.z = _3604;
    out.m_87.w = _2416;
    bool _3616 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3618 = isnan(_2184);
    bool _3620 = _3616 || _3618;
    bool _3622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3624 = _3620 || _3622;
    float _3626 = _3586 + 0.5;
    float _3628 = _3576 + 0.5;
    out.m_89.x = _3608;
    out.m_89.y = _3610;
    out.m_89.z = _3614;
    out.m_89.w = _3612;
    float _3630 = _3592 * _3578;
    out.m_91.x = _3570;
    out.m_91.y = _3572;
    out.m_91.z = _3574;
    float _3632 = _3630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3634 = _2100 * _2162;
    out.gl_Position.x = _2458;
    out.gl_Position.y = _2478;
    out.gl_Position.z = _3584;
    out.gl_Position.w = _2416;
    float _3636 = _3578;
    float _3638 = _3628;
    float _3640 = _3626;
    float _3642 = _3632;
    float _3644 = _3634;
    if (!_3624)
    {
        _3636 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3646 = _3636;
    out.m_93.x = _3626;
    out.m_93.y = _3628;
    out.m_95.x = _3632;
    float _3648 = _3634 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3650 = _3646;
    float _3652 = _3646;
    if (!_3624)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3654 = _2864;
    float _3656 = _3654;
    float _3658 = _3654;
    if (!_3624)
    {
        _3638 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3660 = _3638;
    float _3662 = _3660;
    float _3664 = _3660;
    if (!_3624)
    {
        _3640 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3666 = _3640;
    float _3668 = _3666;
    float _3670 = _3666;
    if (!_3624)
    {
        _3642 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3672 = _3642;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3624)
    {
        _3644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3678 = _3644;
    bool _3680 = !_3624;
    float _3682 = _3678;
    float _3684 = _3678;
    if (!_3680)
    {
        bool _3686 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3688 = isnan(_2184);
        bool _3690 = _3686 || _3688;
        bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3694 = _3690 || _3692;
        if (!_3694)
        {
            float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3698 = _2184 + _3696;
            float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3702 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3700;
            float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3706 = _3704 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3708 = 1.0 / _3702;
            float _3710 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3712 = _3710 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3714 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3716 = _3714 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3720 = _3718 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3726 = _3698 * _3708;
            float _3728 = precise::clamp(_3726, 0.0, 1.0);
            float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3734 = fma(_3728, _3706, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3736 = fma(_3728, _3732, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3738 = fma(_3728, _3712, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3740 = fma(_3728, _3716, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3742 = fma(_3728, _3720, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3744 = fma(_3728, _3724, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3658 = _3738;
            _3676 = _3742;
            _3652 = _3734;
            _3670 = _3740;
            _3664 = _3736;
            _3684 = _3744;
            _3746 = true;
        }
        else
        {
            bool _3748 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3750 = isnan(_2184);
            bool _3752 = _3748 || _3750;
            bool _3754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3756 = _3752 || _3754;
            if (!_3756)
            {
                _3650 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3758 = _3650;
            _3652 = _3758;
            if (!_3756)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3760 = _3656;
            _3658 = _3760;
            if (!_3756)
            {
                _3662 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3762 = _3662;
            _3664 = _3762;
            if (!_3756)
            {
                _3668 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3764 = _3668;
            _3670 = _3764;
            if (!_3756)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3766 = _3674;
            _3676 = _3766;
            if (!_3756)
            {
                _3682 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3768 = _3682;
            bool _3770 = !_3756;
            _3684 = _3768;
            if (!_3770)
            {
                bool _3772 = _2184 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3774 = isnan(_2184);
                bool _3776 = _3772 || _3774;
                bool _3778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3780 = _3776 || _3778;
                if (!_3780)
                {
                    float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3784 = _2184 + _3782;
                    float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3788 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3786;
                    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3792 = _3790 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3794 = 1.0 / _3788;
                    float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3812 = _3784 * _3794;
                    float _3814 = precise::clamp(_3812, 0.0, 1.0);
                    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3820 = fma(_3814, _3792, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3822 = fma(_3814, _3818, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3824 = fma(_3814, _3798, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3826 = fma(_3814, _3802, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3828 = fma(_3814, _3806, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3830 = fma(_3814, _3810, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3658 = _3824;
                    _3676 = _3828;
                    _3652 = _3820;
                    _3670 = _3826;
                    _3664 = _3822;
                    _3684 = _3830;
                    _3746 = true;
                }
                else
                {
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3652 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3670 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3664 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3684 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3746 = false;
    float _3832 = _3658;
    float _3834 = _3676;
    float _3836 = _3652;
    float _3838 = _3670;
    float _3840 = _3664;
    float _3842 = _3684;
    float _3844 = fma(_3572, -0.5, 0.5);
    float _3846 = precise::clamp(_3844, 0.0, 1.0);
    float _3848 = -_3832;
    float _3850 = _3848 + _3834;
    float _3852 = _3648 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3854 = -_3836;
    float _3856 = _3854 + _3838;
    float _3858 = fma(_3846, _3850, _3832);
    out.m_97.x = 0.0;
    float _3860 = -_3840;
    float _3862 = _3860 + _3842;
    float _3864 = fma(_3846, _3856, _3836);
    float _3866 = _3858 * 0.586610972881317138671875;
    out.m_49.x = _3852;
    bool _3868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3870 = fma(_3846, _3862, _3840);
    float _3872 = fma(_3864, 0.298911988735198974609375, _3866);
    bool _3874 = _2100 > 0.0;
    bool _3876 = isnan(_2100);
    bool _3878 = _3874 || _3876;
    bool _3880 = isnan(0.0);
    bool _3882 = _3878 || _3880;
    float _3884 = fma(_3870, 0.114477999508380889892578125, _3872);
    bool _3886 = _2162 <= 0.0;
    bool _3888 = !_3882;
    bool _3890 = _3886 || _3888;
    float _3892 = -_3884;
    float _3894 = _3864 + _3892;
    float _3896 = -_3884;
    float _3898 = _3858 + _3896;
    float _3900 = -_3884;
    float _3902 = _3870 + _3900;
    float _3904 = fma(_3894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    float _3906 = fma(_3898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    float _3908 = fma(_3902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3884);
    bool _3910 = !_3868;
    if (!_3910)
    {
        float _3912 = -_2028;
        float _3914 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3916 = -_2030;
        float _3918 = _3916 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3920 = -_2032;
        float _3922 = _3920 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3924 = _3914 * _3914;
        float _3926 = fma(_3918, _3918, _3924);
        float _3928 = fma(_3922, _3922, _3926);
        float _3930 = sqrt(_3928);
        float _3932 = rsqrt(_3928);
        float _3934 = -_3930;
        float _3936 = _3934 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3938 = _3936 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3940 = precise::clamp(_3938, 0.0, 1.0);
        float _3942 = _3918 * _3932;
        float _3944 = _3914 * _3932;
        float _3946 = abs(_3940);
        float _3948 = log2(_3946);
        float _3950 = _3922 * _3932;
        float _3952 = _3942 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3954 = _3572 * _3944;
        float _3956 = -_3944;
        float _3958 = -_3952;
        float _3960 = fma(_3956, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3958);
        float _3962 = fma(_3570, _3942, _3954);
        float _3964 = -_3950;
        float _3966 = fma(_3964, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3960);
        float _3968 = fma(_3574, _3950, _3962);
        float _3970 = precise::clamp(_3968, 0.0, 1.0);
        float _3972 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3974 = _3966 + _3972;
        float _3976 = _3948 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3978 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3980 = precise::clamp(_3978, 0.0, 1.0);
        float _3982 = exp2(_3976);
        float _3984 = _3982 * _3980;
        float _3986 = _3970 * _3984;
        float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3990 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3992 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3988;
        out.m_97.y = _3990;
        out.m_97.z = _3992;
    }
    out.m_67.x = _3904;
    out.m_67.y = _3906;
    out.m_67.z = _3908;
    if (!_3890)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3994 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3994;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

