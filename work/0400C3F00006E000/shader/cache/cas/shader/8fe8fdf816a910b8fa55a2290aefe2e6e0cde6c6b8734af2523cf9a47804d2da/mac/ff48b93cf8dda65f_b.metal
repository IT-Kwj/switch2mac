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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _620 = false;
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1734 = as_type<float>(_104);
        out.gl_Position.z = _1734;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _98 = _128;
    }
    float _130 = _98;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_144);
        out.gl_Position.z = _1805;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_47.x;
    float _150 = in.m_47.y;
    float _152 = in.m_47.z;
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
        _124 = _210;
        _190 = _220;
        _126 = _208;
    }
    float _222 = _124;
    float _224 = _190;
    float _226 = _126;
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
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = fma(_332, _148, _340);
    float _350 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_258, _152, _350);
    float _364 = _354 * _354;
    float _366 = in.m_49.w;
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = -_356;
    float _372 = _362 + _370;
    float _374 = fma(_360, _360, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _382 = fma(_372, _372, _374);
    float _384 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = in.m_42.x;
    float _388 = in.m_42.y;
    float _390 = in.m_42.z;
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _398 = sqrt(_382);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_362, _366, _390);
    float _418 = _392;
    float _420 = _396;
    float _422 = _400;
    if (_410)
    {
        _418 = _396;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _394;
    }
    float _428 = _420;
    float _430 = _428;
    if (!_410)
    {
        bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _434 = !_432;
        if (!_434)
        {
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
            float _454 = _448 * _448;
            float _456 = fma(_450, _450, _454);
            float _458 = fma(_452, _452, _456);
            float _460 = rsqrt(_458);
            float _462 = _460 * 9.9999999747524270787835121154785e-07;
            float _464 = _450 * _462;
            float _466 = _448 * _462;
            float _468 = _452 * _462;
            _430 = _466;
            _426 = _464;
            _422 = _468;
            _470 = true;
        }
        else
        {
            float _472 = _150 * _150;
            float _474 = fma(_148, _148, _472);
            float _476 = fma(_152, _152, _474);
            float _478 = sqrt(_476);
            bool _480 = _478 >= 9.9999999747524270787835121154785e-07;
            bool _482 = isnan(_478);
            bool _484 = _480 || _482;
            bool _486 = isnan(9.9999999747524270787835121154785e-07);
            bool _488 = _484 || _486;
            if (!_488)
            {
                float _490 = _388 * _388;
                float _492 = fma(_386, _386, _490);
                float _494 = fma(_390, _390, _492);
                float _496 = sqrt(_494);
                bool _498 = _496 >= 9.9999999747524270787835121154785e-07;
                bool _500 = isnan(_496);
                bool _502 = _498 || _500;
                bool _504 = isnan(9.9999999747524270787835121154785e-07);
                bool _506 = _502 || _504;
                if (!_506)
                {
                    float _508 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _508);
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _510);
                    float _514 = rsqrt(_512);
                    float _516 = _514 * 9.9999999747524270787835121154785e-07;
                    float _518 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _520;
                    _426 = _518;
                    _422 = _522;
                    _470 = true;
                }
                else
                {
                    float _524 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _530 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
                    float _532 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
                    float _534 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
                    float _536 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
                    float _538 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _532);
                    float _540 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _534);
                    float _542 = _536 * _536;
                    float _544 = fma(_538, _538, _542);
                    float _546 = fma(_540, _540, _544);
                    float _548 = rsqrt(_546);
                    float _550 = _548 * 9.9999999747524270787835121154785e-07;
                    float _552 = _538 * _550;
                    float _554 = _536 * _550;
                    float _556 = _540 * _550;
                    _430 = _554;
                    _426 = _552;
                    _422 = _556;
                    _470 = true;
                }
            }
            else
            {
                float _558 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _560 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _562 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _564 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
                float _570 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _564);
                float _572 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _566);
                float _574 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
                float _576 = _570 * _570;
                float _578 = fma(_572, _572, _576);
                float _580 = fma(_574, _574, _578);
                float _582 = rsqrt(_580);
                float _584 = _582 * 9.9999999747524270787835121154785e-07;
                float _586 = _572 * _584;
                float _588 = _570 * _584;
                float _590 = _574 * _584;
                _430 = _588;
                _426 = _586;
                _422 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _430;
    float _594 = _426;
    float _596 = _422;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _600 = !_598;
    float _618;
    if (!_600)
    {
        float _602 = in.m_51.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_88);
        float _624 = 1.0 / _622;
        float _626 = _122 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _632 = _628 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _628 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _654;
    float _658 = 1.0 / _644;
    bool _660 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _662 = isnan(_628);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = 1.0 / _652;
    bool _674 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _676 = isnan(_628);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _694 = 1.0 / _648;
    float _696 = 1.0 / _656;
    float _698 = 1.0 / _640;
    float _700 = _632 * _694;
    float _702 = _592 * _592;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _710 = _628 + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _716 = _710 * _658;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _720 = _628 + _718;
    float _722 = _636 * _698;
    float _724 = _720 * _672;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _728 = _628 + _726;
    float _730 = fma(_714, _716, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _732 = fma(_692, _716, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _734;
    float _738 = _728 * _696;
    float _740 = fma(_594, _594, _702);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _746 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _748 = isnan(_628);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_706, _722, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _760 = fma(_596, _596, _740);
    float _762 = fma(_744, _716, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _764 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _766 = isnan(_628);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_756;
    float _778 = _776 + 1.0;
    float _780 = rsqrt(_760);
    float _782 = fma(_736, _722, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _784 = fma(_688, _722, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _786 = _774 * _778;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _796;
    float _800 = -_774;
    float _802 = _800 + 1.0;
    float _804 = fma(_790, _700, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _806 = fma(_794, _700, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _808 = fma(_798, _700, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _810 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _812 = isnan(_628);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -_670;
    float _824 = _822 + 1.0;
    float _826 = _684 * _802;
    float _828 = -_684;
    float _830 = _828 + 1.0;
    float _832 = _780 * _592;
    float _834 = _780 * _594;
    float _836 = _780 * _596;
    bool _838 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _840 = isnan(_628);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = _832 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _852 = _820 * _824;
    float _854 = -_820;
    float _856 = _854 + 1.0;
    float _858 = _670 * _830;
    float _860 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[8].y, _850);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _874 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].y, _860);
    float _876 = _848 * _856;
    float _878 = fma(_864, _724, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _880 = fma(_868, _724, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _882 = fma(_872, _724, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _884 = abs(_874);
    bool _886 = _884 > 0.99989998340606689453125;
    float _888 = _758 * _876;
    float _890 = _782 * _876;
    float _892 = -_848;
    float _894 = _892 + 1.0;
    float _896 = _784 * _876;
    float _898 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _900 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].y, _890);
    float _902 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].z, _896);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _912;
    float _916 = fma(_730, _852, _898);
    float _918 = fma(_906, _738, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _920 = fma(_910, _738, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _922 = fma(_914, _738, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _924 = fma(_762, _852, _900);
    float _926 = fma(_732, _852, _902);
    float _928 = fma(_804, _858, _916);
    float _930 = _852;
    float _932 = _804;
    float _934 = _808;
    float _936 = _910;
    if (_886)
    {
        _930 = 0.001000000047497451305389404296875;
    }
    float _938 = _930;
    float _940 = fma(_806, _858, _924);
    float _942 = fma(_808, _858, _926);
    if (!_886)
    {
        _932 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _944 = _932;
    float _946 = fma(_878, _826, _928);
    float _948 = _944;
    if (_886)
    {
        float _950 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _948 = _950;
    }
    float _952 = _948;
    float _954 = in.m_49.x;
    float _956 = in.m_49.y;
    float _958 = in.m_49.z;
    float _960 = fma(_880, _826, _940);
    if (!_886)
    {
        _934 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _962 = _934;
    float _964 = _962;
    if (_886)
    {
        float _966 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = -_952;
    float _972 = _836 * _970;
    float _974 = in.m_53.x;
    float _976 = in.m_53.y;
    float _978 = in.m_53.z;
    if (!_886)
    {
        _936 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _980 = _936;
    float _982 = fma(_882, _826, _942);
    float _984 = _980;
    if (_886)
    {
        float _986 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _984 = _986;
    }
    float _988 = _984;
    float _990 = -_968;
    float _992 = _832 * _990;
    float _994 = -_968;
    float _996 = -_972;
    float _998 = fma(_834, _994, _996);
    float _1000 = fma(_918, _786, _946);
    float _1002 = -_988;
    float _1004 = _834 * _1002;
    float _1006 = -_988;
    float _1008 = -_992;
    float _1010 = fma(_836, _1006, _1008);
    float _1012 = _998 * _998;
    float _1014 = fma(_920, _786, _960);
    float _1016 = -_952;
    float _1018 = -_1004;
    float _1020 = fma(_832, _1016, _1018);
    float _1022 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1000);
    float _1024 = fma(_1010, _1010, _1012);
    float _1026 = fma(_922, _786, _982);
    float _1028 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1014);
    float _1030 = fma(_1020, _1020, _1024);
    float _1032 = _1022 * _954;
    float _1034 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1026);
    float _1036 = _1028 * _956;
    float _1038 = rsqrt(_1030);
    float _1040 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = _1034 * _958;
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _974);
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _978);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _976);
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1052 = _1040 * _1044;
    float _1054 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1058 = _1050 * _1046;
    float _1060 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1062 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1054);
    float _1064 = _1056 * _1048;
    float _1066 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1060);
    float _1068 = _998 * _1038;
    float _1070 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1072 = _1010 * _1038;
    float _1074 = _1020 * _1038;
    float _1076 = _1064 * _836;
    float _1078 = _834 * _1068;
    float _1080 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1066);
    float _1082 = _1064 * _834;
    float _1084 = fma(_1052, _1074, _1076);
    float _1086 = _832 * _1074;
    float _1088 = -_1078;
    float _1090 = fma(_832, _1072, _1088);
    float _1092 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = fma(_1052, _1072, _1082);
    float _1096 = -_1086;
    float _1098 = fma(_836, _1068, _1096);
    float _1100 = fma(_1058, _1090, _1084);
    float _1102 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = fma(_1058, _1098, _1094);
    float _1106 = _1092 + _1100;
    float _1108 = _1102 + _1104;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1112 = _1106 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1116 = _1108 + _1114;
    float _1118 = _1112 * _1112;
    float _1120 = fma(_1116, _1116, _1118);
    float _1122 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1124 = sqrt(_1120);
    float _1126 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1122);
    float _1128 = _1064 * _832;
    float _1130 = _836 * _1072;
    float _1132 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1126);
    float _1134 = fma(_1052, _1068, _1128);
    float _1136 = -_1130;
    float _1138 = fma(_834, _1074, _1136);
    float _1140 = _1132 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1142 = fma(_1058, _1138, _1134);
    float _1144 = _1140 + _1142;
    bool _1146 = _1124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1142;
    float _1150 = _1104;
    float _1152 = _1108;
    float _1154 = _1112;
    float _1156 = _1144;
    if (!_1146)
    {
        _1148 = _1108;
    }
    float _1158 = _1148;
    float _1160 = _1158;
    if (!_1146)
    {
        _1150 = _1106;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1146)
    {
        _1152 = _1144;
    }
    float _1166 = _1152;
    bool _1168 = !_1146;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1124 + _1174;
        float _1178 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1120);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1188 + (-1.0);
        float _1196 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = fma(_1192, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1200 = fma(_1144, _1188, _1196);
        float _1202 = _1180 * _1198;
        float _1204 = fma(_1116, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1206 = fma(_1112, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1170 = _1200;
        _1160 = _1204;
        _1164 = _1206;
    }
    float _1208 = _1170;
    float _1210 = _1160;
    float _1212 = _1164;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1216 = _1208 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1220 = _1210 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1224 = _1212 + _1222;
    float _1226 = _1216 * _1216;
    float _1228 = fma(_1220, _1220, _1226);
    float _1230 = fma(_1224, _1224, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1236 = _1220 * _1234;
    float _1238 = _1224 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 * _1238;
    float _1244 = _1240 + _1242;
    float _1246 = sqrt(_1244);
    bool _1248 = _1246 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1252 = _1246 + _1250;
    float _1254 = _1224;
    float _1256 = _1252;
    float _1258 = _1216;
    if (_1248)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (_1248)
    {
        float _1264 = rsqrt(_1244);
        _1154 = _1264;
    }
    float _1266 = _1154;
    float _1268 = _1266;
    if (_1248)
    {
        float _1270 = _1252 * _1262;
        _1256 = _1270;
    }
    float _1272 = _1256;
    if (_1248)
    {
        float _1274 = _1272 * 0.15915493667125701904296875;
        _1156 = _1274;
    }
    float _1276 = _1156;
    float _1278 = _1226;
    if (_1248)
    {
        float _1280 = _1276 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        _1278 = _1282;
    }
    float _1284 = _1278;
    float _1286 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1288 = precise::max(0.0, _1286);
    float _1290 = _1232;
    float _1292 = _1288;
    float _1294 = _1286;
    if (_1248)
    {
        float _1296 = _1276 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        _1290 = _1298;
    }
    float _1300 = _1290;
    float _1302 = -_1234;
    float _1304 = -_1288;
    float _1306 = fma(_1216, _1302, _1304);
    if (!_1248)
    {
        _1292 = _1236;
    }
    float _1308 = _1292;
    float _1310 = _1308;
    if (_1248)
    {
        float _1312 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1294 = _1312;
    }
    float _1314 = _1294;
    float _1316 = sqrt(_1230);
    float _1318 = _1284;
    float _1320 = _1314;
    if (_1248)
    {
        float _1322 = fma(_1284, _1314, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1258 = _1322;
    }
    float _1324 = _1258;
    float _1326 = _1324;
    if (!_1248)
    {
        _1318 = _1240;
    }
    float _1328 = _1318;
    float _1330 = _1328;
    float _1332 = _1300;
    if (_1248)
    {
        float _1334 = _1300 + (-1.0);
        _1320 = _1334;
    }
    float _1336 = _1320;
    float _1338 = 0.0;
    float _1340 = _1336;
    if (_1248)
    {
        float _1342 = _1266 * _1324;
        _1338 = _1342;
    }
    float _1344 = _1338;
    if (!_1248)
    {
        _1326 = _1306;
    }
    float _1346 = _1326;
    float _1348 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1350 = _1346;
    if (_1248)
    {
        float _1352 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1352;
    }
    float _1354 = _1268;
    if (_1248)
    {
        float _1356 = _1236 * _1344;
        _1310 = _1356;
    }
    float _1358 = _1310;
    if (!_1248)
    {
        _1340 = _1238;
    }
    float _1360 = _1340;
    float _1362 = _1360;
    if (_1248)
    {
        float _1364 = _1238 * _1344;
        _1362 = _1364;
    }
    float _1366 = _1362;
    if (_1248)
    {
        float _1368 = fma(_1306, _1300, _1354);
        _1350 = _1368;
    }
    float _1370 = _1350;
    if (_1248)
    {
        float _1372 = _1358 * _1358;
        _1330 = _1372;
    }
    float _1374 = _1330;
    if (!_1248)
    {
        _1332 = _1242;
    }
    float _1376 = _1332;
    float _1378 = _1376;
    if (_1248)
    {
        float _1380 = _1366 * _1366;
        _1378 = _1380;
    }
    float _1382 = _1378;
    float _1384 = fma(_1370, _1370, _1374);
    float _1386 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1348);
    float _1388 = _1384 + _1382;
    float _1390 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1394 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1392);
    float _1396 = precise::clamp(_1394, 0.0, 1.0);
    float _1398 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1400 = rsqrt(_1388);
    float _1402 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1390);
    float _1404 = -_1396;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1398);
    float _1410 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1414 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1416 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1408);
    float _1418 = abs(_1406);
    float _1420 = log2(_1418);
    float _1422 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1424 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1414);
    float _1426 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1428 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1434 = _1400 * _1358;
    float _1436 = -_1430;
    float _1438 = fma(_1436, _1410, 1.0);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1442 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1400 * _1370;
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1448 = _1400 * _1366;
    float _1450 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1454 = -_1446;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1454);
    float _1458 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1462 = log2(_1438);
    float _1464 = -_1448;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1456);
    float _1468 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1472 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = fma(_1466, -0.5, 0.5);
    float _1476 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1468);
    float _1478 = fma(_1466, 0.5, 0.5);
    float _1480 = exp2(_1458);
    float _1482 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1476);
    float _1486 = _1444 + 1.0;
    float _1488 = fma(_1478, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1490 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1492 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1484);
    float _1494 = 1.0 / _1470;
    float _1496 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1490);
    float _1498 = fma(_1478, _1488, -0.212114393711090087890625);
    float _1500 = _1462 * 0.693147182464599609375;
    float _1502 = fma(_1478, _1498, 1.570728778839111328125);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1506 = sqrt(_1474);
    float _1508 = -_1444;
    float _1510 = fma(_1480, _1486, _1508);
    float _1512 = fma(_1510, 0.5, 0.5);
    float _1514 = _1492 * _1494;
    float _1516 = _1496 * _1494;
    float _1518 = fma(_1514, 0.5, 0.5);
    float _1520 = fma(_1516, -0.5, 0.5);
    float _1522 = _1506 * 0.636619746685028076171875;
    float3 _4099 = float3(_1518, _1520, _1504);
    float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4099, float3(0.0), isnan(_4099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4099, float3(0.0), isnan(_4099)), level(0.0)).x;
    float _1526 = -_1502;
    float _1528 = fma(_1522, _1526, 1.0);
    float3 _4115 = float3(_1518, _1520, _1504);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4115, float3(0.0), isnan(_4115)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4115, float3(0.0), isnan(_4115)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4132 = float2(_1528, _1512);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4132, float2(0.0), isnan(_4132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4132, float2(0.0), isnan(_4132)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_55.x;
    float _1553 = in.m_55.y;
    float _1555 = in.m_55.z;
    bool _1557 = _976 != 0.0;
    bool _1559 = isnan(_976);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan(0.0);
    bool _1565 = _1561 || _1563;
    float _1567 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_57.x = _1210;
    out.m_57.y = _1208;
    out.m_57.z = _1212;
    bool _1569 = _974 == 0.0;
    bool _1571 = !_1565;
    bool _1573 = _1569 && _1571;
    float _1575 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1567);
    bool _1577 = _978 == 0.0;
    bool _1579 = _1577 && _1573;
    float _1581 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1575);
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1585 = _1583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1553;
    float _1589 = _1551;
    float _1591 = _1555;
    if (!_1579)
    {
        float _1593 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1553);
        _1587 = _1593;
    }
    float _1595 = _1587;
    if (!_1579)
    {
        float _1597 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (!_1579)
    {
        float _1601 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1555);
        _1591 = _1601;
    }
    float _1603 = _1591;
    float _1605 = _834 * _1595;
    float _1607 = _832 * _1595;
    float _1609 = _836 * _1595;
    float _1611 = fma(_1072, _1599, _1605);
    float _1613 = fma(_1068, _1599, _1607);
    float _1615 = fma(_1074, _1599, _1609);
    float _1617 = fma(_1098, _1603, _1611);
    float _1619 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1621 = fma(_1138, _1603, _1613);
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1629 = exp2(_1619);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1633 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1639 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1641 = fma(_1090, _1603, _1615);
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1633;
    out.m_59.y = _1635;
    out.m_59.z = _1637;
    float _1645 = _1639 + _1470;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_61.x = _1617;
    out.m_61.y = _1621;
    out.m_61.z = _1641;
    float _1649 = _1645 * 0.5;
    float _1651 = -_1629;
    float _1653 = _1651 + 1.0;
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.z = _1649;
    out.m_63.w = _1470;
    float _1657 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1643;
    out.m_65.y = _1655;
    out.m_65.z = _1585;
    out.gl_Position.x = _1492;
    out.gl_Position.y = _1496;
    out.gl_Position.z = _1639;
    out.gl_Position.w = _1470;
    out.m_67.w = _1659;
    float _1661 = _1657 * _1524;
    float _1663 = -_1657;
    float _1665 = _1663 + 1.0;
    float _1667 = _1539 * _1661;
    float _1669 = _1539 * _1665;
    float _1671 = _1549 * _1661;
    float _1673 = fma(_1545, _1667, _1533);
    float _1675 = fma(_1547, _1667, _1535);
    float _1677 = fma(_1539, _1671, _1537);
    out.m_45.x = 1.0;
    out.m_69.x = _1673;
    out.m_69.y = _1675;
    out.m_69.z = _1677;
    out.m_69.w = _1669;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _620 = false;
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1734 = as_type<float>(_104);
        out.gl_Position.z = _1734;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _98 = _128;
    }
    float _130 = _98;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_144);
        out.gl_Position.z = _1805;
    }
    if (_136)
    {
        return out;
    }
    float _148 = in.m_47.x;
    float _150 = in.m_47.y;
    float _152 = in.m_47.z;
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
        _124 = _210;
        _190 = _220;
        _126 = _208;
    }
    float _222 = _124;
    float _224 = _190;
    float _226 = _126;
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
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = fma(_332, _148, _340);
    float _350 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_258, _152, _350);
    float _364 = _354 * _354;
    float _366 = in.m_49.w;
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = -_356;
    float _372 = _362 + _370;
    float _374 = fma(_360, _360, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _382 = fma(_372, _372, _374);
    float _384 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = in.m_42.x;
    float _388 = in.m_42.y;
    float _390 = in.m_42.z;
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _398 = sqrt(_382);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_362, _366, _390);
    float _418 = _392;
    float _420 = _396;
    float _422 = _400;
    if (_410)
    {
        _418 = _396;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _394;
    }
    float _428 = _420;
    float _430 = _428;
    if (!_410)
    {
        bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _434 = !_432;
        if (!_434)
        {
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
            float _454 = _448 * _448;
            float _456 = fma(_450, _450, _454);
            float _458 = fma(_452, _452, _456);
            float _460 = rsqrt(_458);
            float _462 = _460 * 9.9999999747524270787835121154785e-07;
            float _464 = _450 * _462;
            float _466 = _448 * _462;
            float _468 = _452 * _462;
            _430 = _466;
            _426 = _464;
            _422 = _468;
            _470 = true;
        }
        else
        {
            float _472 = _150 * _150;
            float _474 = fma(_148, _148, _472);
            float _476 = fma(_152, _152, _474);
            float _478 = sqrt(_476);
            bool _480 = _478 >= 9.9999999747524270787835121154785e-07;
            bool _482 = isnan(_478);
            bool _484 = _480 || _482;
            bool _486 = isnan(9.9999999747524270787835121154785e-07);
            bool _488 = _484 || _486;
            if (!_488)
            {
                float _490 = _388 * _388;
                float _492 = fma(_386, _386, _490);
                float _494 = fma(_390, _390, _492);
                float _496 = sqrt(_494);
                bool _498 = _496 >= 9.9999999747524270787835121154785e-07;
                bool _500 = isnan(_496);
                bool _502 = _498 || _500;
                bool _504 = isnan(9.9999999747524270787835121154785e-07);
                bool _506 = _502 || _504;
                if (!_506)
                {
                    float _508 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _508);
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _510);
                    float _514 = rsqrt(_512);
                    float _516 = _514 * 9.9999999747524270787835121154785e-07;
                    float _518 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _520;
                    _426 = _518;
                    _422 = _522;
                    _470 = true;
                }
                else
                {
                    float _524 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _530 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
                    float _532 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
                    float _534 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
                    float _536 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
                    float _538 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _532);
                    float _540 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _534);
                    float _542 = _536 * _536;
                    float _544 = fma(_538, _538, _542);
                    float _546 = fma(_540, _540, _544);
                    float _548 = rsqrt(_546);
                    float _550 = _548 * 9.9999999747524270787835121154785e-07;
                    float _552 = _538 * _550;
                    float _554 = _536 * _550;
                    float _556 = _540 * _550;
                    _430 = _554;
                    _426 = _552;
                    _422 = _556;
                    _470 = true;
                }
            }
            else
            {
                float _558 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _560 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _562 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _564 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
                float _570 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _564);
                float _572 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _566);
                float _574 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
                float _576 = _570 * _570;
                float _578 = fma(_572, _572, _576);
                float _580 = fma(_574, _574, _578);
                float _582 = rsqrt(_580);
                float _584 = _582 * 9.9999999747524270787835121154785e-07;
                float _586 = _572 * _584;
                float _588 = _570 * _584;
                float _590 = _574 * _584;
                _430 = _588;
                _426 = _586;
                _422 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _430;
    float _594 = _426;
    float _596 = _422;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _600 = !_598;
    float _618;
    if (!_600)
    {
        float _602 = in.m_51.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_88);
        float _624 = 1.0 / _622;
        float _626 = _122 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _632 = _628 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _628 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _654;
    float _658 = 1.0 / _644;
    bool _660 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _662 = isnan(_628);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = 1.0 / _652;
    bool _674 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _676 = isnan(_628);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _694 = 1.0 / _648;
    float _696 = 1.0 / _656;
    float _698 = 1.0 / _640;
    float _700 = _632 * _694;
    float _702 = _592 * _592;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _710 = _628 + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _716 = _710 * _658;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _720 = _628 + _718;
    float _722 = _636 * _698;
    float _724 = _720 * _672;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _728 = _628 + _726;
    float _730 = fma(_714, _716, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _732 = fma(_692, _716, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _734;
    float _738 = _728 * _696;
    float _740 = fma(_594, _594, _702);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _746 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _748 = isnan(_628);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_706, _722, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _760 = fma(_596, _596, _740);
    float _762 = fma(_744, _716, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _764 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _766 = isnan(_628);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_756;
    float _778 = _776 + 1.0;
    float _780 = rsqrt(_760);
    float _782 = fma(_736, _722, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _784 = fma(_688, _722, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _786 = _774 * _778;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _796;
    float _800 = -_774;
    float _802 = _800 + 1.0;
    float _804 = fma(_790, _700, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _806 = fma(_794, _700, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _808 = fma(_798, _700, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _810 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _812 = isnan(_628);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -_670;
    float _824 = _822 + 1.0;
    float _826 = _684 * _802;
    float _828 = -_684;
    float _830 = _828 + 1.0;
    float _832 = _780 * _592;
    float _834 = _780 * _594;
    float _836 = _780 * _596;
    bool _838 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _840 = isnan(_628);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = _832 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _852 = _820 * _824;
    float _854 = -_820;
    float _856 = _854 + 1.0;
    float _858 = _670 * _830;
    float _860 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[8].y, _850);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _874 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].y, _860);
    float _876 = _848 * _856;
    float _878 = fma(_864, _724, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _880 = fma(_868, _724, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _882 = fma(_872, _724, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _884 = abs(_874);
    bool _886 = _884 > 0.99989998340606689453125;
    float _888 = _758 * _876;
    float _890 = _782 * _876;
    float _892 = -_848;
    float _894 = _892 + 1.0;
    float _896 = _784 * _876;
    float _898 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _900 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].y, _890);
    float _902 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].z, _896);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _912;
    float _916 = fma(_730, _852, _898);
    float _918 = fma(_906, _738, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _920 = fma(_910, _738, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _922 = fma(_914, _738, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _924 = fma(_762, _852, _900);
    float _926 = fma(_732, _852, _902);
    float _928 = fma(_804, _858, _916);
    float _930 = _852;
    float _932 = _804;
    float _934 = _808;
    float _936 = _910;
    if (_886)
    {
        _930 = 0.001000000047497451305389404296875;
    }
    float _938 = _930;
    float _940 = fma(_806, _858, _924);
    float _942 = fma(_808, _858, _926);
    if (!_886)
    {
        _932 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _944 = _932;
    float _946 = fma(_878, _826, _928);
    float _948 = _944;
    if (_886)
    {
        float _950 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _948 = _950;
    }
    float _952 = _948;
    float _954 = in.m_49.x;
    float _956 = in.m_49.y;
    float _958 = in.m_49.z;
    float _960 = fma(_880, _826, _940);
    if (!_886)
    {
        _934 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _962 = _934;
    float _964 = _962;
    if (_886)
    {
        float _966 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = -_952;
    float _972 = _836 * _970;
    float _974 = in.m_53.x;
    float _976 = in.m_53.y;
    float _978 = in.m_53.z;
    if (!_886)
    {
        _936 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _980 = _936;
    float _982 = fma(_882, _826, _942);
    float _984 = _980;
    if (_886)
    {
        float _986 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _984 = _986;
    }
    float _988 = _984;
    float _990 = -_968;
    float _992 = _832 * _990;
    float _994 = -_968;
    float _996 = -_972;
    float _998 = fma(_834, _994, _996);
    float _1000 = fma(_918, _786, _946);
    float _1002 = -_988;
    float _1004 = _834 * _1002;
    float _1006 = -_988;
    float _1008 = -_992;
    float _1010 = fma(_836, _1006, _1008);
    float _1012 = _998 * _998;
    float _1014 = fma(_920, _786, _960);
    float _1016 = -_952;
    float _1018 = -_1004;
    float _1020 = fma(_832, _1016, _1018);
    float _1022 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1000);
    float _1024 = fma(_1010, _1010, _1012);
    float _1026 = fma(_922, _786, _982);
    float _1028 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1014);
    float _1030 = fma(_1020, _1020, _1024);
    float _1032 = _1022 * _954;
    float _1034 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1026);
    float _1036 = _1028 * _956;
    float _1038 = rsqrt(_1030);
    float _1040 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = _1034 * _958;
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _974);
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _978);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _976);
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1052 = _1040 * _1044;
    float _1054 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1058 = _1050 * _1046;
    float _1060 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1062 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1054);
    float _1064 = _1056 * _1048;
    float _1066 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1060);
    float _1068 = _998 * _1038;
    float _1070 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1072 = _1010 * _1038;
    float _1074 = _1020 * _1038;
    float _1076 = _1064 * _836;
    float _1078 = _834 * _1068;
    float _1080 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1066);
    float _1082 = _1064 * _834;
    float _1084 = fma(_1052, _1074, _1076);
    float _1086 = _832 * _1074;
    float _1088 = -_1078;
    float _1090 = fma(_832, _1072, _1088);
    float _1092 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = fma(_1052, _1072, _1082);
    float _1096 = -_1086;
    float _1098 = fma(_836, _1068, _1096);
    float _1100 = fma(_1058, _1090, _1084);
    float _1102 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = fma(_1058, _1098, _1094);
    float _1106 = _1092 + _1100;
    float _1108 = _1102 + _1104;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1112 = _1106 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1116 = _1108 + _1114;
    float _1118 = _1112 * _1112;
    float _1120 = fma(_1116, _1116, _1118);
    float _1122 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1124 = sqrt(_1120);
    float _1126 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1122);
    float _1128 = _1064 * _832;
    float _1130 = _836 * _1072;
    float _1132 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1126);
    float _1134 = fma(_1052, _1068, _1128);
    float _1136 = -_1130;
    float _1138 = fma(_834, _1074, _1136);
    float _1140 = _1132 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1142 = fma(_1058, _1138, _1134);
    float _1144 = _1140 + _1142;
    bool _1146 = _1124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1142;
    float _1150 = _1104;
    float _1152 = _1108;
    float _1154 = _1112;
    float _1156 = _1144;
    if (!_1146)
    {
        _1148 = _1108;
    }
    float _1158 = _1148;
    float _1160 = _1158;
    if (!_1146)
    {
        _1150 = _1106;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1146)
    {
        _1152 = _1144;
    }
    float _1166 = _1152;
    bool _1168 = !_1146;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1124 + _1174;
        float _1178 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1120);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1188 + (-1.0);
        float _1196 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = fma(_1192, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1200 = fma(_1144, _1188, _1196);
        float _1202 = _1180 * _1198;
        float _1204 = fma(_1116, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1206 = fma(_1112, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1170 = _1200;
        _1160 = _1204;
        _1164 = _1206;
    }
    float _1208 = _1170;
    float _1210 = _1160;
    float _1212 = _1164;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1216 = _1208 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1220 = _1210 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1224 = _1212 + _1222;
    float _1226 = _1216 * _1216;
    float _1228 = fma(_1220, _1220, _1226);
    float _1230 = fma(_1224, _1224, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1236 = _1220 * _1234;
    float _1238 = _1224 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 * _1238;
    float _1244 = _1240 + _1242;
    float _1246 = sqrt(_1244);
    bool _1248 = _1246 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1252 = _1246 + _1250;
    float _1254 = _1224;
    float _1256 = _1252;
    float _1258 = _1216;
    if (_1248)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (_1248)
    {
        float _1264 = rsqrt(_1244);
        _1154 = _1264;
    }
    float _1266 = _1154;
    float _1268 = _1266;
    if (_1248)
    {
        float _1270 = _1252 * _1262;
        _1256 = _1270;
    }
    float _1272 = _1256;
    if (_1248)
    {
        float _1274 = _1272 * 0.15915493667125701904296875;
        _1156 = _1274;
    }
    float _1276 = _1156;
    float _1278 = _1226;
    if (_1248)
    {
        float _1280 = _1276 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        _1278 = _1282;
    }
    float _1284 = _1278;
    float _1286 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1288 = precise::max(0.0, _1286);
    float _1290 = _1232;
    float _1292 = _1288;
    float _1294 = _1286;
    if (_1248)
    {
        float _1296 = _1276 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        _1290 = _1298;
    }
    float _1300 = _1290;
    float _1302 = -_1234;
    float _1304 = -_1288;
    float _1306 = fma(_1216, _1302, _1304);
    if (!_1248)
    {
        _1292 = _1236;
    }
    float _1308 = _1292;
    float _1310 = _1308;
    if (_1248)
    {
        float _1312 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1294 = _1312;
    }
    float _1314 = _1294;
    float _1316 = sqrt(_1230);
    float _1318 = _1284;
    float _1320 = _1314;
    if (_1248)
    {
        float _1322 = fma(_1284, _1314, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1258 = _1322;
    }
    float _1324 = _1258;
    float _1326 = _1324;
    if (!_1248)
    {
        _1318 = _1240;
    }
    float _1328 = _1318;
    float _1330 = _1328;
    float _1332 = _1300;
    if (_1248)
    {
        float _1334 = _1300 + (-1.0);
        _1320 = _1334;
    }
    float _1336 = _1320;
    float _1338 = 0.0;
    float _1340 = _1336;
    if (_1248)
    {
        float _1342 = _1266 * _1324;
        _1338 = _1342;
    }
    float _1344 = _1338;
    if (!_1248)
    {
        _1326 = _1306;
    }
    float _1346 = _1326;
    float _1348 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1350 = _1346;
    if (_1248)
    {
        float _1352 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1352;
    }
    float _1354 = _1268;
    if (_1248)
    {
        float _1356 = _1236 * _1344;
        _1310 = _1356;
    }
    float _1358 = _1310;
    if (!_1248)
    {
        _1340 = _1238;
    }
    float _1360 = _1340;
    float _1362 = _1360;
    if (_1248)
    {
        float _1364 = _1238 * _1344;
        _1362 = _1364;
    }
    float _1366 = _1362;
    if (_1248)
    {
        float _1368 = fma(_1306, _1300, _1354);
        _1350 = _1368;
    }
    float _1370 = _1350;
    if (_1248)
    {
        float _1372 = _1358 * _1358;
        _1330 = _1372;
    }
    float _1374 = _1330;
    if (!_1248)
    {
        _1332 = _1242;
    }
    float _1376 = _1332;
    float _1378 = _1376;
    if (_1248)
    {
        float _1380 = _1366 * _1366;
        _1378 = _1380;
    }
    float _1382 = _1378;
    float _1384 = fma(_1370, _1370, _1374);
    float _1386 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1348);
    float _1388 = _1384 + _1382;
    float _1390 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1394 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1392);
    float _1396 = precise::clamp(_1394, 0.0, 1.0);
    float _1398 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1400 = rsqrt(_1388);
    float _1402 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1390);
    float _1404 = -_1396;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1398);
    float _1410 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1414 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1416 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1408);
    float _1418 = abs(_1406);
    float _1420 = log2(_1418);
    float _1422 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1424 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1414);
    float _1426 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1428 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1434 = _1400 * _1358;
    float _1436 = -_1430;
    float _1438 = fma(_1436, _1410, 1.0);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1442 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1400 * _1370;
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1448 = _1400 * _1366;
    float _1450 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1454 = -_1446;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1454);
    float _1458 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1462 = log2(_1438);
    float _1464 = -_1448;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1456);
    float _1468 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1472 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = fma(_1466, -0.5, 0.5);
    float _1476 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1468);
    float _1478 = fma(_1466, 0.5, 0.5);
    float _1480 = exp2(_1458);
    float _1482 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1476);
    float _1486 = _1444 + 1.0;
    float _1488 = fma(_1478, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1490 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1492 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1484);
    float _1494 = 1.0 / _1470;
    float _1496 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1490);
    float _1498 = fma(_1478, _1488, -0.212114393711090087890625);
    float _1500 = _1462 * 0.693147182464599609375;
    float _1502 = fma(_1478, _1498, 1.570728778839111328125);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1506 = sqrt(_1474);
    float _1508 = -_1444;
    float _1510 = fma(_1480, _1486, _1508);
    float _1512 = fma(_1510, 0.5, 0.5);
    float _1514 = _1492 * _1494;
    float _1516 = _1496 * _1494;
    float _1518 = fma(_1514, 0.5, 0.5);
    float _1520 = fma(_1516, -0.5, 0.5);
    float _1522 = _1506 * 0.636619746685028076171875;
    float3 _4099 = float3(_1518, _1520, _1504);
    float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4099, float3(0.0), isnan(_4099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4099, float3(0.0), isnan(_4099)), level(0.0)).x;
    float _1526 = -_1502;
    float _1528 = fma(_1522, _1526, 1.0);
    float3 _4115 = float3(_1518, _1520, _1504);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4115, float3(0.0), isnan(_4115)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4115, float3(0.0), isnan(_4115)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4132 = float2(_1528, _1512);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4132, float2(0.0), isnan(_4132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4132, float2(0.0), isnan(_4132)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_55.x;
    float _1553 = in.m_55.y;
    float _1555 = in.m_55.z;
    bool _1557 = _976 != 0.0;
    bool _1559 = isnan(_976);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan(0.0);
    bool _1565 = _1561 || _1563;
    float _1567 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_57.x = _1210;
    out.m_57.y = _1208;
    out.m_57.z = _1212;
    bool _1569 = _974 == 0.0;
    bool _1571 = !_1565;
    bool _1573 = _1569 && _1571;
    float _1575 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1567);
    bool _1577 = _978 == 0.0;
    bool _1579 = _1577 && _1573;
    float _1581 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1575);
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1585 = _1583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1553;
    float _1589 = _1551;
    float _1591 = _1555;
    if (!_1579)
    {
        float _1593 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1553);
        _1587 = _1593;
    }
    float _1595 = _1587;
    if (!_1579)
    {
        float _1597 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (!_1579)
    {
        float _1601 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1555);
        _1591 = _1601;
    }
    float _1603 = _1591;
    float _1605 = _834 * _1595;
    float _1607 = _832 * _1595;
    float _1609 = _836 * _1595;
    float _1611 = fma(_1072, _1599, _1605);
    float _1613 = fma(_1068, _1599, _1607);
    float _1615 = fma(_1074, _1599, _1609);
    float _1617 = fma(_1098, _1603, _1611);
    float _1619 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1621 = fma(_1138, _1603, _1613);
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1629 = exp2(_1619);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1633 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1639 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1641 = fma(_1090, _1603, _1615);
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1633;
    out.m_59.y = _1635;
    out.m_59.z = _1637;
    float _1645 = _1639 + _1470;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_61.x = _1617;
    out.m_61.y = _1621;
    out.m_61.z = _1641;
    float _1649 = _1645 * 0.5;
    float _1651 = -_1629;
    float _1653 = _1651 + 1.0;
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.z = _1649;
    out.m_63.w = _1470;
    float _1657 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1643;
    out.m_65.y = _1655;
    out.m_65.z = _1585;
    out.gl_Position.x = _1492;
    out.gl_Position.y = _1496;
    out.gl_Position.z = _1639;
    out.gl_Position.w = _1470;
    out.m_67.w = _1659;
    float _1661 = _1657 * _1524;
    float _1663 = -_1657;
    float _1665 = _1663 + 1.0;
    float _1667 = _1539 * _1661;
    float _1669 = _1539 * _1665;
    float _1671 = _1549 * _1661;
    float _1673 = fma(_1545, _1667, _1533);
    float _1675 = fma(_1547, _1667, _1535);
    float _1677 = fma(_1539, _1671, _1537);
    out.m_45.x = 1.0;
    out.m_69.x = _1673;
    out.m_69.y = _1675;
    out.m_69.z = _1677;
    out.m_69.w = _1669;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _620 = false;
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1734 = as_type<float>(_104);
        out.gl_Position.z = _1734;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _98 = _128;
    }
    float _130 = _98;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_144);
        out.gl_Position.z = _1805;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_47.x;
    float _150 = in.m_47.y;
    float _152 = in.m_47.z;
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
        _124 = _210;
        _190 = _220;
        _126 = _208;
    }
    float _222 = _124;
    float _224 = _190;
    float _226 = _126;
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
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = fma(_332, _148, _340);
    float _350 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_258, _152, _350);
    float _364 = _354 * _354;
    float _366 = in.m_49.w;
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = -_356;
    float _372 = _362 + _370;
    float _374 = fma(_360, _360, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _382 = fma(_372, _372, _374);
    float _384 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = in.m_42.x;
    float _388 = in.m_42.y;
    float _390 = in.m_42.z;
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _398 = sqrt(_382);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_362, _366, _390);
    float _418 = _392;
    float _420 = _396;
    float _422 = _400;
    if (_410)
    {
        _418 = _396;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _394;
    }
    float _428 = _420;
    float _430 = _428;
    if (!_410)
    {
        bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _434 = !_432;
        if (!_434)
        {
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
            float _454 = _448 * _448;
            float _456 = fma(_450, _450, _454);
            float _458 = fma(_452, _452, _456);
            float _460 = rsqrt(_458);
            float _462 = _460 * 9.9999999747524270787835121154785e-07;
            float _464 = _450 * _462;
            float _466 = _448 * _462;
            float _468 = _452 * _462;
            _430 = _466;
            _426 = _464;
            _422 = _468;
            _470 = true;
        }
        else
        {
            float _472 = _150 * _150;
            float _474 = fma(_148, _148, _472);
            float _476 = fma(_152, _152, _474);
            float _478 = sqrt(_476);
            bool _480 = _478 >= 9.9999999747524270787835121154785e-07;
            bool _482 = isnan(_478);
            bool _484 = _480 || _482;
            bool _486 = isnan(9.9999999747524270787835121154785e-07);
            bool _488 = _484 || _486;
            if (!_488)
            {
                float _490 = _388 * _388;
                float _492 = fma(_386, _386, _490);
                float _494 = fma(_390, _390, _492);
                float _496 = sqrt(_494);
                bool _498 = _496 >= 9.9999999747524270787835121154785e-07;
                bool _500 = isnan(_496);
                bool _502 = _498 || _500;
                bool _504 = isnan(9.9999999747524270787835121154785e-07);
                bool _506 = _502 || _504;
                if (!_506)
                {
                    float _508 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _508);
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _510);
                    float _514 = rsqrt(_512);
                    float _516 = _514 * 9.9999999747524270787835121154785e-07;
                    float _518 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _520;
                    _426 = _518;
                    _422 = _522;
                    _470 = true;
                }
                else
                {
                    float _524 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _530 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
                    float _532 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
                    float _534 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
                    float _536 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
                    float _538 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _532);
                    float _540 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _534);
                    float _542 = _536 * _536;
                    float _544 = fma(_538, _538, _542);
                    float _546 = fma(_540, _540, _544);
                    float _548 = rsqrt(_546);
                    float _550 = _548 * 9.9999999747524270787835121154785e-07;
                    float _552 = _538 * _550;
                    float _554 = _536 * _550;
                    float _556 = _540 * _550;
                    _430 = _554;
                    _426 = _552;
                    _422 = _556;
                    _470 = true;
                }
            }
            else
            {
                float _558 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _560 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _562 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _564 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
                float _570 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _564);
                float _572 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _566);
                float _574 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
                float _576 = _570 * _570;
                float _578 = fma(_572, _572, _576);
                float _580 = fma(_574, _574, _578);
                float _582 = rsqrt(_580);
                float _584 = _582 * 9.9999999747524270787835121154785e-07;
                float _586 = _572 * _584;
                float _588 = _570 * _584;
                float _590 = _574 * _584;
                _430 = _588;
                _426 = _586;
                _422 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _430;
    float _594 = _426;
    float _596 = _422;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _600 = !_598;
    float _618;
    if (!_600)
    {
        float _602 = in.m_51.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_88);
        float _624 = 1.0 / _622;
        float _626 = _122 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _632 = _628 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _628 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _654;
    float _658 = 1.0 / _644;
    bool _660 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _662 = isnan(_628);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = 1.0 / _652;
    bool _674 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _676 = isnan(_628);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _694 = 1.0 / _648;
    float _696 = 1.0 / _656;
    float _698 = 1.0 / _640;
    float _700 = _632 * _694;
    float _702 = _592 * _592;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _710 = _628 + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _716 = _710 * _658;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _720 = _628 + _718;
    float _722 = _636 * _698;
    float _724 = _720 * _672;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _728 = _628 + _726;
    float _730 = fma(_714, _716, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _732 = fma(_692, _716, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _734;
    float _738 = _728 * _696;
    float _740 = fma(_594, _594, _702);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _746 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _748 = isnan(_628);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_706, _722, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _760 = fma(_596, _596, _740);
    float _762 = fma(_744, _716, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _764 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _766 = isnan(_628);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_756;
    float _778 = _776 + 1.0;
    float _780 = rsqrt(_760);
    float _782 = fma(_736, _722, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _784 = fma(_688, _722, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _786 = _774 * _778;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _796;
    float _800 = -_774;
    float _802 = _800 + 1.0;
    float _804 = fma(_790, _700, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _806 = fma(_794, _700, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _808 = fma(_798, _700, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _810 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _812 = isnan(_628);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -_670;
    float _824 = _822 + 1.0;
    float _826 = _684 * _802;
    float _828 = -_684;
    float _830 = _828 + 1.0;
    float _832 = _780 * _592;
    float _834 = _780 * _594;
    float _836 = _780 * _596;
    bool _838 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _840 = isnan(_628);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = _832 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _852 = _820 * _824;
    float _854 = -_820;
    float _856 = _854 + 1.0;
    float _858 = _670 * _830;
    float _860 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[8].y, _850);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _874 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].y, _860);
    float _876 = _848 * _856;
    float _878 = fma(_864, _724, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _880 = fma(_868, _724, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _882 = fma(_872, _724, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _884 = abs(_874);
    bool _886 = _884 > 0.99989998340606689453125;
    float _888 = _758 * _876;
    float _890 = _782 * _876;
    float _892 = -_848;
    float _894 = _892 + 1.0;
    float _896 = _784 * _876;
    float _898 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _900 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].y, _890);
    float _902 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].z, _896);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _912;
    float _916 = fma(_730, _852, _898);
    float _918 = fma(_906, _738, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _920 = fma(_910, _738, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _922 = fma(_914, _738, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _924 = fma(_762, _852, _900);
    float _926 = fma(_732, _852, _902);
    float _928 = fma(_804, _858, _916);
    float _930 = _852;
    float _932 = _804;
    float _934 = _808;
    float _936 = _910;
    if (_886)
    {
        _930 = 0.001000000047497451305389404296875;
    }
    float _938 = _930;
    float _940 = fma(_806, _858, _924);
    float _942 = fma(_808, _858, _926);
    if (!_886)
    {
        _932 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _944 = _932;
    float _946 = fma(_878, _826, _928);
    float _948 = _944;
    if (_886)
    {
        float _950 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _948 = _950;
    }
    float _952 = _948;
    float _954 = in.m_49.x;
    float _956 = in.m_49.y;
    float _958 = in.m_49.z;
    float _960 = fma(_880, _826, _940);
    if (!_886)
    {
        _934 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _962 = _934;
    float _964 = _962;
    if (_886)
    {
        float _966 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = -_952;
    float _972 = _836 * _970;
    float _974 = in.m_53.x;
    float _976 = in.m_53.y;
    float _978 = in.m_53.z;
    if (!_886)
    {
        _936 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _980 = _936;
    float _982 = fma(_882, _826, _942);
    float _984 = _980;
    if (_886)
    {
        float _986 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _984 = _986;
    }
    float _988 = _984;
    float _990 = -_968;
    float _992 = _832 * _990;
    float _994 = -_968;
    float _996 = -_972;
    float _998 = fma(_834, _994, _996);
    float _1000 = fma(_918, _786, _946);
    float _1002 = -_988;
    float _1004 = _834 * _1002;
    float _1006 = -_988;
    float _1008 = -_992;
    float _1010 = fma(_836, _1006, _1008);
    float _1012 = _998 * _998;
    float _1014 = fma(_920, _786, _960);
    float _1016 = -_952;
    float _1018 = -_1004;
    float _1020 = fma(_832, _1016, _1018);
    float _1022 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1000);
    float _1024 = fma(_1010, _1010, _1012);
    float _1026 = fma(_922, _786, _982);
    float _1028 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1014);
    float _1030 = fma(_1020, _1020, _1024);
    float _1032 = _1022 * _954;
    float _1034 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1026);
    float _1036 = _1028 * _956;
    float _1038 = rsqrt(_1030);
    float _1040 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = _1034 * _958;
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _974);
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _978);
    float _1048 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _976);
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1052 = _1040 * _1044;
    float _1054 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1058 = _1050 * _1046;
    float _1060 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1062 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1054);
    float _1064 = _1056 * _1048;
    float _1066 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1060);
    float _1068 = _998 * _1038;
    float _1070 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1072 = _1010 * _1038;
    float _1074 = _1020 * _1038;
    float _1076 = _1064 * _836;
    float _1078 = _834 * _1068;
    float _1080 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1066);
    float _1082 = _1064 * _834;
    float _1084 = fma(_1052, _1074, _1076);
    float _1086 = _832 * _1074;
    float _1088 = -_1078;
    float _1090 = fma(_832, _1072, _1088);
    float _1092 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1094 = fma(_1052, _1072, _1082);
    float _1096 = -_1086;
    float _1098 = fma(_836, _1068, _1096);
    float _1100 = fma(_1058, _1090, _1084);
    float _1102 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = fma(_1058, _1098, _1094);
    float _1106 = _1092 + _1100;
    float _1108 = _1102 + _1104;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1112 = _1106 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1116 = _1108 + _1114;
    float _1118 = _1112 * _1112;
    float _1120 = fma(_1116, _1116, _1118);
    float _1122 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1124 = sqrt(_1120);
    float _1126 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1122);
    float _1128 = _1064 * _832;
    float _1130 = _836 * _1072;
    float _1132 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1126);
    float _1134 = fma(_1052, _1068, _1128);
    float _1136 = -_1130;
    float _1138 = fma(_834, _1074, _1136);
    float _1140 = _1132 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1142 = fma(_1058, _1138, _1134);
    float _1144 = _1140 + _1142;
    bool _1146 = _1124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1142;
    float _1150 = _1104;
    float _1152 = _1108;
    float _1154 = _1112;
    float _1156 = _1144;
    if (!_1146)
    {
        _1148 = _1108;
    }
    float _1158 = _1148;
    float _1160 = _1158;
    if (!_1146)
    {
        _1150 = _1106;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1146)
    {
        _1152 = _1144;
    }
    float _1166 = _1152;
    bool _1168 = !_1146;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1124 + _1174;
        float _1178 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1120);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1188 + (-1.0);
        float _1196 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = fma(_1192, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1200 = fma(_1144, _1188, _1196);
        float _1202 = _1180 * _1198;
        float _1204 = fma(_1116, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1206 = fma(_1112, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1170 = _1200;
        _1160 = _1204;
        _1164 = _1206;
    }
    float _1208 = _1170;
    float _1210 = _1160;
    float _1212 = _1164;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1216 = _1208 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1220 = _1210 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1224 = _1212 + _1222;
    float _1226 = _1216 * _1216;
    float _1228 = fma(_1220, _1220, _1226);
    float _1230 = fma(_1224, _1224, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1236 = _1220 * _1234;
    float _1238 = _1224 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 * _1238;
    float _1244 = _1240 + _1242;
    float _1246 = sqrt(_1244);
    bool _1248 = _1246 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1252 = _1246 + _1250;
    float _1254 = _1224;
    float _1256 = _1252;
    float _1258 = _1216;
    if (_1248)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (_1248)
    {
        float _1264 = rsqrt(_1244);
        _1154 = _1264;
    }
    float _1266 = _1154;
    float _1268 = _1266;
    if (_1248)
    {
        float _1270 = _1252 * _1262;
        _1256 = _1270;
    }
    float _1272 = _1256;
    if (_1248)
    {
        float _1274 = _1272 * 0.15915493667125701904296875;
        _1156 = _1274;
    }
    float _1276 = _1156;
    float _1278 = _1226;
    if (_1248)
    {
        float _1280 = _1276 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        _1278 = _1282;
    }
    float _1284 = _1278;
    float _1286 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1288 = precise::max(0.0, _1286);
    float _1290 = _1232;
    float _1292 = _1288;
    float _1294 = _1286;
    if (_1248)
    {
        float _1296 = _1276 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        _1290 = _1298;
    }
    float _1300 = _1290;
    float _1302 = -_1234;
    float _1304 = -_1288;
    float _1306 = fma(_1216, _1302, _1304);
    if (!_1248)
    {
        _1292 = _1236;
    }
    float _1308 = _1292;
    float _1310 = _1308;
    if (_1248)
    {
        float _1312 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1294 = _1312;
    }
    float _1314 = _1294;
    float _1316 = sqrt(_1230);
    float _1318 = _1284;
    float _1320 = _1314;
    if (_1248)
    {
        float _1322 = fma(_1284, _1314, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1258 = _1322;
    }
    float _1324 = _1258;
    float _1326 = _1324;
    if (!_1248)
    {
        _1318 = _1240;
    }
    float _1328 = _1318;
    float _1330 = _1328;
    float _1332 = _1300;
    if (_1248)
    {
        float _1334 = _1300 + (-1.0);
        _1320 = _1334;
    }
    float _1336 = _1320;
    float _1338 = 0.0;
    float _1340 = _1336;
    if (_1248)
    {
        float _1342 = _1266 * _1324;
        _1338 = _1342;
    }
    float _1344 = _1338;
    if (!_1248)
    {
        _1326 = _1306;
    }
    float _1346 = _1326;
    float _1348 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1350 = _1346;
    if (_1248)
    {
        float _1352 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1352;
    }
    float _1354 = _1268;
    if (_1248)
    {
        float _1356 = _1236 * _1344;
        _1310 = _1356;
    }
    float _1358 = _1310;
    if (!_1248)
    {
        _1340 = _1238;
    }
    float _1360 = _1340;
    float _1362 = _1360;
    if (_1248)
    {
        float _1364 = _1238 * _1344;
        _1362 = _1364;
    }
    float _1366 = _1362;
    if (_1248)
    {
        float _1368 = fma(_1306, _1300, _1354);
        _1350 = _1368;
    }
    float _1370 = _1350;
    if (_1248)
    {
        float _1372 = _1358 * _1358;
        _1330 = _1372;
    }
    float _1374 = _1330;
    if (!_1248)
    {
        _1332 = _1242;
    }
    float _1376 = _1332;
    float _1378 = _1376;
    if (_1248)
    {
        float _1380 = _1366 * _1366;
        _1378 = _1380;
    }
    float _1382 = _1378;
    float _1384 = fma(_1370, _1370, _1374);
    float _1386 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1348);
    float _1388 = _1384 + _1382;
    float _1390 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1394 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1392);
    float _1396 = precise::clamp(_1394, 0.0, 1.0);
    float _1398 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1400 = rsqrt(_1388);
    float _1402 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1390);
    float _1404 = -_1396;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1398);
    float _1410 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1414 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1416 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1408);
    float _1418 = abs(_1406);
    float _1420 = log2(_1418);
    float _1422 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1424 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1414);
    float _1426 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1428 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1434 = _1400 * _1358;
    float _1436 = -_1430;
    float _1438 = fma(_1436, _1410, 1.0);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1442 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1400 * _1370;
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1448 = _1400 * _1366;
    float _1450 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1454 = -_1446;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1454);
    float _1458 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1462 = log2(_1438);
    float _1464 = -_1448;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1456);
    float _1468 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1472 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = fma(_1466, -0.5, 0.5);
    float _1476 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1468);
    float _1478 = fma(_1466, 0.5, 0.5);
    float _1480 = exp2(_1458);
    float _1482 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1476);
    float _1486 = _1444 + 1.0;
    float _1488 = fma(_1478, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1490 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1492 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1484);
    float _1494 = 1.0 / _1470;
    float _1496 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1490);
    float _1498 = fma(_1478, _1488, -0.212114393711090087890625);
    float _1500 = _1462 * 0.693147182464599609375;
    float _1502 = fma(_1478, _1498, 1.570728778839111328125);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1506 = sqrt(_1474);
    float _1508 = -_1444;
    float _1510 = fma(_1480, _1486, _1508);
    float _1512 = fma(_1510, 0.5, 0.5);
    float _1514 = _1492 * _1494;
    float _1516 = _1496 * _1494;
    float _1518 = fma(_1514, 0.5, 0.5);
    float _1520 = fma(_1516, -0.5, 0.5);
    float _1522 = _1506 * 0.636619746685028076171875;
    float3 _4099 = float3(_1518, _1520, _1504);
    float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4099, float3(0.0), isnan(_4099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4099, float3(0.0), isnan(_4099)), level(0.0)).x;
    float _1526 = -_1502;
    float _1528 = fma(_1522, _1526, 1.0);
    float3 _4115 = float3(_1518, _1520, _1504);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4115, float3(0.0), isnan(_4115)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4115, float3(0.0), isnan(_4115)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4132 = float2(_1528, _1512);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4132, float2(0.0), isnan(_4132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4132, float2(0.0), isnan(_4132)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_55.x;
    float _1553 = in.m_55.y;
    float _1555 = in.m_55.z;
    bool _1557 = _976 != 0.0;
    bool _1559 = isnan(_976);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan(0.0);
    bool _1565 = _1561 || _1563;
    float _1567 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_57.x = _1210;
    out.m_57.y = _1208;
    out.m_57.z = _1212;
    bool _1569 = _974 == 0.0;
    bool _1571 = !_1565;
    bool _1573 = _1569 && _1571;
    float _1575 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1567);
    bool _1577 = _978 == 0.0;
    bool _1579 = _1577 && _1573;
    float _1581 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1575);
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1585 = _1583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1553;
    float _1589 = _1551;
    float _1591 = _1555;
    if (!_1579)
    {
        float _1593 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1553);
        _1587 = _1593;
    }
    float _1595 = _1587;
    if (!_1579)
    {
        float _1597 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (!_1579)
    {
        float _1601 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1555);
        _1591 = _1601;
    }
    float _1603 = _1591;
    float _1605 = _834 * _1595;
    float _1607 = _832 * _1595;
    float _1609 = _836 * _1595;
    float _1611 = fma(_1072, _1599, _1605);
    float _1613 = fma(_1068, _1599, _1607);
    float _1615 = fma(_1074, _1599, _1609);
    float _1617 = fma(_1098, _1603, _1611);
    float _1619 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1621 = fma(_1138, _1603, _1613);
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1629 = exp2(_1619);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1633 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1639 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1641 = fma(_1090, _1603, _1615);
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1633;
    out.m_59.y = _1635;
    out.m_59.z = _1637;
    float _1645 = _1639 + _1470;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_61.x = _1617;
    out.m_61.y = _1621;
    out.m_61.z = _1641;
    float _1649 = _1645 * 0.5;
    float _1651 = -_1629;
    float _1653 = _1651 + 1.0;
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.z = _1649;
    out.m_63.w = _1470;
    float _1657 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1643;
    out.m_65.y = _1655;
    out.m_65.z = _1585;
    out.gl_Position.x = _1492;
    out.gl_Position.y = _1496;
    out.gl_Position.z = _1639;
    out.gl_Position.w = _1470;
    out.m_67.w = _1659;
    float _1661 = _1657 * _1524;
    float _1663 = -_1657;
    float _1665 = _1663 + 1.0;
    float _1667 = _1539 * _1661;
    float _1669 = _1539 * _1665;
    float _1671 = _1549 * _1661;
    float _1673 = fma(_1545, _1667, _1533);
    float _1675 = fma(_1547, _1667, _1535);
    float _1677 = fma(_1539, _1671, _1537);
    out.m_45.x = 1.0;
    out.m_69.x = _1673;
    out.m_69.y = _1675;
    out.m_69.z = _1677;
    out.m_69.w = _1669;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

