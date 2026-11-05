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
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1193 = false;
    bool _962 = false;
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
        float _2643 = as_type<float>(_104);
        out.gl_Position.z = _2643;
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
        float _2714 = as_type<float>(_144);
        out.gl_Position.z = _2714;
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
    float _366 = in.m_49.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_42.x;
    float _388 = in.m_42.y;
    float _390 = in.m_42.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_338, _366, _388);
    float _414 = fma(_356, _366, _390);
    float _416 = fma(_344, _366, _386);
    float _418 = _338;
    float _420 = _356;
    float _422 = _400;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _398;
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
            _422 = _466;
            _426 = _464;
            _430 = _468;
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
                    _422 = _520;
                    _426 = _518;
                    _430 = _522;
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
                    _422 = _554;
                    _426 = _552;
                    _430 = _556;
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
                _422 = _588;
                _426 = _586;
                _430 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _422;
    float _594 = _426;
    float _596 = _430;
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
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _632 = _628 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _650 = 1.0 / _636;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _652;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _672 = _628 + _670;
    float _674 = 1.0 / _648;
    float _676 = _672 * _650;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _628 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _684 = _628 + _682;
    bool _686 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _688 = isnan(_628);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _700 = 1.0 / _654;
    float _702 = _680 * _668;
    float _704 = 1.0 / _644;
    float _706 = _632 * _674;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _708;
    float _712 = fma(_710, _676, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _716 = _628 + _714;
    float _718 = _716 * _700;
    bool _720 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _722 = isnan(_628);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _732;
    float _736 = _684 * _704;
    float _738 = -_730;
    float _740 = _738 + 1.0;
    float _742 = fma(_734, _676, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _744 = -_696;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = _696 * _740;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = fma(_750, _676, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _764 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _766 = isnan(_628);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _780 = -_666;
    float _782 = _780 + 1.0;
    bool _784 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _786 = isnan(_628);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = _666 * _746;
    bool _798 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _800 = isnan(_628);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = fma(_756, _702, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _812 = _774 * _782;
    float _814 = fma(_760, _702, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_778, _702, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = -_774;
    float _820 = _818 + 1.0;
    float _822 = -_808;
    float _824 = _822 + 1.0;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _826;
    float _830 = _808 * _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _836;
    float _840 = _794 * _824;
    float _842 = fma(_828, _736, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _844 = fma(_834, _736, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _846 = fma(_838, _736, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _848 = _762 * _840;
    float _850 = -_794;
    float _852 = _850 + 1.0;
    float _854 = _742 * _840;
    float _856 = _712 * _840;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _848);
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _854);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _874 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _856);
    float _876 = fma(_860, _706, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _878 = fma(_868, _706, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _880 = fma(_872, _706, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _882 = fma(_816, _830, _864);
    float _884 = fma(_810, _830, _862);
    float _886 = in.m_49.x;
    float _888 = in.m_49.y;
    float _890 = in.m_49.z;
    float _892 = fma(_814, _830, _874);
    float _894 = fma(_844, _812, _884);
    float _896 = fma(_842, _812, _892);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _898;
    float _902 = fma(_846, _812, _882);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _904;
    float _908 = fma(_876, _796, _894);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _910;
    float _914 = fma(_900, _718, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _916 = fma(_906, _718, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _918 = fma(_878, _796, _896);
    float _920 = fma(_912, _718, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _922 = fma(_880, _796, _902);
    float _924 = fma(_914, _752, _908);
    float _926 = fma(_916, _752, _918);
    float _928 = fma(_920, _752, _922);
    float _930 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].x, _924);
    float _932 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].y, _926);
    float _934 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].z, _928);
    float _936 = _930 * _886;
    float _938 = _932 * _888;
    float _940 = _934 * _890;
    bool _942 = !_698;
    float _960;
    if (!_942)
    {
        float _944 = in.m_51.x;
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _948 = _944 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _952 = _950 * _946;
        float _954 = floor(_952);
        float _956 = -_954;
        float _958 = _952 + _956;
        _960 = _958;
        _962 = true;
    }
    else
    {
        float _964 = float(_88);
        float _966 = 1.0 / _964;
        float _968 = _122 * _966;
        _960 = _968;
    }
    _962 = false;
    float _970 = _960;
    float _972 = in.m_51.x;
    float _974 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _984 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _986 = isnan(_970);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1000 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1002 = isnan(_970);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = 1.0 / _978;
    bool _1014 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1016 = isnan(_970);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -_994;
    float _1028 = _1026 + 1.0;
    bool _1030 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1032 = 1.0 / _982;
    float _1034 = _974 * _972;
    float _1036 = trunc(_1034);
    int _1038 = int(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1044 = 1.0 / _998;
    float _1046 = _1042 * _1032;
    int _1048 = _1038 << 4;
    int _1050 = _1048 + 1968;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1052;
    float _1056 = _1010 * _1028;
    float _1058 = -_1010;
    float _1060 = _1058 + 1.0;
    uint _1063 = uint(int(uint(_1050) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[int(_1073)][_1075];
    float _1079 = _1054 * _1012;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1083 = _970 + _1081;
    float _1085 = _1024 * _1060;
    bool _1087 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1089 = isnan(_970);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1099;
    float _1103 = fma(_1079, _1083, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1107 = _970 + _1105;
    int _1109 = _1050 + 8;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
    int _1115 = int(_1111) & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = -_1024;
    float _1121 = _1119 + 1.0;
    float _1123 = _1103 * _1085;
    float _1125 = _1101 * _1044;
    float _1127 = fma(_1046, _1107, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1129 = -_1097;
    float _1131 = _1129 + 1.0;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _970 + _1133;
    float _1137 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1123);
    float _1139 = _994 * _1131;
    float _1141 = fma(_1125, _1135, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1143 = fma(_1127, _1056, _1137);
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1147 = fma(_1141, _1139, _1143);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1147);
    float _1155 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1161 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1175 = !_1030;
    float _1191;
    if (!_1175)
    {
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1179 = _972 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _1183 = _1181 * _1177;
        float _1185 = floor(_1183);
        float _1187 = -_1185;
        float _1189 = _1183 + _1187;
        _1191 = _1189;
        _1193 = true;
    }
    else
    {
        float _1195 = float(_88);
        float _1197 = 1.0 / _1195;
        float _1199 = _122 * _1197;
        _1191 = _1199;
    }
    _1193 = false;
    float _1201 = _1191;
    float _1203 = in.m_53.x;
    float _1205 = in.m_53.y;
    float _1207 = in.m_53.z;
    float _1209 = _412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1211 = _412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1217 = _412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1223 = 1.0 / _1215;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1229 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1209);
    float _1231 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1233 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1217);
    bool _1235 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.5);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1229);
    float _1247 = 1.0 / _1221;
    float _1249 = _936 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1251 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1231);
    float _1253 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1205);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1257;
    float _1261 = 1.0 / _1227;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1203);
    float _1269 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1275 = _1265 * _1223;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1277;
    float _1281 = 1.0 / _1273;
    float _1283 = _1267 * _1249;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1293 = _1279 * _1261;
    float _1295 = _1259 * _1247;
    float _1297 = 1.0 / _1287;
    float _1299 = _592 * _592;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1309;
    float _1313 = _938 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1315 = _1291 * _1281;
    float _1317 = fma(_594, _594, _1299);
    float _1319 = 1.0 / _1303;
    bool _1321 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1323 = isnan(_1201);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1207);
    float _1335 = fma(_596, _596, _1317);
    float _1337 = _940 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1339 = -_1331;
    float _1341 = _1339 + 1.0;
    float _1343 = _1311 * _1297;
    float _1345 = rsqrt(_1335);
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1351 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1353 = isnan(_1201);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1359 = _1355 || _1357;
    float _1361 = float(_1359);
    float _1363 = 1.0 / _1307;
    bool _1365 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1367 = isnan(_1201);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = -_1375;
    float _1379 = _1377 + 1.0;
    float _1381 = _1345 * _592;
    bool _1383 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1385 = isnan(_1201);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = _1345 * _594;
    float _1397 = _1345 * _596;
    bool _1399 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1401 = isnan(_1201);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = _1393 * _1341;
    float _1413 = -_1393;
    float _1415 = _1413 + 1.0;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1417;
    bool _1421 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1423 = isnan(_1201);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1435 = _1201 + _1433;
    float _1437 = _1361 * _1415;
    float _1439 = -_1361;
    float _1441 = _1439 + 1.0;
    float _1443 = _1419 * _1319;
    bool _1445 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1447 = isnan(_1201);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = _1349 * _1363;
    float _1459 = -_1431;
    float _1461 = _1459 + 1.0;
    float _1463 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1465 = _1431 * _1441;
    float _1467 = fma(_1295, _1435, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1469 = _1455 * _1461;
    float _1471 = -_1455;
    float _1473 = _1471 + 1.0;
    bool _1475 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1477 = isnan(_1201);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1395, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1463);
    float _1489 = _1375 * _1473;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1493 = _1201 + _1491;
    float _1495 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1487);
    float _1497 = _1485 * _1379;
    float _1499 = -_1485;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1275, _1493, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1507 = _1201 + _1505;
    float _1509 = abs(_1495);
    bool _1511 = _1509 > 0.99989998340606689453125;
    float _1513 = _1409 * _1501;
    float _1515 = -_1409;
    float _1517 = _1515 + 1.0;
    float _1519 = fma(_1293, _1507, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1523 = _1201 + _1521;
    float _1525 = _1467 * _1513;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1529 = _1201 + _1527;
    float _1531 = fma(_1315, _1523, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1533 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1525);
    float _1535 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1539 = _1269 + _1537;
    float _1541 = fma(_1343, _1529, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1543 = _1293;
    float _1545 = _1517;
    float _1547 = _1463;
    float _1549 = _1333;
    float _1551 = _1269;
    float _1553 = _1535;
    float _1555 = _1381;
    float _1557 = _1539;
    if (_1511)
    {
        _1543 = 0.001000000047497451305389404296875;
    }
    float _1559 = _1543;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1535 + _1561;
    float _1565 = _1539 * _1539;
    float _1567 = 0.0;
    if (!_1511)
    {
        _1567 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1569 = _1567;
    float _1571 = fma(_1503, _1497, _1533);
    float _1573 = _1569;
    if (_1511)
    {
        float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1573 = _1575;
    }
    float _1577 = _1573;
    float _1579 = fma(_1563, _1563, _1565);
    if (!_1511)
    {
        _1545 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1581 = _1545;
    float _1583 = _1581;
    if (_1511)
    {
        float _1585 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = -_1577;
    float _1591 = _1397 * _1589;
    float _1593 = sqrt(_1579);
    if (!_1511)
    {
        _1547 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1595 = _1547;
    float _1597 = _1595;
    if (_1511)
    {
        float _1599 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = -_1587;
    float _1605 = _1381 * _1603;
    float _1607 = -_1587;
    float _1609 = -_1591;
    float _1611 = fma(_1395, _1607, _1609);
    float _1613 = fma(_1519, _1489, _1571);
    float _1615 = -_1601;
    float _1617 = _1395 * _1615;
    float _1619 = -_1601;
    float _1621 = -_1605;
    float _1623 = fma(_1397, _1619, _1621);
    float _1625 = _1611 * _1611;
    float _1627 = in.m_55.x;
    float _1629 = -_1577;
    float _1631 = -_1617;
    float _1633 = fma(_1381, _1629, _1631);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1637 = _1201 + _1635;
    float _1639 = fma(_1623, _1623, _1625);
    float _1641 = fma(_1457, _1637, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1643 = fma(_1633, _1633, _1639);
    bool _1645 = _1593 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1647 = fma(_1531, _1469, _1613);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1651 = _1201 + _1649;
    float _1653 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1655 = rsqrt(_1643);
    float _1657 = fma(_1541, _1465, _1647);
    float _1659 = fma(_1443, _1651, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1661 = fma(_1641, _1437, _1657);
    float _1663 = _1255 * _1313;
    float _1665 = _1333 * _1337;
    float _1667 = fma(_1659, _1411, _1661);
    if (!_1645)
    {
        _1549 = _1653;
    }
    float _1669 = _1549;
    bool _1671 = !_1645;
    float _1673 = _1669;
    if (!_1671)
    {
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1679 = _1593 + _1677;
        float _1681 = _1653 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = rsqrt(_1579);
        float _1685 = _1679 * _1675;
        float _1687 = _1685 * 0.15915493667125701904296875;
        float _1689 = _1687 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = _1687 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 + (-1.0);
        float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = fma(_1695, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1703 = fma(_1653, _1691, _1699);
        float _1705 = _1683 * _1701;
        float _1707 = fma(_1563, _1705, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1709 = fma(_1539, _1705, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1673 = _1703;
        _1551 = _1709;
        _1553 = _1707;
    }
    float _1711 = _1673;
    float _1713 = _1551;
    float _1715 = _1553;
    float _1717 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1667);
    float _1719 = _1663 * _1381;
    float _1721 = _1611 * _1655;
    float _1723 = _1623 * _1655;
    float _1725 = _1633 * _1655;
    float _1727 = _1663 * _1395;
    float _1729 = fma(_1283, _1721, _1719);
    float _1731 = _1397 * _1723;
    float _1733 = _1663 * _1397;
    float _1735 = _1395 * _1721;
    float _1737 = fma(_1283, _1723, _1727);
    float _1739 = -_1731;
    float _1741 = fma(_1395, _1725, _1739);
    float _1743 = _1381 * _1725;
    float _1745 = fma(_1283, _1725, _1733);
    float _1747 = -_1735;
    float _1749 = fma(_1381, _1723, _1747);
    float _1751 = _1627 * _1627;
    float _1753 = fma(_1665, _1741, _1729);
    float _1755 = -_1743;
    float _1757 = fma(_1397, _1721, _1755);
    float _1759 = fma(_1665, _1749, _1745);
    float _1761 = _1751 * _1751;
    float _1763 = _1717 * 3.0;
    float _1765 = _1753 + _1711;
    float _1767 = fma(_1665, _1757, _1737);
    float _1769 = _1759 + _1713;
    float _1771 = -_1761;
    float _1773 = fma(_1771, _1763, _1765);
    float _1775 = _1767 + _1715;
    float _1777 = _1763;
    float _1779 = _1765;
    float _1781 = _1775;
    float _1783 = _1767;
    if (_1243)
    {
        _1777 = _1769;
    }
    float _1785 = _1777;
    float _1787 = _1785;
    if (_1243)
    {
        _1779 = _1773;
    }
    float _1789 = _1779;
    float _1791 = _1789;
    if (!_1243)
    {
        float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1795 = _1711 + _1793;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1799 = _1715 + _1797;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1803 = _1795 * _1795;
        float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1807 = _1713 + _1805;
        float _1809 = fma(_1799, _1799, _1803);
        float _1811 = -_1711;
        float _1813 = _1773 + _1811;
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1817 = fma(_1807, _1807, _1809);
        float _1819 = sqrt(_1817);
        float _1821 = _1801 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1823 = precise::min(_1819, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1825 = _1823 * _1815;
        float _1827 = _1821 * _1825;
        float _1829 = fma(_1767, _1827, _1715);
        float _1831 = fma(_1813, _1827, _1711);
        float _1833 = fma(_1759, _1827, _1713);
        _1791 = _1831;
        _1781 = _1829;
        _1787 = _1833;
    }
    float _1835 = _1791;
    float _1837 = _1781;
    float _1839 = _1787;
    float _1841 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1843 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1841);
    float _1845 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1843);
    float _1847 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1849 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1847);
    bool _1853 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.5);
    bool _1861 = _1857 || _1859;
    float _1863 = 1.0 / _1849;
    float _1865 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1851);
    float _1867 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1869 = _1867 + _1849;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1861)
    {
        _1871 = 1.0;
    }
    float _1873 = _1871;
    float _1875 = _1869 * _1863;
    float _1877 = _1875 * 0.5;
    float _1879 = _1873;
    if (!_1861)
    {
        float _1881 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1885 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
        float _1887 = _1881 * 0.15915493667125701904296875;
        float _1889 = _1887 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1895 = _1893 * 0.15915493667125701904296875;
        float _1897 = _1887 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        float _1901 = 1.0 / _1891;
        float _1903 = _1895 * 6.283185482025146484375;
        float _1905 = cos(_1903);
        float _1907 = _1899 * _1901;
        float _1909 = 1.0 / _1885;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1913 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1911;
        float _1915 = _1905 * _1907;
        float _1917 = _1895 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1915;
        float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1925 = _1909 * _1923;
        float _1927 = 1.0 / _1913;
        float _1929 = _1919 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1933 = fma(_1929, _1925, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        _1783 = _1927;
        _1555 = _1887;
        _1879 = _1937;
    }
    float _1939 = _1783;
    float _1941 = _1555;
    float _1943 = _1879;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1835 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1837 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1839 + _1953;
    float _1957 = _1947 * _1947;
    float _1959 = fma(_1951, _1951, _1957);
    float _1961 = fma(_1955, _1955, _1959);
    float _1963 = rsqrt(_1961);
    float _1965 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1967 = _1951 * _1965;
    float _1969 = _1955 * _1965;
    float _1971 = _1967 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 + _1973;
    float _1977 = sqrt(_1975);
    bool _1979 = _1977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = _1977 + _1981;
    float _1985 = _1955;
    float _1987 = _1975;
    float _1989 = _1983;
    float _1991 = _1939;
    float _1993 = _1967;
    if (_1979)
    {
        float _1995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1985 = _1995;
    }
    float _1997 = _1985;
    if (_1979)
    {
        float _1999 = rsqrt(_1975);
        _1987 = _1999;
    }
    float _2001 = _1987;
    float _2003 = _2001;
    if (_1979)
    {
        float _2005 = _1983 * _1997;
        _1989 = _2005;
    }
    float _2007 = _1989;
    if (_1979)
    {
        float _2009 = _2007 * 0.15915493667125701904296875;
        _1991 = _2009;
    }
    float _2011 = _1991;
    float _2013 = _1963;
    float _2015 = _2011;
    if (_1979)
    {
        float _2017 = _2011 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        _2013 = _2019;
    }
    float _2021 = _2013;
    float _2023 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2025 = precise::max(0.0, _2023);
    float _2027 = _1941;
    float _2029 = _2025;
    float _2031 = _2023;
    if (_1979)
    {
        float _2033 = _2011 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        _2027 = _2035;
    }
    float _2037 = _2027;
    float _2039 = -_1965;
    float _2041 = -_2025;
    float _2043 = fma(_1947, _2039, _2041);
    if (_1979)
    {
        float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2045;
    }
    float _2047 = _2029;
    float _2049 = sqrt(_1961);
    float _2051 = _2021;
    float _2053 = _2047;
    if (_1979)
    {
        float _2055 = fma(_2021, _2047, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2051 = _2055;
    }
    float _2057 = _2051;
    float _2059 = _2057;
    if (!_1979)
    {
        _2053 = _1969;
    }
    float _2061 = _2053;
    float _2063 = _2061;
    if (_1979)
    {
        float _2065 = _2037 + (-1.0);
        _2031 = _2065;
    }
    float _2067 = _2031;
    float _2069 = _2067;
    if (_1979)
    {
        float _2071 = _2001 * _2057;
        _1557 = _2071;
    }
    float _2073 = _1557;
    if (!_1979)
    {
        _2059 = _2043;
    }
    float _2075 = _2059;
    float _2077 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2079 = _2075;
    if (_1979)
    {
        float _2081 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2081;
    }
    float _2083 = _2015;
    if (_1979)
    {
        float _2085 = _1967 * _2073;
        _1993 = _2085;
    }
    float _2087 = _1993;
    if (!_1979)
    {
        _2003 = _1971;
    }
    float _2089 = _2003;
    float _2091 = _2089;
    if (_1979)
    {
        float _2093 = _1969 * _2073;
        _2063 = _2093;
    }
    float _2095 = _2063;
    if (_1979)
    {
        float _2097 = fma(_2043, _2037, _2083);
        _2079 = _2097;
    }
    float _2099 = _2079;
    if (_1979)
    {
        float _2101 = _2087 * _2087;
        _2091 = _2101;
    }
    float _2103 = _2091;
    if (!_1979)
    {
        _2069 = _1973;
    }
    float _2105 = _2069;
    float _2107 = _2105;
    if (_1979)
    {
        float _2109 = _2095 * _2095;
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = fma(_2099, _2099, _2103);
    float _2115 = _2113 + _2111;
    float _2117 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2121 = fma(_2049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2119);
    float _2123 = precise::clamp(_2121, 0.0, 1.0);
    float _2125 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2127 = rsqrt(_2115);
    float _2129 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2131 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2133 = -_2123;
    float _2135 = _2133 + 1.0;
    float _2137 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2139 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2129);
    float _2141 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2131);
    float _2143 = abs(_2135);
    float _2145 = log2(_2143);
    float _2147 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2137);
    float _2149 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2141);
    float _2151 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2077);
    float _2153 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2155 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2147);
    float _2157 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2159 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2151);
    float _2161 = _2127 * _2087;
    float _2163 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2165 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2167 = _2127 * _2099;
    float _2169 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2171 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2173 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2165);
    float _2175 = _2127 * _2095;
    float _2177 = -_2169;
    float _2179 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2177);
    float _2181 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2183 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2185 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2173);
    float _2187 = -_2175;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2179);
    float _2191 = -_2181;
    float _2193 = fma(_2191, _2125, 1.0);
    float _2195 = exp2(_2183);
    float _2197 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2185);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2203 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2205 = fma(_2189, 0.5, 0.5);
    float _2207 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2201);
    float _2209 = log2(_2193);
    float _2211 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2203);
    float _2213 = _2167 + 1.0;
    float _2215 = fma(_2205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2207);
    float _2219 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2221 = fma(_2205, _2215, -0.212114393711090087890625);
    float _2223 = 1.0 / _2197;
    float _2225 = -_2167;
    float _2227 = fma(_2195, _2213, _2225);
    float _2229 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2217);
    float _2231 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2219);
    float _2233 = fma(_2205, _2221, 1.570728778839111328125);
    float _2235 = fma(_2227, 0.5, 0.5);
    float _2237 = sqrt(_2199);
    float _2239 = _2209 * 0.693147182464599609375;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2243 = _2229 * _2223;
    float _2245 = _2231 * _2223;
    float _2247 = fma(_2243, 0.5, 0.5);
    float _2249 = fma(_2245, -0.5, 0.5);
    float _2251 = _2237 * 0.636619746685028076171875;
    float _2253 = -_2233;
    float _2255 = fma(_2251, _2253, 1.0);
    float3 _6135 = float3(_2247, _2249, _2241);
    float _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6135, float3(0.0), isnan(_6135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6135, float3(0.0), isnan(_6135)), level(0.0)).x;
    float3 _6146 = float3(_2247, _2249, _2241);
    float4 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6146, float3(0.0), isnan(_6146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6146, float3(0.0), isnan(_6146)), level(0.0)).xyzw;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = _2260.w;
    float2 _6163 = float2(_2255, _2235);
    float3 _2272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6163, float2(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6163, float2(0.0), isnan(_6163)), level(0.0)).xyz;
    float _2274 = _2272.x;
    float _2276 = _2272.y;
    float _2278 = _2272.z;
    float _2280 = in.m_51.y;
    float _2282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2284 = in.m_57.y;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2288 = _2286 != 0;
    float _2290 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2294 = _2292 != 0;
    float _2296 = in.m_51.w;
    float _2298 = in.m_55.w;
    out.m_59.x = _1155;
    out.m_59.y = _1161;
    out.m_59.z = _1151;
    out.m_59.w = _1157;
    float _2300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2304 = _2302 != 0;
    float _2306 = in.m_51.z;
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2310 = _2308 != 0;
    out.m_61.x = _1167;
    out.m_61.y = _1169;
    out.m_61.z = _1173;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2314 = _2312 != 0;
    float _2316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2318 = in.m_57.x;
    bool _2320 = false;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2324 = _2284;
    if (_2288)
    {
        bool _2326 = _972 > 0.5;
        _2320 = _2326;
    }
    bool _2328 = _2320;
    float _2330 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2332 = _2296 > 0.5;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2336 = _972 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2340 = fma(_2330, -2.0, _2334);
    float _2342 = -_2338;
    float _2344 = fma(_2336, 2.0, _2342);
    float _2346 = -_2284;
    float _2348 = _2346 + 1.0;
    out.m_63.w = _2298;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2356 = _2332 ? as_type<int>(_2348) : as_type<int>(_2284);
    float _2358 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2350);
    float _2360 = _2352;
    bool _2362 = _2332;
    float _2364 = _2348;
    if (!_2314)
    {
        _2322 = _2280;
    }
    float _2366 = _2322;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2370 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2352);
    float _2372 = _2366;
    float _2374 = _2306;
    if (!_2314)
    {
        _2360 = _2306;
    }
    float _2376 = _2360;
    float _2378 = -_122;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2344);
    float _2382 = _2376;
    if (_2314)
    {
        _2382 = _2280;
    }
    float _2384 = _2382;
    float _2386 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2370);
    float _2388 = _2304 ? as_type<float>(_2356) : _2284;
    float _2390 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2368);
    bool _2392 = _2280 > 0.5;
    float _2394 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2354);
    if (_2314)
    {
        _2372 = _972;
    }
    float _2396 = _2372;
    float _2398 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2400 = as_type<int>(_2398);
    int _2402 = as_type<int>(_2396);
    if (_2294)
    {
        bool _2404 = _2306 > 0.5;
        _2362 = _2404;
    }
    bool _2406 = _2362;
    float _2408 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2310)
    {
        float _2410 = _2392 ? _2348 : _2284;
        _2324 = _2410;
    }
    float _2412 = _2324;
    float _2414 = _2386 * (-0.15915493667125701904296875);
    float _2416 = _2396 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2314)
    {
        _2374 = _2280;
    }
    float _2418 = _2374;
    float _2420 = fma(_2398, _2412, -0.5);
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2424 = fma(_2388, _2408, -0.5);
    float _2426 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2432 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2422);
    float _2434 = _2418;
    if (_2288)
    {
        float _2436 = -_2318;
        float _2438 = _2436 + 1.0;
        _2400 = as_type<int>(_2438);
    }
    int _2440 = _2400;
    float _2442 = fma(_2426, -2.0, _2430);
    if (!_2288)
    {
        _2364 = _2318;
    }
    float _2444 = _2364;
    float _2446 = _2444;
    if (_2294)
    {
        float _2448 = -_2318;
        float _2450 = _2448 + 1.0;
        _2402 = as_type<int>(_2450);
    }
    int _2452 = _2402;
    float _2454 = _2414 * 6.283185482025146484375;
    float _2456 = sin(_2454);
    if (_2288)
    {
        float _2458 = _2328 ? as_type<float>(_2440) : _2318;
        _2446 = _2458;
    }
    float _2460 = _2446;
    float _2462 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2358);
    float _2464 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_2294)
    {
        _2434 = _2318;
    }
    float _2468 = _2434;
    float _2470 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2340);
    float _2472 = _2468;
    if (_2294)
    {
        float _2474 = _2406 ? as_type<float>(_2452) : _2318;
        _2472 = _2474;
    }
    float _2476 = _2472;
    float _2478 = _2414 * 6.283185482025146484375;
    float _2480 = cos(_2478);
    float _2482 = -_2466;
    float _2484 = fma(_2416, 2.0, _2482);
    float _2486 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2488 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2390);
    float _2492 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2394);
    float _2494 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2442);
    float _2496 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2432);
    float _2498 = exp2(_2290);
    float _2500 = -_122;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2484);
    float _2504 = _2456 * _2420;
    float _2506 = fma(_2486, _2460, -0.5);
    float _2508 = fma(_2488, _2476, -0.5);
    float _2510 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2512 = -_2494;
    float _2514 = fma(_2492, _2424, _2512);
    bool _2516 = _1943 > 0.0;
    bool _2518 = isnan(_1943);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(0.0);
    bool _2524 = _2520 || _2522;
    float _2526 = _2480 * _2420;
    float _2528 = fma(_2496, _2508, _2502);
    float _2530 = -_2504;
    float _2532 = fma(_2480, _2506, _2530);
    float _2534 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2510);
    float _2536 = fma(_2456, _2506, _2526);
    float _2538 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2540 = fma(_2462, _2532, _2380);
    float _2542 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2534);
    float _2544 = -_2498;
    float _2546 = _2544 + 1.0;
    float _2548 = -_2470;
    float _2550 = fma(_2490, _2536, _2548);
    float _2552 = _2528 + 0.5;
    float _2554 = _2514 + 0.5;
    float _2556 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2558 = _2540 + 0.5;
    float _2560 = _2550 + 0.5;
    float _2562 = _2542 + _2197;
    float _2564 = _2538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2558;
    out.m_65.y = _2560;
    out.m_65.z = _2552;
    out.m_65.w = _2554;
    float _2566 = _2562 * 0.5;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2231;
    out.gl_Position.z = _2542;
    out.gl_Position.w = _2197;
    out.m_67.z = _2566;
    out.m_67.w = _2197;
    out.m_45.x = _2564;
    float _2568 = _2556 * _2257;
    float _2570 = -_2556;
    float _2572 = _2570 + 1.0;
    float _2574 = _2268 * _2568;
    float _2576 = _2278 * _2568;
    float _2578 = fma(_2274, _2574, _2262);
    float _2580 = fma(_2276, _2574, _2264);
    float _2582 = _2268 * _2572;
    float _2584 = fma(_2268, _2576, _2266);
    out.m_69.x = _2578;
    out.m_69.y = _2580;
    out.m_69.z = _2584;
    out.m_69.w = _2582;
    if (_2524)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1193 = false;
    bool _962 = false;
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
        float _2643 = as_type<float>(_104);
        out.gl_Position.z = _2643;
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
        float _2714 = as_type<float>(_144);
        out.gl_Position.z = _2714;
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
    float _366 = in.m_49.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_42.x;
    float _388 = in.m_42.y;
    float _390 = in.m_42.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_338, _366, _388);
    float _414 = fma(_356, _366, _390);
    float _416 = fma(_344, _366, _386);
    float _418 = _338;
    float _420 = _356;
    float _422 = _400;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _398;
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
            _422 = _466;
            _426 = _464;
            _430 = _468;
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
                    _422 = _520;
                    _426 = _518;
                    _430 = _522;
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
                    _422 = _554;
                    _426 = _552;
                    _430 = _556;
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
                _422 = _588;
                _426 = _586;
                _430 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _422;
    float _594 = _426;
    float _596 = _430;
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
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _632 = _628 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _650 = 1.0 / _636;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _652;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _672 = _628 + _670;
    float _674 = 1.0 / _648;
    float _676 = _672 * _650;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _628 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _684 = _628 + _682;
    bool _686 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _688 = isnan(_628);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _700 = 1.0 / _654;
    float _702 = _680 * _668;
    float _704 = 1.0 / _644;
    float _706 = _632 * _674;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _708;
    float _712 = fma(_710, _676, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _716 = _628 + _714;
    float _718 = _716 * _700;
    bool _720 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _722 = isnan(_628);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _732;
    float _736 = _684 * _704;
    float _738 = -_730;
    float _740 = _738 + 1.0;
    float _742 = fma(_734, _676, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _744 = -_696;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = _696 * _740;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = fma(_750, _676, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _764 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _766 = isnan(_628);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _780 = -_666;
    float _782 = _780 + 1.0;
    bool _784 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _786 = isnan(_628);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = _666 * _746;
    bool _798 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _800 = isnan(_628);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = fma(_756, _702, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _812 = _774 * _782;
    float _814 = fma(_760, _702, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_778, _702, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = -_774;
    float _820 = _818 + 1.0;
    float _822 = -_808;
    float _824 = _822 + 1.0;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _826;
    float _830 = _808 * _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _836;
    float _840 = _794 * _824;
    float _842 = fma(_828, _736, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _844 = fma(_834, _736, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _846 = fma(_838, _736, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _848 = _762 * _840;
    float _850 = -_794;
    float _852 = _850 + 1.0;
    float _854 = _742 * _840;
    float _856 = _712 * _840;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _848);
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _854);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _874 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _856);
    float _876 = fma(_860, _706, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _878 = fma(_868, _706, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _880 = fma(_872, _706, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _882 = fma(_816, _830, _864);
    float _884 = fma(_810, _830, _862);
    float _886 = in.m_49.x;
    float _888 = in.m_49.y;
    float _890 = in.m_49.z;
    float _892 = fma(_814, _830, _874);
    float _894 = fma(_844, _812, _884);
    float _896 = fma(_842, _812, _892);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _898;
    float _902 = fma(_846, _812, _882);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _904;
    float _908 = fma(_876, _796, _894);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _910;
    float _914 = fma(_900, _718, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _916 = fma(_906, _718, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _918 = fma(_878, _796, _896);
    float _920 = fma(_912, _718, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _922 = fma(_880, _796, _902);
    float _924 = fma(_914, _752, _908);
    float _926 = fma(_916, _752, _918);
    float _928 = fma(_920, _752, _922);
    float _930 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].x, _924);
    float _932 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].y, _926);
    float _934 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].z, _928);
    float _936 = _930 * _886;
    float _938 = _932 * _888;
    float _940 = _934 * _890;
    bool _942 = !_698;
    float _960;
    if (!_942)
    {
        float _944 = in.m_51.x;
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _948 = _944 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _952 = _950 * _946;
        float _954 = floor(_952);
        float _956 = -_954;
        float _958 = _952 + _956;
        _960 = _958;
        _962 = true;
    }
    else
    {
        float _964 = float(_88);
        float _966 = 1.0 / _964;
        float _968 = _122 * _966;
        _960 = _968;
    }
    _962 = false;
    float _970 = _960;
    float _972 = in.m_51.x;
    float _974 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _984 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _986 = isnan(_970);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1000 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1002 = isnan(_970);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = 1.0 / _978;
    bool _1014 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1016 = isnan(_970);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -_994;
    float _1028 = _1026 + 1.0;
    bool _1030 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1032 = 1.0 / _982;
    float _1034 = _974 * _972;
    float _1036 = trunc(_1034);
    int _1038 = int(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1044 = 1.0 / _998;
    float _1046 = _1042 * _1032;
    int _1048 = _1038 << 4;
    int _1050 = _1048 + 1968;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1052;
    float _1056 = _1010 * _1028;
    float _1058 = -_1010;
    float _1060 = _1058 + 1.0;
    uint _1063 = uint(int(uint(_1050) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[int(_1073)][_1075];
    float _1079 = _1054 * _1012;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1083 = _970 + _1081;
    float _1085 = _1024 * _1060;
    bool _1087 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1089 = isnan(_970);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1099;
    float _1103 = fma(_1079, _1083, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1107 = _970 + _1105;
    int _1109 = _1050 + 8;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
    int _1115 = int(_1111) & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = -_1024;
    float _1121 = _1119 + 1.0;
    float _1123 = _1103 * _1085;
    float _1125 = _1101 * _1044;
    float _1127 = fma(_1046, _1107, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1129 = -_1097;
    float _1131 = _1129 + 1.0;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _970 + _1133;
    float _1137 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1123);
    float _1139 = _994 * _1131;
    float _1141 = fma(_1125, _1135, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1143 = fma(_1127, _1056, _1137);
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1147 = fma(_1141, _1139, _1143);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1147);
    float _1155 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1161 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1175 = !_1030;
    float _1191;
    if (!_1175)
    {
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1179 = _972 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _1183 = _1181 * _1177;
        float _1185 = floor(_1183);
        float _1187 = -_1185;
        float _1189 = _1183 + _1187;
        _1191 = _1189;
        _1193 = true;
    }
    else
    {
        float _1195 = float(_88);
        float _1197 = 1.0 / _1195;
        float _1199 = _122 * _1197;
        _1191 = _1199;
    }
    _1193 = false;
    float _1201 = _1191;
    float _1203 = in.m_53.x;
    float _1205 = in.m_53.y;
    float _1207 = in.m_53.z;
    float _1209 = _412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1211 = _412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1217 = _412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1223 = 1.0 / _1215;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1229 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1209);
    float _1231 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1233 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1217);
    bool _1235 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.5);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1229);
    float _1247 = 1.0 / _1221;
    float _1249 = _936 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1251 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1231);
    float _1253 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1205);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1257;
    float _1261 = 1.0 / _1227;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1203);
    float _1269 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1275 = _1265 * _1223;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1277;
    float _1281 = 1.0 / _1273;
    float _1283 = _1267 * _1249;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1293 = _1279 * _1261;
    float _1295 = _1259 * _1247;
    float _1297 = 1.0 / _1287;
    float _1299 = _592 * _592;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1309;
    float _1313 = _938 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1315 = _1291 * _1281;
    float _1317 = fma(_594, _594, _1299);
    float _1319 = 1.0 / _1303;
    bool _1321 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1323 = isnan(_1201);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1207);
    float _1335 = fma(_596, _596, _1317);
    float _1337 = _940 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1339 = -_1331;
    float _1341 = _1339 + 1.0;
    float _1343 = _1311 * _1297;
    float _1345 = rsqrt(_1335);
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1351 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1353 = isnan(_1201);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1359 = _1355 || _1357;
    float _1361 = float(_1359);
    float _1363 = 1.0 / _1307;
    bool _1365 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1367 = isnan(_1201);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = -_1375;
    float _1379 = _1377 + 1.0;
    float _1381 = _1345 * _592;
    bool _1383 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1385 = isnan(_1201);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = _1345 * _594;
    float _1397 = _1345 * _596;
    bool _1399 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1401 = isnan(_1201);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = _1393 * _1341;
    float _1413 = -_1393;
    float _1415 = _1413 + 1.0;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1417;
    bool _1421 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1423 = isnan(_1201);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1435 = _1201 + _1433;
    float _1437 = _1361 * _1415;
    float _1439 = -_1361;
    float _1441 = _1439 + 1.0;
    float _1443 = _1419 * _1319;
    bool _1445 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1447 = isnan(_1201);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = _1349 * _1363;
    float _1459 = -_1431;
    float _1461 = _1459 + 1.0;
    float _1463 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1465 = _1431 * _1441;
    float _1467 = fma(_1295, _1435, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1469 = _1455 * _1461;
    float _1471 = -_1455;
    float _1473 = _1471 + 1.0;
    bool _1475 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1477 = isnan(_1201);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1395, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1463);
    float _1489 = _1375 * _1473;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1493 = _1201 + _1491;
    float _1495 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1487);
    float _1497 = _1485 * _1379;
    float _1499 = -_1485;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1275, _1493, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1507 = _1201 + _1505;
    float _1509 = abs(_1495);
    bool _1511 = _1509 > 0.99989998340606689453125;
    float _1513 = _1409 * _1501;
    float _1515 = -_1409;
    float _1517 = _1515 + 1.0;
    float _1519 = fma(_1293, _1507, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1523 = _1201 + _1521;
    float _1525 = _1467 * _1513;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1529 = _1201 + _1527;
    float _1531 = fma(_1315, _1523, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1533 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1525);
    float _1535 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1539 = _1269 + _1537;
    float _1541 = fma(_1343, _1529, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1543 = _1293;
    float _1545 = _1517;
    float _1547 = _1463;
    float _1549 = _1333;
    float _1551 = _1269;
    float _1553 = _1535;
    float _1555 = _1381;
    float _1557 = _1539;
    if (_1511)
    {
        _1543 = 0.001000000047497451305389404296875;
    }
    float _1559 = _1543;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1535 + _1561;
    float _1565 = _1539 * _1539;
    float _1567 = 0.0;
    if (!_1511)
    {
        _1567 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1569 = _1567;
    float _1571 = fma(_1503, _1497, _1533);
    float _1573 = _1569;
    if (_1511)
    {
        float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1573 = _1575;
    }
    float _1577 = _1573;
    float _1579 = fma(_1563, _1563, _1565);
    if (!_1511)
    {
        _1545 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1581 = _1545;
    float _1583 = _1581;
    if (_1511)
    {
        float _1585 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = -_1577;
    float _1591 = _1397 * _1589;
    float _1593 = sqrt(_1579);
    if (!_1511)
    {
        _1547 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1595 = _1547;
    float _1597 = _1595;
    if (_1511)
    {
        float _1599 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = -_1587;
    float _1605 = _1381 * _1603;
    float _1607 = -_1587;
    float _1609 = -_1591;
    float _1611 = fma(_1395, _1607, _1609);
    float _1613 = fma(_1519, _1489, _1571);
    float _1615 = -_1601;
    float _1617 = _1395 * _1615;
    float _1619 = -_1601;
    float _1621 = -_1605;
    float _1623 = fma(_1397, _1619, _1621);
    float _1625 = _1611 * _1611;
    float _1627 = in.m_55.x;
    float _1629 = -_1577;
    float _1631 = -_1617;
    float _1633 = fma(_1381, _1629, _1631);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1637 = _1201 + _1635;
    float _1639 = fma(_1623, _1623, _1625);
    float _1641 = fma(_1457, _1637, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1643 = fma(_1633, _1633, _1639);
    bool _1645 = _1593 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1647 = fma(_1531, _1469, _1613);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1651 = _1201 + _1649;
    float _1653 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1655 = rsqrt(_1643);
    float _1657 = fma(_1541, _1465, _1647);
    float _1659 = fma(_1443, _1651, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1661 = fma(_1641, _1437, _1657);
    float _1663 = _1255 * _1313;
    float _1665 = _1333 * _1337;
    float _1667 = fma(_1659, _1411, _1661);
    if (!_1645)
    {
        _1549 = _1653;
    }
    float _1669 = _1549;
    bool _1671 = !_1645;
    float _1673 = _1669;
    if (!_1671)
    {
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1679 = _1593 + _1677;
        float _1681 = _1653 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = rsqrt(_1579);
        float _1685 = _1679 * _1675;
        float _1687 = _1685 * 0.15915493667125701904296875;
        float _1689 = _1687 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = _1687 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 + (-1.0);
        float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = fma(_1695, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1703 = fma(_1653, _1691, _1699);
        float _1705 = _1683 * _1701;
        float _1707 = fma(_1563, _1705, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1709 = fma(_1539, _1705, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1673 = _1703;
        _1551 = _1709;
        _1553 = _1707;
    }
    float _1711 = _1673;
    float _1713 = _1551;
    float _1715 = _1553;
    float _1717 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1667);
    float _1719 = _1663 * _1381;
    float _1721 = _1611 * _1655;
    float _1723 = _1623 * _1655;
    float _1725 = _1633 * _1655;
    float _1727 = _1663 * _1395;
    float _1729 = fma(_1283, _1721, _1719);
    float _1731 = _1397 * _1723;
    float _1733 = _1663 * _1397;
    float _1735 = _1395 * _1721;
    float _1737 = fma(_1283, _1723, _1727);
    float _1739 = -_1731;
    float _1741 = fma(_1395, _1725, _1739);
    float _1743 = _1381 * _1725;
    float _1745 = fma(_1283, _1725, _1733);
    float _1747 = -_1735;
    float _1749 = fma(_1381, _1723, _1747);
    float _1751 = _1627 * _1627;
    float _1753 = fma(_1665, _1741, _1729);
    float _1755 = -_1743;
    float _1757 = fma(_1397, _1721, _1755);
    float _1759 = fma(_1665, _1749, _1745);
    float _1761 = _1751 * _1751;
    float _1763 = _1717 * 3.0;
    float _1765 = _1753 + _1711;
    float _1767 = fma(_1665, _1757, _1737);
    float _1769 = _1759 + _1713;
    float _1771 = -_1761;
    float _1773 = fma(_1771, _1763, _1765);
    float _1775 = _1767 + _1715;
    float _1777 = _1763;
    float _1779 = _1765;
    float _1781 = _1775;
    float _1783 = _1767;
    if (_1243)
    {
        _1777 = _1769;
    }
    float _1785 = _1777;
    float _1787 = _1785;
    if (_1243)
    {
        _1779 = _1773;
    }
    float _1789 = _1779;
    float _1791 = _1789;
    if (!_1243)
    {
        float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1795 = _1711 + _1793;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1799 = _1715 + _1797;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1803 = _1795 * _1795;
        float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1807 = _1713 + _1805;
        float _1809 = fma(_1799, _1799, _1803);
        float _1811 = -_1711;
        float _1813 = _1773 + _1811;
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1817 = fma(_1807, _1807, _1809);
        float _1819 = sqrt(_1817);
        float _1821 = _1801 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1823 = precise::min(_1819, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1825 = _1823 * _1815;
        float _1827 = _1821 * _1825;
        float _1829 = fma(_1767, _1827, _1715);
        float _1831 = fma(_1813, _1827, _1711);
        float _1833 = fma(_1759, _1827, _1713);
        _1791 = _1831;
        _1781 = _1829;
        _1787 = _1833;
    }
    float _1835 = _1791;
    float _1837 = _1781;
    float _1839 = _1787;
    float _1841 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1843 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1841);
    float _1845 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1843);
    float _1847 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1849 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1847);
    bool _1853 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.5);
    bool _1861 = _1857 || _1859;
    float _1863 = 1.0 / _1849;
    float _1865 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1851);
    float _1867 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1869 = _1867 + _1849;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1861)
    {
        _1871 = 1.0;
    }
    float _1873 = _1871;
    float _1875 = _1869 * _1863;
    float _1877 = _1875 * 0.5;
    float _1879 = _1873;
    if (!_1861)
    {
        float _1881 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1885 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
        float _1887 = _1881 * 0.15915493667125701904296875;
        float _1889 = _1887 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1895 = _1893 * 0.15915493667125701904296875;
        float _1897 = _1887 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        float _1901 = 1.0 / _1891;
        float _1903 = _1895 * 6.283185482025146484375;
        float _1905 = cos(_1903);
        float _1907 = _1899 * _1901;
        float _1909 = 1.0 / _1885;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1913 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1911;
        float _1915 = _1905 * _1907;
        float _1917 = _1895 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1915;
        float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1925 = _1909 * _1923;
        float _1927 = 1.0 / _1913;
        float _1929 = _1919 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1933 = fma(_1929, _1925, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        _1783 = _1927;
        _1555 = _1887;
        _1879 = _1937;
    }
    float _1939 = _1783;
    float _1941 = _1555;
    float _1943 = _1879;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1835 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1837 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1839 + _1953;
    float _1957 = _1947 * _1947;
    float _1959 = fma(_1951, _1951, _1957);
    float _1961 = fma(_1955, _1955, _1959);
    float _1963 = rsqrt(_1961);
    float _1965 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1967 = _1951 * _1965;
    float _1969 = _1955 * _1965;
    float _1971 = _1967 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 + _1973;
    float _1977 = sqrt(_1975);
    bool _1979 = _1977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = _1977 + _1981;
    float _1985 = _1955;
    float _1987 = _1975;
    float _1989 = _1983;
    float _1991 = _1939;
    float _1993 = _1967;
    if (_1979)
    {
        float _1995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1985 = _1995;
    }
    float _1997 = _1985;
    if (_1979)
    {
        float _1999 = rsqrt(_1975);
        _1987 = _1999;
    }
    float _2001 = _1987;
    float _2003 = _2001;
    if (_1979)
    {
        float _2005 = _1983 * _1997;
        _1989 = _2005;
    }
    float _2007 = _1989;
    if (_1979)
    {
        float _2009 = _2007 * 0.15915493667125701904296875;
        _1991 = _2009;
    }
    float _2011 = _1991;
    float _2013 = _1963;
    float _2015 = _2011;
    if (_1979)
    {
        float _2017 = _2011 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        _2013 = _2019;
    }
    float _2021 = _2013;
    float _2023 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2025 = precise::max(0.0, _2023);
    float _2027 = _1941;
    float _2029 = _2025;
    float _2031 = _2023;
    if (_1979)
    {
        float _2033 = _2011 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        _2027 = _2035;
    }
    float _2037 = _2027;
    float _2039 = -_1965;
    float _2041 = -_2025;
    float _2043 = fma(_1947, _2039, _2041);
    if (_1979)
    {
        float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2045;
    }
    float _2047 = _2029;
    float _2049 = sqrt(_1961);
    float _2051 = _2021;
    float _2053 = _2047;
    if (_1979)
    {
        float _2055 = fma(_2021, _2047, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2051 = _2055;
    }
    float _2057 = _2051;
    float _2059 = _2057;
    if (!_1979)
    {
        _2053 = _1969;
    }
    float _2061 = _2053;
    float _2063 = _2061;
    if (_1979)
    {
        float _2065 = _2037 + (-1.0);
        _2031 = _2065;
    }
    float _2067 = _2031;
    float _2069 = _2067;
    if (_1979)
    {
        float _2071 = _2001 * _2057;
        _1557 = _2071;
    }
    float _2073 = _1557;
    if (!_1979)
    {
        _2059 = _2043;
    }
    float _2075 = _2059;
    float _2077 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2079 = _2075;
    if (_1979)
    {
        float _2081 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2081;
    }
    float _2083 = _2015;
    if (_1979)
    {
        float _2085 = _1967 * _2073;
        _1993 = _2085;
    }
    float _2087 = _1993;
    if (!_1979)
    {
        _2003 = _1971;
    }
    float _2089 = _2003;
    float _2091 = _2089;
    if (_1979)
    {
        float _2093 = _1969 * _2073;
        _2063 = _2093;
    }
    float _2095 = _2063;
    if (_1979)
    {
        float _2097 = fma(_2043, _2037, _2083);
        _2079 = _2097;
    }
    float _2099 = _2079;
    if (_1979)
    {
        float _2101 = _2087 * _2087;
        _2091 = _2101;
    }
    float _2103 = _2091;
    if (!_1979)
    {
        _2069 = _1973;
    }
    float _2105 = _2069;
    float _2107 = _2105;
    if (_1979)
    {
        float _2109 = _2095 * _2095;
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = fma(_2099, _2099, _2103);
    float _2115 = _2113 + _2111;
    float _2117 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2121 = fma(_2049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2119);
    float _2123 = precise::clamp(_2121, 0.0, 1.0);
    float _2125 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2127 = rsqrt(_2115);
    float _2129 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2131 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2133 = -_2123;
    float _2135 = _2133 + 1.0;
    float _2137 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2139 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2129);
    float _2141 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2131);
    float _2143 = abs(_2135);
    float _2145 = log2(_2143);
    float _2147 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2137);
    float _2149 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2141);
    float _2151 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2077);
    float _2153 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2155 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2147);
    float _2157 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2159 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2151);
    float _2161 = _2127 * _2087;
    float _2163 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2165 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2167 = _2127 * _2099;
    float _2169 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2171 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2173 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2165);
    float _2175 = _2127 * _2095;
    float _2177 = -_2169;
    float _2179 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2177);
    float _2181 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2183 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2185 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2173);
    float _2187 = -_2175;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2179);
    float _2191 = -_2181;
    float _2193 = fma(_2191, _2125, 1.0);
    float _2195 = exp2(_2183);
    float _2197 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2185);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2203 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2205 = fma(_2189, 0.5, 0.5);
    float _2207 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2201);
    float _2209 = log2(_2193);
    float _2211 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2203);
    float _2213 = _2167 + 1.0;
    float _2215 = fma(_2205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2207);
    float _2219 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2221 = fma(_2205, _2215, -0.212114393711090087890625);
    float _2223 = 1.0 / _2197;
    float _2225 = -_2167;
    float _2227 = fma(_2195, _2213, _2225);
    float _2229 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2217);
    float _2231 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2219);
    float _2233 = fma(_2205, _2221, 1.570728778839111328125);
    float _2235 = fma(_2227, 0.5, 0.5);
    float _2237 = sqrt(_2199);
    float _2239 = _2209 * 0.693147182464599609375;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2243 = _2229 * _2223;
    float _2245 = _2231 * _2223;
    float _2247 = fma(_2243, 0.5, 0.5);
    float _2249 = fma(_2245, -0.5, 0.5);
    float _2251 = _2237 * 0.636619746685028076171875;
    float _2253 = -_2233;
    float _2255 = fma(_2251, _2253, 1.0);
    float3 _6135 = float3(_2247, _2249, _2241);
    float _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6135, float3(0.0), isnan(_6135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6135, float3(0.0), isnan(_6135)), level(0.0)).x;
    float3 _6146 = float3(_2247, _2249, _2241);
    float4 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6146, float3(0.0), isnan(_6146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6146, float3(0.0), isnan(_6146)), level(0.0)).xyzw;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = _2260.w;
    float2 _6163 = float2(_2255, _2235);
    float3 _2272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6163, float2(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6163, float2(0.0), isnan(_6163)), level(0.0)).xyz;
    float _2274 = _2272.x;
    float _2276 = _2272.y;
    float _2278 = _2272.z;
    float _2280 = in.m_51.y;
    float _2282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2284 = in.m_57.y;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2288 = _2286 != 0;
    float _2290 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2294 = _2292 != 0;
    float _2296 = in.m_51.w;
    float _2298 = in.m_55.w;
    out.m_59.x = _1155;
    out.m_59.y = _1161;
    out.m_59.z = _1151;
    out.m_59.w = _1157;
    float _2300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2304 = _2302 != 0;
    float _2306 = in.m_51.z;
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2310 = _2308 != 0;
    out.m_61.x = _1167;
    out.m_61.y = _1169;
    out.m_61.z = _1173;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2314 = _2312 != 0;
    float _2316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2318 = in.m_57.x;
    bool _2320 = false;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2324 = _2284;
    if (_2288)
    {
        bool _2326 = _972 > 0.5;
        _2320 = _2326;
    }
    bool _2328 = _2320;
    float _2330 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2332 = _2296 > 0.5;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2336 = _972 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2340 = fma(_2330, -2.0, _2334);
    float _2342 = -_2338;
    float _2344 = fma(_2336, 2.0, _2342);
    float _2346 = -_2284;
    float _2348 = _2346 + 1.0;
    out.m_63.w = _2298;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2356 = _2332 ? as_type<int>(_2348) : as_type<int>(_2284);
    float _2358 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2350);
    float _2360 = _2352;
    bool _2362 = _2332;
    float _2364 = _2348;
    if (!_2314)
    {
        _2322 = _2280;
    }
    float _2366 = _2322;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2370 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2352);
    float _2372 = _2366;
    float _2374 = _2306;
    if (!_2314)
    {
        _2360 = _2306;
    }
    float _2376 = _2360;
    float _2378 = -_122;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2344);
    float _2382 = _2376;
    if (_2314)
    {
        _2382 = _2280;
    }
    float _2384 = _2382;
    float _2386 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2370);
    float _2388 = _2304 ? as_type<float>(_2356) : _2284;
    float _2390 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2368);
    bool _2392 = _2280 > 0.5;
    float _2394 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2354);
    if (_2314)
    {
        _2372 = _972;
    }
    float _2396 = _2372;
    float _2398 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2400 = as_type<int>(_2398);
    int _2402 = as_type<int>(_2396);
    if (_2294)
    {
        bool _2404 = _2306 > 0.5;
        _2362 = _2404;
    }
    bool _2406 = _2362;
    float _2408 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2310)
    {
        float _2410 = _2392 ? _2348 : _2284;
        _2324 = _2410;
    }
    float _2412 = _2324;
    float _2414 = _2386 * (-0.15915493667125701904296875);
    float _2416 = _2396 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2314)
    {
        _2374 = _2280;
    }
    float _2418 = _2374;
    float _2420 = fma(_2398, _2412, -0.5);
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2424 = fma(_2388, _2408, -0.5);
    float _2426 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2432 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2422);
    float _2434 = _2418;
    if (_2288)
    {
        float _2436 = -_2318;
        float _2438 = _2436 + 1.0;
        _2400 = as_type<int>(_2438);
    }
    int _2440 = _2400;
    float _2442 = fma(_2426, -2.0, _2430);
    if (!_2288)
    {
        _2364 = _2318;
    }
    float _2444 = _2364;
    float _2446 = _2444;
    if (_2294)
    {
        float _2448 = -_2318;
        float _2450 = _2448 + 1.0;
        _2402 = as_type<int>(_2450);
    }
    int _2452 = _2402;
    float _2454 = _2414 * 6.283185482025146484375;
    float _2456 = sin(_2454);
    if (_2288)
    {
        float _2458 = _2328 ? as_type<float>(_2440) : _2318;
        _2446 = _2458;
    }
    float _2460 = _2446;
    float _2462 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2358);
    float _2464 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_2294)
    {
        _2434 = _2318;
    }
    float _2468 = _2434;
    float _2470 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2340);
    float _2472 = _2468;
    if (_2294)
    {
        float _2474 = _2406 ? as_type<float>(_2452) : _2318;
        _2472 = _2474;
    }
    float _2476 = _2472;
    float _2478 = _2414 * 6.283185482025146484375;
    float _2480 = cos(_2478);
    float _2482 = -_2466;
    float _2484 = fma(_2416, 2.0, _2482);
    float _2486 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2488 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2390);
    float _2492 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2394);
    float _2494 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2442);
    float _2496 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2432);
    float _2498 = exp2(_2290);
    float _2500 = -_122;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2484);
    float _2504 = _2456 * _2420;
    float _2506 = fma(_2486, _2460, -0.5);
    float _2508 = fma(_2488, _2476, -0.5);
    float _2510 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2512 = -_2494;
    float _2514 = fma(_2492, _2424, _2512);
    bool _2516 = _1943 > 0.0;
    bool _2518 = isnan(_1943);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(0.0);
    bool _2524 = _2520 || _2522;
    float _2526 = _2480 * _2420;
    float _2528 = fma(_2496, _2508, _2502);
    float _2530 = -_2504;
    float _2532 = fma(_2480, _2506, _2530);
    float _2534 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2510);
    float _2536 = fma(_2456, _2506, _2526);
    float _2538 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2540 = fma(_2462, _2532, _2380);
    float _2542 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2534);
    float _2544 = -_2498;
    float _2546 = _2544 + 1.0;
    float _2548 = -_2470;
    float _2550 = fma(_2490, _2536, _2548);
    float _2552 = _2528 + 0.5;
    float _2554 = _2514 + 0.5;
    float _2556 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2558 = _2540 + 0.5;
    float _2560 = _2550 + 0.5;
    float _2562 = _2542 + _2197;
    float _2564 = _2538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2558;
    out.m_65.y = _2560;
    out.m_65.z = _2552;
    out.m_65.w = _2554;
    float _2566 = _2562 * 0.5;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2231;
    out.gl_Position.z = _2542;
    out.gl_Position.w = _2197;
    out.m_67.z = _2566;
    out.m_67.w = _2197;
    out.m_45.x = _2564;
    float _2568 = _2556 * _2257;
    float _2570 = -_2556;
    float _2572 = _2570 + 1.0;
    float _2574 = _2268 * _2568;
    float _2576 = _2278 * _2568;
    float _2578 = fma(_2274, _2574, _2262);
    float _2580 = fma(_2276, _2574, _2264);
    float _2582 = _2268 * _2572;
    float _2584 = fma(_2268, _2576, _2266);
    out.m_69.x = _2578;
    out.m_69.y = _2580;
    out.m_69.z = _2584;
    out.m_69.w = _2582;
    if (_2524)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1193 = false;
    bool _962 = false;
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
        float _2643 = as_type<float>(_104);
        out.gl_Position.z = _2643;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2714 = as_type<float>(_144);
        out.gl_Position.z = _2714;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _366 = in.m_49.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_42.x;
    float _388 = in.m_42.y;
    float _390 = in.m_42.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_338, _366, _388);
    float _414 = fma(_356, _366, _390);
    float _416 = fma(_344, _366, _386);
    float _418 = _338;
    float _420 = _356;
    float _422 = _400;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (_410)
    {
        _420 = _398;
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
            _422 = _466;
            _426 = _464;
            _430 = _468;
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
                    _422 = _520;
                    _426 = _518;
                    _430 = _522;
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
                    _422 = _554;
                    _426 = _552;
                    _430 = _556;
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
                _422 = _588;
                _426 = _586;
                _430 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _422;
    float _594 = _426;
    float _596 = _430;
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
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _632 = _628 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _650 = 1.0 / _636;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _652;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _672 = _628 + _670;
    float _674 = 1.0 / _648;
    float _676 = _672 * _650;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _628 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _684 = _628 + _682;
    bool _686 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _688 = isnan(_628);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _700 = 1.0 / _654;
    float _702 = _680 * _668;
    float _704 = 1.0 / _644;
    float _706 = _632 * _674;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _708;
    float _712 = fma(_710, _676, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _716 = _628 + _714;
    float _718 = _716 * _700;
    bool _720 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _722 = isnan(_628);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _732;
    float _736 = _684 * _704;
    float _738 = -_730;
    float _740 = _738 + 1.0;
    float _742 = fma(_734, _676, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _744 = -_696;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = _696 * _740;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = fma(_750, _676, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _764 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _766 = isnan(_628);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _780 = -_666;
    float _782 = _780 + 1.0;
    bool _784 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _786 = isnan(_628);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = _666 * _746;
    bool _798 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _800 = isnan(_628);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = fma(_756, _702, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _812 = _774 * _782;
    float _814 = fma(_760, _702, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_778, _702, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = -_774;
    float _820 = _818 + 1.0;
    float _822 = -_808;
    float _824 = _822 + 1.0;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _826;
    float _830 = _808 * _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _836;
    float _840 = _794 * _824;
    float _842 = fma(_828, _736, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _844 = fma(_834, _736, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _846 = fma(_838, _736, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _848 = _762 * _840;
    float _850 = -_794;
    float _852 = _850 + 1.0;
    float _854 = _742 * _840;
    float _856 = _712 * _840;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _848);
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _854);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _874 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _856);
    float _876 = fma(_860, _706, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _878 = fma(_868, _706, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _880 = fma(_872, _706, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _882 = fma(_816, _830, _864);
    float _884 = fma(_810, _830, _862);
    float _886 = in.m_49.x;
    float _888 = in.m_49.y;
    float _890 = in.m_49.z;
    float _892 = fma(_814, _830, _874);
    float _894 = fma(_844, _812, _884);
    float _896 = fma(_842, _812, _892);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _898;
    float _902 = fma(_846, _812, _882);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _904;
    float _908 = fma(_876, _796, _894);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _910;
    float _914 = fma(_900, _718, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _916 = fma(_906, _718, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _918 = fma(_878, _796, _896);
    float _920 = fma(_912, _718, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _922 = fma(_880, _796, _902);
    float _924 = fma(_914, _752, _908);
    float _926 = fma(_916, _752, _918);
    float _928 = fma(_920, _752, _922);
    float _930 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].x, _924);
    float _932 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].y, _926);
    float _934 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[148].z, _928);
    float _936 = _930 * _886;
    float _938 = _932 * _888;
    float _940 = _934 * _890;
    bool _942 = !_698;
    float _960;
    if (!_942)
    {
        float _944 = in.m_51.x;
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _948 = _944 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _952 = _950 * _946;
        float _954 = floor(_952);
        float _956 = -_954;
        float _958 = _952 + _956;
        _960 = _958;
        _962 = true;
    }
    else
    {
        float _964 = float(_88);
        float _966 = 1.0 / _964;
        float _968 = _122 * _966;
        _960 = _968;
    }
    _962 = false;
    float _970 = _960;
    float _972 = in.m_51.x;
    float _974 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _984 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _986 = isnan(_970);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1000 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1002 = isnan(_970);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = 1.0 / _978;
    bool _1014 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1016 = isnan(_970);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -_994;
    float _1028 = _1026 + 1.0;
    bool _1030 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1032 = 1.0 / _982;
    float _1034 = _974 * _972;
    float _1036 = trunc(_1034);
    int _1038 = int(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1044 = 1.0 / _998;
    float _1046 = _1042 * _1032;
    int _1048 = _1038 << 4;
    int _1050 = _1048 + 1968;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1052;
    float _1056 = _1010 * _1028;
    float _1058 = -_1010;
    float _1060 = _1058 + 1.0;
    uint _1063 = uint(int(uint(_1050) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[int(_1073)][_1075];
    float _1079 = _1054 * _1012;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1083 = _970 + _1081;
    float _1085 = _1024 * _1060;
    bool _1087 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1089 = isnan(_970);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1099;
    float _1103 = fma(_1079, _1083, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1107 = _970 + _1105;
    int _1109 = _1050 + 8;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
    int _1115 = int(_1111) & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = -_1024;
    float _1121 = _1119 + 1.0;
    float _1123 = _1103 * _1085;
    float _1125 = _1101 * _1044;
    float _1127 = fma(_1046, _1107, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1129 = -_1097;
    float _1131 = _1129 + 1.0;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _970 + _1133;
    float _1137 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1123);
    float _1139 = _994 * _1131;
    float _1141 = fma(_1125, _1135, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1143 = fma(_1127, _1056, _1137);
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1147 = fma(_1141, _1139, _1143);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1151 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1147);
    float _1155 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1161 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1175 = !_1030;
    float _1191;
    if (!_1175)
    {
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1179 = _972 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _1183 = _1181 * _1177;
        float _1185 = floor(_1183);
        float _1187 = -_1185;
        float _1189 = _1183 + _1187;
        _1191 = _1189;
        _1193 = true;
    }
    else
    {
        float _1195 = float(_88);
        float _1197 = 1.0 / _1195;
        float _1199 = _122 * _1197;
        _1191 = _1199;
    }
    _1193 = false;
    float _1201 = _1191;
    float _1203 = in.m_53.x;
    float _1205 = in.m_53.y;
    float _1207 = in.m_53.z;
    float _1209 = _412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1211 = _412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1215 = _1213 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1217 = _412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1223 = 1.0 / _1215;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1229 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1209);
    float _1231 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1233 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1217);
    bool _1235 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.5);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1229);
    float _1247 = 1.0 / _1221;
    float _1249 = _936 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1251 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1231);
    float _1253 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1205);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1257;
    float _1261 = 1.0 / _1227;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1267 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1203);
    float _1269 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1275 = _1265 * _1223;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1277;
    float _1281 = 1.0 / _1273;
    float _1283 = _1267 * _1249;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1293 = _1279 * _1261;
    float _1295 = _1259 * _1247;
    float _1297 = 1.0 / _1287;
    float _1299 = _592 * _592;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1309;
    float _1313 = _938 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1315 = _1291 * _1281;
    float _1317 = fma(_594, _594, _1299);
    float _1319 = 1.0 / _1303;
    bool _1321 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1323 = isnan(_1201);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1207);
    float _1335 = fma(_596, _596, _1317);
    float _1337 = _940 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1339 = -_1331;
    float _1341 = _1339 + 1.0;
    float _1343 = _1311 * _1297;
    float _1345 = rsqrt(_1335);
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1351 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1353 = isnan(_1201);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1359 = _1355 || _1357;
    float _1361 = float(_1359);
    float _1363 = 1.0 / _1307;
    bool _1365 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1367 = isnan(_1201);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = -_1375;
    float _1379 = _1377 + 1.0;
    float _1381 = _1345 * _592;
    bool _1383 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1385 = isnan(_1201);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = _1345 * _594;
    float _1397 = _1345 * _596;
    bool _1399 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1401 = isnan(_1201);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = _1393 * _1341;
    float _1413 = -_1393;
    float _1415 = _1413 + 1.0;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1417;
    bool _1421 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1423 = isnan(_1201);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1435 = _1201 + _1433;
    float _1437 = _1361 * _1415;
    float _1439 = -_1361;
    float _1441 = _1439 + 1.0;
    float _1443 = _1419 * _1319;
    bool _1445 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1447 = isnan(_1201);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = _1349 * _1363;
    float _1459 = -_1431;
    float _1461 = _1459 + 1.0;
    float _1463 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1465 = _1431 * _1441;
    float _1467 = fma(_1295, _1435, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1469 = _1455 * _1461;
    float _1471 = -_1455;
    float _1473 = _1471 + 1.0;
    bool _1475 = _1201 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1477 = isnan(_1201);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = fma(_1395, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1463);
    float _1489 = _1375 * _1473;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1493 = _1201 + _1491;
    float _1495 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1487);
    float _1497 = _1485 * _1379;
    float _1499 = -_1485;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1275, _1493, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1507 = _1201 + _1505;
    float _1509 = abs(_1495);
    bool _1511 = _1509 > 0.99989998340606689453125;
    float _1513 = _1409 * _1501;
    float _1515 = -_1409;
    float _1517 = _1515 + 1.0;
    float _1519 = fma(_1293, _1507, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1523 = _1201 + _1521;
    float _1525 = _1467 * _1513;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1529 = _1201 + _1527;
    float _1531 = fma(_1315, _1523, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1533 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1525);
    float _1535 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1539 = _1269 + _1537;
    float _1541 = fma(_1343, _1529, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1543 = _1293;
    float _1545 = _1517;
    float _1547 = _1463;
    float _1549 = _1333;
    float _1551 = _1269;
    float _1553 = _1535;
    float _1555 = _1381;
    float _1557 = _1539;
    if (_1511)
    {
        _1543 = 0.001000000047497451305389404296875;
    }
    float _1559 = _1543;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1535 + _1561;
    float _1565 = _1539 * _1539;
    float _1567 = 0.0;
    if (!_1511)
    {
        _1567 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1569 = _1567;
    float _1571 = fma(_1503, _1497, _1533);
    float _1573 = _1569;
    if (_1511)
    {
        float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1573 = _1575;
    }
    float _1577 = _1573;
    float _1579 = fma(_1563, _1563, _1565);
    if (!_1511)
    {
        _1545 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1581 = _1545;
    float _1583 = _1581;
    if (_1511)
    {
        float _1585 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = -_1577;
    float _1591 = _1397 * _1589;
    float _1593 = sqrt(_1579);
    if (!_1511)
    {
        _1547 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1595 = _1547;
    float _1597 = _1595;
    if (_1511)
    {
        float _1599 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = -_1587;
    float _1605 = _1381 * _1603;
    float _1607 = -_1587;
    float _1609 = -_1591;
    float _1611 = fma(_1395, _1607, _1609);
    float _1613 = fma(_1519, _1489, _1571);
    float _1615 = -_1601;
    float _1617 = _1395 * _1615;
    float _1619 = -_1601;
    float _1621 = -_1605;
    float _1623 = fma(_1397, _1619, _1621);
    float _1625 = _1611 * _1611;
    float _1627 = in.m_55.x;
    float _1629 = -_1577;
    float _1631 = -_1617;
    float _1633 = fma(_1381, _1629, _1631);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1637 = _1201 + _1635;
    float _1639 = fma(_1623, _1623, _1625);
    float _1641 = fma(_1457, _1637, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1643 = fma(_1633, _1633, _1639);
    bool _1645 = _1593 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1647 = fma(_1531, _1469, _1613);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1651 = _1201 + _1649;
    float _1653 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1655 = rsqrt(_1643);
    float _1657 = fma(_1541, _1465, _1647);
    float _1659 = fma(_1443, _1651, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1661 = fma(_1641, _1437, _1657);
    float _1663 = _1255 * _1313;
    float _1665 = _1333 * _1337;
    float _1667 = fma(_1659, _1411, _1661);
    if (!_1645)
    {
        _1549 = _1653;
    }
    float _1669 = _1549;
    bool _1671 = !_1645;
    float _1673 = _1669;
    if (!_1671)
    {
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1679 = _1593 + _1677;
        float _1681 = _1653 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = rsqrt(_1579);
        float _1685 = _1679 * _1675;
        float _1687 = _1685 * 0.15915493667125701904296875;
        float _1689 = _1687 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = _1687 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 + (-1.0);
        float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = fma(_1695, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1703 = fma(_1653, _1691, _1699);
        float _1705 = _1683 * _1701;
        float _1707 = fma(_1563, _1705, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1709 = fma(_1539, _1705, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1673 = _1703;
        _1551 = _1709;
        _1553 = _1707;
    }
    float _1711 = _1673;
    float _1713 = _1551;
    float _1715 = _1553;
    float _1717 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1667);
    float _1719 = _1663 * _1381;
    float _1721 = _1611 * _1655;
    float _1723 = _1623 * _1655;
    float _1725 = _1633 * _1655;
    float _1727 = _1663 * _1395;
    float _1729 = fma(_1283, _1721, _1719);
    float _1731 = _1397 * _1723;
    float _1733 = _1663 * _1397;
    float _1735 = _1395 * _1721;
    float _1737 = fma(_1283, _1723, _1727);
    float _1739 = -_1731;
    float _1741 = fma(_1395, _1725, _1739);
    float _1743 = _1381 * _1725;
    float _1745 = fma(_1283, _1725, _1733);
    float _1747 = -_1735;
    float _1749 = fma(_1381, _1723, _1747);
    float _1751 = _1627 * _1627;
    float _1753 = fma(_1665, _1741, _1729);
    float _1755 = -_1743;
    float _1757 = fma(_1397, _1721, _1755);
    float _1759 = fma(_1665, _1749, _1745);
    float _1761 = _1751 * _1751;
    float _1763 = _1717 * 3.0;
    float _1765 = _1753 + _1711;
    float _1767 = fma(_1665, _1757, _1737);
    float _1769 = _1759 + _1713;
    float _1771 = -_1761;
    float _1773 = fma(_1771, _1763, _1765);
    float _1775 = _1767 + _1715;
    float _1777 = _1763;
    float _1779 = _1765;
    float _1781 = _1775;
    float _1783 = _1767;
    if (_1243)
    {
        _1777 = _1769;
    }
    float _1785 = _1777;
    float _1787 = _1785;
    if (_1243)
    {
        _1779 = _1773;
    }
    float _1789 = _1779;
    float _1791 = _1789;
    if (!_1243)
    {
        float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1795 = _1711 + _1793;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1799 = _1715 + _1797;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1803 = _1795 * _1795;
        float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1807 = _1713 + _1805;
        float _1809 = fma(_1799, _1799, _1803);
        float _1811 = -_1711;
        float _1813 = _1773 + _1811;
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1817 = fma(_1807, _1807, _1809);
        float _1819 = sqrt(_1817);
        float _1821 = _1801 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1823 = precise::min(_1819, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1825 = _1823 * _1815;
        float _1827 = _1821 * _1825;
        float _1829 = fma(_1767, _1827, _1715);
        float _1831 = fma(_1813, _1827, _1711);
        float _1833 = fma(_1759, _1827, _1713);
        _1791 = _1831;
        _1781 = _1829;
        _1787 = _1833;
    }
    float _1835 = _1791;
    float _1837 = _1781;
    float _1839 = _1787;
    float _1841 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1843 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1841);
    float _1845 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1843);
    float _1847 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1849 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1847);
    bool _1853 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.5);
    bool _1861 = _1857 || _1859;
    float _1863 = 1.0 / _1849;
    float _1865 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1851);
    float _1867 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1869 = _1867 + _1849;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1861)
    {
        _1871 = 1.0;
    }
    float _1873 = _1871;
    float _1875 = _1869 * _1863;
    float _1877 = _1875 * 0.5;
    float _1879 = _1873;
    if (!_1861)
    {
        float _1881 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1885 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
        float _1887 = _1881 * 0.15915493667125701904296875;
        float _1889 = _1887 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1895 = _1893 * 0.15915493667125701904296875;
        float _1897 = _1887 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        float _1901 = 1.0 / _1891;
        float _1903 = _1895 * 6.283185482025146484375;
        float _1905 = cos(_1903);
        float _1907 = _1899 * _1901;
        float _1909 = 1.0 / _1885;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1913 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1911;
        float _1915 = _1905 * _1907;
        float _1917 = _1895 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1915;
        float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1925 = _1909 * _1923;
        float _1927 = 1.0 / _1913;
        float _1929 = _1919 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1933 = fma(_1929, _1925, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        _1783 = _1927;
        _1555 = _1887;
        _1879 = _1937;
    }
    float _1939 = _1783;
    float _1941 = _1555;
    float _1943 = _1879;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1835 + _1945;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1951 = _1837 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1955 = _1839 + _1953;
    float _1957 = _1947 * _1947;
    float _1959 = fma(_1951, _1951, _1957);
    float _1961 = fma(_1955, _1955, _1959);
    float _1963 = rsqrt(_1961);
    float _1965 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1967 = _1951 * _1965;
    float _1969 = _1955 * _1965;
    float _1971 = _1967 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 + _1973;
    float _1977 = sqrt(_1975);
    bool _1979 = _1977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = _1977 + _1981;
    float _1985 = _1955;
    float _1987 = _1975;
    float _1989 = _1983;
    float _1991 = _1939;
    float _1993 = _1967;
    if (_1979)
    {
        float _1995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1985 = _1995;
    }
    float _1997 = _1985;
    if (_1979)
    {
        float _1999 = rsqrt(_1975);
        _1987 = _1999;
    }
    float _2001 = _1987;
    float _2003 = _2001;
    if (_1979)
    {
        float _2005 = _1983 * _1997;
        _1989 = _2005;
    }
    float _2007 = _1989;
    if (_1979)
    {
        float _2009 = _2007 * 0.15915493667125701904296875;
        _1991 = _2009;
    }
    float _2011 = _1991;
    float _2013 = _1963;
    float _2015 = _2011;
    if (_1979)
    {
        float _2017 = _2011 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        _2013 = _2019;
    }
    float _2021 = _2013;
    float _2023 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2025 = precise::max(0.0, _2023);
    float _2027 = _1941;
    float _2029 = _2025;
    float _2031 = _2023;
    if (_1979)
    {
        float _2033 = _2011 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        _2027 = _2035;
    }
    float _2037 = _2027;
    float _2039 = -_1965;
    float _2041 = -_2025;
    float _2043 = fma(_1947, _2039, _2041);
    if (_1979)
    {
        float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2045;
    }
    float _2047 = _2029;
    float _2049 = sqrt(_1961);
    float _2051 = _2021;
    float _2053 = _2047;
    if (_1979)
    {
        float _2055 = fma(_2021, _2047, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2051 = _2055;
    }
    float _2057 = _2051;
    float _2059 = _2057;
    if (!_1979)
    {
        _2053 = _1969;
    }
    float _2061 = _2053;
    float _2063 = _2061;
    if (_1979)
    {
        float _2065 = _2037 + (-1.0);
        _2031 = _2065;
    }
    float _2067 = _2031;
    float _2069 = _2067;
    if (_1979)
    {
        float _2071 = _2001 * _2057;
        _1557 = _2071;
    }
    float _2073 = _1557;
    if (!_1979)
    {
        _2059 = _2043;
    }
    float _2075 = _2059;
    float _2077 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2079 = _2075;
    if (_1979)
    {
        float _2081 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2081;
    }
    float _2083 = _2015;
    if (_1979)
    {
        float _2085 = _1967 * _2073;
        _1993 = _2085;
    }
    float _2087 = _1993;
    if (!_1979)
    {
        _2003 = _1971;
    }
    float _2089 = _2003;
    float _2091 = _2089;
    if (_1979)
    {
        float _2093 = _1969 * _2073;
        _2063 = _2093;
    }
    float _2095 = _2063;
    if (_1979)
    {
        float _2097 = fma(_2043, _2037, _2083);
        _2079 = _2097;
    }
    float _2099 = _2079;
    if (_1979)
    {
        float _2101 = _2087 * _2087;
        _2091 = _2101;
    }
    float _2103 = _2091;
    if (!_1979)
    {
        _2069 = _1973;
    }
    float _2105 = _2069;
    float _2107 = _2105;
    if (_1979)
    {
        float _2109 = _2095 * _2095;
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = fma(_2099, _2099, _2103);
    float _2115 = _2113 + _2111;
    float _2117 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2121 = fma(_2049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2119);
    float _2123 = precise::clamp(_2121, 0.0, 1.0);
    float _2125 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2127 = rsqrt(_2115);
    float _2129 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2131 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2133 = -_2123;
    float _2135 = _2133 + 1.0;
    float _2137 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2139 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2129);
    float _2141 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2131);
    float _2143 = abs(_2135);
    float _2145 = log2(_2143);
    float _2147 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2137);
    float _2149 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2141);
    float _2151 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2077);
    float _2153 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2155 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2147);
    float _2157 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2159 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2151);
    float _2161 = _2127 * _2087;
    float _2163 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2165 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2167 = _2127 * _2099;
    float _2169 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2171 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2173 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2165);
    float _2175 = _2127 * _2095;
    float _2177 = -_2169;
    float _2179 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2177);
    float _2181 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2183 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2185 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2173);
    float _2187 = -_2175;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2179);
    float _2191 = -_2181;
    float _2193 = fma(_2191, _2125, 1.0);
    float _2195 = exp2(_2183);
    float _2197 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2185);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2203 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2205 = fma(_2189, 0.5, 0.5);
    float _2207 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2201);
    float _2209 = log2(_2193);
    float _2211 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2203);
    float _2213 = _2167 + 1.0;
    float _2215 = fma(_2205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2207);
    float _2219 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2221 = fma(_2205, _2215, -0.212114393711090087890625);
    float _2223 = 1.0 / _2197;
    float _2225 = -_2167;
    float _2227 = fma(_2195, _2213, _2225);
    float _2229 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2217);
    float _2231 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2219);
    float _2233 = fma(_2205, _2221, 1.570728778839111328125);
    float _2235 = fma(_2227, 0.5, 0.5);
    float _2237 = sqrt(_2199);
    float _2239 = _2209 * 0.693147182464599609375;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2243 = _2229 * _2223;
    float _2245 = _2231 * _2223;
    float _2247 = fma(_2243, 0.5, 0.5);
    float _2249 = fma(_2245, -0.5, 0.5);
    float _2251 = _2237 * 0.636619746685028076171875;
    float _2253 = -_2233;
    float _2255 = fma(_2251, _2253, 1.0);
    float3 _6135 = float3(_2247, _2249, _2241);
    float _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6135, float3(0.0), isnan(_6135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6135, float3(0.0), isnan(_6135)), level(0.0)).x;
    float3 _6146 = float3(_2247, _2249, _2241);
    float4 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6146, float3(0.0), isnan(_6146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6146, float3(0.0), isnan(_6146)), level(0.0)).xyzw;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = _2260.w;
    float2 _6163 = float2(_2255, _2235);
    float3 _2272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6163, float2(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6163, float2(0.0), isnan(_6163)), level(0.0)).xyz;
    float _2274 = _2272.x;
    float _2276 = _2272.y;
    float _2278 = _2272.z;
    float _2280 = in.m_51.y;
    float _2282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2284 = in.m_57.y;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2288 = _2286 != 0;
    float _2290 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2294 = _2292 != 0;
    float _2296 = in.m_51.w;
    float _2298 = in.m_55.w;
    out.m_59.x = _1155;
    out.m_59.y = _1161;
    out.m_59.z = _1151;
    out.m_59.w = _1157;
    float _2300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2304 = _2302 != 0;
    float _2306 = in.m_51.z;
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2310 = _2308 != 0;
    out.m_61.x = _1167;
    out.m_61.y = _1169;
    out.m_61.z = _1173;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2314 = _2312 != 0;
    float _2316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2318 = in.m_57.x;
    bool _2320 = false;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2324 = _2284;
    if (_2288)
    {
        bool _2326 = _972 > 0.5;
        _2320 = _2326;
    }
    bool _2328 = _2320;
    float _2330 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2332 = _2296 > 0.5;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2336 = _972 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2340 = fma(_2330, -2.0, _2334);
    float _2342 = -_2338;
    float _2344 = fma(_2336, 2.0, _2342);
    float _2346 = -_2284;
    float _2348 = _2346 + 1.0;
    out.m_63.w = _2298;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2356 = _2332 ? as_type<int>(_2348) : as_type<int>(_2284);
    float _2358 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2350);
    float _2360 = _2352;
    bool _2362 = _2332;
    float _2364 = _2348;
    if (!_2314)
    {
        _2322 = _2280;
    }
    float _2366 = _2322;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2370 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[79].z, _2352);
    float _2372 = _2366;
    float _2374 = _2306;
    if (!_2314)
    {
        _2360 = _2306;
    }
    float _2376 = _2360;
    float _2378 = -_122;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2344);
    float _2382 = _2376;
    if (_2314)
    {
        _2382 = _2280;
    }
    float _2384 = _2382;
    float _2386 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _2370);
    float _2388 = _2304 ? as_type<float>(_2356) : _2284;
    float _2390 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2368);
    bool _2392 = _2280 > 0.5;
    float _2394 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2354);
    if (_2314)
    {
        _2372 = _972;
    }
    float _2396 = _2372;
    float _2398 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2400 = as_type<int>(_2398);
    int _2402 = as_type<int>(_2396);
    if (_2294)
    {
        bool _2404 = _2306 > 0.5;
        _2362 = _2404;
    }
    bool _2406 = _2362;
    float _2408 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2310)
    {
        float _2410 = _2392 ? _2348 : _2284;
        _2324 = _2410;
    }
    float _2412 = _2324;
    float _2414 = _2386 * (-0.15915493667125701904296875);
    float _2416 = _2396 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2314)
    {
        _2374 = _2280;
    }
    float _2418 = _2374;
    float _2420 = fma(_2398, _2412, -0.5);
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2424 = fma(_2388, _2408, -0.5);
    float _2426 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2432 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2422);
    float _2434 = _2418;
    if (_2288)
    {
        float _2436 = -_2318;
        float _2438 = _2436 + 1.0;
        _2400 = as_type<int>(_2438);
    }
    int _2440 = _2400;
    float _2442 = fma(_2426, -2.0, _2430);
    if (!_2288)
    {
        _2364 = _2318;
    }
    float _2444 = _2364;
    float _2446 = _2444;
    if (_2294)
    {
        float _2448 = -_2318;
        float _2450 = _2448 + 1.0;
        _2402 = as_type<int>(_2450);
    }
    int _2452 = _2402;
    float _2454 = _2414 * 6.283185482025146484375;
    float _2456 = sin(_2454);
    if (_2288)
    {
        float _2458 = _2328 ? as_type<float>(_2440) : _2318;
        _2446 = _2458;
    }
    float _2460 = _2446;
    float _2462 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2358);
    float _2464 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_2294)
    {
        _2434 = _2318;
    }
    float _2468 = _2434;
    float _2470 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2340);
    float _2472 = _2468;
    if (_2294)
    {
        float _2474 = _2406 ? as_type<float>(_2452) : _2318;
        _2472 = _2474;
    }
    float _2476 = _2472;
    float _2478 = _2414 * 6.283185482025146484375;
    float _2480 = cos(_2478);
    float _2482 = -_2466;
    float _2484 = fma(_2416, 2.0, _2482);
    float _2486 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2488 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2390);
    float _2492 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2394);
    float _2494 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2442);
    float _2496 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2432);
    float _2498 = exp2(_2290);
    float _2500 = -_122;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2484);
    float _2504 = _2456 * _2420;
    float _2506 = fma(_2486, _2460, -0.5);
    float _2508 = fma(_2488, _2476, -0.5);
    float _2510 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2512 = -_2494;
    float _2514 = fma(_2492, _2424, _2512);
    bool _2516 = _1943 > 0.0;
    bool _2518 = isnan(_1943);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(0.0);
    bool _2524 = _2520 || _2522;
    float _2526 = _2480 * _2420;
    float _2528 = fma(_2496, _2508, _2502);
    float _2530 = -_2504;
    float _2532 = fma(_2480, _2506, _2530);
    float _2534 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2510);
    float _2536 = fma(_2456, _2506, _2526);
    float _2538 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2540 = fma(_2462, _2532, _2380);
    float _2542 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2534);
    float _2544 = -_2498;
    float _2546 = _2544 + 1.0;
    float _2548 = -_2470;
    float _2550 = fma(_2490, _2536, _2548);
    float _2552 = _2528 + 0.5;
    float _2554 = _2514 + 0.5;
    float _2556 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2558 = _2540 + 0.5;
    float _2560 = _2550 + 0.5;
    float _2562 = _2542 + _2197;
    float _2564 = _2538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2558;
    out.m_65.y = _2560;
    out.m_65.z = _2552;
    out.m_65.w = _2554;
    float _2566 = _2562 * 0.5;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2231;
    out.gl_Position.z = _2542;
    out.gl_Position.w = _2197;
    out.m_67.z = _2566;
    out.m_67.w = _2197;
    out.m_45.x = _2564;
    float _2568 = _2556 * _2257;
    float _2570 = -_2556;
    float _2572 = _2570 + 1.0;
    float _2574 = _2268 * _2568;
    float _2576 = _2278 * _2568;
    float _2578 = fma(_2274, _2574, _2262);
    float _2580 = fma(_2276, _2574, _2264);
    float _2582 = _2268 * _2572;
    float _2584 = fma(_2268, _2576, _2266);
    out.m_69.x = _2578;
    out.m_69.y = _2580;
    out.m_69.z = _2584;
    out.m_69.w = _2582;
    if (_2524)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

