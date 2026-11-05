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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    bool _974 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_48.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_51.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1816 = as_type<float>(_116);
        out.gl_Position.z = _1816;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_53.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1885 = as_type<float>(_152);
        out.gl_Position.z = _1885;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _164 = _156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _168 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _162);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _166);
    float _174 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _168);
    float _176 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _172);
    bool _180 = !_160;
    float _198;
    if (!_180)
    {
        float _182 = in.m_57.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_100);
        float _204 = 1.0 / _202;
        float _206 = _134 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = _208 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = 1.0 / _220;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _236;
    bool _240 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_208);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = 1.0 / _228;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _208 + _254;
    float _258 = 1.0 / _232;
    float _260 = _212 * _234;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _208 + _262;
    float _266 = 1.0 / _224;
    float _268 = _216 * _252;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = fma(_272, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = fma(_276, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = _264 * _258;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _288 = _176 * _176;
    float _290 = 1.0 / _238;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _300 = fma(_174, _174, _288);
    bool _302 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_208);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = _256 * _266;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = fma(_178, _178, _300);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = _208 + _322;
    bool _326 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_208);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = fma(_318, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = rsqrt(_320);
    bool _342 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _344 = isnan(_208);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_294, _314, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _356 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_208);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_336;
    float _370 = _368 + 1.0;
    float _372 = _324 * _290;
    float _374 = -_352;
    float _376 = _374 + 1.0;
    bool _378 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _380 = isnan(_208);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -_312;
    float _392 = _390 + 1.0;
    float _394 = -_250;
    float _396 = _394 + 1.0;
    float _398 = _366 * _376;
    float _400 = -_366;
    float _402 = _400 + 1.0;
    float _404 = _250 * _370;
    float _406 = _336 * _392;
    float _408 = _388 * _396;
    float _410 = fma(_286, _314, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_298, _314, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _414 = _312 * _402;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _416;
    float _420 = _176 * _340;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = _278 * _408;
    float _432 = fma(_418, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _434 = _174 * _340;
    float _436 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_428, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = _338 * _408;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _448 = _178 * _340;
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].y, _436);
    float _452 = _280 * _408;
    float _454 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _456 = -_388;
    float _458 = _456 + 1.0;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].y, _450);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _472 = fma(_464, _282, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = abs(_460);
    bool _476 = _474 > 0.99989998340606689453125;
    float _478 = fma(_468, _282, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _480 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _482 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _484 = fma(_354, _404, _470);
    float _486 = fma(_410, _404, _480);
    float _488 = fma(_412, _404, _482);
    float _490 = fma(_432, _406, _484);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _492;
    float _496 = fma(_440, _406, _488);
    float _498 = _404;
    float _500 = _482;
    float _502 = _438;
    float _504 = _454;
    if (_476)
    {
        _498 = 0.001000000047497451305389404296875;
    }
    float _506 = _498;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    if (!_476)
    {
        _500 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _512 = _500;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _514;
    float _518 = fma(_454, _414, _490);
    float _520 = _512;
    if (_476)
    {
        float _522 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _520 = _522;
    }
    float _524 = _520;
    float _526 = fma(_438, _406, _486);
    float _528 = fma(_510, _372, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _530 = fma(_494, _372, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _532 = fma(_516, _372, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    if (!_476)
    {
        _502 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _534 = _502;
    float _536 = in.m_59.x;
    float _538 = in.m_59.y;
    float _540 = in.m_59.z;
    float _542 = _534;
    if (_476)
    {
        float _544 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _542 = _544;
    }
    float _546 = _542;
    float _548 = -_524;
    float _550 = _448 * _548;
    if (!_476)
    {
        _504 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _552 = _504;
    float _554 = _552;
    if (_476)
    {
        float _556 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _554 = _556;
    }
    float _558 = _554;
    float _560 = fma(_528, _398, _518);
    float _562 = in.m_61.x;
    float _564 = in.m_61.y;
    float _566 = in.m_61.z;
    float _568 = -_546;
    float _570 = _420 * _568;
    float _572 = -_546;
    float _574 = -_550;
    float _576 = fma(_434, _572, _574);
    float _578 = fma(_472, _414, _526);
    float _580 = fma(_478, _414, _496);
    float _582 = -_558;
    float _584 = _434 * _582;
    float _586 = -_558;
    float _588 = -_570;
    float _590 = fma(_448, _586, _588);
    float _592 = _576 * _576;
    float _594 = in.m_48.x;
    float _596 = in.m_48.y;
    float _598 = in.m_48.z;
    float _600 = -_524;
    float _602 = -_584;
    float _604 = fma(_420, _600, _602);
    float _606 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].x, _560);
    float _608 = fma(_590, _590, _592);
    float _610 = fma(_530, _398, _578);
    float _612 = fma(_532, _398, _580);
    float _614 = fma(_604, _604, _608);
    float _616 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].y, _610);
    float _618 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].z, _612);
    float _620 = _606 * _536;
    float _622 = _616 * _538;
    float _624 = rsqrt(_614);
    float _626 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _628 = _618 * _540;
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _562);
    float _632 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _566);
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _638 = _626 * _630;
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    bool _642 = _564 != 0.0;
    bool _644 = isnan(_564);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = _636 * _634;
    float _654 = _596 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _656 = _596 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = _632 * _640;
    float _660 = _596 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _662 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].x, _654);
    float _664 = _576 * _624;
    float _666 = _604 * _624;
    float _668 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _670 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[4].z, _662);
    float _672 = _590 * _624;
    float _674 = _658 * _434;
    float _676 = _658 * _448;
    float _678 = _420 * _666;
    float _680 = _434 * _664;
    float _682 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _684 = fma(_638, _672, _674);
    float _686 = fma(_638, _666, _676);
    float _688 = -_678;
    float _690 = fma(_448, _664, _688);
    float _692 = -_680;
    float _694 = fma(_420, _672, _692);
    float _696 = _670 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = _682 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = fma(_652, _690, _684);
    float _702 = fma(_652, _694, _686);
    float _704 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].x, _660);
    bool _706 = _562 == 0.0;
    bool _708 = !_650;
    bool _710 = _706 && _708;
    float _712 = _696 + _700;
    float _714 = _698 + _702;
    float _716 = _658 * _420;
    float _718 = in.m_63.x;
    float _720 = in.m_63.y;
    float _722 = in.m_63.z;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _726 = _712 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _730 = _714 + _728;
    float _732 = _448 * _672;
    bool _734 = _566 == 0.0;
    bool _736 = _734 && _710;
    float _738 = _726 * _726;
    float _740 = _730 * _730;
    float _742 = fma(_638, _664, _716);
    float _744 = -_732;
    float _746 = fma(_434, _666, _744);
    float _748 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[5].z, _704);
    float _750 = _738 + _740;
    float _752 = fma(_652, _746, _742);
    float _754 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _756 = sqrt(_750);
    float _758 = _754 + _752;
    float _760 = _718;
    float _762 = _720;
    float _764 = _722;
    float _766 = _598;
    float _768 = _564;
    float _770 = _562;
    float _772 = _752;
    float _774 = _712;
    float _776 = _746;
    if (!_736)
    {
        float _778 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _718);
        _760 = _778;
    }
    float _780 = _760;
    if (!_736)
    {
        float _782 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _720);
        _762 = _782;
    }
    float _784 = _762;
    if (!_736)
    {
        float _786 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _722);
        _764 = _786;
    }
    float _788 = _764;
    bool _790 = _756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_790)
    {
        _766 = _712;
    }
    float _792 = _766;
    float _794 = _792;
    if (!_790)
    {
        _768 = _740;
    }
    float _796 = _768;
    float _798 = _796;
    if (!_790)
    {
        _770 = _738;
    }
    float _800 = _770;
    float _802 = _800;
    if (!_790)
    {
        _772 = _714;
    }
    float _804 = _772;
    float _806 = _804;
    if (!_790)
    {
        _774 = _758;
    }
    float _808 = _774;
    bool _810 = !_790;
    float _812 = _808;
    if (!_810)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _818 = _756 + _816;
        float _820 = rsqrt(_750);
        float _822 = _818 * _814;
        float _824 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = _822 * 0.15915493667125701904296875;
        float _828 = _826 * 6.283185482025146484375;
        float _830 = sin(_828);
        float _832 = _826 * 6.283185482025146484375;
        float _834 = cos(_832);
        float _836 = fma(_830, _824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _838 = _820 * _836;
        float _840 = _834 + (-1.0);
        float _842 = fma(_726, _838, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _844 = fma(_730, _838, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _846 = _840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _850 = _842 + _848;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _854 = _844 + _852;
        float _856 = fma(_758, _834, _846);
        float _858 = _850 * _850;
        float _860 = _854 * _854;
        _812 = _856;
        _802 = _858;
        _798 = _860;
        _794 = _842;
        _806 = _844;
    }
    float _862 = _812;
    float _864 = _802;
    float _866 = _798;
    float _868 = _794;
    float _870 = _806;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _874 = _862 + _872;
    float _876 = _434 * _784;
    float _878 = _420 * _784;
    float _880 = _448 * _784;
    float _882 = fma(_874, _874, _864);
    float _884 = fma(_672, _780, _876);
    float _886 = fma(_664, _780, _878);
    float _888 = fma(_666, _780, _880);
    float _890 = _882 + _866;
    float _892 = fma(_690, _788, _884);
    float _894 = fma(_746, _788, _886);
    float _896 = sqrt(_890);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _912 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = fma(_694, _788, _888);
    out.m_65.x = _908;
    out.m_65.y = _912;
    out.m_65.z = _914;
    bool _924 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _926 = isnan(_896);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _932 = _928 || _930;
    out.m_67.x = _916;
    out.m_67.y = _918;
    out.m_67.z = _920;
    out.m_69.x = _892;
    out.m_69.y = _894;
    out.m_69.z = _922;
    float _934 = _876;
    float _936 = _914;
    float _938 = _908;
    if (!_932)
    {
        _934 = 1.0;
    }
    float _940 = _934;
    bool _942 = !_932;
    float _944 = _940;
    if (!_942)
    {
        bool _946 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _948 = isnan(_896);
        bool _950 = _946 || _948;
        bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _954 = _950 || _952;
        if (!_954)
        {
            float _956 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _958 = _896 + _956;
            float _960 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _962 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _960;
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _966 = _964 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _968 = 1.0 / _962;
            float _970 = _958 * _968;
            float _972 = fma(_970, _966, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _944 = _972;
            _974 = true;
        }
        else
        {
            bool _976 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _978 = isnan(_896);
            bool _980 = _976 || _978;
            bool _982 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _984 = _980 || _982;
            if (!_984)
            {
                float _986 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _988 = _896 + _986;
                float _990 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _992 = _990 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _996 = _994 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _998 = 1.0 / _992;
                float _1000 = _988 * _998;
                float _1002 = fma(_1000, _996, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _944 = _1002;
                _974 = true;
            }
            else
            {
                _944 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _974 = false;
    float _1004 = _944;
    float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1008 = _862 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1012 = _868 + _1010;
    float _1014 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1018 = _870 + _1016;
    float _1020 = fma(_1012, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _1014 + _1022;
    float _1026 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1030 = _1020 + _1028;
    float _1032 = _1024 * _1024;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1036 = _1026 + _1034;
    float _1038 = fma(_1030, _1030, _1032);
    float _1040 = fma(_1036, _1036, _1038);
    float _1042 = rsqrt(_1040);
    float _1044 = sqrt(_1040);
    float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1048 = _1030 * _1046;
    float _1050 = _1036 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 * _1050;
    float _1056 = _1052 + _1054;
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1058 + _1062;
    float _1066 = _1042;
    float _1068 = _1056;
    float _1070 = _1064;
    float _1072 = _1024;
    if (_1060)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1074;
    }
    float _1076 = _1066;
    if (_1060)
    {
        float _1078 = rsqrt(_1056);
        _1068 = _1078;
    }
    float _1080 = _1068;
    if (_1060)
    {
        float _1082 = _1064 * _1076;
        _1070 = _1082;
    }
    float _1084 = _1070;
    if (_1060)
    {
        float _1086 = _1084 * 0.15915493667125701904296875;
        _936 = _1086;
    }
    float _1088 = _936;
    float _1090 = _1076;
    if (_1060)
    {
        float _1092 = _1088 * 6.283185482025146484375;
        float _1094 = sin(_1092);
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1100 = precise::max(0.0, _1098);
    float _1102 = _1036;
    float _1104 = _1100;
    if (_1060)
    {
        float _1106 = _1088 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        _1102 = _1108;
    }
    float _1110 = _1102;
    float _1112 = -_1046;
    float _1114 = -_1100;
    float _1116 = fma(_1024, _1112, _1114);
    float _1118 = _1116;
    if (_1060)
    {
        float _1120 = _1116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1120;
    }
    float _1122 = _1104;
    float _1124 = _1096;
    float _1126 = _1122;
    if (_1060)
    {
        float _1128 = fma(_1096, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _938 = _1128;
    }
    float _1130 = _938;
    float _1132 = _1130;
    if (!_1060)
    {
        _1124 = _1048;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    float _1138 = _1110;
    if (_1060)
    {
        float _1140 = _1110 + (-1.0);
        _1126 = _1140;
    }
    float _1142 = _1126;
    float _1144 = _1142;
    if (_1060)
    {
        float _1146 = _1080 * _1130;
        _776 = _1146;
    }
    float _1148 = _776;
    if (!_1060)
    {
        _1132 = _1050;
    }
    float _1150 = _1132;
    float _1152 = _1150;
    if (_1060)
    {
        float _1154 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1154;
    }
    float _1156 = _1072;
    if (_1060)
    {
        float _1158 = _1048 * _1148;
        _1136 = _1158;
    }
    float _1160 = _1136;
    if (!_1060)
    {
        _1144 = _1052;
    }
    float _1162 = _1144;
    float _1164 = _1162;
    if (_1060)
    {
        float _1166 = _1050 * _1148;
        _1152 = _1166;
    }
    float _1168 = _1152;
    if (_1060)
    {
        float _1170 = fma(_1116, _1110, _1156);
        _1118 = _1170;
    }
    float _1172 = _1118;
    if (_1060)
    {
        float _1174 = _1160 * _1160;
        _1164 = _1174;
    }
    float _1176 = _1164;
    if (!_1060)
    {
        _1138 = _1054;
    }
    float _1178 = _1138;
    float _1180 = _1178;
    if (_1060)
    {
        float _1182 = _1168 * _1168;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1172, _1172, _1176);
    float _1188 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1190 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1192 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1194 = _1186 + _1184;
    float _1196 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1198 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1188);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1202 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1200);
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = rsqrt(_1194);
    float _1208 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1196);
    float _1210 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1192);
    float _1212 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1198);
    float _1216 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1208);
    float _1218 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1210);
    float _1220 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1222 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1224 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1220);
    float _1230 = -_1204;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1236 = floor(_1190);
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1240 = _1206 * _1160;
    float _1242 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1234);
    float _1244 = _1206 * _1168;
    float _1246 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1248 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1242);
    float _1250 = _1206 * _1172;
    float _1252 = abs(_1232);
    float _1254 = log2(_1252);
    float _1256 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1248);
    float _1258 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1260 = -_1258;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = floor(_1246);
    float _1266 = -_1236;
    float _1268 = _1190 + _1266;
    float _1270 = -_1244;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1274 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1276 = fma(_1272, -0.5, 0.5);
    float _1278 = fma(_1272, 0.5, 0.5);
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1282 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1284 = sqrt(_1276);
    float _1286 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1288 = -_1274;
    float _1290 = fma(_1288, _1280, 1.0);
    float _1292 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1296 = 1.0 / _1256;
    float _1298 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1294);
    float _1300 = -_1264;
    float _1302 = _1246 + _1300;
    float _1304 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1298);
    float _1306 = log2(_1290);
    float _1308 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1304);
    float _1310 = _1284 * 0.636619746685028076171875;
    float _1312 = exp2(_1282);
    float2 _3859 = float2(_1268, _1302);
    float _1314 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3859, float2(0.0), isnan(_3859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3859, float2(0.0), isnan(_3859)), level(0.0)).x;
    float _1316 = _1306 * 0.693147182464599609375;
    float _1318 = fma(_1278, _1292, -0.212114393711090087890625);
    float _1320 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1286);
    float _1322 = fma(_1278, _1318, 1.570728778839111328125);
    float _1324 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1320);
    float _1326 = _1250 + 1.0;
    float _1328 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1330 = _1308 * _1296;
    float _1332 = -_1250;
    float _1334 = fma(_1312, _1326, _1332);
    float _1336 = -_1322;
    float _1338 = fma(_1310, _1336, 1.0);
    float _1340 = _1328 * _1296;
    float _1342 = fma(_1330, 0.5, 0.5);
    float _1344 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1346 = fma(_1334, 0.5, 0.5);
    float _1348 = fma(_1340, -0.5, 0.5);
    float3 _3925 = float3(_1342, _1348, _1344);
    float _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3925, float3(0.0), isnan(_3925)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3925, float3(0.0), isnan(_3925)), level(0.0)).x;
    float3 _3936 = float3(_1342, _1348, _1344);
    float4 _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3936, float3(0.0), isnan(_3936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3936, float3(0.0), isnan(_3936)), level(0.0)).xyzw;
    float _1355 = _1353.x;
    float _1357 = _1353.y;
    float _1359 = _1353.z;
    float _1361 = _1353.w;
    float2 _3952 = float2(_1338, _1346);
    float3 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3952, float2(0.0), isnan(_3952)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3952, float2(0.0), isnan(_3952)), level(0.0)).xyz;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1375 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1379 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1381 = isnan(_1044);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1387 = _1383 || _1385;
    float _1389 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1373);
    float _1391 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1393 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1395 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1377);
    float _1397 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1399 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1391);
    float _1401 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1395);
    float _1403 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1405 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = exp2(_1393);
    float _1409 = _1405 + _1403;
    float _1411 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1401);
    float _1413 = 1.0 / _1403;
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = _1409 * _1413;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    float _1427 = 1.0 / _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1431 = _1427 * _1429;
    float _1433 = abs(_1431);
    float _1435 = log2(_1433);
    bool _1437 = _1431 <= 8000.0;
    bool _1439 = isnan(_1431);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan(8000.0);
    bool _1445 = _1441 || _1443;
    float _1447 = float(_1445);
    float _1449 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1451 = exp2(_1449);
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1455 = precise::clamp(_1453, 0.0, 1.0);
    float _1457 = _1411 + _1256;
    float _1459 = fma(_1455, -2.0, 3.0);
    float _1461 = _1455 * _1455;
    float _1463 = _1457 * 0.5;
    float _1465 = _1461 * _1459;
    float _1467 = in.m_71.x;
    float _1469 = -_1465;
    float _1471 = _1469 + 1.0;
    out.m_73.z = _1463;
    out.m_73.w = _1256;
    float _1473 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1465);
    float _1475 = _1447 * _1473;
    out.gl_Position.x = _1308;
    out.gl_Position.y = _1328;
    out.gl_Position.z = _1411;
    out.gl_Position.w = _1256;
    float _1477 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1479 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1481 = _1328;
    float _1483 = _1308;
    if (!_1387)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1485 = _1481;
    float _1487 = _1485;
    float _1489 = _1485;
    if (!_1387)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1491 = _1483;
    float _1493 = -_1314;
    float _1495 = _1493 + 1.0;
    float _1497 = _1495 * _1477;
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = -_1499;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1505 = _1503 * _1467;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1509 = _1505;
    float _1511 = _1491;
    float _1513 = _1491;
    if (!_1387)
    {
        _1509 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1515 = _1509;
    out.m_75.x = _1507;
    float _1517 = _1479 * _1350;
    float _1519 = -_1479;
    float _1521 = _1519 + 1.0;
    float _1523 = _1361 * _1517;
    float _1525 = _1371 * _1517;
    float _1527 = _1361 * _1521;
    float _1529 = fma(_1367, _1523, _1355);
    float _1531 = fma(_1369, _1523, _1357);
    float _1533 = fma(_1361, _1525, _1359);
    out.m_77.x = _1529;
    out.m_77.y = _1531;
    out.m_77.z = _1533;
    out.m_77.w = _1527;
    bool _1535 = !_1387;
    float _1537 = _1515;
    float _1539 = _1515;
    if (!_1535)
    {
        bool _1541 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1543 = isnan(_1044);
        bool _1545 = _1541 || _1543;
        bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1549 = _1545 || _1547;
        if (!_1549)
        {
            float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1553 = _1044 + _1551;
            float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1557 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1555;
            float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1561 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1565 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1567 = 1.0 / _1557;
            float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1571 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1573 = _1553 * _1567;
            float _1575 = precise::clamp(_1573, 0.0, 1.0);
            float _1577 = fma(_1575, _1561, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1579 = fma(_1575, _1565, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1581 = fma(_1575, _1571, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1513 = _1579;
            _1489 = _1577;
            _1539 = _1581;
            _1583 = true;
        }
        else
        {
            bool _1585 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1587 = isnan(_1044);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                _1487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1595 = _1487;
            _1489 = _1595;
            if (!_1593)
            {
                _1511 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1597 = _1511;
            _1513 = _1597;
            if (!_1593)
            {
                _1537 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1599 = _1537;
            bool _1601 = !_1593;
            _1539 = _1599;
            if (!_1601)
            {
                bool _1603 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1605 = isnan(_1044);
                bool _1607 = _1603 || _1605;
                bool _1609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1611 = _1607 || _1609;
                if (!_1611)
                {
                    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1615 = _1044 + _1613;
                    float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1619 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1617;
                    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1627 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1629 = 1.0 / _1619;
                    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1635 = _1615 * _1629;
                    float _1637 = precise::clamp(_1635, 0.0, 1.0);
                    float _1639 = fma(_1637, _1623, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1641 = fma(_1637, _1627, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1643 = fma(_1637, _1633, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1513 = _1641;
                    _1489 = _1639;
                    _1539 = _1643;
                    _1583 = true;
                }
                else
                {
                    _1513 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1539 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1583 = false;
    float _1645 = _1513;
    float _1647 = _1489;
    float _1649 = _1539;
    float _1651 = _1645 * 0.586610972881317138671875;
    bool _1653 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_79.x = 0.0;
    float _1655 = fma(_1647, 0.298911988735198974609375, _1651);
    float _1657 = fma(_1649, 0.114477999508380889892578125, _1655);
    float _1659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_51.x = 1.0;
    float _1661 = -_1657;
    float _1663 = _1661 + _1647;
    float _1665 = -_1657;
    float _1667 = _1665 + _1645;
    float _1669 = -_1657;
    float _1671 = _1669 + _1649;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1675 = fma(_1667, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1677 = fma(_1671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    out.m_75.w = _1659;
    out.m_81.x = _1673;
    out.m_81.y = _1675;
    out.m_81.z = _1677;
    if (!_1653)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1679 = -_1014;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1683 = -_1020;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1687 = -_1026;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = sqrt(_1695);
    float _1699 = rsqrt(_1695);
    float _1701 = -_1697;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1705 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1707 = precise::clamp(_1705, 0.0, 1.0);
    float _1709 = _1685 * _1699;
    float _1711 = _1681 * _1699;
    float _1713 = abs(_1707);
    float _1715 = log2(_1713);
    float _1717 = _1689 * _1699;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1721 = _894 * _1711;
    float _1723 = -_1711;
    float _1725 = -_1719;
    float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1725);
    float _1729 = fma(_892, _1709, _1721);
    float _1731 = -_1717;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1727);
    float _1735 = fma(_922, _1717, _1729);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1741 = _1733 + _1739;
    float _1743 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = exp2(_1743);
    float _1751 = _1749 * _1747;
    float _1753 = _1737 * _1751;
    float _1755 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1757 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1759 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _1755;
    out.m_79.y = _1757;
    out.m_79.z = _1759;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    bool _974 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_48.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_51.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1816 = as_type<float>(_116);
        out.gl_Position.z = _1816;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_53.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1885 = as_type<float>(_152);
        out.gl_Position.z = _1885;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _164 = _156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _168 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _162);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _166);
    float _174 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _168);
    float _176 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _172);
    bool _180 = !_160;
    float _198;
    if (!_180)
    {
        float _182 = in.m_57.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_100);
        float _204 = 1.0 / _202;
        float _206 = _134 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = _208 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = 1.0 / _220;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _236;
    bool _240 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_208);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = 1.0 / _228;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _208 + _254;
    float _258 = 1.0 / _232;
    float _260 = _212 * _234;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _208 + _262;
    float _266 = 1.0 / _224;
    float _268 = _216 * _252;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = fma(_272, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = fma(_276, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = _264 * _258;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _288 = _176 * _176;
    float _290 = 1.0 / _238;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _300 = fma(_174, _174, _288);
    bool _302 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_208);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = _256 * _266;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = fma(_178, _178, _300);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = _208 + _322;
    bool _326 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_208);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = fma(_318, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = rsqrt(_320);
    bool _342 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _344 = isnan(_208);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_294, _314, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _356 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_208);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_336;
    float _370 = _368 + 1.0;
    float _372 = _324 * _290;
    float _374 = -_352;
    float _376 = _374 + 1.0;
    bool _378 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _380 = isnan(_208);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -_312;
    float _392 = _390 + 1.0;
    float _394 = -_250;
    float _396 = _394 + 1.0;
    float _398 = _366 * _376;
    float _400 = -_366;
    float _402 = _400 + 1.0;
    float _404 = _250 * _370;
    float _406 = _336 * _392;
    float _408 = _388 * _396;
    float _410 = fma(_286, _314, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_298, _314, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _414 = _312 * _402;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _416;
    float _420 = _176 * _340;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = _278 * _408;
    float _432 = fma(_418, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _434 = _174 * _340;
    float _436 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_428, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = _338 * _408;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _448 = _178 * _340;
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].y, _436);
    float _452 = _280 * _408;
    float _454 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _456 = -_388;
    float _458 = _456 + 1.0;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].y, _450);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _472 = fma(_464, _282, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = abs(_460);
    bool _476 = _474 > 0.99989998340606689453125;
    float _478 = fma(_468, _282, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _480 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _482 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _484 = fma(_354, _404, _470);
    float _486 = fma(_410, _404, _480);
    float _488 = fma(_412, _404, _482);
    float _490 = fma(_432, _406, _484);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _492;
    float _496 = fma(_440, _406, _488);
    float _498 = _404;
    float _500 = _482;
    float _502 = _438;
    float _504 = _454;
    if (_476)
    {
        _498 = 0.001000000047497451305389404296875;
    }
    float _506 = _498;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    if (!_476)
    {
        _500 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _512 = _500;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _514;
    float _518 = fma(_454, _414, _490);
    float _520 = _512;
    if (_476)
    {
        float _522 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _520 = _522;
    }
    float _524 = _520;
    float _526 = fma(_438, _406, _486);
    float _528 = fma(_510, _372, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _530 = fma(_494, _372, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _532 = fma(_516, _372, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    if (!_476)
    {
        _502 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _534 = _502;
    float _536 = in.m_59.x;
    float _538 = in.m_59.y;
    float _540 = in.m_59.z;
    float _542 = _534;
    if (_476)
    {
        float _544 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _542 = _544;
    }
    float _546 = _542;
    float _548 = -_524;
    float _550 = _448 * _548;
    if (!_476)
    {
        _504 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _552 = _504;
    float _554 = _552;
    if (_476)
    {
        float _556 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _554 = _556;
    }
    float _558 = _554;
    float _560 = fma(_528, _398, _518);
    float _562 = in.m_61.x;
    float _564 = in.m_61.y;
    float _566 = in.m_61.z;
    float _568 = -_546;
    float _570 = _420 * _568;
    float _572 = -_546;
    float _574 = -_550;
    float _576 = fma(_434, _572, _574);
    float _578 = fma(_472, _414, _526);
    float _580 = fma(_478, _414, _496);
    float _582 = -_558;
    float _584 = _434 * _582;
    float _586 = -_558;
    float _588 = -_570;
    float _590 = fma(_448, _586, _588);
    float _592 = _576 * _576;
    float _594 = in.m_48.x;
    float _596 = in.m_48.y;
    float _598 = in.m_48.z;
    float _600 = -_524;
    float _602 = -_584;
    float _604 = fma(_420, _600, _602);
    float _606 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].x, _560);
    float _608 = fma(_590, _590, _592);
    float _610 = fma(_530, _398, _578);
    float _612 = fma(_532, _398, _580);
    float _614 = fma(_604, _604, _608);
    float _616 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].y, _610);
    float _618 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].z, _612);
    float _620 = _606 * _536;
    float _622 = _616 * _538;
    float _624 = rsqrt(_614);
    float _626 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _628 = _618 * _540;
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _562);
    float _632 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _566);
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _638 = _626 * _630;
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    bool _642 = _564 != 0.0;
    bool _644 = isnan(_564);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = _636 * _634;
    float _654 = _596 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _656 = _596 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = _632 * _640;
    float _660 = _596 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _662 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].x, _654);
    float _664 = _576 * _624;
    float _666 = _604 * _624;
    float _668 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _670 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[4].z, _662);
    float _672 = _590 * _624;
    float _674 = _658 * _434;
    float _676 = _658 * _448;
    float _678 = _420 * _666;
    float _680 = _434 * _664;
    float _682 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _684 = fma(_638, _672, _674);
    float _686 = fma(_638, _666, _676);
    float _688 = -_678;
    float _690 = fma(_448, _664, _688);
    float _692 = -_680;
    float _694 = fma(_420, _672, _692);
    float _696 = _670 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = _682 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = fma(_652, _690, _684);
    float _702 = fma(_652, _694, _686);
    float _704 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].x, _660);
    bool _706 = _562 == 0.0;
    bool _708 = !_650;
    bool _710 = _706 && _708;
    float _712 = _696 + _700;
    float _714 = _698 + _702;
    float _716 = _658 * _420;
    float _718 = in.m_63.x;
    float _720 = in.m_63.y;
    float _722 = in.m_63.z;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _726 = _712 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _730 = _714 + _728;
    float _732 = _448 * _672;
    bool _734 = _566 == 0.0;
    bool _736 = _734 && _710;
    float _738 = _726 * _726;
    float _740 = _730 * _730;
    float _742 = fma(_638, _664, _716);
    float _744 = -_732;
    float _746 = fma(_434, _666, _744);
    float _748 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[5].z, _704);
    float _750 = _738 + _740;
    float _752 = fma(_652, _746, _742);
    float _754 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _756 = sqrt(_750);
    float _758 = _754 + _752;
    float _760 = _718;
    float _762 = _720;
    float _764 = _722;
    float _766 = _598;
    float _768 = _564;
    float _770 = _562;
    float _772 = _752;
    float _774 = _712;
    float _776 = _746;
    if (!_736)
    {
        float _778 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _718);
        _760 = _778;
    }
    float _780 = _760;
    if (!_736)
    {
        float _782 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _720);
        _762 = _782;
    }
    float _784 = _762;
    if (!_736)
    {
        float _786 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _722);
        _764 = _786;
    }
    float _788 = _764;
    bool _790 = _756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_790)
    {
        _766 = _712;
    }
    float _792 = _766;
    float _794 = _792;
    if (!_790)
    {
        _768 = _740;
    }
    float _796 = _768;
    float _798 = _796;
    if (!_790)
    {
        _770 = _738;
    }
    float _800 = _770;
    float _802 = _800;
    if (!_790)
    {
        _772 = _714;
    }
    float _804 = _772;
    float _806 = _804;
    if (!_790)
    {
        _774 = _758;
    }
    float _808 = _774;
    bool _810 = !_790;
    float _812 = _808;
    if (!_810)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _818 = _756 + _816;
        float _820 = rsqrt(_750);
        float _822 = _818 * _814;
        float _824 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = _822 * 0.15915493667125701904296875;
        float _828 = _826 * 6.283185482025146484375;
        float _830 = sin(_828);
        float _832 = _826 * 6.283185482025146484375;
        float _834 = cos(_832);
        float _836 = fma(_830, _824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _838 = _820 * _836;
        float _840 = _834 + (-1.0);
        float _842 = fma(_726, _838, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _844 = fma(_730, _838, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _846 = _840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _850 = _842 + _848;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _854 = _844 + _852;
        float _856 = fma(_758, _834, _846);
        float _858 = _850 * _850;
        float _860 = _854 * _854;
        _812 = _856;
        _802 = _858;
        _798 = _860;
        _794 = _842;
        _806 = _844;
    }
    float _862 = _812;
    float _864 = _802;
    float _866 = _798;
    float _868 = _794;
    float _870 = _806;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _874 = _862 + _872;
    float _876 = _434 * _784;
    float _878 = _420 * _784;
    float _880 = _448 * _784;
    float _882 = fma(_874, _874, _864);
    float _884 = fma(_672, _780, _876);
    float _886 = fma(_664, _780, _878);
    float _888 = fma(_666, _780, _880);
    float _890 = _882 + _866;
    float _892 = fma(_690, _788, _884);
    float _894 = fma(_746, _788, _886);
    float _896 = sqrt(_890);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _912 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = fma(_694, _788, _888);
    out.m_65.x = _908;
    out.m_65.y = _912;
    out.m_65.z = _914;
    bool _924 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _926 = isnan(_896);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _932 = _928 || _930;
    out.m_67.x = _916;
    out.m_67.y = _918;
    out.m_67.z = _920;
    out.m_69.x = _892;
    out.m_69.y = _894;
    out.m_69.z = _922;
    float _934 = _876;
    float _936 = _914;
    float _938 = _908;
    if (!_932)
    {
        _934 = 1.0;
    }
    float _940 = _934;
    bool _942 = !_932;
    float _944 = _940;
    if (!_942)
    {
        bool _946 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _948 = isnan(_896);
        bool _950 = _946 || _948;
        bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _954 = _950 || _952;
        if (!_954)
        {
            float _956 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _958 = _896 + _956;
            float _960 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _962 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _960;
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _966 = _964 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _968 = 1.0 / _962;
            float _970 = _958 * _968;
            float _972 = fma(_970, _966, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _944 = _972;
            _974 = true;
        }
        else
        {
            bool _976 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _978 = isnan(_896);
            bool _980 = _976 || _978;
            bool _982 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _984 = _980 || _982;
            if (!_984)
            {
                float _986 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _988 = _896 + _986;
                float _990 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _992 = _990 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _996 = _994 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _998 = 1.0 / _992;
                float _1000 = _988 * _998;
                float _1002 = fma(_1000, _996, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _944 = _1002;
                _974 = true;
            }
            else
            {
                _944 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _974 = false;
    float _1004 = _944;
    float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1008 = _862 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1012 = _868 + _1010;
    float _1014 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1018 = _870 + _1016;
    float _1020 = fma(_1012, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _1014 + _1022;
    float _1026 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1030 = _1020 + _1028;
    float _1032 = _1024 * _1024;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1036 = _1026 + _1034;
    float _1038 = fma(_1030, _1030, _1032);
    float _1040 = fma(_1036, _1036, _1038);
    float _1042 = rsqrt(_1040);
    float _1044 = sqrt(_1040);
    float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1048 = _1030 * _1046;
    float _1050 = _1036 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 * _1050;
    float _1056 = _1052 + _1054;
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1058 + _1062;
    float _1066 = _1042;
    float _1068 = _1056;
    float _1070 = _1064;
    float _1072 = _1024;
    if (_1060)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1074;
    }
    float _1076 = _1066;
    if (_1060)
    {
        float _1078 = rsqrt(_1056);
        _1068 = _1078;
    }
    float _1080 = _1068;
    if (_1060)
    {
        float _1082 = _1064 * _1076;
        _1070 = _1082;
    }
    float _1084 = _1070;
    if (_1060)
    {
        float _1086 = _1084 * 0.15915493667125701904296875;
        _936 = _1086;
    }
    float _1088 = _936;
    float _1090 = _1076;
    if (_1060)
    {
        float _1092 = _1088 * 6.283185482025146484375;
        float _1094 = sin(_1092);
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1100 = precise::max(0.0, _1098);
    float _1102 = _1036;
    float _1104 = _1100;
    if (_1060)
    {
        float _1106 = _1088 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        _1102 = _1108;
    }
    float _1110 = _1102;
    float _1112 = -_1046;
    float _1114 = -_1100;
    float _1116 = fma(_1024, _1112, _1114);
    float _1118 = _1116;
    if (_1060)
    {
        float _1120 = _1116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1120;
    }
    float _1122 = _1104;
    float _1124 = _1096;
    float _1126 = _1122;
    if (_1060)
    {
        float _1128 = fma(_1096, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _938 = _1128;
    }
    float _1130 = _938;
    float _1132 = _1130;
    if (!_1060)
    {
        _1124 = _1048;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    float _1138 = _1110;
    if (_1060)
    {
        float _1140 = _1110 + (-1.0);
        _1126 = _1140;
    }
    float _1142 = _1126;
    float _1144 = _1142;
    if (_1060)
    {
        float _1146 = _1080 * _1130;
        _776 = _1146;
    }
    float _1148 = _776;
    if (!_1060)
    {
        _1132 = _1050;
    }
    float _1150 = _1132;
    float _1152 = _1150;
    if (_1060)
    {
        float _1154 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1154;
    }
    float _1156 = _1072;
    if (_1060)
    {
        float _1158 = _1048 * _1148;
        _1136 = _1158;
    }
    float _1160 = _1136;
    if (!_1060)
    {
        _1144 = _1052;
    }
    float _1162 = _1144;
    float _1164 = _1162;
    if (_1060)
    {
        float _1166 = _1050 * _1148;
        _1152 = _1166;
    }
    float _1168 = _1152;
    if (_1060)
    {
        float _1170 = fma(_1116, _1110, _1156);
        _1118 = _1170;
    }
    float _1172 = _1118;
    if (_1060)
    {
        float _1174 = _1160 * _1160;
        _1164 = _1174;
    }
    float _1176 = _1164;
    if (!_1060)
    {
        _1138 = _1054;
    }
    float _1178 = _1138;
    float _1180 = _1178;
    if (_1060)
    {
        float _1182 = _1168 * _1168;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1172, _1172, _1176);
    float _1188 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1190 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1192 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1194 = _1186 + _1184;
    float _1196 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1198 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1188);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1202 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1200);
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = rsqrt(_1194);
    float _1208 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1196);
    float _1210 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1192);
    float _1212 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1198);
    float _1216 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1208);
    float _1218 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1210);
    float _1220 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1222 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1224 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1220);
    float _1230 = -_1204;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1236 = floor(_1190);
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1240 = _1206 * _1160;
    float _1242 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1234);
    float _1244 = _1206 * _1168;
    float _1246 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1248 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1242);
    float _1250 = _1206 * _1172;
    float _1252 = abs(_1232);
    float _1254 = log2(_1252);
    float _1256 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1248);
    float _1258 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1260 = -_1258;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = floor(_1246);
    float _1266 = -_1236;
    float _1268 = _1190 + _1266;
    float _1270 = -_1244;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1274 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1276 = fma(_1272, -0.5, 0.5);
    float _1278 = fma(_1272, 0.5, 0.5);
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1282 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1284 = sqrt(_1276);
    float _1286 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1288 = -_1274;
    float _1290 = fma(_1288, _1280, 1.0);
    float _1292 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1296 = 1.0 / _1256;
    float _1298 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1294);
    float _1300 = -_1264;
    float _1302 = _1246 + _1300;
    float _1304 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1298);
    float _1306 = log2(_1290);
    float _1308 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1304);
    float _1310 = _1284 * 0.636619746685028076171875;
    float _1312 = exp2(_1282);
    float2 _3859 = float2(_1268, _1302);
    float _1314 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3859, float2(0.0), isnan(_3859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3859, float2(0.0), isnan(_3859)), level(0.0)).x;
    float _1316 = _1306 * 0.693147182464599609375;
    float _1318 = fma(_1278, _1292, -0.212114393711090087890625);
    float _1320 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1286);
    float _1322 = fma(_1278, _1318, 1.570728778839111328125);
    float _1324 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1320);
    float _1326 = _1250 + 1.0;
    float _1328 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1330 = _1308 * _1296;
    float _1332 = -_1250;
    float _1334 = fma(_1312, _1326, _1332);
    float _1336 = -_1322;
    float _1338 = fma(_1310, _1336, 1.0);
    float _1340 = _1328 * _1296;
    float _1342 = fma(_1330, 0.5, 0.5);
    float _1344 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1346 = fma(_1334, 0.5, 0.5);
    float _1348 = fma(_1340, -0.5, 0.5);
    float3 _3925 = float3(_1342, _1348, _1344);
    float _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3925, float3(0.0), isnan(_3925)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3925, float3(0.0), isnan(_3925)), level(0.0)).x;
    float3 _3936 = float3(_1342, _1348, _1344);
    float4 _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3936, float3(0.0), isnan(_3936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3936, float3(0.0), isnan(_3936)), level(0.0)).xyzw;
    float _1355 = _1353.x;
    float _1357 = _1353.y;
    float _1359 = _1353.z;
    float _1361 = _1353.w;
    float2 _3952 = float2(_1338, _1346);
    float3 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3952, float2(0.0), isnan(_3952)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3952, float2(0.0), isnan(_3952)), level(0.0)).xyz;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1375 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1379 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1381 = isnan(_1044);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1387 = _1383 || _1385;
    float _1389 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1373);
    float _1391 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1393 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1395 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1377);
    float _1397 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1399 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1391);
    float _1401 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1395);
    float _1403 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1405 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = exp2(_1393);
    float _1409 = _1405 + _1403;
    float _1411 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1401);
    float _1413 = 1.0 / _1403;
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = _1409 * _1413;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    float _1427 = 1.0 / _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1431 = _1427 * _1429;
    float _1433 = abs(_1431);
    float _1435 = log2(_1433);
    bool _1437 = _1431 <= 8000.0;
    bool _1439 = isnan(_1431);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan(8000.0);
    bool _1445 = _1441 || _1443;
    float _1447 = float(_1445);
    float _1449 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1451 = exp2(_1449);
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1455 = precise::clamp(_1453, 0.0, 1.0);
    float _1457 = _1411 + _1256;
    float _1459 = fma(_1455, -2.0, 3.0);
    float _1461 = _1455 * _1455;
    float _1463 = _1457 * 0.5;
    float _1465 = _1461 * _1459;
    float _1467 = in.m_71.x;
    float _1469 = -_1465;
    float _1471 = _1469 + 1.0;
    out.m_73.z = _1463;
    out.m_73.w = _1256;
    float _1473 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1465);
    float _1475 = _1447 * _1473;
    out.gl_Position.x = _1308;
    out.gl_Position.y = _1328;
    out.gl_Position.z = _1411;
    out.gl_Position.w = _1256;
    float _1477 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1479 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1481 = _1328;
    float _1483 = _1308;
    if (!_1387)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1485 = _1481;
    float _1487 = _1485;
    float _1489 = _1485;
    if (!_1387)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1491 = _1483;
    float _1493 = -_1314;
    float _1495 = _1493 + 1.0;
    float _1497 = _1495 * _1477;
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = -_1499;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1505 = _1503 * _1467;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1509 = _1505;
    float _1511 = _1491;
    float _1513 = _1491;
    if (!_1387)
    {
        _1509 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1515 = _1509;
    out.m_75.x = _1507;
    float _1517 = _1479 * _1350;
    float _1519 = -_1479;
    float _1521 = _1519 + 1.0;
    float _1523 = _1361 * _1517;
    float _1525 = _1371 * _1517;
    float _1527 = _1361 * _1521;
    float _1529 = fma(_1367, _1523, _1355);
    float _1531 = fma(_1369, _1523, _1357);
    float _1533 = fma(_1361, _1525, _1359);
    out.m_77.x = _1529;
    out.m_77.y = _1531;
    out.m_77.z = _1533;
    out.m_77.w = _1527;
    bool _1535 = !_1387;
    float _1537 = _1515;
    float _1539 = _1515;
    if (!_1535)
    {
        bool _1541 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1543 = isnan(_1044);
        bool _1545 = _1541 || _1543;
        bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1549 = _1545 || _1547;
        if (!_1549)
        {
            float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1553 = _1044 + _1551;
            float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1557 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1555;
            float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1561 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1565 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1567 = 1.0 / _1557;
            float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1571 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1573 = _1553 * _1567;
            float _1575 = precise::clamp(_1573, 0.0, 1.0);
            float _1577 = fma(_1575, _1561, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1579 = fma(_1575, _1565, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1581 = fma(_1575, _1571, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1513 = _1579;
            _1489 = _1577;
            _1539 = _1581;
            _1583 = true;
        }
        else
        {
            bool _1585 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1587 = isnan(_1044);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                _1487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1595 = _1487;
            _1489 = _1595;
            if (!_1593)
            {
                _1511 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1597 = _1511;
            _1513 = _1597;
            if (!_1593)
            {
                _1537 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1599 = _1537;
            bool _1601 = !_1593;
            _1539 = _1599;
            if (!_1601)
            {
                bool _1603 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1605 = isnan(_1044);
                bool _1607 = _1603 || _1605;
                bool _1609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1611 = _1607 || _1609;
                if (!_1611)
                {
                    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1615 = _1044 + _1613;
                    float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1619 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1617;
                    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1627 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1629 = 1.0 / _1619;
                    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1635 = _1615 * _1629;
                    float _1637 = precise::clamp(_1635, 0.0, 1.0);
                    float _1639 = fma(_1637, _1623, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1641 = fma(_1637, _1627, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1643 = fma(_1637, _1633, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1513 = _1641;
                    _1489 = _1639;
                    _1539 = _1643;
                    _1583 = true;
                }
                else
                {
                    _1513 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1539 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1583 = false;
    float _1645 = _1513;
    float _1647 = _1489;
    float _1649 = _1539;
    float _1651 = _1645 * 0.586610972881317138671875;
    bool _1653 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_79.x = 0.0;
    float _1655 = fma(_1647, 0.298911988735198974609375, _1651);
    float _1657 = fma(_1649, 0.114477999508380889892578125, _1655);
    float _1659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_51.x = 1.0;
    float _1661 = -_1657;
    float _1663 = _1661 + _1647;
    float _1665 = -_1657;
    float _1667 = _1665 + _1645;
    float _1669 = -_1657;
    float _1671 = _1669 + _1649;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1675 = fma(_1667, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1677 = fma(_1671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    out.m_75.w = _1659;
    out.m_81.x = _1673;
    out.m_81.y = _1675;
    out.m_81.z = _1677;
    if (!_1653)
    {
        return out;
    }
    float _1679 = -_1014;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1683 = -_1020;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1687 = -_1026;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = sqrt(_1695);
    float _1699 = rsqrt(_1695);
    float _1701 = -_1697;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1705 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1707 = precise::clamp(_1705, 0.0, 1.0);
    float _1709 = _1685 * _1699;
    float _1711 = _1681 * _1699;
    float _1713 = abs(_1707);
    float _1715 = log2(_1713);
    float _1717 = _1689 * _1699;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1721 = _894 * _1711;
    float _1723 = -_1711;
    float _1725 = -_1719;
    float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1725);
    float _1729 = fma(_892, _1709, _1721);
    float _1731 = -_1717;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1727);
    float _1735 = fma(_922, _1717, _1729);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1741 = _1733 + _1739;
    float _1743 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = exp2(_1743);
    float _1751 = _1749 * _1747;
    float _1753 = _1737 * _1751;
    float _1755 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1757 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1759 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _1755;
    out.m_79.y = _1757;
    out.m_79.z = _1759;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    bool _974 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_48.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_51.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1816 = as_type<float>(_116);
        out.gl_Position.z = _1816;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_53.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1885 = as_type<float>(_152);
        out.gl_Position.z = _1885;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _164 = _156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _168 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _162);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _166);
    float _174 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _168);
    float _176 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _172);
    bool _180 = !_160;
    float _198;
    if (!_180)
    {
        float _182 = in.m_57.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_100);
        float _204 = 1.0 / _202;
        float _206 = _134 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _208 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = _208 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = 1.0 / _220;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _236;
    bool _240 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_208);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = 1.0 / _228;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _208 + _254;
    float _258 = 1.0 / _232;
    float _260 = _212 * _234;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _208 + _262;
    float _266 = 1.0 / _224;
    float _268 = _216 * _252;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = fma(_272, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = fma(_276, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = _264 * _258;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _288 = _176 * _176;
    float _290 = 1.0 / _238;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _300 = fma(_174, _174, _288);
    bool _302 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_208);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = _256 * _266;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = fma(_178, _178, _300);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = _208 + _322;
    bool _326 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_208);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = fma(_318, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _340 = rsqrt(_320);
    bool _342 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _344 = isnan(_208);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_294, _314, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _356 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_208);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_336;
    float _370 = _368 + 1.0;
    float _372 = _324 * _290;
    float _374 = -_352;
    float _376 = _374 + 1.0;
    bool _378 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _380 = isnan(_208);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -_312;
    float _392 = _390 + 1.0;
    float _394 = -_250;
    float _396 = _394 + 1.0;
    float _398 = _366 * _376;
    float _400 = -_366;
    float _402 = _400 + 1.0;
    float _404 = _250 * _370;
    float _406 = _336 * _392;
    float _408 = _388 * _396;
    float _410 = fma(_286, _314, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_298, _314, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _414 = _312 * _402;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _416;
    float _420 = _176 * _340;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = _278 * _408;
    float _432 = fma(_418, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _434 = _174 * _340;
    float _436 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_428, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = _338 * _408;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _448 = _178 * _340;
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].y, _436);
    float _452 = _280 * _408;
    float _454 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _456 = -_388;
    float _458 = _456 + 1.0;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].y, _450);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _472 = fma(_464, _282, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = abs(_460);
    bool _476 = _474 > 0.99989998340606689453125;
    float _478 = fma(_468, _282, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _480 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _482 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _484 = fma(_354, _404, _470);
    float _486 = fma(_410, _404, _480);
    float _488 = fma(_412, _404, _482);
    float _490 = fma(_432, _406, _484);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _492;
    float _496 = fma(_440, _406, _488);
    float _498 = _404;
    float _500 = _482;
    float _502 = _438;
    float _504 = _454;
    if (_476)
    {
        _498 = 0.001000000047497451305389404296875;
    }
    float _506 = _498;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    if (!_476)
    {
        _500 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _512 = _500;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _514;
    float _518 = fma(_454, _414, _490);
    float _520 = _512;
    if (_476)
    {
        float _522 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _520 = _522;
    }
    float _524 = _520;
    float _526 = fma(_438, _406, _486);
    float _528 = fma(_510, _372, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _530 = fma(_494, _372, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _532 = fma(_516, _372, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    if (!_476)
    {
        _502 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _534 = _502;
    float _536 = in.m_59.x;
    float _538 = in.m_59.y;
    float _540 = in.m_59.z;
    float _542 = _534;
    if (_476)
    {
        float _544 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _542 = _544;
    }
    float _546 = _542;
    float _548 = -_524;
    float _550 = _448 * _548;
    if (!_476)
    {
        _504 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _552 = _504;
    float _554 = _552;
    if (_476)
    {
        float _556 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _554 = _556;
    }
    float _558 = _554;
    float _560 = fma(_528, _398, _518);
    float _562 = in.m_61.x;
    float _564 = in.m_61.y;
    float _566 = in.m_61.z;
    float _568 = -_546;
    float _570 = _420 * _568;
    float _572 = -_546;
    float _574 = -_550;
    float _576 = fma(_434, _572, _574);
    float _578 = fma(_472, _414, _526);
    float _580 = fma(_478, _414, _496);
    float _582 = -_558;
    float _584 = _434 * _582;
    float _586 = -_558;
    float _588 = -_570;
    float _590 = fma(_448, _586, _588);
    float _592 = _576 * _576;
    float _594 = in.m_48.x;
    float _596 = in.m_48.y;
    float _598 = in.m_48.z;
    float _600 = -_524;
    float _602 = -_584;
    float _604 = fma(_420, _600, _602);
    float _606 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].x, _560);
    float _608 = fma(_590, _590, _592);
    float _610 = fma(_530, _398, _578);
    float _612 = fma(_532, _398, _580);
    float _614 = fma(_604, _604, _608);
    float _616 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].y, _610);
    float _618 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[148].z, _612);
    float _620 = _606 * _536;
    float _622 = _616 * _538;
    float _624 = rsqrt(_614);
    float _626 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _628 = _618 * _540;
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _562);
    float _632 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _566);
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _638 = _626 * _630;
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    bool _642 = _564 != 0.0;
    bool _644 = isnan(_564);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = _636 * _634;
    float _654 = _596 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _656 = _596 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = _632 * _640;
    float _660 = _596 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _662 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].x, _654);
    float _664 = _576 * _624;
    float _666 = _604 * _624;
    float _668 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _670 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[4].z, _662);
    float _672 = _590 * _624;
    float _674 = _658 * _434;
    float _676 = _658 * _448;
    float _678 = _420 * _666;
    float _680 = _434 * _664;
    float _682 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _684 = fma(_638, _672, _674);
    float _686 = fma(_638, _666, _676);
    float _688 = -_678;
    float _690 = fma(_448, _664, _688);
    float _692 = -_680;
    float _694 = fma(_420, _672, _692);
    float _696 = _670 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = _682 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = fma(_652, _690, _684);
    float _702 = fma(_652, _694, _686);
    float _704 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].x, _660);
    bool _706 = _562 == 0.0;
    bool _708 = !_650;
    bool _710 = _706 && _708;
    float _712 = _696 + _700;
    float _714 = _698 + _702;
    float _716 = _658 * _420;
    float _718 = in.m_63.x;
    float _720 = in.m_63.y;
    float _722 = in.m_63.z;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _726 = _712 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _730 = _714 + _728;
    float _732 = _448 * _672;
    bool _734 = _566 == 0.0;
    bool _736 = _734 && _710;
    float _738 = _726 * _726;
    float _740 = _730 * _730;
    float _742 = fma(_638, _664, _716);
    float _744 = -_732;
    float _746 = fma(_434, _666, _744);
    float _748 = fma(_598, (*spvDescriptorSet0.vp_c10)._m0[5].z, _704);
    float _750 = _738 + _740;
    float _752 = fma(_652, _746, _742);
    float _754 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _756 = sqrt(_750);
    float _758 = _754 + _752;
    float _760 = _718;
    float _762 = _720;
    float _764 = _722;
    float _766 = _598;
    float _768 = _564;
    float _770 = _562;
    float _772 = _752;
    float _774 = _712;
    float _776 = _746;
    if (!_736)
    {
        float _778 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _718);
        _760 = _778;
    }
    float _780 = _760;
    if (!_736)
    {
        float _782 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _720);
        _762 = _782;
    }
    float _784 = _762;
    if (!_736)
    {
        float _786 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _722);
        _764 = _786;
    }
    float _788 = _764;
    bool _790 = _756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_790)
    {
        _766 = _712;
    }
    float _792 = _766;
    float _794 = _792;
    if (!_790)
    {
        _768 = _740;
    }
    float _796 = _768;
    float _798 = _796;
    if (!_790)
    {
        _770 = _738;
    }
    float _800 = _770;
    float _802 = _800;
    if (!_790)
    {
        _772 = _714;
    }
    float _804 = _772;
    float _806 = _804;
    if (!_790)
    {
        _774 = _758;
    }
    float _808 = _774;
    bool _810 = !_790;
    float _812 = _808;
    if (!_810)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _818 = _756 + _816;
        float _820 = rsqrt(_750);
        float _822 = _818 * _814;
        float _824 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = _822 * 0.15915493667125701904296875;
        float _828 = _826 * 6.283185482025146484375;
        float _830 = sin(_828);
        float _832 = _826 * 6.283185482025146484375;
        float _834 = cos(_832);
        float _836 = fma(_830, _824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _838 = _820 * _836;
        float _840 = _834 + (-1.0);
        float _842 = fma(_726, _838, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _844 = fma(_730, _838, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _846 = _840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _850 = _842 + _848;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _854 = _844 + _852;
        float _856 = fma(_758, _834, _846);
        float _858 = _850 * _850;
        float _860 = _854 * _854;
        _812 = _856;
        _802 = _858;
        _798 = _860;
        _794 = _842;
        _806 = _844;
    }
    float _862 = _812;
    float _864 = _802;
    float _866 = _798;
    float _868 = _794;
    float _870 = _806;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _874 = _862 + _872;
    float _876 = _434 * _784;
    float _878 = _420 * _784;
    float _880 = _448 * _784;
    float _882 = fma(_874, _874, _864);
    float _884 = fma(_672, _780, _876);
    float _886 = fma(_664, _780, _878);
    float _888 = fma(_666, _780, _880);
    float _890 = _882 + _866;
    float _892 = fma(_690, _788, _884);
    float _894 = fma(_746, _788, _886);
    float _896 = sqrt(_890);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _912 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = fma(_694, _788, _888);
    out.m_65.x = _908;
    out.m_65.y = _912;
    out.m_65.z = _914;
    bool _924 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _926 = isnan(_896);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _932 = _928 || _930;
    out.m_67.x = _916;
    out.m_67.y = _918;
    out.m_67.z = _920;
    out.m_69.x = _892;
    out.m_69.y = _894;
    out.m_69.z = _922;
    float _934 = _876;
    float _936 = _914;
    float _938 = _908;
    if (!_932)
    {
        _934 = 1.0;
    }
    float _940 = _934;
    bool _942 = !_932;
    float _944 = _940;
    if (!_942)
    {
        bool _946 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _948 = isnan(_896);
        bool _950 = _946 || _948;
        bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _954 = _950 || _952;
        if (!_954)
        {
            float _956 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _958 = _896 + _956;
            float _960 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _962 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _960;
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _966 = _964 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _968 = 1.0 / _962;
            float _970 = _958 * _968;
            float _972 = fma(_970, _966, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _944 = _972;
            _974 = true;
        }
        else
        {
            bool _976 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _978 = isnan(_896);
            bool _980 = _976 || _978;
            bool _982 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _984 = _980 || _982;
            if (!_984)
            {
                float _986 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _988 = _896 + _986;
                float _990 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _992 = _990 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _996 = _994 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _998 = 1.0 / _992;
                float _1000 = _988 * _998;
                float _1002 = fma(_1000, _996, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _944 = _1002;
                _974 = true;
            }
            else
            {
                _944 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _974 = false;
    float _1004 = _944;
    float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1008 = _862 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1012 = _868 + _1010;
    float _1014 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1018 = _870 + _1016;
    float _1020 = fma(_1012, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _1014 + _1022;
    float _1026 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1030 = _1020 + _1028;
    float _1032 = _1024 * _1024;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1036 = _1026 + _1034;
    float _1038 = fma(_1030, _1030, _1032);
    float _1040 = fma(_1036, _1036, _1038);
    float _1042 = rsqrt(_1040);
    float _1044 = sqrt(_1040);
    float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1048 = _1030 * _1046;
    float _1050 = _1036 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 * _1050;
    float _1056 = _1052 + _1054;
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1058 + _1062;
    float _1066 = _1042;
    float _1068 = _1056;
    float _1070 = _1064;
    float _1072 = _1024;
    if (_1060)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1074;
    }
    float _1076 = _1066;
    if (_1060)
    {
        float _1078 = rsqrt(_1056);
        _1068 = _1078;
    }
    float _1080 = _1068;
    if (_1060)
    {
        float _1082 = _1064 * _1076;
        _1070 = _1082;
    }
    float _1084 = _1070;
    if (_1060)
    {
        float _1086 = _1084 * 0.15915493667125701904296875;
        _936 = _1086;
    }
    float _1088 = _936;
    float _1090 = _1076;
    if (_1060)
    {
        float _1092 = _1088 * 6.283185482025146484375;
        float _1094 = sin(_1092);
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1100 = precise::max(0.0, _1098);
    float _1102 = _1036;
    float _1104 = _1100;
    if (_1060)
    {
        float _1106 = _1088 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        _1102 = _1108;
    }
    float _1110 = _1102;
    float _1112 = -_1046;
    float _1114 = -_1100;
    float _1116 = fma(_1024, _1112, _1114);
    float _1118 = _1116;
    if (_1060)
    {
        float _1120 = _1116 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1120;
    }
    float _1122 = _1104;
    float _1124 = _1096;
    float _1126 = _1122;
    if (_1060)
    {
        float _1128 = fma(_1096, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _938 = _1128;
    }
    float _1130 = _938;
    float _1132 = _1130;
    if (!_1060)
    {
        _1124 = _1048;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    float _1138 = _1110;
    if (_1060)
    {
        float _1140 = _1110 + (-1.0);
        _1126 = _1140;
    }
    float _1142 = _1126;
    float _1144 = _1142;
    if (_1060)
    {
        float _1146 = _1080 * _1130;
        _776 = _1146;
    }
    float _1148 = _776;
    if (!_1060)
    {
        _1132 = _1050;
    }
    float _1150 = _1132;
    float _1152 = _1150;
    if (_1060)
    {
        float _1154 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1154;
    }
    float _1156 = _1072;
    if (_1060)
    {
        float _1158 = _1048 * _1148;
        _1136 = _1158;
    }
    float _1160 = _1136;
    if (!_1060)
    {
        _1144 = _1052;
    }
    float _1162 = _1144;
    float _1164 = _1162;
    if (_1060)
    {
        float _1166 = _1050 * _1148;
        _1152 = _1166;
    }
    float _1168 = _1152;
    if (_1060)
    {
        float _1170 = fma(_1116, _1110, _1156);
        _1118 = _1170;
    }
    float _1172 = _1118;
    if (_1060)
    {
        float _1174 = _1160 * _1160;
        _1164 = _1174;
    }
    float _1176 = _1164;
    if (!_1060)
    {
        _1138 = _1054;
    }
    float _1178 = _1138;
    float _1180 = _1178;
    if (_1060)
    {
        float _1182 = _1168 * _1168;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1172, _1172, _1176);
    float _1188 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1190 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1192 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1194 = _1186 + _1184;
    float _1196 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1198 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1188);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1202 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1200);
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = rsqrt(_1194);
    float _1208 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1196);
    float _1210 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1192);
    float _1212 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1214 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1198);
    float _1216 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1208);
    float _1218 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1210);
    float _1220 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1212);
    float _1222 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1224 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1228 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1220);
    float _1230 = -_1204;
    float _1232 = _1230 + 1.0;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1236 = floor(_1190);
    float _1238 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1240 = _1206 * _1160;
    float _1242 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1234);
    float _1244 = _1206 * _1168;
    float _1246 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1248 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1242);
    float _1250 = _1206 * _1172;
    float _1252 = abs(_1232);
    float _1254 = log2(_1252);
    float _1256 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1248);
    float _1258 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1260 = -_1258;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1260);
    float _1264 = floor(_1246);
    float _1266 = -_1236;
    float _1268 = _1190 + _1266;
    float _1270 = -_1244;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1262);
    float _1274 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1276 = fma(_1272, -0.5, 0.5);
    float _1278 = fma(_1272, 0.5, 0.5);
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1282 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1284 = sqrt(_1276);
    float _1286 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1288 = -_1274;
    float _1290 = fma(_1288, _1280, 1.0);
    float _1292 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1296 = 1.0 / _1256;
    float _1298 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1294);
    float _1300 = -_1264;
    float _1302 = _1246 + _1300;
    float _1304 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1298);
    float _1306 = log2(_1290);
    float _1308 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1304);
    float _1310 = _1284 * 0.636619746685028076171875;
    float _1312 = exp2(_1282);
    float2 _3859 = float2(_1268, _1302);
    float _1314 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3859, float2(0.0), isnan(_3859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3859, float2(0.0), isnan(_3859)), level(0.0)).x;
    float _1316 = _1306 * 0.693147182464599609375;
    float _1318 = fma(_1278, _1292, -0.212114393711090087890625);
    float _1320 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1286);
    float _1322 = fma(_1278, _1318, 1.570728778839111328125);
    float _1324 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1320);
    float _1326 = _1250 + 1.0;
    float _1328 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1330 = _1308 * _1296;
    float _1332 = -_1250;
    float _1334 = fma(_1312, _1326, _1332);
    float _1336 = -_1322;
    float _1338 = fma(_1310, _1336, 1.0);
    float _1340 = _1328 * _1296;
    float _1342 = fma(_1330, 0.5, 0.5);
    float _1344 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1346 = fma(_1334, 0.5, 0.5);
    float _1348 = fma(_1340, -0.5, 0.5);
    float3 _3925 = float3(_1342, _1348, _1344);
    float _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3925, float3(0.0), isnan(_3925)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3925, float3(0.0), isnan(_3925)), level(0.0)).x;
    float3 _3936 = float3(_1342, _1348, _1344);
    float4 _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3936, float3(0.0), isnan(_3936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3936, float3(0.0), isnan(_3936)), level(0.0)).xyzw;
    float _1355 = _1353.x;
    float _1357 = _1353.y;
    float _1359 = _1353.z;
    float _1361 = _1353.w;
    float2 _3952 = float2(_1338, _1346);
    float3 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3952, float2(0.0), isnan(_3952)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3952, float2(0.0), isnan(_3952)), level(0.0)).xyz;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1375 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1379 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1381 = isnan(_1044);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1387 = _1383 || _1385;
    float _1389 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1373);
    float _1391 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1393 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1395 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1377);
    float _1397 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1399 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1391);
    float _1401 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1395);
    float _1403 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1405 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = exp2(_1393);
    float _1409 = _1405 + _1403;
    float _1411 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1401);
    float _1413 = 1.0 / _1403;
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = _1409 * _1413;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    float _1427 = 1.0 / _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1431 = _1427 * _1429;
    float _1433 = abs(_1431);
    float _1435 = log2(_1433);
    bool _1437 = _1431 <= 8000.0;
    bool _1439 = isnan(_1431);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan(8000.0);
    bool _1445 = _1441 || _1443;
    float _1447 = float(_1445);
    float _1449 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1451 = exp2(_1449);
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1455 = precise::clamp(_1453, 0.0, 1.0);
    float _1457 = _1411 + _1256;
    float _1459 = fma(_1455, -2.0, 3.0);
    float _1461 = _1455 * _1455;
    float _1463 = _1457 * 0.5;
    float _1465 = _1461 * _1459;
    float _1467 = in.m_71.x;
    float _1469 = -_1465;
    float _1471 = _1469 + 1.0;
    out.m_73.z = _1463;
    out.m_73.w = _1256;
    float _1473 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1465);
    float _1475 = _1447 * _1473;
    out.gl_Position.x = _1308;
    out.gl_Position.y = _1328;
    out.gl_Position.z = _1411;
    out.gl_Position.w = _1256;
    float _1477 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1479 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1481 = _1328;
    float _1483 = _1308;
    if (!_1387)
    {
        _1481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1485 = _1481;
    float _1487 = _1485;
    float _1489 = _1485;
    if (!_1387)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1491 = _1483;
    float _1493 = -_1314;
    float _1495 = _1493 + 1.0;
    float _1497 = _1495 * _1477;
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = -_1499;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1505 = _1503 * _1467;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1509 = _1505;
    float _1511 = _1491;
    float _1513 = _1491;
    if (!_1387)
    {
        _1509 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1515 = _1509;
    out.m_75.x = _1507;
    float _1517 = _1479 * _1350;
    float _1519 = -_1479;
    float _1521 = _1519 + 1.0;
    float _1523 = _1361 * _1517;
    float _1525 = _1371 * _1517;
    float _1527 = _1361 * _1521;
    float _1529 = fma(_1367, _1523, _1355);
    float _1531 = fma(_1369, _1523, _1357);
    float _1533 = fma(_1361, _1525, _1359);
    out.m_77.x = _1529;
    out.m_77.y = _1531;
    out.m_77.z = _1533;
    out.m_77.w = _1527;
    bool _1535 = !_1387;
    float _1537 = _1515;
    float _1539 = _1515;
    if (!_1535)
    {
        bool _1541 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1543 = isnan(_1044);
        bool _1545 = _1541 || _1543;
        bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1549 = _1545 || _1547;
        if (!_1549)
        {
            float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1553 = _1044 + _1551;
            float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1557 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1555;
            float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1561 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1565 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1567 = 1.0 / _1557;
            float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1571 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1573 = _1553 * _1567;
            float _1575 = precise::clamp(_1573, 0.0, 1.0);
            float _1577 = fma(_1575, _1561, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1579 = fma(_1575, _1565, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1581 = fma(_1575, _1571, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1513 = _1579;
            _1489 = _1577;
            _1539 = _1581;
            _1583 = true;
        }
        else
        {
            bool _1585 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1587 = isnan(_1044);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                _1487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1595 = _1487;
            _1489 = _1595;
            if (!_1593)
            {
                _1511 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1597 = _1511;
            _1513 = _1597;
            if (!_1593)
            {
                _1537 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1599 = _1537;
            bool _1601 = !_1593;
            _1539 = _1599;
            if (!_1601)
            {
                bool _1603 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1605 = isnan(_1044);
                bool _1607 = _1603 || _1605;
                bool _1609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1611 = _1607 || _1609;
                if (!_1611)
                {
                    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1615 = _1044 + _1613;
                    float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1619 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1617;
                    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1627 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1629 = 1.0 / _1619;
                    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1635 = _1615 * _1629;
                    float _1637 = precise::clamp(_1635, 0.0, 1.0);
                    float _1639 = fma(_1637, _1623, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1641 = fma(_1637, _1627, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1643 = fma(_1637, _1633, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1513 = _1641;
                    _1489 = _1639;
                    _1539 = _1643;
                    _1583 = true;
                }
                else
                {
                    _1513 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1539 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1583 = false;
    float _1645 = _1513;
    float _1647 = _1489;
    float _1649 = _1539;
    float _1651 = _1645 * 0.586610972881317138671875;
    bool _1653 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_79.x = 0.0;
    float _1655 = fma(_1647, 0.298911988735198974609375, _1651);
    float _1657 = fma(_1649, 0.114477999508380889892578125, _1655);
    float _1659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_51.x = 1.0;
    float _1661 = -_1657;
    float _1663 = _1661 + _1647;
    float _1665 = -_1657;
    float _1667 = _1665 + _1645;
    float _1669 = -_1657;
    float _1671 = _1669 + _1649;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1675 = fma(_1667, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1677 = fma(_1671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    out.m_75.w = _1659;
    out.m_81.x = _1673;
    out.m_81.y = _1675;
    out.m_81.z = _1677;
    if (!_1653)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1679 = -_1014;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1683 = -_1020;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1687 = -_1026;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = sqrt(_1695);
    float _1699 = rsqrt(_1695);
    float _1701 = -_1697;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1705 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1707 = precise::clamp(_1705, 0.0, 1.0);
    float _1709 = _1685 * _1699;
    float _1711 = _1681 * _1699;
    float _1713 = abs(_1707);
    float _1715 = log2(_1713);
    float _1717 = _1689 * _1699;
    float _1719 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1721 = _894 * _1711;
    float _1723 = -_1711;
    float _1725 = -_1719;
    float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1725);
    float _1729 = fma(_892, _1709, _1721);
    float _1731 = -_1717;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1727);
    float _1735 = fma(_922, _1717, _1729);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1741 = _1733 + _1739;
    float _1743 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = exp2(_1743);
    float _1751 = _1749 * _1747;
    float _1753 = _1737 * _1751;
    float _1755 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1757 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1759 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _1755;
    out.m_79.y = _1757;
    out.m_79.z = _1759;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

