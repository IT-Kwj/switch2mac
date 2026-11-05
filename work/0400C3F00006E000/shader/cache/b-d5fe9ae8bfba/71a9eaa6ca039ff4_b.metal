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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1806 = false;
    bool _918 = false;
    bool _750 = false;
    bool _624 = false;
    bool _474 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2492 = as_type<float>(_104);
        out.gl_Position.z = _2492;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    float _128 = 0.0;
    if (_118)
    {
        float _130 = float(_88);
        _124 = _130;
    }
    float _132 = _124;
    bool _134 = _122 >= _132;
    bool _136 = !_118;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2562 = as_type<float>(_144);
        out.gl_Position.z = _2562;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154;
    if (!_164)
    {
        float _168 = _154 * _154;
        float _170 = _168 * 0.5;
        _146 = _170;
    }
    float _172 = _146;
    float _174 = 0.0;
    float _176 = _172;
    if (!_164)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_164)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_164;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _154 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _154);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _126 = _210;
        _190 = _220;
        _128 = _208;
    }
    float _222 = _126;
    float _224 = _190;
    float _226 = _128;
    bool _228 = !_164;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _154 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _166 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _166;
    float _260 = _256;
    float _262 = _254;
    if (!_164)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _122 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _122);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_164;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _122 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_258, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_258, _148, _336);
    float _346 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_258, _152, _346);
    float _358 = fma(_332, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _398 = sqrt(_382);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_356, _366, _390);
    float _418 = _384;
    float _420 = _366;
    float _422 = _338;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _396;
    }
    float _428 = _420;
    float _430 = _428;
    if (_410)
    {
        _422 = _400;
    }
    float _432 = _422;
    float _434 = _432;
    if (!_410)
    {
        bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _438 = !_436;
        if (!_438)
        {
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _442 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _450);
            float _458 = _452 * _452;
            float _460 = fma(_454, _454, _458);
            float _462 = fma(_456, _456, _460);
            float _464 = rsqrt(_462);
            float _466 = _464 * 9.9999999747524270787835121154785e-07;
            float _468 = _454 * _466;
            float _470 = _452 * _466;
            float _472 = _456 * _466;
            _430 = _470;
            _426 = _468;
            _434 = _472;
            _474 = true;
        }
        else
        {
            float _476 = _150 * _150;
            float _478 = fma(_148, _148, _476);
            float _480 = fma(_152, _152, _478);
            float _482 = sqrt(_480);
            bool _484 = _482 >= 9.9999999747524270787835121154785e-07;
            bool _486 = isnan(_482);
            bool _488 = _484 || _486;
            bool _490 = isnan(9.9999999747524270787835121154785e-07);
            bool _492 = _488 || _490;
            if (!_492)
            {
                float _494 = _388 * _388;
                float _496 = fma(_386, _386, _494);
                float _498 = fma(_390, _390, _496);
                float _500 = sqrt(_498);
                bool _502 = _500 >= 9.9999999747524270787835121154785e-07;
                bool _504 = isnan(_500);
                bool _506 = _502 || _504;
                bool _508 = isnan(9.9999999747524270787835121154785e-07);
                bool _510 = _506 || _508;
                if (!_510)
                {
                    float _512 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _514 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _512);
                    float _516 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _514);
                    float _518 = rsqrt(_516);
                    float _520 = _518 * 9.9999999747524270787835121154785e-07;
                    float _522 = _520 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _520 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _520 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _524;
                    _426 = _522;
                    _434 = _526;
                    _474 = true;
                }
                else
                {
                    float _528 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _532 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _534 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _528);
                    float _536 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _530);
                    float _538 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _532);
                    float _540 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _534);
                    float _542 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _536);
                    float _544 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _538);
                    float _546 = _540 * _540;
                    float _548 = fma(_542, _542, _546);
                    float _550 = fma(_544, _544, _548);
                    float _552 = rsqrt(_550);
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    float _556 = _542 * _554;
                    float _558 = _540 * _554;
                    float _560 = _544 * _554;
                    _430 = _558;
                    _426 = _556;
                    _434 = _560;
                    _474 = true;
                }
            }
            else
            {
                float _562 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _564 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _566 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _562);
                float _570 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _564);
                float _572 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _566);
                float _574 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _568);
                float _576 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _570);
                float _578 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _572);
                float _580 = _574 * _574;
                float _582 = fma(_576, _576, _580);
                float _584 = fma(_578, _578, _582);
                float _586 = rsqrt(_584);
                float _588 = _586 * 9.9999999747524270787835121154785e-07;
                float _590 = _576 * _588;
                float _592 = _574 * _588;
                float _594 = _578 * _588;
                _430 = _592;
                _426 = _590;
                _434 = _594;
            }
        }
    }
    _474 = false;
    float _596 = _430;
    float _598 = _426;
    float _600 = _434;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _604 = !_602;
    float _622;
    if (!_604)
    {
        float _606 = in.m_53.x;
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _610 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_88);
        float _628 = 1.0 / _626;
        float _630 = _122 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _632 + _634;
    bool _638 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _640 = isnan(_632);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _650;
    float _654 = -_648;
    float _656 = _654 + 1.0;
    bool _658 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_632);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = 1.0 / _652;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _682 = _668 * _656;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _636 * _670;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _690;
    float _694 = in.m_51.x;
    float _696 = in.m_51.y;
    float _698 = in.m_51.z;
    float _700 = fma(_674, _688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _702 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _704 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _706 = _700 * _682;
    float _708 = _702 * _682;
    float _710 = _704 * _682;
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].x, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].y, _708);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].z, _710);
    float _718 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].x, _712);
    float _720 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].y, _714);
    float _722 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].z, _716);
    float _724 = _718 * _694;
    float _726 = _720 * _696;
    float _728 = _722 * _698;
    bool _730 = !_680;
    float _748;
    if (!_730)
    {
        float _732 = in.m_53.x;
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _736 = _732 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _740 = _738 * _734;
        float _742 = floor(_740);
        float _744 = -_742;
        float _746 = _740 + _744;
        _748 = _746;
        _750 = true;
    }
    else
    {
        float _752 = float(_88);
        float _754 = 1.0 / _752;
        float _756 = _122 * _754;
        _748 = _756;
    }
    _750 = false;
    float _758 = _748;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _762 = _758 + _760;
    bool _764 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _766 = isnan(_758);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _778 = _758 + _776;
    bool _780 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _782 = isnan(_758);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _800 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _802 = isnan(_758);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = 1.0 / _798;
    float _814 = -_810;
    float _816 = _814 + 1.0;
    bool _818 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _820 = _790 * _816;
    float _822 = -_790;
    float _824 = _822 + 1.0;
    float _826 = 1.0 / _794;
    float _828 = _778 * _812;
    float _830 = _762 * _826;
    float _832 = -_774;
    float _834 = _832 + 1.0;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _836;
    float _840 = _810 * _834;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _846;
    float _850 = fma(_838, _830, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _852 = fma(_844, _830, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _854 = fma(_848, _830, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _856 = _850 * _820;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _862 = _852 * _820;
    float _864 = _854 * _820;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _874 = fma(_860, _828, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _876 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].x, _862);
    float _878 = fma(_868, _828, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _880 = fma(_872, _828, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].y, _856);
    float _884 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].z, _864);
    float _886 = fma(_878, _840, _876);
    float _888 = fma(_874, _840, _882);
    float _890 = fma(_880, _840, _884);
    float _892 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].x, _886);
    float _894 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].y, _888);
    float _896 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].z, _890);
    bool _898 = !_818;
    float _916;
    if (!_898)
    {
        float _900 = in.m_53.x;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _904 = _900 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _908 = _906 * _902;
        float _910 = floor(_908);
        float _912 = -_910;
        float _914 = _908 + _912;
        _916 = _914;
        _918 = true;
    }
    else
    {
        float _920 = float(_88);
        float _922 = 1.0 / _920;
        float _924 = _122 * _922;
        _916 = _924;
    }
    _918 = false;
    float _926 = _916;
    float _928 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _930 = _596 * _596;
    float _932 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _934 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _936 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _928);
    float _938 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _940 = fma(_598, _598, _930);
    float _942 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _932);
    float _944 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _938);
    float _946 = fma(_600, _600, _940);
    float _948 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _950 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _934);
    float _952 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _954 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _948);
    float _956 = rsqrt(_946);
    float _958 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _944);
    float _960 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _936);
    float _962 = _952 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _964 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _950);
    float _966 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _954);
    float _968 = _960 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _962 + _970;
    float _974 = _964 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _968 + _976;
    float _980 = _972 * _972;
    float _982 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _974 + _984;
    float _988 = fma(_978, _978, _980);
    float _990 = _956 * _596;
    float _992 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _982);
    float _994 = _956 * _598;
    float _996 = fma(_986, _986, _988);
    float _998 = _990 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1000 = sqrt(_958);
    float _1002 = _956 * _600;
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[8].y, _998);
    float _1006 = in.m_53.y;
    float _1008 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1004);
    float _1012 = sqrt(_966);
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _992);
    float _1016 = in.m_53.w;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = abs(_1010);
    bool _1026 = _1024 > 0.99989998340606689453125;
    float _1028 = in.m_55.z;
    float _1030 = rsqrt(_996);
    float _1032 = fma(_1000, _1000, _1014);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1036 = _1034 != 0;
    float _1038 = in.m_55.x;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1046 = _1044 != 0;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _1050 = fma(_1012, _1012, _1032);
    float _1052 = 0.0;
    float _1054 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1056 = _1014;
    bool _1058 = _1026;
    if (_1026)
    {
        _1052 = 0.001000000047497451305389404296875;
    }
    float _1060 = _1052;
    float _1062 = 0.0;
    if (!_1026)
    {
        _1062 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (_1026)
    {
        float _1068 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = _972 * _1030;
    float _1074 = _978 * _1030;
    float _1076 = sqrt(_1050);
    float _1078 = -_1072;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _972);
    float _1082 = -_1074;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1090 = _1048 * _596;
    float _1092 = _1090 * 8.0;
    float _1094 = _1048 * _598;
    float _1096 = _1094 * 8.0;
    float _1098 = _1048 * _600;
    float _1100 = _1098 * 8.0;
    float _1102 = _1080 * _1080;
    if (!_1026)
    {
        _1054 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1104 = _1054;
    float _1106 = _1104;
    if (_1026)
    {
        float _1108 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = -_1070;
    float _1114 = _1002 * _1112;
    float _1116 = fma(_1084, _1084, _1102);
    float _1118 = _986 * _1030;
    float _1120 = sqrt(_1014);
    float _1122 = -_1110;
    float _1124 = -_1114;
    float _1126 = fma(_994, _1122, _1124);
    float _1128 = -_1110;
    float _1130 = _990 * _1128;
    float _1132 = -_1118;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    bool _1136 = _1006 > 0.5;
    float _1138 = _1096 * _1096;
    bool _1140 = _1016 > 0.5;
    float _1142 = fma(_1134, _1134, _1116);
    float _1144 = 1.0 / _1088;
    bool _1146 = _1140;
    if (!_1026)
    {
        _1056 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1148 = _1056;
    float _1150 = _1148;
    if (_1026)
    {
        float _1152 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = _1076 + 9.9999997473787516355514526367188e-06;
    float _1158 = fma(_1100, _1100, _1138);
    float _1160 = -_1154;
    float _1162 = _994 * _1160;
    float _1164 = -_1154;
    float _1166 = -_1130;
    float _1168 = fma(_1002, _1164, _1166);
    float _1170 = _1126 * _1126;
    float _1172 = sqrt(_1142);
    float _1174 = -_1070;
    float _1176 = -_1162;
    float _1178 = fma(_990, _1174, _1176);
    float _1180 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1182 = precise::clamp(_1180, 0.0, 1.0);
    float _1184 = fma(_1168, _1168, _1170);
    float _1186 = _1120 * 0.800000011920928955078125;
    bool _1188 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1190 = isnan(_926);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = fma(_1182, -0.64999997615814208984375, 1.0);
    float _1202 = fma(_1178, _1178, _1184);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1204;
    float _1208 = sqrt(_1158);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1214 = _1206 * _1144;
    float _1216 = _1120 * (-0.4000000059604644775390625);
    float _1218 = in.m_55.y;
    float _1220 = _1030 * _1172;
    float _1222 = 1.0 / _1156;
    float _1224 = _1008 * _1220;
    float _1226 = _1022 * _1220;
    float _1228 = rsqrt(_1202);
    float _1230 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1232 = abs(_1092);
    float _1234 = 1.0 / _1232;
    float _1236 = _1222 * _1028;
    float _1238 = 1.0 / _1186;
    float _1240 = _1208 * _1234;
    float _1242 = _1240 * 0.25;
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = fma(_1208, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = _1230 * _1220;
    float _1252 = fma(_1248, -2.0, 3.0);
    float _1254 = _1248 * _1248;
    float _1256 = _1168 * _1228;
    float _1258 = _1126 * _1228;
    float _1260 = fma(_1092, _1092, _1138);
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1264 = _1222 * _1038;
    float _1266 = _1178 * _1228;
    float _1268 = fma(_1100, _1100, _1260);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1218);
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1264);
    float _1274 = _1208 * _1238;
    float _1276 = _1252 * _1254;
    float _1278 = _1250 * _1262;
    float _1280 = _994 * _1258;
    float _1282 = _1226 * _1270;
    float _1284 = _1224 * _1272;
    float _1286 = rsqrt(_1268);
    float _1288 = _990 * _1266;
    float _1290 = -_1280;
    float _1292 = fma(_990, _1256, _1290);
    float _1294 = _1282 * _990;
    float _1296 = _1282 * _1002;
    float _1298 = -_1288;
    float _1300 = fma(_1002, _1258, _1298);
    float _1302 = _1002 * _1256;
    float _1304 = fma(_1284, _1258, _1294);
    float _1306 = _1282 * _994;
    float _1308 = -_1302;
    float _1310 = fma(_994, _1266, _1308);
    float _1312 = fma(_1284, _1266, _1296);
    float _1314 = fma(_1284, _1256, _1306);
    float _1316 = fma(_1278, _1310, _1304);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1322 = _1092 * _1286;
    float _1324 = fma(_1278, _1300, _1314);
    float _1326 = fma(_1244, -2.0, 3.0);
    float _1328 = _1244 * _1244;
    float _1330 = _1096 * _1286;
    float _1332 = _1316 * _1322;
    float _1334 = fma(_1278, _1292, _1312);
    float _1336 = -_1276;
    float _1338 = _1336 + 1.0;
    float _1340 = _1100 * _1286;
    float _1342 = fma(_1324, _1330, _1332);
    float _1344 = in.m_57.y;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1350 = _1274 < 0.5;
    float _1352 = float(_1350);
    float _1354 = fma(_1326, _1328, _1338);
    float _1356 = precise::clamp(_1354, 0.0, 1.0);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1360 = _1276;
    if (_1020)
    {
        float _1362 = in.m_53.x;
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = fma(_1334, _1340, _1342);
    float _1368 = 1.0 / _1320;
    float _1370 = _1326;
    if (_1036)
    {
        float _1372 = in.m_53.z;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = -_1352;
    float _1378 = fma(_1376, _1356, 1.0);
    float _1380 = _1330 * _1366;
    float _1382 = _1226 * _1218;
    float _1384 = fma(_1378, 0.89999997615814208984375, 0.100000001490116119384765625);
    float _1386 = 1.0 / _1348;
    float _1388 = _1340 * _1366;
    float _1390 = -_1380;
    float _1392 = _1324 + _1390;
    bool _1394 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1396 = isnan(_926);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1384 * _1382;
    float _1408 = -_1388;
    float _1410 = _1334 + _1408;
    float _1412 = fma(_1380, _1384, _1392);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1414;
    float _1418 = _1212 * _1368;
    float _1420 = fma(_1388, _1384, _1410);
    float _1422 = _968 + _1412;
    float _1424 = -_1344;
    float _1426 = _1424 + 1.0;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1430 = _926 + _1428;
    float _1432 = _974 + _1420;
    float _1434 = _1344;
    if (_1020)
    {
        bool _1436 = _1364 > 0.5;
        _1058 = _1436;
    }
    bool _1438 = _1058;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1442 = _926 + _1440;
    float _1444 = _1416 * _1386;
    float _1446 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1448 = _1422 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1452 = _1432 + _1450;
    int _1454 = _1140 ? as_type<int>(_1426) : as_type<int>(_1344);
    float _1456 = fma(_1214, _1442, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1458 = fma(_1448, _1200, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1460 = fma(_1452, _1200, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1462 = _1458;
    float _1464 = _1460;
    if (_1036)
    {
        bool _1466 = _1374 > 0.5;
        _1146 = _1466;
    }
    bool _1468 = _1146;
    float _1470 = fma(_1418, _1430, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1474 = _1458 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1478 = _1460 + _1476;
    bool _1480 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1482 = isnan(_926);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    float _1492 = -_1404;
    float _1494 = _1492 + 1.0;
    float _1496 = _1474 * _1474;
    float _1498 = _1478 * _1478;
    float _1500 = _1322 * _1366;
    float _1502 = -_1490;
    float _1504 = _1502 + 1.0;
    float _1506 = _1286 * _1406;
    float _1508 = _1496 + _1498;
    float _1510 = fma(_1378, 0.5, 0.5);
    float _1512 = _1404 * _1504;
    float _1514 = -_1500;
    float _1516 = _1316 + _1514;
    float _1518 = sqrt(_1508);
    float _1520 = in.m_57.x;
    float _1522 = _1506 * _1506;
    float _1524 = _1276 * _1510;
    float _1526 = fma(_1500, _1384, _1516);
    bool _1528 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1530 = isnan(_926);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = _1216 * _1522;
    float _1542 = _1540 * 0.5;
    float _1544 = _1198 * _1494;
    float _1546 = _1524 * _1524;
    float _1548 = _962 + _1526;
    float _1550 = -_1198;
    float _1552 = _1550 + 1.0;
    float _1554 = _1042 ? as_type<float>(_1454) : _1344;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1558 = _926 + _1556;
    float _1560 = fma(_1542, _1546, _1548);
    float _1562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1564 = _1538 * _1552;
    bool _1566 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1570 = _1560 + _1568;
    float _1572 = -_1538;
    float _1574 = _1572 + 1.0;
    float _1576 = _1456 * _1564;
    float _1578 = _1570;
    float _1580 = _1496;
    float _1582 = _1498;
    int _1584 = as_type<int>(_1474);
    int _1586 = as_type<int>(_1470);
    float _1588 = _1512;
    if (_1046)
    {
        float _1590 = _1136 ? _1426 : _1344;
        _1434 = _1590;
    }
    float _1592 = _1434;
    float _1594 = fma(_1570, _1200, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1576);
    float _1600 = fma(_1444, _1558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1602 = _1520;
    if (!_1020)
    {
        _1360 = _1520;
    }
    float _1604 = _1360;
    float _1606 = fma(_1470, _1544, _1598);
    float _1608 = _1604;
    if (!_1566)
    {
        _1578 = _1594;
    }
    float _1610 = _1578;
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1614 = !_1566;
    float _1616 = _1610;
    if (!_1614)
    {
        float _1618 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1622 = _1518 + _1620;
        float _1624 = rsqrt(_1508);
        float _1626 = _1622 * _1618;
        float _1628 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = _1626 * 0.15915493667125701904296875;
        float _1632 = _1630 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        float _1636 = _1630 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        float _1640 = fma(_1634, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1642 = _1624 * _1640;
        float _1644 = fma(_1474, _1642, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1646 = _1638 + (-1.0);
        float _1648 = fma(_1478, _1642, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1652 = _1644 + _1650;
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1658 = _1648 + _1656;
        float _1660 = _1652 * _1652;
        float _1662 = fma(_1594, _1638, _1654);
        float _1664 = _1658 * _1658;
        _1616 = _1662;
        _1580 = _1660;
        _1582 = _1664;
        _1462 = _1644;
        _1464 = _1648;
    }
    float _1666 = _1616;
    float _1668 = _1580;
    float _1670 = _1582;
    float _1672 = _1462;
    float _1674 = _1464;
    if (_1020)
    {
        float _1676 = -_1520;
        float _1678 = _1676 + 1.0;
        _1584 = as_type<int>(_1678);
    }
    int _1680 = _1584;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1684 = _1666 + _1682;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1688 = fma(_1600, _1512, _1606);
    if (_1036)
    {
        float _1690 = -_1520;
        float _1692 = _1690 + 1.0;
        _1586 = as_type<int>(_1692);
    }
    int _1694 = _1586;
    float _1696 = fma(_1684, _1684, _1668);
    if (_1020)
    {
        float _1698 = _1438 ? as_type<float>(_1680) : _1520;
        _1608 = _1698;
    }
    float _1700 = _1608;
    float _1702 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1704 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1688);
    float _1706 = _1696 + _1670;
    float _1708 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1712 = _1702 * _1612;
    float _1714 = _1708 * _1596;
    float _1716 = _1712;
    if (_1036)
    {
        float _1718 = _1468 ? as_type<float>(_1694) : _1520;
        _1602 = _1718;
    }
    float _1720 = _1602;
    float _1722 = _1710 * _1562;
    float _1724 = _892 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1726 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1728 = sqrt(_1706);
    float _1730 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1734 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1740 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1734 * _1686;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1750 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1722;
    out.m_59.y = _1714;
    out.m_59.z = _1746;
    out.m_59.w = _1712;
    bool _1756 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1758 = isnan(_1728);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1764 = _1760 || _1762;
    out.m_61.x = _1744;
    out.m_61.y = _1748;
    out.m_61.z = _1750;
    out.m_63.x = _1740;
    out.m_63.y = _1742;
    out.m_63.z = _1752;
    out.m_63.w = _1754;
    out.m_65.x = _1224;
    out.m_65.y = _1226;
    float _1766 = _1736;
    float _1768 = _1740;
    float _1770 = _1742;
    if (!_1764)
    {
        _1766 = 1.0;
    }
    float _1772 = _1766;
    bool _1774 = !_1764;
    float _1776 = _1772;
    if (!_1774)
    {
        bool _1778 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1780 = isnan(_1728);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1786 = _1782 || _1784;
        if (!_1786)
        {
            float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1790 = _1728 + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1794 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1800 = 1.0 / _1794;
            float _1802 = _1790 * _1800;
            float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1776 = _1804;
            _1806 = true;
        }
        else
        {
            bool _1808 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1810 = isnan(_1728);
            bool _1812 = _1808 || _1810;
            bool _1814 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1816 = _1812 || _1814;
            if (!_1816)
            {
                float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1820 = _1728 + _1818;
                float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1824 = _1822 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1826 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1828 = _1826 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1830 = 1.0 / _1824;
                float _1832 = _1820 * _1830;
                float _1834 = fma(_1832, _1828, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1776 = _1834;
                _1806 = true;
            }
            else
            {
                _1776 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1806 = false;
    float _1836 = _1776;
    float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1840 = _1666 + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1844 = _1672 + _1842;
    float _1846 = fma(_1840, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1850 = _1674 + _1848;
    float _1852 = fma(_1844, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1854 = -_1072;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _1858 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1860 = -_1074;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1866 = _1856 + _1864;
    float _1868 = -_1118;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1874 = _1862 + _1872;
    float _1876 = _1866 * _1866;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1880 = _1870 + _1878;
    float _1882 = fma(_1874, _1874, _1876);
    float _1884 = fma(_1880, _1880, _1882);
    float _1886 = rsqrt(_1884);
    float _1888 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1874 * _1888;
    float _1892 = _1880 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1880;
    float _1910 = _1898;
    float _1912 = _1906;
    float _1914 = _1866;
    if (_1902)
    {
        float _1916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1916;
    }
    float _1918 = _1908;
    if (_1902)
    {
        float _1920 = rsqrt(_1898);
        _1910 = _1920;
    }
    float _1922 = _1910;
    if (_1902)
    {
        float _1924 = _1906 * _1918;
        _1912 = _1924;
    }
    float _1926 = _1912;
    if (_1902)
    {
        float _1928 = _1926 * 0.15915493667125701904296875;
        _1768 = _1928;
    }
    float _1930 = _1768;
    float _1932 = _1886;
    if (_1902)
    {
        float _1934 = _1930 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1918;
    float _1946 = _1942;
    if (_1902)
    {
        float _1948 = _1930 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1944 = _1950;
    }
    float _1952 = _1944;
    float _1954 = -_1888;
    float _1956 = -_1942;
    float _1958 = fma(_1866, _1954, _1956);
    if (_1902)
    {
        float _1960 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1960;
    }
    float _1962 = _1914;
    float _1964 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = _1938;
    float _1968 = _1962;
    if (_1902)
    {
        float _1970 = fma(_1938, _1962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1716 = _1970;
    }
    float _1972 = _1716;
    float _1974 = _1972;
    if (!_1902)
    {
        _1966 = _1890;
    }
    float _1976 = _1966;
    float _1978 = _1976;
    if (!_1902)
    {
        _1968 = _1958;
    }
    float _1980 = _1968;
    float _1982 = _1980;
    float _1984 = _1952;
    if (_1902)
    {
        float _1986 = _1952 + (-1.0);
        _1946 = _1986;
    }
    float _1988 = _1946;
    float _1990 = _1988;
    if (_1902)
    {
        float _1992 = _1922 * _1972;
        _1588 = _1992;
    }
    float _1994 = _1588;
    if (!_1902)
    {
        _1974 = _1894;
    }
    float _1996 = _1974;
    float _1998 = sqrt(_1884);
    float _2000 = _1996;
    if (_1902)
    {
        float _2002 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _2002;
    }
    float _2004 = _1770;
    if (_1902)
    {
        float _2006 = _1890 * _1994;
        _1978 = _2006;
    }
    float _2008 = _1978;
    if (!_1902)
    {
        _1990 = _1892;
    }
    float _2010 = _1990;
    float _2012 = _2010;
    if (_1902)
    {
        float _2014 = _1892 * _1994;
        _2012 = _2014;
    }
    float _2016 = _2012;
    if (_1902)
    {
        float _2018 = fma(_1958, _1952, _2004);
        _1982 = _2018;
    }
    float _2020 = _1982;
    if (_1902)
    {
        float _2022 = _2008 * _2008;
        _2000 = _2022;
    }
    float _2024 = _2000;
    if (!_1902)
    {
        _1984 = _1896;
    }
    float _2026 = _1984;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2016 * _2016;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = _2034 + _2032;
    float _2038 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2040);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2048 = rsqrt(_2036);
    float _2050 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2038);
    float _2052 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2054 = -_2044;
    float _2056 = _2054 + 1.0;
    float _2058 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2060 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2062 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2052);
    float _2064 = abs(_2056);
    float _2066 = log2(_2064);
    float _2068 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2070 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2062);
    float _2074 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2058);
    float _2076 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = _2048 * _2008;
    float _2084 = -_2076;
    float _2086 = fma(_2084, _2046, 1.0);
    float _2088 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2090 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2092 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2048 * _2020;
    float _2096 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2098 = _2088 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2048 * _2016;
    float _2104 = -_2096;
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2104);
    float _2108 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2110 = log2(_2086);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2114 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2112);
    float _2118 = exp2(_2108);
    float _2120 = -_2102;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2106);
    float _2124 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2114);
    float _2128 = fma(_2122, -0.5, 0.5);
    float _2130 = fma(_2122, 0.5, 0.5);
    float _2132 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2134 = 1.0 / _2116;
    float _2136 = _2094 + 1.0;
    float _2138 = fma(_2130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2140 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2132);
    float _2142 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2126);
    float _2144 = _2110 * 0.693147182464599609375;
    float _2146 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2148 = sqrt(_2128);
    float _2150 = -_2094;
    float _2152 = fma(_2118, _2136, _2150);
    float _2154 = fma(_2130, _2138, -0.212114393711090087890625);
    float _2156 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2158 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2160 = fma(_2152, 0.5, 0.5);
    float _2162 = fma(_2130, _2154, 1.570728778839111328125);
    float _2164 = _2146 * _2134;
    float _2166 = _2156 * _2134;
    float _2168 = fma(_2164, 0.5, 0.5);
    float _2170 = fma(_2166, -0.5, 0.5);
    float _2172 = _2148 * 0.636619746685028076171875;
    float _2174 = -_2162;
    float _2176 = fma(_2172, _2174, 1.0);
    float3 _5912 = float3(_2168, _2170, _2158);
    float _2178 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_2168, _2170, _2158);
    float4 _2181 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _2183 = _2181.x;
    float _2185 = _2181.y;
    float _2187 = _2181.z;
    float _2189 = _2181.w;
    float2 _5940 = float2(_2176, _2160);
    float3 _2193 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _2195 = _2193.x;
    float _2197 = _2193.y;
    float _2199 = _2193.z;
    float _2201 = -_1072;
    float _2203 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _2205 = -_1074;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _2209 = -_1118;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _974);
    float _2213 = _2203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2215 = _2203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2217 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2213);
    float _2219 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2215);
    float _2221 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2217);
    float _2223 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2219);
    float _2225 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2227 = _2223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2229 = 1.0 / _2225;
    float _2231 = _2227 + _2225;
    float _2233 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2235 = _2231 * _2229;
    float _2237 = _2235 * 0.5;
    float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
    bool _2243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    float _2253 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2255 = 1.0 / _2241;
    float _2257 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2253);
    float _2259 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2257);
    float _2261 = exp2(_2233);
    float _2263 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2259);
    float _2265 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2267 = _2237;
    if (_2251)
    {
        _2265 = 1.0;
    }
    float _2269 = _2265;
    float _2271 = _2269;
    if (_2251)
    {
        _2267 = 1.0;
    }
    float _2273 = _2267;
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2277 = _2255 * _2275;
    float _2279 = _2273;
    if (!_2251)
    {
        float _2281 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2283 = _2281 * 0.15915493667125701904296875;
        float _2285 = _2283 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        float _2289 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2291 = _2289 * 0.15915493667125701904296875;
        float _2293 = _2283 * 6.283185482025146484375;
        float _2295 = sin(_2293);
        float _2297 = 1.0 / _2287;
        float _2299 = _2291 * 6.283185482025146484375;
        float _2301 = cos(_2299);
        float _2303 = _2295 * _2297;
        float _2305 = _2291 * 6.283185482025146484375;
        float _2307 = sin(_2305);
        float _2309 = _2301 * _2303;
        float _2311 = 1.0 / _2309;
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2313;
        float _2317 = 1.0 / _2315;
        float _2319 = _2307 * _2311;
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = fma(_2277, _2319, _2321);
        float _2325 = _2323 * _2317;
        float _2327 = precise::clamp(_2325, 0.0, 1.0);
        _2271 = _2327;
    }
    float _2329 = _2271;
    if (!_2251)
    {
        float _2331 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2333 = _2331 * 0.15915493667125701904296875;
        float _2335 = _2333 * 6.283185482025146484375;
        float _2337 = cos(_2335);
        float _2339 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2341 = _2339 * 0.15915493667125701904296875;
        float _2343 = _2333 * 6.283185482025146484375;
        float _2345 = sin(_2343);
        float _2347 = 1.0 / _2337;
        float _2349 = _2341 * 6.283185482025146484375;
        float _2351 = cos(_2349);
        float _2353 = _2345 * _2347;
        float _2355 = _2341 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = _2351 * _2353;
        float _2361 = 1.0 / _2359;
        float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2365 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2363;
        float _2367 = 1.0 / _2365;
        float _2369 = _2357 * _2361;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2373 = fma(_2277, _2369, _2371);
        float _2375 = _2373 * _2367;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        float _2379 = -_2377;
        float _2381 = _2379 + 1.0;
        _2279 = _2381;
    }
    float _2383 = _2279;
    float _2385 = _2329 * _2383;
    float _2387 = _2263 + _2116;
    float _2389 = -_2261;
    float _2391 = _2389 + 1.0;
    bool _2393 = _2329 > 0.0;
    bool _2395 = isnan(_2329);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    float _2403 = _2385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2405 = _2387 * 0.5;
    float _2407 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2409 = _2383 <= 0.0;
    bool _2411 = !_2401;
    bool _2413 = _2409 || _2411;
    float _2415 = _2407 * _2178;
    float _2417 = -_2407;
    float _2419 = _2417 + 1.0;
    float _2421 = _2403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2423 = _2189 * _2415;
    float _2425 = _2199 * _2415;
    float _2427 = _2189 * _2419;
    out.gl_Position.x = _2146;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2263;
    out.gl_Position.w = _2116;
    float _2429 = fma(_2195, _2423, _2183);
    float _2431 = fma(_2197, _2423, _2185);
    float _2433 = fma(_2189, _2425, _2187);
    out.m_67.z = _2405;
    out.m_67.w = _2116;
    out.m_47.x = _2421;
    out.m_69.x = _2429;
    out.m_69.y = _2431;
    out.m_69.z = _2433;
    out.m_69.w = _2427;
    if (!_2413)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2435;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1806 = false;
    bool _918 = false;
    bool _750 = false;
    bool _624 = false;
    bool _474 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2492 = as_type<float>(_104);
        out.gl_Position.z = _2492;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    float _128 = 0.0;
    if (_118)
    {
        float _130 = float(_88);
        _124 = _130;
    }
    float _132 = _124;
    bool _134 = _122 >= _132;
    bool _136 = !_118;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2562 = as_type<float>(_144);
        out.gl_Position.z = _2562;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154;
    if (!_164)
    {
        float _168 = _154 * _154;
        float _170 = _168 * 0.5;
        _146 = _170;
    }
    float _172 = _146;
    float _174 = 0.0;
    float _176 = _172;
    if (!_164)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_164)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_164;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _154 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _154);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _126 = _210;
        _190 = _220;
        _128 = _208;
    }
    float _222 = _126;
    float _224 = _190;
    float _226 = _128;
    bool _228 = !_164;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _154 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _166 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _166;
    float _260 = _256;
    float _262 = _254;
    if (!_164)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _122 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _122);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_164;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _122 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_258, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_258, _148, _336);
    float _346 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_258, _152, _346);
    float _358 = fma(_332, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _398 = sqrt(_382);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_356, _366, _390);
    float _418 = _384;
    float _420 = _366;
    float _422 = _338;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _396;
    }
    float _428 = _420;
    float _430 = _428;
    if (_410)
    {
        _422 = _400;
    }
    float _432 = _422;
    float _434 = _432;
    if (!_410)
    {
        bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _438 = !_436;
        if (!_438)
        {
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _442 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _450);
            float _458 = _452 * _452;
            float _460 = fma(_454, _454, _458);
            float _462 = fma(_456, _456, _460);
            float _464 = rsqrt(_462);
            float _466 = _464 * 9.9999999747524270787835121154785e-07;
            float _468 = _454 * _466;
            float _470 = _452 * _466;
            float _472 = _456 * _466;
            _430 = _470;
            _426 = _468;
            _434 = _472;
            _474 = true;
        }
        else
        {
            float _476 = _150 * _150;
            float _478 = fma(_148, _148, _476);
            float _480 = fma(_152, _152, _478);
            float _482 = sqrt(_480);
            bool _484 = _482 >= 9.9999999747524270787835121154785e-07;
            bool _486 = isnan(_482);
            bool _488 = _484 || _486;
            bool _490 = isnan(9.9999999747524270787835121154785e-07);
            bool _492 = _488 || _490;
            if (!_492)
            {
                float _494 = _388 * _388;
                float _496 = fma(_386, _386, _494);
                float _498 = fma(_390, _390, _496);
                float _500 = sqrt(_498);
                bool _502 = _500 >= 9.9999999747524270787835121154785e-07;
                bool _504 = isnan(_500);
                bool _506 = _502 || _504;
                bool _508 = isnan(9.9999999747524270787835121154785e-07);
                bool _510 = _506 || _508;
                if (!_510)
                {
                    float _512 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _514 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _512);
                    float _516 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _514);
                    float _518 = rsqrt(_516);
                    float _520 = _518 * 9.9999999747524270787835121154785e-07;
                    float _522 = _520 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _520 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _520 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _524;
                    _426 = _522;
                    _434 = _526;
                    _474 = true;
                }
                else
                {
                    float _528 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _532 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _534 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _528);
                    float _536 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _530);
                    float _538 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _532);
                    float _540 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _534);
                    float _542 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _536);
                    float _544 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _538);
                    float _546 = _540 * _540;
                    float _548 = fma(_542, _542, _546);
                    float _550 = fma(_544, _544, _548);
                    float _552 = rsqrt(_550);
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    float _556 = _542 * _554;
                    float _558 = _540 * _554;
                    float _560 = _544 * _554;
                    _430 = _558;
                    _426 = _556;
                    _434 = _560;
                    _474 = true;
                }
            }
            else
            {
                float _562 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _564 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _566 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _562);
                float _570 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _564);
                float _572 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _566);
                float _574 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _568);
                float _576 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _570);
                float _578 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _572);
                float _580 = _574 * _574;
                float _582 = fma(_576, _576, _580);
                float _584 = fma(_578, _578, _582);
                float _586 = rsqrt(_584);
                float _588 = _586 * 9.9999999747524270787835121154785e-07;
                float _590 = _576 * _588;
                float _592 = _574 * _588;
                float _594 = _578 * _588;
                _430 = _592;
                _426 = _590;
                _434 = _594;
            }
        }
    }
    _474 = false;
    float _596 = _430;
    float _598 = _426;
    float _600 = _434;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _604 = !_602;
    float _622;
    if (!_604)
    {
        float _606 = in.m_53.x;
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _610 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_88);
        float _628 = 1.0 / _626;
        float _630 = _122 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _632 + _634;
    bool _638 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _640 = isnan(_632);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _650;
    float _654 = -_648;
    float _656 = _654 + 1.0;
    bool _658 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_632);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = 1.0 / _652;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _682 = _668 * _656;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _636 * _670;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _690;
    float _694 = in.m_51.x;
    float _696 = in.m_51.y;
    float _698 = in.m_51.z;
    float _700 = fma(_674, _688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _702 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _704 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _706 = _700 * _682;
    float _708 = _702 * _682;
    float _710 = _704 * _682;
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].x, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].y, _708);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].z, _710);
    float _718 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].x, _712);
    float _720 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].y, _714);
    float _722 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].z, _716);
    float _724 = _718 * _694;
    float _726 = _720 * _696;
    float _728 = _722 * _698;
    bool _730 = !_680;
    float _748;
    if (!_730)
    {
        float _732 = in.m_53.x;
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _736 = _732 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _740 = _738 * _734;
        float _742 = floor(_740);
        float _744 = -_742;
        float _746 = _740 + _744;
        _748 = _746;
        _750 = true;
    }
    else
    {
        float _752 = float(_88);
        float _754 = 1.0 / _752;
        float _756 = _122 * _754;
        _748 = _756;
    }
    _750 = false;
    float _758 = _748;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _762 = _758 + _760;
    bool _764 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _766 = isnan(_758);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _778 = _758 + _776;
    bool _780 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _782 = isnan(_758);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _800 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _802 = isnan(_758);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = 1.0 / _798;
    float _814 = -_810;
    float _816 = _814 + 1.0;
    bool _818 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _820 = _790 * _816;
    float _822 = -_790;
    float _824 = _822 + 1.0;
    float _826 = 1.0 / _794;
    float _828 = _778 * _812;
    float _830 = _762 * _826;
    float _832 = -_774;
    float _834 = _832 + 1.0;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _836;
    float _840 = _810 * _834;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _846;
    float _850 = fma(_838, _830, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _852 = fma(_844, _830, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _854 = fma(_848, _830, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _856 = _850 * _820;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _862 = _852 * _820;
    float _864 = _854 * _820;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _874 = fma(_860, _828, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _876 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].x, _862);
    float _878 = fma(_868, _828, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _880 = fma(_872, _828, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].y, _856);
    float _884 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].z, _864);
    float _886 = fma(_878, _840, _876);
    float _888 = fma(_874, _840, _882);
    float _890 = fma(_880, _840, _884);
    float _892 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].x, _886);
    float _894 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].y, _888);
    float _896 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].z, _890);
    bool _898 = !_818;
    float _916;
    if (!_898)
    {
        float _900 = in.m_53.x;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _904 = _900 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _908 = _906 * _902;
        float _910 = floor(_908);
        float _912 = -_910;
        float _914 = _908 + _912;
        _916 = _914;
        _918 = true;
    }
    else
    {
        float _920 = float(_88);
        float _922 = 1.0 / _920;
        float _924 = _122 * _922;
        _916 = _924;
    }
    _918 = false;
    float _926 = _916;
    float _928 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _930 = _596 * _596;
    float _932 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _934 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _936 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _928);
    float _938 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _940 = fma(_598, _598, _930);
    float _942 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _932);
    float _944 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _938);
    float _946 = fma(_600, _600, _940);
    float _948 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _950 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _934);
    float _952 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _954 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _948);
    float _956 = rsqrt(_946);
    float _958 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _944);
    float _960 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _936);
    float _962 = _952 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _964 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _950);
    float _966 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _954);
    float _968 = _960 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _962 + _970;
    float _974 = _964 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _968 + _976;
    float _980 = _972 * _972;
    float _982 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _974 + _984;
    float _988 = fma(_978, _978, _980);
    float _990 = _956 * _596;
    float _992 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _982);
    float _994 = _956 * _598;
    float _996 = fma(_986, _986, _988);
    float _998 = _990 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1000 = sqrt(_958);
    float _1002 = _956 * _600;
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[8].y, _998);
    float _1006 = in.m_53.y;
    float _1008 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1004);
    float _1012 = sqrt(_966);
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _992);
    float _1016 = in.m_53.w;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = abs(_1010);
    bool _1026 = _1024 > 0.99989998340606689453125;
    float _1028 = in.m_55.z;
    float _1030 = rsqrt(_996);
    float _1032 = fma(_1000, _1000, _1014);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1036 = _1034 != 0;
    float _1038 = in.m_55.x;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1046 = _1044 != 0;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _1050 = fma(_1012, _1012, _1032);
    float _1052 = 0.0;
    float _1054 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1056 = _1014;
    bool _1058 = _1026;
    if (_1026)
    {
        _1052 = 0.001000000047497451305389404296875;
    }
    float _1060 = _1052;
    float _1062 = 0.0;
    if (!_1026)
    {
        _1062 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (_1026)
    {
        float _1068 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = _972 * _1030;
    float _1074 = _978 * _1030;
    float _1076 = sqrt(_1050);
    float _1078 = -_1072;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _972);
    float _1082 = -_1074;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1090 = _1048 * _596;
    float _1092 = _1090 * 8.0;
    float _1094 = _1048 * _598;
    float _1096 = _1094 * 8.0;
    float _1098 = _1048 * _600;
    float _1100 = _1098 * 8.0;
    float _1102 = _1080 * _1080;
    if (!_1026)
    {
        _1054 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1104 = _1054;
    float _1106 = _1104;
    if (_1026)
    {
        float _1108 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = -_1070;
    float _1114 = _1002 * _1112;
    float _1116 = fma(_1084, _1084, _1102);
    float _1118 = _986 * _1030;
    float _1120 = sqrt(_1014);
    float _1122 = -_1110;
    float _1124 = -_1114;
    float _1126 = fma(_994, _1122, _1124);
    float _1128 = -_1110;
    float _1130 = _990 * _1128;
    float _1132 = -_1118;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    bool _1136 = _1006 > 0.5;
    float _1138 = _1096 * _1096;
    bool _1140 = _1016 > 0.5;
    float _1142 = fma(_1134, _1134, _1116);
    float _1144 = 1.0 / _1088;
    bool _1146 = _1140;
    if (!_1026)
    {
        _1056 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1148 = _1056;
    float _1150 = _1148;
    if (_1026)
    {
        float _1152 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = _1076 + 9.9999997473787516355514526367188e-06;
    float _1158 = fma(_1100, _1100, _1138);
    float _1160 = -_1154;
    float _1162 = _994 * _1160;
    float _1164 = -_1154;
    float _1166 = -_1130;
    float _1168 = fma(_1002, _1164, _1166);
    float _1170 = _1126 * _1126;
    float _1172 = sqrt(_1142);
    float _1174 = -_1070;
    float _1176 = -_1162;
    float _1178 = fma(_990, _1174, _1176);
    float _1180 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1182 = precise::clamp(_1180, 0.0, 1.0);
    float _1184 = fma(_1168, _1168, _1170);
    float _1186 = _1120 * 0.800000011920928955078125;
    bool _1188 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1190 = isnan(_926);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = fma(_1182, -0.64999997615814208984375, 1.0);
    float _1202 = fma(_1178, _1178, _1184);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1204;
    float _1208 = sqrt(_1158);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1214 = _1206 * _1144;
    float _1216 = _1120 * (-0.4000000059604644775390625);
    float _1218 = in.m_55.y;
    float _1220 = _1030 * _1172;
    float _1222 = 1.0 / _1156;
    float _1224 = _1008 * _1220;
    float _1226 = _1022 * _1220;
    float _1228 = rsqrt(_1202);
    float _1230 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1232 = abs(_1092);
    float _1234 = 1.0 / _1232;
    float _1236 = _1222 * _1028;
    float _1238 = 1.0 / _1186;
    float _1240 = _1208 * _1234;
    float _1242 = _1240 * 0.25;
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = fma(_1208, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = _1230 * _1220;
    float _1252 = fma(_1248, -2.0, 3.0);
    float _1254 = _1248 * _1248;
    float _1256 = _1168 * _1228;
    float _1258 = _1126 * _1228;
    float _1260 = fma(_1092, _1092, _1138);
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1264 = _1222 * _1038;
    float _1266 = _1178 * _1228;
    float _1268 = fma(_1100, _1100, _1260);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1218);
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1264);
    float _1274 = _1208 * _1238;
    float _1276 = _1252 * _1254;
    float _1278 = _1250 * _1262;
    float _1280 = _994 * _1258;
    float _1282 = _1226 * _1270;
    float _1284 = _1224 * _1272;
    float _1286 = rsqrt(_1268);
    float _1288 = _990 * _1266;
    float _1290 = -_1280;
    float _1292 = fma(_990, _1256, _1290);
    float _1294 = _1282 * _990;
    float _1296 = _1282 * _1002;
    float _1298 = -_1288;
    float _1300 = fma(_1002, _1258, _1298);
    float _1302 = _1002 * _1256;
    float _1304 = fma(_1284, _1258, _1294);
    float _1306 = _1282 * _994;
    float _1308 = -_1302;
    float _1310 = fma(_994, _1266, _1308);
    float _1312 = fma(_1284, _1266, _1296);
    float _1314 = fma(_1284, _1256, _1306);
    float _1316 = fma(_1278, _1310, _1304);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1322 = _1092 * _1286;
    float _1324 = fma(_1278, _1300, _1314);
    float _1326 = fma(_1244, -2.0, 3.0);
    float _1328 = _1244 * _1244;
    float _1330 = _1096 * _1286;
    float _1332 = _1316 * _1322;
    float _1334 = fma(_1278, _1292, _1312);
    float _1336 = -_1276;
    float _1338 = _1336 + 1.0;
    float _1340 = _1100 * _1286;
    float _1342 = fma(_1324, _1330, _1332);
    float _1344 = in.m_57.y;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1350 = _1274 < 0.5;
    float _1352 = float(_1350);
    float _1354 = fma(_1326, _1328, _1338);
    float _1356 = precise::clamp(_1354, 0.0, 1.0);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1360 = _1276;
    if (_1020)
    {
        float _1362 = in.m_53.x;
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = fma(_1334, _1340, _1342);
    float _1368 = 1.0 / _1320;
    float _1370 = _1326;
    if (_1036)
    {
        float _1372 = in.m_53.z;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = -_1352;
    float _1378 = fma(_1376, _1356, 1.0);
    float _1380 = _1330 * _1366;
    float _1382 = _1226 * _1218;
    float _1384 = fma(_1378, 0.89999997615814208984375, 0.100000001490116119384765625);
    float _1386 = 1.0 / _1348;
    float _1388 = _1340 * _1366;
    float _1390 = -_1380;
    float _1392 = _1324 + _1390;
    bool _1394 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1396 = isnan(_926);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1384 * _1382;
    float _1408 = -_1388;
    float _1410 = _1334 + _1408;
    float _1412 = fma(_1380, _1384, _1392);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1414;
    float _1418 = _1212 * _1368;
    float _1420 = fma(_1388, _1384, _1410);
    float _1422 = _968 + _1412;
    float _1424 = -_1344;
    float _1426 = _1424 + 1.0;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1430 = _926 + _1428;
    float _1432 = _974 + _1420;
    float _1434 = _1344;
    if (_1020)
    {
        bool _1436 = _1364 > 0.5;
        _1058 = _1436;
    }
    bool _1438 = _1058;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1442 = _926 + _1440;
    float _1444 = _1416 * _1386;
    float _1446 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1448 = _1422 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1452 = _1432 + _1450;
    int _1454 = _1140 ? as_type<int>(_1426) : as_type<int>(_1344);
    float _1456 = fma(_1214, _1442, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1458 = fma(_1448, _1200, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1460 = fma(_1452, _1200, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1462 = _1458;
    float _1464 = _1460;
    if (_1036)
    {
        bool _1466 = _1374 > 0.5;
        _1146 = _1466;
    }
    bool _1468 = _1146;
    float _1470 = fma(_1418, _1430, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1474 = _1458 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1478 = _1460 + _1476;
    bool _1480 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1482 = isnan(_926);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    float _1492 = -_1404;
    float _1494 = _1492 + 1.0;
    float _1496 = _1474 * _1474;
    float _1498 = _1478 * _1478;
    float _1500 = _1322 * _1366;
    float _1502 = -_1490;
    float _1504 = _1502 + 1.0;
    float _1506 = _1286 * _1406;
    float _1508 = _1496 + _1498;
    float _1510 = fma(_1378, 0.5, 0.5);
    float _1512 = _1404 * _1504;
    float _1514 = -_1500;
    float _1516 = _1316 + _1514;
    float _1518 = sqrt(_1508);
    float _1520 = in.m_57.x;
    float _1522 = _1506 * _1506;
    float _1524 = _1276 * _1510;
    float _1526 = fma(_1500, _1384, _1516);
    bool _1528 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1530 = isnan(_926);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = _1216 * _1522;
    float _1542 = _1540 * 0.5;
    float _1544 = _1198 * _1494;
    float _1546 = _1524 * _1524;
    float _1548 = _962 + _1526;
    float _1550 = -_1198;
    float _1552 = _1550 + 1.0;
    float _1554 = _1042 ? as_type<float>(_1454) : _1344;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1558 = _926 + _1556;
    float _1560 = fma(_1542, _1546, _1548);
    float _1562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1564 = _1538 * _1552;
    bool _1566 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1570 = _1560 + _1568;
    float _1572 = -_1538;
    float _1574 = _1572 + 1.0;
    float _1576 = _1456 * _1564;
    float _1578 = _1570;
    float _1580 = _1496;
    float _1582 = _1498;
    int _1584 = as_type<int>(_1474);
    int _1586 = as_type<int>(_1470);
    float _1588 = _1512;
    if (_1046)
    {
        float _1590 = _1136 ? _1426 : _1344;
        _1434 = _1590;
    }
    float _1592 = _1434;
    float _1594 = fma(_1570, _1200, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1576);
    float _1600 = fma(_1444, _1558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1602 = _1520;
    if (!_1020)
    {
        _1360 = _1520;
    }
    float _1604 = _1360;
    float _1606 = fma(_1470, _1544, _1598);
    float _1608 = _1604;
    if (!_1566)
    {
        _1578 = _1594;
    }
    float _1610 = _1578;
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1614 = !_1566;
    float _1616 = _1610;
    if (!_1614)
    {
        float _1618 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1622 = _1518 + _1620;
        float _1624 = rsqrt(_1508);
        float _1626 = _1622 * _1618;
        float _1628 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = _1626 * 0.15915493667125701904296875;
        float _1632 = _1630 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        float _1636 = _1630 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        float _1640 = fma(_1634, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1642 = _1624 * _1640;
        float _1644 = fma(_1474, _1642, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1646 = _1638 + (-1.0);
        float _1648 = fma(_1478, _1642, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1652 = _1644 + _1650;
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1658 = _1648 + _1656;
        float _1660 = _1652 * _1652;
        float _1662 = fma(_1594, _1638, _1654);
        float _1664 = _1658 * _1658;
        _1616 = _1662;
        _1580 = _1660;
        _1582 = _1664;
        _1462 = _1644;
        _1464 = _1648;
    }
    float _1666 = _1616;
    float _1668 = _1580;
    float _1670 = _1582;
    float _1672 = _1462;
    float _1674 = _1464;
    if (_1020)
    {
        float _1676 = -_1520;
        float _1678 = _1676 + 1.0;
        _1584 = as_type<int>(_1678);
    }
    int _1680 = _1584;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1684 = _1666 + _1682;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1688 = fma(_1600, _1512, _1606);
    if (_1036)
    {
        float _1690 = -_1520;
        float _1692 = _1690 + 1.0;
        _1586 = as_type<int>(_1692);
    }
    int _1694 = _1586;
    float _1696 = fma(_1684, _1684, _1668);
    if (_1020)
    {
        float _1698 = _1438 ? as_type<float>(_1680) : _1520;
        _1608 = _1698;
    }
    float _1700 = _1608;
    float _1702 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1704 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1688);
    float _1706 = _1696 + _1670;
    float _1708 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1712 = _1702 * _1612;
    float _1714 = _1708 * _1596;
    float _1716 = _1712;
    if (_1036)
    {
        float _1718 = _1468 ? as_type<float>(_1694) : _1520;
        _1602 = _1718;
    }
    float _1720 = _1602;
    float _1722 = _1710 * _1562;
    float _1724 = _892 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1726 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1728 = sqrt(_1706);
    float _1730 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1734 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1740 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1734 * _1686;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1750 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1722;
    out.m_59.y = _1714;
    out.m_59.z = _1746;
    out.m_59.w = _1712;
    bool _1756 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1758 = isnan(_1728);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1764 = _1760 || _1762;
    out.m_61.x = _1744;
    out.m_61.y = _1748;
    out.m_61.z = _1750;
    out.m_63.x = _1740;
    out.m_63.y = _1742;
    out.m_63.z = _1752;
    out.m_63.w = _1754;
    out.m_65.x = _1224;
    out.m_65.y = _1226;
    float _1766 = _1736;
    float _1768 = _1740;
    float _1770 = _1742;
    if (!_1764)
    {
        _1766 = 1.0;
    }
    float _1772 = _1766;
    bool _1774 = !_1764;
    float _1776 = _1772;
    if (!_1774)
    {
        bool _1778 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1780 = isnan(_1728);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1786 = _1782 || _1784;
        if (!_1786)
        {
            float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1790 = _1728 + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1794 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1800 = 1.0 / _1794;
            float _1802 = _1790 * _1800;
            float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1776 = _1804;
            _1806 = true;
        }
        else
        {
            bool _1808 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1810 = isnan(_1728);
            bool _1812 = _1808 || _1810;
            bool _1814 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1816 = _1812 || _1814;
            if (!_1816)
            {
                float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1820 = _1728 + _1818;
                float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1824 = _1822 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1826 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1828 = _1826 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1830 = 1.0 / _1824;
                float _1832 = _1820 * _1830;
                float _1834 = fma(_1832, _1828, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1776 = _1834;
                _1806 = true;
            }
            else
            {
                _1776 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1806 = false;
    float _1836 = _1776;
    float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1840 = _1666 + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1844 = _1672 + _1842;
    float _1846 = fma(_1840, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1850 = _1674 + _1848;
    float _1852 = fma(_1844, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1854 = -_1072;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _1858 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1860 = -_1074;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1866 = _1856 + _1864;
    float _1868 = -_1118;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1874 = _1862 + _1872;
    float _1876 = _1866 * _1866;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1880 = _1870 + _1878;
    float _1882 = fma(_1874, _1874, _1876);
    float _1884 = fma(_1880, _1880, _1882);
    float _1886 = rsqrt(_1884);
    float _1888 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1874 * _1888;
    float _1892 = _1880 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1880;
    float _1910 = _1898;
    float _1912 = _1906;
    float _1914 = _1866;
    if (_1902)
    {
        float _1916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1916;
    }
    float _1918 = _1908;
    if (_1902)
    {
        float _1920 = rsqrt(_1898);
        _1910 = _1920;
    }
    float _1922 = _1910;
    if (_1902)
    {
        float _1924 = _1906 * _1918;
        _1912 = _1924;
    }
    float _1926 = _1912;
    if (_1902)
    {
        float _1928 = _1926 * 0.15915493667125701904296875;
        _1768 = _1928;
    }
    float _1930 = _1768;
    float _1932 = _1886;
    if (_1902)
    {
        float _1934 = _1930 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1918;
    float _1946 = _1942;
    if (_1902)
    {
        float _1948 = _1930 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1944 = _1950;
    }
    float _1952 = _1944;
    float _1954 = -_1888;
    float _1956 = -_1942;
    float _1958 = fma(_1866, _1954, _1956);
    if (_1902)
    {
        float _1960 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1960;
    }
    float _1962 = _1914;
    float _1964 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = _1938;
    float _1968 = _1962;
    if (_1902)
    {
        float _1970 = fma(_1938, _1962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1716 = _1970;
    }
    float _1972 = _1716;
    float _1974 = _1972;
    if (!_1902)
    {
        _1966 = _1890;
    }
    float _1976 = _1966;
    float _1978 = _1976;
    if (!_1902)
    {
        _1968 = _1958;
    }
    float _1980 = _1968;
    float _1982 = _1980;
    float _1984 = _1952;
    if (_1902)
    {
        float _1986 = _1952 + (-1.0);
        _1946 = _1986;
    }
    float _1988 = _1946;
    float _1990 = _1988;
    if (_1902)
    {
        float _1992 = _1922 * _1972;
        _1588 = _1992;
    }
    float _1994 = _1588;
    if (!_1902)
    {
        _1974 = _1894;
    }
    float _1996 = _1974;
    float _1998 = sqrt(_1884);
    float _2000 = _1996;
    if (_1902)
    {
        float _2002 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _2002;
    }
    float _2004 = _1770;
    if (_1902)
    {
        float _2006 = _1890 * _1994;
        _1978 = _2006;
    }
    float _2008 = _1978;
    if (!_1902)
    {
        _1990 = _1892;
    }
    float _2010 = _1990;
    float _2012 = _2010;
    if (_1902)
    {
        float _2014 = _1892 * _1994;
        _2012 = _2014;
    }
    float _2016 = _2012;
    if (_1902)
    {
        float _2018 = fma(_1958, _1952, _2004);
        _1982 = _2018;
    }
    float _2020 = _1982;
    if (_1902)
    {
        float _2022 = _2008 * _2008;
        _2000 = _2022;
    }
    float _2024 = _2000;
    if (!_1902)
    {
        _1984 = _1896;
    }
    float _2026 = _1984;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2016 * _2016;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = _2034 + _2032;
    float _2038 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2040);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2048 = rsqrt(_2036);
    float _2050 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2038);
    float _2052 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2054 = -_2044;
    float _2056 = _2054 + 1.0;
    float _2058 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2060 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2062 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2052);
    float _2064 = abs(_2056);
    float _2066 = log2(_2064);
    float _2068 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2070 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2062);
    float _2074 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2058);
    float _2076 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = _2048 * _2008;
    float _2084 = -_2076;
    float _2086 = fma(_2084, _2046, 1.0);
    float _2088 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2090 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2092 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2048 * _2020;
    float _2096 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2098 = _2088 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2048 * _2016;
    float _2104 = -_2096;
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2104);
    float _2108 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2110 = log2(_2086);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2114 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2112);
    float _2118 = exp2(_2108);
    float _2120 = -_2102;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2106);
    float _2124 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2114);
    float _2128 = fma(_2122, -0.5, 0.5);
    float _2130 = fma(_2122, 0.5, 0.5);
    float _2132 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2134 = 1.0 / _2116;
    float _2136 = _2094 + 1.0;
    float _2138 = fma(_2130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2140 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2132);
    float _2142 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2126);
    float _2144 = _2110 * 0.693147182464599609375;
    float _2146 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2148 = sqrt(_2128);
    float _2150 = -_2094;
    float _2152 = fma(_2118, _2136, _2150);
    float _2154 = fma(_2130, _2138, -0.212114393711090087890625);
    float _2156 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2158 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2160 = fma(_2152, 0.5, 0.5);
    float _2162 = fma(_2130, _2154, 1.570728778839111328125);
    float _2164 = _2146 * _2134;
    float _2166 = _2156 * _2134;
    float _2168 = fma(_2164, 0.5, 0.5);
    float _2170 = fma(_2166, -0.5, 0.5);
    float _2172 = _2148 * 0.636619746685028076171875;
    float _2174 = -_2162;
    float _2176 = fma(_2172, _2174, 1.0);
    float3 _5912 = float3(_2168, _2170, _2158);
    float _2178 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_2168, _2170, _2158);
    float4 _2181 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _2183 = _2181.x;
    float _2185 = _2181.y;
    float _2187 = _2181.z;
    float _2189 = _2181.w;
    float2 _5940 = float2(_2176, _2160);
    float3 _2193 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _2195 = _2193.x;
    float _2197 = _2193.y;
    float _2199 = _2193.z;
    float _2201 = -_1072;
    float _2203 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _2205 = -_1074;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _2209 = -_1118;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _974);
    float _2213 = _2203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2215 = _2203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2217 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2213);
    float _2219 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2215);
    float _2221 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2217);
    float _2223 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2219);
    float _2225 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2227 = _2223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2229 = 1.0 / _2225;
    float _2231 = _2227 + _2225;
    float _2233 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2235 = _2231 * _2229;
    float _2237 = _2235 * 0.5;
    float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
    bool _2243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    float _2253 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2255 = 1.0 / _2241;
    float _2257 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2253);
    float _2259 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2257);
    float _2261 = exp2(_2233);
    float _2263 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2259);
    float _2265 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2267 = _2237;
    if (_2251)
    {
        _2265 = 1.0;
    }
    float _2269 = _2265;
    float _2271 = _2269;
    if (_2251)
    {
        _2267 = 1.0;
    }
    float _2273 = _2267;
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2277 = _2255 * _2275;
    float _2279 = _2273;
    if (!_2251)
    {
        float _2281 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2283 = _2281 * 0.15915493667125701904296875;
        float _2285 = _2283 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        float _2289 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2291 = _2289 * 0.15915493667125701904296875;
        float _2293 = _2283 * 6.283185482025146484375;
        float _2295 = sin(_2293);
        float _2297 = 1.0 / _2287;
        float _2299 = _2291 * 6.283185482025146484375;
        float _2301 = cos(_2299);
        float _2303 = _2295 * _2297;
        float _2305 = _2291 * 6.283185482025146484375;
        float _2307 = sin(_2305);
        float _2309 = _2301 * _2303;
        float _2311 = 1.0 / _2309;
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2313;
        float _2317 = 1.0 / _2315;
        float _2319 = _2307 * _2311;
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = fma(_2277, _2319, _2321);
        float _2325 = _2323 * _2317;
        float _2327 = precise::clamp(_2325, 0.0, 1.0);
        _2271 = _2327;
    }
    float _2329 = _2271;
    if (!_2251)
    {
        float _2331 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2333 = _2331 * 0.15915493667125701904296875;
        float _2335 = _2333 * 6.283185482025146484375;
        float _2337 = cos(_2335);
        float _2339 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2341 = _2339 * 0.15915493667125701904296875;
        float _2343 = _2333 * 6.283185482025146484375;
        float _2345 = sin(_2343);
        float _2347 = 1.0 / _2337;
        float _2349 = _2341 * 6.283185482025146484375;
        float _2351 = cos(_2349);
        float _2353 = _2345 * _2347;
        float _2355 = _2341 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = _2351 * _2353;
        float _2361 = 1.0 / _2359;
        float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2365 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2363;
        float _2367 = 1.0 / _2365;
        float _2369 = _2357 * _2361;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2373 = fma(_2277, _2369, _2371);
        float _2375 = _2373 * _2367;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        float _2379 = -_2377;
        float _2381 = _2379 + 1.0;
        _2279 = _2381;
    }
    float _2383 = _2279;
    float _2385 = _2329 * _2383;
    float _2387 = _2263 + _2116;
    float _2389 = -_2261;
    float _2391 = _2389 + 1.0;
    bool _2393 = _2329 > 0.0;
    bool _2395 = isnan(_2329);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    float _2403 = _2385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2405 = _2387 * 0.5;
    float _2407 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2409 = _2383 <= 0.0;
    bool _2411 = !_2401;
    bool _2413 = _2409 || _2411;
    float _2415 = _2407 * _2178;
    float _2417 = -_2407;
    float _2419 = _2417 + 1.0;
    float _2421 = _2403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2423 = _2189 * _2415;
    float _2425 = _2199 * _2415;
    float _2427 = _2189 * _2419;
    out.gl_Position.x = _2146;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2263;
    out.gl_Position.w = _2116;
    float _2429 = fma(_2195, _2423, _2183);
    float _2431 = fma(_2197, _2423, _2185);
    float _2433 = fma(_2189, _2425, _2187);
    out.m_67.z = _2405;
    out.m_67.w = _2116;
    out.m_47.x = _2421;
    out.m_69.x = _2429;
    out.m_69.y = _2431;
    out.m_69.z = _2433;
    out.m_69.w = _2427;
    if (!_2413)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2435;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1806 = false;
    bool _918 = false;
    bool _750 = false;
    bool _624 = false;
    bool _474 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2492 = as_type<float>(_104);
        out.gl_Position.z = _2492;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    float _128 = 0.0;
    if (_118)
    {
        float _130 = float(_88);
        _124 = _130;
    }
    float _132 = _124;
    bool _134 = _122 >= _132;
    bool _136 = !_118;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2562 = as_type<float>(_144);
        out.gl_Position.z = _2562;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154;
    if (!_164)
    {
        float _168 = _154 * _154;
        float _170 = _168 * 0.5;
        _146 = _170;
    }
    float _172 = _146;
    float _174 = 0.0;
    float _176 = _172;
    if (!_164)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_164)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_164;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _154 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _154);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _126 = _210;
        _190 = _220;
        _128 = _208;
    }
    float _222 = _126;
    float _224 = _190;
    float _226 = _128;
    bool _228 = !_164;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _154 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _166 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _166;
    float _260 = _256;
    float _262 = _254;
    if (!_164)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _122 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _122);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_164;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _122 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_258, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_258, _148, _336);
    float _346 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_258, _152, _346);
    float _358 = fma(_332, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _398 = sqrt(_382);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_356, _366, _390);
    float _418 = _384;
    float _420 = _366;
    float _422 = _338;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _396;
    }
    float _428 = _420;
    float _430 = _428;
    if (_410)
    {
        _422 = _400;
    }
    float _432 = _422;
    float _434 = _432;
    if (!_410)
    {
        bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _438 = !_436;
        if (!_438)
        {
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _442 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _450);
            float _458 = _452 * _452;
            float _460 = fma(_454, _454, _458);
            float _462 = fma(_456, _456, _460);
            float _464 = rsqrt(_462);
            float _466 = _464 * 9.9999999747524270787835121154785e-07;
            float _468 = _454 * _466;
            float _470 = _452 * _466;
            float _472 = _456 * _466;
            _430 = _470;
            _426 = _468;
            _434 = _472;
            _474 = true;
        }
        else
        {
            float _476 = _150 * _150;
            float _478 = fma(_148, _148, _476);
            float _480 = fma(_152, _152, _478);
            float _482 = sqrt(_480);
            bool _484 = _482 >= 9.9999999747524270787835121154785e-07;
            bool _486 = isnan(_482);
            bool _488 = _484 || _486;
            bool _490 = isnan(9.9999999747524270787835121154785e-07);
            bool _492 = _488 || _490;
            if (!_492)
            {
                float _494 = _388 * _388;
                float _496 = fma(_386, _386, _494);
                float _498 = fma(_390, _390, _496);
                float _500 = sqrt(_498);
                bool _502 = _500 >= 9.9999999747524270787835121154785e-07;
                bool _504 = isnan(_500);
                bool _506 = _502 || _504;
                bool _508 = isnan(9.9999999747524270787835121154785e-07);
                bool _510 = _506 || _508;
                if (!_510)
                {
                    float _512 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _514 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _512);
                    float _516 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _514);
                    float _518 = rsqrt(_516);
                    float _520 = _518 * 9.9999999747524270787835121154785e-07;
                    float _522 = _520 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _520 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _520 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _524;
                    _426 = _522;
                    _434 = _526;
                    _474 = true;
                }
                else
                {
                    float _528 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _532 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _534 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _528);
                    float _536 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _530);
                    float _538 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _532);
                    float _540 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _534);
                    float _542 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _536);
                    float _544 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _538);
                    float _546 = _540 * _540;
                    float _548 = fma(_542, _542, _546);
                    float _550 = fma(_544, _544, _548);
                    float _552 = rsqrt(_550);
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    float _556 = _542 * _554;
                    float _558 = _540 * _554;
                    float _560 = _544 * _554;
                    _430 = _558;
                    _426 = _556;
                    _434 = _560;
                    _474 = true;
                }
            }
            else
            {
                float _562 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _564 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _566 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _562);
                float _570 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _564);
                float _572 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _566);
                float _574 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _568);
                float _576 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _570);
                float _578 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _572);
                float _580 = _574 * _574;
                float _582 = fma(_576, _576, _580);
                float _584 = fma(_578, _578, _582);
                float _586 = rsqrt(_584);
                float _588 = _586 * 9.9999999747524270787835121154785e-07;
                float _590 = _576 * _588;
                float _592 = _574 * _588;
                float _594 = _578 * _588;
                _430 = _592;
                _426 = _590;
                _434 = _594;
            }
        }
    }
    _474 = false;
    float _596 = _430;
    float _598 = _426;
    float _600 = _434;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _604 = !_602;
    float _622;
    if (!_604)
    {
        float _606 = in.m_53.x;
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _610 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_88);
        float _628 = 1.0 / _626;
        float _630 = _122 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _632 + _634;
    bool _638 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _640 = isnan(_632);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _650;
    float _654 = -_648;
    float _656 = _654 + 1.0;
    bool _658 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_632);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = 1.0 / _652;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _682 = _668 * _656;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _636 * _670;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _690;
    float _694 = in.m_51.x;
    float _696 = in.m_51.y;
    float _698 = in.m_51.z;
    float _700 = fma(_674, _688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _702 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _704 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _706 = _700 * _682;
    float _708 = _702 * _682;
    float _710 = _704 * _682;
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].x, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].y, _708);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].z, _710);
    float _718 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].x, _712);
    float _720 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].y, _714);
    float _722 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[144].z, _716);
    float _724 = _718 * _694;
    float _726 = _720 * _696;
    float _728 = _722 * _698;
    bool _730 = !_680;
    float _748;
    if (!_730)
    {
        float _732 = in.m_53.x;
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _736 = _732 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _740 = _738 * _734;
        float _742 = floor(_740);
        float _744 = -_742;
        float _746 = _740 + _744;
        _748 = _746;
        _750 = true;
    }
    else
    {
        float _752 = float(_88);
        float _754 = 1.0 / _752;
        float _756 = _122 * _754;
        _748 = _756;
    }
    _750 = false;
    float _758 = _748;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _762 = _758 + _760;
    bool _764 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _766 = isnan(_758);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _778 = _758 + _776;
    bool _780 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _782 = isnan(_758);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _800 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _802 = isnan(_758);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = 1.0 / _798;
    float _814 = -_810;
    float _816 = _814 + 1.0;
    bool _818 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _820 = _790 * _816;
    float _822 = -_790;
    float _824 = _822 + 1.0;
    float _826 = 1.0 / _794;
    float _828 = _778 * _812;
    float _830 = _762 * _826;
    float _832 = -_774;
    float _834 = _832 + 1.0;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _836;
    float _840 = _810 * _834;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _846;
    float _850 = fma(_838, _830, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _852 = fma(_844, _830, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _854 = fma(_848, _830, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _856 = _850 * _820;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _862 = _852 * _820;
    float _864 = _854 * _820;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _874 = fma(_860, _828, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _876 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].x, _862);
    float _878 = fma(_868, _828, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _880 = fma(_872, _828, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].y, _856);
    float _884 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].z, _864);
    float _886 = fma(_878, _840, _876);
    float _888 = fma(_874, _840, _882);
    float _890 = fma(_880, _840, _884);
    float _892 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].x, _886);
    float _894 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].y, _888);
    float _896 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[109].z, _890);
    bool _898 = !_818;
    float _916;
    if (!_898)
    {
        float _900 = in.m_53.x;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _904 = _900 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _908 = _906 * _902;
        float _910 = floor(_908);
        float _912 = -_910;
        float _914 = _908 + _912;
        _916 = _914;
        _918 = true;
    }
    else
    {
        float _920 = float(_88);
        float _922 = 1.0 / _920;
        float _924 = _122 * _922;
        _916 = _924;
    }
    _918 = false;
    float _926 = _916;
    float _928 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _930 = _596 * _596;
    float _932 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _934 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _936 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _928);
    float _938 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _940 = fma(_598, _598, _930);
    float _942 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _932);
    float _944 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _938);
    float _946 = fma(_600, _600, _940);
    float _948 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _950 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _934);
    float _952 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _954 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _948);
    float _956 = rsqrt(_946);
    float _958 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _944);
    float _960 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _936);
    float _962 = _952 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _964 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _950);
    float _966 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _954);
    float _968 = _960 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _962 + _970;
    float _974 = _964 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _968 + _976;
    float _980 = _972 * _972;
    float _982 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _974 + _984;
    float _988 = fma(_978, _978, _980);
    float _990 = _956 * _596;
    float _992 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _982);
    float _994 = _956 * _598;
    float _996 = fma(_986, _986, _988);
    float _998 = _990 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1000 = sqrt(_958);
    float _1002 = _956 * _600;
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[8].y, _998);
    float _1006 = in.m_53.y;
    float _1008 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1004);
    float _1012 = sqrt(_966);
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _992);
    float _1016 = in.m_53.w;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = abs(_1010);
    bool _1026 = _1024 > 0.99989998340606689453125;
    float _1028 = in.m_55.z;
    float _1030 = rsqrt(_996);
    float _1032 = fma(_1000, _1000, _1014);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1036 = _1034 != 0;
    float _1038 = in.m_55.x;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1046 = _1044 != 0;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _1050 = fma(_1012, _1012, _1032);
    float _1052 = 0.0;
    float _1054 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1056 = _1014;
    bool _1058 = _1026;
    if (_1026)
    {
        _1052 = 0.001000000047497451305389404296875;
    }
    float _1060 = _1052;
    float _1062 = 0.0;
    if (!_1026)
    {
        _1062 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (_1026)
    {
        float _1068 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = _972 * _1030;
    float _1074 = _978 * _1030;
    float _1076 = sqrt(_1050);
    float _1078 = -_1072;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _972);
    float _1082 = -_1074;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1090 = _1048 * _596;
    float _1092 = _1090 * 8.0;
    float _1094 = _1048 * _598;
    float _1096 = _1094 * 8.0;
    float _1098 = _1048 * _600;
    float _1100 = _1098 * 8.0;
    float _1102 = _1080 * _1080;
    if (!_1026)
    {
        _1054 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1104 = _1054;
    float _1106 = _1104;
    if (_1026)
    {
        float _1108 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = -_1070;
    float _1114 = _1002 * _1112;
    float _1116 = fma(_1084, _1084, _1102);
    float _1118 = _986 * _1030;
    float _1120 = sqrt(_1014);
    float _1122 = -_1110;
    float _1124 = -_1114;
    float _1126 = fma(_994, _1122, _1124);
    float _1128 = -_1110;
    float _1130 = _990 * _1128;
    float _1132 = -_1118;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    bool _1136 = _1006 > 0.5;
    float _1138 = _1096 * _1096;
    bool _1140 = _1016 > 0.5;
    float _1142 = fma(_1134, _1134, _1116);
    float _1144 = 1.0 / _1088;
    bool _1146 = _1140;
    if (!_1026)
    {
        _1056 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1148 = _1056;
    float _1150 = _1148;
    if (_1026)
    {
        float _1152 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = _1076 + 9.9999997473787516355514526367188e-06;
    float _1158 = fma(_1100, _1100, _1138);
    float _1160 = -_1154;
    float _1162 = _994 * _1160;
    float _1164 = -_1154;
    float _1166 = -_1130;
    float _1168 = fma(_1002, _1164, _1166);
    float _1170 = _1126 * _1126;
    float _1172 = sqrt(_1142);
    float _1174 = -_1070;
    float _1176 = -_1162;
    float _1178 = fma(_990, _1174, _1176);
    float _1180 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1182 = precise::clamp(_1180, 0.0, 1.0);
    float _1184 = fma(_1168, _1168, _1170);
    float _1186 = _1120 * 0.800000011920928955078125;
    bool _1188 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1190 = isnan(_926);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = fma(_1182, -0.64999997615814208984375, 1.0);
    float _1202 = fma(_1178, _1178, _1184);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1204;
    float _1208 = sqrt(_1158);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1214 = _1206 * _1144;
    float _1216 = _1120 * (-0.4000000059604644775390625);
    float _1218 = in.m_55.y;
    float _1220 = _1030 * _1172;
    float _1222 = 1.0 / _1156;
    float _1224 = _1008 * _1220;
    float _1226 = _1022 * _1220;
    float _1228 = rsqrt(_1202);
    float _1230 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1232 = abs(_1092);
    float _1234 = 1.0 / _1232;
    float _1236 = _1222 * _1028;
    float _1238 = 1.0 / _1186;
    float _1240 = _1208 * _1234;
    float _1242 = _1240 * 0.25;
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = fma(_1208, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = _1230 * _1220;
    float _1252 = fma(_1248, -2.0, 3.0);
    float _1254 = _1248 * _1248;
    float _1256 = _1168 * _1228;
    float _1258 = _1126 * _1228;
    float _1260 = fma(_1092, _1092, _1138);
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1264 = _1222 * _1038;
    float _1266 = _1178 * _1228;
    float _1268 = fma(_1100, _1100, _1260);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1218);
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1264);
    float _1274 = _1208 * _1238;
    float _1276 = _1252 * _1254;
    float _1278 = _1250 * _1262;
    float _1280 = _994 * _1258;
    float _1282 = _1226 * _1270;
    float _1284 = _1224 * _1272;
    float _1286 = rsqrt(_1268);
    float _1288 = _990 * _1266;
    float _1290 = -_1280;
    float _1292 = fma(_990, _1256, _1290);
    float _1294 = _1282 * _990;
    float _1296 = _1282 * _1002;
    float _1298 = -_1288;
    float _1300 = fma(_1002, _1258, _1298);
    float _1302 = _1002 * _1256;
    float _1304 = fma(_1284, _1258, _1294);
    float _1306 = _1282 * _994;
    float _1308 = -_1302;
    float _1310 = fma(_994, _1266, _1308);
    float _1312 = fma(_1284, _1266, _1296);
    float _1314 = fma(_1284, _1256, _1306);
    float _1316 = fma(_1278, _1310, _1304);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1322 = _1092 * _1286;
    float _1324 = fma(_1278, _1300, _1314);
    float _1326 = fma(_1244, -2.0, 3.0);
    float _1328 = _1244 * _1244;
    float _1330 = _1096 * _1286;
    float _1332 = _1316 * _1322;
    float _1334 = fma(_1278, _1292, _1312);
    float _1336 = -_1276;
    float _1338 = _1336 + 1.0;
    float _1340 = _1100 * _1286;
    float _1342 = fma(_1324, _1330, _1332);
    float _1344 = in.m_57.y;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1350 = _1274 < 0.5;
    float _1352 = float(_1350);
    float _1354 = fma(_1326, _1328, _1338);
    float _1356 = precise::clamp(_1354, 0.0, 1.0);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1360 = _1276;
    if (_1020)
    {
        float _1362 = in.m_53.x;
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = fma(_1334, _1340, _1342);
    float _1368 = 1.0 / _1320;
    float _1370 = _1326;
    if (_1036)
    {
        float _1372 = in.m_53.z;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = -_1352;
    float _1378 = fma(_1376, _1356, 1.0);
    float _1380 = _1330 * _1366;
    float _1382 = _1226 * _1218;
    float _1384 = fma(_1378, 0.89999997615814208984375, 0.100000001490116119384765625);
    float _1386 = 1.0 / _1348;
    float _1388 = _1340 * _1366;
    float _1390 = -_1380;
    float _1392 = _1324 + _1390;
    bool _1394 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1396 = isnan(_926);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1384 * _1382;
    float _1408 = -_1388;
    float _1410 = _1334 + _1408;
    float _1412 = fma(_1380, _1384, _1392);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1414;
    float _1418 = _1212 * _1368;
    float _1420 = fma(_1388, _1384, _1410);
    float _1422 = _968 + _1412;
    float _1424 = -_1344;
    float _1426 = _1424 + 1.0;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1430 = _926 + _1428;
    float _1432 = _974 + _1420;
    float _1434 = _1344;
    if (_1020)
    {
        bool _1436 = _1364 > 0.5;
        _1058 = _1436;
    }
    bool _1438 = _1058;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1442 = _926 + _1440;
    float _1444 = _1416 * _1386;
    float _1446 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1448 = _1422 + _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1452 = _1432 + _1450;
    int _1454 = _1140 ? as_type<int>(_1426) : as_type<int>(_1344);
    float _1456 = fma(_1214, _1442, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1458 = fma(_1448, _1200, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1460 = fma(_1452, _1200, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1462 = _1458;
    float _1464 = _1460;
    if (_1036)
    {
        bool _1466 = _1374 > 0.5;
        _1146 = _1466;
    }
    bool _1468 = _1146;
    float _1470 = fma(_1418, _1430, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1474 = _1458 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1478 = _1460 + _1476;
    bool _1480 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1482 = isnan(_926);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    float _1492 = -_1404;
    float _1494 = _1492 + 1.0;
    float _1496 = _1474 * _1474;
    float _1498 = _1478 * _1478;
    float _1500 = _1322 * _1366;
    float _1502 = -_1490;
    float _1504 = _1502 + 1.0;
    float _1506 = _1286 * _1406;
    float _1508 = _1496 + _1498;
    float _1510 = fma(_1378, 0.5, 0.5);
    float _1512 = _1404 * _1504;
    float _1514 = -_1500;
    float _1516 = _1316 + _1514;
    float _1518 = sqrt(_1508);
    float _1520 = in.m_57.x;
    float _1522 = _1506 * _1506;
    float _1524 = _1276 * _1510;
    float _1526 = fma(_1500, _1384, _1516);
    bool _1528 = _926 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1530 = isnan(_926);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = _1216 * _1522;
    float _1542 = _1540 * 0.5;
    float _1544 = _1198 * _1494;
    float _1546 = _1524 * _1524;
    float _1548 = _962 + _1526;
    float _1550 = -_1198;
    float _1552 = _1550 + 1.0;
    float _1554 = _1042 ? as_type<float>(_1454) : _1344;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1558 = _926 + _1556;
    float _1560 = fma(_1542, _1546, _1548);
    float _1562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1564 = _1538 * _1552;
    bool _1566 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1570 = _1560 + _1568;
    float _1572 = -_1538;
    float _1574 = _1572 + 1.0;
    float _1576 = _1456 * _1564;
    float _1578 = _1570;
    float _1580 = _1496;
    float _1582 = _1498;
    int _1584 = as_type<int>(_1474);
    int _1586 = as_type<int>(_1470);
    float _1588 = _1512;
    if (_1046)
    {
        float _1590 = _1136 ? _1426 : _1344;
        _1434 = _1590;
    }
    float _1592 = _1434;
    float _1594 = fma(_1570, _1200, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1576);
    float _1600 = fma(_1444, _1558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1602 = _1520;
    if (!_1020)
    {
        _1360 = _1520;
    }
    float _1604 = _1360;
    float _1606 = fma(_1470, _1544, _1598);
    float _1608 = _1604;
    if (!_1566)
    {
        _1578 = _1594;
    }
    float _1610 = _1578;
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1614 = !_1566;
    float _1616 = _1610;
    if (!_1614)
    {
        float _1618 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1622 = _1518 + _1620;
        float _1624 = rsqrt(_1508);
        float _1626 = _1622 * _1618;
        float _1628 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = _1626 * 0.15915493667125701904296875;
        float _1632 = _1630 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        float _1636 = _1630 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        float _1640 = fma(_1634, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1642 = _1624 * _1640;
        float _1644 = fma(_1474, _1642, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1646 = _1638 + (-1.0);
        float _1648 = fma(_1478, _1642, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1652 = _1644 + _1650;
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1658 = _1648 + _1656;
        float _1660 = _1652 * _1652;
        float _1662 = fma(_1594, _1638, _1654);
        float _1664 = _1658 * _1658;
        _1616 = _1662;
        _1580 = _1660;
        _1582 = _1664;
        _1462 = _1644;
        _1464 = _1648;
    }
    float _1666 = _1616;
    float _1668 = _1580;
    float _1670 = _1582;
    float _1672 = _1462;
    float _1674 = _1464;
    if (_1020)
    {
        float _1676 = -_1520;
        float _1678 = _1676 + 1.0;
        _1584 = as_type<int>(_1678);
    }
    int _1680 = _1584;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1684 = _1666 + _1682;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1688 = fma(_1600, _1512, _1606);
    if (_1036)
    {
        float _1690 = -_1520;
        float _1692 = _1690 + 1.0;
        _1586 = as_type<int>(_1692);
    }
    int _1694 = _1586;
    float _1696 = fma(_1684, _1684, _1668);
    if (_1020)
    {
        float _1698 = _1438 ? as_type<float>(_1680) : _1520;
        _1608 = _1698;
    }
    float _1700 = _1608;
    float _1702 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1704 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1688);
    float _1706 = _1696 + _1670;
    float _1708 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1712 = _1702 * _1612;
    float _1714 = _1708 * _1596;
    float _1716 = _1712;
    if (_1036)
    {
        float _1718 = _1468 ? as_type<float>(_1694) : _1520;
        _1602 = _1718;
    }
    float _1720 = _1602;
    float _1722 = _1710 * _1562;
    float _1724 = _892 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1726 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1728 = sqrt(_1706);
    float _1730 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1734 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1740 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1734 * _1686;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1750 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1722;
    out.m_59.y = _1714;
    out.m_59.z = _1746;
    out.m_59.w = _1712;
    bool _1756 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1758 = isnan(_1728);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1764 = _1760 || _1762;
    out.m_61.x = _1744;
    out.m_61.y = _1748;
    out.m_61.z = _1750;
    out.m_63.x = _1740;
    out.m_63.y = _1742;
    out.m_63.z = _1752;
    out.m_63.w = _1754;
    out.m_65.x = _1224;
    out.m_65.y = _1226;
    float _1766 = _1736;
    float _1768 = _1740;
    float _1770 = _1742;
    if (!_1764)
    {
        _1766 = 1.0;
    }
    float _1772 = _1766;
    bool _1774 = !_1764;
    float _1776 = _1772;
    if (!_1774)
    {
        bool _1778 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1780 = isnan(_1728);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1786 = _1782 || _1784;
        if (!_1786)
        {
            float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1790 = _1728 + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1794 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1800 = 1.0 / _1794;
            float _1802 = _1790 * _1800;
            float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1776 = _1804;
            _1806 = true;
        }
        else
        {
            bool _1808 = _1728 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1810 = isnan(_1728);
            bool _1812 = _1808 || _1810;
            bool _1814 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1816 = _1812 || _1814;
            if (!_1816)
            {
                float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1820 = _1728 + _1818;
                float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1824 = _1822 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1826 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1828 = _1826 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1830 = 1.0 / _1824;
                float _1832 = _1820 * _1830;
                float _1834 = fma(_1832, _1828, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1776 = _1834;
                _1806 = true;
            }
            else
            {
                _1776 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1806 = false;
    float _1836 = _1776;
    float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1840 = _1666 + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1844 = _1672 + _1842;
    float _1846 = fma(_1840, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1850 = _1674 + _1848;
    float _1852 = fma(_1844, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1854 = -_1072;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _1858 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1860 = -_1074;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1866 = _1856 + _1864;
    float _1868 = -_1118;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1874 = _1862 + _1872;
    float _1876 = _1866 * _1866;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1880 = _1870 + _1878;
    float _1882 = fma(_1874, _1874, _1876);
    float _1884 = fma(_1880, _1880, _1882);
    float _1886 = rsqrt(_1884);
    float _1888 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1874 * _1888;
    float _1892 = _1880 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1880;
    float _1910 = _1898;
    float _1912 = _1906;
    float _1914 = _1866;
    if (_1902)
    {
        float _1916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1916;
    }
    float _1918 = _1908;
    if (_1902)
    {
        float _1920 = rsqrt(_1898);
        _1910 = _1920;
    }
    float _1922 = _1910;
    if (_1902)
    {
        float _1924 = _1906 * _1918;
        _1912 = _1924;
    }
    float _1926 = _1912;
    if (_1902)
    {
        float _1928 = _1926 * 0.15915493667125701904296875;
        _1768 = _1928;
    }
    float _1930 = _1768;
    float _1932 = _1886;
    if (_1902)
    {
        float _1934 = _1930 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1918;
    float _1946 = _1942;
    if (_1902)
    {
        float _1948 = _1930 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1944 = _1950;
    }
    float _1952 = _1944;
    float _1954 = -_1888;
    float _1956 = -_1942;
    float _1958 = fma(_1866, _1954, _1956);
    if (_1902)
    {
        float _1960 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1960;
    }
    float _1962 = _1914;
    float _1964 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = _1938;
    float _1968 = _1962;
    if (_1902)
    {
        float _1970 = fma(_1938, _1962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1716 = _1970;
    }
    float _1972 = _1716;
    float _1974 = _1972;
    if (!_1902)
    {
        _1966 = _1890;
    }
    float _1976 = _1966;
    float _1978 = _1976;
    if (!_1902)
    {
        _1968 = _1958;
    }
    float _1980 = _1968;
    float _1982 = _1980;
    float _1984 = _1952;
    if (_1902)
    {
        float _1986 = _1952 + (-1.0);
        _1946 = _1986;
    }
    float _1988 = _1946;
    float _1990 = _1988;
    if (_1902)
    {
        float _1992 = _1922 * _1972;
        _1588 = _1992;
    }
    float _1994 = _1588;
    if (!_1902)
    {
        _1974 = _1894;
    }
    float _1996 = _1974;
    float _1998 = sqrt(_1884);
    float _2000 = _1996;
    if (_1902)
    {
        float _2002 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _2002;
    }
    float _2004 = _1770;
    if (_1902)
    {
        float _2006 = _1890 * _1994;
        _1978 = _2006;
    }
    float _2008 = _1978;
    if (!_1902)
    {
        _1990 = _1892;
    }
    float _2010 = _1990;
    float _2012 = _2010;
    if (_1902)
    {
        float _2014 = _1892 * _1994;
        _2012 = _2014;
    }
    float _2016 = _2012;
    if (_1902)
    {
        float _2018 = fma(_1958, _1952, _2004);
        _1982 = _2018;
    }
    float _2020 = _1982;
    if (_1902)
    {
        float _2022 = _2008 * _2008;
        _2000 = _2022;
    }
    float _2024 = _2000;
    if (!_1902)
    {
        _1984 = _1896;
    }
    float _2026 = _1984;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2016 * _2016;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = _2034 + _2032;
    float _2038 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2040);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2048 = rsqrt(_2036);
    float _2050 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2038);
    float _2052 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2054 = -_2044;
    float _2056 = _2054 + 1.0;
    float _2058 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2060 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2062 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2052);
    float _2064 = abs(_2056);
    float _2066 = log2(_2064);
    float _2068 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2070 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2062);
    float _2074 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2058);
    float _2076 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = _2048 * _2008;
    float _2084 = -_2076;
    float _2086 = fma(_2084, _2046, 1.0);
    float _2088 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2090 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2092 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2048 * _2020;
    float _2096 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2098 = _2088 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2048 * _2016;
    float _2104 = -_2096;
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2104);
    float _2108 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2110 = log2(_2086);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2114 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2112);
    float _2118 = exp2(_2108);
    float _2120 = -_2102;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2106);
    float _2124 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2114);
    float _2128 = fma(_2122, -0.5, 0.5);
    float _2130 = fma(_2122, 0.5, 0.5);
    float _2132 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2134 = 1.0 / _2116;
    float _2136 = _2094 + 1.0;
    float _2138 = fma(_2130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2140 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2132);
    float _2142 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2126);
    float _2144 = _2110 * 0.693147182464599609375;
    float _2146 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2148 = sqrt(_2128);
    float _2150 = -_2094;
    float _2152 = fma(_2118, _2136, _2150);
    float _2154 = fma(_2130, _2138, -0.212114393711090087890625);
    float _2156 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2158 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2160 = fma(_2152, 0.5, 0.5);
    float _2162 = fma(_2130, _2154, 1.570728778839111328125);
    float _2164 = _2146 * _2134;
    float _2166 = _2156 * _2134;
    float _2168 = fma(_2164, 0.5, 0.5);
    float _2170 = fma(_2166, -0.5, 0.5);
    float _2172 = _2148 * 0.636619746685028076171875;
    float _2174 = -_2162;
    float _2176 = fma(_2172, _2174, 1.0);
    float3 _5912 = float3(_2168, _2170, _2158);
    float _2178 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_2168, _2170, _2158);
    float4 _2181 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _2183 = _2181.x;
    float _2185 = _2181.y;
    float _2187 = _2181.z;
    float _2189 = _2181.w;
    float2 _5940 = float2(_2176, _2160);
    float3 _2193 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _2195 = _2193.x;
    float _2197 = _2193.y;
    float _2199 = _2193.z;
    float _2201 = -_1072;
    float _2203 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _2205 = -_1074;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _2209 = -_1118;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _974);
    float _2213 = _2203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2215 = _2203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2217 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2213);
    float _2219 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2215);
    float _2221 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2217);
    float _2223 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2219);
    float _2225 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2227 = _2223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2229 = 1.0 / _2225;
    float _2231 = _2227 + _2225;
    float _2233 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2235 = _2231 * _2229;
    float _2237 = _2235 * 0.5;
    float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
    bool _2243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    float _2253 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2255 = 1.0 / _2241;
    float _2257 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2253);
    float _2259 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2257);
    float _2261 = exp2(_2233);
    float _2263 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2259);
    float _2265 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2267 = _2237;
    if (_2251)
    {
        _2265 = 1.0;
    }
    float _2269 = _2265;
    float _2271 = _2269;
    if (_2251)
    {
        _2267 = 1.0;
    }
    float _2273 = _2267;
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2277 = _2255 * _2275;
    float _2279 = _2273;
    if (!_2251)
    {
        float _2281 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2283 = _2281 * 0.15915493667125701904296875;
        float _2285 = _2283 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        float _2289 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2291 = _2289 * 0.15915493667125701904296875;
        float _2293 = _2283 * 6.283185482025146484375;
        float _2295 = sin(_2293);
        float _2297 = 1.0 / _2287;
        float _2299 = _2291 * 6.283185482025146484375;
        float _2301 = cos(_2299);
        float _2303 = _2295 * _2297;
        float _2305 = _2291 * 6.283185482025146484375;
        float _2307 = sin(_2305);
        float _2309 = _2301 * _2303;
        float _2311 = 1.0 / _2309;
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2313;
        float _2317 = 1.0 / _2315;
        float _2319 = _2307 * _2311;
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = fma(_2277, _2319, _2321);
        float _2325 = _2323 * _2317;
        float _2327 = precise::clamp(_2325, 0.0, 1.0);
        _2271 = _2327;
    }
    float _2329 = _2271;
    if (!_2251)
    {
        float _2331 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2333 = _2331 * 0.15915493667125701904296875;
        float _2335 = _2333 * 6.283185482025146484375;
        float _2337 = cos(_2335);
        float _2339 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2341 = _2339 * 0.15915493667125701904296875;
        float _2343 = _2333 * 6.283185482025146484375;
        float _2345 = sin(_2343);
        float _2347 = 1.0 / _2337;
        float _2349 = _2341 * 6.283185482025146484375;
        float _2351 = cos(_2349);
        float _2353 = _2345 * _2347;
        float _2355 = _2341 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = _2351 * _2353;
        float _2361 = 1.0 / _2359;
        float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2365 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2363;
        float _2367 = 1.0 / _2365;
        float _2369 = _2357 * _2361;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2373 = fma(_2277, _2369, _2371);
        float _2375 = _2373 * _2367;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        float _2379 = -_2377;
        float _2381 = _2379 + 1.0;
        _2279 = _2381;
    }
    float _2383 = _2279;
    float _2385 = _2329 * _2383;
    float _2387 = _2263 + _2116;
    float _2389 = -_2261;
    float _2391 = _2389 + 1.0;
    bool _2393 = _2329 > 0.0;
    bool _2395 = isnan(_2329);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    float _2403 = _2385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2405 = _2387 * 0.5;
    float _2407 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2409 = _2383 <= 0.0;
    bool _2411 = !_2401;
    bool _2413 = _2409 || _2411;
    float _2415 = _2407 * _2178;
    float _2417 = -_2407;
    float _2419 = _2417 + 1.0;
    float _2421 = _2403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2423 = _2189 * _2415;
    float _2425 = _2199 * _2415;
    float _2427 = _2189 * _2419;
    out.gl_Position.x = _2146;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2263;
    out.gl_Position.w = _2116;
    float _2429 = fma(_2195, _2423, _2183);
    float _2431 = fma(_2197, _2423, _2185);
    float _2433 = fma(_2189, _2425, _2187);
    out.m_67.z = _2405;
    out.m_67.w = _2116;
    out.m_47.x = _2421;
    out.m_69.x = _2429;
    out.m_69.y = _2431;
    out.m_69.z = _2433;
    out.m_69.w = _2427;
    if (!_2413)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2435;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

