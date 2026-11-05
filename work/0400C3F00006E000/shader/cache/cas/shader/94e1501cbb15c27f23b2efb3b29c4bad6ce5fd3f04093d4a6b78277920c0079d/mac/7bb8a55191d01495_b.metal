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
    float4 m_103 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_75 [[user(locn14)]];
    float4 m_73 [[user(locn15)]];
    float4 m_87 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_89 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_81 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_77 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4570 = false;
    bool _718 = false;
    bool _540 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4874 = as_type<float>(_138);
        out.gl_Position.z = _4874;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_51.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_122);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_168)
    {
        out.m_49.x = 0.0;
    }
    int _172 = 0;
    if (_168)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4943 = as_type<float>(_176);
        out.gl_Position.z = _4943;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_53.x;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _182 = _154 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _192 = _182 * _180;
    float _194 = _154 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _198 = _194 * _190;
    float _200 = floor(_196);
    float _202 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[20].y, _198);
    float _204 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _214 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _204);
    float _216 = _202 * 6.283185482025146484375;
    float _218 = floor(_202);
    float _220 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _228 = _226 != 0;
    float _230 = _210 * 0.15915493667125701904296875;
    float _232 = _216 * 0.15915493667125701904296875;
    float _234 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _212);
    float _236 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _220);
    bool _238 = !_224;
    int _240 = _238 ? 0 : 1;
    float _242 = -_200;
    float _244 = _196 + _242;
    float _246 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _214);
    float _248 = _230 * 6.283185482025146484375;
    float _250 = cos(_248);
    float _252 = -_218;
    float _254 = _202 + _252;
    int _256 = abs(_240);
    float _258 = _232 * 6.283185482025146484375;
    float _260 = cos(_258);
    bool _262 = !_208;
    int _264 = _262 ? 0 : 1;
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _270 = -_244;
    float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _274 = abs(_264);
    float _276 = float(_256);
    float _278 = fma(_250, 0.5, 0.5);
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _282 = !_228;
    int _284 = _282 ? 0 : 1;
    float _286 = abs(_272);
    float _288 = _276 * _286;
    float _290 = abs(_268);
    float _292 = _276 * _290;
    bool _294 = _254 < 0.5;
    float _296 = float(_294);
    float _298 = -_278;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _302 = float(_274);
    float _304 = fma(_260, 0.5, 0.5);
    bool _306 = _244 < 0.5;
    float _308 = float(_306);
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _314 = abs(_284);
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _320 = fma(_302, _300, _288);
    float _322 = -_308;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = float(_314);
    float _328 = fma(_302, _318, _292);
    float _330 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _234);
    float _332 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _236);
    float _334 = abs(_324);
    float _336 = fma(_326, _334, _320);
    float _338 = abs(_312);
    float _340 = fma(_326, _338, _328);
    bool _342 = !_280;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _360;
    if (!_342)
    {
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_122);
        float _366 = 1.0 / _364;
        float _368 = _154 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _370 + _372;
    bool _376 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_370);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _390 = _370 + _388;
    bool _392 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_370);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _412 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _414 = isnan(_370);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -_386;
    float _426 = _424 + 1.0;
    float _428 = 1.0 / _410;
    float _430 = _422 * _426;
    float _432 = -_422;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _406;
    float _444 = _402 * _434;
    float _446 = -_402;
    float _448 = _446 + 1.0;
    float _450 = _390 * _428;
    float _452 = _374 * _442;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    float _462 = fma(_438, _452, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = fma(_460, _452, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _468 = in.m_57.x;
    float _470 = in.m_57.y;
    float _472 = in.m_57.z;
    float _474 = _462 * _444;
    float _476 = _464 * _444;
    float _478 = _466 * _444;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _494 = fma(_482, _450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _496 = fma(_486, _450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _498 = fma(_490, _450, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _502 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _504 = fma(_494, _430, _492);
    float _506 = fma(_496, _430, _500);
    float _508 = fma(_498, _430, _502);
    float _510 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].x, _504);
    float _512 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].y, _506);
    float _514 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].z, _508);
    float _516 = _510 * _468;
    float _518 = _512 * _470;
    float _520 = _514 * _472;
    bool _522 = !_440;
    float _538;
    if (!_522)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _178 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_122);
        float _544 = 1.0 / _542;
        float _546 = _154 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _548 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _578 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_548);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = 1.0 / _556;
    float _592 = -_568;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _596;
    bool _600 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _602 = isnan(_548);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = _588 * _594;
    float _614 = -_588;
    float _616 = _614 + 1.0;
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _620 = 1.0 / _572;
    float _622 = _610 * _616;
    float _624 = -_610;
    float _626 = _624 + 1.0;
    float _628 = 1.0 / _576;
    float _630 = _598 * _590;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = fma(_630, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _634 * _620;
    bool _640 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _642 = isnan(_548);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _548 + _656;
    float _660 = _636 * _622;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _664 = _548 + _662;
    float _666 = -_650;
    float _668 = _666 + 1.0;
    float _670 = fma(_638, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _672 = _654 * _628;
    float _674 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _676 = _568 * _668;
    float _678 = fma(_672, _664, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _680 = fma(_670, _612, _674);
    float _682 = fma(_678, _676, _680);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[118].x, _682);
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _692;
    out.m_59.y = _694;
    out.m_59.z = _696;
    out.m_59.w = _698;
    bool _700 = !_618;
    float _716;
    if (!_700)
    {
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _704 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        float _720 = float(_122);
        float _722 = 1.0 / _720;
        float _724 = _154 * _722;
        _716 = _724;
    }
    _718 = false;
    float _726 = _716;
    float _728 = in.m_46.x;
    float _730 = in.m_46.y;
    float _732 = in.m_46.z;
    float _734 = _178 * 2.0;
    float _736 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = in.m_53.y;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _746 = in.m_53.z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = _336 * _516;
    float _752 = floor(_734);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = -_748;
    float _760 = fma(_736, 2.0, _758);
    float _762 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _766 = -_154;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _760);
    float _770 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _772 = int(_770);
    float _774 = _762 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _776 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = -_764;
    float _780 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _778);
    float _782 = _340 * _518;
    float _784 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _788 = _752 > 0.0;
    float _790 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _792 = _752 >= 0.0;
    bool _794 = isnan(_752);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _804 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _806 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _808 = fma(_786, -2.0, _744);
    float _810 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _802);
    float _812 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _816 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _818 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _810);
    float _820 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _812);
    float _822 = -_814;
    float _824 = _822 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _826 = _738 * 2.0;
    float _828 = _818 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _830 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _832 = _824 * _824;
    float _834 = -_816;
    float _836 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _834);
    float _838 = -_828;
    float _840 = _838 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _842 = -_830;
    float _844 = _842 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _846 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _848 = floor(_826);
    float _850 = fma(_840, _840, _832);
    float _852 = -_846;
    float _854 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _852);
    float _856 = fma(_844, _844, _850);
    float _858 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _860 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _872 = _870 != 0;
    float _874 = rsqrt(_856);
    float _876 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _878 = -_860;
    float _880 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _878);
    float _882 = _178 + _738;
    float _884 = -_858;
    float _886 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _888 = -_876;
    float _890 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _888);
    int _892 = _800 ? 0 : 1;
    float _894 = _738 + _746;
    bool _896 = _848 > 0.0;
    float _898 = _882 + (-1.0);
    bool _900 = _848 >= 0.0;
    bool _902 = isnan(_848);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    float _910 = _894 + (-1.0);
    int _912 = ~_892;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _746 * 2.0;
    float _922 = _840 * _874;
    float _924 = _844 * _874;
    int _926 = _916;
    int _928 = as_type<int>(_910);
    int _930 = as_type<int>(_920);
    float _932 = _738;
    int _934 = as_type<int>(_746);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_788)
    {
        int _938 = ~_892;
        int _940 = _938 + 1;
        _926 = _940;
    }
    int _942 = _926;
    float _944 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = _922 * _922;
    float _948 = floor(_920);
    bool _950 = !_868;
    int _952 = _950 ? 0 : 1;
    float _954 = _836 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _956 = fma(_924, _924, _946);
    bool _958 = !_864;
    int _960 = _958 ? 0 : 1;
    float _962 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _964 = !_872;
    int _966 = _964 ? 0 : 1;
    float _968 = -_954;
    float _970 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[0].y, _968);
    float _972 = rsqrt(_956);
    float _974 = as_type<float>(_942);
    if (_756)
    {
        _928 = 0;
        _930 = 0;
    }
    int _976 = _928;
    int _978 = _930;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = -_962;
    float _994 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    int _996 = _976;
    int _998 = _978;
    if (!_756)
    {
        _996 = 1;
    }
    int _1000 = _996;
    float _1002 = _824 * _874;
    if (!_756)
    {
        _998 = 2;
    }
    int _1004 = _998;
    float _1006 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].w, _970);
    bool _1008 = _1000 != 1;
    float _1010 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1012 = !_982;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].w, _994);
    bool _1018 = _1004 != 2;
    float _1020 = _836 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1022 = -_1010;
    float _1024 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1022);
    bool _1026 = _948 > 0.0;
    float _1028 = _924 * _972;
    float _1030 = -_1020;
    float _1032 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1030);
    float _1034 = _922 * _972;
    float _1036 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1038 = -_1028;
    float _1040 = _924 * _1038;
    float _1042 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1024);
    float _1044 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1032);
    float _1046 = -_1036;
    float _1048 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1046);
    float _1050 = -_1040;
    float _1052 = fma(_922, _1034, _1050);
    float _1054 = _1002 * _1034;
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1058 = _880 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1060 = _1052 * _1052;
    float _1062 = -_1028;
    float _1064 = _1002 * _1062;
    float _1066 = -_1056;
    float _1068 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1066);
    float _1070 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1048);
    float _1072 = fma(_1054, _1054, _1060);
    float _1074 = -_1058;
    float _1076 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1074);
    float _1078 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1068);
    float _1082 = fma(_1064, _1064, _1072);
    float _1084 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1076);
    float _1086 = -_1078;
    float _1088 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1086);
    float _1090 = _908 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1092 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _808);
    float _1094 = -_1084;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1080);
    float _1098 = rsqrt(_1082);
    bool _1100 = _948 >= 0.0;
    bool _1102 = isnan(_948);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1088);
    bool _1112 = !_986;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1118 = _1108 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1120 = abs(_1114);
    float _1122 = 1.0 / _1096;
    int _1124 = ~as_type<int>(_1118);
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _1128;
    float _1132 = _1118;
    float _1134 = _1090;
    if (!_1026)
    {
        int _1136 = ~as_type<int>(_1118);
        int _1138 = _1136 + 1;
        _1130 = _1138;
    }
    int _1140 = _1130;
    if (_1018)
    {
        _1132 = _178;
    }
    float _1142 = _1132;
    float _1144 = float(_942);
    float _1146 = _1052 * _1098;
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = float(_1120);
    float _1152 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1154 = int(_1152);
    float _1156 = _1142;
    if (!_1018)
    {
        _1156 = _746;
    }
    float _1158 = _1156;
    float _1160 = -_1148;
    float _1162 = _1160 + 1.0;
    int _1164 = abs(_1014);
    float _1166 = _1150 * _1144;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1170 = float(_1164);
    float _1172 = float(_1140);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1176 = fma(_1016, _1122, -1.0);
    float _1178 = _1162 * _1122;
    float _1180 = -_1174;
    float _1182 = fma(_1168, 2.0, _1180);
    float _1184 = _1170 * _1172;
    float _1186 = fma(_1162, _1176, 1.0);
    float _1188 = in.m_61.x;
    float _1190 = in.m_61.y;
    float _1192 = in.m_61.z;
    float _1194 = _1006 * _1178;
    float _1196 = _1110 * _1178;
    float _1198 = _1186 * _1186;
    float _1200 = _1176;
    if (!_1008)
    {
        _1200 = _746;
    }
    float _1202 = _1200;
    float _1204 = _1184 * (-2.0);
    float _1206 = _1202;
    if (_1008)
    {
        _1206 = _738;
    }
    float _1208 = _1206;
    float _1210 = fma(_1194, _1194, _1198);
    float _1212 = _1208;
    if (!_1008)
    {
        _974 = _738;
    }
    float _1214 = _974;
    float _1216 = fma(_918, _1204, _918);
    float _1218 = fma(_1196, _1196, _1210);
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1222 = ~as_type<int>(_1090);
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = -_154;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    int _1232 = _1226;
    float _1234 = _1214;
    if (!_896)
    {
        int _1236 = ~as_type<int>(_1090);
        int _1238 = _1236 + 1;
        _1232 = _1238;
    }
    int _1240 = _1232;
    float _1242 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1220);
    if (!_1008)
    {
        _1134 = _1214;
    }
    float _1244 = _1134;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = _1244;
    if (_1008)
    {
        _1234 = _178;
    }
    float _1250 = _1234;
    float _1252 = rsqrt(_1218);
    float _1254 = _1250;
    if (_1018)
    {
        _1212 = _738;
    }
    float _1256 = _1212;
    float _1258 = _178 + (-0.5);
    float _1260 = _1256;
    if (!_1018)
    {
        _1260 = _178;
    }
    float _1262 = _1260;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    if (_1008)
    {
        _1248 = _178;
    }
    float _1266 = _1248;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1270 = fma(_1204, _1188, _1188);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1008)
    {
        _1254 = _746;
    }
    float _1274 = _1254;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1278 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1270);
    float _1280 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1282 = int(_1280);
    float _1284 = _1274;
    if (_1008)
    {
        _1284 = _738;
    }
    float _1286 = _1284;
    float _1288 = -_1272;
    float _1290 = fma(_1276, 2.0, _1288);
    float _1292 = _1196 * _1252;
    float _1294 = _1194 * _1252;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1298 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1300 = log2(_1298);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1304 = -_1292;
    float _1306 = _922 * _1304;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1310 = fma(_1268, -2.0, _1302);
    float _1312 = -_1294;
    float _1314 = -_1306;
    float _1316 = fma(_924, _1312, _1314);
    float _1318 = fma(_1296, -2.0, _1308);
    float _1320 = _1186 * _1252;
    float _1322 = -_1294;
    float _1324 = _1002 * _1322;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1328 = float(_1154);
    float _1330 = _924 * _1320;
    float _1332 = float(_1282);
    float _1334 = _1300 * _154;
    bool _1336 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1338 = isnan(1.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1344 = _1340 || _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1348 = 1.0 + _1346;
    float _1350 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1326);
    float _1352 = 1.0 / _1328;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1356 = -_1292;
    float _1358 = -_1330;
    float _1360 = fma(_1002, _1356, _1358);
    float _1362 = -_1324;
    float _1364 = fma(_922, _1320, _1362);
    float _1366 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1354);
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _814 + _1368;
    float _1372 = exp2(_1334);
    bool _1374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1382 = _1378 || _1380;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1388 = float(_742);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1392 = _828 + _1390;
    float _1394 = float(_772);
    float _1396 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1384);
    float _1398 = 1.0 / _1332;
    float _1400 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1386);
    float _1402 = _1370 * _1370;
    float _1404 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1264);
    float _1406 = _1388 * _154;
    float _1408 = _1394 * _154;
    float _1410 = _1352 * _154;
    float _1412 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1396);
    float _1414 = 1.0 / _1348;
    float _1416 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    bool _1418 = !_990;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = -_1372;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1400);
    float _1428 = -_154;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1290);
    int _1432 = abs(_1420);
    float _1434 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1366);
    float _1436 = float(_1240);
    float _1438 = _1316 * _1316;
    float _1440 = _1382 ? _1424 : 0.0;
    float _1442 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1242);
    float _1444 = _1398 * _154;
    float _1446 = fma(_1360, _1360, _1438);
    float _1448 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1318);
    float _1450 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1310);
    if (_1344)
    {
        float _1452 = _1440 * _1414;
        _158 = _1452;
    }
    float _1454 = _158;
    float _1456 = fma(_1364, _1364, _1446);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _830 + _1458;
    float _1462 = fma(_1392, _1392, _1402);
    float _1464 = _1166 * (-2.0);
    float _1466 = float(_1432);
    float _1468 = fma(_1216, _1454, _1278);
    float _1470 = fma(_1460, _1460, _1462);
    float _1472 = rsqrt(_1456);
    float _1474 = fma(_944, _1464, _944);
    float _1476 = fma(_1464, _1190, _1190);
    float _1478 = _738 + (-0.5);
    float _1480 = _1466 * _1436;
    float _1482 = _178 + _746;
    float _1484 = _1468 * 0.15915493667125701904296875;
    float _1486 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1476);
    float _1488 = sqrt(_1470);
    float _1490 = _1480 * (-2.0);
    float _1492 = _1482 + (-1.0);
    float _1494 = fma(_1474, _1454, _1486);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1502 = _1500 != 0;
    float _1504 = fma(_1490, _1192, _1192);
    float _1506 = _1494 * 0.15915493667125701904296875;
    float _1508 = rsqrt(_1470);
    float _1510 = _1360 * _1472;
    float _1512 = _1364 * _1472;
    float _1514 = _1316 * _1472;
    bool _1516 = !_1502;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = _924 * _1510;
    float _1522 = _1002 * _1512;
    float _1524 = _922 * _1514;
    float _1526 = _1488 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1528 = -_1520;
    float _1530 = fma(_922, _1512, _1528);
    float _1532 = -_1522;
    float _1534 = fma(_924, _1514, _1532);
    float _1536 = -_1524;
    float _1538 = fma(_1002, _1510, _1536);
    float _1540 = precise::min(_774, _1526);
    float _1542 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1544 = _1530 * _1530;
    float _1546 = _746 + (-0.5);
    float _1548 = _1484 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = _1508 * _1540;
    float _1554 = fma(_1534, _1534, _1544);
    float _1556 = fma(_1542, _1490, _1542);
    float _1558 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1504);
    float _1560 = _1370 * _1552;
    float _1562 = fma(_1538, _1538, _1554);
    float _1564 = _1392 * _1552;
    float _1566 = _1460 * _1552;
    float _1568 = -_1560;
    float _1570 = _1370 + _1568;
    float _1572 = rsqrt(_1562);
    float _1574 = -_1564;
    float _1576 = _1392 + _1574;
    float _1578 = fma(_1556, _1454, _1558);
    float _1580 = _1570 * _1570;
    float _1582 = -_1566;
    float _1584 = _1460 + _1582;
    bool _1586 = !_1498;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = _1578 * 0.15915493667125701904296875;
    float _1592 = fma(_1576, _1576, _1580);
    float _1594 = _1484 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = fma(_1584, _1584, _1592);
    float _1600 = in.m_63.x;
    float _1602 = in.m_63.y;
    float _1604 = in.m_63.z;
    float _1606 = _1506 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1538 * _1572;
    float _1612 = _1534 * _1572;
    float _1614 = _1530 * _1572;
    float _1616 = _922 * _1610;
    float _1618 = _1002 * _1612;
    float _1620 = _924 * _1614;
    float _1622 = _1506 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = -_1616;
    float _1628 = fma(_924, _1612, _1626);
    float _1630 = -_1618;
    float _1632 = fma(_922, _1614, _1630);
    float _1634 = -_1620;
    float _1636 = fma(_1002, _1610, _1634);
    float _1638 = _1590 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = _1550 * _1608;
    float _1644 = _1596 * _1608;
    float _1646 = sqrt(_1598);
    float _1648 = _1550 * _1624;
    float _1650 = _1596 * _1624;
    float _1652 = _1550 * _1640;
    float _1654 = _1624 * _1640;
    float _1656 = _1596 * _1640;
    float _1658 = _1608 * _1640;
    float _1660 = _1628 * _1628;
    float _1662 = _1590 * 6.283185482025146484375;
    float _1664 = sin(_1662);
    float _1666 = _1508 * _1646;
    float _1668 = fma(_1636, _1636, _1660);
    float _1670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1602);
    float _1672 = _790 * _1666;
    float _1674 = fma(_1632, _1632, _1668);
    float _1676 = _762 * _1666;
    float _1678 = _1116 * _1666;
    float _1680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    float _1682 = _1672 * _1670;
    float _1684 = rsqrt(_1674);
    float _1686 = _1676 * _1680;
    float _1688 = fma(_1664, _1650, _1642);
    float _1690 = _1656 * _1682;
    float _1692 = _1678 * _1604;
    float _1694 = -_1682;
    float _1696 = _1664 * _1694;
    float _1698 = -_1648;
    float _1700 = fma(_1664, _1644, _1698);
    float _1702 = fma(_1688, _1686, _1690);
    float _1704 = -_1644;
    float _1706 = fma(_1664, _1648, _1704);
    float _1708 = _1652 * _1682;
    float _1710 = fma(_1654, _1686, _1696);
    float _1712 = fma(_1700, _1692, _1702);
    float _1714 = fma(_1664, _1642, _1650);
    float _1716 = fma(_1706, _1686, _1708);
    float _1718 = fma(_1658, _1692, _1710);
    float _1720 = _1610 * _1712;
    float _1722 = _1632 * _1684;
    float _1724 = fma(_1714, _1692, _1716);
    float _1726 = _1612 * _1712;
    float _1728 = _1636 * _1684;
    float _1730 = fma(_1722, _1718, _1720);
    float _1732 = _1614 * _1712;
    float _1734 = _1628 * _1684;
    float _1736 = fma(_1728, _1718, _1726);
    float _1738 = fma(_924, _1724, _1730);
    float _1740 = -_1566;
    float _1742 = _830 + _1740;
    float _1744 = fma(_922, _1724, _1736);
    float _1746 = _830 + _1738;
    float _1748 = fma(_1734, _1718, _1732);
    float _1750 = -_1560;
    float _1752 = _814 + _1750;
    float _1754 = _828 + _1744;
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1758 = _1746 + _1756;
    float _1760 = fma(_1002, _1724, _1748);
    float _1762 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1766 = _1754 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = _814 + _1760;
    float _1772 = fma(_1766, _1766, _1768);
    float _1774 = -_1564;
    float _1776 = _828 + _1774;
    float _1778 = sqrt(_1772);
    float _1780 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1762);
    float _1782 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    bool _1784 = _1778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1788 = _1786 != 0;
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1792 = _1790 != 0;
    bool _1794 = !_1788;
    int _1796 = _1794 ? 0 : 1;
    bool _1798 = !_1792;
    int _1800 = _1798 ? 0 : 1;
    float _1802 = _1780;
    float _1804 = _1718;
    float _1806 = _1732;
    float _1808 = _1560;
    float _1810 = _1564;
    float _1812 = _1772;
    bool _1814 = _1792;
    if (!_1784)
    {
        _1802 = _1754;
    }
    float _1816 = _1802;
    float _1818 = _1816;
    if (!_1784)
    {
        _1804 = _1746;
    }
    float _1820 = _1804;
    float _1822 = _1820;
    if (!_1784)
    {
        _1806 = _1770;
    }
    float _1824 = _1806;
    bool _1826 = !_1784;
    float _1828 = _1824;
    if (!_1826)
    {
        float _1830 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1834 = _1778 + _1832;
        float _1836 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1838 = _1834 * _1830;
        float _1840 = rsqrt(_1772);
        float _1842 = _1838 * 0.15915493667125701904296875;
        float _1844 = _1842 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = _1842 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = _1846 + (-1.0);
        float _1854 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1856 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = _1840 * _1854;
        float _1860 = fma(_1770, _1846, _1856);
        float _1862 = fma(_1766, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1864 = fma(_1758, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1828 = _1860;
        _1818 = _1862;
        _1822 = _1864;
    }
    float _1866 = _1828;
    float _1868 = _1818;
    float _1870 = _1822;
    float _1872 = -_814;
    float _1874 = _1872 + _1866;
    float _1876 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1878 = -_828;
    float _1880 = _1878 + _1868;
    float _1882 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1884 = _1874 * _1874;
    float _1886 = -_830;
    float _1888 = _1886 + _1870;
    float _1890 = 1.0 / _1876;
    float _1892 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1882);
    float _1894 = fma(_1880, _1880, _1884);
    float _1896 = -_1566;
    float _1898 = _1896 + _1870;
    float _1900 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1892);
    float _1902 = fma(_1888, _1888, _1894);
    float _1904 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1906 = sqrt(_1902);
    float _1908 = _1904 + _1876;
    float _1910 = _1908 * _1890;
    float _1912 = _1910 * 0.5;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1916 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1914);
    bool _1918 = _1906 > 0.0;
    float _1920 = 1.0 / _1916;
    bool _1922 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.5);
    bool _1930 = _1926 || _1928;
    float _1932 = -_1560;
    float _1934 = _1932 + _1866;
    bool _1936 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(0.5);
    bool _1944 = _1940 || _1942;
    float _1946 = -_1564;
    float _1948 = _1946 + _1868;
    float _1950 = _1870;
    float _1952 = _1890;
    float _1954 = _1874;
    float _1956 = _1948;
    float _1958 = _1934;
    if (!_1918)
    {
        _1950 = _1948;
    }
    float _1960 = _1950;
    float _1962 = _1960;
    if (!_1918)
    {
        _1808 = _1934;
    }
    float _1964 = _1808;
    float _1966 = _1964;
    if (!_1918)
    {
        _1810 = _1898;
    }
    float _1968 = _1810;
    bool _1970 = !_1918;
    float _1972 = _1968;
    float _1974 = _1968;
    float _1976 = _1920;
    if (!_1970)
    {
        float _1978 = _246 * _246;
        float _1980 = fma(_330, _330, _1978);
        float _1982 = rsqrt(_1902);
        float _1984 = fma(_332, _332, _1980);
        float _1986 = sqrt(_1984);
        float _1988 = _1880 * _1982;
        float _1990 = _1874 * _1982;
        float _1992 = _1888 * _1982;
        bool _1994 = _1986 > 0.0;
        float _1996 = _1982;
        float _1998 = _1986;
        _1952 = _1990;
        if (!_1994)
        {
            _1996 = _1948;
        }
        float _2000 = _1996;
        _1962 = _2000;
        if (!_1994)
        {
            _1998 = _1934;
        }
        float _2002 = _1998;
        _1966 = _2002;
        if (!_1994)
        {
            _1972 = _1898;
        }
        float _2004 = _1972;
        bool _2006 = !_1994;
        _1974 = _2004;
        if (!_2006)
        {
            float _2008 = rsqrt(_1984);
            float _2010 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2012 = _246 * _2008;
            float _2014 = _330 * _2008;
            float _2016 = _1990 * _2012;
            float _2018 = _332 * _2008;
            float _2020 = fma(_1988, _2014, _2016);
            float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2024 = fma(_1992, _2018, _2020);
            float _2026 = _2024 * _2022;
            float _2028 = fma(_330, _2026, _1948);
            float _2030 = fma(_246, _2026, _1934);
            float _2032 = fma(_332, _2026, _1898);
            _1962 = _2028;
            _1966 = _2030;
            _1974 = _2032;
        }
    }
    float _2034 = _1962;
    float _2036 = _1966;
    float _2038 = _1974;
    float _2040 = _1952;
    float _2042 = _2036;
    float _2044 = _2034;
    float _2046 = _2038;
    float _2048 = _2040;
    if (_1930)
    {
        _1954 = 1.0;
    }
    float _2050 = _1954;
    float _2052 = _2050;
    if (!_1944)
    {
        float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2056 = _1752 + _2054;
        float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2060 = _1776 + _2058;
        float _2062 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2064 = _2056 * _2056;
        float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2068 = _1742 + _2066;
        float _2070 = fma(_2060, _2060, _2064);
        float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2074 = fma(_2068, _2068, _2070);
        float _2076 = sqrt(_2074);
        float _2078 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2080 = precise::min(_2076, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2082 = _2080 * _2072;
        float _2084 = -_1776;
        float _2086 = _2084 + _2034;
        float _2088 = _2078 * _2082;
        float _2090 = -_1752;
        float _2092 = _2090 + _2036;
        float _2094 = -_1742;
        float _2096 = _2094 + _2038;
        float _2098 = fma(_2086, _2088, _1776);
        float _2100 = fma(_2092, _2088, _1752);
        float _2102 = fma(_2096, _2088, _1742);
        _1956 = _2072;
        _2042 = _2100;
        _2044 = _2098;
        _2046 = _2102;
    }
    float _2104 = _1956;
    float _2106 = _2042;
    float _2108 = _2044;
    float _2110 = _2046;
    float _2112 = _2104;
    if (_1930)
    {
        _2048 = 1.0;
    }
    float _2114 = _2048;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2118 = _1920 * _2116;
    float _2120 = _2114;
    if (!_1930)
    {
        float _2122 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2124 = _2122 * 0.15915493667125701904296875;
        float _2126 = _2124 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2132 = _2130 * 0.15915493667125701904296875;
        float _2134 = _2124 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = 1.0 / _2128;
        float _2140 = _2132 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = _2136 * _2138;
        float _2146 = _2132 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2152 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2150;
        float _2154 = _2142 * _2144;
        float _2156 = 1.0 / _2152;
        float _2158 = 1.0 / _2154;
        float _2160 = _2148 * _2158;
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = fma(_2118, _2160, _2162);
        float _2166 = _2164 * _2156;
        float _2168 = precise::clamp(_2166, 0.0, 1.0);
        _2112 = _2144;
        _1976 = _2124;
        _2052 = _2168;
    }
    float _2170 = _2112;
    float _2172 = _1976;
    float _2174 = _2052;
    float _2176 = _2170;
    if (!_1930)
    {
        float _2178 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2180 = _2178 * 0.15915493667125701904296875;
        float _2182 = _2180 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        float _2186 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2188 = _2186 * 0.15915493667125701904296875;
        float _2190 = _2180 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = 1.0 / _2184;
        float _2196 = _2188 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        float _2200 = _2192 * _2194;
        float _2202 = _2188 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = _2198 * _2200;
        float _2208 = 1.0 / _2206;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2210;
        float _2214 = 1.0 / _2212;
        float _2216 = _2204 * _2208;
        float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2220 = fma(_2118, _2216, _2218);
        float _2222 = _2220 * _2214;
        float _2224 = precise::clamp(_2222, 0.0, 1.0);
        float _2226 = -_2224;
        float _2228 = _2226 + 1.0;
        _1958 = _2206;
        _2176 = _2194;
        _2120 = _2228;
    }
    float _2230 = _1958;
    float _2232 = _2176;
    float _2234 = _2120;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2106 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2242 = _2108 + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2110 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = sqrt(_2252);
    float _2258 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2260 = _2242 * _2258;
    float _2262 = _2246 * _2258;
    float _2264 = _2260 * _2260;
    float _2266 = _2262 * _2262;
    float _2268 = _2264 + _2266;
    float _2270 = sqrt(_2268);
    bool _2272 = _2270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2276 = _2270 + _2274;
    float _2278 = _2246;
    float _2280 = _2248;
    float _2282 = _2276;
    float _2284 = _2230;
    float _2286 = _2258;
    float _2288 = _2232;
    if (_2272)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2278 = _2290;
    }
    float _2292 = _2278;
    if (_2272)
    {
        float _2294 = rsqrt(_2268);
        _2280 = _2294;
    }
    float _2296 = _2280;
    float _2298 = _2296;
    if (_2272)
    {
        float _2300 = _2276 * _2292;
        _2282 = _2300;
    }
    float _2302 = _2282;
    if (_2272)
    {
        float _2304 = _2302 * 0.15915493667125701904296875;
        _2284 = _2304;
    }
    float _2306 = _2284;
    float _2308 = _2292;
    float _2310 = _2306;
    if (_2272)
    {
        float _2312 = _2306 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        _2308 = _2314;
    }
    float _2316 = _2308;
    float _2318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2320 = precise::max(0.0, _2318);
    float _2322 = _2172;
    if (_2272)
    {
        float _2324 = _2306 * 6.283185482025146484375;
        float _2326 = cos(_2324);
        _2322 = _2326;
    }
    float _2328 = _2322;
    float _2330 = -_2258;
    float _2332 = -_2320;
    float _2334 = fma(_2238, _2330, _2332);
    if (_2272)
    {
        float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2336;
    }
    float _2338 = _2286;
    float _2340 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2342 = _2316;
    float _2344 = _2338;
    if (_2272)
    {
        float _2346 = fma(_2316, _2338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2288 = _2346;
    }
    float _2348 = _2288;
    float _2350 = _2348;
    if (!_2272)
    {
        _2342 = _2260;
    }
    float _2352 = _2342;
    float _2354 = floor(_2340);
    float _2356 = _2352;
    float _2358 = _2328;
    if (_2272)
    {
        float _2360 = _2328 + (-1.0);
        _2344 = _2360;
    }
    float _2362 = _2344;
    float _2364 = _2362;
    if (_2272)
    {
        float _2366 = _2296 * _2348;
        _1812 = _2366;
    }
    float _2368 = _1812;
    if (!_2272)
    {
        _2298 = _2334;
    }
    float _2370 = _2298;
    float _2372 = _2370;
    if (_2272)
    {
        float _2374 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2374;
    }
    float _2376 = _2310;
    if (_2272)
    {
        float _2378 = _2260 * _2368;
        _2356 = _2378;
    }
    float _2380 = _2356;
    if (!_2272)
    {
        _2364 = _2262;
    }
    float _2382 = _2364;
    float _2384 = _2382;
    if (_2272)
    {
        float _2386 = _2262 * _2368;
        _2384 = _2386;
    }
    float _2388 = _2384;
    if (!_2272)
    {
        _2350 = _2264;
    }
    float _2390 = _2350;
    float _2392 = _2390;
    if (_2272)
    {
        float _2394 = fma(_2334, _2328, _2376);
        _2372 = _2394;
    }
    float _2396 = _2372;
    if (_2272)
    {
        float _2398 = _2380 * _2380;
        _2392 = _2398;
    }
    float _2400 = _2392;
    if (!_2272)
    {
        _2358 = _2266;
    }
    float _2402 = _2358;
    float _2404 = _2402;
    if (_2272)
    {
        float _2406 = _2388 * _2388;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2412 = fma(_2396, _2396, _2400);
    float _2414 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2416 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2418 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2410);
    float _2420 = _2412 + _2408;
    float _2422 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2424 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2416);
    float _2426 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2418);
    float _2428 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2422);
    float _2430 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2424);
    float _2432 = rsqrt(_2420);
    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2436 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2434);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2442 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2444 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2448 = -_2438;
    float _2450 = _2448 + 1.0;
    float _2452 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2440);
    float _2454 = _2442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2456 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2460 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2462 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2452);
    float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2456);
    float _2466 = abs(_2450);
    float _2468 = log2(_2466);
    float _2470 = -_2460;
    float _2472 = fma(_2470, _2458, 1.0);
    float _2474 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2476 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2464);
    float _2478 = _2432 * _2380;
    float _2480 = _2432 * _2388;
    float _2482 = -_2354;
    float _2484 = _2340 + _2482;
    float _2486 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2476);
    float _2488 = _2432 * _2396;
    float _2490 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2492 = floor(_2414);
    float _2494 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2496 = -_2490;
    float _2498 = fma(_2488, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2496);
    float _2500 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2494);
    float _2502 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2504 = -_2480;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2498);
    float _2508 = log2(_2472);
    float _2510 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2512 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2500);
    float _2514 = fma(_2506, -0.5, 0.5);
    float _2516 = fma(_2506, 0.5, 0.5);
    float _2518 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2510);
    float _2520 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2512);
    float _2522 = 1.0 / _2486;
    float _2524 = fma(_2516, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2526 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2518);
    float _2528 = -_2492;
    float _2530 = _2414 + _2528;
    float _2532 = _2488 + 1.0;
    float _2534 = fma(_2516, _2524, -0.212114393711090087890625);
    float _2536 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2526);
    float _2538 = exp2(_2502);
    float _2540 = _2508 * 0.693147182464599609375;
    float _2542 = fma(_2516, _2534, 1.570728778839111328125);
    float _2544 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2546 = sqrt(_2514);
    float _2548 = _2520 * _2522;
    float _2550 = fma(_2548, 0.5, 0.5);
    float _2552 = -_2488;
    float _2554 = fma(_2538, _2532, _2552);
    float _2556 = _2536 * _2522;
    float _2558 = fma(_2554, 0.5, 0.5);
    float _2560 = fma(_2556, -0.5, 0.5);
    float _2562 = _2546 * 0.636619746685028076171875;
    float2 _8675 = float2(_2484, _2530);
    float _2564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8675, float2(0.0), isnan(_8675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8675, float2(0.0), isnan(_8675)), level(0.0)).x;
    float _2566 = -_2542;
    float _2568 = fma(_2562, _2566, 1.0);
    float3 _8691 = float3(_2550, _2560, _2544);
    float _2570 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8691, float3(0.0), isnan(_8691)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8691, float3(0.0), isnan(_8691)), level(0.0)).x;
    float3 _8702 = float3(_2550, _2560, _2544);
    float4 _2573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8702, float3(0.0), isnan(_8702)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8702, float3(0.0), isnan(_8702)), level(0.0)).xyzw;
    float _2575 = _2573.x;
    float _2577 = _2573.y;
    float _2579 = _2573.z;
    float _2581 = _2573.w;
    float2 _8718 = float2(_2568, _2558);
    float3 _2585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8718, float2(0.0), isnan(_8718)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8718, float2(0.0), isnan(_8718)), level(0.0)).xyz;
    float _2587 = _2585.x;
    float _2589 = _2585.y;
    float _2591 = _2585.z;
    float _2593 = float(uint(_742));
    float _2595 = trunc(_1410);
    int _2597 = int(_2595);
    float _2599 = float(uint(_772));
    float _2601 = in.m_65.w;
    bool _2603 = _746 > 0.5;
    float _2605 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2609 = _2607 != 0;
    out.m_67.x = _1776;
    out.m_67.y = _1752;
    out.m_67.z = _1742;
    int _2611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2613 = _2611 != 0;
    float _2615 = 1.0 / _2593;
    bool _2617 = _738 > 0.5;
    out.m_69.w = _1540;
    int _2619 = abs(_952);
    float _2621 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2623 = abs(_1800);
    out.m_71.x = _1676;
    int _2625 = ~_772;
    int _2627 = _2625 + 1;
    float _2629 = 1.0 / _2599;
    float _2631 = float(uint(_2597));
    float _2633 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    float _2635 = trunc(_1444);
    int _2637 = int(_2635);
    int _2639 = as_type<int>(_2615) + (-2);
    out.m_73.w = _2601;
    float _2641 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2633);
    float _2643 = _2486;
    float _2645 = _2536;
    if (_2609)
    {
        _344 = _178;
    }
    float _2647 = _344;
    float _2649 = as_type<float>(_2639) * _2631;
    int _2651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2653 = _2651 != 0;
    float _2655 = exp2(_2605);
    int _2657 = as_type<int>(_2629) + (-2);
    float _2659 = in.m_53.w;
    int _2661 = ~_772;
    int _2663 = _2661 + 1;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2667 = _726 + _2665;
    int _2669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2671 = _2669 != 0;
    out.m_75.x = _2108;
    out.m_75.y = _2106;
    out.m_75.z = _2110;
    float _2673 = _2647;
    if (!_2609)
    {
        _2673 = _738;
    }
    float _2675 = _2673;
    float _2677 = trunc(_2649);
    float _2679 = precise::max(_2677, 0.0);
    uint _2682 = uint(_2679);
    float _2684 = float(uint(_2637));
    float _2686 = _2675;
    if (_2609)
    {
        _932 = 1.0;
    }
    float _2688 = _932;
    float _2690 = _2688;
    if (_2653)
    {
        bool _2692 = _178 > 0.5;
        _1814 = _2692;
    }
    bool _2694 = _1814;
    float _2696 = as_type<float>(_2657) * _2684;
    int _2698 = ~_742;
    int _2700 = _2698 + 1;
    float _2702 = -_2655;
    float _2704 = _2702 + 1.0;
    float _2706 = in.m_77.x;
    float _2708 = trunc(_2696);
    float _2710 = precise::max(_2708, 0.0);
    uint _2712 = uint(_2710);
    if (!_2609)
    {
        _2690 = 7.345489978790283203125;
    }
    float _2714 = _2690;
    float _2716 = float(_2637);
    int _2718 = _2700 * int(_2682);
    int _2720 = _2718 + _2597;
    float _2722 = _2714 * _178;
    bool _2724 = _2716 >= _1394;
    bool _2726 = isnan(_2716);
    bool _2728 = _2724 || _2726;
    bool _2730 = isnan(_1394);
    bool _2732 = _2728 || _2730;
    float _2734 = float(_2732);
    float _2736 = float(uint(_2720));
    int _2738 = _2663 * int(_2712);
    int _2740 = _2738 + _2637;
    float _2742 = as_type<float>(_2639) * _2736;
    float _2744 = float(uint(_2740));
    float _2746 = trunc(_2742);
    float _2748 = precise::max(_2746, 0.0);
    uint _2750 = uint(_2748);
    float _2752 = _2744;
    int _2754 = int(_2712);
    float _2756 = _2714;
    if (_2653)
    {
        float _2758 = -_2706;
        float _2760 = _2758 + 1.0;
        _934 = as_type<int>(_2760);
    }
    int _2762 = _934;
    int _2764 = _2762;
    if (!_2653)
    {
        _936 = _2706;
    }
    float _2766 = _936;
    float _2768 = as_type<float>(_2657) * _2744;
    float _2770 = _2766;
    if (_2609)
    {
        _2752 = 1.0;
    }
    float _2772 = _2752;
    float _2774 = _2772;
    if (_2653)
    {
        float _2776 = _2694 ? as_type<float>(_2762) : _2706;
        _2770 = _2776;
    }
    float _2778 = _2770;
    float _2780 = trunc(_2768);
    float _2782 = precise::max(_2780, 0.0);
    uint _2784 = uint(_2782);
    bool _2786 = _2659 > 0.5;
    if (_2671)
    {
        float _2788 = -_2706;
        float _2790 = _2788 + 1.0;
        _2764 = as_type<int>(_2790);
    }
    int _2792 = _2764;
    float _2794 = in.m_77.y;
    int _2796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2798 = _2796 != 0;
    if (!_2609)
    {
        _2774 = 1.2345600128173828125;
    }
    float _2800 = _2774;
    int _2802 = int(_2682) + int(_2750);
    float _2804 = float(_122);
    float _2806 = _2675 * _2800;
    int _2808 = ~_742;
    int _2810 = _2808 + 1;
    int _2812 = ~_772;
    int _2814 = _2812 + 1;
    float _2816 = 1.0 / _2804;
    int _2818 = int(_2712) + int(_2784);
    if (_2798)
    {
        float _2820 = -_2706;
        float _2822 = _2820 + 1.0;
        _2754 = as_type<int>(_2822);
    }
    int _2824 = _2754;
    int _2826 = _2810 * _2802;
    int _2828 = _2826 + _2597;
    if (!_2671)
    {
        _2756 = _2706;
    }
    float _2830 = _2756;
    float _2832 = _2830;
    if (!_2798)
    {
        _2686 = _2706;
    }
    float _2834 = _2686;
    int _2836 = _2814 * _2818;
    int _2838 = _2836 + _2637;
    float _2840 = floor(_2722);
    float _2842 = _2834;
    if (_2671)
    {
        float _2844 = _2603 ? as_type<float>(_2792) : _2706;
        _2832 = _2844;
    }
    float _2846 = _2832;
    if (_2798)
    {
        float _2848 = _2617 ? as_type<float>(_2824) : _2706;
        _2842 = _2848;
    }
    float _2850 = _2842;
    float _2852 = -_2794;
    float _2854 = _2852 + 1.0;
    bool _2856 = uint(_2828) >= uint(_742);
    float _2858 = float(_2597);
    float _2860 = floor(_2806);
    bool _2862 = !_2856;
    int _2864 = _2862 ? 0 : (-1);
    float _2866 = _1408 * _2816;
    int _2868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2870 = _2868 != 0;
    int _2872 = _2617 ? as_type<int>(_2854) : as_type<int>(_2794);
    int _2874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2876 = _2874 != 0;
    bool _2878 = uint(_2838) >= uint(_772);
    bool _2880 = _2858 >= _1388;
    bool _2882 = isnan(_2858);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(_1388);
    bool _2888 = _2884 || _2886;
    float _2890 = float(_2888);
    float _2892 = _2870 ? as_type<float>(_2872) : _2794;
    bool _2894 = !_2613;
    int _2896 = _2894 ? 0 : 1;
    float _2898 = -_2860;
    float _2900 = _2806 + _2898;
    bool _2902 = !_2876;
    int _2904 = _2902 ? 0 : 1;
    float _2906 = trunc(_2890);
    int _2908 = int(_2906);
    bool _2910 = !_2878;
    int _2912 = _2910 ? 0 : (-1);
    float _2914 = _1394 * _2900;
    int _2916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2918 = _2916 != 0;
    float _2920 = _1406 * _2816;
    int _2922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2924 = _2922 != 0;
    int _2926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2928 = _2926 != 0;
    int _2930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2932 = _2930 != 0;
    float _2934 = trunc(_2920);
    int _2936 = int(_2934);
    int _2938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2940 = _2938 != 0;
    float _2942 = -_2840;
    float _2944 = _2722 + _2942;
    int _2946 = ~_2802;
    int _2948 = _2946 + _2864;
    int _2950 = _2948 + 1;
    int _2952 = ~_2818;
    int _2954 = _2952 + _2912;
    int _2956 = _2954 + 1;
    float _2958 = _2944 * _1388;
    float _2960 = trunc(_2734);
    int _2962 = int(_2960);
    int _2964 = _742 * _2950;
    int _2966 = _2964 + _2597;
    int _2968 = abs(_2904);
    int _2970 = _772 * _2956;
    int _2972 = _2970 + _2637;
    float _2974 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2976 = _2974 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2978 = _2786 ? as_type<int>(_2854) : as_type<int>(_2794);
    bool _2980 = _742 == 0;
    float _2982 = trunc(_2958);
    int _2984 = int(_2982);
    int _2986 = ~_2908;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    bool _2992 = !_2980;
    int _2994 = _2992 ? _2966 : (-1);
    bool _2996 = !_2940;
    int _2998 = _2996 ? 0 : 1;
    bool _3000 = _772 == 0;
    int _3002 = _2994 * _2990;
    int _3004 = ~_2962;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    float _3010 = 1.0 / _2976;
    bool _3012 = !_3000;
    int _3014 = _3012 ? _2972 : (-1);
    int _3016 = abs(_1518);
    int _3018 = abs(_960);
    int _3020 = _2984 * _2968;
    int _3022 = _3020 + _2597;
    int _3024 = _742 + (-1);
    int _3026 = _3008 * _3014;
    int _3028 = abs(_966);
    int _3030 = _2908 * _3024;
    int _3032 = _3030 + _3002;
    int _3034 = _772 + (-1);
    float _3036 = trunc(_2914);
    int _3038 = int(_3036);
    int _3040 = abs(_2896);
    float _3042 = float(uint(_3022));
    int _3044 = _2962 * _3034;
    int _3046 = _3044 + _3026;
    int _3048 = _3032 * _2619;
    int _3050 = _3046 * _3016;
    int _3052 = abs(_2998);
    float _3054 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3056 = _3054 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3058 = trunc(_2866);
    int _3060 = int(_3058);
    int _3062 = abs(_1588);
    int _3064 = _2936 * _3018;
    int _3066 = _3064 + _3048;
    float _3068 = as_type<float>(_2639) * _3042;
    int _3070 = _3038 * _3052;
    int _3072 = _3070 + _2637;
    int _3074 = abs(_1796);
    int _3076 = _3022 * _3028;
    int _3078 = _3076 + _3066;
    float _3080 = 1.0 / _3056;
    float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3088 = _3086 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3090 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3092 = _726 + _3090;
    int _3094 = _2984 * _3040;
    int _3096 = _3094 + _3078;
    float _3098 = _3084 * _3010;
    int _3100 = _3060 * _3062;
    int _3102 = _3100 + _3050;
    float _3104 = in.m_79.x;
    float _3106 = in.m_79.y;
    float _3108 = in.m_79.z;
    float _3110 = in.m_79.w;
    bool _3112 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3114 = isnan(_726);
    bool _3116 = _3112 || _3114;
    bool _3118 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3120 = _3116 || _3118;
    float _3122 = float(_3120);
    float _3124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3126 = _3072 * _3074;
    int _3128 = _3126 + _3102;
    float _3130 = in.m_81.x;
    float _3132 = in.m_81.y;
    float _3134 = in.m_81.z;
    float _3136 = _3088 * _3080;
    float _3138 = fma(_3098, _3092, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3140 = float(uint(_3096));
    float _3142 = fma(_3136, _2667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3144 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3146 = isnan(_726);
    bool _3148 = _3144 || _3146;
    bool _3150 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3152 = _3148 || _3150;
    float _3154 = float(_3152);
    int _3156 = _3038 * _2623;
    int _3158 = _3156 + _3128;
    bool _3160 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3162 = isnan(_726);
    bool _3164 = _3160 || _3162;
    bool _3166 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3168 = _3164 || _3166;
    float _3170 = float(_3168);
    float _3172 = as_type<float>(_2639) * _3140;
    float _3174 = -_3154;
    float _3176 = _3174 + 1.0;
    float _3178 = float(uint(_3158));
    float _3180 = -_3170;
    float _3182 = _3180 + 1.0;
    float _3184 = trunc(_3172);
    float _3186 = precise::max(_3184, 0.0);
    uint _3188 = uint(_3186);
    float _3190 = _3170 * _3176;
    float _3192 = as_type<float>(_2657) * _3178;
    int _3194 = ~_742;
    int _3196 = _3194 + 1;
    float _3198 = _2924 ? as_type<float>(_2978) : _2794;
    float _3200 = _3122 * _3182;
    float _3202 = _3130 * _3108;
    float _3204 = trunc(_3192);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    bool _3210 = _1602 != 0.0;
    bool _3212 = isnan(_1602);
    bool _3214 = _3210 || _3212;
    bool _3216 = isnan(0.0);
    bool _3218 = _3214 || _3216;
    float _3220 = _3132 * _3104;
    float _3222 = -_3202;
    float _3224 = fma(_3134, _3104, _3222);
    float _3226 = _3134 * _3106;
    bool _3228 = _1600 == 0.0;
    bool _3230 = !_3218;
    bool _3232 = _3228 && _3230;
    float _3234 = -_3220;
    float _3236 = fma(_3106, _3130, _3234);
    float _3238 = _3224 * _3110;
    int _3240 = _3196 * int(_3188);
    int _3242 = _3240 + _3096;
    bool _3244 = _1604 == 0.0;
    bool _3246 = _3244 && _3232;
    float _3248 = -_3226;
    float _3250 = fma(_3108, _3132, _3248);
    float _3252 = _3138 * _3200;
    float _3254 = float(uint(_3072));
    float _3256 = trunc(_3068);
    float _3258 = precise::max(_3256, 0.0);
    uint _3260 = uint(_3258);
    float _3262 = float(uint(_3242));
    float _3264 = -_3122;
    float _3266 = _3264 + 1.0;
    int _3268 = _2627 * int(_3208);
    int _3270 = _3268 + _3158;
    float _3272 = as_type<float>(_2657) * _3254;
    float _3274 = _2794;
    float _3276 = _3136;
    float _3278 = _3138;
    float _3280 = _3134;
    if (_2928)
    {
        float _3282 = _2603 ? _2854 : _2794;
        _3274 = _3282;
    }
    float _3284 = _3274;
    float _3286 = as_type<float>(_2639) * _3262;
    int _3288 = ~_772;
    int _3290 = _3288 + 1;
    float _3292 = fma(_3266, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3252);
    float _3294 = float(uint(_3270));
    float _3296 = trunc(_3286);
    float _3298 = precise::max(_3296, 0.0);
    uint _3300 = uint(_3298);
    if (_3246)
    {
        _3276 = _3130;
    }
    float _3302 = _3276;
    float _3304 = _3302;
    if (!_3246)
    {
        float _3306 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3130);
        _3304 = _3306;
    }
    float _3308 = _3304;
    if (_3246)
    {
        _3278 = _3132;
    }
    float _3310 = _3278;
    float _3312 = as_type<float>(_2657) * _3294;
    float _3314 = _3310;
    if (!_3246)
    {
        float _3316 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3132);
        _3314 = _3316;
    }
    float _3318 = _3314;
    int _3320 = ~_742;
    int _3322 = _3320 + 1;
    float _3324 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3326 = trunc(_3272);
    float _3328 = precise::max(_3326, 0.0);
    uint _3330 = uint(_3328);
    int _3332 = ~_742;
    int _3334 = _3332 + 1;
    float _3336 = fma(_3142, _3190, _3292);
    float _3338 = fma(_3324, _2850, -0.5);
    if (!_3246)
    {
        float _3340 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3134);
        _3280 = _3340;
    }
    float _3342 = _3280;
    float _3344 = fma(_3154, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3336);
    float _3346 = fma(_1434, _3338, _1230);
    float _3348 = trunc(_3312);
    float _3350 = precise::max(_3348, 0.0);
    uint _3352 = uint(_3350);
    int _3354 = int(_3188) + int(_3300);
    int _3356 = _3334 * int(_3260);
    int _3358 = _3356 + _3022;
    int _3360 = ~_772;
    int _3362 = _3360 + 1;
    float _3364 = _3344 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3366 = _3346 + 0.5;
    int _3368 = _3322 * _3354;
    int _3370 = _3368 + _3096;
    float _3372 = float(uint(_3358));
    int _3374 = _3290 * int(_3330);
    int _3376 = _3374 + _3072;
    float _3378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3380 = _3250 * _3110;
    bool _3382 = uint(_3370) >= uint(_742);
    float _3384 = _3236 * _3110;
    float _3386 = float(uint(_3376));
    float _3388 = as_type<float>(_2639) * _3372;
    bool _3390 = !_3382;
    int _3392 = _3390 ? 0 : (-1);
    float _3394 = -_2564;
    float _3396 = _3394 + 1.0;
    int _3398 = int(_3208) + int(_3352);
    float _3400 = as_type<float>(_2657) * _3386;
    int _3402 = ~_3354;
    int _3404 = _3402 + _3392;
    int _3406 = _3404 + 1;
    float _3408 = trunc(_3388);
    float _3410 = precise::max(_3408, 0.0);
    uint _3412 = uint(_3410);
    int _3414 = _3362 * _3398;
    int _3416 = _3414 + _3158;
    int _3418 = _742 * _3406;
    int _3420 = _3418 + _3096;
    float _3422 = _3378 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3424 = uint(_3416) >= uint(_772);
    float _3426 = abs(_2118);
    float _3428 = log2(_3426);
    float _3430 = fma(_3422, _3284, -0.5);
    bool _3432 = !_3424;
    int _3434 = _3432 ? 0 : (-1);
    bool _3436 = !_2980;
    int _3438 = _3436 ? _3420 : (-1);
    float _3440 = -_1450;
    float _3442 = fma(_1426, _3430, _3440);
    int _3444 = ~_3398;
    int _3446 = _3444 + _3434;
    int _3448 = _3446 + 1;
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3452 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3456 = _3438 & 3;
    bool _3458 = _3456 != 0;
    int _3460 = _772 * _3448;
    int _3462 = _3460 + _3158;
    int _3464 = _3438 & 3;
    bool _3466 = _3464 != 0;
    float _3468 = trunc(_3400);
    float _3470 = precise::max(_3468, 0.0);
    uint _3472 = uint(_3470);
    int _3474 = _3458 ? 0 : 1;
    float _3476 = _3450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3478 = uint(_3464) > 1u;
    float _3480 = _3452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3482 = !_3000;
    int _3484 = _3482 ? _3462 : (-1);
    float _3486 = _3454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3488 = ~_3474;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    float _3494 = _3428 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3496 = int(_3260) + int(_3412);
    out.m_83.x = _3476;
    out.m_83.y = _3480;
    out.m_83.z = _3486;
    out.m_83.w = _3364;
    int _3498 = _3438 >> 31;
    float _3500 = exp2(_3494);
    bool _3502 = _2118 <= 8000.0;
    bool _3504 = isnan(_2118);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan(8000.0);
    bool _3510 = _3506 || _3508;
    float _3512 = float(_3510);
    int _3514 = _3492;
    if (!_3478)
    {
        int _3516 = ~_3474;
        int _3518 = _3516 + 1;
        _3514 = _3518;
    }
    int _3520 = _3514;
    float _3522 = _3442 + 0.5;
    int _3524 = _3484 & 3;
    bool _3526 = _3524 != 0;
    int _3528 = int(_3330) + int(_3472);
    int _3530 = _3526 ? 0 : 1;
    out.m_85.x = _3366;
    out.m_85.y = _3522;
    bool _3532 = uint(_3524) > 1u;
    float _3534 = _1706 * _922;
    int _3536 = ~_742;
    int _3538 = _3536 + 1;
    float _3540 = _1706 * _1002;
    int _3542 = _3484 >> 31;
    float _3544 = _1706 * _924;
    int _3546 = _3498 & 3;
    int _3548 = _3538 * _3496;
    int _3550 = _3548 + _3022;
    int _3552 = ~_772;
    int _3554 = _3552 + 1;
    float _3556 = _1652 * _1002;
    int _3558 = _3542 & 3;
    float _3560 = _1714 * _1002;
    int _3562 = ~_3530;
    int _3564 = _3562 + 1;
    int _3566 = _3564 + 1;
    int _3568 = _3554 * _3528;
    int _3570 = _3568 + _3072;
    int _3572 = _3438 + _3546;
    float _3574 = _1652 * _922;
    int _3576 = _3566;
    if (!_3532)
    {
        int _3578 = ~_3530;
        int _3580 = _3578 + 1;
        _3576 = _3580;
    }
    int _3582 = _3576;
    float _3584 = _1652 * _924;
    bool _3586 = uint(_3550) >= uint(_742);
    float _3588 = _1714 * _922;
    int _3590 = _3484 + _3558;
    float _3592 = _1714 * _924;
    int _3594 = _3572 >> 2;
    bool _3596 = !_3586;
    int _3598 = _3596 ? 0 : (-1);
    int _3600 = _3590 >> 2;
    bool _3602 = uint(_3570) >= uint(_772);
    int _3604 = _3594 << 4;
    int _3606 = _3604 + 368;
    int _3608 = _3600 << 4;
    int _3610 = _3608 + 512;
    uint _3612 = uint(int(uint(_3606) >> uint(2)));
    uint _3614 = uint(int(uint(int(_3612)) >> uint(2)));
    int _3616 = int(_3612) & 3;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[int(_3614)][_3616];
    int _3620 = int(_3612) + 1;
    uint _3622 = uint(int(uint(_3620) >> uint(2)));
    int _3624 = _3620 & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = ~_3496;
    int _3630 = _3628 + _3598;
    int _3632 = _3630 + 1;
    float _3634 = fma(_3500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3636 = precise::clamp(_3634, 0.0, 1.0);
    bool _3638 = !_3602;
    int _3640 = _3638 ? 0 : (-1);
    int _3642 = _742 * _3632;
    int _3644 = _3642 + _3022;
    bool _3646 = uint(_3464) >= 2u;
    uint _3648 = uint(int(uint(_3610) >> uint(2)));
    uint _3650 = uint(int(uint(int(_3648)) >> uint(2)));
    int _3652 = int(_3648) & 3;
    float _3654 = (*spvDescriptorSet0.vp_c9)._m0[int(_3650)][_3652];
    int _3656 = int(_3648) + 1;
    uint _3658 = uint(int(uint(_3656) >> uint(2)));
    int _3660 = _3656 & 3;
    float _3662 = (*spvDescriptorSet0.vp_c9)._m0[int(_3658)][_3660];
    float _3664 = fma(_3636, -2.0, 3.0);
    float _3666 = _3636 * _3636;
    int _3668 = _3646 ? 0 : 1;
    bool _3670 = _3464 != 3;
    float _3672 = _3666 * _3664;
    int _3674 = ~_3528;
    int _3676 = _3674 + _3640;
    int _3678 = _3676 + 1;
    int _3680 = _3610 + 8;
    uint _3682 = uint(int(uint(_3680) >> uint(2)));
    uint _3684 = uint(int(uint(int(_3682)) >> uint(2)));
    int _3686 = int(_3682) & 3;
    float _3688 = (*spvDescriptorSet0.vp_c9)._m0[int(_3684)][_3686];
    int _3690 = int(_3682) + 1;
    uint _3692 = uint(int(uint(_3690) >> uint(2)));
    int _3694 = _3690 & 3;
    float _3696 = (*spvDescriptorSet0.vp_c9)._m0[int(_3692)][_3694];
    int _3698 = ~_3668;
    int _3700 = _3698 + 1;
    int _3702 = _3700 + 1;
    float _3704 = -_3672;
    float _3706 = _3704 + 1.0;
    int _3708 = abs(_3520);
    int _3710 = _772 * _3678;
    int _3712 = _3710 + _3072;
    int _3714 = abs(_3582);
    float _3716 = fma(_3706, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3672);
    int _3718 = ~_3708;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3606 + 8;
    uint _3726 = uint(int(uint(_3724) >> uint(2)));
    uint _3728 = uint(int(uint(int(_3726)) >> uint(2)));
    int _3730 = int(_3726) & 3;
    float _3732 = (*spvDescriptorSet0.vp_c9)._m0[int(_3728)][_3730];
    int _3734 = int(_3726) + 1;
    uint _3736 = uint(int(uint(_3734) >> uint(2)));
    int _3738 = _3734 & 3;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[int(_3736)][_3738];
    int _3742 = ~_3714;
    int _3744 = _3742 + 1;
    int _3746 = _3744 + 1;
    int _3748 = _3702;
    if (_3670)
    {
        int _3750 = ~_3668;
        int _3752 = _3750 + 1;
        _3748 = _3752;
    }
    int _3754 = _3748;
    float _3756 = _3512 * _3716;
    int _3758 = _3484 & 3;
    bool _3760 = _3758 != 0;
    bool _3762 = !_3466;
    int _3764 = _3762 ? 0 : 1;
    float _3766 = _3756 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3768 = !_3760;
    int _3770 = _3768 ? 0 : 1;
    bool _3772 = _3524 != 3;
    float _3774 = _3396 * _3766;
    float _3776 = precise::clamp(_3774, 0.0, 1.0);
    bool _3778 = uint(_3524) >= 2u;
    int _3780 = abs(_3764);
    int _3782 = abs(_3770);
    int _3784 = _3778 ? 0 : 1;
    int _3786 = _3722 * as_type<int>(_3626);
    int _3788 = ~_3784;
    int _3790 = _3788 + 1;
    int _3792 = _3790 + 1;
    int _3794 = ~_3780;
    int _3796 = _3794 + 1;
    int _3798 = _3796 + 1;
    int _3800 = ~_3782;
    int _3802 = _3800 + 1;
    int _3804 = _3802 + 1;
    float _3806 = _1700 * _1610;
    int _3808 = _3792;
    if (_3772)
    {
        int _3810 = ~_3784;
        int _3812 = _3810 + 1;
        _3808 = _3812;
    }
    int _3814 = _3808;
    int _3816 = _3746 * as_type<int>(_3662);
    bool _3818 = _3464 != 3;
    float _3820 = _1700 * _1612;
    bool _3822 = _3524 != 3;
    int _3824 = _3798 * as_type<int>(_3618);
    int _3826 = _3824 + _3786;
    int _3828 = abs(_3814);
    int _3830 = _3804 * as_type<int>(_3654);
    int _3832 = _3830 + _3816;
    float _3834 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3836 = int(_3834);
    bool _3838 = !_3818;
    int _3840 = _3838 ? 0 : (-1);
    float _3842 = fma(_1658, _1722, _3806);
    bool _3844 = !_3822;
    int _3846 = _3844 ? 0 : (-1);
    int _3848 = ~_3828;
    int _3850 = _3848 + 1;
    int _3852 = _3850 + 1;
    float _3854 = _3592 + _3842;
    int _3856 = abs(_3754);
    int _3858 = abs(_3846);
    int _3860 = _3852 * as_type<int>(_3688);
    int _3862 = _3860 + _3832;
    int _3864 = abs(_3840);
    float _3866 = _1700 * _1614;
    float _3868 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3870 = int(_3868);
    bool _3872 = !_2918;
    int _3874 = _3872 ? 0 : 1;
    int _3876 = ~_3856;
    int _3878 = _3876 + 1;
    int _3880 = _3878 + 1;
    int _3882 = ~_3858;
    int _3884 = _3882 + 1;
    int _3886 = _3884 + 1;
    float _3888 = _1656 * _1614;
    int _3890 = abs(_3874);
    int _3892 = _3880 * as_type<int>(_3732);
    int _3894 = _3892 + _3826;
    bool _3896 = !_2932;
    int _3898 = _3896 ? 0 : 1;
    int _3900 = _3886 * as_type<int>(_3696);
    int _3902 = _3900 + _3862;
    int _3904 = ~_3864;
    int _3906 = _3904 + 1;
    int _3908 = _3906 + 1;
    float _3910 = float(uint(_3836));
    int _3912 = _3908 * as_type<int>(_3740);
    int _3914 = _3912 + _3894;
    int _3916 = abs(_3898);
    int _3918 = ~_3890;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    float _3924 = 1.0 / _3910;
    int _3926 = abs(_3836);
    int _3928 = ~_3916;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    int _3934 = _3914 * _3922;
    float _3936 = float(uint(_3870));
    bool _3938 = !_2980;
    int _3940 = _3938 ? _3644 : (-1);
    int _3942 = _3932 * _3902;
    int _3944 = abs(_3870);
    float _3946 = 1.0 / _3936;
    float _3948 = float(uint(_3926));
    int _3950 = _3940 * _3890;
    int _3952 = _3950 + _3934;
    bool _3954 = !_3000;
    int _3956 = _3954 ? _3712 : (-1);
    float _3958 = _1688 * _1612;
    float _3960 = _1656 * _1610;
    float _3962 = _1656 * _1612;
    bool _3964 = _3870 == 0;
    float _3966 = 1.0 / _3948;
    float _3968 = _1688 * _1614;
    float _3970 = _1688 * _1610;
    float _3972 = float(uint(_3944));
    int _3974 = _3956 * _3916;
    int _3976 = _3974 + _3942;
    float _3978 = float(uint(_3952));
    float _3980 = -_1664;
    float _3982 = fma(_3980, _1728, _3962);
    int _3984 = abs(_3952);
    float _3986 = 1.0 / _3972;
    int _3988 = as_type<int>(_3924) + (-2);
    float _3990 = fma(_1654, _1728, _3958);
    int _3992 = as_type<int>(_3946) + (-2);
    float _3994 = fma(_1654, _1734, _3968);
    float _3996 = float(uint(_3976));
    float _3998 = as_type<float>(_3988) * _3978;
    int _4000 = abs(_3976);
    float _4002 = fma(_1654, _1722, _3970);
    int _4004 = as_type<int>(_3966) + (-2);
    float _4006 = as_type<float>(_3992) * _3996;
    float _4008 = float(uint(_3984));
    float _4010 = trunc(_3998);
    float _4012 = precise::max(_4010, 0.0);
    uint _4014 = uint(_4012);
    float _4016 = float(uint(_4000));
    float _4018 = _3534 + _3990;
    float _4020 = -_1664;
    float _4022 = fma(_4020, _1734, _3888);
    int _4024 = as_type<int>(_3986) + (-2);
    float _4026 = as_type<float>(_4004) * _4008;
    int _4028 = ~_3836;
    int _4030 = _4028 + 1;
    float _4032 = -_1664;
    float _4034 = fma(_4032, _1722, _3960);
    float _4036 = trunc(_4006);
    float _4038 = precise::max(_4036, 0.0);
    uint _4040 = uint(_4038);
    float _4042 = as_type<float>(_4024) * _4016;
    int _4044 = ~_3870;
    int _4046 = _4044 + 1;
    float _4048 = fma(_1658, _1728, _3820);
    float _4050 = fma(_1658, _1734, _3866);
    float _4052 = _3574 + _3982;
    int _4054 = ~_3926;
    int _4056 = _4054 + 1;
    float _4058 = _3544 + _4002;
    float _4060 = trunc(_4026);
    float _4062 = precise::max(_4060, 0.0);
    uint _4064 = uint(_4062);
    int _4066 = _4030 * int(_4014);
    int _4068 = _4066 + _3952;
    float _4070 = _3540 + _3994;
    float _4072 = _3556 + _4022;
    int _4074 = ~_3944;
    int _4076 = _4074 + 1;
    float _4078 = _3584 + _4034;
    float _4080 = float(uint(_4068));
    float _4082 = trunc(_4042);
    float _4084 = precise::max(_4082, 0.0);
    uint _4086 = uint(_4084);
    int _4088 = _4046 * int(_4040);
    int _4090 = _4088 + _3976;
    float _4092 = _3238 * _4072;
    bool _4094 = _3870 == 0;
    float _4096 = as_type<float>(_3988) * _4080;
    float _4098 = float(uint(_4090));
    int _4100 = _4056 * int(_4064);
    int _4102 = _4100 + _3984;
    float _4104 = trunc(_4096);
    float _4106 = precise::max(_4104, 0.0);
    uint _4108 = uint(_4106);
    float _4110 = _4078 * _3106;
    float _4112 = as_type<float>(_3992) * _4098;
    float _4114 = _3588 + _4048;
    float _4116 = float(uint(_4102));
    float _4118 = _4078 * _3318;
    float _4120 = _3560 + _4050;
    int _4122 = _4076 * int(_4086);
    int _4124 = _4122 + _4000;
    float _4126 = trunc(_4112);
    float _4128 = precise::max(_4126, 0.0);
    uint _4130 = uint(_4128);
    float _4132 = as_type<float>(_4004) * _4116;
    float _4134 = _4052 * _3318;
    float _4136 = _4072 * _3318;
    float _4138 = float(uint(_4124));
    float _4140 = _4052 * _3106;
    float _4142 = fma(_4018, _3308, _4134);
    float _4144 = _3238 * _4052;
    float _4146 = trunc(_4132);
    float _4148 = precise::max(_4146, 0.0);
    uint _4150 = uint(_4148);
    float _4152 = as_type<float>(_4024) * _4138;
    float _4154 = _4072 * _3106;
    float _4156 = fma(_4070, _3308, _4136);
    float _4158 = fma(_4058, _3308, _4118);
    float _4160 = fma(_3380, _4070, _4092);
    float _4162 = fma(_4070, _3104, _4154);
    float _4164 = _3238 * _4078;
    float _4166 = trunc(_4152);
    float _4168 = precise::max(_4166, 0.0);
    uint _4170 = uint(_4168);
    int _4172 = int(_4040) + int(_4130);
    float _4174 = fma(_4018, _3104, _4140);
    int _4176 = ~_3870;
    int _4178 = _4176 + 1;
    float _4180 = fma(_4058, _3104, _4110);
    int _4182 = ~_3926;
    int _4184 = _4182 + 1;
    float _4186 = fma(_3380, _4018, _4144);
    int _4188 = int(_4014) + int(_4108);
    float _4190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4192 = int(_4064) + int(_4150);
    float _4194 = fma(_3380, _4058, _4164);
    int _4196 = ~_3836;
    int _4198 = _4196 + 1;
    float _4200 = fma(_4114, _3342, _4142);
    int _4202 = ~_3944;
    int _4204 = _4202 + 1;
    int _4206 = _4184 * _4192;
    int _4208 = _4206 + _3984;
    int _4210 = int(_4086) + int(_4170);
    int _4212 = _4198 * _4188;
    int _4214 = _4212 + _3952;
    float _4216 = fma(_4114, _3108, _4174);
    bool _4218 = uint(_4208) >= uint(_3926);
    float _4220 = fma(_4120, _3108, _4162);
    bool _4222 = uint(_4214) >= uint(_3836);
    int _4224 = _4178 * _4172;
    int _4226 = _4224 + _3976;
    float _4228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _4230 = fma(_3854, _3108, _4180);
    bool _4232 = uint(_4226) >= uint(_3870);
    int _4234 = _4204 * _4210;
    int _4236 = _4234 + _4000;
    bool _4238 = !_4222;
    int _4240 = _4238 ? 0 : (-1);
    out.m_87.x = _4216;
    out.m_87.y = _4220;
    out.m_87.z = _4230;
    bool _4242 = !_4232;
    int _4244 = _4242 ? 0 : (-1);
    int _4246 = ~_4188;
    int _4248 = _4246 + _4240;
    int _4250 = _4248 + 1;
    int _4252 = ~_4172;
    int _4254 = _4252 + _4244;
    int _4256 = _4254 + 1;
    bool _4258 = uint(_4236) >= uint(_3944);
    bool _4260 = _3836 == 0;
    bool _4262 = _3836 == 0;
    int _4264 = _3952 ^ _3836;
    int _4266 = _3836 * _4250;
    int _4268 = _4266 + _3952;
    int _4270 = _3976 ^ _3870;
    int _4272 = _3870 * _4256;
    int _4274 = _4272 + _3976;
    bool _4276 = !_4218;
    int _4278 = _4276 ? 0 : (-1);
    float _4280 = _4190 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4282 = !_4258;
    int _4284 = _4282 ? 0 : (-1);
    float _4286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4288 = uint(int(uint(_4264) >> uint(31)));
    float _4290 = fma(_4280, _2778, -0.5);
    uint _4292 = uint(int(uint(_4270) >> uint(31)));
    float _4294 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4296 = !_4260;
    int _4298 = _4296 ? _4268 : (-1);
    int _4300 = ~_4278;
    int _4302 = _4192 + _4300;
    int _4304 = _4302 + 1;
    float _4306 = fma(_4294, _2846, -0.5);
    int _4308 = ~_4284;
    int _4310 = _4210 + _4308;
    int _4312 = _4310 + 1;
    float _4314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4316 = ~int(_4288);
    int _4318 = _4316 + 1;
    int _4320 = ~int(_4292);
    int _4322 = _4320 + 1;
    bool _4324 = !_3964;
    int _4326 = _4324 ? _4274 : (-1);
    float _4328 = float(_4298);
    int _4330 = _4304 ^ _4318;
    int _4332 = _4312 ^ _4322;
    float _4334 = float(_4326);
    float _4336 = fma(_4280, _4328, _768);
    int _4338 = ~_4318;
    int _4340 = _4338 + _4330;
    int _4342 = _4340 + 1;
    int _4344 = ~_4322;
    int _4346 = _4344 + _4332;
    int _4348 = _4346 + 1;
    float _4350 = fma(_1416, _4290, _4336);
    bool _4352 = !_4262;
    int _4354 = _4352 ? _4342 : (-1);
    float _4356 = _4286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _4358 = !_4094;
    int _4360 = _4358 ? _4348 : (-1);
    float _4362 = _4314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4364 = float(_4354);
    float _4366 = fma(_4294, _4334, _1430);
    float _4368 = float(_4360);
    float _4370 = fma(_2892, _4356, -0.5);
    float _4372 = fma(_3198, _4362, -0.5);
    float _4374 = -_1092;
    float _4376 = fma(_4356, _4364, _4374);
    float _4378 = _2520 + _2486;
    float _4380 = -_1448;
    float _4382 = fma(_4362, _4368, _4380);
    float _4384 = fma(_3384, _3854, _4194);
    float _4386 = fma(_1412, _4370, _4376);
    float _4388 = fma(_3384, _4114, _4186);
    float _4390 = fma(_1442, _4372, _4382);
    float _4392 = fma(_3384, _4120, _4160);
    float _4394 = _4378 * 0.5;
    float _4396 = in.m_89.x;
    float _4398 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4400 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2641);
    float _4402 = fma(_1404, _4306, _4366);
    float _4404 = fma(_4120, _3342, _4156);
    float _4406 = _4398 * _2570;
    float _4408 = -_3776;
    float _4410 = fma(_4408, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4412 = _4402 + 0.5;
    out.gl_Position.x = _2520;
    out.gl_Position.y = _2536;
    out.gl_Position.z = _4400;
    out.gl_Position.w = _2486;
    float _4414 = _2581 * _4406;
    float _4416 = _4400 + _2486;
    float _4418 = _2486 * 0.5;
    float _4420 = _2591 * _4406;
    float _4422 = fma(_2587, _4414, _2575);
    float _4424 = _4350 + 0.5;
    float _4426 = _4386 + 0.5;
    float _4428 = _4390 + 0.5;
    float _4430 = _4416 * 0.5;
    float _4432 = fma(_2536, -0.5, _4418);
    float _4434 = fma(_3854, _3342, _4158);
    float _4436 = fma(_2589, _4414, _2577);
    float _4438 = -_4398;
    float _4440 = _4438 + 1.0;
    float _4442 = _4410 * _4396;
    float _4444 = fma(_2581, _4420, _2579);
    out.m_91.x = _4388;
    out.m_91.y = _4392;
    out.m_91.z = _4384;
    float _4446 = _2581 * _4440;
    float _4448 = _4442 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _4450 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4452 = isnan(_2256);
    bool _4454 = _4450 || _4452;
    bool _4456 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4458 = _4454 || _4456;
    out.m_93.x = _4424;
    out.m_93.y = _4426;
    out.m_93.z = _4412;
    out.m_93.w = _4428;
    float _4460 = _2174 * _2234;
    out.m_95.x = _4394;
    out.m_95.y = _4432;
    out.m_95.z = _4430;
    out.m_95.w = _2486;
    float _4462 = _4460 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _4448;
    out.m_99.x = _4422;
    out.m_99.y = _4436;
    out.m_99.z = _4444;
    out.m_99.w = _4446;
    float _4464 = _4216;
    float _4466 = _4400;
    float _4468 = _4440;
    float _4470 = _4460;
    if (!_4458)
    {
        _4464 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4472 = _4464;
    float _4474 = _4472;
    float _4476 = _4472;
    if (!_4458)
    {
        _2643 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4478 = _2643;
    out.m_101.x = _4200;
    out.m_101.y = _4404;
    out.m_101.z = _4434;
    float _4480 = _4478;
    float _4482 = _4478;
    if (!_4458)
    {
        _4466 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4484 = _4466;
    float _4486 = _4484;
    float _4488 = _4484;
    if (!_4458)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4490 = _2645;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4458)
    {
        _4468 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4496 = _4468;
    float _4498 = _4496;
    float _4500 = _4496;
    if (!_4458)
    {
        _4470 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4502 = _4470;
    bool _4504 = !_4458;
    float _4506 = _4502;
    float _4508 = _4502;
    if (!_4504)
    {
        bool _4510 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4512 = isnan(_2256);
        bool _4514 = _4510 || _4512;
        bool _4516 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4518 = _4514 || _4516;
        if (!_4518)
        {
            float _4520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4522 = _2256 + _4520;
            float _4524 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4526 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4524;
            float _4528 = 1.0 / _4526;
            float _4530 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4532 = _4530 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4536 = _4534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4538 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4540 = _4538 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4542 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4544 = _4542 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4546 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4548 = _4546 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4550 = _4522 * _4528;
            float _4552 = precise::clamp(_4550, 0.0, 1.0);
            float _4554 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4556 = _4554 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4558 = fma(_4552, _4532, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4560 = fma(_4552, _4556, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4562 = fma(_4552, _4536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4564 = fma(_4552, _4540, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4566 = fma(_4552, _4544, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4568 = fma(_4552, _4548, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4482 = _4560;
            _4500 = _4566;
            _4476 = _4558;
            _4494 = _4564;
            _4488 = _4562;
            _4508 = _4568;
            _4570 = true;
        }
        else
        {
            bool _4572 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4574 = isnan(_2256);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4580 = _4576 || _4578;
            if (!_4580)
            {
                _4474 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4582 = _4474;
            _4476 = _4582;
            if (!_4580)
            {
                _4480 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4584 = _4480;
            _4482 = _4584;
            if (!_4580)
            {
                _4486 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4586 = _4486;
            _4488 = _4586;
            if (!_4580)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4588 = _4492;
            _4494 = _4588;
            if (!_4580)
            {
                _4498 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4590 = _4498;
            _4500 = _4590;
            if (!_4580)
            {
                _4506 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4592 = _4506;
            bool _4594 = !_4580;
            _4508 = _4592;
            if (!_4594)
            {
                bool _4596 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4598 = isnan(_2256);
                bool _4600 = _4596 || _4598;
                bool _4602 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4604 = _4600 || _4602;
                if (!_4604)
                {
                    float _4606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4608 = _2256 + _4606;
                    float _4610 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4612 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4610;
                    float _4614 = 1.0 / _4612;
                    float _4616 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4618 = _4616 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4620 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4622 = _4620 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4624 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4626 = _4624 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4628 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4630 = _4628 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4632 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4634 = _4632 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4636 = _4608 * _4614;
                    float _4638 = precise::clamp(_4636, 0.0, 1.0);
                    float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4642 = _4640 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4644 = fma(_4638, _4618, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4646 = fma(_4638, _4642, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4648 = fma(_4638, _4622, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4650 = fma(_4638, _4626, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4652 = fma(_4638, _4630, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4654 = fma(_4638, _4634, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4482 = _4646;
                    _4500 = _4652;
                    _4476 = _4644;
                    _4494 = _4650;
                    _4488 = _4648;
                    _4508 = _4654;
                    _4570 = true;
                }
                else
                {
                    _4482 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4500 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4476 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4488 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4508 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4570 = false;
    float _4656 = _4482;
    float _4658 = _4500;
    float _4660 = _4476;
    float _4662 = _4494;
    float _4664 = _4488;
    float _4666 = _4508;
    float _4668 = _4462 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4670 = fma(_4404, -0.5, 0.5);
    float _4672 = precise::clamp(_4670, 0.0, 1.0);
    float _4674 = -_4656;
    float _4676 = _4674 + _4658;
    float _4678 = -_4660;
    float _4680 = _4678 + _4662;
    out.m_49.x = _4668;
    float _4682 = fma(_4672, _4676, _4656);
    float _4684 = -_4664;
    float _4686 = _4684 + _4666;
    float _4688 = fma(_4672, _4680, _4660);
    float _4690 = _4682 * 0.586610972881317138671875;
    bool _4692 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4694 = fma(_4672, _4686, _4664);
    out.m_103.x = 0.0;
    float _4696 = fma(_4688, 0.298911988735198974609375, _4690);
    bool _4698 = _2174 > 0.0;
    bool _4700 = isnan(_2174);
    bool _4702 = _4698 || _4700;
    bool _4704 = isnan(0.0);
    bool _4706 = _4702 || _4704;
    float _4708 = fma(_4694, 0.114477999508380889892578125, _4696);
    bool _4710 = _2234 <= 0.0;
    bool _4712 = !_4706;
    bool _4714 = _4710 || _4712;
    float _4716 = -_4708;
    float _4718 = _4688 + _4716;
    float _4720 = -_4708;
    float _4722 = _4682 + _4720;
    float _4724 = -_4708;
    float _4726 = _4694 + _4724;
    float _4728 = fma(_4718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    float _4730 = fma(_4722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    float _4732 = fma(_4726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    bool _4734 = !_4692;
    if (!_4734)
    {
        float _4736 = -_2106;
        float _4738 = _4736 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4740 = -_2108;
        float _4742 = _4740 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4744 = -_2110;
        float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4748 = _4738 * _4738;
        float _4750 = fma(_4742, _4742, _4748);
        float _4752 = fma(_4746, _4746, _4750);
        float _4754 = sqrt(_4752);
        float _4756 = rsqrt(_4752);
        float _4758 = -_4754;
        float _4760 = _4758 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4762 = _4760 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4764 = precise::clamp(_4762, 0.0, 1.0);
        float _4766 = _4742 * _4756;
        float _4768 = _4738 * _4756;
        float _4770 = abs(_4764);
        float _4772 = log2(_4770);
        float _4774 = _4746 * _4756;
        float _4776 = _4766 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4778 = _4404 * _4768;
        float _4780 = -_4768;
        float _4782 = -_4776;
        float _4784 = fma(_4780, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4782);
        float _4786 = fma(_4200, _4766, _4778);
        float _4788 = -_4774;
        float _4790 = fma(_4788, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4784);
        float _4792 = fma(_4434, _4774, _4786);
        float _4794 = precise::clamp(_4792, 0.0, 1.0);
        float _4796 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4798 = _4790 + _4796;
        float _4800 = _4772 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4802 = _4798 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4804 = precise::clamp(_4802, 0.0, 1.0);
        float _4806 = exp2(_4800);
        float _4808 = _4806 * _4804;
        float _4810 = _4794 * _4808;
        float _4812 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4814 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4816 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4812;
        out.m_103.y = _4814;
        out.m_103.z = _4816;
    }
    out.m_69.x = _4728;
    out.m_69.y = _4730;
    out.m_69.z = _4732;
    if (!_4714)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4818 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4818;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4570 = false;
    bool _718 = false;
    bool _540 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4874 = as_type<float>(_138);
        out.gl_Position.z = _4874;
    }
    if (!_126)
    {
        return out;
    }
    float _140 = in.m_51.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_122);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_168)
    {
        out.m_49.x = 0.0;
    }
    int _172 = 0;
    if (_168)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4943 = as_type<float>(_176);
        out.gl_Position.z = _4943;
    }
    if (_168)
    {
        return out;
    }
    float _178 = in.m_53.x;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _182 = _154 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _192 = _182 * _180;
    float _194 = _154 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _198 = _194 * _190;
    float _200 = floor(_196);
    float _202 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[20].y, _198);
    float _204 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _214 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _204);
    float _216 = _202 * 6.283185482025146484375;
    float _218 = floor(_202);
    float _220 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _228 = _226 != 0;
    float _230 = _210 * 0.15915493667125701904296875;
    float _232 = _216 * 0.15915493667125701904296875;
    float _234 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _212);
    float _236 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _220);
    bool _238 = !_224;
    int _240 = _238 ? 0 : 1;
    float _242 = -_200;
    float _244 = _196 + _242;
    float _246 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _214);
    float _248 = _230 * 6.283185482025146484375;
    float _250 = cos(_248);
    float _252 = -_218;
    float _254 = _202 + _252;
    int _256 = abs(_240);
    float _258 = _232 * 6.283185482025146484375;
    float _260 = cos(_258);
    bool _262 = !_208;
    int _264 = _262 ? 0 : 1;
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _270 = -_244;
    float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _274 = abs(_264);
    float _276 = float(_256);
    float _278 = fma(_250, 0.5, 0.5);
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _282 = !_228;
    int _284 = _282 ? 0 : 1;
    float _286 = abs(_272);
    float _288 = _276 * _286;
    float _290 = abs(_268);
    float _292 = _276 * _290;
    bool _294 = _254 < 0.5;
    float _296 = float(_294);
    float _298 = -_278;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _302 = float(_274);
    float _304 = fma(_260, 0.5, 0.5);
    bool _306 = _244 < 0.5;
    float _308 = float(_306);
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _314 = abs(_284);
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _320 = fma(_302, _300, _288);
    float _322 = -_308;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = float(_314);
    float _328 = fma(_302, _318, _292);
    float _330 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _234);
    float _332 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _236);
    float _334 = abs(_324);
    float _336 = fma(_326, _334, _320);
    float _338 = abs(_312);
    float _340 = fma(_326, _338, _328);
    bool _342 = !_280;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _360;
    if (!_342)
    {
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_122);
        float _366 = 1.0 / _364;
        float _368 = _154 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _370 + _372;
    bool _376 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_370);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _390 = _370 + _388;
    bool _392 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_370);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _412 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _414 = isnan(_370);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -_386;
    float _426 = _424 + 1.0;
    float _428 = 1.0 / _410;
    float _430 = _422 * _426;
    float _432 = -_422;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _406;
    float _444 = _402 * _434;
    float _446 = -_402;
    float _448 = _446 + 1.0;
    float _450 = _390 * _428;
    float _452 = _374 * _442;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    float _462 = fma(_438, _452, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = fma(_460, _452, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _468 = in.m_57.x;
    float _470 = in.m_57.y;
    float _472 = in.m_57.z;
    float _474 = _462 * _444;
    float _476 = _464 * _444;
    float _478 = _466 * _444;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _494 = fma(_482, _450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _496 = fma(_486, _450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _498 = fma(_490, _450, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _502 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _504 = fma(_494, _430, _492);
    float _506 = fma(_496, _430, _500);
    float _508 = fma(_498, _430, _502);
    float _510 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].x, _504);
    float _512 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].y, _506);
    float _514 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].z, _508);
    float _516 = _510 * _468;
    float _518 = _512 * _470;
    float _520 = _514 * _472;
    bool _522 = !_440;
    float _538;
    if (!_522)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _178 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_122);
        float _544 = 1.0 / _542;
        float _546 = _154 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _548 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _578 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_548);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = 1.0 / _556;
    float _592 = -_568;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _596;
    bool _600 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _602 = isnan(_548);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = _588 * _594;
    float _614 = -_588;
    float _616 = _614 + 1.0;
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _620 = 1.0 / _572;
    float _622 = _610 * _616;
    float _624 = -_610;
    float _626 = _624 + 1.0;
    float _628 = 1.0 / _576;
    float _630 = _598 * _590;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = fma(_630, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _634 * _620;
    bool _640 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _642 = isnan(_548);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _548 + _656;
    float _660 = _636 * _622;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _664 = _548 + _662;
    float _666 = -_650;
    float _668 = _666 + 1.0;
    float _670 = fma(_638, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _672 = _654 * _628;
    float _674 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _676 = _568 * _668;
    float _678 = fma(_672, _664, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _680 = fma(_670, _612, _674);
    float _682 = fma(_678, _676, _680);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[118].x, _682);
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _692;
    out.m_59.y = _694;
    out.m_59.z = _696;
    out.m_59.w = _698;
    bool _700 = !_618;
    float _716;
    if (!_700)
    {
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _704 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        float _720 = float(_122);
        float _722 = 1.0 / _720;
        float _724 = _154 * _722;
        _716 = _724;
    }
    _718 = false;
    float _726 = _716;
    float _728 = in.m_46.x;
    float _730 = in.m_46.y;
    float _732 = in.m_46.z;
    float _734 = _178 * 2.0;
    float _736 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = in.m_53.y;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _746 = in.m_53.z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = _336 * _516;
    float _752 = floor(_734);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = -_748;
    float _760 = fma(_736, 2.0, _758);
    float _762 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _766 = -_154;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _760);
    float _770 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _772 = int(_770);
    float _774 = _762 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _776 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = -_764;
    float _780 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _778);
    float _782 = _340 * _518;
    float _784 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _788 = _752 > 0.0;
    float _790 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _792 = _752 >= 0.0;
    bool _794 = isnan(_752);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _804 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _806 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _808 = fma(_786, -2.0, _744);
    float _810 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _802);
    float _812 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _816 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _818 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _810);
    float _820 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _812);
    float _822 = -_814;
    float _824 = _822 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _826 = _738 * 2.0;
    float _828 = _818 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _830 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _832 = _824 * _824;
    float _834 = -_816;
    float _836 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _834);
    float _838 = -_828;
    float _840 = _838 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _842 = -_830;
    float _844 = _842 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _846 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _848 = floor(_826);
    float _850 = fma(_840, _840, _832);
    float _852 = -_846;
    float _854 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _852);
    float _856 = fma(_844, _844, _850);
    float _858 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _860 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _872 = _870 != 0;
    float _874 = rsqrt(_856);
    float _876 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _878 = -_860;
    float _880 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _878);
    float _882 = _178 + _738;
    float _884 = -_858;
    float _886 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _888 = -_876;
    float _890 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _888);
    int _892 = _800 ? 0 : 1;
    float _894 = _738 + _746;
    bool _896 = _848 > 0.0;
    float _898 = _882 + (-1.0);
    bool _900 = _848 >= 0.0;
    bool _902 = isnan(_848);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    float _910 = _894 + (-1.0);
    int _912 = ~_892;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _746 * 2.0;
    float _922 = _840 * _874;
    float _924 = _844 * _874;
    int _926 = _916;
    int _928 = as_type<int>(_910);
    int _930 = as_type<int>(_920);
    float _932 = _738;
    int _934 = as_type<int>(_746);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_788)
    {
        int _938 = ~_892;
        int _940 = _938 + 1;
        _926 = _940;
    }
    int _942 = _926;
    float _944 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = _922 * _922;
    float _948 = floor(_920);
    bool _950 = !_868;
    int _952 = _950 ? 0 : 1;
    float _954 = _836 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _956 = fma(_924, _924, _946);
    bool _958 = !_864;
    int _960 = _958 ? 0 : 1;
    float _962 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _964 = !_872;
    int _966 = _964 ? 0 : 1;
    float _968 = -_954;
    float _970 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[0].y, _968);
    float _972 = rsqrt(_956);
    float _974 = as_type<float>(_942);
    if (_756)
    {
        _928 = 0;
        _930 = 0;
    }
    int _976 = _928;
    int _978 = _930;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = -_962;
    float _994 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    int _996 = _976;
    int _998 = _978;
    if (!_756)
    {
        _996 = 1;
    }
    int _1000 = _996;
    float _1002 = _824 * _874;
    if (!_756)
    {
        _998 = 2;
    }
    int _1004 = _998;
    float _1006 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].w, _970);
    bool _1008 = _1000 != 1;
    float _1010 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1012 = !_982;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].w, _994);
    bool _1018 = _1004 != 2;
    float _1020 = _836 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1022 = -_1010;
    float _1024 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1022);
    bool _1026 = _948 > 0.0;
    float _1028 = _924 * _972;
    float _1030 = -_1020;
    float _1032 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1030);
    float _1034 = _922 * _972;
    float _1036 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1038 = -_1028;
    float _1040 = _924 * _1038;
    float _1042 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1024);
    float _1044 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1032);
    float _1046 = -_1036;
    float _1048 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1046);
    float _1050 = -_1040;
    float _1052 = fma(_922, _1034, _1050);
    float _1054 = _1002 * _1034;
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1058 = _880 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1060 = _1052 * _1052;
    float _1062 = -_1028;
    float _1064 = _1002 * _1062;
    float _1066 = -_1056;
    float _1068 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1066);
    float _1070 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1048);
    float _1072 = fma(_1054, _1054, _1060);
    float _1074 = -_1058;
    float _1076 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1074);
    float _1078 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1068);
    float _1082 = fma(_1064, _1064, _1072);
    float _1084 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1076);
    float _1086 = -_1078;
    float _1088 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1086);
    float _1090 = _908 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1092 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _808);
    float _1094 = -_1084;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1080);
    float _1098 = rsqrt(_1082);
    bool _1100 = _948 >= 0.0;
    bool _1102 = isnan(_948);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1088);
    bool _1112 = !_986;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1118 = _1108 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1120 = abs(_1114);
    float _1122 = 1.0 / _1096;
    int _1124 = ~as_type<int>(_1118);
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _1128;
    float _1132 = _1118;
    float _1134 = _1090;
    if (!_1026)
    {
        int _1136 = ~as_type<int>(_1118);
        int _1138 = _1136 + 1;
        _1130 = _1138;
    }
    int _1140 = _1130;
    if (_1018)
    {
        _1132 = _178;
    }
    float _1142 = _1132;
    float _1144 = float(_942);
    float _1146 = _1052 * _1098;
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = float(_1120);
    float _1152 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1154 = int(_1152);
    float _1156 = _1142;
    if (!_1018)
    {
        _1156 = _746;
    }
    float _1158 = _1156;
    float _1160 = -_1148;
    float _1162 = _1160 + 1.0;
    int _1164 = abs(_1014);
    float _1166 = _1150 * _1144;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1170 = float(_1164);
    float _1172 = float(_1140);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1176 = fma(_1016, _1122, -1.0);
    float _1178 = _1162 * _1122;
    float _1180 = -_1174;
    float _1182 = fma(_1168, 2.0, _1180);
    float _1184 = _1170 * _1172;
    float _1186 = fma(_1162, _1176, 1.0);
    float _1188 = in.m_61.x;
    float _1190 = in.m_61.y;
    float _1192 = in.m_61.z;
    float _1194 = _1006 * _1178;
    float _1196 = _1110 * _1178;
    float _1198 = _1186 * _1186;
    float _1200 = _1176;
    if (!_1008)
    {
        _1200 = _746;
    }
    float _1202 = _1200;
    float _1204 = _1184 * (-2.0);
    float _1206 = _1202;
    if (_1008)
    {
        _1206 = _738;
    }
    float _1208 = _1206;
    float _1210 = fma(_1194, _1194, _1198);
    float _1212 = _1208;
    if (!_1008)
    {
        _974 = _738;
    }
    float _1214 = _974;
    float _1216 = fma(_918, _1204, _918);
    float _1218 = fma(_1196, _1196, _1210);
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1222 = ~as_type<int>(_1090);
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = -_154;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    int _1232 = _1226;
    float _1234 = _1214;
    if (!_896)
    {
        int _1236 = ~as_type<int>(_1090);
        int _1238 = _1236 + 1;
        _1232 = _1238;
    }
    int _1240 = _1232;
    float _1242 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1220);
    if (!_1008)
    {
        _1134 = _1214;
    }
    float _1244 = _1134;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = _1244;
    if (_1008)
    {
        _1234 = _178;
    }
    float _1250 = _1234;
    float _1252 = rsqrt(_1218);
    float _1254 = _1250;
    if (_1018)
    {
        _1212 = _738;
    }
    float _1256 = _1212;
    float _1258 = _178 + (-0.5);
    float _1260 = _1256;
    if (!_1018)
    {
        _1260 = _178;
    }
    float _1262 = _1260;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    if (_1008)
    {
        _1248 = _178;
    }
    float _1266 = _1248;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1270 = fma(_1204, _1188, _1188);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1008)
    {
        _1254 = _746;
    }
    float _1274 = _1254;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1278 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1270);
    float _1280 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1282 = int(_1280);
    float _1284 = _1274;
    if (_1008)
    {
        _1284 = _738;
    }
    float _1286 = _1284;
    float _1288 = -_1272;
    float _1290 = fma(_1276, 2.0, _1288);
    float _1292 = _1196 * _1252;
    float _1294 = _1194 * _1252;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1298 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1300 = log2(_1298);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1304 = -_1292;
    float _1306 = _922 * _1304;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1310 = fma(_1268, -2.0, _1302);
    float _1312 = -_1294;
    float _1314 = -_1306;
    float _1316 = fma(_924, _1312, _1314);
    float _1318 = fma(_1296, -2.0, _1308);
    float _1320 = _1186 * _1252;
    float _1322 = -_1294;
    float _1324 = _1002 * _1322;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1328 = float(_1154);
    float _1330 = _924 * _1320;
    float _1332 = float(_1282);
    float _1334 = _1300 * _154;
    bool _1336 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1338 = isnan(1.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1344 = _1340 || _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1348 = 1.0 + _1346;
    float _1350 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1326);
    float _1352 = 1.0 / _1328;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1356 = -_1292;
    float _1358 = -_1330;
    float _1360 = fma(_1002, _1356, _1358);
    float _1362 = -_1324;
    float _1364 = fma(_922, _1320, _1362);
    float _1366 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1354);
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _814 + _1368;
    float _1372 = exp2(_1334);
    bool _1374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1382 = _1378 || _1380;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1388 = float(_742);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1392 = _828 + _1390;
    float _1394 = float(_772);
    float _1396 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1384);
    float _1398 = 1.0 / _1332;
    float _1400 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1386);
    float _1402 = _1370 * _1370;
    float _1404 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1264);
    float _1406 = _1388 * _154;
    float _1408 = _1394 * _154;
    float _1410 = _1352 * _154;
    float _1412 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1396);
    float _1414 = 1.0 / _1348;
    float _1416 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    bool _1418 = !_990;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = -_1372;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1400);
    float _1428 = -_154;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1290);
    int _1432 = abs(_1420);
    float _1434 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1366);
    float _1436 = float(_1240);
    float _1438 = _1316 * _1316;
    float _1440 = _1382 ? _1424 : 0.0;
    float _1442 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1242);
    float _1444 = _1398 * _154;
    float _1446 = fma(_1360, _1360, _1438);
    float _1448 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1318);
    float _1450 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1310);
    if (_1344)
    {
        float _1452 = _1440 * _1414;
        _158 = _1452;
    }
    float _1454 = _158;
    float _1456 = fma(_1364, _1364, _1446);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _830 + _1458;
    float _1462 = fma(_1392, _1392, _1402);
    float _1464 = _1166 * (-2.0);
    float _1466 = float(_1432);
    float _1468 = fma(_1216, _1454, _1278);
    float _1470 = fma(_1460, _1460, _1462);
    float _1472 = rsqrt(_1456);
    float _1474 = fma(_944, _1464, _944);
    float _1476 = fma(_1464, _1190, _1190);
    float _1478 = _738 + (-0.5);
    float _1480 = _1466 * _1436;
    float _1482 = _178 + _746;
    float _1484 = _1468 * 0.15915493667125701904296875;
    float _1486 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1476);
    float _1488 = sqrt(_1470);
    float _1490 = _1480 * (-2.0);
    float _1492 = _1482 + (-1.0);
    float _1494 = fma(_1474, _1454, _1486);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1502 = _1500 != 0;
    float _1504 = fma(_1490, _1192, _1192);
    float _1506 = _1494 * 0.15915493667125701904296875;
    float _1508 = rsqrt(_1470);
    float _1510 = _1360 * _1472;
    float _1512 = _1364 * _1472;
    float _1514 = _1316 * _1472;
    bool _1516 = !_1502;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = _924 * _1510;
    float _1522 = _1002 * _1512;
    float _1524 = _922 * _1514;
    float _1526 = _1488 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1528 = -_1520;
    float _1530 = fma(_922, _1512, _1528);
    float _1532 = -_1522;
    float _1534 = fma(_924, _1514, _1532);
    float _1536 = -_1524;
    float _1538 = fma(_1002, _1510, _1536);
    float _1540 = precise::min(_774, _1526);
    float _1542 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1544 = _1530 * _1530;
    float _1546 = _746 + (-0.5);
    float _1548 = _1484 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = _1508 * _1540;
    float _1554 = fma(_1534, _1534, _1544);
    float _1556 = fma(_1542, _1490, _1542);
    float _1558 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1504);
    float _1560 = _1370 * _1552;
    float _1562 = fma(_1538, _1538, _1554);
    float _1564 = _1392 * _1552;
    float _1566 = _1460 * _1552;
    float _1568 = -_1560;
    float _1570 = _1370 + _1568;
    float _1572 = rsqrt(_1562);
    float _1574 = -_1564;
    float _1576 = _1392 + _1574;
    float _1578 = fma(_1556, _1454, _1558);
    float _1580 = _1570 * _1570;
    float _1582 = -_1566;
    float _1584 = _1460 + _1582;
    bool _1586 = !_1498;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = _1578 * 0.15915493667125701904296875;
    float _1592 = fma(_1576, _1576, _1580);
    float _1594 = _1484 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = fma(_1584, _1584, _1592);
    float _1600 = in.m_63.x;
    float _1602 = in.m_63.y;
    float _1604 = in.m_63.z;
    float _1606 = _1506 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1538 * _1572;
    float _1612 = _1534 * _1572;
    float _1614 = _1530 * _1572;
    float _1616 = _922 * _1610;
    float _1618 = _1002 * _1612;
    float _1620 = _924 * _1614;
    float _1622 = _1506 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = -_1616;
    float _1628 = fma(_924, _1612, _1626);
    float _1630 = -_1618;
    float _1632 = fma(_922, _1614, _1630);
    float _1634 = -_1620;
    float _1636 = fma(_1002, _1610, _1634);
    float _1638 = _1590 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = _1550 * _1608;
    float _1644 = _1596 * _1608;
    float _1646 = sqrt(_1598);
    float _1648 = _1550 * _1624;
    float _1650 = _1596 * _1624;
    float _1652 = _1550 * _1640;
    float _1654 = _1624 * _1640;
    float _1656 = _1596 * _1640;
    float _1658 = _1608 * _1640;
    float _1660 = _1628 * _1628;
    float _1662 = _1590 * 6.283185482025146484375;
    float _1664 = sin(_1662);
    float _1666 = _1508 * _1646;
    float _1668 = fma(_1636, _1636, _1660);
    float _1670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1602);
    float _1672 = _790 * _1666;
    float _1674 = fma(_1632, _1632, _1668);
    float _1676 = _762 * _1666;
    float _1678 = _1116 * _1666;
    float _1680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    float _1682 = _1672 * _1670;
    float _1684 = rsqrt(_1674);
    float _1686 = _1676 * _1680;
    float _1688 = fma(_1664, _1650, _1642);
    float _1690 = _1656 * _1682;
    float _1692 = _1678 * _1604;
    float _1694 = -_1682;
    float _1696 = _1664 * _1694;
    float _1698 = -_1648;
    float _1700 = fma(_1664, _1644, _1698);
    float _1702 = fma(_1688, _1686, _1690);
    float _1704 = -_1644;
    float _1706 = fma(_1664, _1648, _1704);
    float _1708 = _1652 * _1682;
    float _1710 = fma(_1654, _1686, _1696);
    float _1712 = fma(_1700, _1692, _1702);
    float _1714 = fma(_1664, _1642, _1650);
    float _1716 = fma(_1706, _1686, _1708);
    float _1718 = fma(_1658, _1692, _1710);
    float _1720 = _1610 * _1712;
    float _1722 = _1632 * _1684;
    float _1724 = fma(_1714, _1692, _1716);
    float _1726 = _1612 * _1712;
    float _1728 = _1636 * _1684;
    float _1730 = fma(_1722, _1718, _1720);
    float _1732 = _1614 * _1712;
    float _1734 = _1628 * _1684;
    float _1736 = fma(_1728, _1718, _1726);
    float _1738 = fma(_924, _1724, _1730);
    float _1740 = -_1566;
    float _1742 = _830 + _1740;
    float _1744 = fma(_922, _1724, _1736);
    float _1746 = _830 + _1738;
    float _1748 = fma(_1734, _1718, _1732);
    float _1750 = -_1560;
    float _1752 = _814 + _1750;
    float _1754 = _828 + _1744;
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1758 = _1746 + _1756;
    float _1760 = fma(_1002, _1724, _1748);
    float _1762 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1766 = _1754 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = _814 + _1760;
    float _1772 = fma(_1766, _1766, _1768);
    float _1774 = -_1564;
    float _1776 = _828 + _1774;
    float _1778 = sqrt(_1772);
    float _1780 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1762);
    float _1782 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    bool _1784 = _1778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1788 = _1786 != 0;
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1792 = _1790 != 0;
    bool _1794 = !_1788;
    int _1796 = _1794 ? 0 : 1;
    bool _1798 = !_1792;
    int _1800 = _1798 ? 0 : 1;
    float _1802 = _1780;
    float _1804 = _1718;
    float _1806 = _1732;
    float _1808 = _1560;
    float _1810 = _1564;
    float _1812 = _1772;
    bool _1814 = _1792;
    if (!_1784)
    {
        _1802 = _1754;
    }
    float _1816 = _1802;
    float _1818 = _1816;
    if (!_1784)
    {
        _1804 = _1746;
    }
    float _1820 = _1804;
    float _1822 = _1820;
    if (!_1784)
    {
        _1806 = _1770;
    }
    float _1824 = _1806;
    bool _1826 = !_1784;
    float _1828 = _1824;
    if (!_1826)
    {
        float _1830 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1834 = _1778 + _1832;
        float _1836 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1838 = _1834 * _1830;
        float _1840 = rsqrt(_1772);
        float _1842 = _1838 * 0.15915493667125701904296875;
        float _1844 = _1842 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = _1842 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = _1846 + (-1.0);
        float _1854 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1856 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = _1840 * _1854;
        float _1860 = fma(_1770, _1846, _1856);
        float _1862 = fma(_1766, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1864 = fma(_1758, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1828 = _1860;
        _1818 = _1862;
        _1822 = _1864;
    }
    float _1866 = _1828;
    float _1868 = _1818;
    float _1870 = _1822;
    float _1872 = -_814;
    float _1874 = _1872 + _1866;
    float _1876 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1878 = -_828;
    float _1880 = _1878 + _1868;
    float _1882 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1884 = _1874 * _1874;
    float _1886 = -_830;
    float _1888 = _1886 + _1870;
    float _1890 = 1.0 / _1876;
    float _1892 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1882);
    float _1894 = fma(_1880, _1880, _1884);
    float _1896 = -_1566;
    float _1898 = _1896 + _1870;
    float _1900 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1892);
    float _1902 = fma(_1888, _1888, _1894);
    float _1904 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1906 = sqrt(_1902);
    float _1908 = _1904 + _1876;
    float _1910 = _1908 * _1890;
    float _1912 = _1910 * 0.5;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1916 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1914);
    bool _1918 = _1906 > 0.0;
    float _1920 = 1.0 / _1916;
    bool _1922 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.5);
    bool _1930 = _1926 || _1928;
    float _1932 = -_1560;
    float _1934 = _1932 + _1866;
    bool _1936 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(0.5);
    bool _1944 = _1940 || _1942;
    float _1946 = -_1564;
    float _1948 = _1946 + _1868;
    float _1950 = _1870;
    float _1952 = _1890;
    float _1954 = _1874;
    float _1956 = _1948;
    float _1958 = _1934;
    if (!_1918)
    {
        _1950 = _1948;
    }
    float _1960 = _1950;
    float _1962 = _1960;
    if (!_1918)
    {
        _1808 = _1934;
    }
    float _1964 = _1808;
    float _1966 = _1964;
    if (!_1918)
    {
        _1810 = _1898;
    }
    float _1968 = _1810;
    bool _1970 = !_1918;
    float _1972 = _1968;
    float _1974 = _1968;
    float _1976 = _1920;
    if (!_1970)
    {
        float _1978 = _246 * _246;
        float _1980 = fma(_330, _330, _1978);
        float _1982 = rsqrt(_1902);
        float _1984 = fma(_332, _332, _1980);
        float _1986 = sqrt(_1984);
        float _1988 = _1880 * _1982;
        float _1990 = _1874 * _1982;
        float _1992 = _1888 * _1982;
        bool _1994 = _1986 > 0.0;
        float _1996 = _1982;
        float _1998 = _1986;
        _1952 = _1990;
        if (!_1994)
        {
            _1996 = _1948;
        }
        float _2000 = _1996;
        _1962 = _2000;
        if (!_1994)
        {
            _1998 = _1934;
        }
        float _2002 = _1998;
        _1966 = _2002;
        if (!_1994)
        {
            _1972 = _1898;
        }
        float _2004 = _1972;
        bool _2006 = !_1994;
        _1974 = _2004;
        if (!_2006)
        {
            float _2008 = rsqrt(_1984);
            float _2010 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2012 = _246 * _2008;
            float _2014 = _330 * _2008;
            float _2016 = _1990 * _2012;
            float _2018 = _332 * _2008;
            float _2020 = fma(_1988, _2014, _2016);
            float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2024 = fma(_1992, _2018, _2020);
            float _2026 = _2024 * _2022;
            float _2028 = fma(_330, _2026, _1948);
            float _2030 = fma(_246, _2026, _1934);
            float _2032 = fma(_332, _2026, _1898);
            _1962 = _2028;
            _1966 = _2030;
            _1974 = _2032;
        }
    }
    float _2034 = _1962;
    float _2036 = _1966;
    float _2038 = _1974;
    float _2040 = _1952;
    float _2042 = _2036;
    float _2044 = _2034;
    float _2046 = _2038;
    float _2048 = _2040;
    if (_1930)
    {
        _1954 = 1.0;
    }
    float _2050 = _1954;
    float _2052 = _2050;
    if (!_1944)
    {
        float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2056 = _1752 + _2054;
        float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2060 = _1776 + _2058;
        float _2062 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2064 = _2056 * _2056;
        float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2068 = _1742 + _2066;
        float _2070 = fma(_2060, _2060, _2064);
        float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2074 = fma(_2068, _2068, _2070);
        float _2076 = sqrt(_2074);
        float _2078 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2080 = precise::min(_2076, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2082 = _2080 * _2072;
        float _2084 = -_1776;
        float _2086 = _2084 + _2034;
        float _2088 = _2078 * _2082;
        float _2090 = -_1752;
        float _2092 = _2090 + _2036;
        float _2094 = -_1742;
        float _2096 = _2094 + _2038;
        float _2098 = fma(_2086, _2088, _1776);
        float _2100 = fma(_2092, _2088, _1752);
        float _2102 = fma(_2096, _2088, _1742);
        _1956 = _2072;
        _2042 = _2100;
        _2044 = _2098;
        _2046 = _2102;
    }
    float _2104 = _1956;
    float _2106 = _2042;
    float _2108 = _2044;
    float _2110 = _2046;
    float _2112 = _2104;
    if (_1930)
    {
        _2048 = 1.0;
    }
    float _2114 = _2048;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2118 = _1920 * _2116;
    float _2120 = _2114;
    if (!_1930)
    {
        float _2122 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2124 = _2122 * 0.15915493667125701904296875;
        float _2126 = _2124 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2132 = _2130 * 0.15915493667125701904296875;
        float _2134 = _2124 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = 1.0 / _2128;
        float _2140 = _2132 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = _2136 * _2138;
        float _2146 = _2132 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2152 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2150;
        float _2154 = _2142 * _2144;
        float _2156 = 1.0 / _2152;
        float _2158 = 1.0 / _2154;
        float _2160 = _2148 * _2158;
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = fma(_2118, _2160, _2162);
        float _2166 = _2164 * _2156;
        float _2168 = precise::clamp(_2166, 0.0, 1.0);
        _2112 = _2144;
        _1976 = _2124;
        _2052 = _2168;
    }
    float _2170 = _2112;
    float _2172 = _1976;
    float _2174 = _2052;
    float _2176 = _2170;
    if (!_1930)
    {
        float _2178 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2180 = _2178 * 0.15915493667125701904296875;
        float _2182 = _2180 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        float _2186 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2188 = _2186 * 0.15915493667125701904296875;
        float _2190 = _2180 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = 1.0 / _2184;
        float _2196 = _2188 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        float _2200 = _2192 * _2194;
        float _2202 = _2188 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = _2198 * _2200;
        float _2208 = 1.0 / _2206;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2210;
        float _2214 = 1.0 / _2212;
        float _2216 = _2204 * _2208;
        float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2220 = fma(_2118, _2216, _2218);
        float _2222 = _2220 * _2214;
        float _2224 = precise::clamp(_2222, 0.0, 1.0);
        float _2226 = -_2224;
        float _2228 = _2226 + 1.0;
        _1958 = _2206;
        _2176 = _2194;
        _2120 = _2228;
    }
    float _2230 = _1958;
    float _2232 = _2176;
    float _2234 = _2120;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2106 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2242 = _2108 + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2110 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = sqrt(_2252);
    float _2258 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2260 = _2242 * _2258;
    float _2262 = _2246 * _2258;
    float _2264 = _2260 * _2260;
    float _2266 = _2262 * _2262;
    float _2268 = _2264 + _2266;
    float _2270 = sqrt(_2268);
    bool _2272 = _2270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2276 = _2270 + _2274;
    float _2278 = _2246;
    float _2280 = _2248;
    float _2282 = _2276;
    float _2284 = _2230;
    float _2286 = _2258;
    float _2288 = _2232;
    if (_2272)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2278 = _2290;
    }
    float _2292 = _2278;
    if (_2272)
    {
        float _2294 = rsqrt(_2268);
        _2280 = _2294;
    }
    float _2296 = _2280;
    float _2298 = _2296;
    if (_2272)
    {
        float _2300 = _2276 * _2292;
        _2282 = _2300;
    }
    float _2302 = _2282;
    if (_2272)
    {
        float _2304 = _2302 * 0.15915493667125701904296875;
        _2284 = _2304;
    }
    float _2306 = _2284;
    float _2308 = _2292;
    float _2310 = _2306;
    if (_2272)
    {
        float _2312 = _2306 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        _2308 = _2314;
    }
    float _2316 = _2308;
    float _2318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2320 = precise::max(0.0, _2318);
    float _2322 = _2172;
    if (_2272)
    {
        float _2324 = _2306 * 6.283185482025146484375;
        float _2326 = cos(_2324);
        _2322 = _2326;
    }
    float _2328 = _2322;
    float _2330 = -_2258;
    float _2332 = -_2320;
    float _2334 = fma(_2238, _2330, _2332);
    if (_2272)
    {
        float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2336;
    }
    float _2338 = _2286;
    float _2340 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2342 = _2316;
    float _2344 = _2338;
    if (_2272)
    {
        float _2346 = fma(_2316, _2338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2288 = _2346;
    }
    float _2348 = _2288;
    float _2350 = _2348;
    if (!_2272)
    {
        _2342 = _2260;
    }
    float _2352 = _2342;
    float _2354 = floor(_2340);
    float _2356 = _2352;
    float _2358 = _2328;
    if (_2272)
    {
        float _2360 = _2328 + (-1.0);
        _2344 = _2360;
    }
    float _2362 = _2344;
    float _2364 = _2362;
    if (_2272)
    {
        float _2366 = _2296 * _2348;
        _1812 = _2366;
    }
    float _2368 = _1812;
    if (!_2272)
    {
        _2298 = _2334;
    }
    float _2370 = _2298;
    float _2372 = _2370;
    if (_2272)
    {
        float _2374 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2374;
    }
    float _2376 = _2310;
    if (_2272)
    {
        float _2378 = _2260 * _2368;
        _2356 = _2378;
    }
    float _2380 = _2356;
    if (!_2272)
    {
        _2364 = _2262;
    }
    float _2382 = _2364;
    float _2384 = _2382;
    if (_2272)
    {
        float _2386 = _2262 * _2368;
        _2384 = _2386;
    }
    float _2388 = _2384;
    if (!_2272)
    {
        _2350 = _2264;
    }
    float _2390 = _2350;
    float _2392 = _2390;
    if (_2272)
    {
        float _2394 = fma(_2334, _2328, _2376);
        _2372 = _2394;
    }
    float _2396 = _2372;
    if (_2272)
    {
        float _2398 = _2380 * _2380;
        _2392 = _2398;
    }
    float _2400 = _2392;
    if (!_2272)
    {
        _2358 = _2266;
    }
    float _2402 = _2358;
    float _2404 = _2402;
    if (_2272)
    {
        float _2406 = _2388 * _2388;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2412 = fma(_2396, _2396, _2400);
    float _2414 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2416 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2418 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2410);
    float _2420 = _2412 + _2408;
    float _2422 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2424 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2416);
    float _2426 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2418);
    float _2428 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2422);
    float _2430 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2424);
    float _2432 = rsqrt(_2420);
    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2436 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2434);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2442 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2444 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2448 = -_2438;
    float _2450 = _2448 + 1.0;
    float _2452 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2440);
    float _2454 = _2442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2456 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2460 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2462 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2452);
    float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2456);
    float _2466 = abs(_2450);
    float _2468 = log2(_2466);
    float _2470 = -_2460;
    float _2472 = fma(_2470, _2458, 1.0);
    float _2474 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2476 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2464);
    float _2478 = _2432 * _2380;
    float _2480 = _2432 * _2388;
    float _2482 = -_2354;
    float _2484 = _2340 + _2482;
    float _2486 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2476);
    float _2488 = _2432 * _2396;
    float _2490 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2492 = floor(_2414);
    float _2494 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2496 = -_2490;
    float _2498 = fma(_2488, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2496);
    float _2500 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2494);
    float _2502 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2504 = -_2480;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2498);
    float _2508 = log2(_2472);
    float _2510 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2512 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2500);
    float _2514 = fma(_2506, -0.5, 0.5);
    float _2516 = fma(_2506, 0.5, 0.5);
    float _2518 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2510);
    float _2520 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2512);
    float _2522 = 1.0 / _2486;
    float _2524 = fma(_2516, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2526 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2518);
    float _2528 = -_2492;
    float _2530 = _2414 + _2528;
    float _2532 = _2488 + 1.0;
    float _2534 = fma(_2516, _2524, -0.212114393711090087890625);
    float _2536 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2526);
    float _2538 = exp2(_2502);
    float _2540 = _2508 * 0.693147182464599609375;
    float _2542 = fma(_2516, _2534, 1.570728778839111328125);
    float _2544 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2546 = sqrt(_2514);
    float _2548 = _2520 * _2522;
    float _2550 = fma(_2548, 0.5, 0.5);
    float _2552 = -_2488;
    float _2554 = fma(_2538, _2532, _2552);
    float _2556 = _2536 * _2522;
    float _2558 = fma(_2554, 0.5, 0.5);
    float _2560 = fma(_2556, -0.5, 0.5);
    float _2562 = _2546 * 0.636619746685028076171875;
    float2 _8675 = float2(_2484, _2530);
    float _2564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8675, float2(0.0), isnan(_8675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8675, float2(0.0), isnan(_8675)), level(0.0)).x;
    float _2566 = -_2542;
    float _2568 = fma(_2562, _2566, 1.0);
    float3 _8691 = float3(_2550, _2560, _2544);
    float _2570 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8691, float3(0.0), isnan(_8691)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8691, float3(0.0), isnan(_8691)), level(0.0)).x;
    float3 _8702 = float3(_2550, _2560, _2544);
    float4 _2573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8702, float3(0.0), isnan(_8702)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8702, float3(0.0), isnan(_8702)), level(0.0)).xyzw;
    float _2575 = _2573.x;
    float _2577 = _2573.y;
    float _2579 = _2573.z;
    float _2581 = _2573.w;
    float2 _8718 = float2(_2568, _2558);
    float3 _2585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8718, float2(0.0), isnan(_8718)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8718, float2(0.0), isnan(_8718)), level(0.0)).xyz;
    float _2587 = _2585.x;
    float _2589 = _2585.y;
    float _2591 = _2585.z;
    float _2593 = float(uint(_742));
    float _2595 = trunc(_1410);
    int _2597 = int(_2595);
    float _2599 = float(uint(_772));
    float _2601 = in.m_65.w;
    bool _2603 = _746 > 0.5;
    float _2605 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2609 = _2607 != 0;
    out.m_67.x = _1776;
    out.m_67.y = _1752;
    out.m_67.z = _1742;
    int _2611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2613 = _2611 != 0;
    float _2615 = 1.0 / _2593;
    bool _2617 = _738 > 0.5;
    out.m_69.w = _1540;
    int _2619 = abs(_952);
    float _2621 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2623 = abs(_1800);
    out.m_71.x = _1676;
    int _2625 = ~_772;
    int _2627 = _2625 + 1;
    float _2629 = 1.0 / _2599;
    float _2631 = float(uint(_2597));
    float _2633 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    float _2635 = trunc(_1444);
    int _2637 = int(_2635);
    int _2639 = as_type<int>(_2615) + (-2);
    out.m_73.w = _2601;
    float _2641 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2633);
    float _2643 = _2486;
    float _2645 = _2536;
    if (_2609)
    {
        _344 = _178;
    }
    float _2647 = _344;
    float _2649 = as_type<float>(_2639) * _2631;
    int _2651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2653 = _2651 != 0;
    float _2655 = exp2(_2605);
    int _2657 = as_type<int>(_2629) + (-2);
    float _2659 = in.m_53.w;
    int _2661 = ~_772;
    int _2663 = _2661 + 1;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2667 = _726 + _2665;
    int _2669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2671 = _2669 != 0;
    out.m_75.x = _2108;
    out.m_75.y = _2106;
    out.m_75.z = _2110;
    float _2673 = _2647;
    if (!_2609)
    {
        _2673 = _738;
    }
    float _2675 = _2673;
    float _2677 = trunc(_2649);
    float _2679 = precise::max(_2677, 0.0);
    uint _2682 = uint(_2679);
    float _2684 = float(uint(_2637));
    float _2686 = _2675;
    if (_2609)
    {
        _932 = 1.0;
    }
    float _2688 = _932;
    float _2690 = _2688;
    if (_2653)
    {
        bool _2692 = _178 > 0.5;
        _1814 = _2692;
    }
    bool _2694 = _1814;
    float _2696 = as_type<float>(_2657) * _2684;
    int _2698 = ~_742;
    int _2700 = _2698 + 1;
    float _2702 = -_2655;
    float _2704 = _2702 + 1.0;
    float _2706 = in.m_77.x;
    float _2708 = trunc(_2696);
    float _2710 = precise::max(_2708, 0.0);
    uint _2712 = uint(_2710);
    if (!_2609)
    {
        _2690 = 7.345489978790283203125;
    }
    float _2714 = _2690;
    float _2716 = float(_2637);
    int _2718 = _2700 * int(_2682);
    int _2720 = _2718 + _2597;
    float _2722 = _2714 * _178;
    bool _2724 = _2716 >= _1394;
    bool _2726 = isnan(_2716);
    bool _2728 = _2724 || _2726;
    bool _2730 = isnan(_1394);
    bool _2732 = _2728 || _2730;
    float _2734 = float(_2732);
    float _2736 = float(uint(_2720));
    int _2738 = _2663 * int(_2712);
    int _2740 = _2738 + _2637;
    float _2742 = as_type<float>(_2639) * _2736;
    float _2744 = float(uint(_2740));
    float _2746 = trunc(_2742);
    float _2748 = precise::max(_2746, 0.0);
    uint _2750 = uint(_2748);
    float _2752 = _2744;
    int _2754 = int(_2712);
    float _2756 = _2714;
    if (_2653)
    {
        float _2758 = -_2706;
        float _2760 = _2758 + 1.0;
        _934 = as_type<int>(_2760);
    }
    int _2762 = _934;
    int _2764 = _2762;
    if (!_2653)
    {
        _936 = _2706;
    }
    float _2766 = _936;
    float _2768 = as_type<float>(_2657) * _2744;
    float _2770 = _2766;
    if (_2609)
    {
        _2752 = 1.0;
    }
    float _2772 = _2752;
    float _2774 = _2772;
    if (_2653)
    {
        float _2776 = _2694 ? as_type<float>(_2762) : _2706;
        _2770 = _2776;
    }
    float _2778 = _2770;
    float _2780 = trunc(_2768);
    float _2782 = precise::max(_2780, 0.0);
    uint _2784 = uint(_2782);
    bool _2786 = _2659 > 0.5;
    if (_2671)
    {
        float _2788 = -_2706;
        float _2790 = _2788 + 1.0;
        _2764 = as_type<int>(_2790);
    }
    int _2792 = _2764;
    float _2794 = in.m_77.y;
    int _2796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2798 = _2796 != 0;
    if (!_2609)
    {
        _2774 = 1.2345600128173828125;
    }
    float _2800 = _2774;
    int _2802 = int(_2682) + int(_2750);
    float _2804 = float(_122);
    float _2806 = _2675 * _2800;
    int _2808 = ~_742;
    int _2810 = _2808 + 1;
    int _2812 = ~_772;
    int _2814 = _2812 + 1;
    float _2816 = 1.0 / _2804;
    int _2818 = int(_2712) + int(_2784);
    if (_2798)
    {
        float _2820 = -_2706;
        float _2822 = _2820 + 1.0;
        _2754 = as_type<int>(_2822);
    }
    int _2824 = _2754;
    int _2826 = _2810 * _2802;
    int _2828 = _2826 + _2597;
    if (!_2671)
    {
        _2756 = _2706;
    }
    float _2830 = _2756;
    float _2832 = _2830;
    if (!_2798)
    {
        _2686 = _2706;
    }
    float _2834 = _2686;
    int _2836 = _2814 * _2818;
    int _2838 = _2836 + _2637;
    float _2840 = floor(_2722);
    float _2842 = _2834;
    if (_2671)
    {
        float _2844 = _2603 ? as_type<float>(_2792) : _2706;
        _2832 = _2844;
    }
    float _2846 = _2832;
    if (_2798)
    {
        float _2848 = _2617 ? as_type<float>(_2824) : _2706;
        _2842 = _2848;
    }
    float _2850 = _2842;
    float _2852 = -_2794;
    float _2854 = _2852 + 1.0;
    bool _2856 = uint(_2828) >= uint(_742);
    float _2858 = float(_2597);
    float _2860 = floor(_2806);
    bool _2862 = !_2856;
    int _2864 = _2862 ? 0 : (-1);
    float _2866 = _1408 * _2816;
    int _2868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2870 = _2868 != 0;
    int _2872 = _2617 ? as_type<int>(_2854) : as_type<int>(_2794);
    int _2874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2876 = _2874 != 0;
    bool _2878 = uint(_2838) >= uint(_772);
    bool _2880 = _2858 >= _1388;
    bool _2882 = isnan(_2858);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(_1388);
    bool _2888 = _2884 || _2886;
    float _2890 = float(_2888);
    float _2892 = _2870 ? as_type<float>(_2872) : _2794;
    bool _2894 = !_2613;
    int _2896 = _2894 ? 0 : 1;
    float _2898 = -_2860;
    float _2900 = _2806 + _2898;
    bool _2902 = !_2876;
    int _2904 = _2902 ? 0 : 1;
    float _2906 = trunc(_2890);
    int _2908 = int(_2906);
    bool _2910 = !_2878;
    int _2912 = _2910 ? 0 : (-1);
    float _2914 = _1394 * _2900;
    int _2916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2918 = _2916 != 0;
    float _2920 = _1406 * _2816;
    int _2922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2924 = _2922 != 0;
    int _2926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2928 = _2926 != 0;
    int _2930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2932 = _2930 != 0;
    float _2934 = trunc(_2920);
    int _2936 = int(_2934);
    int _2938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2940 = _2938 != 0;
    float _2942 = -_2840;
    float _2944 = _2722 + _2942;
    int _2946 = ~_2802;
    int _2948 = _2946 + _2864;
    int _2950 = _2948 + 1;
    int _2952 = ~_2818;
    int _2954 = _2952 + _2912;
    int _2956 = _2954 + 1;
    float _2958 = _2944 * _1388;
    float _2960 = trunc(_2734);
    int _2962 = int(_2960);
    int _2964 = _742 * _2950;
    int _2966 = _2964 + _2597;
    int _2968 = abs(_2904);
    int _2970 = _772 * _2956;
    int _2972 = _2970 + _2637;
    float _2974 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2976 = _2974 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2978 = _2786 ? as_type<int>(_2854) : as_type<int>(_2794);
    bool _2980 = _742 == 0;
    float _2982 = trunc(_2958);
    int _2984 = int(_2982);
    int _2986 = ~_2908;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    bool _2992 = !_2980;
    int _2994 = _2992 ? _2966 : (-1);
    bool _2996 = !_2940;
    int _2998 = _2996 ? 0 : 1;
    bool _3000 = _772 == 0;
    int _3002 = _2994 * _2990;
    int _3004 = ~_2962;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    float _3010 = 1.0 / _2976;
    bool _3012 = !_3000;
    int _3014 = _3012 ? _2972 : (-1);
    int _3016 = abs(_1518);
    int _3018 = abs(_960);
    int _3020 = _2984 * _2968;
    int _3022 = _3020 + _2597;
    int _3024 = _742 + (-1);
    int _3026 = _3008 * _3014;
    int _3028 = abs(_966);
    int _3030 = _2908 * _3024;
    int _3032 = _3030 + _3002;
    int _3034 = _772 + (-1);
    float _3036 = trunc(_2914);
    int _3038 = int(_3036);
    int _3040 = abs(_2896);
    float _3042 = float(uint(_3022));
    int _3044 = _2962 * _3034;
    int _3046 = _3044 + _3026;
    int _3048 = _3032 * _2619;
    int _3050 = _3046 * _3016;
    int _3052 = abs(_2998);
    float _3054 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3056 = _3054 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3058 = trunc(_2866);
    int _3060 = int(_3058);
    int _3062 = abs(_1588);
    int _3064 = _2936 * _3018;
    int _3066 = _3064 + _3048;
    float _3068 = as_type<float>(_2639) * _3042;
    int _3070 = _3038 * _3052;
    int _3072 = _3070 + _2637;
    int _3074 = abs(_1796);
    int _3076 = _3022 * _3028;
    int _3078 = _3076 + _3066;
    float _3080 = 1.0 / _3056;
    float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3088 = _3086 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3090 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3092 = _726 + _3090;
    int _3094 = _2984 * _3040;
    int _3096 = _3094 + _3078;
    float _3098 = _3084 * _3010;
    int _3100 = _3060 * _3062;
    int _3102 = _3100 + _3050;
    float _3104 = in.m_79.x;
    float _3106 = in.m_79.y;
    float _3108 = in.m_79.z;
    float _3110 = in.m_79.w;
    bool _3112 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3114 = isnan(_726);
    bool _3116 = _3112 || _3114;
    bool _3118 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3120 = _3116 || _3118;
    float _3122 = float(_3120);
    float _3124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3126 = _3072 * _3074;
    int _3128 = _3126 + _3102;
    float _3130 = in.m_81.x;
    float _3132 = in.m_81.y;
    float _3134 = in.m_81.z;
    float _3136 = _3088 * _3080;
    float _3138 = fma(_3098, _3092, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3140 = float(uint(_3096));
    float _3142 = fma(_3136, _2667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3144 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3146 = isnan(_726);
    bool _3148 = _3144 || _3146;
    bool _3150 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3152 = _3148 || _3150;
    float _3154 = float(_3152);
    int _3156 = _3038 * _2623;
    int _3158 = _3156 + _3128;
    bool _3160 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3162 = isnan(_726);
    bool _3164 = _3160 || _3162;
    bool _3166 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3168 = _3164 || _3166;
    float _3170 = float(_3168);
    float _3172 = as_type<float>(_2639) * _3140;
    float _3174 = -_3154;
    float _3176 = _3174 + 1.0;
    float _3178 = float(uint(_3158));
    float _3180 = -_3170;
    float _3182 = _3180 + 1.0;
    float _3184 = trunc(_3172);
    float _3186 = precise::max(_3184, 0.0);
    uint _3188 = uint(_3186);
    float _3190 = _3170 * _3176;
    float _3192 = as_type<float>(_2657) * _3178;
    int _3194 = ~_742;
    int _3196 = _3194 + 1;
    float _3198 = _2924 ? as_type<float>(_2978) : _2794;
    float _3200 = _3122 * _3182;
    float _3202 = _3130 * _3108;
    float _3204 = trunc(_3192);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    bool _3210 = _1602 != 0.0;
    bool _3212 = isnan(_1602);
    bool _3214 = _3210 || _3212;
    bool _3216 = isnan(0.0);
    bool _3218 = _3214 || _3216;
    float _3220 = _3132 * _3104;
    float _3222 = -_3202;
    float _3224 = fma(_3134, _3104, _3222);
    float _3226 = _3134 * _3106;
    bool _3228 = _1600 == 0.0;
    bool _3230 = !_3218;
    bool _3232 = _3228 && _3230;
    float _3234 = -_3220;
    float _3236 = fma(_3106, _3130, _3234);
    float _3238 = _3224 * _3110;
    int _3240 = _3196 * int(_3188);
    int _3242 = _3240 + _3096;
    bool _3244 = _1604 == 0.0;
    bool _3246 = _3244 && _3232;
    float _3248 = -_3226;
    float _3250 = fma(_3108, _3132, _3248);
    float _3252 = _3138 * _3200;
    float _3254 = float(uint(_3072));
    float _3256 = trunc(_3068);
    float _3258 = precise::max(_3256, 0.0);
    uint _3260 = uint(_3258);
    float _3262 = float(uint(_3242));
    float _3264 = -_3122;
    float _3266 = _3264 + 1.0;
    int _3268 = _2627 * int(_3208);
    int _3270 = _3268 + _3158;
    float _3272 = as_type<float>(_2657) * _3254;
    float _3274 = _2794;
    float _3276 = _3136;
    float _3278 = _3138;
    float _3280 = _3134;
    if (_2928)
    {
        float _3282 = _2603 ? _2854 : _2794;
        _3274 = _3282;
    }
    float _3284 = _3274;
    float _3286 = as_type<float>(_2639) * _3262;
    int _3288 = ~_772;
    int _3290 = _3288 + 1;
    float _3292 = fma(_3266, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3252);
    float _3294 = float(uint(_3270));
    float _3296 = trunc(_3286);
    float _3298 = precise::max(_3296, 0.0);
    uint _3300 = uint(_3298);
    if (_3246)
    {
        _3276 = _3130;
    }
    float _3302 = _3276;
    float _3304 = _3302;
    if (!_3246)
    {
        float _3306 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3130);
        _3304 = _3306;
    }
    float _3308 = _3304;
    if (_3246)
    {
        _3278 = _3132;
    }
    float _3310 = _3278;
    float _3312 = as_type<float>(_2657) * _3294;
    float _3314 = _3310;
    if (!_3246)
    {
        float _3316 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3132);
        _3314 = _3316;
    }
    float _3318 = _3314;
    int _3320 = ~_742;
    int _3322 = _3320 + 1;
    float _3324 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3326 = trunc(_3272);
    float _3328 = precise::max(_3326, 0.0);
    uint _3330 = uint(_3328);
    int _3332 = ~_742;
    int _3334 = _3332 + 1;
    float _3336 = fma(_3142, _3190, _3292);
    float _3338 = fma(_3324, _2850, -0.5);
    if (!_3246)
    {
        float _3340 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3134);
        _3280 = _3340;
    }
    float _3342 = _3280;
    float _3344 = fma(_3154, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3336);
    float _3346 = fma(_1434, _3338, _1230);
    float _3348 = trunc(_3312);
    float _3350 = precise::max(_3348, 0.0);
    uint _3352 = uint(_3350);
    int _3354 = int(_3188) + int(_3300);
    int _3356 = _3334 * int(_3260);
    int _3358 = _3356 + _3022;
    int _3360 = ~_772;
    int _3362 = _3360 + 1;
    float _3364 = _3344 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3366 = _3346 + 0.5;
    int _3368 = _3322 * _3354;
    int _3370 = _3368 + _3096;
    float _3372 = float(uint(_3358));
    int _3374 = _3290 * int(_3330);
    int _3376 = _3374 + _3072;
    float _3378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3380 = _3250 * _3110;
    bool _3382 = uint(_3370) >= uint(_742);
    float _3384 = _3236 * _3110;
    float _3386 = float(uint(_3376));
    float _3388 = as_type<float>(_2639) * _3372;
    bool _3390 = !_3382;
    int _3392 = _3390 ? 0 : (-1);
    float _3394 = -_2564;
    float _3396 = _3394 + 1.0;
    int _3398 = int(_3208) + int(_3352);
    float _3400 = as_type<float>(_2657) * _3386;
    int _3402 = ~_3354;
    int _3404 = _3402 + _3392;
    int _3406 = _3404 + 1;
    float _3408 = trunc(_3388);
    float _3410 = precise::max(_3408, 0.0);
    uint _3412 = uint(_3410);
    int _3414 = _3362 * _3398;
    int _3416 = _3414 + _3158;
    int _3418 = _742 * _3406;
    int _3420 = _3418 + _3096;
    float _3422 = _3378 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3424 = uint(_3416) >= uint(_772);
    float _3426 = abs(_2118);
    float _3428 = log2(_3426);
    float _3430 = fma(_3422, _3284, -0.5);
    bool _3432 = !_3424;
    int _3434 = _3432 ? 0 : (-1);
    bool _3436 = !_2980;
    int _3438 = _3436 ? _3420 : (-1);
    float _3440 = -_1450;
    float _3442 = fma(_1426, _3430, _3440);
    int _3444 = ~_3398;
    int _3446 = _3444 + _3434;
    int _3448 = _3446 + 1;
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3452 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3456 = _3438 & 3;
    bool _3458 = _3456 != 0;
    int _3460 = _772 * _3448;
    int _3462 = _3460 + _3158;
    int _3464 = _3438 & 3;
    bool _3466 = _3464 != 0;
    float _3468 = trunc(_3400);
    float _3470 = precise::max(_3468, 0.0);
    uint _3472 = uint(_3470);
    int _3474 = _3458 ? 0 : 1;
    float _3476 = _3450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3478 = uint(_3464) > 1u;
    float _3480 = _3452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3482 = !_3000;
    int _3484 = _3482 ? _3462 : (-1);
    float _3486 = _3454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3488 = ~_3474;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    float _3494 = _3428 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3496 = int(_3260) + int(_3412);
    out.m_83.x = _3476;
    out.m_83.y = _3480;
    out.m_83.z = _3486;
    out.m_83.w = _3364;
    int _3498 = _3438 >> 31;
    float _3500 = exp2(_3494);
    bool _3502 = _2118 <= 8000.0;
    bool _3504 = isnan(_2118);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan(8000.0);
    bool _3510 = _3506 || _3508;
    float _3512 = float(_3510);
    int _3514 = _3492;
    if (!_3478)
    {
        int _3516 = ~_3474;
        int _3518 = _3516 + 1;
        _3514 = _3518;
    }
    int _3520 = _3514;
    float _3522 = _3442 + 0.5;
    int _3524 = _3484 & 3;
    bool _3526 = _3524 != 0;
    int _3528 = int(_3330) + int(_3472);
    int _3530 = _3526 ? 0 : 1;
    out.m_85.x = _3366;
    out.m_85.y = _3522;
    bool _3532 = uint(_3524) > 1u;
    float _3534 = _1706 * _922;
    int _3536 = ~_742;
    int _3538 = _3536 + 1;
    float _3540 = _1706 * _1002;
    int _3542 = _3484 >> 31;
    float _3544 = _1706 * _924;
    int _3546 = _3498 & 3;
    int _3548 = _3538 * _3496;
    int _3550 = _3548 + _3022;
    int _3552 = ~_772;
    int _3554 = _3552 + 1;
    float _3556 = _1652 * _1002;
    int _3558 = _3542 & 3;
    float _3560 = _1714 * _1002;
    int _3562 = ~_3530;
    int _3564 = _3562 + 1;
    int _3566 = _3564 + 1;
    int _3568 = _3554 * _3528;
    int _3570 = _3568 + _3072;
    int _3572 = _3438 + _3546;
    float _3574 = _1652 * _922;
    int _3576 = _3566;
    if (!_3532)
    {
        int _3578 = ~_3530;
        int _3580 = _3578 + 1;
        _3576 = _3580;
    }
    int _3582 = _3576;
    float _3584 = _1652 * _924;
    bool _3586 = uint(_3550) >= uint(_742);
    float _3588 = _1714 * _922;
    int _3590 = _3484 + _3558;
    float _3592 = _1714 * _924;
    int _3594 = _3572 >> 2;
    bool _3596 = !_3586;
    int _3598 = _3596 ? 0 : (-1);
    int _3600 = _3590 >> 2;
    bool _3602 = uint(_3570) >= uint(_772);
    int _3604 = _3594 << 4;
    int _3606 = _3604 + 368;
    int _3608 = _3600 << 4;
    int _3610 = _3608 + 512;
    uint _3612 = uint(int(uint(_3606) >> uint(2)));
    uint _3614 = uint(int(uint(int(_3612)) >> uint(2)));
    int _3616 = int(_3612) & 3;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[int(_3614)][_3616];
    int _3620 = int(_3612) + 1;
    uint _3622 = uint(int(uint(_3620) >> uint(2)));
    int _3624 = _3620 & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = ~_3496;
    int _3630 = _3628 + _3598;
    int _3632 = _3630 + 1;
    float _3634 = fma(_3500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3636 = precise::clamp(_3634, 0.0, 1.0);
    bool _3638 = !_3602;
    int _3640 = _3638 ? 0 : (-1);
    int _3642 = _742 * _3632;
    int _3644 = _3642 + _3022;
    bool _3646 = uint(_3464) >= 2u;
    uint _3648 = uint(int(uint(_3610) >> uint(2)));
    uint _3650 = uint(int(uint(int(_3648)) >> uint(2)));
    int _3652 = int(_3648) & 3;
    float _3654 = (*spvDescriptorSet0.vp_c9)._m0[int(_3650)][_3652];
    int _3656 = int(_3648) + 1;
    uint _3658 = uint(int(uint(_3656) >> uint(2)));
    int _3660 = _3656 & 3;
    float _3662 = (*spvDescriptorSet0.vp_c9)._m0[int(_3658)][_3660];
    float _3664 = fma(_3636, -2.0, 3.0);
    float _3666 = _3636 * _3636;
    int _3668 = _3646 ? 0 : 1;
    bool _3670 = _3464 != 3;
    float _3672 = _3666 * _3664;
    int _3674 = ~_3528;
    int _3676 = _3674 + _3640;
    int _3678 = _3676 + 1;
    int _3680 = _3610 + 8;
    uint _3682 = uint(int(uint(_3680) >> uint(2)));
    uint _3684 = uint(int(uint(int(_3682)) >> uint(2)));
    int _3686 = int(_3682) & 3;
    float _3688 = (*spvDescriptorSet0.vp_c9)._m0[int(_3684)][_3686];
    int _3690 = int(_3682) + 1;
    uint _3692 = uint(int(uint(_3690) >> uint(2)));
    int _3694 = _3690 & 3;
    float _3696 = (*spvDescriptorSet0.vp_c9)._m0[int(_3692)][_3694];
    int _3698 = ~_3668;
    int _3700 = _3698 + 1;
    int _3702 = _3700 + 1;
    float _3704 = -_3672;
    float _3706 = _3704 + 1.0;
    int _3708 = abs(_3520);
    int _3710 = _772 * _3678;
    int _3712 = _3710 + _3072;
    int _3714 = abs(_3582);
    float _3716 = fma(_3706, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3672);
    int _3718 = ~_3708;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3606 + 8;
    uint _3726 = uint(int(uint(_3724) >> uint(2)));
    uint _3728 = uint(int(uint(int(_3726)) >> uint(2)));
    int _3730 = int(_3726) & 3;
    float _3732 = (*spvDescriptorSet0.vp_c9)._m0[int(_3728)][_3730];
    int _3734 = int(_3726) + 1;
    uint _3736 = uint(int(uint(_3734) >> uint(2)));
    int _3738 = _3734 & 3;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[int(_3736)][_3738];
    int _3742 = ~_3714;
    int _3744 = _3742 + 1;
    int _3746 = _3744 + 1;
    int _3748 = _3702;
    if (_3670)
    {
        int _3750 = ~_3668;
        int _3752 = _3750 + 1;
        _3748 = _3752;
    }
    int _3754 = _3748;
    float _3756 = _3512 * _3716;
    int _3758 = _3484 & 3;
    bool _3760 = _3758 != 0;
    bool _3762 = !_3466;
    int _3764 = _3762 ? 0 : 1;
    float _3766 = _3756 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3768 = !_3760;
    int _3770 = _3768 ? 0 : 1;
    bool _3772 = _3524 != 3;
    float _3774 = _3396 * _3766;
    float _3776 = precise::clamp(_3774, 0.0, 1.0);
    bool _3778 = uint(_3524) >= 2u;
    int _3780 = abs(_3764);
    int _3782 = abs(_3770);
    int _3784 = _3778 ? 0 : 1;
    int _3786 = _3722 * as_type<int>(_3626);
    int _3788 = ~_3784;
    int _3790 = _3788 + 1;
    int _3792 = _3790 + 1;
    int _3794 = ~_3780;
    int _3796 = _3794 + 1;
    int _3798 = _3796 + 1;
    int _3800 = ~_3782;
    int _3802 = _3800 + 1;
    int _3804 = _3802 + 1;
    float _3806 = _1700 * _1610;
    int _3808 = _3792;
    if (_3772)
    {
        int _3810 = ~_3784;
        int _3812 = _3810 + 1;
        _3808 = _3812;
    }
    int _3814 = _3808;
    int _3816 = _3746 * as_type<int>(_3662);
    bool _3818 = _3464 != 3;
    float _3820 = _1700 * _1612;
    bool _3822 = _3524 != 3;
    int _3824 = _3798 * as_type<int>(_3618);
    int _3826 = _3824 + _3786;
    int _3828 = abs(_3814);
    int _3830 = _3804 * as_type<int>(_3654);
    int _3832 = _3830 + _3816;
    float _3834 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3836 = int(_3834);
    bool _3838 = !_3818;
    int _3840 = _3838 ? 0 : (-1);
    float _3842 = fma(_1658, _1722, _3806);
    bool _3844 = !_3822;
    int _3846 = _3844 ? 0 : (-1);
    int _3848 = ~_3828;
    int _3850 = _3848 + 1;
    int _3852 = _3850 + 1;
    float _3854 = _3592 + _3842;
    int _3856 = abs(_3754);
    int _3858 = abs(_3846);
    int _3860 = _3852 * as_type<int>(_3688);
    int _3862 = _3860 + _3832;
    int _3864 = abs(_3840);
    float _3866 = _1700 * _1614;
    float _3868 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3870 = int(_3868);
    bool _3872 = !_2918;
    int _3874 = _3872 ? 0 : 1;
    int _3876 = ~_3856;
    int _3878 = _3876 + 1;
    int _3880 = _3878 + 1;
    int _3882 = ~_3858;
    int _3884 = _3882 + 1;
    int _3886 = _3884 + 1;
    float _3888 = _1656 * _1614;
    int _3890 = abs(_3874);
    int _3892 = _3880 * as_type<int>(_3732);
    int _3894 = _3892 + _3826;
    bool _3896 = !_2932;
    int _3898 = _3896 ? 0 : 1;
    int _3900 = _3886 * as_type<int>(_3696);
    int _3902 = _3900 + _3862;
    int _3904 = ~_3864;
    int _3906 = _3904 + 1;
    int _3908 = _3906 + 1;
    float _3910 = float(uint(_3836));
    int _3912 = _3908 * as_type<int>(_3740);
    int _3914 = _3912 + _3894;
    int _3916 = abs(_3898);
    int _3918 = ~_3890;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    float _3924 = 1.0 / _3910;
    int _3926 = abs(_3836);
    int _3928 = ~_3916;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    int _3934 = _3914 * _3922;
    float _3936 = float(uint(_3870));
    bool _3938 = !_2980;
    int _3940 = _3938 ? _3644 : (-1);
    int _3942 = _3932 * _3902;
    int _3944 = abs(_3870);
    float _3946 = 1.0 / _3936;
    float _3948 = float(uint(_3926));
    int _3950 = _3940 * _3890;
    int _3952 = _3950 + _3934;
    bool _3954 = !_3000;
    int _3956 = _3954 ? _3712 : (-1);
    float _3958 = _1688 * _1612;
    float _3960 = _1656 * _1610;
    float _3962 = _1656 * _1612;
    bool _3964 = _3870 == 0;
    float _3966 = 1.0 / _3948;
    float _3968 = _1688 * _1614;
    float _3970 = _1688 * _1610;
    float _3972 = float(uint(_3944));
    int _3974 = _3956 * _3916;
    int _3976 = _3974 + _3942;
    float _3978 = float(uint(_3952));
    float _3980 = -_1664;
    float _3982 = fma(_3980, _1728, _3962);
    int _3984 = abs(_3952);
    float _3986 = 1.0 / _3972;
    int _3988 = as_type<int>(_3924) + (-2);
    float _3990 = fma(_1654, _1728, _3958);
    int _3992 = as_type<int>(_3946) + (-2);
    float _3994 = fma(_1654, _1734, _3968);
    float _3996 = float(uint(_3976));
    float _3998 = as_type<float>(_3988) * _3978;
    int _4000 = abs(_3976);
    float _4002 = fma(_1654, _1722, _3970);
    int _4004 = as_type<int>(_3966) + (-2);
    float _4006 = as_type<float>(_3992) * _3996;
    float _4008 = float(uint(_3984));
    float _4010 = trunc(_3998);
    float _4012 = precise::max(_4010, 0.0);
    uint _4014 = uint(_4012);
    float _4016 = float(uint(_4000));
    float _4018 = _3534 + _3990;
    float _4020 = -_1664;
    float _4022 = fma(_4020, _1734, _3888);
    int _4024 = as_type<int>(_3986) + (-2);
    float _4026 = as_type<float>(_4004) * _4008;
    int _4028 = ~_3836;
    int _4030 = _4028 + 1;
    float _4032 = -_1664;
    float _4034 = fma(_4032, _1722, _3960);
    float _4036 = trunc(_4006);
    float _4038 = precise::max(_4036, 0.0);
    uint _4040 = uint(_4038);
    float _4042 = as_type<float>(_4024) * _4016;
    int _4044 = ~_3870;
    int _4046 = _4044 + 1;
    float _4048 = fma(_1658, _1728, _3820);
    float _4050 = fma(_1658, _1734, _3866);
    float _4052 = _3574 + _3982;
    int _4054 = ~_3926;
    int _4056 = _4054 + 1;
    float _4058 = _3544 + _4002;
    float _4060 = trunc(_4026);
    float _4062 = precise::max(_4060, 0.0);
    uint _4064 = uint(_4062);
    int _4066 = _4030 * int(_4014);
    int _4068 = _4066 + _3952;
    float _4070 = _3540 + _3994;
    float _4072 = _3556 + _4022;
    int _4074 = ~_3944;
    int _4076 = _4074 + 1;
    float _4078 = _3584 + _4034;
    float _4080 = float(uint(_4068));
    float _4082 = trunc(_4042);
    float _4084 = precise::max(_4082, 0.0);
    uint _4086 = uint(_4084);
    int _4088 = _4046 * int(_4040);
    int _4090 = _4088 + _3976;
    float _4092 = _3238 * _4072;
    bool _4094 = _3870 == 0;
    float _4096 = as_type<float>(_3988) * _4080;
    float _4098 = float(uint(_4090));
    int _4100 = _4056 * int(_4064);
    int _4102 = _4100 + _3984;
    float _4104 = trunc(_4096);
    float _4106 = precise::max(_4104, 0.0);
    uint _4108 = uint(_4106);
    float _4110 = _4078 * _3106;
    float _4112 = as_type<float>(_3992) * _4098;
    float _4114 = _3588 + _4048;
    float _4116 = float(uint(_4102));
    float _4118 = _4078 * _3318;
    float _4120 = _3560 + _4050;
    int _4122 = _4076 * int(_4086);
    int _4124 = _4122 + _4000;
    float _4126 = trunc(_4112);
    float _4128 = precise::max(_4126, 0.0);
    uint _4130 = uint(_4128);
    float _4132 = as_type<float>(_4004) * _4116;
    float _4134 = _4052 * _3318;
    float _4136 = _4072 * _3318;
    float _4138 = float(uint(_4124));
    float _4140 = _4052 * _3106;
    float _4142 = fma(_4018, _3308, _4134);
    float _4144 = _3238 * _4052;
    float _4146 = trunc(_4132);
    float _4148 = precise::max(_4146, 0.0);
    uint _4150 = uint(_4148);
    float _4152 = as_type<float>(_4024) * _4138;
    float _4154 = _4072 * _3106;
    float _4156 = fma(_4070, _3308, _4136);
    float _4158 = fma(_4058, _3308, _4118);
    float _4160 = fma(_3380, _4070, _4092);
    float _4162 = fma(_4070, _3104, _4154);
    float _4164 = _3238 * _4078;
    float _4166 = trunc(_4152);
    float _4168 = precise::max(_4166, 0.0);
    uint _4170 = uint(_4168);
    int _4172 = int(_4040) + int(_4130);
    float _4174 = fma(_4018, _3104, _4140);
    int _4176 = ~_3870;
    int _4178 = _4176 + 1;
    float _4180 = fma(_4058, _3104, _4110);
    int _4182 = ~_3926;
    int _4184 = _4182 + 1;
    float _4186 = fma(_3380, _4018, _4144);
    int _4188 = int(_4014) + int(_4108);
    float _4190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4192 = int(_4064) + int(_4150);
    float _4194 = fma(_3380, _4058, _4164);
    int _4196 = ~_3836;
    int _4198 = _4196 + 1;
    float _4200 = fma(_4114, _3342, _4142);
    int _4202 = ~_3944;
    int _4204 = _4202 + 1;
    int _4206 = _4184 * _4192;
    int _4208 = _4206 + _3984;
    int _4210 = int(_4086) + int(_4170);
    int _4212 = _4198 * _4188;
    int _4214 = _4212 + _3952;
    float _4216 = fma(_4114, _3108, _4174);
    bool _4218 = uint(_4208) >= uint(_3926);
    float _4220 = fma(_4120, _3108, _4162);
    bool _4222 = uint(_4214) >= uint(_3836);
    int _4224 = _4178 * _4172;
    int _4226 = _4224 + _3976;
    float _4228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _4230 = fma(_3854, _3108, _4180);
    bool _4232 = uint(_4226) >= uint(_3870);
    int _4234 = _4204 * _4210;
    int _4236 = _4234 + _4000;
    bool _4238 = !_4222;
    int _4240 = _4238 ? 0 : (-1);
    out.m_87.x = _4216;
    out.m_87.y = _4220;
    out.m_87.z = _4230;
    bool _4242 = !_4232;
    int _4244 = _4242 ? 0 : (-1);
    int _4246 = ~_4188;
    int _4248 = _4246 + _4240;
    int _4250 = _4248 + 1;
    int _4252 = ~_4172;
    int _4254 = _4252 + _4244;
    int _4256 = _4254 + 1;
    bool _4258 = uint(_4236) >= uint(_3944);
    bool _4260 = _3836 == 0;
    bool _4262 = _3836 == 0;
    int _4264 = _3952 ^ _3836;
    int _4266 = _3836 * _4250;
    int _4268 = _4266 + _3952;
    int _4270 = _3976 ^ _3870;
    int _4272 = _3870 * _4256;
    int _4274 = _4272 + _3976;
    bool _4276 = !_4218;
    int _4278 = _4276 ? 0 : (-1);
    float _4280 = _4190 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4282 = !_4258;
    int _4284 = _4282 ? 0 : (-1);
    float _4286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4288 = uint(int(uint(_4264) >> uint(31)));
    float _4290 = fma(_4280, _2778, -0.5);
    uint _4292 = uint(int(uint(_4270) >> uint(31)));
    float _4294 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4296 = !_4260;
    int _4298 = _4296 ? _4268 : (-1);
    int _4300 = ~_4278;
    int _4302 = _4192 + _4300;
    int _4304 = _4302 + 1;
    float _4306 = fma(_4294, _2846, -0.5);
    int _4308 = ~_4284;
    int _4310 = _4210 + _4308;
    int _4312 = _4310 + 1;
    float _4314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4316 = ~int(_4288);
    int _4318 = _4316 + 1;
    int _4320 = ~int(_4292);
    int _4322 = _4320 + 1;
    bool _4324 = !_3964;
    int _4326 = _4324 ? _4274 : (-1);
    float _4328 = float(_4298);
    int _4330 = _4304 ^ _4318;
    int _4332 = _4312 ^ _4322;
    float _4334 = float(_4326);
    float _4336 = fma(_4280, _4328, _768);
    int _4338 = ~_4318;
    int _4340 = _4338 + _4330;
    int _4342 = _4340 + 1;
    int _4344 = ~_4322;
    int _4346 = _4344 + _4332;
    int _4348 = _4346 + 1;
    float _4350 = fma(_1416, _4290, _4336);
    bool _4352 = !_4262;
    int _4354 = _4352 ? _4342 : (-1);
    float _4356 = _4286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _4358 = !_4094;
    int _4360 = _4358 ? _4348 : (-1);
    float _4362 = _4314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4364 = float(_4354);
    float _4366 = fma(_4294, _4334, _1430);
    float _4368 = float(_4360);
    float _4370 = fma(_2892, _4356, -0.5);
    float _4372 = fma(_3198, _4362, -0.5);
    float _4374 = -_1092;
    float _4376 = fma(_4356, _4364, _4374);
    float _4378 = _2520 + _2486;
    float _4380 = -_1448;
    float _4382 = fma(_4362, _4368, _4380);
    float _4384 = fma(_3384, _3854, _4194);
    float _4386 = fma(_1412, _4370, _4376);
    float _4388 = fma(_3384, _4114, _4186);
    float _4390 = fma(_1442, _4372, _4382);
    float _4392 = fma(_3384, _4120, _4160);
    float _4394 = _4378 * 0.5;
    float _4396 = in.m_89.x;
    float _4398 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4400 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2641);
    float _4402 = fma(_1404, _4306, _4366);
    float _4404 = fma(_4120, _3342, _4156);
    float _4406 = _4398 * _2570;
    float _4408 = -_3776;
    float _4410 = fma(_4408, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4412 = _4402 + 0.5;
    out.gl_Position.x = _2520;
    out.gl_Position.y = _2536;
    out.gl_Position.z = _4400;
    out.gl_Position.w = _2486;
    float _4414 = _2581 * _4406;
    float _4416 = _4400 + _2486;
    float _4418 = _2486 * 0.5;
    float _4420 = _2591 * _4406;
    float _4422 = fma(_2587, _4414, _2575);
    float _4424 = _4350 + 0.5;
    float _4426 = _4386 + 0.5;
    float _4428 = _4390 + 0.5;
    float _4430 = _4416 * 0.5;
    float _4432 = fma(_2536, -0.5, _4418);
    float _4434 = fma(_3854, _3342, _4158);
    float _4436 = fma(_2589, _4414, _2577);
    float _4438 = -_4398;
    float _4440 = _4438 + 1.0;
    float _4442 = _4410 * _4396;
    float _4444 = fma(_2581, _4420, _2579);
    out.m_91.x = _4388;
    out.m_91.y = _4392;
    out.m_91.z = _4384;
    float _4446 = _2581 * _4440;
    float _4448 = _4442 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _4450 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4452 = isnan(_2256);
    bool _4454 = _4450 || _4452;
    bool _4456 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4458 = _4454 || _4456;
    out.m_93.x = _4424;
    out.m_93.y = _4426;
    out.m_93.z = _4412;
    out.m_93.w = _4428;
    float _4460 = _2174 * _2234;
    out.m_95.x = _4394;
    out.m_95.y = _4432;
    out.m_95.z = _4430;
    out.m_95.w = _2486;
    float _4462 = _4460 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _4448;
    out.m_99.x = _4422;
    out.m_99.y = _4436;
    out.m_99.z = _4444;
    out.m_99.w = _4446;
    float _4464 = _4216;
    float _4466 = _4400;
    float _4468 = _4440;
    float _4470 = _4460;
    if (!_4458)
    {
        _4464 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4472 = _4464;
    float _4474 = _4472;
    float _4476 = _4472;
    if (!_4458)
    {
        _2643 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4478 = _2643;
    out.m_101.x = _4200;
    out.m_101.y = _4404;
    out.m_101.z = _4434;
    float _4480 = _4478;
    float _4482 = _4478;
    if (!_4458)
    {
        _4466 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4484 = _4466;
    float _4486 = _4484;
    float _4488 = _4484;
    if (!_4458)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4490 = _2645;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4458)
    {
        _4468 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4496 = _4468;
    float _4498 = _4496;
    float _4500 = _4496;
    if (!_4458)
    {
        _4470 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4502 = _4470;
    bool _4504 = !_4458;
    float _4506 = _4502;
    float _4508 = _4502;
    if (!_4504)
    {
        bool _4510 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4512 = isnan(_2256);
        bool _4514 = _4510 || _4512;
        bool _4516 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4518 = _4514 || _4516;
        if (!_4518)
        {
            float _4520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4522 = _2256 + _4520;
            float _4524 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4526 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4524;
            float _4528 = 1.0 / _4526;
            float _4530 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4532 = _4530 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4536 = _4534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4538 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4540 = _4538 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4542 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4544 = _4542 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4546 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4548 = _4546 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4550 = _4522 * _4528;
            float _4552 = precise::clamp(_4550, 0.0, 1.0);
            float _4554 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4556 = _4554 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4558 = fma(_4552, _4532, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4560 = fma(_4552, _4556, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4562 = fma(_4552, _4536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4564 = fma(_4552, _4540, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4566 = fma(_4552, _4544, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4568 = fma(_4552, _4548, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4482 = _4560;
            _4500 = _4566;
            _4476 = _4558;
            _4494 = _4564;
            _4488 = _4562;
            _4508 = _4568;
            _4570 = true;
        }
        else
        {
            bool _4572 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4574 = isnan(_2256);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4580 = _4576 || _4578;
            if (!_4580)
            {
                _4474 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4582 = _4474;
            _4476 = _4582;
            if (!_4580)
            {
                _4480 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4584 = _4480;
            _4482 = _4584;
            if (!_4580)
            {
                _4486 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4586 = _4486;
            _4488 = _4586;
            if (!_4580)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4588 = _4492;
            _4494 = _4588;
            if (!_4580)
            {
                _4498 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4590 = _4498;
            _4500 = _4590;
            if (!_4580)
            {
                _4506 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4592 = _4506;
            bool _4594 = !_4580;
            _4508 = _4592;
            if (!_4594)
            {
                bool _4596 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4598 = isnan(_2256);
                bool _4600 = _4596 || _4598;
                bool _4602 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4604 = _4600 || _4602;
                if (!_4604)
                {
                    float _4606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4608 = _2256 + _4606;
                    float _4610 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4612 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4610;
                    float _4614 = 1.0 / _4612;
                    float _4616 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4618 = _4616 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4620 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4622 = _4620 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4624 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4626 = _4624 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4628 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4630 = _4628 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4632 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4634 = _4632 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4636 = _4608 * _4614;
                    float _4638 = precise::clamp(_4636, 0.0, 1.0);
                    float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4642 = _4640 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4644 = fma(_4638, _4618, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4646 = fma(_4638, _4642, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4648 = fma(_4638, _4622, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4650 = fma(_4638, _4626, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4652 = fma(_4638, _4630, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4654 = fma(_4638, _4634, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4482 = _4646;
                    _4500 = _4652;
                    _4476 = _4644;
                    _4494 = _4650;
                    _4488 = _4648;
                    _4508 = _4654;
                    _4570 = true;
                }
                else
                {
                    _4482 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4500 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4476 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4488 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4508 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4570 = false;
    float _4656 = _4482;
    float _4658 = _4500;
    float _4660 = _4476;
    float _4662 = _4494;
    float _4664 = _4488;
    float _4666 = _4508;
    float _4668 = _4462 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4670 = fma(_4404, -0.5, 0.5);
    float _4672 = precise::clamp(_4670, 0.0, 1.0);
    float _4674 = -_4656;
    float _4676 = _4674 + _4658;
    float _4678 = -_4660;
    float _4680 = _4678 + _4662;
    out.m_49.x = _4668;
    float _4682 = fma(_4672, _4676, _4656);
    float _4684 = -_4664;
    float _4686 = _4684 + _4666;
    float _4688 = fma(_4672, _4680, _4660);
    float _4690 = _4682 * 0.586610972881317138671875;
    bool _4692 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4694 = fma(_4672, _4686, _4664);
    out.m_103.x = 0.0;
    float _4696 = fma(_4688, 0.298911988735198974609375, _4690);
    bool _4698 = _2174 > 0.0;
    bool _4700 = isnan(_2174);
    bool _4702 = _4698 || _4700;
    bool _4704 = isnan(0.0);
    bool _4706 = _4702 || _4704;
    float _4708 = fma(_4694, 0.114477999508380889892578125, _4696);
    bool _4710 = _2234 <= 0.0;
    bool _4712 = !_4706;
    bool _4714 = _4710 || _4712;
    float _4716 = -_4708;
    float _4718 = _4688 + _4716;
    float _4720 = -_4708;
    float _4722 = _4682 + _4720;
    float _4724 = -_4708;
    float _4726 = _4694 + _4724;
    float _4728 = fma(_4718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    float _4730 = fma(_4722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    float _4732 = fma(_4726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    bool _4734 = !_4692;
    if (!_4734)
    {
        float _4736 = -_2106;
        float _4738 = _4736 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4740 = -_2108;
        float _4742 = _4740 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4744 = -_2110;
        float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4748 = _4738 * _4738;
        float _4750 = fma(_4742, _4742, _4748);
        float _4752 = fma(_4746, _4746, _4750);
        float _4754 = sqrt(_4752);
        float _4756 = rsqrt(_4752);
        float _4758 = -_4754;
        float _4760 = _4758 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4762 = _4760 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4764 = precise::clamp(_4762, 0.0, 1.0);
        float _4766 = _4742 * _4756;
        float _4768 = _4738 * _4756;
        float _4770 = abs(_4764);
        float _4772 = log2(_4770);
        float _4774 = _4746 * _4756;
        float _4776 = _4766 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4778 = _4404 * _4768;
        float _4780 = -_4768;
        float _4782 = -_4776;
        float _4784 = fma(_4780, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4782);
        float _4786 = fma(_4200, _4766, _4778);
        float _4788 = -_4774;
        float _4790 = fma(_4788, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4784);
        float _4792 = fma(_4434, _4774, _4786);
        float _4794 = precise::clamp(_4792, 0.0, 1.0);
        float _4796 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4798 = _4790 + _4796;
        float _4800 = _4772 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4802 = _4798 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4804 = precise::clamp(_4802, 0.0, 1.0);
        float _4806 = exp2(_4800);
        float _4808 = _4806 * _4804;
        float _4810 = _4794 * _4808;
        float _4812 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4814 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4816 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4812;
        out.m_103.y = _4814;
        out.m_103.z = _4816;
    }
    out.m_69.x = _4728;
    out.m_69.y = _4730;
    out.m_69.z = _4732;
    if (!_4714)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4818 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4818;
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
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4570 = false;
    bool _718 = false;
    bool _540 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4874 = as_type<float>(_138);
        out.gl_Position.z = _4874;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_51.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_122);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_168)
    {
        out.m_49.x = 0.0;
    }
    int _172 = 0;
    if (_168)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4943 = as_type<float>(_176);
        out.gl_Position.z = _4943;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_53.x;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _182 = _154 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _192 = _182 * _180;
    float _194 = _154 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _198 = _194 * _190;
    float _200 = floor(_196);
    float _202 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[20].y, _198);
    float _204 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _214 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _204);
    float _216 = _202 * 6.283185482025146484375;
    float _218 = floor(_202);
    float _220 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _228 = _226 != 0;
    float _230 = _210 * 0.15915493667125701904296875;
    float _232 = _216 * 0.15915493667125701904296875;
    float _234 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _212);
    float _236 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _220);
    bool _238 = !_224;
    int _240 = _238 ? 0 : 1;
    float _242 = -_200;
    float _244 = _196 + _242;
    float _246 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _214);
    float _248 = _230 * 6.283185482025146484375;
    float _250 = cos(_248);
    float _252 = -_218;
    float _254 = _202 + _252;
    int _256 = abs(_240);
    float _258 = _232 * 6.283185482025146484375;
    float _260 = cos(_258);
    bool _262 = !_208;
    int _264 = _262 ? 0 : 1;
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _270 = -_244;
    float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _274 = abs(_264);
    float _276 = float(_256);
    float _278 = fma(_250, 0.5, 0.5);
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _282 = !_228;
    int _284 = _282 ? 0 : 1;
    float _286 = abs(_272);
    float _288 = _276 * _286;
    float _290 = abs(_268);
    float _292 = _276 * _290;
    bool _294 = _254 < 0.5;
    float _296 = float(_294);
    float _298 = -_278;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _302 = float(_274);
    float _304 = fma(_260, 0.5, 0.5);
    bool _306 = _244 < 0.5;
    float _308 = float(_306);
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _314 = abs(_284);
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _320 = fma(_302, _300, _288);
    float _322 = -_308;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = float(_314);
    float _328 = fma(_302, _318, _292);
    float _330 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _234);
    float _332 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _236);
    float _334 = abs(_324);
    float _336 = fma(_326, _334, _320);
    float _338 = abs(_312);
    float _340 = fma(_326, _338, _328);
    bool _342 = !_280;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _360;
    if (!_342)
    {
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_122);
        float _366 = 1.0 / _364;
        float _368 = _154 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _370 + _372;
    bool _376 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_370);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _390 = _370 + _388;
    bool _392 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_370);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _412 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _414 = isnan(_370);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -_386;
    float _426 = _424 + 1.0;
    float _428 = 1.0 / _410;
    float _430 = _422 * _426;
    float _432 = -_422;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _406;
    float _444 = _402 * _434;
    float _446 = -_402;
    float _448 = _446 + 1.0;
    float _450 = _390 * _428;
    float _452 = _374 * _442;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    float _462 = fma(_438, _452, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = fma(_460, _452, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _468 = in.m_57.x;
    float _470 = in.m_57.y;
    float _472 = in.m_57.z;
    float _474 = _462 * _444;
    float _476 = _464 * _444;
    float _478 = _466 * _444;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _494 = fma(_482, _450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _496 = fma(_486, _450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _498 = fma(_490, _450, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _502 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _504 = fma(_494, _430, _492);
    float _506 = fma(_496, _430, _500);
    float _508 = fma(_498, _430, _502);
    float _510 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].x, _504);
    float _512 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].y, _506);
    float _514 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[145].z, _508);
    float _516 = _510 * _468;
    float _518 = _512 * _470;
    float _520 = _514 * _472;
    bool _522 = !_440;
    float _538;
    if (!_522)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _178 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_122);
        float _544 = 1.0 / _542;
        float _546 = _154 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _548 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _578 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_548);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = 1.0 / _556;
    float _592 = -_568;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _596;
    bool _600 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _602 = isnan(_548);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = _588 * _594;
    float _614 = -_588;
    float _616 = _614 + 1.0;
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _620 = 1.0 / _572;
    float _622 = _610 * _616;
    float _624 = -_610;
    float _626 = _624 + 1.0;
    float _628 = 1.0 / _576;
    float _630 = _598 * _590;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = fma(_630, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _634 * _620;
    bool _640 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _642 = isnan(_548);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _548 + _656;
    float _660 = _636 * _622;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _664 = _548 + _662;
    float _666 = -_650;
    float _668 = _666 + 1.0;
    float _670 = fma(_638, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _672 = _654 * _628;
    float _674 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _676 = _568 * _668;
    float _678 = fma(_672, _664, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _680 = fma(_670, _612, _674);
    float _682 = fma(_678, _676, _680);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[118].x, _682);
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _692;
    out.m_59.y = _694;
    out.m_59.z = _696;
    out.m_59.w = _698;
    bool _700 = !_618;
    float _716;
    if (!_700)
    {
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _704 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        float _720 = float(_122);
        float _722 = 1.0 / _720;
        float _724 = _154 * _722;
        _716 = _724;
    }
    _718 = false;
    float _726 = _716;
    float _728 = in.m_46.x;
    float _730 = in.m_46.y;
    float _732 = in.m_46.z;
    float _734 = _178 * 2.0;
    float _736 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = in.m_53.y;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _746 = in.m_53.z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = _336 * _516;
    float _752 = floor(_734);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = -_748;
    float _760 = fma(_736, 2.0, _758);
    float _762 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _766 = -_154;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _760);
    float _770 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _772 = int(_770);
    float _774 = _762 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _776 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = -_764;
    float _780 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _778);
    float _782 = _340 * _518;
    float _784 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _788 = _752 > 0.0;
    float _790 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _792 = _752 >= 0.0;
    bool _794 = isnan(_752);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _804 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _806 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _808 = fma(_786, -2.0, _744);
    float _810 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _802);
    float _812 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _816 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _818 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _810);
    float _820 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _812);
    float _822 = -_814;
    float _824 = _822 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _826 = _738 * 2.0;
    float _828 = _818 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _830 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _832 = _824 * _824;
    float _834 = -_816;
    float _836 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _834);
    float _838 = -_828;
    float _840 = _838 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _842 = -_830;
    float _844 = _842 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _846 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _848 = floor(_826);
    float _850 = fma(_840, _840, _832);
    float _852 = -_846;
    float _854 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _852);
    float _856 = fma(_844, _844, _850);
    float _858 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _860 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _872 = _870 != 0;
    float _874 = rsqrt(_856);
    float _876 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _878 = -_860;
    float _880 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _878);
    float _882 = _178 + _738;
    float _884 = -_858;
    float _886 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _888 = -_876;
    float _890 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _888);
    int _892 = _800 ? 0 : 1;
    float _894 = _738 + _746;
    bool _896 = _848 > 0.0;
    float _898 = _882 + (-1.0);
    bool _900 = _848 >= 0.0;
    bool _902 = isnan(_848);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    float _910 = _894 + (-1.0);
    int _912 = ~_892;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _746 * 2.0;
    float _922 = _840 * _874;
    float _924 = _844 * _874;
    int _926 = _916;
    int _928 = as_type<int>(_910);
    int _930 = as_type<int>(_920);
    float _932 = _738;
    int _934 = as_type<int>(_746);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_788)
    {
        int _938 = ~_892;
        int _940 = _938 + 1;
        _926 = _940;
    }
    int _942 = _926;
    float _944 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = _922 * _922;
    float _948 = floor(_920);
    bool _950 = !_868;
    int _952 = _950 ? 0 : 1;
    float _954 = _836 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _956 = fma(_924, _924, _946);
    bool _958 = !_864;
    int _960 = _958 ? 0 : 1;
    float _962 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _964 = !_872;
    int _966 = _964 ? 0 : 1;
    float _968 = -_954;
    float _970 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[0].y, _968);
    float _972 = rsqrt(_956);
    float _974 = as_type<float>(_942);
    if (_756)
    {
        _928 = 0;
        _930 = 0;
    }
    int _976 = _928;
    int _978 = _930;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = -_962;
    float _994 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    int _996 = _976;
    int _998 = _978;
    if (!_756)
    {
        _996 = 1;
    }
    int _1000 = _996;
    float _1002 = _824 * _874;
    if (!_756)
    {
        _998 = 2;
    }
    int _1004 = _998;
    float _1006 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].w, _970);
    bool _1008 = _1000 != 1;
    float _1010 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1012 = !_982;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].w, _994);
    bool _1018 = _1004 != 2;
    float _1020 = _836 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1022 = -_1010;
    float _1024 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1022);
    bool _1026 = _948 > 0.0;
    float _1028 = _924 * _972;
    float _1030 = -_1020;
    float _1032 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1030);
    float _1034 = _922 * _972;
    float _1036 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1038 = -_1028;
    float _1040 = _924 * _1038;
    float _1042 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1024);
    float _1044 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1032);
    float _1046 = -_1036;
    float _1048 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1046);
    float _1050 = -_1040;
    float _1052 = fma(_922, _1034, _1050);
    float _1054 = _1002 * _1034;
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1058 = _880 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1060 = _1052 * _1052;
    float _1062 = -_1028;
    float _1064 = _1002 * _1062;
    float _1066 = -_1056;
    float _1068 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1066);
    float _1070 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1048);
    float _1072 = fma(_1054, _1054, _1060);
    float _1074 = -_1058;
    float _1076 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1074);
    float _1078 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1068);
    float _1082 = fma(_1064, _1064, _1072);
    float _1084 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1076);
    float _1086 = -_1078;
    float _1088 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1086);
    float _1090 = _908 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1092 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _808);
    float _1094 = -_1084;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1080);
    float _1098 = rsqrt(_1082);
    bool _1100 = _948 >= 0.0;
    bool _1102 = isnan(_948);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1088);
    bool _1112 = !_986;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1118 = _1108 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1120 = abs(_1114);
    float _1122 = 1.0 / _1096;
    int _1124 = ~as_type<int>(_1118);
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _1128;
    float _1132 = _1118;
    float _1134 = _1090;
    if (!_1026)
    {
        int _1136 = ~as_type<int>(_1118);
        int _1138 = _1136 + 1;
        _1130 = _1138;
    }
    int _1140 = _1130;
    if (_1018)
    {
        _1132 = _178;
    }
    float _1142 = _1132;
    float _1144 = float(_942);
    float _1146 = _1052 * _1098;
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = float(_1120);
    float _1152 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1154 = int(_1152);
    float _1156 = _1142;
    if (!_1018)
    {
        _1156 = _746;
    }
    float _1158 = _1156;
    float _1160 = -_1148;
    float _1162 = _1160 + 1.0;
    int _1164 = abs(_1014);
    float _1166 = _1150 * _1144;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1170 = float(_1164);
    float _1172 = float(_1140);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1176 = fma(_1016, _1122, -1.0);
    float _1178 = _1162 * _1122;
    float _1180 = -_1174;
    float _1182 = fma(_1168, 2.0, _1180);
    float _1184 = _1170 * _1172;
    float _1186 = fma(_1162, _1176, 1.0);
    float _1188 = in.m_61.x;
    float _1190 = in.m_61.y;
    float _1192 = in.m_61.z;
    float _1194 = _1006 * _1178;
    float _1196 = _1110 * _1178;
    float _1198 = _1186 * _1186;
    float _1200 = _1176;
    if (!_1008)
    {
        _1200 = _746;
    }
    float _1202 = _1200;
    float _1204 = _1184 * (-2.0);
    float _1206 = _1202;
    if (_1008)
    {
        _1206 = _738;
    }
    float _1208 = _1206;
    float _1210 = fma(_1194, _1194, _1198);
    float _1212 = _1208;
    if (!_1008)
    {
        _974 = _738;
    }
    float _1214 = _974;
    float _1216 = fma(_918, _1204, _918);
    float _1218 = fma(_1196, _1196, _1210);
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1222 = ~as_type<int>(_1090);
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = -_154;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    int _1232 = _1226;
    float _1234 = _1214;
    if (!_896)
    {
        int _1236 = ~as_type<int>(_1090);
        int _1238 = _1236 + 1;
        _1232 = _1238;
    }
    int _1240 = _1232;
    float _1242 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1220);
    if (!_1008)
    {
        _1134 = _1214;
    }
    float _1244 = _1134;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = _1244;
    if (_1008)
    {
        _1234 = _178;
    }
    float _1250 = _1234;
    float _1252 = rsqrt(_1218);
    float _1254 = _1250;
    if (_1018)
    {
        _1212 = _738;
    }
    float _1256 = _1212;
    float _1258 = _178 + (-0.5);
    float _1260 = _1256;
    if (!_1018)
    {
        _1260 = _178;
    }
    float _1262 = _1260;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    if (_1008)
    {
        _1248 = _178;
    }
    float _1266 = _1248;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1270 = fma(_1204, _1188, _1188);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1008)
    {
        _1254 = _746;
    }
    float _1274 = _1254;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1278 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1270);
    float _1280 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1282 = int(_1280);
    float _1284 = _1274;
    if (_1008)
    {
        _1284 = _738;
    }
    float _1286 = _1284;
    float _1288 = -_1272;
    float _1290 = fma(_1276, 2.0, _1288);
    float _1292 = _1196 * _1252;
    float _1294 = _1194 * _1252;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1298 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1300 = log2(_1298);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1304 = -_1292;
    float _1306 = _922 * _1304;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1310 = fma(_1268, -2.0, _1302);
    float _1312 = -_1294;
    float _1314 = -_1306;
    float _1316 = fma(_924, _1312, _1314);
    float _1318 = fma(_1296, -2.0, _1308);
    float _1320 = _1186 * _1252;
    float _1322 = -_1294;
    float _1324 = _1002 * _1322;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1328 = float(_1154);
    float _1330 = _924 * _1320;
    float _1332 = float(_1282);
    float _1334 = _1300 * _154;
    bool _1336 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1338 = isnan(1.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1344 = _1340 || _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1348 = 1.0 + _1346;
    float _1350 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1326);
    float _1352 = 1.0 / _1328;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1356 = -_1292;
    float _1358 = -_1330;
    float _1360 = fma(_1002, _1356, _1358);
    float _1362 = -_1324;
    float _1364 = fma(_922, _1320, _1362);
    float _1366 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1354);
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _814 + _1368;
    float _1372 = exp2(_1334);
    bool _1374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1382 = _1378 || _1380;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1388 = float(_742);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1392 = _828 + _1390;
    float _1394 = float(_772);
    float _1396 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1384);
    float _1398 = 1.0 / _1332;
    float _1400 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1386);
    float _1402 = _1370 * _1370;
    float _1404 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1264);
    float _1406 = _1388 * _154;
    float _1408 = _1394 * _154;
    float _1410 = _1352 * _154;
    float _1412 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1396);
    float _1414 = 1.0 / _1348;
    float _1416 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    bool _1418 = !_990;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = -_1372;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1400);
    float _1428 = -_154;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1290);
    int _1432 = abs(_1420);
    float _1434 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1366);
    float _1436 = float(_1240);
    float _1438 = _1316 * _1316;
    float _1440 = _1382 ? _1424 : 0.0;
    float _1442 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1242);
    float _1444 = _1398 * _154;
    float _1446 = fma(_1360, _1360, _1438);
    float _1448 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1318);
    float _1450 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1310);
    if (_1344)
    {
        float _1452 = _1440 * _1414;
        _158 = _1452;
    }
    float _1454 = _158;
    float _1456 = fma(_1364, _1364, _1446);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _830 + _1458;
    float _1462 = fma(_1392, _1392, _1402);
    float _1464 = _1166 * (-2.0);
    float _1466 = float(_1432);
    float _1468 = fma(_1216, _1454, _1278);
    float _1470 = fma(_1460, _1460, _1462);
    float _1472 = rsqrt(_1456);
    float _1474 = fma(_944, _1464, _944);
    float _1476 = fma(_1464, _1190, _1190);
    float _1478 = _738 + (-0.5);
    float _1480 = _1466 * _1436;
    float _1482 = _178 + _746;
    float _1484 = _1468 * 0.15915493667125701904296875;
    float _1486 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1476);
    float _1488 = sqrt(_1470);
    float _1490 = _1480 * (-2.0);
    float _1492 = _1482 + (-1.0);
    float _1494 = fma(_1474, _1454, _1486);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1498 = _1496 != 0;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1502 = _1500 != 0;
    float _1504 = fma(_1490, _1192, _1192);
    float _1506 = _1494 * 0.15915493667125701904296875;
    float _1508 = rsqrt(_1470);
    float _1510 = _1360 * _1472;
    float _1512 = _1364 * _1472;
    float _1514 = _1316 * _1472;
    bool _1516 = !_1502;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = _924 * _1510;
    float _1522 = _1002 * _1512;
    float _1524 = _922 * _1514;
    float _1526 = _1488 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1528 = -_1520;
    float _1530 = fma(_922, _1512, _1528);
    float _1532 = -_1522;
    float _1534 = fma(_924, _1514, _1532);
    float _1536 = -_1524;
    float _1538 = fma(_1002, _1510, _1536);
    float _1540 = precise::min(_774, _1526);
    float _1542 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1544 = _1530 * _1530;
    float _1546 = _746 + (-0.5);
    float _1548 = _1484 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = _1508 * _1540;
    float _1554 = fma(_1534, _1534, _1544);
    float _1556 = fma(_1542, _1490, _1542);
    float _1558 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1504);
    float _1560 = _1370 * _1552;
    float _1562 = fma(_1538, _1538, _1554);
    float _1564 = _1392 * _1552;
    float _1566 = _1460 * _1552;
    float _1568 = -_1560;
    float _1570 = _1370 + _1568;
    float _1572 = rsqrt(_1562);
    float _1574 = -_1564;
    float _1576 = _1392 + _1574;
    float _1578 = fma(_1556, _1454, _1558);
    float _1580 = _1570 * _1570;
    float _1582 = -_1566;
    float _1584 = _1460 + _1582;
    bool _1586 = !_1498;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = _1578 * 0.15915493667125701904296875;
    float _1592 = fma(_1576, _1576, _1580);
    float _1594 = _1484 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = fma(_1584, _1584, _1592);
    float _1600 = in.m_63.x;
    float _1602 = in.m_63.y;
    float _1604 = in.m_63.z;
    float _1606 = _1506 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1538 * _1572;
    float _1612 = _1534 * _1572;
    float _1614 = _1530 * _1572;
    float _1616 = _922 * _1610;
    float _1618 = _1002 * _1612;
    float _1620 = _924 * _1614;
    float _1622 = _1506 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = -_1616;
    float _1628 = fma(_924, _1612, _1626);
    float _1630 = -_1618;
    float _1632 = fma(_922, _1614, _1630);
    float _1634 = -_1620;
    float _1636 = fma(_1002, _1610, _1634);
    float _1638 = _1590 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = _1550 * _1608;
    float _1644 = _1596 * _1608;
    float _1646 = sqrt(_1598);
    float _1648 = _1550 * _1624;
    float _1650 = _1596 * _1624;
    float _1652 = _1550 * _1640;
    float _1654 = _1624 * _1640;
    float _1656 = _1596 * _1640;
    float _1658 = _1608 * _1640;
    float _1660 = _1628 * _1628;
    float _1662 = _1590 * 6.283185482025146484375;
    float _1664 = sin(_1662);
    float _1666 = _1508 * _1646;
    float _1668 = fma(_1636, _1636, _1660);
    float _1670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1602);
    float _1672 = _790 * _1666;
    float _1674 = fma(_1632, _1632, _1668);
    float _1676 = _762 * _1666;
    float _1678 = _1116 * _1666;
    float _1680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    float _1682 = _1672 * _1670;
    float _1684 = rsqrt(_1674);
    float _1686 = _1676 * _1680;
    float _1688 = fma(_1664, _1650, _1642);
    float _1690 = _1656 * _1682;
    float _1692 = _1678 * _1604;
    float _1694 = -_1682;
    float _1696 = _1664 * _1694;
    float _1698 = -_1648;
    float _1700 = fma(_1664, _1644, _1698);
    float _1702 = fma(_1688, _1686, _1690);
    float _1704 = -_1644;
    float _1706 = fma(_1664, _1648, _1704);
    float _1708 = _1652 * _1682;
    float _1710 = fma(_1654, _1686, _1696);
    float _1712 = fma(_1700, _1692, _1702);
    float _1714 = fma(_1664, _1642, _1650);
    float _1716 = fma(_1706, _1686, _1708);
    float _1718 = fma(_1658, _1692, _1710);
    float _1720 = _1610 * _1712;
    float _1722 = _1632 * _1684;
    float _1724 = fma(_1714, _1692, _1716);
    float _1726 = _1612 * _1712;
    float _1728 = _1636 * _1684;
    float _1730 = fma(_1722, _1718, _1720);
    float _1732 = _1614 * _1712;
    float _1734 = _1628 * _1684;
    float _1736 = fma(_1728, _1718, _1726);
    float _1738 = fma(_924, _1724, _1730);
    float _1740 = -_1566;
    float _1742 = _830 + _1740;
    float _1744 = fma(_922, _1724, _1736);
    float _1746 = _830 + _1738;
    float _1748 = fma(_1734, _1718, _1732);
    float _1750 = -_1560;
    float _1752 = _814 + _1750;
    float _1754 = _828 + _1744;
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1758 = _1746 + _1756;
    float _1760 = fma(_1002, _1724, _1748);
    float _1762 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1766 = _1754 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = _814 + _1760;
    float _1772 = fma(_1766, _1766, _1768);
    float _1774 = -_1564;
    float _1776 = _828 + _1774;
    float _1778 = sqrt(_1772);
    float _1780 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1762);
    float _1782 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    bool _1784 = _1778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1788 = _1786 != 0;
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1792 = _1790 != 0;
    bool _1794 = !_1788;
    int _1796 = _1794 ? 0 : 1;
    bool _1798 = !_1792;
    int _1800 = _1798 ? 0 : 1;
    float _1802 = _1780;
    float _1804 = _1718;
    float _1806 = _1732;
    float _1808 = _1560;
    float _1810 = _1564;
    float _1812 = _1772;
    bool _1814 = _1792;
    if (!_1784)
    {
        _1802 = _1754;
    }
    float _1816 = _1802;
    float _1818 = _1816;
    if (!_1784)
    {
        _1804 = _1746;
    }
    float _1820 = _1804;
    float _1822 = _1820;
    if (!_1784)
    {
        _1806 = _1770;
    }
    float _1824 = _1806;
    bool _1826 = !_1784;
    float _1828 = _1824;
    if (!_1826)
    {
        float _1830 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1834 = _1778 + _1832;
        float _1836 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1838 = _1834 * _1830;
        float _1840 = rsqrt(_1772);
        float _1842 = _1838 * 0.15915493667125701904296875;
        float _1844 = _1842 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = _1842 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = _1846 + (-1.0);
        float _1854 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1856 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = _1840 * _1854;
        float _1860 = fma(_1770, _1846, _1856);
        float _1862 = fma(_1766, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1864 = fma(_1758, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1828 = _1860;
        _1818 = _1862;
        _1822 = _1864;
    }
    float _1866 = _1828;
    float _1868 = _1818;
    float _1870 = _1822;
    float _1872 = -_814;
    float _1874 = _1872 + _1866;
    float _1876 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1878 = -_828;
    float _1880 = _1878 + _1868;
    float _1882 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1884 = _1874 * _1874;
    float _1886 = -_830;
    float _1888 = _1886 + _1870;
    float _1890 = 1.0 / _1876;
    float _1892 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1882);
    float _1894 = fma(_1880, _1880, _1884);
    float _1896 = -_1566;
    float _1898 = _1896 + _1870;
    float _1900 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1892);
    float _1902 = fma(_1888, _1888, _1894);
    float _1904 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1906 = sqrt(_1902);
    float _1908 = _1904 + _1876;
    float _1910 = _1908 * _1890;
    float _1912 = _1910 * 0.5;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1916 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1914);
    bool _1918 = _1906 > 0.0;
    float _1920 = 1.0 / _1916;
    bool _1922 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.5);
    bool _1930 = _1926 || _1928;
    float _1932 = -_1560;
    float _1934 = _1932 + _1866;
    bool _1936 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(0.5);
    bool _1944 = _1940 || _1942;
    float _1946 = -_1564;
    float _1948 = _1946 + _1868;
    float _1950 = _1870;
    float _1952 = _1890;
    float _1954 = _1874;
    float _1956 = _1948;
    float _1958 = _1934;
    if (!_1918)
    {
        _1950 = _1948;
    }
    float _1960 = _1950;
    float _1962 = _1960;
    if (!_1918)
    {
        _1808 = _1934;
    }
    float _1964 = _1808;
    float _1966 = _1964;
    if (!_1918)
    {
        _1810 = _1898;
    }
    float _1968 = _1810;
    bool _1970 = !_1918;
    float _1972 = _1968;
    float _1974 = _1968;
    float _1976 = _1920;
    if (!_1970)
    {
        float _1978 = _246 * _246;
        float _1980 = fma(_330, _330, _1978);
        float _1982 = rsqrt(_1902);
        float _1984 = fma(_332, _332, _1980);
        float _1986 = sqrt(_1984);
        float _1988 = _1880 * _1982;
        float _1990 = _1874 * _1982;
        float _1992 = _1888 * _1982;
        bool _1994 = _1986 > 0.0;
        float _1996 = _1982;
        float _1998 = _1986;
        _1952 = _1990;
        if (!_1994)
        {
            _1996 = _1948;
        }
        float _2000 = _1996;
        _1962 = _2000;
        if (!_1994)
        {
            _1998 = _1934;
        }
        float _2002 = _1998;
        _1966 = _2002;
        if (!_1994)
        {
            _1972 = _1898;
        }
        float _2004 = _1972;
        bool _2006 = !_1994;
        _1974 = _2004;
        if (!_2006)
        {
            float _2008 = rsqrt(_1984);
            float _2010 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2012 = _246 * _2008;
            float _2014 = _330 * _2008;
            float _2016 = _1990 * _2012;
            float _2018 = _332 * _2008;
            float _2020 = fma(_1988, _2014, _2016);
            float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2024 = fma(_1992, _2018, _2020);
            float _2026 = _2024 * _2022;
            float _2028 = fma(_330, _2026, _1948);
            float _2030 = fma(_246, _2026, _1934);
            float _2032 = fma(_332, _2026, _1898);
            _1962 = _2028;
            _1966 = _2030;
            _1974 = _2032;
        }
    }
    float _2034 = _1962;
    float _2036 = _1966;
    float _2038 = _1974;
    float _2040 = _1952;
    float _2042 = _2036;
    float _2044 = _2034;
    float _2046 = _2038;
    float _2048 = _2040;
    if (_1930)
    {
        _1954 = 1.0;
    }
    float _2050 = _1954;
    float _2052 = _2050;
    if (!_1944)
    {
        float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2056 = _1752 + _2054;
        float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2060 = _1776 + _2058;
        float _2062 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2064 = _2056 * _2056;
        float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2068 = _1742 + _2066;
        float _2070 = fma(_2060, _2060, _2064);
        float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2074 = fma(_2068, _2068, _2070);
        float _2076 = sqrt(_2074);
        float _2078 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2080 = precise::min(_2076, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2082 = _2080 * _2072;
        float _2084 = -_1776;
        float _2086 = _2084 + _2034;
        float _2088 = _2078 * _2082;
        float _2090 = -_1752;
        float _2092 = _2090 + _2036;
        float _2094 = -_1742;
        float _2096 = _2094 + _2038;
        float _2098 = fma(_2086, _2088, _1776);
        float _2100 = fma(_2092, _2088, _1752);
        float _2102 = fma(_2096, _2088, _1742);
        _1956 = _2072;
        _2042 = _2100;
        _2044 = _2098;
        _2046 = _2102;
    }
    float _2104 = _1956;
    float _2106 = _2042;
    float _2108 = _2044;
    float _2110 = _2046;
    float _2112 = _2104;
    if (_1930)
    {
        _2048 = 1.0;
    }
    float _2114 = _2048;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2118 = _1920 * _2116;
    float _2120 = _2114;
    if (!_1930)
    {
        float _2122 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2124 = _2122 * 0.15915493667125701904296875;
        float _2126 = _2124 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2132 = _2130 * 0.15915493667125701904296875;
        float _2134 = _2124 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = 1.0 / _2128;
        float _2140 = _2132 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = _2136 * _2138;
        float _2146 = _2132 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2152 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2150;
        float _2154 = _2142 * _2144;
        float _2156 = 1.0 / _2152;
        float _2158 = 1.0 / _2154;
        float _2160 = _2148 * _2158;
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = fma(_2118, _2160, _2162);
        float _2166 = _2164 * _2156;
        float _2168 = precise::clamp(_2166, 0.0, 1.0);
        _2112 = _2144;
        _1976 = _2124;
        _2052 = _2168;
    }
    float _2170 = _2112;
    float _2172 = _1976;
    float _2174 = _2052;
    float _2176 = _2170;
    if (!_1930)
    {
        float _2178 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2180 = _2178 * 0.15915493667125701904296875;
        float _2182 = _2180 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        float _2186 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2188 = _2186 * 0.15915493667125701904296875;
        float _2190 = _2180 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = 1.0 / _2184;
        float _2196 = _2188 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        float _2200 = _2192 * _2194;
        float _2202 = _2188 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = _2198 * _2200;
        float _2208 = 1.0 / _2206;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2210;
        float _2214 = 1.0 / _2212;
        float _2216 = _2204 * _2208;
        float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2220 = fma(_2118, _2216, _2218);
        float _2222 = _2220 * _2214;
        float _2224 = precise::clamp(_2222, 0.0, 1.0);
        float _2226 = -_2224;
        float _2228 = _2226 + 1.0;
        _1958 = _2206;
        _2176 = _2194;
        _2120 = _2228;
    }
    float _2230 = _1958;
    float _2232 = _2176;
    float _2234 = _2120;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2106 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2242 = _2108 + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2110 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = sqrt(_2252);
    float _2258 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2260 = _2242 * _2258;
    float _2262 = _2246 * _2258;
    float _2264 = _2260 * _2260;
    float _2266 = _2262 * _2262;
    float _2268 = _2264 + _2266;
    float _2270 = sqrt(_2268);
    bool _2272 = _2270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2276 = _2270 + _2274;
    float _2278 = _2246;
    float _2280 = _2248;
    float _2282 = _2276;
    float _2284 = _2230;
    float _2286 = _2258;
    float _2288 = _2232;
    if (_2272)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2278 = _2290;
    }
    float _2292 = _2278;
    if (_2272)
    {
        float _2294 = rsqrt(_2268);
        _2280 = _2294;
    }
    float _2296 = _2280;
    float _2298 = _2296;
    if (_2272)
    {
        float _2300 = _2276 * _2292;
        _2282 = _2300;
    }
    float _2302 = _2282;
    if (_2272)
    {
        float _2304 = _2302 * 0.15915493667125701904296875;
        _2284 = _2304;
    }
    float _2306 = _2284;
    float _2308 = _2292;
    float _2310 = _2306;
    if (_2272)
    {
        float _2312 = _2306 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        _2308 = _2314;
    }
    float _2316 = _2308;
    float _2318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2320 = precise::max(0.0, _2318);
    float _2322 = _2172;
    if (_2272)
    {
        float _2324 = _2306 * 6.283185482025146484375;
        float _2326 = cos(_2324);
        _2322 = _2326;
    }
    float _2328 = _2322;
    float _2330 = -_2258;
    float _2332 = -_2320;
    float _2334 = fma(_2238, _2330, _2332);
    if (_2272)
    {
        float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2336;
    }
    float _2338 = _2286;
    float _2340 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2342 = _2316;
    float _2344 = _2338;
    if (_2272)
    {
        float _2346 = fma(_2316, _2338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2288 = _2346;
    }
    float _2348 = _2288;
    float _2350 = _2348;
    if (!_2272)
    {
        _2342 = _2260;
    }
    float _2352 = _2342;
    float _2354 = floor(_2340);
    float _2356 = _2352;
    float _2358 = _2328;
    if (_2272)
    {
        float _2360 = _2328 + (-1.0);
        _2344 = _2360;
    }
    float _2362 = _2344;
    float _2364 = _2362;
    if (_2272)
    {
        float _2366 = _2296 * _2348;
        _1812 = _2366;
    }
    float _2368 = _1812;
    if (!_2272)
    {
        _2298 = _2334;
    }
    float _2370 = _2298;
    float _2372 = _2370;
    if (_2272)
    {
        float _2374 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2374;
    }
    float _2376 = _2310;
    if (_2272)
    {
        float _2378 = _2260 * _2368;
        _2356 = _2378;
    }
    float _2380 = _2356;
    if (!_2272)
    {
        _2364 = _2262;
    }
    float _2382 = _2364;
    float _2384 = _2382;
    if (_2272)
    {
        float _2386 = _2262 * _2368;
        _2384 = _2386;
    }
    float _2388 = _2384;
    if (!_2272)
    {
        _2350 = _2264;
    }
    float _2390 = _2350;
    float _2392 = _2390;
    if (_2272)
    {
        float _2394 = fma(_2334, _2328, _2376);
        _2372 = _2394;
    }
    float _2396 = _2372;
    if (_2272)
    {
        float _2398 = _2380 * _2380;
        _2392 = _2398;
    }
    float _2400 = _2392;
    if (!_2272)
    {
        _2358 = _2266;
    }
    float _2402 = _2358;
    float _2404 = _2402;
    if (_2272)
    {
        float _2406 = _2388 * _2388;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2412 = fma(_2396, _2396, _2400);
    float _2414 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2416 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2418 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2410);
    float _2420 = _2412 + _2408;
    float _2422 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2424 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2416);
    float _2426 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2418);
    float _2428 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2422);
    float _2430 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2424);
    float _2432 = rsqrt(_2420);
    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2436 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2434);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2442 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2444 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2448 = -_2438;
    float _2450 = _2448 + 1.0;
    float _2452 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2440);
    float _2454 = _2442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2456 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2460 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2462 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2452);
    float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2456);
    float _2466 = abs(_2450);
    float _2468 = log2(_2466);
    float _2470 = -_2460;
    float _2472 = fma(_2470, _2458, 1.0);
    float _2474 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2476 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2464);
    float _2478 = _2432 * _2380;
    float _2480 = _2432 * _2388;
    float _2482 = -_2354;
    float _2484 = _2340 + _2482;
    float _2486 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2476);
    float _2488 = _2432 * _2396;
    float _2490 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2492 = floor(_2414);
    float _2494 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2496 = -_2490;
    float _2498 = fma(_2488, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2496);
    float _2500 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2494);
    float _2502 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2504 = -_2480;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2498);
    float _2508 = log2(_2472);
    float _2510 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2512 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2500);
    float _2514 = fma(_2506, -0.5, 0.5);
    float _2516 = fma(_2506, 0.5, 0.5);
    float _2518 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2510);
    float _2520 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2512);
    float _2522 = 1.0 / _2486;
    float _2524 = fma(_2516, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2526 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2518);
    float _2528 = -_2492;
    float _2530 = _2414 + _2528;
    float _2532 = _2488 + 1.0;
    float _2534 = fma(_2516, _2524, -0.212114393711090087890625);
    float _2536 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2526);
    float _2538 = exp2(_2502);
    float _2540 = _2508 * 0.693147182464599609375;
    float _2542 = fma(_2516, _2534, 1.570728778839111328125);
    float _2544 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2546 = sqrt(_2514);
    float _2548 = _2520 * _2522;
    float _2550 = fma(_2548, 0.5, 0.5);
    float _2552 = -_2488;
    float _2554 = fma(_2538, _2532, _2552);
    float _2556 = _2536 * _2522;
    float _2558 = fma(_2554, 0.5, 0.5);
    float _2560 = fma(_2556, -0.5, 0.5);
    float _2562 = _2546 * 0.636619746685028076171875;
    float2 _8675 = float2(_2484, _2530);
    float _2564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8675, float2(0.0), isnan(_8675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8675, float2(0.0), isnan(_8675)), level(0.0)).x;
    float _2566 = -_2542;
    float _2568 = fma(_2562, _2566, 1.0);
    float3 _8691 = float3(_2550, _2560, _2544);
    float _2570 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8691, float3(0.0), isnan(_8691)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8691, float3(0.0), isnan(_8691)), level(0.0)).x;
    float3 _8702 = float3(_2550, _2560, _2544);
    float4 _2573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8702, float3(0.0), isnan(_8702)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8702, float3(0.0), isnan(_8702)), level(0.0)).xyzw;
    float _2575 = _2573.x;
    float _2577 = _2573.y;
    float _2579 = _2573.z;
    float _2581 = _2573.w;
    float2 _8718 = float2(_2568, _2558);
    float3 _2585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8718, float2(0.0), isnan(_8718)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8718, float2(0.0), isnan(_8718)), level(0.0)).xyz;
    float _2587 = _2585.x;
    float _2589 = _2585.y;
    float _2591 = _2585.z;
    float _2593 = float(uint(_742));
    float _2595 = trunc(_1410);
    int _2597 = int(_2595);
    float _2599 = float(uint(_772));
    float _2601 = in.m_65.w;
    bool _2603 = _746 > 0.5;
    float _2605 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2609 = _2607 != 0;
    out.m_67.x = _1776;
    out.m_67.y = _1752;
    out.m_67.z = _1742;
    int _2611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2613 = _2611 != 0;
    float _2615 = 1.0 / _2593;
    bool _2617 = _738 > 0.5;
    out.m_69.w = _1540;
    int _2619 = abs(_952);
    float _2621 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2623 = abs(_1800);
    out.m_71.x = _1676;
    int _2625 = ~_772;
    int _2627 = _2625 + 1;
    float _2629 = 1.0 / _2599;
    float _2631 = float(uint(_2597));
    float _2633 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    float _2635 = trunc(_1444);
    int _2637 = int(_2635);
    int _2639 = as_type<int>(_2615) + (-2);
    out.m_73.w = _2601;
    float _2641 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2633);
    float _2643 = _2486;
    float _2645 = _2536;
    if (_2609)
    {
        _344 = _178;
    }
    float _2647 = _344;
    float _2649 = as_type<float>(_2639) * _2631;
    int _2651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2653 = _2651 != 0;
    float _2655 = exp2(_2605);
    int _2657 = as_type<int>(_2629) + (-2);
    float _2659 = in.m_53.w;
    int _2661 = ~_772;
    int _2663 = _2661 + 1;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2667 = _726 + _2665;
    int _2669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2671 = _2669 != 0;
    out.m_75.x = _2108;
    out.m_75.y = _2106;
    out.m_75.z = _2110;
    float _2673 = _2647;
    if (!_2609)
    {
        _2673 = _738;
    }
    float _2675 = _2673;
    float _2677 = trunc(_2649);
    float _2679 = precise::max(_2677, 0.0);
    uint _2682 = uint(_2679);
    float _2684 = float(uint(_2637));
    float _2686 = _2675;
    if (_2609)
    {
        _932 = 1.0;
    }
    float _2688 = _932;
    float _2690 = _2688;
    if (_2653)
    {
        bool _2692 = _178 > 0.5;
        _1814 = _2692;
    }
    bool _2694 = _1814;
    float _2696 = as_type<float>(_2657) * _2684;
    int _2698 = ~_742;
    int _2700 = _2698 + 1;
    float _2702 = -_2655;
    float _2704 = _2702 + 1.0;
    float _2706 = in.m_77.x;
    float _2708 = trunc(_2696);
    float _2710 = precise::max(_2708, 0.0);
    uint _2712 = uint(_2710);
    if (!_2609)
    {
        _2690 = 7.345489978790283203125;
    }
    float _2714 = _2690;
    float _2716 = float(_2637);
    int _2718 = _2700 * int(_2682);
    int _2720 = _2718 + _2597;
    float _2722 = _2714 * _178;
    bool _2724 = _2716 >= _1394;
    bool _2726 = isnan(_2716);
    bool _2728 = _2724 || _2726;
    bool _2730 = isnan(_1394);
    bool _2732 = _2728 || _2730;
    float _2734 = float(_2732);
    float _2736 = float(uint(_2720));
    int _2738 = _2663 * int(_2712);
    int _2740 = _2738 + _2637;
    float _2742 = as_type<float>(_2639) * _2736;
    float _2744 = float(uint(_2740));
    float _2746 = trunc(_2742);
    float _2748 = precise::max(_2746, 0.0);
    uint _2750 = uint(_2748);
    float _2752 = _2744;
    int _2754 = int(_2712);
    float _2756 = _2714;
    if (_2653)
    {
        float _2758 = -_2706;
        float _2760 = _2758 + 1.0;
        _934 = as_type<int>(_2760);
    }
    int _2762 = _934;
    int _2764 = _2762;
    if (!_2653)
    {
        _936 = _2706;
    }
    float _2766 = _936;
    float _2768 = as_type<float>(_2657) * _2744;
    float _2770 = _2766;
    if (_2609)
    {
        _2752 = 1.0;
    }
    float _2772 = _2752;
    float _2774 = _2772;
    if (_2653)
    {
        float _2776 = _2694 ? as_type<float>(_2762) : _2706;
        _2770 = _2776;
    }
    float _2778 = _2770;
    float _2780 = trunc(_2768);
    float _2782 = precise::max(_2780, 0.0);
    uint _2784 = uint(_2782);
    bool _2786 = _2659 > 0.5;
    if (_2671)
    {
        float _2788 = -_2706;
        float _2790 = _2788 + 1.0;
        _2764 = as_type<int>(_2790);
    }
    int _2792 = _2764;
    float _2794 = in.m_77.y;
    int _2796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2798 = _2796 != 0;
    if (!_2609)
    {
        _2774 = 1.2345600128173828125;
    }
    float _2800 = _2774;
    int _2802 = int(_2682) + int(_2750);
    float _2804 = float(_122);
    float _2806 = _2675 * _2800;
    int _2808 = ~_742;
    int _2810 = _2808 + 1;
    int _2812 = ~_772;
    int _2814 = _2812 + 1;
    float _2816 = 1.0 / _2804;
    int _2818 = int(_2712) + int(_2784);
    if (_2798)
    {
        float _2820 = -_2706;
        float _2822 = _2820 + 1.0;
        _2754 = as_type<int>(_2822);
    }
    int _2824 = _2754;
    int _2826 = _2810 * _2802;
    int _2828 = _2826 + _2597;
    if (!_2671)
    {
        _2756 = _2706;
    }
    float _2830 = _2756;
    float _2832 = _2830;
    if (!_2798)
    {
        _2686 = _2706;
    }
    float _2834 = _2686;
    int _2836 = _2814 * _2818;
    int _2838 = _2836 + _2637;
    float _2840 = floor(_2722);
    float _2842 = _2834;
    if (_2671)
    {
        float _2844 = _2603 ? as_type<float>(_2792) : _2706;
        _2832 = _2844;
    }
    float _2846 = _2832;
    if (_2798)
    {
        float _2848 = _2617 ? as_type<float>(_2824) : _2706;
        _2842 = _2848;
    }
    float _2850 = _2842;
    float _2852 = -_2794;
    float _2854 = _2852 + 1.0;
    bool _2856 = uint(_2828) >= uint(_742);
    float _2858 = float(_2597);
    float _2860 = floor(_2806);
    bool _2862 = !_2856;
    int _2864 = _2862 ? 0 : (-1);
    float _2866 = _1408 * _2816;
    int _2868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2870 = _2868 != 0;
    int _2872 = _2617 ? as_type<int>(_2854) : as_type<int>(_2794);
    int _2874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2876 = _2874 != 0;
    bool _2878 = uint(_2838) >= uint(_772);
    bool _2880 = _2858 >= _1388;
    bool _2882 = isnan(_2858);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(_1388);
    bool _2888 = _2884 || _2886;
    float _2890 = float(_2888);
    float _2892 = _2870 ? as_type<float>(_2872) : _2794;
    bool _2894 = !_2613;
    int _2896 = _2894 ? 0 : 1;
    float _2898 = -_2860;
    float _2900 = _2806 + _2898;
    bool _2902 = !_2876;
    int _2904 = _2902 ? 0 : 1;
    float _2906 = trunc(_2890);
    int _2908 = int(_2906);
    bool _2910 = !_2878;
    int _2912 = _2910 ? 0 : (-1);
    float _2914 = _1394 * _2900;
    int _2916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2918 = _2916 != 0;
    float _2920 = _1406 * _2816;
    int _2922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2924 = _2922 != 0;
    int _2926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2928 = _2926 != 0;
    int _2930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2932 = _2930 != 0;
    float _2934 = trunc(_2920);
    int _2936 = int(_2934);
    int _2938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2940 = _2938 != 0;
    float _2942 = -_2840;
    float _2944 = _2722 + _2942;
    int _2946 = ~_2802;
    int _2948 = _2946 + _2864;
    int _2950 = _2948 + 1;
    int _2952 = ~_2818;
    int _2954 = _2952 + _2912;
    int _2956 = _2954 + 1;
    float _2958 = _2944 * _1388;
    float _2960 = trunc(_2734);
    int _2962 = int(_2960);
    int _2964 = _742 * _2950;
    int _2966 = _2964 + _2597;
    int _2968 = abs(_2904);
    int _2970 = _772 * _2956;
    int _2972 = _2970 + _2637;
    float _2974 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2976 = _2974 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2978 = _2786 ? as_type<int>(_2854) : as_type<int>(_2794);
    bool _2980 = _742 == 0;
    float _2982 = trunc(_2958);
    int _2984 = int(_2982);
    int _2986 = ~_2908;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    bool _2992 = !_2980;
    int _2994 = _2992 ? _2966 : (-1);
    bool _2996 = !_2940;
    int _2998 = _2996 ? 0 : 1;
    bool _3000 = _772 == 0;
    int _3002 = _2994 * _2990;
    int _3004 = ~_2962;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    float _3010 = 1.0 / _2976;
    bool _3012 = !_3000;
    int _3014 = _3012 ? _2972 : (-1);
    int _3016 = abs(_1518);
    int _3018 = abs(_960);
    int _3020 = _2984 * _2968;
    int _3022 = _3020 + _2597;
    int _3024 = _742 + (-1);
    int _3026 = _3008 * _3014;
    int _3028 = abs(_966);
    int _3030 = _2908 * _3024;
    int _3032 = _3030 + _3002;
    int _3034 = _772 + (-1);
    float _3036 = trunc(_2914);
    int _3038 = int(_3036);
    int _3040 = abs(_2896);
    float _3042 = float(uint(_3022));
    int _3044 = _2962 * _3034;
    int _3046 = _3044 + _3026;
    int _3048 = _3032 * _2619;
    int _3050 = _3046 * _3016;
    int _3052 = abs(_2998);
    float _3054 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3056 = _3054 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3058 = trunc(_2866);
    int _3060 = int(_3058);
    int _3062 = abs(_1588);
    int _3064 = _2936 * _3018;
    int _3066 = _3064 + _3048;
    float _3068 = as_type<float>(_2639) * _3042;
    int _3070 = _3038 * _3052;
    int _3072 = _3070 + _2637;
    int _3074 = abs(_1796);
    int _3076 = _3022 * _3028;
    int _3078 = _3076 + _3066;
    float _3080 = 1.0 / _3056;
    float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3088 = _3086 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3090 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3092 = _726 + _3090;
    int _3094 = _2984 * _3040;
    int _3096 = _3094 + _3078;
    float _3098 = _3084 * _3010;
    int _3100 = _3060 * _3062;
    int _3102 = _3100 + _3050;
    float _3104 = in.m_79.x;
    float _3106 = in.m_79.y;
    float _3108 = in.m_79.z;
    float _3110 = in.m_79.w;
    bool _3112 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3114 = isnan(_726);
    bool _3116 = _3112 || _3114;
    bool _3118 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3120 = _3116 || _3118;
    float _3122 = float(_3120);
    float _3124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3126 = _3072 * _3074;
    int _3128 = _3126 + _3102;
    float _3130 = in.m_81.x;
    float _3132 = in.m_81.y;
    float _3134 = in.m_81.z;
    float _3136 = _3088 * _3080;
    float _3138 = fma(_3098, _3092, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3140 = float(uint(_3096));
    float _3142 = fma(_3136, _2667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3144 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3146 = isnan(_726);
    bool _3148 = _3144 || _3146;
    bool _3150 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3152 = _3148 || _3150;
    float _3154 = float(_3152);
    int _3156 = _3038 * _2623;
    int _3158 = _3156 + _3128;
    bool _3160 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3162 = isnan(_726);
    bool _3164 = _3160 || _3162;
    bool _3166 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3168 = _3164 || _3166;
    float _3170 = float(_3168);
    float _3172 = as_type<float>(_2639) * _3140;
    float _3174 = -_3154;
    float _3176 = _3174 + 1.0;
    float _3178 = float(uint(_3158));
    float _3180 = -_3170;
    float _3182 = _3180 + 1.0;
    float _3184 = trunc(_3172);
    float _3186 = precise::max(_3184, 0.0);
    uint _3188 = uint(_3186);
    float _3190 = _3170 * _3176;
    float _3192 = as_type<float>(_2657) * _3178;
    int _3194 = ~_742;
    int _3196 = _3194 + 1;
    float _3198 = _2924 ? as_type<float>(_2978) : _2794;
    float _3200 = _3122 * _3182;
    float _3202 = _3130 * _3108;
    float _3204 = trunc(_3192);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    bool _3210 = _1602 != 0.0;
    bool _3212 = isnan(_1602);
    bool _3214 = _3210 || _3212;
    bool _3216 = isnan(0.0);
    bool _3218 = _3214 || _3216;
    float _3220 = _3132 * _3104;
    float _3222 = -_3202;
    float _3224 = fma(_3134, _3104, _3222);
    float _3226 = _3134 * _3106;
    bool _3228 = _1600 == 0.0;
    bool _3230 = !_3218;
    bool _3232 = _3228 && _3230;
    float _3234 = -_3220;
    float _3236 = fma(_3106, _3130, _3234);
    float _3238 = _3224 * _3110;
    int _3240 = _3196 * int(_3188);
    int _3242 = _3240 + _3096;
    bool _3244 = _1604 == 0.0;
    bool _3246 = _3244 && _3232;
    float _3248 = -_3226;
    float _3250 = fma(_3108, _3132, _3248);
    float _3252 = _3138 * _3200;
    float _3254 = float(uint(_3072));
    float _3256 = trunc(_3068);
    float _3258 = precise::max(_3256, 0.0);
    uint _3260 = uint(_3258);
    float _3262 = float(uint(_3242));
    float _3264 = -_3122;
    float _3266 = _3264 + 1.0;
    int _3268 = _2627 * int(_3208);
    int _3270 = _3268 + _3158;
    float _3272 = as_type<float>(_2657) * _3254;
    float _3274 = _2794;
    float _3276 = _3136;
    float _3278 = _3138;
    float _3280 = _3134;
    if (_2928)
    {
        float _3282 = _2603 ? _2854 : _2794;
        _3274 = _3282;
    }
    float _3284 = _3274;
    float _3286 = as_type<float>(_2639) * _3262;
    int _3288 = ~_772;
    int _3290 = _3288 + 1;
    float _3292 = fma(_3266, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3252);
    float _3294 = float(uint(_3270));
    float _3296 = trunc(_3286);
    float _3298 = precise::max(_3296, 0.0);
    uint _3300 = uint(_3298);
    if (_3246)
    {
        _3276 = _3130;
    }
    float _3302 = _3276;
    float _3304 = _3302;
    if (!_3246)
    {
        float _3306 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3130);
        _3304 = _3306;
    }
    float _3308 = _3304;
    if (_3246)
    {
        _3278 = _3132;
    }
    float _3310 = _3278;
    float _3312 = as_type<float>(_2657) * _3294;
    float _3314 = _3310;
    if (!_3246)
    {
        float _3316 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3132);
        _3314 = _3316;
    }
    float _3318 = _3314;
    int _3320 = ~_742;
    int _3322 = _3320 + 1;
    float _3324 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3326 = trunc(_3272);
    float _3328 = precise::max(_3326, 0.0);
    uint _3330 = uint(_3328);
    int _3332 = ~_742;
    int _3334 = _3332 + 1;
    float _3336 = fma(_3142, _3190, _3292);
    float _3338 = fma(_3324, _2850, -0.5);
    if (!_3246)
    {
        float _3340 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3134);
        _3280 = _3340;
    }
    float _3342 = _3280;
    float _3344 = fma(_3154, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3336);
    float _3346 = fma(_1434, _3338, _1230);
    float _3348 = trunc(_3312);
    float _3350 = precise::max(_3348, 0.0);
    uint _3352 = uint(_3350);
    int _3354 = int(_3188) + int(_3300);
    int _3356 = _3334 * int(_3260);
    int _3358 = _3356 + _3022;
    int _3360 = ~_772;
    int _3362 = _3360 + 1;
    float _3364 = _3344 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3366 = _3346 + 0.5;
    int _3368 = _3322 * _3354;
    int _3370 = _3368 + _3096;
    float _3372 = float(uint(_3358));
    int _3374 = _3290 * int(_3330);
    int _3376 = _3374 + _3072;
    float _3378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3380 = _3250 * _3110;
    bool _3382 = uint(_3370) >= uint(_742);
    float _3384 = _3236 * _3110;
    float _3386 = float(uint(_3376));
    float _3388 = as_type<float>(_2639) * _3372;
    bool _3390 = !_3382;
    int _3392 = _3390 ? 0 : (-1);
    float _3394 = -_2564;
    float _3396 = _3394 + 1.0;
    int _3398 = int(_3208) + int(_3352);
    float _3400 = as_type<float>(_2657) * _3386;
    int _3402 = ~_3354;
    int _3404 = _3402 + _3392;
    int _3406 = _3404 + 1;
    float _3408 = trunc(_3388);
    float _3410 = precise::max(_3408, 0.0);
    uint _3412 = uint(_3410);
    int _3414 = _3362 * _3398;
    int _3416 = _3414 + _3158;
    int _3418 = _742 * _3406;
    int _3420 = _3418 + _3096;
    float _3422 = _3378 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3424 = uint(_3416) >= uint(_772);
    float _3426 = abs(_2118);
    float _3428 = log2(_3426);
    float _3430 = fma(_3422, _3284, -0.5);
    bool _3432 = !_3424;
    int _3434 = _3432 ? 0 : (-1);
    bool _3436 = !_2980;
    int _3438 = _3436 ? _3420 : (-1);
    float _3440 = -_1450;
    float _3442 = fma(_1426, _3430, _3440);
    int _3444 = ~_3398;
    int _3446 = _3444 + _3434;
    int _3448 = _3446 + 1;
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3452 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3456 = _3438 & 3;
    bool _3458 = _3456 != 0;
    int _3460 = _772 * _3448;
    int _3462 = _3460 + _3158;
    int _3464 = _3438 & 3;
    bool _3466 = _3464 != 0;
    float _3468 = trunc(_3400);
    float _3470 = precise::max(_3468, 0.0);
    uint _3472 = uint(_3470);
    int _3474 = _3458 ? 0 : 1;
    float _3476 = _3450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3478 = uint(_3464) > 1u;
    float _3480 = _3452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3482 = !_3000;
    int _3484 = _3482 ? _3462 : (-1);
    float _3486 = _3454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3488 = ~_3474;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    float _3494 = _3428 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3496 = int(_3260) + int(_3412);
    out.m_83.x = _3476;
    out.m_83.y = _3480;
    out.m_83.z = _3486;
    out.m_83.w = _3364;
    int _3498 = _3438 >> 31;
    float _3500 = exp2(_3494);
    bool _3502 = _2118 <= 8000.0;
    bool _3504 = isnan(_2118);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan(8000.0);
    bool _3510 = _3506 || _3508;
    float _3512 = float(_3510);
    int _3514 = _3492;
    if (!_3478)
    {
        int _3516 = ~_3474;
        int _3518 = _3516 + 1;
        _3514 = _3518;
    }
    int _3520 = _3514;
    float _3522 = _3442 + 0.5;
    int _3524 = _3484 & 3;
    bool _3526 = _3524 != 0;
    int _3528 = int(_3330) + int(_3472);
    int _3530 = _3526 ? 0 : 1;
    out.m_85.x = _3366;
    out.m_85.y = _3522;
    bool _3532 = uint(_3524) > 1u;
    float _3534 = _1706 * _922;
    int _3536 = ~_742;
    int _3538 = _3536 + 1;
    float _3540 = _1706 * _1002;
    int _3542 = _3484 >> 31;
    float _3544 = _1706 * _924;
    int _3546 = _3498 & 3;
    int _3548 = _3538 * _3496;
    int _3550 = _3548 + _3022;
    int _3552 = ~_772;
    int _3554 = _3552 + 1;
    float _3556 = _1652 * _1002;
    int _3558 = _3542 & 3;
    float _3560 = _1714 * _1002;
    int _3562 = ~_3530;
    int _3564 = _3562 + 1;
    int _3566 = _3564 + 1;
    int _3568 = _3554 * _3528;
    int _3570 = _3568 + _3072;
    int _3572 = _3438 + _3546;
    float _3574 = _1652 * _922;
    int _3576 = _3566;
    if (!_3532)
    {
        int _3578 = ~_3530;
        int _3580 = _3578 + 1;
        _3576 = _3580;
    }
    int _3582 = _3576;
    float _3584 = _1652 * _924;
    bool _3586 = uint(_3550) >= uint(_742);
    float _3588 = _1714 * _922;
    int _3590 = _3484 + _3558;
    float _3592 = _1714 * _924;
    int _3594 = _3572 >> 2;
    bool _3596 = !_3586;
    int _3598 = _3596 ? 0 : (-1);
    int _3600 = _3590 >> 2;
    bool _3602 = uint(_3570) >= uint(_772);
    int _3604 = _3594 << 4;
    int _3606 = _3604 + 368;
    int _3608 = _3600 << 4;
    int _3610 = _3608 + 512;
    uint _3612 = uint(int(uint(_3606) >> uint(2)));
    uint _3614 = uint(int(uint(int(_3612)) >> uint(2)));
    int _3616 = int(_3612) & 3;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[int(_3614)][_3616];
    int _3620 = int(_3612) + 1;
    uint _3622 = uint(int(uint(_3620) >> uint(2)));
    int _3624 = _3620 & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = ~_3496;
    int _3630 = _3628 + _3598;
    int _3632 = _3630 + 1;
    float _3634 = fma(_3500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3636 = precise::clamp(_3634, 0.0, 1.0);
    bool _3638 = !_3602;
    int _3640 = _3638 ? 0 : (-1);
    int _3642 = _742 * _3632;
    int _3644 = _3642 + _3022;
    bool _3646 = uint(_3464) >= 2u;
    uint _3648 = uint(int(uint(_3610) >> uint(2)));
    uint _3650 = uint(int(uint(int(_3648)) >> uint(2)));
    int _3652 = int(_3648) & 3;
    float _3654 = (*spvDescriptorSet0.vp_c9)._m0[int(_3650)][_3652];
    int _3656 = int(_3648) + 1;
    uint _3658 = uint(int(uint(_3656) >> uint(2)));
    int _3660 = _3656 & 3;
    float _3662 = (*spvDescriptorSet0.vp_c9)._m0[int(_3658)][_3660];
    float _3664 = fma(_3636, -2.0, 3.0);
    float _3666 = _3636 * _3636;
    int _3668 = _3646 ? 0 : 1;
    bool _3670 = _3464 != 3;
    float _3672 = _3666 * _3664;
    int _3674 = ~_3528;
    int _3676 = _3674 + _3640;
    int _3678 = _3676 + 1;
    int _3680 = _3610 + 8;
    uint _3682 = uint(int(uint(_3680) >> uint(2)));
    uint _3684 = uint(int(uint(int(_3682)) >> uint(2)));
    int _3686 = int(_3682) & 3;
    float _3688 = (*spvDescriptorSet0.vp_c9)._m0[int(_3684)][_3686];
    int _3690 = int(_3682) + 1;
    uint _3692 = uint(int(uint(_3690) >> uint(2)));
    int _3694 = _3690 & 3;
    float _3696 = (*spvDescriptorSet0.vp_c9)._m0[int(_3692)][_3694];
    int _3698 = ~_3668;
    int _3700 = _3698 + 1;
    int _3702 = _3700 + 1;
    float _3704 = -_3672;
    float _3706 = _3704 + 1.0;
    int _3708 = abs(_3520);
    int _3710 = _772 * _3678;
    int _3712 = _3710 + _3072;
    int _3714 = abs(_3582);
    float _3716 = fma(_3706, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3672);
    int _3718 = ~_3708;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3606 + 8;
    uint _3726 = uint(int(uint(_3724) >> uint(2)));
    uint _3728 = uint(int(uint(int(_3726)) >> uint(2)));
    int _3730 = int(_3726) & 3;
    float _3732 = (*spvDescriptorSet0.vp_c9)._m0[int(_3728)][_3730];
    int _3734 = int(_3726) + 1;
    uint _3736 = uint(int(uint(_3734) >> uint(2)));
    int _3738 = _3734 & 3;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[int(_3736)][_3738];
    int _3742 = ~_3714;
    int _3744 = _3742 + 1;
    int _3746 = _3744 + 1;
    int _3748 = _3702;
    if (_3670)
    {
        int _3750 = ~_3668;
        int _3752 = _3750 + 1;
        _3748 = _3752;
    }
    int _3754 = _3748;
    float _3756 = _3512 * _3716;
    int _3758 = _3484 & 3;
    bool _3760 = _3758 != 0;
    bool _3762 = !_3466;
    int _3764 = _3762 ? 0 : 1;
    float _3766 = _3756 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3768 = !_3760;
    int _3770 = _3768 ? 0 : 1;
    bool _3772 = _3524 != 3;
    float _3774 = _3396 * _3766;
    float _3776 = precise::clamp(_3774, 0.0, 1.0);
    bool _3778 = uint(_3524) >= 2u;
    int _3780 = abs(_3764);
    int _3782 = abs(_3770);
    int _3784 = _3778 ? 0 : 1;
    int _3786 = _3722 * as_type<int>(_3626);
    int _3788 = ~_3784;
    int _3790 = _3788 + 1;
    int _3792 = _3790 + 1;
    int _3794 = ~_3780;
    int _3796 = _3794 + 1;
    int _3798 = _3796 + 1;
    int _3800 = ~_3782;
    int _3802 = _3800 + 1;
    int _3804 = _3802 + 1;
    float _3806 = _1700 * _1610;
    int _3808 = _3792;
    if (_3772)
    {
        int _3810 = ~_3784;
        int _3812 = _3810 + 1;
        _3808 = _3812;
    }
    int _3814 = _3808;
    int _3816 = _3746 * as_type<int>(_3662);
    bool _3818 = _3464 != 3;
    float _3820 = _1700 * _1612;
    bool _3822 = _3524 != 3;
    int _3824 = _3798 * as_type<int>(_3618);
    int _3826 = _3824 + _3786;
    int _3828 = abs(_3814);
    int _3830 = _3804 * as_type<int>(_3654);
    int _3832 = _3830 + _3816;
    float _3834 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3836 = int(_3834);
    bool _3838 = !_3818;
    int _3840 = _3838 ? 0 : (-1);
    float _3842 = fma(_1658, _1722, _3806);
    bool _3844 = !_3822;
    int _3846 = _3844 ? 0 : (-1);
    int _3848 = ~_3828;
    int _3850 = _3848 + 1;
    int _3852 = _3850 + 1;
    float _3854 = _3592 + _3842;
    int _3856 = abs(_3754);
    int _3858 = abs(_3846);
    int _3860 = _3852 * as_type<int>(_3688);
    int _3862 = _3860 + _3832;
    int _3864 = abs(_3840);
    float _3866 = _1700 * _1614;
    float _3868 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3870 = int(_3868);
    bool _3872 = !_2918;
    int _3874 = _3872 ? 0 : 1;
    int _3876 = ~_3856;
    int _3878 = _3876 + 1;
    int _3880 = _3878 + 1;
    int _3882 = ~_3858;
    int _3884 = _3882 + 1;
    int _3886 = _3884 + 1;
    float _3888 = _1656 * _1614;
    int _3890 = abs(_3874);
    int _3892 = _3880 * as_type<int>(_3732);
    int _3894 = _3892 + _3826;
    bool _3896 = !_2932;
    int _3898 = _3896 ? 0 : 1;
    int _3900 = _3886 * as_type<int>(_3696);
    int _3902 = _3900 + _3862;
    int _3904 = ~_3864;
    int _3906 = _3904 + 1;
    int _3908 = _3906 + 1;
    float _3910 = float(uint(_3836));
    int _3912 = _3908 * as_type<int>(_3740);
    int _3914 = _3912 + _3894;
    int _3916 = abs(_3898);
    int _3918 = ~_3890;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    float _3924 = 1.0 / _3910;
    int _3926 = abs(_3836);
    int _3928 = ~_3916;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    int _3934 = _3914 * _3922;
    float _3936 = float(uint(_3870));
    bool _3938 = !_2980;
    int _3940 = _3938 ? _3644 : (-1);
    int _3942 = _3932 * _3902;
    int _3944 = abs(_3870);
    float _3946 = 1.0 / _3936;
    float _3948 = float(uint(_3926));
    int _3950 = _3940 * _3890;
    int _3952 = _3950 + _3934;
    bool _3954 = !_3000;
    int _3956 = _3954 ? _3712 : (-1);
    float _3958 = _1688 * _1612;
    float _3960 = _1656 * _1610;
    float _3962 = _1656 * _1612;
    bool _3964 = _3870 == 0;
    float _3966 = 1.0 / _3948;
    float _3968 = _1688 * _1614;
    float _3970 = _1688 * _1610;
    float _3972 = float(uint(_3944));
    int _3974 = _3956 * _3916;
    int _3976 = _3974 + _3942;
    float _3978 = float(uint(_3952));
    float _3980 = -_1664;
    float _3982 = fma(_3980, _1728, _3962);
    int _3984 = abs(_3952);
    float _3986 = 1.0 / _3972;
    int _3988 = as_type<int>(_3924) + (-2);
    float _3990 = fma(_1654, _1728, _3958);
    int _3992 = as_type<int>(_3946) + (-2);
    float _3994 = fma(_1654, _1734, _3968);
    float _3996 = float(uint(_3976));
    float _3998 = as_type<float>(_3988) * _3978;
    int _4000 = abs(_3976);
    float _4002 = fma(_1654, _1722, _3970);
    int _4004 = as_type<int>(_3966) + (-2);
    float _4006 = as_type<float>(_3992) * _3996;
    float _4008 = float(uint(_3984));
    float _4010 = trunc(_3998);
    float _4012 = precise::max(_4010, 0.0);
    uint _4014 = uint(_4012);
    float _4016 = float(uint(_4000));
    float _4018 = _3534 + _3990;
    float _4020 = -_1664;
    float _4022 = fma(_4020, _1734, _3888);
    int _4024 = as_type<int>(_3986) + (-2);
    float _4026 = as_type<float>(_4004) * _4008;
    int _4028 = ~_3836;
    int _4030 = _4028 + 1;
    float _4032 = -_1664;
    float _4034 = fma(_4032, _1722, _3960);
    float _4036 = trunc(_4006);
    float _4038 = precise::max(_4036, 0.0);
    uint _4040 = uint(_4038);
    float _4042 = as_type<float>(_4024) * _4016;
    int _4044 = ~_3870;
    int _4046 = _4044 + 1;
    float _4048 = fma(_1658, _1728, _3820);
    float _4050 = fma(_1658, _1734, _3866);
    float _4052 = _3574 + _3982;
    int _4054 = ~_3926;
    int _4056 = _4054 + 1;
    float _4058 = _3544 + _4002;
    float _4060 = trunc(_4026);
    float _4062 = precise::max(_4060, 0.0);
    uint _4064 = uint(_4062);
    int _4066 = _4030 * int(_4014);
    int _4068 = _4066 + _3952;
    float _4070 = _3540 + _3994;
    float _4072 = _3556 + _4022;
    int _4074 = ~_3944;
    int _4076 = _4074 + 1;
    float _4078 = _3584 + _4034;
    float _4080 = float(uint(_4068));
    float _4082 = trunc(_4042);
    float _4084 = precise::max(_4082, 0.0);
    uint _4086 = uint(_4084);
    int _4088 = _4046 * int(_4040);
    int _4090 = _4088 + _3976;
    float _4092 = _3238 * _4072;
    bool _4094 = _3870 == 0;
    float _4096 = as_type<float>(_3988) * _4080;
    float _4098 = float(uint(_4090));
    int _4100 = _4056 * int(_4064);
    int _4102 = _4100 + _3984;
    float _4104 = trunc(_4096);
    float _4106 = precise::max(_4104, 0.0);
    uint _4108 = uint(_4106);
    float _4110 = _4078 * _3106;
    float _4112 = as_type<float>(_3992) * _4098;
    float _4114 = _3588 + _4048;
    float _4116 = float(uint(_4102));
    float _4118 = _4078 * _3318;
    float _4120 = _3560 + _4050;
    int _4122 = _4076 * int(_4086);
    int _4124 = _4122 + _4000;
    float _4126 = trunc(_4112);
    float _4128 = precise::max(_4126, 0.0);
    uint _4130 = uint(_4128);
    float _4132 = as_type<float>(_4004) * _4116;
    float _4134 = _4052 * _3318;
    float _4136 = _4072 * _3318;
    float _4138 = float(uint(_4124));
    float _4140 = _4052 * _3106;
    float _4142 = fma(_4018, _3308, _4134);
    float _4144 = _3238 * _4052;
    float _4146 = trunc(_4132);
    float _4148 = precise::max(_4146, 0.0);
    uint _4150 = uint(_4148);
    float _4152 = as_type<float>(_4024) * _4138;
    float _4154 = _4072 * _3106;
    float _4156 = fma(_4070, _3308, _4136);
    float _4158 = fma(_4058, _3308, _4118);
    float _4160 = fma(_3380, _4070, _4092);
    float _4162 = fma(_4070, _3104, _4154);
    float _4164 = _3238 * _4078;
    float _4166 = trunc(_4152);
    float _4168 = precise::max(_4166, 0.0);
    uint _4170 = uint(_4168);
    int _4172 = int(_4040) + int(_4130);
    float _4174 = fma(_4018, _3104, _4140);
    int _4176 = ~_3870;
    int _4178 = _4176 + 1;
    float _4180 = fma(_4058, _3104, _4110);
    int _4182 = ~_3926;
    int _4184 = _4182 + 1;
    float _4186 = fma(_3380, _4018, _4144);
    int _4188 = int(_4014) + int(_4108);
    float _4190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4192 = int(_4064) + int(_4150);
    float _4194 = fma(_3380, _4058, _4164);
    int _4196 = ~_3836;
    int _4198 = _4196 + 1;
    float _4200 = fma(_4114, _3342, _4142);
    int _4202 = ~_3944;
    int _4204 = _4202 + 1;
    int _4206 = _4184 * _4192;
    int _4208 = _4206 + _3984;
    int _4210 = int(_4086) + int(_4170);
    int _4212 = _4198 * _4188;
    int _4214 = _4212 + _3952;
    float _4216 = fma(_4114, _3108, _4174);
    bool _4218 = uint(_4208) >= uint(_3926);
    float _4220 = fma(_4120, _3108, _4162);
    bool _4222 = uint(_4214) >= uint(_3836);
    int _4224 = _4178 * _4172;
    int _4226 = _4224 + _3976;
    float _4228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _4230 = fma(_3854, _3108, _4180);
    bool _4232 = uint(_4226) >= uint(_3870);
    int _4234 = _4204 * _4210;
    int _4236 = _4234 + _4000;
    bool _4238 = !_4222;
    int _4240 = _4238 ? 0 : (-1);
    out.m_87.x = _4216;
    out.m_87.y = _4220;
    out.m_87.z = _4230;
    bool _4242 = !_4232;
    int _4244 = _4242 ? 0 : (-1);
    int _4246 = ~_4188;
    int _4248 = _4246 + _4240;
    int _4250 = _4248 + 1;
    int _4252 = ~_4172;
    int _4254 = _4252 + _4244;
    int _4256 = _4254 + 1;
    bool _4258 = uint(_4236) >= uint(_3944);
    bool _4260 = _3836 == 0;
    bool _4262 = _3836 == 0;
    int _4264 = _3952 ^ _3836;
    int _4266 = _3836 * _4250;
    int _4268 = _4266 + _3952;
    int _4270 = _3976 ^ _3870;
    int _4272 = _3870 * _4256;
    int _4274 = _4272 + _3976;
    bool _4276 = !_4218;
    int _4278 = _4276 ? 0 : (-1);
    float _4280 = _4190 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4282 = !_4258;
    int _4284 = _4282 ? 0 : (-1);
    float _4286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4288 = uint(int(uint(_4264) >> uint(31)));
    float _4290 = fma(_4280, _2778, -0.5);
    uint _4292 = uint(int(uint(_4270) >> uint(31)));
    float _4294 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4296 = !_4260;
    int _4298 = _4296 ? _4268 : (-1);
    int _4300 = ~_4278;
    int _4302 = _4192 + _4300;
    int _4304 = _4302 + 1;
    float _4306 = fma(_4294, _2846, -0.5);
    int _4308 = ~_4284;
    int _4310 = _4210 + _4308;
    int _4312 = _4310 + 1;
    float _4314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4316 = ~int(_4288);
    int _4318 = _4316 + 1;
    int _4320 = ~int(_4292);
    int _4322 = _4320 + 1;
    bool _4324 = !_3964;
    int _4326 = _4324 ? _4274 : (-1);
    float _4328 = float(_4298);
    int _4330 = _4304 ^ _4318;
    int _4332 = _4312 ^ _4322;
    float _4334 = float(_4326);
    float _4336 = fma(_4280, _4328, _768);
    int _4338 = ~_4318;
    int _4340 = _4338 + _4330;
    int _4342 = _4340 + 1;
    int _4344 = ~_4322;
    int _4346 = _4344 + _4332;
    int _4348 = _4346 + 1;
    float _4350 = fma(_1416, _4290, _4336);
    bool _4352 = !_4262;
    int _4354 = _4352 ? _4342 : (-1);
    float _4356 = _4286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _4358 = !_4094;
    int _4360 = _4358 ? _4348 : (-1);
    float _4362 = _4314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4364 = float(_4354);
    float _4366 = fma(_4294, _4334, _1430);
    float _4368 = float(_4360);
    float _4370 = fma(_2892, _4356, -0.5);
    float _4372 = fma(_3198, _4362, -0.5);
    float _4374 = -_1092;
    float _4376 = fma(_4356, _4364, _4374);
    float _4378 = _2520 + _2486;
    float _4380 = -_1448;
    float _4382 = fma(_4362, _4368, _4380);
    float _4384 = fma(_3384, _3854, _4194);
    float _4386 = fma(_1412, _4370, _4376);
    float _4388 = fma(_3384, _4114, _4186);
    float _4390 = fma(_1442, _4372, _4382);
    float _4392 = fma(_3384, _4120, _4160);
    float _4394 = _4378 * 0.5;
    float _4396 = in.m_89.x;
    float _4398 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4400 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2641);
    float _4402 = fma(_1404, _4306, _4366);
    float _4404 = fma(_4120, _3342, _4156);
    float _4406 = _4398 * _2570;
    float _4408 = -_3776;
    float _4410 = fma(_4408, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4412 = _4402 + 0.5;
    out.gl_Position.x = _2520;
    out.gl_Position.y = _2536;
    out.gl_Position.z = _4400;
    out.gl_Position.w = _2486;
    float _4414 = _2581 * _4406;
    float _4416 = _4400 + _2486;
    float _4418 = _2486 * 0.5;
    float _4420 = _2591 * _4406;
    float _4422 = fma(_2587, _4414, _2575);
    float _4424 = _4350 + 0.5;
    float _4426 = _4386 + 0.5;
    float _4428 = _4390 + 0.5;
    float _4430 = _4416 * 0.5;
    float _4432 = fma(_2536, -0.5, _4418);
    float _4434 = fma(_3854, _3342, _4158);
    float _4436 = fma(_2589, _4414, _2577);
    float _4438 = -_4398;
    float _4440 = _4438 + 1.0;
    float _4442 = _4410 * _4396;
    float _4444 = fma(_2581, _4420, _2579);
    out.m_91.x = _4388;
    out.m_91.y = _4392;
    out.m_91.z = _4384;
    float _4446 = _2581 * _4440;
    float _4448 = _4442 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _4450 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4452 = isnan(_2256);
    bool _4454 = _4450 || _4452;
    bool _4456 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4458 = _4454 || _4456;
    out.m_93.x = _4424;
    out.m_93.y = _4426;
    out.m_93.z = _4412;
    out.m_93.w = _4428;
    float _4460 = _2174 * _2234;
    out.m_95.x = _4394;
    out.m_95.y = _4432;
    out.m_95.z = _4430;
    out.m_95.w = _2486;
    float _4462 = _4460 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _4448;
    out.m_99.x = _4422;
    out.m_99.y = _4436;
    out.m_99.z = _4444;
    out.m_99.w = _4446;
    float _4464 = _4216;
    float _4466 = _4400;
    float _4468 = _4440;
    float _4470 = _4460;
    if (!_4458)
    {
        _4464 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4472 = _4464;
    float _4474 = _4472;
    float _4476 = _4472;
    if (!_4458)
    {
        _2643 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4478 = _2643;
    out.m_101.x = _4200;
    out.m_101.y = _4404;
    out.m_101.z = _4434;
    float _4480 = _4478;
    float _4482 = _4478;
    if (!_4458)
    {
        _4466 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4484 = _4466;
    float _4486 = _4484;
    float _4488 = _4484;
    if (!_4458)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4490 = _2645;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4458)
    {
        _4468 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4496 = _4468;
    float _4498 = _4496;
    float _4500 = _4496;
    if (!_4458)
    {
        _4470 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4502 = _4470;
    bool _4504 = !_4458;
    float _4506 = _4502;
    float _4508 = _4502;
    if (!_4504)
    {
        bool _4510 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4512 = isnan(_2256);
        bool _4514 = _4510 || _4512;
        bool _4516 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4518 = _4514 || _4516;
        if (!_4518)
        {
            float _4520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4522 = _2256 + _4520;
            float _4524 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4526 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4524;
            float _4528 = 1.0 / _4526;
            float _4530 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4532 = _4530 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4536 = _4534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4538 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4540 = _4538 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4542 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4544 = _4542 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4546 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4548 = _4546 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4550 = _4522 * _4528;
            float _4552 = precise::clamp(_4550, 0.0, 1.0);
            float _4554 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4556 = _4554 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4558 = fma(_4552, _4532, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4560 = fma(_4552, _4556, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4562 = fma(_4552, _4536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4564 = fma(_4552, _4540, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4566 = fma(_4552, _4544, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4568 = fma(_4552, _4548, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4482 = _4560;
            _4500 = _4566;
            _4476 = _4558;
            _4494 = _4564;
            _4488 = _4562;
            _4508 = _4568;
            _4570 = true;
        }
        else
        {
            bool _4572 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4574 = isnan(_2256);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4580 = _4576 || _4578;
            if (!_4580)
            {
                _4474 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4582 = _4474;
            _4476 = _4582;
            if (!_4580)
            {
                _4480 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4584 = _4480;
            _4482 = _4584;
            if (!_4580)
            {
                _4486 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4586 = _4486;
            _4488 = _4586;
            if (!_4580)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4588 = _4492;
            _4494 = _4588;
            if (!_4580)
            {
                _4498 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4590 = _4498;
            _4500 = _4590;
            if (!_4580)
            {
                _4506 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4592 = _4506;
            bool _4594 = !_4580;
            _4508 = _4592;
            if (!_4594)
            {
                bool _4596 = _2256 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4598 = isnan(_2256);
                bool _4600 = _4596 || _4598;
                bool _4602 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4604 = _4600 || _4602;
                if (!_4604)
                {
                    float _4606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4608 = _2256 + _4606;
                    float _4610 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4612 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4610;
                    float _4614 = 1.0 / _4612;
                    float _4616 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4618 = _4616 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4620 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4622 = _4620 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4624 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4626 = _4624 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4628 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4630 = _4628 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4632 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4634 = _4632 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4636 = _4608 * _4614;
                    float _4638 = precise::clamp(_4636, 0.0, 1.0);
                    float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4642 = _4640 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4644 = fma(_4638, _4618, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4646 = fma(_4638, _4642, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4648 = fma(_4638, _4622, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4650 = fma(_4638, _4626, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4652 = fma(_4638, _4630, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4654 = fma(_4638, _4634, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4482 = _4646;
                    _4500 = _4652;
                    _4476 = _4644;
                    _4494 = _4650;
                    _4488 = _4648;
                    _4508 = _4654;
                    _4570 = true;
                }
                else
                {
                    _4482 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4500 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4476 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4488 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4508 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4570 = false;
    float _4656 = _4482;
    float _4658 = _4500;
    float _4660 = _4476;
    float _4662 = _4494;
    float _4664 = _4488;
    float _4666 = _4508;
    float _4668 = _4462 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4670 = fma(_4404, -0.5, 0.5);
    float _4672 = precise::clamp(_4670, 0.0, 1.0);
    float _4674 = -_4656;
    float _4676 = _4674 + _4658;
    float _4678 = -_4660;
    float _4680 = _4678 + _4662;
    out.m_49.x = _4668;
    float _4682 = fma(_4672, _4676, _4656);
    float _4684 = -_4664;
    float _4686 = _4684 + _4666;
    float _4688 = fma(_4672, _4680, _4660);
    float _4690 = _4682 * 0.586610972881317138671875;
    bool _4692 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4694 = fma(_4672, _4686, _4664);
    out.m_103.x = 0.0;
    float _4696 = fma(_4688, 0.298911988735198974609375, _4690);
    bool _4698 = _2174 > 0.0;
    bool _4700 = isnan(_2174);
    bool _4702 = _4698 || _4700;
    bool _4704 = isnan(0.0);
    bool _4706 = _4702 || _4704;
    float _4708 = fma(_4694, 0.114477999508380889892578125, _4696);
    bool _4710 = _2234 <= 0.0;
    bool _4712 = !_4706;
    bool _4714 = _4710 || _4712;
    float _4716 = -_4708;
    float _4718 = _4688 + _4716;
    float _4720 = -_4708;
    float _4722 = _4682 + _4720;
    float _4724 = -_4708;
    float _4726 = _4694 + _4724;
    float _4728 = fma(_4718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    float _4730 = fma(_4722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    float _4732 = fma(_4726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4708);
    bool _4734 = !_4692;
    if (!_4734)
    {
        float _4736 = -_2106;
        float _4738 = _4736 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4740 = -_2108;
        float _4742 = _4740 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4744 = -_2110;
        float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4748 = _4738 * _4738;
        float _4750 = fma(_4742, _4742, _4748);
        float _4752 = fma(_4746, _4746, _4750);
        float _4754 = sqrt(_4752);
        float _4756 = rsqrt(_4752);
        float _4758 = -_4754;
        float _4760 = _4758 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4762 = _4760 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4764 = precise::clamp(_4762, 0.0, 1.0);
        float _4766 = _4742 * _4756;
        float _4768 = _4738 * _4756;
        float _4770 = abs(_4764);
        float _4772 = log2(_4770);
        float _4774 = _4746 * _4756;
        float _4776 = _4766 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4778 = _4404 * _4768;
        float _4780 = -_4768;
        float _4782 = -_4776;
        float _4784 = fma(_4780, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4782);
        float _4786 = fma(_4200, _4766, _4778);
        float _4788 = -_4774;
        float _4790 = fma(_4788, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4784);
        float _4792 = fma(_4434, _4774, _4786);
        float _4794 = precise::clamp(_4792, 0.0, 1.0);
        float _4796 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4798 = _4790 + _4796;
        float _4800 = _4772 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4802 = _4798 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4804 = precise::clamp(_4802, 0.0, 1.0);
        float _4806 = exp2(_4800);
        float _4808 = _4806 * _4804;
        float _4810 = _4794 * _4808;
        float _4812 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4814 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4816 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4812;
        out.m_103.y = _4814;
        out.m_103.z = _4816;
    }
    out.m_69.x = _4728;
    out.m_69.y = _4730;
    out.m_69.z = _4732;
    if (!_4714)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4818 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4818;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

