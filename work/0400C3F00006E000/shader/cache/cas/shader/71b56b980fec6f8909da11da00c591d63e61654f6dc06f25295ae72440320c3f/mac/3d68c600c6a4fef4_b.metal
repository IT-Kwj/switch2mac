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
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _992 = false;
    bool _470 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1598 = as_type<float>(_108);
        out.gl_Position.z = _1598;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1667 = as_type<float>(_144);
        out.gl_Position.z = _1667;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_92);
        float _292 = 1.0 / _290;
        float _294 = _126 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _332;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _368 = 1.0 / _336;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _300 * _354;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = fma(_364, _376, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = _316 * _368;
    float _394 = _386 * _370;
    float _396 = _388 * _370;
    float _398 = _390 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].x, _394);
    float _414 = fma(_402, _392, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _416 = fma(_406, _392, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _418 = fma(_410, _392, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _420 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].z, _398);
    float _424 = fma(_414, _356, _412);
    float _426 = fma(_416, _356, _420);
    float _428 = fma(_418, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].z, _428);
    float _436 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _444;
    out.m_55.y = _446;
    out.m_55.z = _448;
    out.m_55.w = _438;
    bool _450 = !_366;
    float _468;
    if (!_450)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        float _472 = float(_92);
        float _474 = 1.0 / _472;
        float _476 = _126 * _474;
        _468 = _476;
    }
    _470 = false;
    float _478 = _468;
    float _480 = in.m_53.x;
    float _482 = in.m_53.y;
    float _484 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _486 = in.m_51.x;
    float _488 = in.m_51.y;
    float _490 = in.m_51.z;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _494 = _492 != 0;
    float _496 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _500 = _498 != 0;
    float _502 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _504 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = in.m_57.y;
    float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _510 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _502);
    float _512 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _516 = in.m_59.x;
    float _518 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _520 = 0.0;
    if (_494)
    {
        float _522 = in.m_53.x;
        _520 = _522;
    }
    float _524 = _520;
    float _526 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _512);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _530 = _480 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _534 = _482 > 0.5;
    float _536 = _482 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _538 = -_514;
    float _540 = fma(_530, 2.0, _538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _542;
    float _546 = in.m_59.y;
    float _548 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _554 = 1.0 / _544;
    float _556 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _558 = _490 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _560 = in.m_59.z;
    float _562 = -_506;
    float _564 = _562 + 1.0;
    float _566 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[78].z, _528);
    float _568 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[78].w, _532);
    float _570 = 1.0 / _552;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _574 = _478 + _572;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _580 = _478 + _578;
    float _582 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = _506;
    if (_500)
    {
        float _586 = _534 ? _564 : _506;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_536, -2.0, _576);
    float _592 = _574 * _554;
    float _594 = _508 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _596 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _496);
    float _598 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _566);
    float _600 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _602 = fma(_594, _588, -0.5);
    float _604 = -_126;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[76].x, _540);
    float _608 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _568);
    float _610 = _580 * _570;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _546);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _516);
    float _616 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _618 = _524 > 0.5;
    bool _620 = _618 && _494;
    float _622 = _582 * _612;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _626 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _628 = -_600;
    float _630 = fma(_608, _602, _628);
    float _632 = _616 * _614;
    float _634 = _622 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _622 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = _626 * _624;
    out.m_61.x = _516;
    float _640 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].x, _636);
    float _644 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _646 = _526 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].z, _640);
    float _650 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[10].z, _642);
    float _652 = in.m_57.x;
    float _654 = _644 + _648;
    float _656 = _646 + _650;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _658;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _664 = _654 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _668 = _656 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _670;
    float _674 = _664 * _664;
    float _676 = _668 * _668;
    float _678 = fma(_660, _592, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _680;
    float _684 = fma(_672, _592, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _686 = _674 + _676;
    bool _688 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _690 = isnan(_478);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = fma(_682, _592, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _706 = sqrt(_686);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _712 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _714 = isnan(_478);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _728 = -_698;
    float _730 = _728 + 1.0;
    float _732 = fma(_704, _610, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _734 = fma(_710, _610, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _736 = fma(_726, _610, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _738 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _740 = isnan(_478);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _722 * _730;
    float _752 = _622 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _754 = -_722;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _760 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].x, _752);
    float _762 = _748 * _756;
    float _764 = _756;
    float _766 = _652;
    float _768 = _638;
    float _770 = _596;
    float _772 = _656;
    float _774 = _698;
    float _776 = _646;
    if (!_494)
    {
        _764 = _652;
    }
    float _778 = _764;
    float _780 = _778;
    if (_620)
    {
        float _782 = -_652;
        float _784 = _782 + 1.0;
        _766 = _784;
    }
    float _786 = _766;
    bool _788 = _706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = _678 * _762;
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[9].z, _760);
    float _798 = _596 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _684 * _762;
    float _802 = _700 * _762;
    float _804 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].x, _790);
    float _806 = _798 + _796;
    float _808 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].z, _802);
    float _812 = _800;
    float _814 = _794;
    if (_494)
    {
        _780 = _786;
    }
    float _816 = _780;
    float _818 = _758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_788)
    {
        _768 = _656;
    }
    float _820 = _768;
    float _822 = _820;
    if (!_788)
    {
        _812 = _676;
    }
    float _824 = _812;
    float _826 = _824;
    if (!_788)
    {
        _814 = _674;
    }
    float _828 = _814;
    float _830 = _828;
    if (!_788)
    {
        _770 = _654;
    }
    float _832 = _770;
    float _834 = _832;
    if (!_788)
    {
        _772 = _806;
    }
    float _836 = _772;
    bool _838 = !_788;
    float _840 = _836;
    if (!_838)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _706 + _844;
        float _848 = _806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = rsqrt(_686);
        float _852 = _846 * _842;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _850 * _864;
        float _868 = fma(_664, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = _862 + (-1.0);
        float _872 = fma(_668, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _876 = _868 + _874;
        float _878 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _882 = _872 + _880;
        float _884 = _876 * _876;
        float _886 = fma(_806, _862, _878);
        float _888 = _882 * _882;
        _840 = _886;
        _830 = _884;
        _826 = _888;
        _834 = _868;
        _822 = _872;
    }
    float _890 = _840;
    float _892 = _830;
    float _894 = _826;
    float _896 = _834;
    float _898 = _822;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _902 = _890 + _900;
    float _904 = in.m_63.w;
    float _906 = fma(_732, _750, _804);
    float _908 = fma(_734, _750, _808);
    float _910 = fma(_902, _902, _892);
    float _912 = fma(_736, _750, _810);
    float _914 = fma(_818, _816, -0.5);
    float _916 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].x, _906);
    float _918 = _910 + _894;
    float _920 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].y, _908);
    float _922 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].z, _912);
    float _924 = fma(_598, _914, _606);
    float _926 = _916 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _928 = sqrt(_918);
    float _930 = _920 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _936 = _630 + 0.5;
    float _938 = _924 + 0.5;
    float _940 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.y = _546;
    out.m_61.z = _560;
    bool _946 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _948 = isnan(_928);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _954 = _950 || _952;
    out.m_65.w = _904;
    out.m_67.x = _938;
    out.m_67.y = _936;
    out.m_69.x = _940;
    out.m_69.y = _942;
    out.m_69.z = _944;
    out.m_69.w = _934;
    float _956 = _942;
    if (!_954)
    {
        _774 = 1.0;
    }
    float _958 = _774;
    bool _960 = !_954;
    float _962 = _958;
    if (!_960)
    {
        bool _964 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _966 = isnan(_928);
        bool _968 = _964 || _966;
        bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _972 = _968 || _970;
        if (!_972)
        {
            float _974 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _976 = _928 + _974;
            float _978 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _980 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _978;
            float _982 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _984 = _982 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _986 = 1.0 / _980;
            float _988 = _976 * _986;
            float _990 = fma(_988, _984, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _962 = _990;
            _992 = true;
        }
        else
        {
            bool _994 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _996 = isnan(_928);
            bool _998 = _994 || _996;
            bool _1000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1002 = _998 || _1000;
            if (!_1002)
            {
                float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1006 = _928 + _1004;
                float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1014 = _1012 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1016 = 1.0 / _1010;
                float _1018 = _1006 * _1016;
                float _1020 = fma(_1018, _1014, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _962 = _1020;
                _992 = true;
            }
            else
            {
                _962 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _992 = false;
    float _1022 = _962;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1026 = _890 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1030 = _896 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1034 = _898 + _1032;
    float _1036 = fma(_1026, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1038 = fma(_1030, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1040 = fma(_1034, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1044 = _1036 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1052 = _1040 + _1050;
    float _1054 = _1044 * _1044;
    float _1056 = fma(_1048, _1048, _1054);
    float _1058 = fma(_1052, _1052, _1056);
    float _1060 = rsqrt(_1058);
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1064 = _1048 * _1062;
    float _1066 = _1052 * _1062;
    float _1068 = _1064 * _1064;
    float _1070 = _1066 * _1066;
    float _1072 = _1068 + _1070;
    float _1074 = sqrt(_1072);
    bool _1076 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1080 = _1074 + _1078;
    float _1082 = _944;
    float _1084 = _1072;
    float _1086 = _1080;
    float _1088 = _1044;
    float _1090 = _1062;
    float _1092 = _1064;
    if (_1076)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1082 = _1094;
    }
    float _1096 = _1082;
    if (_1076)
    {
        float _1098 = rsqrt(_1072);
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = _1096;
    float _1104 = _1100;
    if (_1076)
    {
        float _1106 = _1080 * _1096;
        _1086 = _1106;
    }
    float _1108 = _1086;
    if (_1076)
    {
        float _1110 = _1108 * 0.15915493667125701904296875;
        _956 = _1110;
    }
    float _1112 = _956;
    float _1114 = _1052;
    if (_1076)
    {
        float _1116 = _1112 * 6.283185482025146484375;
        float _1118 = sin(_1116);
        _1114 = _1118;
    }
    float _1120 = _1114;
    float _1122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1124 = precise::max(0.0, _1122);
    float _1126 = _936;
    float _1128 = _1124;
    if (_1076)
    {
        float _1130 = _1112 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = -_1062;
    float _1138 = -_1124;
    float _1140 = fma(_1044, _1136, _1138);
    if (_1076)
    {
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1142;
    }
    float _1144 = _1088;
    float _1146 = sqrt(_1058);
    float _1148 = _1120;
    float _1150 = _1144;
    if (_1076)
    {
        float _1152 = fma(_1120, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = _1154;
    if (!_1076)
    {
        _1150 = _1066;
    }
    float _1158 = _1150;
    float _1160 = _1158;
    if (_1076)
    {
        float _1162 = _1134 + (-1.0);
        _1128 = _1162;
    }
    float _1164 = _1128;
    float _1166 = _1164;
    if (_1076)
    {
        float _1168 = _1100 * _1154;
        _1090 = _1168;
    }
    float _1170 = _1090;
    if (!_1076)
    {
        _1156 = _1140;
    }
    float _1172 = _1156;
    float _1174 = _1172;
    if (_1076)
    {
        float _1176 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1102 = _1176;
    }
    float _1178 = _1102;
    if (_1076)
    {
        float _1180 = _1064 * _1170;
        _1092 = _1180;
    }
    float _1182 = _1092;
    if (!_1076)
    {
        _1104 = _1068;
    }
    float _1184 = _1104;
    float _1186 = _1184;
    if (_1076)
    {
        float _1188 = _1066 * _1170;
        _1160 = _1188;
    }
    float _1190 = _1160;
    if (_1076)
    {
        float _1192 = fma(_1140, _1134, _1178);
        _1174 = _1192;
    }
    float _1194 = _1174;
    if (_1076)
    {
        float _1196 = _1182 * _1182;
        _1186 = _1196;
    }
    float _1198 = _1186;
    if (!_1076)
    {
        _1166 = _1070;
    }
    float _1200 = _1166;
    float _1202 = _1200;
    if (_1076)
    {
        float _1204 = _1190 * _1190;
        _1202 = _1204;
    }
    float _1206 = _1202;
    float _1208 = fma(_1194, _1194, _1198);
    float _1210 = _1208 + _1206;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1214 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1212);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1222 = rsqrt(_1210);
    float _1224 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1218);
    float _1228 = -_1216;
    float _1230 = _1228 + 1.0;
    float _1232 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1234 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1236 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1238 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1240 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1232);
    float _1242 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1234);
    float _1244 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1236);
    float _1246 = abs(_1230);
    float _1248 = log2(_1246);
    float _1250 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1240);
    float _1252 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1254 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1244);
    float _1256 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1258 = _1222 * _1182;
    float _1260 = _1222 * _1194;
    float _1262 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1264 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1268 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1270 = _1222 * _1190;
    float _1272 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1264);
    float _1274 = -_1266;
    float _1276 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1274);
    float _1278 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1282 = -_1270;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1276);
    float _1286 = -_1278;
    float _1288 = fma(_1286, _1220, 1.0);
    float _1290 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1292 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1280);
    float _1294 = fma(_1284, -0.5, 0.5);
    float _1296 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1298 = exp2(_1290);
    float _1300 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1302 = fma(_1284, 0.5, 0.5);
    float _1304 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1296);
    float _1306 = _1260 + 1.0;
    float _1308 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1300);
    float _1310 = fma(_1302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1312 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1304);
    float _1314 = log2(_1288);
    float _1316 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1308);
    float _1318 = fma(_1302, _1310, -0.212114393711090087890625);
    float _1320 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1312);
    float _1322 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1316);
    float _1324 = fma(_1302, _1318, 1.570728778839111328125);
    float _1326 = 1.0 / _1292;
    float _1328 = -_1260;
    float _1330 = fma(_1298, _1306, _1328);
    float _1332 = fma(_1330, 0.5, 0.5);
    float _1334 = sqrt(_1294);
    float _1336 = _1314 * 0.693147182464599609375;
    float _1338 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = _1320 * _1326;
    float _1342 = _1322 * _1326;
    float _1344 = fma(_1340, 0.5, 0.5);
    float _1346 = fma(_1342, -0.5, 0.5);
    float _1348 = _1334 * 0.636619746685028076171875;
    float _1350 = -_1324;
    float _1352 = fma(_1348, _1350, 1.0);
    float3 _3704 = float3(_1344, _1346, _1338);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3704, float3(0.0), isnan(_3704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3704, float3(0.0), isnan(_3704)), level(0.0)).x;
    float3 _3715 = float3(_1344, _1346, _1338);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3715, float3(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3715, float3(0.0), isnan(_3715)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float2 _3732 = float2(_1352, _1332);
    float3 _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3732, float2(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3732, float2(0.0), isnan(_3732)), level(0.0)).xyz;
    float _1371 = _1369.x;
    float _1373 = _1369.y;
    float _1375 = _1369.z;
    float _1377 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1379 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1381 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1377);
    bool _1383 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan(0.5);
    bool _1391 = _1387 || _1389;
    float _1393 = exp2(_1379);
    float _1395 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1381);
    float _1397 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1399 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1401 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1397);
    float _1403 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1405 = 1.0 / _1399;
    float _1407 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1409 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1403);
    if (_1391)
    {
        _776 = 1.0;
    }
    float _1411 = _776;
    float _1413 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1415 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1417 = _1413 + _1399;
    float _1419 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1415);
    float _1421 = _1417 * _1405;
    float _1423 = _1421 * 0.5;
    float _1425 = _1411;
    if (!_1391)
    {
        float _1427 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1431 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1429);
        float _1433 = _1427 * 0.15915493667125701904296875;
        float _1435 = _1433 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1441 = _1439 * 0.15915493667125701904296875;
        float _1443 = _1433 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        float _1447 = 1.0 / _1437;
        float _1449 = _1441 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = _1445 * _1447;
        float _1455 = 1.0 / _1431;
        float _1457 = _1451 * _1453;
        float _1459 = _1441 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1465 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1463;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1469 = _1455 * _1467;
        float _1471 = 1.0 / _1457;
        float _1473 = 1.0 / _1465;
        float _1475 = _1461 * _1471;
        float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1479 = fma(_1475, _1469, _1477);
        float _1481 = _1479 * _1473;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        float _1485 = -_1483;
        float _1487 = _1485 + 1.0;
        _1425 = _1487;
    }
    float _1489 = _1425;
    float _1491 = _1292 * 0.5;
    float _1493 = -_1393;
    float _1495 = _1493 + 1.0;
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1499 = _1489 > 0.0;
    bool _1501 = isnan(_1489);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan(0.0);
    bool _1507 = _1503 || _1505;
    float _1509 = fma(_1322, -0.5, _1491);
    float _1511 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1513 = _1497 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1515 = _1419 + _1292;
    float _1517 = _1320 + _1292;
    float _1519 = _1511 * _1354;
    float _1521 = -_1511;
    float _1523 = _1521 + 1.0;
    out.gl_Position.x = _1320;
    out.gl_Position.y = _1322;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _1292;
    float _1525 = _1365 * _1519;
    float _1527 = _1375 * _1519;
    float _1529 = _1515 * 0.5;
    float _1531 = _1517 * 0.5;
    float _1533 = fma(_1371, _1525, _1359);
    float _1535 = fma(_1373, _1525, _1361);
    float _1537 = _1365 * _1523;
    float _1539 = fma(_1365, _1527, _1363);
    out.m_71.x = _1531;
    out.m_71.y = _1509;
    out.m_71.z = _1529;
    out.m_71.w = _1292;
    out.m_47.x = _1513;
    out.m_73.x = _1533;
    out.m_73.y = _1535;
    out.m_73.z = _1539;
    out.m_73.w = _1537;
    if (_1507)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1541;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _992 = false;
    bool _470 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1598 = as_type<float>(_108);
        out.gl_Position.z = _1598;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1667 = as_type<float>(_144);
        out.gl_Position.z = _1667;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_92);
        float _292 = 1.0 / _290;
        float _294 = _126 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _332;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _368 = 1.0 / _336;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _300 * _354;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = fma(_364, _376, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = _316 * _368;
    float _394 = _386 * _370;
    float _396 = _388 * _370;
    float _398 = _390 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].x, _394);
    float _414 = fma(_402, _392, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _416 = fma(_406, _392, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _418 = fma(_410, _392, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _420 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].z, _398);
    float _424 = fma(_414, _356, _412);
    float _426 = fma(_416, _356, _420);
    float _428 = fma(_418, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].z, _428);
    float _436 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _444;
    out.m_55.y = _446;
    out.m_55.z = _448;
    out.m_55.w = _438;
    bool _450 = !_366;
    float _468;
    if (!_450)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        float _472 = float(_92);
        float _474 = 1.0 / _472;
        float _476 = _126 * _474;
        _468 = _476;
    }
    _470 = false;
    float _478 = _468;
    float _480 = in.m_53.x;
    float _482 = in.m_53.y;
    float _484 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _486 = in.m_51.x;
    float _488 = in.m_51.y;
    float _490 = in.m_51.z;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _494 = _492 != 0;
    float _496 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _500 = _498 != 0;
    float _502 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _504 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = in.m_57.y;
    float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _510 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _502);
    float _512 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _516 = in.m_59.x;
    float _518 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _520 = 0.0;
    if (_494)
    {
        float _522 = in.m_53.x;
        _520 = _522;
    }
    float _524 = _520;
    float _526 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _512);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _530 = _480 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _534 = _482 > 0.5;
    float _536 = _482 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _538 = -_514;
    float _540 = fma(_530, 2.0, _538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _542;
    float _546 = in.m_59.y;
    float _548 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _554 = 1.0 / _544;
    float _556 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _558 = _490 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _560 = in.m_59.z;
    float _562 = -_506;
    float _564 = _562 + 1.0;
    float _566 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[78].z, _528);
    float _568 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[78].w, _532);
    float _570 = 1.0 / _552;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _574 = _478 + _572;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _580 = _478 + _578;
    float _582 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = _506;
    if (_500)
    {
        float _586 = _534 ? _564 : _506;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_536, -2.0, _576);
    float _592 = _574 * _554;
    float _594 = _508 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _596 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _496);
    float _598 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _566);
    float _600 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _602 = fma(_594, _588, -0.5);
    float _604 = -_126;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[76].x, _540);
    float _608 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _568);
    float _610 = _580 * _570;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _546);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _516);
    float _616 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _618 = _524 > 0.5;
    bool _620 = _618 && _494;
    float _622 = _582 * _612;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _626 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _628 = -_600;
    float _630 = fma(_608, _602, _628);
    float _632 = _616 * _614;
    float _634 = _622 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _622 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = _626 * _624;
    out.m_61.x = _516;
    float _640 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].x, _636);
    float _644 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _646 = _526 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].z, _640);
    float _650 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[10].z, _642);
    float _652 = in.m_57.x;
    float _654 = _644 + _648;
    float _656 = _646 + _650;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _658;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _664 = _654 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _668 = _656 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _670;
    float _674 = _664 * _664;
    float _676 = _668 * _668;
    float _678 = fma(_660, _592, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _680;
    float _684 = fma(_672, _592, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _686 = _674 + _676;
    bool _688 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _690 = isnan(_478);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = fma(_682, _592, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _706 = sqrt(_686);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _712 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _714 = isnan(_478);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _728 = -_698;
    float _730 = _728 + 1.0;
    float _732 = fma(_704, _610, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _734 = fma(_710, _610, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _736 = fma(_726, _610, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _738 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _740 = isnan(_478);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _722 * _730;
    float _752 = _622 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _754 = -_722;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _760 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].x, _752);
    float _762 = _748 * _756;
    float _764 = _756;
    float _766 = _652;
    float _768 = _638;
    float _770 = _596;
    float _772 = _656;
    float _774 = _698;
    float _776 = _646;
    if (!_494)
    {
        _764 = _652;
    }
    float _778 = _764;
    float _780 = _778;
    if (_620)
    {
        float _782 = -_652;
        float _784 = _782 + 1.0;
        _766 = _784;
    }
    float _786 = _766;
    bool _788 = _706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = _678 * _762;
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[9].z, _760);
    float _798 = _596 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _684 * _762;
    float _802 = _700 * _762;
    float _804 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].x, _790);
    float _806 = _798 + _796;
    float _808 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].z, _802);
    float _812 = _800;
    float _814 = _794;
    if (_494)
    {
        _780 = _786;
    }
    float _816 = _780;
    float _818 = _758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_788)
    {
        _768 = _656;
    }
    float _820 = _768;
    float _822 = _820;
    if (!_788)
    {
        _812 = _676;
    }
    float _824 = _812;
    float _826 = _824;
    if (!_788)
    {
        _814 = _674;
    }
    float _828 = _814;
    float _830 = _828;
    if (!_788)
    {
        _770 = _654;
    }
    float _832 = _770;
    float _834 = _832;
    if (!_788)
    {
        _772 = _806;
    }
    float _836 = _772;
    bool _838 = !_788;
    float _840 = _836;
    if (!_838)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _706 + _844;
        float _848 = _806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = rsqrt(_686);
        float _852 = _846 * _842;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _850 * _864;
        float _868 = fma(_664, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = _862 + (-1.0);
        float _872 = fma(_668, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _876 = _868 + _874;
        float _878 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _882 = _872 + _880;
        float _884 = _876 * _876;
        float _886 = fma(_806, _862, _878);
        float _888 = _882 * _882;
        _840 = _886;
        _830 = _884;
        _826 = _888;
        _834 = _868;
        _822 = _872;
    }
    float _890 = _840;
    float _892 = _830;
    float _894 = _826;
    float _896 = _834;
    float _898 = _822;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _902 = _890 + _900;
    float _904 = in.m_63.w;
    float _906 = fma(_732, _750, _804);
    float _908 = fma(_734, _750, _808);
    float _910 = fma(_902, _902, _892);
    float _912 = fma(_736, _750, _810);
    float _914 = fma(_818, _816, -0.5);
    float _916 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].x, _906);
    float _918 = _910 + _894;
    float _920 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].y, _908);
    float _922 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].z, _912);
    float _924 = fma(_598, _914, _606);
    float _926 = _916 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _928 = sqrt(_918);
    float _930 = _920 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _936 = _630 + 0.5;
    float _938 = _924 + 0.5;
    float _940 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.y = _546;
    out.m_61.z = _560;
    bool _946 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _948 = isnan(_928);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _954 = _950 || _952;
    out.m_65.w = _904;
    out.m_67.x = _938;
    out.m_67.y = _936;
    out.m_69.x = _940;
    out.m_69.y = _942;
    out.m_69.z = _944;
    out.m_69.w = _934;
    float _956 = _942;
    if (!_954)
    {
        _774 = 1.0;
    }
    float _958 = _774;
    bool _960 = !_954;
    float _962 = _958;
    if (!_960)
    {
        bool _964 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _966 = isnan(_928);
        bool _968 = _964 || _966;
        bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _972 = _968 || _970;
        if (!_972)
        {
            float _974 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _976 = _928 + _974;
            float _978 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _980 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _978;
            float _982 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _984 = _982 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _986 = 1.0 / _980;
            float _988 = _976 * _986;
            float _990 = fma(_988, _984, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _962 = _990;
            _992 = true;
        }
        else
        {
            bool _994 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _996 = isnan(_928);
            bool _998 = _994 || _996;
            bool _1000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1002 = _998 || _1000;
            if (!_1002)
            {
                float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1006 = _928 + _1004;
                float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1014 = _1012 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1016 = 1.0 / _1010;
                float _1018 = _1006 * _1016;
                float _1020 = fma(_1018, _1014, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _962 = _1020;
                _992 = true;
            }
            else
            {
                _962 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _992 = false;
    float _1022 = _962;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1026 = _890 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1030 = _896 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1034 = _898 + _1032;
    float _1036 = fma(_1026, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1038 = fma(_1030, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1040 = fma(_1034, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1044 = _1036 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1052 = _1040 + _1050;
    float _1054 = _1044 * _1044;
    float _1056 = fma(_1048, _1048, _1054);
    float _1058 = fma(_1052, _1052, _1056);
    float _1060 = rsqrt(_1058);
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1064 = _1048 * _1062;
    float _1066 = _1052 * _1062;
    float _1068 = _1064 * _1064;
    float _1070 = _1066 * _1066;
    float _1072 = _1068 + _1070;
    float _1074 = sqrt(_1072);
    bool _1076 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1080 = _1074 + _1078;
    float _1082 = _944;
    float _1084 = _1072;
    float _1086 = _1080;
    float _1088 = _1044;
    float _1090 = _1062;
    float _1092 = _1064;
    if (_1076)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1082 = _1094;
    }
    float _1096 = _1082;
    if (_1076)
    {
        float _1098 = rsqrt(_1072);
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = _1096;
    float _1104 = _1100;
    if (_1076)
    {
        float _1106 = _1080 * _1096;
        _1086 = _1106;
    }
    float _1108 = _1086;
    if (_1076)
    {
        float _1110 = _1108 * 0.15915493667125701904296875;
        _956 = _1110;
    }
    float _1112 = _956;
    float _1114 = _1052;
    if (_1076)
    {
        float _1116 = _1112 * 6.283185482025146484375;
        float _1118 = sin(_1116);
        _1114 = _1118;
    }
    float _1120 = _1114;
    float _1122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1124 = precise::max(0.0, _1122);
    float _1126 = _936;
    float _1128 = _1124;
    if (_1076)
    {
        float _1130 = _1112 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = -_1062;
    float _1138 = -_1124;
    float _1140 = fma(_1044, _1136, _1138);
    if (_1076)
    {
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1142;
    }
    float _1144 = _1088;
    float _1146 = sqrt(_1058);
    float _1148 = _1120;
    float _1150 = _1144;
    if (_1076)
    {
        float _1152 = fma(_1120, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = _1154;
    if (!_1076)
    {
        _1150 = _1066;
    }
    float _1158 = _1150;
    float _1160 = _1158;
    if (_1076)
    {
        float _1162 = _1134 + (-1.0);
        _1128 = _1162;
    }
    float _1164 = _1128;
    float _1166 = _1164;
    if (_1076)
    {
        float _1168 = _1100 * _1154;
        _1090 = _1168;
    }
    float _1170 = _1090;
    if (!_1076)
    {
        _1156 = _1140;
    }
    float _1172 = _1156;
    float _1174 = _1172;
    if (_1076)
    {
        float _1176 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1102 = _1176;
    }
    float _1178 = _1102;
    if (_1076)
    {
        float _1180 = _1064 * _1170;
        _1092 = _1180;
    }
    float _1182 = _1092;
    if (!_1076)
    {
        _1104 = _1068;
    }
    float _1184 = _1104;
    float _1186 = _1184;
    if (_1076)
    {
        float _1188 = _1066 * _1170;
        _1160 = _1188;
    }
    float _1190 = _1160;
    if (_1076)
    {
        float _1192 = fma(_1140, _1134, _1178);
        _1174 = _1192;
    }
    float _1194 = _1174;
    if (_1076)
    {
        float _1196 = _1182 * _1182;
        _1186 = _1196;
    }
    float _1198 = _1186;
    if (!_1076)
    {
        _1166 = _1070;
    }
    float _1200 = _1166;
    float _1202 = _1200;
    if (_1076)
    {
        float _1204 = _1190 * _1190;
        _1202 = _1204;
    }
    float _1206 = _1202;
    float _1208 = fma(_1194, _1194, _1198);
    float _1210 = _1208 + _1206;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1214 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1212);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1222 = rsqrt(_1210);
    float _1224 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1218);
    float _1228 = -_1216;
    float _1230 = _1228 + 1.0;
    float _1232 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1234 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1236 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1238 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1240 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1232);
    float _1242 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1234);
    float _1244 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1236);
    float _1246 = abs(_1230);
    float _1248 = log2(_1246);
    float _1250 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1240);
    float _1252 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1254 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1244);
    float _1256 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1258 = _1222 * _1182;
    float _1260 = _1222 * _1194;
    float _1262 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1264 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1268 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1270 = _1222 * _1190;
    float _1272 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1264);
    float _1274 = -_1266;
    float _1276 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1274);
    float _1278 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1282 = -_1270;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1276);
    float _1286 = -_1278;
    float _1288 = fma(_1286, _1220, 1.0);
    float _1290 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1292 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1280);
    float _1294 = fma(_1284, -0.5, 0.5);
    float _1296 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1298 = exp2(_1290);
    float _1300 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1302 = fma(_1284, 0.5, 0.5);
    float _1304 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1296);
    float _1306 = _1260 + 1.0;
    float _1308 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1300);
    float _1310 = fma(_1302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1312 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1304);
    float _1314 = log2(_1288);
    float _1316 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1308);
    float _1318 = fma(_1302, _1310, -0.212114393711090087890625);
    float _1320 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1312);
    float _1322 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1316);
    float _1324 = fma(_1302, _1318, 1.570728778839111328125);
    float _1326 = 1.0 / _1292;
    float _1328 = -_1260;
    float _1330 = fma(_1298, _1306, _1328);
    float _1332 = fma(_1330, 0.5, 0.5);
    float _1334 = sqrt(_1294);
    float _1336 = _1314 * 0.693147182464599609375;
    float _1338 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = _1320 * _1326;
    float _1342 = _1322 * _1326;
    float _1344 = fma(_1340, 0.5, 0.5);
    float _1346 = fma(_1342, -0.5, 0.5);
    float _1348 = _1334 * 0.636619746685028076171875;
    float _1350 = -_1324;
    float _1352 = fma(_1348, _1350, 1.0);
    float3 _3704 = float3(_1344, _1346, _1338);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3704, float3(0.0), isnan(_3704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3704, float3(0.0), isnan(_3704)), level(0.0)).x;
    float3 _3715 = float3(_1344, _1346, _1338);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3715, float3(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3715, float3(0.0), isnan(_3715)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float2 _3732 = float2(_1352, _1332);
    float3 _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3732, float2(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3732, float2(0.0), isnan(_3732)), level(0.0)).xyz;
    float _1371 = _1369.x;
    float _1373 = _1369.y;
    float _1375 = _1369.z;
    float _1377 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1379 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1381 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1377);
    bool _1383 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan(0.5);
    bool _1391 = _1387 || _1389;
    float _1393 = exp2(_1379);
    float _1395 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1381);
    float _1397 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1399 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1401 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1397);
    float _1403 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1405 = 1.0 / _1399;
    float _1407 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1409 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1403);
    if (_1391)
    {
        _776 = 1.0;
    }
    float _1411 = _776;
    float _1413 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1415 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1417 = _1413 + _1399;
    float _1419 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1415);
    float _1421 = _1417 * _1405;
    float _1423 = _1421 * 0.5;
    float _1425 = _1411;
    if (!_1391)
    {
        float _1427 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1431 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1429);
        float _1433 = _1427 * 0.15915493667125701904296875;
        float _1435 = _1433 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1441 = _1439 * 0.15915493667125701904296875;
        float _1443 = _1433 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        float _1447 = 1.0 / _1437;
        float _1449 = _1441 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = _1445 * _1447;
        float _1455 = 1.0 / _1431;
        float _1457 = _1451 * _1453;
        float _1459 = _1441 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1465 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1463;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1469 = _1455 * _1467;
        float _1471 = 1.0 / _1457;
        float _1473 = 1.0 / _1465;
        float _1475 = _1461 * _1471;
        float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1479 = fma(_1475, _1469, _1477);
        float _1481 = _1479 * _1473;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        float _1485 = -_1483;
        float _1487 = _1485 + 1.0;
        _1425 = _1487;
    }
    float _1489 = _1425;
    float _1491 = _1292 * 0.5;
    float _1493 = -_1393;
    float _1495 = _1493 + 1.0;
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1499 = _1489 > 0.0;
    bool _1501 = isnan(_1489);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan(0.0);
    bool _1507 = _1503 || _1505;
    float _1509 = fma(_1322, -0.5, _1491);
    float _1511 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1513 = _1497 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1515 = _1419 + _1292;
    float _1517 = _1320 + _1292;
    float _1519 = _1511 * _1354;
    float _1521 = -_1511;
    float _1523 = _1521 + 1.0;
    out.gl_Position.x = _1320;
    out.gl_Position.y = _1322;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _1292;
    float _1525 = _1365 * _1519;
    float _1527 = _1375 * _1519;
    float _1529 = _1515 * 0.5;
    float _1531 = _1517 * 0.5;
    float _1533 = fma(_1371, _1525, _1359);
    float _1535 = fma(_1373, _1525, _1361);
    float _1537 = _1365 * _1523;
    float _1539 = fma(_1365, _1527, _1363);
    out.m_71.x = _1531;
    out.m_71.y = _1509;
    out.m_71.z = _1529;
    out.m_71.w = _1292;
    out.m_47.x = _1513;
    out.m_73.x = _1533;
    out.m_73.y = _1535;
    out.m_73.z = _1539;
    out.m_73.w = _1537;
    if (_1507)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1541;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _992 = false;
    bool _470 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1598 = as_type<float>(_108);
        out.gl_Position.z = _1598;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1667 = as_type<float>(_144);
        out.gl_Position.z = _1667;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_92);
        float _292 = 1.0 / _290;
        float _294 = _126 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _332;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _368 = 1.0 / _336;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _300 * _354;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = fma(_364, _376, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = _316 * _368;
    float _394 = _386 * _370;
    float _396 = _388 * _370;
    float _398 = _390 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].x, _394);
    float _414 = fma(_402, _392, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _416 = fma(_406, _392, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _418 = fma(_410, _392, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _420 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[107].z, _398);
    float _424 = fma(_414, _356, _412);
    float _426 = fma(_416, _356, _420);
    float _428 = fma(_418, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[109].z, _428);
    float _436 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _444;
    out.m_55.y = _446;
    out.m_55.z = _448;
    out.m_55.w = _438;
    bool _450 = !_366;
    float _468;
    if (!_450)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        float _472 = float(_92);
        float _474 = 1.0 / _472;
        float _476 = _126 * _474;
        _468 = _476;
    }
    _470 = false;
    float _478 = _468;
    float _480 = in.m_53.x;
    float _482 = in.m_53.y;
    float _484 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _486 = in.m_51.x;
    float _488 = in.m_51.y;
    float _490 = in.m_51.z;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _494 = _492 != 0;
    float _496 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _500 = _498 != 0;
    float _502 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _504 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = in.m_57.y;
    float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _510 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _502);
    float _512 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _516 = in.m_59.x;
    float _518 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _520 = 0.0;
    if (_494)
    {
        float _522 = in.m_53.x;
        _520 = _522;
    }
    float _524 = _520;
    float _526 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _512);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _530 = _480 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _534 = _482 > 0.5;
    float _536 = _482 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _538 = -_514;
    float _540 = fma(_530, 2.0, _538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _542;
    float _546 = in.m_59.y;
    float _548 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _554 = 1.0 / _544;
    float _556 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _558 = _490 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _560 = in.m_59.z;
    float _562 = -_506;
    float _564 = _562 + 1.0;
    float _566 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[78].z, _528);
    float _568 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[78].w, _532);
    float _570 = 1.0 / _552;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _574 = _478 + _572;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _580 = _478 + _578;
    float _582 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = _506;
    if (_500)
    {
        float _586 = _534 ? _564 : _506;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_536, -2.0, _576);
    float _592 = _574 * _554;
    float _594 = _508 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _596 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _496);
    float _598 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _566);
    float _600 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _602 = fma(_594, _588, -0.5);
    float _604 = -_126;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[76].x, _540);
    float _608 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _568);
    float _610 = _580 * _570;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _546);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _516);
    float _616 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _618 = _524 > 0.5;
    bool _620 = _618 && _494;
    float _622 = _582 * _612;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _626 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _628 = -_600;
    float _630 = fma(_608, _602, _628);
    float _632 = _616 * _614;
    float _634 = _622 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _622 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = _626 * _624;
    out.m_61.x = _516;
    float _640 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].x, _636);
    float _644 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _646 = _526 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].z, _640);
    float _650 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[10].z, _642);
    float _652 = in.m_57.x;
    float _654 = _644 + _648;
    float _656 = _646 + _650;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _658;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _664 = _654 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _668 = _656 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _670;
    float _674 = _664 * _664;
    float _676 = _668 * _668;
    float _678 = fma(_660, _592, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _680;
    float _684 = fma(_672, _592, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _686 = _674 + _676;
    bool _688 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _690 = isnan(_478);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = fma(_682, _592, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _706 = sqrt(_686);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _712 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _714 = isnan(_478);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _728 = -_698;
    float _730 = _728 + 1.0;
    float _732 = fma(_704, _610, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _734 = fma(_710, _610, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _736 = fma(_726, _610, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _738 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _740 = isnan(_478);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _722 * _730;
    float _752 = _622 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _754 = -_722;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _760 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].x, _752);
    float _762 = _748 * _756;
    float _764 = _756;
    float _766 = _652;
    float _768 = _638;
    float _770 = _596;
    float _772 = _656;
    float _774 = _698;
    float _776 = _646;
    if (!_494)
    {
        _764 = _652;
    }
    float _778 = _764;
    float _780 = _778;
    if (_620)
    {
        float _782 = -_652;
        float _784 = _782 + 1.0;
        _766 = _784;
    }
    float _786 = _766;
    bool _788 = _706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = _678 * _762;
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[9].z, _760);
    float _798 = _596 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _684 * _762;
    float _802 = _700 * _762;
    float _804 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].x, _790);
    float _806 = _798 + _796;
    float _808 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[123].z, _802);
    float _812 = _800;
    float _814 = _794;
    if (_494)
    {
        _780 = _786;
    }
    float _816 = _780;
    float _818 = _758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_788)
    {
        _768 = _656;
    }
    float _820 = _768;
    float _822 = _820;
    if (!_788)
    {
        _812 = _676;
    }
    float _824 = _812;
    float _826 = _824;
    if (!_788)
    {
        _814 = _674;
    }
    float _828 = _814;
    float _830 = _828;
    if (!_788)
    {
        _770 = _654;
    }
    float _832 = _770;
    float _834 = _832;
    if (!_788)
    {
        _772 = _806;
    }
    float _836 = _772;
    bool _838 = !_788;
    float _840 = _836;
    if (!_838)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _706 + _844;
        float _848 = _806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = rsqrt(_686);
        float _852 = _846 * _842;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _850 * _864;
        float _868 = fma(_664, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = _862 + (-1.0);
        float _872 = fma(_668, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _876 = _868 + _874;
        float _878 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _882 = _872 + _880;
        float _884 = _876 * _876;
        float _886 = fma(_806, _862, _878);
        float _888 = _882 * _882;
        _840 = _886;
        _830 = _884;
        _826 = _888;
        _834 = _868;
        _822 = _872;
    }
    float _890 = _840;
    float _892 = _830;
    float _894 = _826;
    float _896 = _834;
    float _898 = _822;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _902 = _890 + _900;
    float _904 = in.m_63.w;
    float _906 = fma(_732, _750, _804);
    float _908 = fma(_734, _750, _808);
    float _910 = fma(_902, _902, _892);
    float _912 = fma(_736, _750, _810);
    float _914 = fma(_818, _816, -0.5);
    float _916 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].x, _906);
    float _918 = _910 + _894;
    float _920 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].y, _908);
    float _922 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].z, _912);
    float _924 = fma(_598, _914, _606);
    float _926 = _916 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _928 = sqrt(_918);
    float _930 = _920 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _936 = _630 + 0.5;
    float _938 = _924 + 0.5;
    float _940 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.y = _546;
    out.m_61.z = _560;
    bool _946 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _948 = isnan(_928);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _954 = _950 || _952;
    out.m_65.w = _904;
    out.m_67.x = _938;
    out.m_67.y = _936;
    out.m_69.x = _940;
    out.m_69.y = _942;
    out.m_69.z = _944;
    out.m_69.w = _934;
    float _956 = _942;
    if (!_954)
    {
        _774 = 1.0;
    }
    float _958 = _774;
    bool _960 = !_954;
    float _962 = _958;
    if (!_960)
    {
        bool _964 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _966 = isnan(_928);
        bool _968 = _964 || _966;
        bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _972 = _968 || _970;
        if (!_972)
        {
            float _974 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _976 = _928 + _974;
            float _978 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _980 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _978;
            float _982 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _984 = _982 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _986 = 1.0 / _980;
            float _988 = _976 * _986;
            float _990 = fma(_988, _984, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _962 = _990;
            _992 = true;
        }
        else
        {
            bool _994 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _996 = isnan(_928);
            bool _998 = _994 || _996;
            bool _1000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1002 = _998 || _1000;
            if (!_1002)
            {
                float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1006 = _928 + _1004;
                float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1014 = _1012 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1016 = 1.0 / _1010;
                float _1018 = _1006 * _1016;
                float _1020 = fma(_1018, _1014, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _962 = _1020;
                _992 = true;
            }
            else
            {
                _962 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _992 = false;
    float _1022 = _962;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1026 = _890 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1030 = _896 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1034 = _898 + _1032;
    float _1036 = fma(_1026, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1038 = fma(_1030, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1040 = fma(_1034, _1022, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1044 = _1036 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1052 = _1040 + _1050;
    float _1054 = _1044 * _1044;
    float _1056 = fma(_1048, _1048, _1054);
    float _1058 = fma(_1052, _1052, _1056);
    float _1060 = rsqrt(_1058);
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1064 = _1048 * _1062;
    float _1066 = _1052 * _1062;
    float _1068 = _1064 * _1064;
    float _1070 = _1066 * _1066;
    float _1072 = _1068 + _1070;
    float _1074 = sqrt(_1072);
    bool _1076 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1080 = _1074 + _1078;
    float _1082 = _944;
    float _1084 = _1072;
    float _1086 = _1080;
    float _1088 = _1044;
    float _1090 = _1062;
    float _1092 = _1064;
    if (_1076)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1082 = _1094;
    }
    float _1096 = _1082;
    if (_1076)
    {
        float _1098 = rsqrt(_1072);
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = _1096;
    float _1104 = _1100;
    if (_1076)
    {
        float _1106 = _1080 * _1096;
        _1086 = _1106;
    }
    float _1108 = _1086;
    if (_1076)
    {
        float _1110 = _1108 * 0.15915493667125701904296875;
        _956 = _1110;
    }
    float _1112 = _956;
    float _1114 = _1052;
    if (_1076)
    {
        float _1116 = _1112 * 6.283185482025146484375;
        float _1118 = sin(_1116);
        _1114 = _1118;
    }
    float _1120 = _1114;
    float _1122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1124 = precise::max(0.0, _1122);
    float _1126 = _936;
    float _1128 = _1124;
    if (_1076)
    {
        float _1130 = _1112 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = -_1062;
    float _1138 = -_1124;
    float _1140 = fma(_1044, _1136, _1138);
    if (_1076)
    {
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1142;
    }
    float _1144 = _1088;
    float _1146 = sqrt(_1058);
    float _1148 = _1120;
    float _1150 = _1144;
    if (_1076)
    {
        float _1152 = fma(_1120, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = _1154;
    if (!_1076)
    {
        _1150 = _1066;
    }
    float _1158 = _1150;
    float _1160 = _1158;
    if (_1076)
    {
        float _1162 = _1134 + (-1.0);
        _1128 = _1162;
    }
    float _1164 = _1128;
    float _1166 = _1164;
    if (_1076)
    {
        float _1168 = _1100 * _1154;
        _1090 = _1168;
    }
    float _1170 = _1090;
    if (!_1076)
    {
        _1156 = _1140;
    }
    float _1172 = _1156;
    float _1174 = _1172;
    if (_1076)
    {
        float _1176 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1102 = _1176;
    }
    float _1178 = _1102;
    if (_1076)
    {
        float _1180 = _1064 * _1170;
        _1092 = _1180;
    }
    float _1182 = _1092;
    if (!_1076)
    {
        _1104 = _1068;
    }
    float _1184 = _1104;
    float _1186 = _1184;
    if (_1076)
    {
        float _1188 = _1066 * _1170;
        _1160 = _1188;
    }
    float _1190 = _1160;
    if (_1076)
    {
        float _1192 = fma(_1140, _1134, _1178);
        _1174 = _1192;
    }
    float _1194 = _1174;
    if (_1076)
    {
        float _1196 = _1182 * _1182;
        _1186 = _1196;
    }
    float _1198 = _1186;
    if (!_1076)
    {
        _1166 = _1070;
    }
    float _1200 = _1166;
    float _1202 = _1200;
    if (_1076)
    {
        float _1204 = _1190 * _1190;
        _1202 = _1204;
    }
    float _1206 = _1202;
    float _1208 = fma(_1194, _1194, _1198);
    float _1210 = _1208 + _1206;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1214 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1212);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1222 = rsqrt(_1210);
    float _1224 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1218);
    float _1228 = -_1216;
    float _1230 = _1228 + 1.0;
    float _1232 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1234 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1236 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1238 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1240 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1232);
    float _1242 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1234);
    float _1244 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1236);
    float _1246 = abs(_1230);
    float _1248 = log2(_1246);
    float _1250 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1240);
    float _1252 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1254 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1244);
    float _1256 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1258 = _1222 * _1182;
    float _1260 = _1222 * _1194;
    float _1262 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1264 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1268 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1270 = _1222 * _1190;
    float _1272 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1264);
    float _1274 = -_1266;
    float _1276 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1274);
    float _1278 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1282 = -_1270;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1276);
    float _1286 = -_1278;
    float _1288 = fma(_1286, _1220, 1.0);
    float _1290 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1292 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1280);
    float _1294 = fma(_1284, -0.5, 0.5);
    float _1296 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1298 = exp2(_1290);
    float _1300 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1302 = fma(_1284, 0.5, 0.5);
    float _1304 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1296);
    float _1306 = _1260 + 1.0;
    float _1308 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1300);
    float _1310 = fma(_1302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1312 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1304);
    float _1314 = log2(_1288);
    float _1316 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1308);
    float _1318 = fma(_1302, _1310, -0.212114393711090087890625);
    float _1320 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1312);
    float _1322 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1316);
    float _1324 = fma(_1302, _1318, 1.570728778839111328125);
    float _1326 = 1.0 / _1292;
    float _1328 = -_1260;
    float _1330 = fma(_1298, _1306, _1328);
    float _1332 = fma(_1330, 0.5, 0.5);
    float _1334 = sqrt(_1294);
    float _1336 = _1314 * 0.693147182464599609375;
    float _1338 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = _1320 * _1326;
    float _1342 = _1322 * _1326;
    float _1344 = fma(_1340, 0.5, 0.5);
    float _1346 = fma(_1342, -0.5, 0.5);
    float _1348 = _1334 * 0.636619746685028076171875;
    float _1350 = -_1324;
    float _1352 = fma(_1348, _1350, 1.0);
    float3 _3704 = float3(_1344, _1346, _1338);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3704, float3(0.0), isnan(_3704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3704, float3(0.0), isnan(_3704)), level(0.0)).x;
    float3 _3715 = float3(_1344, _1346, _1338);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3715, float3(0.0), isnan(_3715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3715, float3(0.0), isnan(_3715)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float2 _3732 = float2(_1352, _1332);
    float3 _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3732, float2(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3732, float2(0.0), isnan(_3732)), level(0.0)).xyz;
    float _1371 = _1369.x;
    float _1373 = _1369.y;
    float _1375 = _1369.z;
    float _1377 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1379 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1381 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1377);
    bool _1383 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan(0.5);
    bool _1391 = _1387 || _1389;
    float _1393 = exp2(_1379);
    float _1395 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1381);
    float _1397 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1399 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1401 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1397);
    float _1403 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1405 = 1.0 / _1399;
    float _1407 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1409 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1403);
    if (_1391)
    {
        _776 = 1.0;
    }
    float _1411 = _776;
    float _1413 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1415 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1417 = _1413 + _1399;
    float _1419 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1415);
    float _1421 = _1417 * _1405;
    float _1423 = _1421 * 0.5;
    float _1425 = _1411;
    if (!_1391)
    {
        float _1427 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1431 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1429);
        float _1433 = _1427 * 0.15915493667125701904296875;
        float _1435 = _1433 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1441 = _1439 * 0.15915493667125701904296875;
        float _1443 = _1433 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        float _1447 = 1.0 / _1437;
        float _1449 = _1441 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = _1445 * _1447;
        float _1455 = 1.0 / _1431;
        float _1457 = _1451 * _1453;
        float _1459 = _1441 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1465 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1463;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1469 = _1455 * _1467;
        float _1471 = 1.0 / _1457;
        float _1473 = 1.0 / _1465;
        float _1475 = _1461 * _1471;
        float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1479 = fma(_1475, _1469, _1477);
        float _1481 = _1479 * _1473;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        float _1485 = -_1483;
        float _1487 = _1485 + 1.0;
        _1425 = _1487;
    }
    float _1489 = _1425;
    float _1491 = _1292 * 0.5;
    float _1493 = -_1393;
    float _1495 = _1493 + 1.0;
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1499 = _1489 > 0.0;
    bool _1501 = isnan(_1489);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan(0.0);
    bool _1507 = _1503 || _1505;
    float _1509 = fma(_1322, -0.5, _1491);
    float _1511 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1513 = _1497 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1515 = _1419 + _1292;
    float _1517 = _1320 + _1292;
    float _1519 = _1511 * _1354;
    float _1521 = -_1511;
    float _1523 = _1521 + 1.0;
    out.gl_Position.x = _1320;
    out.gl_Position.y = _1322;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _1292;
    float _1525 = _1365 * _1519;
    float _1527 = _1375 * _1519;
    float _1529 = _1515 * 0.5;
    float _1531 = _1517 * 0.5;
    float _1533 = fma(_1371, _1525, _1359);
    float _1535 = fma(_1373, _1525, _1361);
    float _1537 = _1365 * _1523;
    float _1539 = fma(_1365, _1527, _1363);
    out.m_71.x = _1531;
    out.m_71.y = _1509;
    out.m_71.z = _1529;
    out.m_71.w = _1292;
    out.m_47.x = _1513;
    out.m_73.x = _1533;
    out.m_73.y = _1535;
    out.m_73.z = _1539;
    out.m_73.w = _1537;
    if (_1507)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1541;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

