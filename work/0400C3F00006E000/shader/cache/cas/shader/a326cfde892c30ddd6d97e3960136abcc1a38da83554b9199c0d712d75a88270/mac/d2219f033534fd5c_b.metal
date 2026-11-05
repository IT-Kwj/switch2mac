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
    bool _1876 = false;
    bool _994 = false;
    bool _828 = false;
    bool _704 = false;
    bool _466 = false;
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
        float _2562 = as_type<float>(_104);
        out.gl_Position.z = _2562;
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
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2631 = as_type<float>(_142);
        out.gl_Position.z = _2631;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = _150;
    if (!_160)
    {
        float _164 = _150 * _150;
        float _166 = _164 * 0.5;
        _124 = _166;
    }
    float _168 = _124;
    float _170 = 0.0;
    float _172 = _168;
    if (!_160)
    {
        float _174 = _122 * _122;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    if (!_160)
    {
        float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _180;
    }
    float _182 = _172;
    bool _184 = !_160;
    float _186 = 0.0;
    float _188 = _182;
    float _190 = 0.0;
    if (!_184)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _208;
        _188 = _220;
        _190 = _210;
    }
    float _222 = _186;
    float _224 = _188;
    float _226 = _190;
    bool _228 = !_160;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _162 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _162;
    float _260 = _256;
    float _262 = _254;
    if (!_160)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_160)
    {
        float _270 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_160;
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
    bool _310 = !_160;
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
    float _338 = fma(_258, _146, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _146, _334);
    float _344 = fma(_258, _144, _336);
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _144, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _148, _346);
    float _358 = fma(_258, _148, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_356;
    float _370 = _358 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_358, _366, _390);
    float _418 = _366;
    float _420 = _400;
    float _422 = _398;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (!_410)
    {
        bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _430 = !_428;
        if (!_430)
        {
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _442);
            float _450 = _444 * _444;
            float _452 = fma(_446, _446, _450);
            float _454 = fma(_448, _448, _452);
            float _456 = rsqrt(_454);
            float _458 = _456 * 9.9999999747524270787835121154785e-07;
            float _460 = _446 * _458;
            float _462 = _444 * _458;
            float _464 = _448 * _458;
            _426 = _462;
            _420 = _460;
            _422 = _464;
            _466 = true;
        }
        else
        {
            float _468 = _146 * _146;
            float _470 = fma(_144, _144, _468);
            float _472 = fma(_148, _148, _470);
            float _474 = sqrt(_472);
            bool _476 = _474 >= 9.9999999747524270787835121154785e-07;
            bool _478 = isnan(_474);
            bool _480 = _476 || _478;
            bool _482 = isnan(9.9999999747524270787835121154785e-07);
            bool _484 = _480 || _482;
            if (!_484)
            {
                float _486 = _388 * _388;
                float _488 = fma(_386, _386, _486);
                float _490 = fma(_390, _390, _488);
                float _492 = sqrt(_490);
                bool _494 = _492 >= 9.9999999747524270787835121154785e-07;
                bool _496 = isnan(_492);
                bool _498 = _494 || _496;
                bool _500 = isnan(9.9999999747524270787835121154785e-07);
                bool _502 = _498 || _500;
                if (!_502)
                {
                    float _504 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _504);
                    float _508 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _506);
                    float _510 = rsqrt(_508);
                    float _512 = _510 * 9.9999999747524270787835121154785e-07;
                    float _514 = _512 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _516 = _512 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = _512 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _426 = _516;
                    _420 = _514;
                    _422 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _426 = _550;
                    _420 = _548;
                    _422 = _552;
                    _466 = true;
                }
            }
            else
            {
                float _554 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _556 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _558 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _560 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
                float _562 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
                float _564 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
                float _570 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
                float _572 = _566 * _566;
                float _574 = fma(_568, _568, _572);
                float _576 = fma(_570, _570, _574);
                float _578 = rsqrt(_576);
                float _580 = _578 * 9.9999999747524270787835121154785e-07;
                float _582 = _568 * _580;
                float _584 = _566 * _580;
                float _586 = _570 * _580;
                _426 = _584;
                _420 = _582;
                _422 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _426;
    float _590 = _420;
    float _592 = _422;
    float _594 = in.m_53.x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _598 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _606 = _604 != 0;
    int _608 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _610 = _608 != 0;
    float _612 = _598 * _596;
    float _614 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[20].x, _612);
    float _616 = _614 * 6.283185482025146484375;
    float _618 = floor(_614);
    float _620 = _616 * 0.15915493667125701904296875;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_624);
    float _628 = _620 * 6.283185482025146484375;
    float _630 = cos(_628);
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _638 = abs(_634);
    float _640 = -_618;
    float _642 = _614 + _640;
    bool _644 = !_606;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_646);
    float _650 = -_642;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _654 = float(_626);
    float _656 = fma(_630, 0.5, 0.5);
    bool _658 = _642 < 0.5;
    float _660 = float(_658);
    float _662 = abs(_652);
    float _664 = _654 * _662;
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _670 = float(_638);
    float _672 = -_660;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _676 = float(_648);
    float _678 = fma(_670, _668, _664);
    float _680 = abs(_674);
    float _682 = fma(_676, _680, _678);
    bool _684 = !_636;
    float _686 = _592;
    float _702;
    if (!_684)
    {
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _690 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_88);
        float _708 = 1.0 / _706;
        float _710 = _122 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _716 = _712 + _714;
    bool _718 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _720 = isnan(_712);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _730;
    float _734 = 1.0 / _732;
    bool _736 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _738 = isnan(_712);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = -_728;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _756;
    bool _760 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _762;
    float _766 = _746 * _754;
    float _768 = -_746;
    float _770 = _768 + 1.0;
    float _772 = _716 * _734;
    float _774 = in.m_51.x;
    float _776 = in.m_51.y;
    float _778 = in.m_51.z;
    float _780 = fma(_750, _772, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _782 = fma(_764, _772, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _784 = fma(_758, _772, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _786 = _780 * _766;
    float _788 = _782 * _766;
    float _790 = _784 * _766;
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].x, _786);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].y, _788);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].z, _790);
    float _798 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].x, _792);
    float _800 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].y, _794);
    float _802 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].z, _796);
    float _804 = _798 * _774;
    float _806 = _800 * _776;
    float _808 = _802 * _778;
    bool _810 = !_760;
    float _826;
    if (!_810)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _814 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_88);
        float _832 = 1.0 / _830;
        float _834 = _122 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _840 = _836 + _838;
    bool _842 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _844 = isnan(_836);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _856 = _836 + _854;
    bool _858 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _860 = isnan(_836);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -_852;
    float _892 = _890 + 1.0;
    float _894 = 1.0 / _872;
    float _896 = _888 * _892;
    float _898 = -_888;
    float _900 = _898 + 1.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _902;
    bool _906 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _908 = 1.0 / _876;
    float _910 = _868 * _900;
    float _912 = -_868;
    float _914 = _912 + 1.0;
    float _916 = _840 * _894;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _922;
    float _926 = fma(_904, _916, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _928 = fma(_920, _916, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _930 = fma(_924, _916, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _932 = _856 * _908;
    float _934 = _926 * _910;
    float _936 = _928 * _910;
    float _938 = _930 * _910;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _952 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].x, _934);
    float _954 = fma(_942, _932, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _956 = fma(_946, _932, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _958 = fma(_950, _932, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _960 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].y, _936);
    float _962 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].z, _938);
    float _964 = fma(_954, _896, _952);
    float _966 = fma(_956, _896, _960);
    float _968 = fma(_958, _896, _962);
    float _970 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].x, _964);
    float _972 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].y, _966);
    float _974 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].z, _968);
    bool _976 = !_906;
    float _992;
    if (!_976)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _980 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _984 = _982 * _978;
        float _986 = floor(_984);
        float _988 = -_986;
        float _990 = _984 + _988;
        _992 = _990;
        _994 = true;
    }
    else
    {
        float _996 = float(_88);
        float _998 = 1.0 / _996;
        float _1000 = _122 * _998;
        _992 = _1000;
    }
    _994 = false;
    float _1002 = _992;
    float _1004 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1006 = _588 * _588;
    float _1008 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1012 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1004);
    float _1014 = fma(_590, _590, _1006);
    float _1016 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1018 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1010);
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _1022 = fma(_592, _592, _1014);
    float _1024 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1026 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1012);
    float _1028 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1030 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1032 = rsqrt(_1022);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1036 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1030);
    float _1038 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1042 = _1034 + _1040;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1046 = _1020 * _588;
    float _1048 = _1046 * 8.0;
    float _1050 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1054 = _1038 + _1052;
    float _1056 = _1042 * _1042;
    float _1058 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1060 = _1032 * _588;
    float _1062 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1036);
    float _1064 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1044);
    float _1066 = _1032 * _590;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _1050 + _1070;
    float _1074 = fma(_1054, _1054, _1056);
    float _1076 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1058);
    float _1078 = sqrt(_1062);
    float _1080 = _1032 * _592;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1068);
    float _1084 = fma(_1072, _1072, _1074);
    float _1086 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1076);
    float _1088 = fma(_1080, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1082);
    float _1090 = in.m_53.w;
    float _1092 = sqrt(_1086);
    float _1094 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = abs(_1088);
    bool _1100 = _1098 > 0.99989998340606689453125;
    float _1102 = in.m_53.y;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1112 = _1110 != 0;
    float _1114 = rsqrt(_1084);
    float _1116 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1064);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_55.z;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1126 = _1124 != 0;
    float _1128 = _1020 * _590;
    float _1130 = _1128 * 8.0;
    float _1132 = fma(_1078, _1078, _1116);
    float _1134 = _1020 * _592;
    float _1136 = _1134 * 8.0;
    float _1138 = sqrt(_1116);
    float _1140 = _1130 * _1130;
    float _1142 = fma(_1092, _1092, _1132);
    float _1144 = _1064;
    float _1146 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1148 = _1100;
    if (_1100)
    {
        _686 = 0.001000000047497451305389404296875;
    }
    float _1150 = _686;
    float _1152 = fma(_1136, _1136, _1140);
    float _1154 = _1042 * _1114;
    float _1156 = _1054 * _1114;
    if (!_1100)
    {
        _1144 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1158 = _1144;
    float _1160 = -_1154;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1164 = _1158;
    if (_1100)
    {
        float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1164 = _1166;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    if (!_1100)
    {
        _1170 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1172 = _1170;
    float _1174 = sqrt(_1142);
    float _1176 = _1172;
    if (!_1100)
    {
        _1146 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1178 = _1146;
    float _1180 = _1178;
    if (_1100)
    {
        float _1182 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1176 = _1182;
    }
    float _1184 = _1176;
    if (_1100)
    {
        float _1186 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1180 = _1186;
    }
    float _1188 = _1180;
    float _1190 = -_1156;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1194 = _1162 * _1162;
    float _1196 = _1072 * _1114;
    bool _1198 = _1090 > 0.5;
    float _1200 = sqrt(_1152);
    float _1202 = _1138 * 0.800000011920928955078125;
    float _1204 = fma(_1192, _1192, _1194);
    float _1206 = -_1196;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1072);
    float _1210 = -_1168;
    float _1212 = _1080 * _1210;
    bool _1214 = _1102 > 0.5;
    float _1216 = in.m_55.x;
    float _1218 = fma(_1208, _1208, _1204);
    float _1220 = abs(_1048);
    float _1222 = 1.0 / _1220;
    float _1224 = -_1188;
    float _1226 = -_1212;
    float _1228 = fma(_1066, _1224, _1226);
    float _1230 = -_1188;
    float _1232 = _1060 * _1230;
    float _1234 = -_1184;
    float _1236 = _1066 * _1234;
    float _1238 = _1174 + 9.9999997473787516355514526367188e-06;
    float _1240 = 1.0 / _1202;
    float _1242 = fma(_1096, -0.64999997615814208984375, 1.0);
    float _1244 = fma(_1200, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1246 = precise::clamp(_1244, 0.0, 1.0);
    float _1248 = -_1168;
    float _1250 = -_1236;
    float _1252 = fma(_1060, _1248, _1250);
    float _1254 = fma(_1048, _1048, _1140);
    bool _1256 = _1198;
    if (_1106)
    {
        bool _1258 = _594 > 0.5;
        _1148 = _1258;
    }
    bool _1260 = _1148;
    float _1262 = _1246 * _1246;
    float _1264 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = sqrt(_1218);
    float _1268 = -_1184;
    float _1270 = -_1232;
    float _1272 = fma(_1080, _1268, _1270);
    float _1274 = _1228 * _1228;
    float _1276 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = _1138 * (-0.4000000059604644775390625);
    float _1280 = fma(_1246, -2.0, 3.0);
    float _1282 = 1.0 / _1238;
    float _1284 = fma(_1272, _1272, _1274);
    float _1286 = _1200 * _1222;
    float _1288 = _1286 * 0.25;
    float _1290 = precise::clamp(_1288, 0.0, 1.0);
    float _1292 = _1200 * _1240;
    float _1294 = _1280 * _1262;
    float _1296 = in.m_55.y;
    float _1298 = fma(_1252, _1252, _1284);
    float _1300 = _1290 * _1290;
    float _1302 = -_1294;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1290, -2.0, 3.0);
    float _1308 = rsqrt(_1298);
    float _1310 = _1114 * _1266;
    float _1312 = fma(_1306, _1300, _1304);
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    bool _1316 = _1292 < 0.5;
    float _1318 = float(_1316);
    float _1320 = _1108 * _1310;
    float _1322 = _1282 * _1122;
    float _1324 = _1282 * _1216;
    float _1326 = _1276 * _1310;
    float _1328 = _1264 * _1310;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1322);
    float _1332 = -_1318;
    float _1334 = fma(_1332, _1314, 1.0);
    float _1336 = _1320 * _1330;
    float _1338 = fma(_1136, _1136, _1254);
    float _1340 = _1228 * _1308;
    float _1342 = _1252 * _1308;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1324);
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1296);
    float _1348 = _1272 * _1308;
    float _1350 = rsqrt(_1338);
    float _1352 = _1066 * _1340;
    float _1354 = _1326 * _1346;
    float _1356 = _1060 * _1342;
    float _1358 = _1328 * _1344;
    float _1360 = -_1352;
    float _1362 = fma(_1060, _1348, _1360);
    float _1364 = _1354 * _1060;
    float _1366 = _1354 * _1066;
    float _1368 = -_1356;
    float _1370 = fma(_1080, _1340, _1368);
    float _1372 = _1080 * _1348;
    float _1374 = _1354 * _1080;
    float _1376 = fma(_1358, _1348, _1366);
    float _1378 = fma(_1358, _1340, _1364);
    float _1380 = -_1372;
    float _1382 = fma(_1066, _1342, _1380);
    float _1384 = fma(_1358, _1342, _1374);
    float _1386 = fma(_1336, _1370, _1376);
    float _1388 = _1048 * _1350;
    float _1390 = fma(_1336, _1382, _1378);
    float _1392 = _1130 * _1350;
    float _1394 = fma(_1336, _1362, _1384);
    float _1396 = _1390 * _1388;
    float _1398 = _1136 * _1350;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1404 = fma(_1386, _1392, _1396);
    float _1406 = in.m_57.y;
    float _1408 = fma(_1394, _1398, _1404);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1418 = 1.0 / _1402;
    float _1420 = _1392 * _1408;
    float _1422 = _1398 * _1408;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1426 = _1278;
    if (_1112)
    {
        float _1428 = in.m_53.z;
        _1424 = _1428;
    }
    float _1430 = _1424;
    float _1432 = fma(_1334, 0.89999997615814208984375, 0.100000001490116119384765625);
    bool _1434 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1436 = isnan(_1002);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = -_1422;
    float _1448 = _1394 + _1446;
    float _1450 = fma(_1334, 0.5, 0.5);
    float _1452 = 1.0 / _1412;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1454;
    float _1458 = fma(_1422, _1432, _1448);
    float _1460 = -_1444;
    float _1462 = _1460 + 1.0;
    float _1464 = _1294 * _1450;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1468 = _1002 + _1466;
    float _1470 = _1050 + _1458;
    float _1472 = 1.0 / _1416;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1478 = -_1420;
    float _1480 = _1386 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1484 = _1470 + _1482;
    float _1486 = _1456 * _1418;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1488;
    float _1492 = fma(_1420, _1432, _1480);
    float _1494 = fma(_1484, _1242, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1496 = _1476 * _1452;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1500 = _1002 + _1498;
    float _1502 = _1038 + _1492;
    float _1504 = -_1406;
    float _1506 = _1504 + 1.0;
    bool _1508 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1510 = isnan(_1002);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = fma(_1486, _1500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1522 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1524 = _1502 + _1522;
    bool _1526 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1528 = isnan(_1002);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1490 * _1472;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1542 = _1494 + _1540;
    float _1544 = fma(_1524, _1242, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    int _1546 = _1198 ? as_type<int>(_1506) : as_type<int>(_1406);
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1550 = _1002 + _1548;
    float _1552 = _1406;
    float _1554 = _1506;
    float _1556 = _1544;
    float _1558 = _1494;
    if (_1112)
    {
        bool _1560 = _1430 > 0.5;
        _1256 = _1560;
    }
    bool _1562 = _1256;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1566 = _1544 + _1564;
    float _1568 = _1542 * _1542;
    float _1570 = -_1536;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1496, _1550, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1576 = _1566 * _1566;
    float _1578 = -_1518;
    float _1580 = _1578 + 1.0;
    float _1582 = _1518 * _1572;
    float _1584 = _1326 * _1296;
    float _1586 = _1576 + _1568;
    float _1588 = _1444 * _1580;
    float _1590 = _1388 * _1408;
    float _1592 = _1432 * _1584;
    float _1594 = sqrt(_1586);
    float _1596 = in.m_57.x;
    float _1598 = -_1590;
    float _1600 = _1390 + _1598;
    float _1602 = _1350 * _1592;
    bool _1604 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1606 = isnan(_1002);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1464 * _1464;
    float _1618 = fma(_1590, _1432, _1600);
    float _1620 = _1602 * _1602;
    float _1622 = _1120 ? as_type<float>(_1546) : _1406;
    float _1624 = fma(_1538, _1468, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1626 = _1034 + _1618;
    float _1628 = _1278 * _1620;
    float _1630 = _1628 * 0.5;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1634 = _1614 * _1462;
    float _1636 = -_1614;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1630, _1616, _1626);
    bool _1642 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1644 = _1520 * _1634;
    float _1646 = _1576;
    float _1648 = _1568;
    if (_1126)
    {
        float _1650 = _1214 ? _1506 : _1406;
        _1552 = _1650;
    }
    float _1652 = _1552;
    float _1654 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1656 = _1640 + _1654;
    float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1660 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1644);
    float _1662 = fma(_1656, _1242, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    int _1664 = as_type<int>(_1656);
    int _1666 = as_type<int>(_1662);
    float _1668 = _1596;
    if (!_1106)
    {
        _1426 = _1596;
    }
    float _1670 = _1426;
    float _1672 = fma(_1574, _1588, _1660);
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1676 = _1670;
    if (!_1642)
    {
        _1554 = _1662;
    }
    float _1678 = _1554;
    bool _1680 = !_1642;
    float _1682 = _1678;
    if (!_1680)
    {
        float _1684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1688 = _1594 + _1686;
        float _1690 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = rsqrt(_1586);
        float _1694 = _1688 * _1684;
        float _1696 = _1694 * 0.15915493667125701904296875;
        float _1698 = _1696 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = fma(_1700, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1708 = _1692 * _1706;
        float _1710 = _1704 + (-1.0);
        float _1712 = fma(_1566, _1708, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1714 = fma(_1542, _1708, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1716 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1720 = _1712 + _1718;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1724 = _1714 + _1722;
        float _1726 = fma(_1662, _1704, _1716);
        float _1728 = _1720 * _1720;
        float _1730 = _1724 * _1724;
        _1682 = _1726;
        _1664 = as_type<int>(_1708);
        _1646 = _1728;
        _1648 = _1730;
        _1556 = _1712;
        _1558 = _1714;
    }
    float _1732 = _1682;
    int _1734 = _1664;
    float _1736 = _1646;
    float _1738 = _1648;
    float _1740 = _1556;
    float _1742 = _1558;
    float _1744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1746 = _1734;
    float _1748 = _1740;
    if (_1106)
    {
        float _1750 = -_1596;
        float _1752 = _1750 + 1.0;
        _1746 = as_type<int>(_1752);
    }
    int _1754 = _1746;
    if (_1112)
    {
        float _1756 = -_1596;
        float _1758 = _1756 + 1.0;
        _1666 = as_type<int>(_1758);
    }
    int _1760 = _1666;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1764 = _1732 + _1762;
    float _1766 = fma(_1624, _1582, _1672);
    float _1768 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1106)
    {
        float _1770 = _1260 ? as_type<float>(_1754) : _1596;
        _1676 = _1770;
    }
    float _1772 = _1676;
    float _1774 = fma(_1764, _1764, _1736);
    if (_1112)
    {
        float _1776 = _1562 ? as_type<float>(_1760) : _1596;
        _1668 = _1776;
    }
    float _1778 = _1668;
    float _1780 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1782 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1766);
    float _1784 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1786 = _1774 + _1738;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1790 = _1780 * _1658;
    float _1792 = _1784 * _1632;
    float _1794 = _1788 * _1744;
    float _1796 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1800 = sqrt(_1786);
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1804 = _970 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1806 = _972 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1810 = _1768 * _1674;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1818 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1824 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1792;
    out.m_59.y = _1790;
    out.m_59.z = _1794;
    out.m_59.w = _1810;
    bool _1826 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1828 = isnan(_1800);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1834 = _1830 || _1832;
    out.m_61.x = _1816;
    out.m_61.y = _1818;
    out.m_61.z = _1820;
    out.m_63.x = _1812;
    out.m_63.y = _1814;
    out.m_63.z = _1822;
    out.m_63.w = _1824;
    out.m_65.x = _1328;
    out.m_65.y = _1326;
    float _1836 = _1804;
    float _1838 = _1820;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (!_1834)
    {
        _1836 = 1.0;
    }
    float _1842 = _1836;
    bool _1844 = !_1834;
    float _1846 = _1842;
    if (!_1844)
    {
        bool _1848 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1850 = isnan(_1800);
        bool _1852 = _1848 || _1850;
        bool _1854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1856 = _1852 || _1854;
        if (!_1856)
        {
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1860 = _1800 + _1858;
            float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1864 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1862;
            float _1866 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1870 = 1.0 / _1864;
            float _1872 = _1860 * _1870;
            float _1874 = fma(_1872, _1868, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1846 = _1874;
            _1876 = true;
        }
        else
        {
            bool _1878 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1880 = isnan(_1800);
            bool _1882 = _1878 || _1880;
            bool _1884 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1886 = _1882 || _1884;
            if (!_1886)
            {
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1890 = _1800 + _1888;
                float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1896 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1898 = _1896 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1900 = 1.0 / _1894;
                float _1902 = _1890 * _1900;
                float _1904 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1846 = _1904;
                _1876 = true;
            }
            else
            {
                _1846 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1876 = false;
    float _1906 = _1846;
    float _1908 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1910 = _1732 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1914 = _1740 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1918 = _1742 + _1916;
    float _1920 = fma(_1910, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1922 = fma(_1914, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1924 = fma(_1918, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1926 = -_1154;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1920);
    float _1930 = -_1156;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1922);
    float _1934 = -_1196;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1924);
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1940 = _1928 + _1938;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1944 = _1932 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1936 + _1946;
    float _1950 = _1940 * _1940;
    float _1952 = fma(_1944, _1944, _1950);
    float _1954 = fma(_1948, _1948, _1952);
    float _1956 = rsqrt(_1954);
    float _1958 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1960 = _1944 * _1958;
    float _1962 = _1948 * _1958;
    float _1964 = _1960 * _1960;
    float _1966 = _1962 * _1962;
    float _1968 = _1964 + _1966;
    float _1970 = sqrt(_1968);
    bool _1972 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1976 = _1970 + _1974;
    float _1978 = _1948;
    float _1980 = _1968;
    float _1982 = _1976;
    float _1984 = _1960;
    if (_1972)
    {
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _1986;
    }
    float _1988 = _1978;
    if (_1972)
    {
        float _1990 = rsqrt(_1968);
        _1980 = _1990;
    }
    float _1992 = _1980;
    float _1994 = _1992;
    if (_1972)
    {
        float _1996 = _1976 * _1988;
        _1982 = _1996;
    }
    float _1998 = _1982;
    if (_1972)
    {
        float _2000 = _1998 * 0.15915493667125701904296875;
        _1838 = _2000;
    }
    float _2002 = _1838;
    float _2004 = _1956;
    if (_1972)
    {
        float _2006 = _2002 * 6.283185482025146484375;
        float _2008 = sin(_2006);
        _2004 = _2008;
    }
    float _2010 = _2004;
    float _2012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2014 = precise::max(0.0, _2012);
    float _2016 = _1816;
    float _2018 = _2014;
    float _2020 = _2012;
    if (_1972)
    {
        float _2022 = _2002 * 6.283185482025146484375;
        float _2024 = cos(_2022);
        _2016 = _2024;
    }
    float _2026 = _2016;
    float _2028 = -_1958;
    float _2030 = -_2014;
    float _2032 = fma(_1940, _2028, _2030);
    if (_1972)
    {
        float _2034 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2018 = _2034;
    }
    float _2036 = _2018;
    float _2038 = sqrt(_1954);
    float _2040 = _2010;
    float _2042 = _2036;
    if (_1972)
    {
        float _2044 = fma(_2010, _2036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2040 = _2044;
    }
    float _2046 = _2040;
    float _2048 = _2046;
    if (!_1972)
    {
        _2042 = _1962;
    }
    float _2050 = _2042;
    float _2052 = _2050;
    if (_1972)
    {
        float _2054 = _2026 + (-1.0);
        _2020 = _2054;
    }
    float _2056 = _2020;
    float _2058 = _2056;
    if (_1972)
    {
        float _2060 = _1992 * _2046;
        _1748 = _2060;
    }
    float _2062 = _1748;
    if (!_1972)
    {
        _2048 = _2032;
    }
    float _2064 = _2048;
    float _2066 = _2064;
    if (_1972)
    {
        float _2068 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _2068;
    }
    float _2070 = _1840;
    if (_1972)
    {
        float _2072 = _1960 * _2062;
        _1984 = _2072;
    }
    float _2074 = _1984;
    if (!_1972)
    {
        _1994 = _1964;
    }
    float _2076 = _1994;
    float _2078 = _2076;
    if (_1972)
    {
        float _2080 = _1962 * _2062;
        _2052 = _2080;
    }
    float _2082 = _2052;
    if (_1972)
    {
        float _2084 = fma(_2032, _2026, _2070);
        _2066 = _2084;
    }
    float _2086 = _2066;
    if (_1972)
    {
        float _2088 = _2074 * _2074;
        _2078 = _2088;
    }
    float _2090 = _2078;
    if (!_1972)
    {
        _2058 = _1966;
    }
    float _2092 = _2058;
    float _2094 = _2092;
    if (_1972)
    {
        float _2096 = _2082 * _2082;
        _2094 = _2096;
    }
    float _2098 = _2094;
    float _2100 = fma(_2086, _2086, _2090);
    float _2102 = _2100 + _2098;
    float _2104 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2108 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2106);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2114 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2104);
    float _2116 = rsqrt(_2102);
    float _2118 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2120 = -_2110;
    float _2122 = _2120 + 1.0;
    float _2124 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2114);
    float _2126 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2118);
    float _2130 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2132 = abs(_2122);
    float _2134 = log2(_2132);
    float _2136 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2138 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2140 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2128);
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2144 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2136);
    float _2146 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2138);
    float _2148 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2150 = _2116 * _2074;
    float _2152 = _2116 * _2086;
    float _2154 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2158 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2160 = _2116 * _2082;
    float _2162 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2144);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2156);
    float _2166 = -_2158;
    float _2168 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2172 = -_2142;
    float _2174 = fma(_2172, _2112, 1.0);
    float _2176 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2178 = -_2160;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2182 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2164);
    float _2184 = exp2(_2170);
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2188 = fma(_2180, -0.5, 0.5);
    float _2190 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2182);
    float _2192 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2194 = fma(_2180, 0.5, 0.5);
    float _2196 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2186);
    float _2198 = _2152 + 1.0;
    float _2200 = log2(_2174);
    float _2202 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2192);
    float _2204 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2196);
    float _2206 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2202);
    float _2208 = 1.0 / _2190;
    float _2210 = -_2152;
    float _2212 = fma(_2184, _2198, _2210);
    float _2214 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2206);
    float _2216 = fma(_2194, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2218 = fma(_2212, 0.5, 0.5);
    float _2220 = sqrt(_2188);
    float _2222 = fma(_2194, _2216, -0.212114393711090087890625);
    float _2224 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2204);
    float _2226 = _2200 * 0.693147182464599609375;
    float _2228 = fma(_2194, _2222, 1.570728778839111328125);
    float _2230 = _2224 * _2208;
    float _2232 = _2214 * _2208;
    float _2234 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2236 = fma(_2230, 0.5, 0.5);
    float _2238 = fma(_2232, -0.5, 0.5);
    float _2240 = _2220 * 0.636619746685028076171875;
    float _2242 = -_2228;
    float _2244 = fma(_2240, _2242, 1.0);
    float3 _6067 = float3(_2236, _2238, _2234);
    float _2246 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6067, float3(0.0), isnan(_6067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6067, float3(0.0), isnan(_6067)), level(0.0)).x;
    float3 _6078 = float3(_2236, _2238, _2234);
    float4 _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6078, float3(0.0), isnan(_6078)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6078, float3(0.0), isnan(_6078)), level(0.0)).xyzw;
    float _2251 = _2249.x;
    float _2253 = _2249.y;
    float _2255 = _2249.z;
    float _2257 = _2249.w;
    float2 _6095 = float2(_2244, _2218);
    float3 _2261 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).xyz;
    float _2263 = _2261.x;
    float _2265 = _2261.y;
    float _2267 = _2261.z;
    float _2269 = -_1154;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _2273 = -_1156;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _2277 = -_1196;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1050);
    float _2281 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2283 = _2271 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2285 = _2271 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2287 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2281);
    float _2289 = fma(_2275, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2283);
    float _2291 = fma(_2275, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2285);
    float _2293 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2289);
    float _2295 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2291);
    float _2297 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2299 = _2295 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2301 = 1.0 / _2297;
    float _2303 = _2299 + _2297;
    float _2305 = _2303 * _2301;
    float _2307 = _2305 * 0.5;
    float _2309 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2309);
    bool _2313 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan(0.5);
    bool _2321 = _2317 || _2319;
    float _2323 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2325 = 1.0 / _2311;
    float _2327 = exp2(_2323);
    float _2329 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2331 = _2307;
    if (_2321)
    {
        _2329 = 1.0;
    }
    float _2333 = _2329;
    float _2335 = _2333;
    if (_2321)
    {
        _2331 = 1.0;
    }
    float _2337 = _2331;
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2341 = _2325 * _2339;
    float _2343 = _2337;
    if (!_2321)
    {
        float _2345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2347 = _2345 * 0.15915493667125701904296875;
        float _2349 = _2347 * 6.283185482025146484375;
        float _2351 = cos(_2349);
        float _2353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2355 = _2353 * 0.15915493667125701904296875;
        float _2357 = _2347 * 6.283185482025146484375;
        float _2359 = sin(_2357);
        float _2361 = 1.0 / _2351;
        float _2363 = _2355 * 6.283185482025146484375;
        float _2365 = cos(_2363);
        float _2367 = _2359 * _2361;
        float _2369 = _2355 * 6.283185482025146484375;
        float _2371 = sin(_2369);
        float _2373 = _2365 * _2367;
        float _2375 = 1.0 / _2373;
        float _2377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2377;
        float _2381 = 1.0 / _2379;
        float _2383 = _2371 * _2375;
        float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2387 = fma(_2341, _2383, _2385);
        float _2389 = _2387 * _2381;
        float _2391 = precise::clamp(_2389, 0.0, 1.0);
        _2335 = _2391;
    }
    float _2393 = _2335;
    if (!_2321)
    {
        float _2395 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2397 = _2395 * 0.15915493667125701904296875;
        float _2399 = _2397 * 6.283185482025146484375;
        float _2401 = cos(_2399);
        float _2403 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2405 = _2403 * 0.15915493667125701904296875;
        float _2407 = _2397 * 6.283185482025146484375;
        float _2409 = sin(_2407);
        float _2411 = 1.0 / _2401;
        float _2413 = _2405 * 6.283185482025146484375;
        float _2415 = cos(_2413);
        float _2417 = _2409 * _2411;
        float _2419 = _2405 * 6.283185482025146484375;
        float _2421 = sin(_2419);
        float _2423 = _2415 * _2417;
        float _2425 = 1.0 / _2423;
        float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2429 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2427;
        float _2431 = 1.0 / _2429;
        float _2433 = _2421 * _2425;
        float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2437 = fma(_2341, _2433, _2435);
        float _2439 = _2437 * _2431;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        float _2443 = -_2441;
        float _2445 = _2443 + 1.0;
        _2343 = _2445;
    }
    float _2447 = _2343;
    float _2449 = _2393 * _2447;
    float _2451 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2287);
    float _2453 = -_2327;
    float _2455 = _2453 + 1.0;
    bool _2457 = _2393 > 0.0;
    bool _2459 = isnan(_2393);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan(0.0);
    bool _2465 = _2461 || _2463;
    float _2467 = _2449 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2469 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2451);
    float _2471 = _682 * _2467;
    float _2473 = _2469 + _2190;
    bool _2475 = _2447 <= 0.0;
    bool _2477 = !_2465;
    bool _2479 = _2475 || _2477;
    out.gl_Position.x = _2224;
    out.gl_Position.y = _2214;
    out.gl_Position.z = _2469;
    out.gl_Position.w = _2190;
    float _2481 = _2471 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2485 = _2473 * 0.5;
    float _2487 = _2483 * _2246;
    float _2489 = -_2483;
    float _2491 = _2489 + 1.0;
    out.m_47.x = _2481;
    float _2493 = _2257 * _2487;
    float _2495 = _2267 * _2487;
    float _2497 = _2257 * _2491;
    out.m_67.z = _2485;
    out.m_67.w = _2190;
    float _2499 = fma(_2263, _2493, _2251);
    float _2501 = fma(_2265, _2493, _2253);
    float _2503 = fma(_2257, _2495, _2255);
    out.m_69.x = _2499;
    out.m_69.y = _2501;
    out.m_69.z = _2503;
    out.m_69.w = _2497;
    if (!_2479)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2505 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2505;
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
    bool _1876 = false;
    bool _994 = false;
    bool _828 = false;
    bool _704 = false;
    bool _466 = false;
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
        float _2562 = as_type<float>(_104);
        out.gl_Position.z = _2562;
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
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2631 = as_type<float>(_142);
        out.gl_Position.z = _2631;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = _150;
    if (!_160)
    {
        float _164 = _150 * _150;
        float _166 = _164 * 0.5;
        _124 = _166;
    }
    float _168 = _124;
    float _170 = 0.0;
    float _172 = _168;
    if (!_160)
    {
        float _174 = _122 * _122;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    if (!_160)
    {
        float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _180;
    }
    float _182 = _172;
    bool _184 = !_160;
    float _186 = 0.0;
    float _188 = _182;
    float _190 = 0.0;
    if (!_184)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _208;
        _188 = _220;
        _190 = _210;
    }
    float _222 = _186;
    float _224 = _188;
    float _226 = _190;
    bool _228 = !_160;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _162 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _162;
    float _260 = _256;
    float _262 = _254;
    if (!_160)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_160)
    {
        float _270 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_160;
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
    bool _310 = !_160;
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
    float _338 = fma(_258, _146, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _146, _334);
    float _344 = fma(_258, _144, _336);
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _144, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _148, _346);
    float _358 = fma(_258, _148, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_356;
    float _370 = _358 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_358, _366, _390);
    float _418 = _366;
    float _420 = _400;
    float _422 = _398;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (!_410)
    {
        bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _430 = !_428;
        if (!_430)
        {
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _442);
            float _450 = _444 * _444;
            float _452 = fma(_446, _446, _450);
            float _454 = fma(_448, _448, _452);
            float _456 = rsqrt(_454);
            float _458 = _456 * 9.9999999747524270787835121154785e-07;
            float _460 = _446 * _458;
            float _462 = _444 * _458;
            float _464 = _448 * _458;
            _426 = _462;
            _420 = _460;
            _422 = _464;
            _466 = true;
        }
        else
        {
            float _468 = _146 * _146;
            float _470 = fma(_144, _144, _468);
            float _472 = fma(_148, _148, _470);
            float _474 = sqrt(_472);
            bool _476 = _474 >= 9.9999999747524270787835121154785e-07;
            bool _478 = isnan(_474);
            bool _480 = _476 || _478;
            bool _482 = isnan(9.9999999747524270787835121154785e-07);
            bool _484 = _480 || _482;
            if (!_484)
            {
                float _486 = _388 * _388;
                float _488 = fma(_386, _386, _486);
                float _490 = fma(_390, _390, _488);
                float _492 = sqrt(_490);
                bool _494 = _492 >= 9.9999999747524270787835121154785e-07;
                bool _496 = isnan(_492);
                bool _498 = _494 || _496;
                bool _500 = isnan(9.9999999747524270787835121154785e-07);
                bool _502 = _498 || _500;
                if (!_502)
                {
                    float _504 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _504);
                    float _508 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _506);
                    float _510 = rsqrt(_508);
                    float _512 = _510 * 9.9999999747524270787835121154785e-07;
                    float _514 = _512 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _516 = _512 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = _512 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _426 = _516;
                    _420 = _514;
                    _422 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _426 = _550;
                    _420 = _548;
                    _422 = _552;
                    _466 = true;
                }
            }
            else
            {
                float _554 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _556 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _558 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _560 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
                float _562 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
                float _564 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
                float _570 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
                float _572 = _566 * _566;
                float _574 = fma(_568, _568, _572);
                float _576 = fma(_570, _570, _574);
                float _578 = rsqrt(_576);
                float _580 = _578 * 9.9999999747524270787835121154785e-07;
                float _582 = _568 * _580;
                float _584 = _566 * _580;
                float _586 = _570 * _580;
                _426 = _584;
                _420 = _582;
                _422 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _426;
    float _590 = _420;
    float _592 = _422;
    float _594 = in.m_53.x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _598 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _606 = _604 != 0;
    int _608 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _610 = _608 != 0;
    float _612 = _598 * _596;
    float _614 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[20].x, _612);
    float _616 = _614 * 6.283185482025146484375;
    float _618 = floor(_614);
    float _620 = _616 * 0.15915493667125701904296875;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_624);
    float _628 = _620 * 6.283185482025146484375;
    float _630 = cos(_628);
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _638 = abs(_634);
    float _640 = -_618;
    float _642 = _614 + _640;
    bool _644 = !_606;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_646);
    float _650 = -_642;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _654 = float(_626);
    float _656 = fma(_630, 0.5, 0.5);
    bool _658 = _642 < 0.5;
    float _660 = float(_658);
    float _662 = abs(_652);
    float _664 = _654 * _662;
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _670 = float(_638);
    float _672 = -_660;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _676 = float(_648);
    float _678 = fma(_670, _668, _664);
    float _680 = abs(_674);
    float _682 = fma(_676, _680, _678);
    bool _684 = !_636;
    float _686 = _592;
    float _702;
    if (!_684)
    {
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _690 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_88);
        float _708 = 1.0 / _706;
        float _710 = _122 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _716 = _712 + _714;
    bool _718 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _720 = isnan(_712);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _730;
    float _734 = 1.0 / _732;
    bool _736 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _738 = isnan(_712);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = -_728;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _756;
    bool _760 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _762;
    float _766 = _746 * _754;
    float _768 = -_746;
    float _770 = _768 + 1.0;
    float _772 = _716 * _734;
    float _774 = in.m_51.x;
    float _776 = in.m_51.y;
    float _778 = in.m_51.z;
    float _780 = fma(_750, _772, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _782 = fma(_764, _772, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _784 = fma(_758, _772, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _786 = _780 * _766;
    float _788 = _782 * _766;
    float _790 = _784 * _766;
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].x, _786);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].y, _788);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].z, _790);
    float _798 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].x, _792);
    float _800 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].y, _794);
    float _802 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].z, _796);
    float _804 = _798 * _774;
    float _806 = _800 * _776;
    float _808 = _802 * _778;
    bool _810 = !_760;
    float _826;
    if (!_810)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _814 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_88);
        float _832 = 1.0 / _830;
        float _834 = _122 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _840 = _836 + _838;
    bool _842 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _844 = isnan(_836);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _856 = _836 + _854;
    bool _858 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _860 = isnan(_836);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -_852;
    float _892 = _890 + 1.0;
    float _894 = 1.0 / _872;
    float _896 = _888 * _892;
    float _898 = -_888;
    float _900 = _898 + 1.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _902;
    bool _906 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _908 = 1.0 / _876;
    float _910 = _868 * _900;
    float _912 = -_868;
    float _914 = _912 + 1.0;
    float _916 = _840 * _894;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _922;
    float _926 = fma(_904, _916, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _928 = fma(_920, _916, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _930 = fma(_924, _916, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _932 = _856 * _908;
    float _934 = _926 * _910;
    float _936 = _928 * _910;
    float _938 = _930 * _910;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _952 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].x, _934);
    float _954 = fma(_942, _932, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _956 = fma(_946, _932, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _958 = fma(_950, _932, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _960 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].y, _936);
    float _962 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].z, _938);
    float _964 = fma(_954, _896, _952);
    float _966 = fma(_956, _896, _960);
    float _968 = fma(_958, _896, _962);
    float _970 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].x, _964);
    float _972 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].y, _966);
    float _974 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].z, _968);
    bool _976 = !_906;
    float _992;
    if (!_976)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _980 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _984 = _982 * _978;
        float _986 = floor(_984);
        float _988 = -_986;
        float _990 = _984 + _988;
        _992 = _990;
        _994 = true;
    }
    else
    {
        float _996 = float(_88);
        float _998 = 1.0 / _996;
        float _1000 = _122 * _998;
        _992 = _1000;
    }
    _994 = false;
    float _1002 = _992;
    float _1004 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1006 = _588 * _588;
    float _1008 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1012 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1004);
    float _1014 = fma(_590, _590, _1006);
    float _1016 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1018 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1010);
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _1022 = fma(_592, _592, _1014);
    float _1024 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1026 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1012);
    float _1028 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1030 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1032 = rsqrt(_1022);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1036 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1030);
    float _1038 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1042 = _1034 + _1040;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1046 = _1020 * _588;
    float _1048 = _1046 * 8.0;
    float _1050 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1054 = _1038 + _1052;
    float _1056 = _1042 * _1042;
    float _1058 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1060 = _1032 * _588;
    float _1062 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1036);
    float _1064 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1044);
    float _1066 = _1032 * _590;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _1050 + _1070;
    float _1074 = fma(_1054, _1054, _1056);
    float _1076 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1058);
    float _1078 = sqrt(_1062);
    float _1080 = _1032 * _592;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1068);
    float _1084 = fma(_1072, _1072, _1074);
    float _1086 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1076);
    float _1088 = fma(_1080, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1082);
    float _1090 = in.m_53.w;
    float _1092 = sqrt(_1086);
    float _1094 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = abs(_1088);
    bool _1100 = _1098 > 0.99989998340606689453125;
    float _1102 = in.m_53.y;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1112 = _1110 != 0;
    float _1114 = rsqrt(_1084);
    float _1116 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1064);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_55.z;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1126 = _1124 != 0;
    float _1128 = _1020 * _590;
    float _1130 = _1128 * 8.0;
    float _1132 = fma(_1078, _1078, _1116);
    float _1134 = _1020 * _592;
    float _1136 = _1134 * 8.0;
    float _1138 = sqrt(_1116);
    float _1140 = _1130 * _1130;
    float _1142 = fma(_1092, _1092, _1132);
    float _1144 = _1064;
    float _1146 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1148 = _1100;
    if (_1100)
    {
        _686 = 0.001000000047497451305389404296875;
    }
    float _1150 = _686;
    float _1152 = fma(_1136, _1136, _1140);
    float _1154 = _1042 * _1114;
    float _1156 = _1054 * _1114;
    if (!_1100)
    {
        _1144 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1158 = _1144;
    float _1160 = -_1154;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1164 = _1158;
    if (_1100)
    {
        float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1164 = _1166;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    if (!_1100)
    {
        _1170 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1172 = _1170;
    float _1174 = sqrt(_1142);
    float _1176 = _1172;
    if (!_1100)
    {
        _1146 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1178 = _1146;
    float _1180 = _1178;
    if (_1100)
    {
        float _1182 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1176 = _1182;
    }
    float _1184 = _1176;
    if (_1100)
    {
        float _1186 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1180 = _1186;
    }
    float _1188 = _1180;
    float _1190 = -_1156;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1194 = _1162 * _1162;
    float _1196 = _1072 * _1114;
    bool _1198 = _1090 > 0.5;
    float _1200 = sqrt(_1152);
    float _1202 = _1138 * 0.800000011920928955078125;
    float _1204 = fma(_1192, _1192, _1194);
    float _1206 = -_1196;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1072);
    float _1210 = -_1168;
    float _1212 = _1080 * _1210;
    bool _1214 = _1102 > 0.5;
    float _1216 = in.m_55.x;
    float _1218 = fma(_1208, _1208, _1204);
    float _1220 = abs(_1048);
    float _1222 = 1.0 / _1220;
    float _1224 = -_1188;
    float _1226 = -_1212;
    float _1228 = fma(_1066, _1224, _1226);
    float _1230 = -_1188;
    float _1232 = _1060 * _1230;
    float _1234 = -_1184;
    float _1236 = _1066 * _1234;
    float _1238 = _1174 + 9.9999997473787516355514526367188e-06;
    float _1240 = 1.0 / _1202;
    float _1242 = fma(_1096, -0.64999997615814208984375, 1.0);
    float _1244 = fma(_1200, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1246 = precise::clamp(_1244, 0.0, 1.0);
    float _1248 = -_1168;
    float _1250 = -_1236;
    float _1252 = fma(_1060, _1248, _1250);
    float _1254 = fma(_1048, _1048, _1140);
    bool _1256 = _1198;
    if (_1106)
    {
        bool _1258 = _594 > 0.5;
        _1148 = _1258;
    }
    bool _1260 = _1148;
    float _1262 = _1246 * _1246;
    float _1264 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = sqrt(_1218);
    float _1268 = -_1184;
    float _1270 = -_1232;
    float _1272 = fma(_1080, _1268, _1270);
    float _1274 = _1228 * _1228;
    float _1276 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = _1138 * (-0.4000000059604644775390625);
    float _1280 = fma(_1246, -2.0, 3.0);
    float _1282 = 1.0 / _1238;
    float _1284 = fma(_1272, _1272, _1274);
    float _1286 = _1200 * _1222;
    float _1288 = _1286 * 0.25;
    float _1290 = precise::clamp(_1288, 0.0, 1.0);
    float _1292 = _1200 * _1240;
    float _1294 = _1280 * _1262;
    float _1296 = in.m_55.y;
    float _1298 = fma(_1252, _1252, _1284);
    float _1300 = _1290 * _1290;
    float _1302 = -_1294;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1290, -2.0, 3.0);
    float _1308 = rsqrt(_1298);
    float _1310 = _1114 * _1266;
    float _1312 = fma(_1306, _1300, _1304);
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    bool _1316 = _1292 < 0.5;
    float _1318 = float(_1316);
    float _1320 = _1108 * _1310;
    float _1322 = _1282 * _1122;
    float _1324 = _1282 * _1216;
    float _1326 = _1276 * _1310;
    float _1328 = _1264 * _1310;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1322);
    float _1332 = -_1318;
    float _1334 = fma(_1332, _1314, 1.0);
    float _1336 = _1320 * _1330;
    float _1338 = fma(_1136, _1136, _1254);
    float _1340 = _1228 * _1308;
    float _1342 = _1252 * _1308;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1324);
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1296);
    float _1348 = _1272 * _1308;
    float _1350 = rsqrt(_1338);
    float _1352 = _1066 * _1340;
    float _1354 = _1326 * _1346;
    float _1356 = _1060 * _1342;
    float _1358 = _1328 * _1344;
    float _1360 = -_1352;
    float _1362 = fma(_1060, _1348, _1360);
    float _1364 = _1354 * _1060;
    float _1366 = _1354 * _1066;
    float _1368 = -_1356;
    float _1370 = fma(_1080, _1340, _1368);
    float _1372 = _1080 * _1348;
    float _1374 = _1354 * _1080;
    float _1376 = fma(_1358, _1348, _1366);
    float _1378 = fma(_1358, _1340, _1364);
    float _1380 = -_1372;
    float _1382 = fma(_1066, _1342, _1380);
    float _1384 = fma(_1358, _1342, _1374);
    float _1386 = fma(_1336, _1370, _1376);
    float _1388 = _1048 * _1350;
    float _1390 = fma(_1336, _1382, _1378);
    float _1392 = _1130 * _1350;
    float _1394 = fma(_1336, _1362, _1384);
    float _1396 = _1390 * _1388;
    float _1398 = _1136 * _1350;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1404 = fma(_1386, _1392, _1396);
    float _1406 = in.m_57.y;
    float _1408 = fma(_1394, _1398, _1404);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1418 = 1.0 / _1402;
    float _1420 = _1392 * _1408;
    float _1422 = _1398 * _1408;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1426 = _1278;
    if (_1112)
    {
        float _1428 = in.m_53.z;
        _1424 = _1428;
    }
    float _1430 = _1424;
    float _1432 = fma(_1334, 0.89999997615814208984375, 0.100000001490116119384765625);
    bool _1434 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1436 = isnan(_1002);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = -_1422;
    float _1448 = _1394 + _1446;
    float _1450 = fma(_1334, 0.5, 0.5);
    float _1452 = 1.0 / _1412;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1454;
    float _1458 = fma(_1422, _1432, _1448);
    float _1460 = -_1444;
    float _1462 = _1460 + 1.0;
    float _1464 = _1294 * _1450;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1468 = _1002 + _1466;
    float _1470 = _1050 + _1458;
    float _1472 = 1.0 / _1416;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1478 = -_1420;
    float _1480 = _1386 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1484 = _1470 + _1482;
    float _1486 = _1456 * _1418;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1488;
    float _1492 = fma(_1420, _1432, _1480);
    float _1494 = fma(_1484, _1242, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1496 = _1476 * _1452;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1500 = _1002 + _1498;
    float _1502 = _1038 + _1492;
    float _1504 = -_1406;
    float _1506 = _1504 + 1.0;
    bool _1508 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1510 = isnan(_1002);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = fma(_1486, _1500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1522 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1524 = _1502 + _1522;
    bool _1526 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1528 = isnan(_1002);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1490 * _1472;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1542 = _1494 + _1540;
    float _1544 = fma(_1524, _1242, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    int _1546 = _1198 ? as_type<int>(_1506) : as_type<int>(_1406);
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1550 = _1002 + _1548;
    float _1552 = _1406;
    float _1554 = _1506;
    float _1556 = _1544;
    float _1558 = _1494;
    if (_1112)
    {
        bool _1560 = _1430 > 0.5;
        _1256 = _1560;
    }
    bool _1562 = _1256;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1566 = _1544 + _1564;
    float _1568 = _1542 * _1542;
    float _1570 = -_1536;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1496, _1550, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1576 = _1566 * _1566;
    float _1578 = -_1518;
    float _1580 = _1578 + 1.0;
    float _1582 = _1518 * _1572;
    float _1584 = _1326 * _1296;
    float _1586 = _1576 + _1568;
    float _1588 = _1444 * _1580;
    float _1590 = _1388 * _1408;
    float _1592 = _1432 * _1584;
    float _1594 = sqrt(_1586);
    float _1596 = in.m_57.x;
    float _1598 = -_1590;
    float _1600 = _1390 + _1598;
    float _1602 = _1350 * _1592;
    bool _1604 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1606 = isnan(_1002);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1464 * _1464;
    float _1618 = fma(_1590, _1432, _1600);
    float _1620 = _1602 * _1602;
    float _1622 = _1120 ? as_type<float>(_1546) : _1406;
    float _1624 = fma(_1538, _1468, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1626 = _1034 + _1618;
    float _1628 = _1278 * _1620;
    float _1630 = _1628 * 0.5;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1634 = _1614 * _1462;
    float _1636 = -_1614;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1630, _1616, _1626);
    bool _1642 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1644 = _1520 * _1634;
    float _1646 = _1576;
    float _1648 = _1568;
    if (_1126)
    {
        float _1650 = _1214 ? _1506 : _1406;
        _1552 = _1650;
    }
    float _1652 = _1552;
    float _1654 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1656 = _1640 + _1654;
    float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1660 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1644);
    float _1662 = fma(_1656, _1242, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    int _1664 = as_type<int>(_1656);
    int _1666 = as_type<int>(_1662);
    float _1668 = _1596;
    if (!_1106)
    {
        _1426 = _1596;
    }
    float _1670 = _1426;
    float _1672 = fma(_1574, _1588, _1660);
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1676 = _1670;
    if (!_1642)
    {
        _1554 = _1662;
    }
    float _1678 = _1554;
    bool _1680 = !_1642;
    float _1682 = _1678;
    if (!_1680)
    {
        float _1684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1688 = _1594 + _1686;
        float _1690 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = rsqrt(_1586);
        float _1694 = _1688 * _1684;
        float _1696 = _1694 * 0.15915493667125701904296875;
        float _1698 = _1696 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = fma(_1700, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1708 = _1692 * _1706;
        float _1710 = _1704 + (-1.0);
        float _1712 = fma(_1566, _1708, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1714 = fma(_1542, _1708, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1716 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1720 = _1712 + _1718;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1724 = _1714 + _1722;
        float _1726 = fma(_1662, _1704, _1716);
        float _1728 = _1720 * _1720;
        float _1730 = _1724 * _1724;
        _1682 = _1726;
        _1664 = as_type<int>(_1708);
        _1646 = _1728;
        _1648 = _1730;
        _1556 = _1712;
        _1558 = _1714;
    }
    float _1732 = _1682;
    int _1734 = _1664;
    float _1736 = _1646;
    float _1738 = _1648;
    float _1740 = _1556;
    float _1742 = _1558;
    float _1744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1746 = _1734;
    float _1748 = _1740;
    if (_1106)
    {
        float _1750 = -_1596;
        float _1752 = _1750 + 1.0;
        _1746 = as_type<int>(_1752);
    }
    int _1754 = _1746;
    if (_1112)
    {
        float _1756 = -_1596;
        float _1758 = _1756 + 1.0;
        _1666 = as_type<int>(_1758);
    }
    int _1760 = _1666;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1764 = _1732 + _1762;
    float _1766 = fma(_1624, _1582, _1672);
    float _1768 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1106)
    {
        float _1770 = _1260 ? as_type<float>(_1754) : _1596;
        _1676 = _1770;
    }
    float _1772 = _1676;
    float _1774 = fma(_1764, _1764, _1736);
    if (_1112)
    {
        float _1776 = _1562 ? as_type<float>(_1760) : _1596;
        _1668 = _1776;
    }
    float _1778 = _1668;
    float _1780 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1782 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1766);
    float _1784 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1786 = _1774 + _1738;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1790 = _1780 * _1658;
    float _1792 = _1784 * _1632;
    float _1794 = _1788 * _1744;
    float _1796 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1800 = sqrt(_1786);
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1804 = _970 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1806 = _972 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1810 = _1768 * _1674;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1818 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1824 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1792;
    out.m_59.y = _1790;
    out.m_59.z = _1794;
    out.m_59.w = _1810;
    bool _1826 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1828 = isnan(_1800);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1834 = _1830 || _1832;
    out.m_61.x = _1816;
    out.m_61.y = _1818;
    out.m_61.z = _1820;
    out.m_63.x = _1812;
    out.m_63.y = _1814;
    out.m_63.z = _1822;
    out.m_63.w = _1824;
    out.m_65.x = _1328;
    out.m_65.y = _1326;
    float _1836 = _1804;
    float _1838 = _1820;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (!_1834)
    {
        _1836 = 1.0;
    }
    float _1842 = _1836;
    bool _1844 = !_1834;
    float _1846 = _1842;
    if (!_1844)
    {
        bool _1848 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1850 = isnan(_1800);
        bool _1852 = _1848 || _1850;
        bool _1854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1856 = _1852 || _1854;
        if (!_1856)
        {
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1860 = _1800 + _1858;
            float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1864 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1862;
            float _1866 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1870 = 1.0 / _1864;
            float _1872 = _1860 * _1870;
            float _1874 = fma(_1872, _1868, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1846 = _1874;
            _1876 = true;
        }
        else
        {
            bool _1878 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1880 = isnan(_1800);
            bool _1882 = _1878 || _1880;
            bool _1884 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1886 = _1882 || _1884;
            if (!_1886)
            {
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1890 = _1800 + _1888;
                float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1896 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1898 = _1896 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1900 = 1.0 / _1894;
                float _1902 = _1890 * _1900;
                float _1904 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1846 = _1904;
                _1876 = true;
            }
            else
            {
                _1846 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1876 = false;
    float _1906 = _1846;
    float _1908 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1910 = _1732 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1914 = _1740 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1918 = _1742 + _1916;
    float _1920 = fma(_1910, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1922 = fma(_1914, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1924 = fma(_1918, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1926 = -_1154;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1920);
    float _1930 = -_1156;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1922);
    float _1934 = -_1196;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1924);
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1940 = _1928 + _1938;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1944 = _1932 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1936 + _1946;
    float _1950 = _1940 * _1940;
    float _1952 = fma(_1944, _1944, _1950);
    float _1954 = fma(_1948, _1948, _1952);
    float _1956 = rsqrt(_1954);
    float _1958 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1960 = _1944 * _1958;
    float _1962 = _1948 * _1958;
    float _1964 = _1960 * _1960;
    float _1966 = _1962 * _1962;
    float _1968 = _1964 + _1966;
    float _1970 = sqrt(_1968);
    bool _1972 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1976 = _1970 + _1974;
    float _1978 = _1948;
    float _1980 = _1968;
    float _1982 = _1976;
    float _1984 = _1960;
    if (_1972)
    {
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _1986;
    }
    float _1988 = _1978;
    if (_1972)
    {
        float _1990 = rsqrt(_1968);
        _1980 = _1990;
    }
    float _1992 = _1980;
    float _1994 = _1992;
    if (_1972)
    {
        float _1996 = _1976 * _1988;
        _1982 = _1996;
    }
    float _1998 = _1982;
    if (_1972)
    {
        float _2000 = _1998 * 0.15915493667125701904296875;
        _1838 = _2000;
    }
    float _2002 = _1838;
    float _2004 = _1956;
    if (_1972)
    {
        float _2006 = _2002 * 6.283185482025146484375;
        float _2008 = sin(_2006);
        _2004 = _2008;
    }
    float _2010 = _2004;
    float _2012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2014 = precise::max(0.0, _2012);
    float _2016 = _1816;
    float _2018 = _2014;
    float _2020 = _2012;
    if (_1972)
    {
        float _2022 = _2002 * 6.283185482025146484375;
        float _2024 = cos(_2022);
        _2016 = _2024;
    }
    float _2026 = _2016;
    float _2028 = -_1958;
    float _2030 = -_2014;
    float _2032 = fma(_1940, _2028, _2030);
    if (_1972)
    {
        float _2034 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2018 = _2034;
    }
    float _2036 = _2018;
    float _2038 = sqrt(_1954);
    float _2040 = _2010;
    float _2042 = _2036;
    if (_1972)
    {
        float _2044 = fma(_2010, _2036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2040 = _2044;
    }
    float _2046 = _2040;
    float _2048 = _2046;
    if (!_1972)
    {
        _2042 = _1962;
    }
    float _2050 = _2042;
    float _2052 = _2050;
    if (_1972)
    {
        float _2054 = _2026 + (-1.0);
        _2020 = _2054;
    }
    float _2056 = _2020;
    float _2058 = _2056;
    if (_1972)
    {
        float _2060 = _1992 * _2046;
        _1748 = _2060;
    }
    float _2062 = _1748;
    if (!_1972)
    {
        _2048 = _2032;
    }
    float _2064 = _2048;
    float _2066 = _2064;
    if (_1972)
    {
        float _2068 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _2068;
    }
    float _2070 = _1840;
    if (_1972)
    {
        float _2072 = _1960 * _2062;
        _1984 = _2072;
    }
    float _2074 = _1984;
    if (!_1972)
    {
        _1994 = _1964;
    }
    float _2076 = _1994;
    float _2078 = _2076;
    if (_1972)
    {
        float _2080 = _1962 * _2062;
        _2052 = _2080;
    }
    float _2082 = _2052;
    if (_1972)
    {
        float _2084 = fma(_2032, _2026, _2070);
        _2066 = _2084;
    }
    float _2086 = _2066;
    if (_1972)
    {
        float _2088 = _2074 * _2074;
        _2078 = _2088;
    }
    float _2090 = _2078;
    if (!_1972)
    {
        _2058 = _1966;
    }
    float _2092 = _2058;
    float _2094 = _2092;
    if (_1972)
    {
        float _2096 = _2082 * _2082;
        _2094 = _2096;
    }
    float _2098 = _2094;
    float _2100 = fma(_2086, _2086, _2090);
    float _2102 = _2100 + _2098;
    float _2104 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2108 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2106);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2114 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2104);
    float _2116 = rsqrt(_2102);
    float _2118 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2120 = -_2110;
    float _2122 = _2120 + 1.0;
    float _2124 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2114);
    float _2126 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2118);
    float _2130 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2132 = abs(_2122);
    float _2134 = log2(_2132);
    float _2136 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2138 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2140 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2128);
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2144 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2136);
    float _2146 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2138);
    float _2148 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2150 = _2116 * _2074;
    float _2152 = _2116 * _2086;
    float _2154 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2158 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2160 = _2116 * _2082;
    float _2162 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2144);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2156);
    float _2166 = -_2158;
    float _2168 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2172 = -_2142;
    float _2174 = fma(_2172, _2112, 1.0);
    float _2176 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2178 = -_2160;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2182 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2164);
    float _2184 = exp2(_2170);
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2188 = fma(_2180, -0.5, 0.5);
    float _2190 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2182);
    float _2192 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2194 = fma(_2180, 0.5, 0.5);
    float _2196 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2186);
    float _2198 = _2152 + 1.0;
    float _2200 = log2(_2174);
    float _2202 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2192);
    float _2204 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2196);
    float _2206 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2202);
    float _2208 = 1.0 / _2190;
    float _2210 = -_2152;
    float _2212 = fma(_2184, _2198, _2210);
    float _2214 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2206);
    float _2216 = fma(_2194, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2218 = fma(_2212, 0.5, 0.5);
    float _2220 = sqrt(_2188);
    float _2222 = fma(_2194, _2216, -0.212114393711090087890625);
    float _2224 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2204);
    float _2226 = _2200 * 0.693147182464599609375;
    float _2228 = fma(_2194, _2222, 1.570728778839111328125);
    float _2230 = _2224 * _2208;
    float _2232 = _2214 * _2208;
    float _2234 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2236 = fma(_2230, 0.5, 0.5);
    float _2238 = fma(_2232, -0.5, 0.5);
    float _2240 = _2220 * 0.636619746685028076171875;
    float _2242 = -_2228;
    float _2244 = fma(_2240, _2242, 1.0);
    float3 _6067 = float3(_2236, _2238, _2234);
    float _2246 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6067, float3(0.0), isnan(_6067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6067, float3(0.0), isnan(_6067)), level(0.0)).x;
    float3 _6078 = float3(_2236, _2238, _2234);
    float4 _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6078, float3(0.0), isnan(_6078)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6078, float3(0.0), isnan(_6078)), level(0.0)).xyzw;
    float _2251 = _2249.x;
    float _2253 = _2249.y;
    float _2255 = _2249.z;
    float _2257 = _2249.w;
    float2 _6095 = float2(_2244, _2218);
    float3 _2261 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).xyz;
    float _2263 = _2261.x;
    float _2265 = _2261.y;
    float _2267 = _2261.z;
    float _2269 = -_1154;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _2273 = -_1156;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _2277 = -_1196;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1050);
    float _2281 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2283 = _2271 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2285 = _2271 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2287 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2281);
    float _2289 = fma(_2275, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2283);
    float _2291 = fma(_2275, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2285);
    float _2293 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2289);
    float _2295 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2291);
    float _2297 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2299 = _2295 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2301 = 1.0 / _2297;
    float _2303 = _2299 + _2297;
    float _2305 = _2303 * _2301;
    float _2307 = _2305 * 0.5;
    float _2309 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2309);
    bool _2313 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan(0.5);
    bool _2321 = _2317 || _2319;
    float _2323 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2325 = 1.0 / _2311;
    float _2327 = exp2(_2323);
    float _2329 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2331 = _2307;
    if (_2321)
    {
        _2329 = 1.0;
    }
    float _2333 = _2329;
    float _2335 = _2333;
    if (_2321)
    {
        _2331 = 1.0;
    }
    float _2337 = _2331;
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2341 = _2325 * _2339;
    float _2343 = _2337;
    if (!_2321)
    {
        float _2345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2347 = _2345 * 0.15915493667125701904296875;
        float _2349 = _2347 * 6.283185482025146484375;
        float _2351 = cos(_2349);
        float _2353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2355 = _2353 * 0.15915493667125701904296875;
        float _2357 = _2347 * 6.283185482025146484375;
        float _2359 = sin(_2357);
        float _2361 = 1.0 / _2351;
        float _2363 = _2355 * 6.283185482025146484375;
        float _2365 = cos(_2363);
        float _2367 = _2359 * _2361;
        float _2369 = _2355 * 6.283185482025146484375;
        float _2371 = sin(_2369);
        float _2373 = _2365 * _2367;
        float _2375 = 1.0 / _2373;
        float _2377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2377;
        float _2381 = 1.0 / _2379;
        float _2383 = _2371 * _2375;
        float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2387 = fma(_2341, _2383, _2385);
        float _2389 = _2387 * _2381;
        float _2391 = precise::clamp(_2389, 0.0, 1.0);
        _2335 = _2391;
    }
    float _2393 = _2335;
    if (!_2321)
    {
        float _2395 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2397 = _2395 * 0.15915493667125701904296875;
        float _2399 = _2397 * 6.283185482025146484375;
        float _2401 = cos(_2399);
        float _2403 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2405 = _2403 * 0.15915493667125701904296875;
        float _2407 = _2397 * 6.283185482025146484375;
        float _2409 = sin(_2407);
        float _2411 = 1.0 / _2401;
        float _2413 = _2405 * 6.283185482025146484375;
        float _2415 = cos(_2413);
        float _2417 = _2409 * _2411;
        float _2419 = _2405 * 6.283185482025146484375;
        float _2421 = sin(_2419);
        float _2423 = _2415 * _2417;
        float _2425 = 1.0 / _2423;
        float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2429 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2427;
        float _2431 = 1.0 / _2429;
        float _2433 = _2421 * _2425;
        float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2437 = fma(_2341, _2433, _2435);
        float _2439 = _2437 * _2431;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        float _2443 = -_2441;
        float _2445 = _2443 + 1.0;
        _2343 = _2445;
    }
    float _2447 = _2343;
    float _2449 = _2393 * _2447;
    float _2451 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2287);
    float _2453 = -_2327;
    float _2455 = _2453 + 1.0;
    bool _2457 = _2393 > 0.0;
    bool _2459 = isnan(_2393);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan(0.0);
    bool _2465 = _2461 || _2463;
    float _2467 = _2449 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2469 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2451);
    float _2471 = _682 * _2467;
    float _2473 = _2469 + _2190;
    bool _2475 = _2447 <= 0.0;
    bool _2477 = !_2465;
    bool _2479 = _2475 || _2477;
    out.gl_Position.x = _2224;
    out.gl_Position.y = _2214;
    out.gl_Position.z = _2469;
    out.gl_Position.w = _2190;
    float _2481 = _2471 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2485 = _2473 * 0.5;
    float _2487 = _2483 * _2246;
    float _2489 = -_2483;
    float _2491 = _2489 + 1.0;
    out.m_47.x = _2481;
    float _2493 = _2257 * _2487;
    float _2495 = _2267 * _2487;
    float _2497 = _2257 * _2491;
    out.m_67.z = _2485;
    out.m_67.w = _2190;
    float _2499 = fma(_2263, _2493, _2251);
    float _2501 = fma(_2265, _2493, _2253);
    float _2503 = fma(_2257, _2495, _2255);
    out.m_69.x = _2499;
    out.m_69.y = _2501;
    out.m_69.z = _2503;
    out.m_69.w = _2497;
    if (!_2479)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2505 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2505;
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
    bool _1876 = false;
    bool _994 = false;
    bool _828 = false;
    bool _704 = false;
    bool _466 = false;
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
        float _2562 = as_type<float>(_104);
        out.gl_Position.z = _2562;
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
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2631 = as_type<float>(_142);
        out.gl_Position.z = _2631;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = _150;
    if (!_160)
    {
        float _164 = _150 * _150;
        float _166 = _164 * 0.5;
        _124 = _166;
    }
    float _168 = _124;
    float _170 = 0.0;
    float _172 = _168;
    if (!_160)
    {
        float _174 = _122 * _122;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    if (!_160)
    {
        float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _180;
    }
    float _182 = _172;
    bool _184 = !_160;
    float _186 = 0.0;
    float _188 = _182;
    float _190 = 0.0;
    if (!_184)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _208;
        _188 = _220;
        _190 = _210;
    }
    float _222 = _186;
    float _224 = _188;
    float _226 = _190;
    bool _228 = !_160;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _162 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _162;
    float _260 = _256;
    float _262 = _254;
    if (!_160)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_160)
    {
        float _270 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_160;
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
    bool _310 = !_160;
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
    float _338 = fma(_258, _146, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _146, _334);
    float _344 = fma(_258, _144, _336);
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _144, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _148, _346);
    float _358 = fma(_258, _148, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_356;
    float _370 = _358 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_358, _366, _390);
    float _418 = _366;
    float _420 = _400;
    float _422 = _398;
    if (_410)
    {
        _418 = _394;
    }
    float _424 = _418;
    float _426 = _424;
    if (!_410)
    {
        bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _430 = !_428;
        if (!_430)
        {
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _442);
            float _450 = _444 * _444;
            float _452 = fma(_446, _446, _450);
            float _454 = fma(_448, _448, _452);
            float _456 = rsqrt(_454);
            float _458 = _456 * 9.9999999747524270787835121154785e-07;
            float _460 = _446 * _458;
            float _462 = _444 * _458;
            float _464 = _448 * _458;
            _426 = _462;
            _420 = _460;
            _422 = _464;
            _466 = true;
        }
        else
        {
            float _468 = _146 * _146;
            float _470 = fma(_144, _144, _468);
            float _472 = fma(_148, _148, _470);
            float _474 = sqrt(_472);
            bool _476 = _474 >= 9.9999999747524270787835121154785e-07;
            bool _478 = isnan(_474);
            bool _480 = _476 || _478;
            bool _482 = isnan(9.9999999747524270787835121154785e-07);
            bool _484 = _480 || _482;
            if (!_484)
            {
                float _486 = _388 * _388;
                float _488 = fma(_386, _386, _486);
                float _490 = fma(_390, _390, _488);
                float _492 = sqrt(_490);
                bool _494 = _492 >= 9.9999999747524270787835121154785e-07;
                bool _496 = isnan(_492);
                bool _498 = _494 || _496;
                bool _500 = isnan(9.9999999747524270787835121154785e-07);
                bool _502 = _498 || _500;
                if (!_502)
                {
                    float _504 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _504);
                    float _508 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _506);
                    float _510 = rsqrt(_508);
                    float _512 = _510 * 9.9999999747524270787835121154785e-07;
                    float _514 = _512 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _516 = _512 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = _512 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _426 = _516;
                    _420 = _514;
                    _422 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _426 = _550;
                    _420 = _548;
                    _422 = _552;
                    _466 = true;
                }
            }
            else
            {
                float _554 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _556 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _558 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _560 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
                float _562 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
                float _564 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
                float _570 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
                float _572 = _566 * _566;
                float _574 = fma(_568, _568, _572);
                float _576 = fma(_570, _570, _574);
                float _578 = rsqrt(_576);
                float _580 = _578 * 9.9999999747524270787835121154785e-07;
                float _582 = _568 * _580;
                float _584 = _566 * _580;
                float _586 = _570 * _580;
                _426 = _584;
                _420 = _582;
                _422 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _426;
    float _590 = _420;
    float _592 = _422;
    float _594 = in.m_53.x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _598 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _606 = _604 != 0;
    int _608 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _610 = _608 != 0;
    float _612 = _598 * _596;
    float _614 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[20].x, _612);
    float _616 = _614 * 6.283185482025146484375;
    float _618 = floor(_614);
    float _620 = _616 * 0.15915493667125701904296875;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_624);
    float _628 = _620 * 6.283185482025146484375;
    float _630 = cos(_628);
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _638 = abs(_634);
    float _640 = -_618;
    float _642 = _614 + _640;
    bool _644 = !_606;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_646);
    float _650 = -_642;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _654 = float(_626);
    float _656 = fma(_630, 0.5, 0.5);
    bool _658 = _642 < 0.5;
    float _660 = float(_658);
    float _662 = abs(_652);
    float _664 = _654 * _662;
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _670 = float(_638);
    float _672 = -_660;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _676 = float(_648);
    float _678 = fma(_670, _668, _664);
    float _680 = abs(_674);
    float _682 = fma(_676, _680, _678);
    bool _684 = !_636;
    float _686 = _592;
    float _702;
    if (!_684)
    {
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _690 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_88);
        float _708 = 1.0 / _706;
        float _710 = _122 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _716 = _712 + _714;
    bool _718 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _720 = isnan(_712);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _730;
    float _734 = 1.0 / _732;
    bool _736 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _738 = isnan(_712);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = -_728;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _756;
    bool _760 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _762;
    float _766 = _746 * _754;
    float _768 = -_746;
    float _770 = _768 + 1.0;
    float _772 = _716 * _734;
    float _774 = in.m_51.x;
    float _776 = in.m_51.y;
    float _778 = in.m_51.z;
    float _780 = fma(_750, _772, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _782 = fma(_764, _772, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _784 = fma(_758, _772, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _786 = _780 * _766;
    float _788 = _782 * _766;
    float _790 = _784 * _766;
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].x, _786);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].y, _788);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[143].z, _790);
    float _798 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].x, _792);
    float _800 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].y, _794);
    float _802 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[144].z, _796);
    float _804 = _798 * _774;
    float _806 = _800 * _776;
    float _808 = _802 * _778;
    bool _810 = !_760;
    float _826;
    if (!_810)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _814 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_88);
        float _832 = 1.0 / _830;
        float _834 = _122 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _840 = _836 + _838;
    bool _842 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _844 = isnan(_836);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _856 = _836 + _854;
    bool _858 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _860 = isnan(_836);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -_852;
    float _892 = _890 + 1.0;
    float _894 = 1.0 / _872;
    float _896 = _888 * _892;
    float _898 = -_888;
    float _900 = _898 + 1.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _902;
    bool _906 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _908 = 1.0 / _876;
    float _910 = _868 * _900;
    float _912 = -_868;
    float _914 = _912 + 1.0;
    float _916 = _840 * _894;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _922;
    float _926 = fma(_904, _916, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _928 = fma(_920, _916, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _930 = fma(_924, _916, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _932 = _856 * _908;
    float _934 = _926 * _910;
    float _936 = _928 * _910;
    float _938 = _930 * _910;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _952 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].x, _934);
    float _954 = fma(_942, _932, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _956 = fma(_946, _932, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _958 = fma(_950, _932, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _960 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].y, _936);
    float _962 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[107].z, _938);
    float _964 = fma(_954, _896, _952);
    float _966 = fma(_956, _896, _960);
    float _968 = fma(_958, _896, _962);
    float _970 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].x, _964);
    float _972 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].y, _966);
    float _974 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[109].z, _968);
    bool _976 = !_906;
    float _992;
    if (!_976)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _980 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _984 = _982 * _978;
        float _986 = floor(_984);
        float _988 = -_986;
        float _990 = _984 + _988;
        _992 = _990;
        _994 = true;
    }
    else
    {
        float _996 = float(_88);
        float _998 = 1.0 / _996;
        float _1000 = _122 * _998;
        _992 = _1000;
    }
    _994 = false;
    float _1002 = _992;
    float _1004 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1006 = _588 * _588;
    float _1008 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1012 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1004);
    float _1014 = fma(_590, _590, _1006);
    float _1016 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1018 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1010);
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _1022 = fma(_592, _592, _1014);
    float _1024 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1026 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1012);
    float _1028 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1030 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1032 = rsqrt(_1022);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1036 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1030);
    float _1038 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1042 = _1034 + _1040;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1046 = _1020 * _588;
    float _1048 = _1046 * 8.0;
    float _1050 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1054 = _1038 + _1052;
    float _1056 = _1042 * _1042;
    float _1058 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1060 = _1032 * _588;
    float _1062 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1036);
    float _1064 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1044);
    float _1066 = _1032 * _590;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _1050 + _1070;
    float _1074 = fma(_1054, _1054, _1056);
    float _1076 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1058);
    float _1078 = sqrt(_1062);
    float _1080 = _1032 * _592;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1068);
    float _1084 = fma(_1072, _1072, _1074);
    float _1086 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1076);
    float _1088 = fma(_1080, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1082);
    float _1090 = in.m_53.w;
    float _1092 = sqrt(_1086);
    float _1094 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = abs(_1088);
    bool _1100 = _1098 > 0.99989998340606689453125;
    float _1102 = in.m_53.y;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1112 = _1110 != 0;
    float _1114 = rsqrt(_1084);
    float _1116 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1064);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_55.z;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1126 = _1124 != 0;
    float _1128 = _1020 * _590;
    float _1130 = _1128 * 8.0;
    float _1132 = fma(_1078, _1078, _1116);
    float _1134 = _1020 * _592;
    float _1136 = _1134 * 8.0;
    float _1138 = sqrt(_1116);
    float _1140 = _1130 * _1130;
    float _1142 = fma(_1092, _1092, _1132);
    float _1144 = _1064;
    float _1146 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1148 = _1100;
    if (_1100)
    {
        _686 = 0.001000000047497451305389404296875;
    }
    float _1150 = _686;
    float _1152 = fma(_1136, _1136, _1140);
    float _1154 = _1042 * _1114;
    float _1156 = _1054 * _1114;
    if (!_1100)
    {
        _1144 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1158 = _1144;
    float _1160 = -_1154;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1164 = _1158;
    if (_1100)
    {
        float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1164 = _1166;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    if (!_1100)
    {
        _1170 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1172 = _1170;
    float _1174 = sqrt(_1142);
    float _1176 = _1172;
    if (!_1100)
    {
        _1146 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1178 = _1146;
    float _1180 = _1178;
    if (_1100)
    {
        float _1182 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1176 = _1182;
    }
    float _1184 = _1176;
    if (_1100)
    {
        float _1186 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1180 = _1186;
    }
    float _1188 = _1180;
    float _1190 = -_1156;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1194 = _1162 * _1162;
    float _1196 = _1072 * _1114;
    bool _1198 = _1090 > 0.5;
    float _1200 = sqrt(_1152);
    float _1202 = _1138 * 0.800000011920928955078125;
    float _1204 = fma(_1192, _1192, _1194);
    float _1206 = -_1196;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1072);
    float _1210 = -_1168;
    float _1212 = _1080 * _1210;
    bool _1214 = _1102 > 0.5;
    float _1216 = in.m_55.x;
    float _1218 = fma(_1208, _1208, _1204);
    float _1220 = abs(_1048);
    float _1222 = 1.0 / _1220;
    float _1224 = -_1188;
    float _1226 = -_1212;
    float _1228 = fma(_1066, _1224, _1226);
    float _1230 = -_1188;
    float _1232 = _1060 * _1230;
    float _1234 = -_1184;
    float _1236 = _1066 * _1234;
    float _1238 = _1174 + 9.9999997473787516355514526367188e-06;
    float _1240 = 1.0 / _1202;
    float _1242 = fma(_1096, -0.64999997615814208984375, 1.0);
    float _1244 = fma(_1200, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1246 = precise::clamp(_1244, 0.0, 1.0);
    float _1248 = -_1168;
    float _1250 = -_1236;
    float _1252 = fma(_1060, _1248, _1250);
    float _1254 = fma(_1048, _1048, _1140);
    bool _1256 = _1198;
    if (_1106)
    {
        bool _1258 = _594 > 0.5;
        _1148 = _1258;
    }
    bool _1260 = _1148;
    float _1262 = _1246 * _1246;
    float _1264 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = sqrt(_1218);
    float _1268 = -_1184;
    float _1270 = -_1232;
    float _1272 = fma(_1080, _1268, _1270);
    float _1274 = _1228 * _1228;
    float _1276 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = _1138 * (-0.4000000059604644775390625);
    float _1280 = fma(_1246, -2.0, 3.0);
    float _1282 = 1.0 / _1238;
    float _1284 = fma(_1272, _1272, _1274);
    float _1286 = _1200 * _1222;
    float _1288 = _1286 * 0.25;
    float _1290 = precise::clamp(_1288, 0.0, 1.0);
    float _1292 = _1200 * _1240;
    float _1294 = _1280 * _1262;
    float _1296 = in.m_55.y;
    float _1298 = fma(_1252, _1252, _1284);
    float _1300 = _1290 * _1290;
    float _1302 = -_1294;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1290, -2.0, 3.0);
    float _1308 = rsqrt(_1298);
    float _1310 = _1114 * _1266;
    float _1312 = fma(_1306, _1300, _1304);
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    bool _1316 = _1292 < 0.5;
    float _1318 = float(_1316);
    float _1320 = _1108 * _1310;
    float _1322 = _1282 * _1122;
    float _1324 = _1282 * _1216;
    float _1326 = _1276 * _1310;
    float _1328 = _1264 * _1310;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1322);
    float _1332 = -_1318;
    float _1334 = fma(_1332, _1314, 1.0);
    float _1336 = _1320 * _1330;
    float _1338 = fma(_1136, _1136, _1254);
    float _1340 = _1228 * _1308;
    float _1342 = _1252 * _1308;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1324);
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1296);
    float _1348 = _1272 * _1308;
    float _1350 = rsqrt(_1338);
    float _1352 = _1066 * _1340;
    float _1354 = _1326 * _1346;
    float _1356 = _1060 * _1342;
    float _1358 = _1328 * _1344;
    float _1360 = -_1352;
    float _1362 = fma(_1060, _1348, _1360);
    float _1364 = _1354 * _1060;
    float _1366 = _1354 * _1066;
    float _1368 = -_1356;
    float _1370 = fma(_1080, _1340, _1368);
    float _1372 = _1080 * _1348;
    float _1374 = _1354 * _1080;
    float _1376 = fma(_1358, _1348, _1366);
    float _1378 = fma(_1358, _1340, _1364);
    float _1380 = -_1372;
    float _1382 = fma(_1066, _1342, _1380);
    float _1384 = fma(_1358, _1342, _1374);
    float _1386 = fma(_1336, _1370, _1376);
    float _1388 = _1048 * _1350;
    float _1390 = fma(_1336, _1382, _1378);
    float _1392 = _1130 * _1350;
    float _1394 = fma(_1336, _1362, _1384);
    float _1396 = _1390 * _1388;
    float _1398 = _1136 * _1350;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1404 = fma(_1386, _1392, _1396);
    float _1406 = in.m_57.y;
    float _1408 = fma(_1394, _1398, _1404);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1418 = 1.0 / _1402;
    float _1420 = _1392 * _1408;
    float _1422 = _1398 * _1408;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1426 = _1278;
    if (_1112)
    {
        float _1428 = in.m_53.z;
        _1424 = _1428;
    }
    float _1430 = _1424;
    float _1432 = fma(_1334, 0.89999997615814208984375, 0.100000001490116119384765625);
    bool _1434 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1436 = isnan(_1002);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = -_1422;
    float _1448 = _1394 + _1446;
    float _1450 = fma(_1334, 0.5, 0.5);
    float _1452 = 1.0 / _1412;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1454;
    float _1458 = fma(_1422, _1432, _1448);
    float _1460 = -_1444;
    float _1462 = _1460 + 1.0;
    float _1464 = _1294 * _1450;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1468 = _1002 + _1466;
    float _1470 = _1050 + _1458;
    float _1472 = 1.0 / _1416;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1478 = -_1420;
    float _1480 = _1386 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1484 = _1470 + _1482;
    float _1486 = _1456 * _1418;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1488;
    float _1492 = fma(_1420, _1432, _1480);
    float _1494 = fma(_1484, _1242, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1496 = _1476 * _1452;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1500 = _1002 + _1498;
    float _1502 = _1038 + _1492;
    float _1504 = -_1406;
    float _1506 = _1504 + 1.0;
    bool _1508 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1510 = isnan(_1002);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = fma(_1486, _1500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1522 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1524 = _1502 + _1522;
    bool _1526 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1528 = isnan(_1002);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1490 * _1472;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1542 = _1494 + _1540;
    float _1544 = fma(_1524, _1242, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    int _1546 = _1198 ? as_type<int>(_1506) : as_type<int>(_1406);
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1550 = _1002 + _1548;
    float _1552 = _1406;
    float _1554 = _1506;
    float _1556 = _1544;
    float _1558 = _1494;
    if (_1112)
    {
        bool _1560 = _1430 > 0.5;
        _1256 = _1560;
    }
    bool _1562 = _1256;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1566 = _1544 + _1564;
    float _1568 = _1542 * _1542;
    float _1570 = -_1536;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1496, _1550, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1576 = _1566 * _1566;
    float _1578 = -_1518;
    float _1580 = _1578 + 1.0;
    float _1582 = _1518 * _1572;
    float _1584 = _1326 * _1296;
    float _1586 = _1576 + _1568;
    float _1588 = _1444 * _1580;
    float _1590 = _1388 * _1408;
    float _1592 = _1432 * _1584;
    float _1594 = sqrt(_1586);
    float _1596 = in.m_57.x;
    float _1598 = -_1590;
    float _1600 = _1390 + _1598;
    float _1602 = _1350 * _1592;
    bool _1604 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1606 = isnan(_1002);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1464 * _1464;
    float _1618 = fma(_1590, _1432, _1600);
    float _1620 = _1602 * _1602;
    float _1622 = _1120 ? as_type<float>(_1546) : _1406;
    float _1624 = fma(_1538, _1468, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1626 = _1034 + _1618;
    float _1628 = _1278 * _1620;
    float _1630 = _1628 * 0.5;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1634 = _1614 * _1462;
    float _1636 = -_1614;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1630, _1616, _1626);
    bool _1642 = _1594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1644 = _1520 * _1634;
    float _1646 = _1576;
    float _1648 = _1568;
    if (_1126)
    {
        float _1650 = _1214 ? _1506 : _1406;
        _1552 = _1650;
    }
    float _1652 = _1552;
    float _1654 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1656 = _1640 + _1654;
    float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1660 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1644);
    float _1662 = fma(_1656, _1242, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    int _1664 = as_type<int>(_1656);
    int _1666 = as_type<int>(_1662);
    float _1668 = _1596;
    if (!_1106)
    {
        _1426 = _1596;
    }
    float _1670 = _1426;
    float _1672 = fma(_1574, _1588, _1660);
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1676 = _1670;
    if (!_1642)
    {
        _1554 = _1662;
    }
    float _1678 = _1554;
    bool _1680 = !_1642;
    float _1682 = _1678;
    if (!_1680)
    {
        float _1684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1688 = _1594 + _1686;
        float _1690 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = rsqrt(_1586);
        float _1694 = _1688 * _1684;
        float _1696 = _1694 * 0.15915493667125701904296875;
        float _1698 = _1696 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = fma(_1700, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1708 = _1692 * _1706;
        float _1710 = _1704 + (-1.0);
        float _1712 = fma(_1566, _1708, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1714 = fma(_1542, _1708, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1716 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1720 = _1712 + _1718;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1724 = _1714 + _1722;
        float _1726 = fma(_1662, _1704, _1716);
        float _1728 = _1720 * _1720;
        float _1730 = _1724 * _1724;
        _1682 = _1726;
        _1664 = as_type<int>(_1708);
        _1646 = _1728;
        _1648 = _1730;
        _1556 = _1712;
        _1558 = _1714;
    }
    float _1732 = _1682;
    int _1734 = _1664;
    float _1736 = _1646;
    float _1738 = _1648;
    float _1740 = _1556;
    float _1742 = _1558;
    float _1744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1746 = _1734;
    float _1748 = _1740;
    if (_1106)
    {
        float _1750 = -_1596;
        float _1752 = _1750 + 1.0;
        _1746 = as_type<int>(_1752);
    }
    int _1754 = _1746;
    if (_1112)
    {
        float _1756 = -_1596;
        float _1758 = _1756 + 1.0;
        _1666 = as_type<int>(_1758);
    }
    int _1760 = _1666;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1764 = _1732 + _1762;
    float _1766 = fma(_1624, _1582, _1672);
    float _1768 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1106)
    {
        float _1770 = _1260 ? as_type<float>(_1754) : _1596;
        _1676 = _1770;
    }
    float _1772 = _1676;
    float _1774 = fma(_1764, _1764, _1736);
    if (_1112)
    {
        float _1776 = _1562 ? as_type<float>(_1760) : _1596;
        _1668 = _1776;
    }
    float _1778 = _1668;
    float _1780 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1782 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1766);
    float _1784 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1786 = _1774 + _1738;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1790 = _1780 * _1658;
    float _1792 = _1784 * _1632;
    float _1794 = _1788 * _1744;
    float _1796 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1800 = sqrt(_1786);
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1804 = _970 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1806 = _972 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1810 = _1768 * _1674;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1818 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1824 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1792;
    out.m_59.y = _1790;
    out.m_59.z = _1794;
    out.m_59.w = _1810;
    bool _1826 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1828 = isnan(_1800);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1834 = _1830 || _1832;
    out.m_61.x = _1816;
    out.m_61.y = _1818;
    out.m_61.z = _1820;
    out.m_63.x = _1812;
    out.m_63.y = _1814;
    out.m_63.z = _1822;
    out.m_63.w = _1824;
    out.m_65.x = _1328;
    out.m_65.y = _1326;
    float _1836 = _1804;
    float _1838 = _1820;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (!_1834)
    {
        _1836 = 1.0;
    }
    float _1842 = _1836;
    bool _1844 = !_1834;
    float _1846 = _1842;
    if (!_1844)
    {
        bool _1848 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1850 = isnan(_1800);
        bool _1852 = _1848 || _1850;
        bool _1854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1856 = _1852 || _1854;
        if (!_1856)
        {
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1860 = _1800 + _1858;
            float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1864 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1862;
            float _1866 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1870 = 1.0 / _1864;
            float _1872 = _1860 * _1870;
            float _1874 = fma(_1872, _1868, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1846 = _1874;
            _1876 = true;
        }
        else
        {
            bool _1878 = _1800 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1880 = isnan(_1800);
            bool _1882 = _1878 || _1880;
            bool _1884 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1886 = _1882 || _1884;
            if (!_1886)
            {
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1890 = _1800 + _1888;
                float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1896 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1898 = _1896 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1900 = 1.0 / _1894;
                float _1902 = _1890 * _1900;
                float _1904 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1846 = _1904;
                _1876 = true;
            }
            else
            {
                _1846 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1876 = false;
    float _1906 = _1846;
    float _1908 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1910 = _1732 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1914 = _1740 + _1912;
    float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1918 = _1742 + _1916;
    float _1920 = fma(_1910, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1922 = fma(_1914, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1924 = fma(_1918, _1906, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1926 = -_1154;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1920);
    float _1930 = -_1156;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1922);
    float _1934 = -_1196;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1924);
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1940 = _1928 + _1938;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1944 = _1932 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1936 + _1946;
    float _1950 = _1940 * _1940;
    float _1952 = fma(_1944, _1944, _1950);
    float _1954 = fma(_1948, _1948, _1952);
    float _1956 = rsqrt(_1954);
    float _1958 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1960 = _1944 * _1958;
    float _1962 = _1948 * _1958;
    float _1964 = _1960 * _1960;
    float _1966 = _1962 * _1962;
    float _1968 = _1964 + _1966;
    float _1970 = sqrt(_1968);
    bool _1972 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1976 = _1970 + _1974;
    float _1978 = _1948;
    float _1980 = _1968;
    float _1982 = _1976;
    float _1984 = _1960;
    if (_1972)
    {
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _1986;
    }
    float _1988 = _1978;
    if (_1972)
    {
        float _1990 = rsqrt(_1968);
        _1980 = _1990;
    }
    float _1992 = _1980;
    float _1994 = _1992;
    if (_1972)
    {
        float _1996 = _1976 * _1988;
        _1982 = _1996;
    }
    float _1998 = _1982;
    if (_1972)
    {
        float _2000 = _1998 * 0.15915493667125701904296875;
        _1838 = _2000;
    }
    float _2002 = _1838;
    float _2004 = _1956;
    if (_1972)
    {
        float _2006 = _2002 * 6.283185482025146484375;
        float _2008 = sin(_2006);
        _2004 = _2008;
    }
    float _2010 = _2004;
    float _2012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2014 = precise::max(0.0, _2012);
    float _2016 = _1816;
    float _2018 = _2014;
    float _2020 = _2012;
    if (_1972)
    {
        float _2022 = _2002 * 6.283185482025146484375;
        float _2024 = cos(_2022);
        _2016 = _2024;
    }
    float _2026 = _2016;
    float _2028 = -_1958;
    float _2030 = -_2014;
    float _2032 = fma(_1940, _2028, _2030);
    if (_1972)
    {
        float _2034 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2018 = _2034;
    }
    float _2036 = _2018;
    float _2038 = sqrt(_1954);
    float _2040 = _2010;
    float _2042 = _2036;
    if (_1972)
    {
        float _2044 = fma(_2010, _2036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2040 = _2044;
    }
    float _2046 = _2040;
    float _2048 = _2046;
    if (!_1972)
    {
        _2042 = _1962;
    }
    float _2050 = _2042;
    float _2052 = _2050;
    if (_1972)
    {
        float _2054 = _2026 + (-1.0);
        _2020 = _2054;
    }
    float _2056 = _2020;
    float _2058 = _2056;
    if (_1972)
    {
        float _2060 = _1992 * _2046;
        _1748 = _2060;
    }
    float _2062 = _1748;
    if (!_1972)
    {
        _2048 = _2032;
    }
    float _2064 = _2048;
    float _2066 = _2064;
    if (_1972)
    {
        float _2068 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _2068;
    }
    float _2070 = _1840;
    if (_1972)
    {
        float _2072 = _1960 * _2062;
        _1984 = _2072;
    }
    float _2074 = _1984;
    if (!_1972)
    {
        _1994 = _1964;
    }
    float _2076 = _1994;
    float _2078 = _2076;
    if (_1972)
    {
        float _2080 = _1962 * _2062;
        _2052 = _2080;
    }
    float _2082 = _2052;
    if (_1972)
    {
        float _2084 = fma(_2032, _2026, _2070);
        _2066 = _2084;
    }
    float _2086 = _2066;
    if (_1972)
    {
        float _2088 = _2074 * _2074;
        _2078 = _2088;
    }
    float _2090 = _2078;
    if (!_1972)
    {
        _2058 = _1966;
    }
    float _2092 = _2058;
    float _2094 = _2092;
    if (_1972)
    {
        float _2096 = _2082 * _2082;
        _2094 = _2096;
    }
    float _2098 = _2094;
    float _2100 = fma(_2086, _2086, _2090);
    float _2102 = _2100 + _2098;
    float _2104 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2108 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2106);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2114 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2104);
    float _2116 = rsqrt(_2102);
    float _2118 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2120 = -_2110;
    float _2122 = _2120 + 1.0;
    float _2124 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2114);
    float _2126 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2128 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2118);
    float _2130 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2132 = abs(_2122);
    float _2134 = log2(_2132);
    float _2136 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2138 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2126);
    float _2140 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2128);
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2144 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2136);
    float _2146 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2138);
    float _2148 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2150 = _2116 * _2074;
    float _2152 = _2116 * _2086;
    float _2154 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2158 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2160 = _2116 * _2082;
    float _2162 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2144);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2156);
    float _2166 = -_2158;
    float _2168 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2172 = -_2142;
    float _2174 = fma(_2172, _2112, 1.0);
    float _2176 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2178 = -_2160;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2182 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2164);
    float _2184 = exp2(_2170);
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2188 = fma(_2180, -0.5, 0.5);
    float _2190 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2182);
    float _2192 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2194 = fma(_2180, 0.5, 0.5);
    float _2196 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2186);
    float _2198 = _2152 + 1.0;
    float _2200 = log2(_2174);
    float _2202 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2192);
    float _2204 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2196);
    float _2206 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2202);
    float _2208 = 1.0 / _2190;
    float _2210 = -_2152;
    float _2212 = fma(_2184, _2198, _2210);
    float _2214 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2206);
    float _2216 = fma(_2194, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2218 = fma(_2212, 0.5, 0.5);
    float _2220 = sqrt(_2188);
    float _2222 = fma(_2194, _2216, -0.212114393711090087890625);
    float _2224 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2204);
    float _2226 = _2200 * 0.693147182464599609375;
    float _2228 = fma(_2194, _2222, 1.570728778839111328125);
    float _2230 = _2224 * _2208;
    float _2232 = _2214 * _2208;
    float _2234 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2236 = fma(_2230, 0.5, 0.5);
    float _2238 = fma(_2232, -0.5, 0.5);
    float _2240 = _2220 * 0.636619746685028076171875;
    float _2242 = -_2228;
    float _2244 = fma(_2240, _2242, 1.0);
    float3 _6067 = float3(_2236, _2238, _2234);
    float _2246 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6067, float3(0.0), isnan(_6067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6067, float3(0.0), isnan(_6067)), level(0.0)).x;
    float3 _6078 = float3(_2236, _2238, _2234);
    float4 _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6078, float3(0.0), isnan(_6078)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6078, float3(0.0), isnan(_6078)), level(0.0)).xyzw;
    float _2251 = _2249.x;
    float _2253 = _2249.y;
    float _2255 = _2249.z;
    float _2257 = _2249.w;
    float2 _6095 = float2(_2244, _2218);
    float3 _2261 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).xyz;
    float _2263 = _2261.x;
    float _2265 = _2261.y;
    float _2267 = _2261.z;
    float _2269 = -_1154;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _2273 = -_1156;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _2277 = -_1196;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1050);
    float _2281 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2283 = _2271 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2285 = _2271 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2287 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2281);
    float _2289 = fma(_2275, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2283);
    float _2291 = fma(_2275, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2285);
    float _2293 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2289);
    float _2295 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2291);
    float _2297 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2299 = _2295 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2301 = 1.0 / _2297;
    float _2303 = _2299 + _2297;
    float _2305 = _2303 * _2301;
    float _2307 = _2305 * 0.5;
    float _2309 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2309);
    bool _2313 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan(0.5);
    bool _2321 = _2317 || _2319;
    float _2323 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2325 = 1.0 / _2311;
    float _2327 = exp2(_2323);
    float _2329 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2331 = _2307;
    if (_2321)
    {
        _2329 = 1.0;
    }
    float _2333 = _2329;
    float _2335 = _2333;
    if (_2321)
    {
        _2331 = 1.0;
    }
    float _2337 = _2331;
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2341 = _2325 * _2339;
    float _2343 = _2337;
    if (!_2321)
    {
        float _2345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2347 = _2345 * 0.15915493667125701904296875;
        float _2349 = _2347 * 6.283185482025146484375;
        float _2351 = cos(_2349);
        float _2353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2355 = _2353 * 0.15915493667125701904296875;
        float _2357 = _2347 * 6.283185482025146484375;
        float _2359 = sin(_2357);
        float _2361 = 1.0 / _2351;
        float _2363 = _2355 * 6.283185482025146484375;
        float _2365 = cos(_2363);
        float _2367 = _2359 * _2361;
        float _2369 = _2355 * 6.283185482025146484375;
        float _2371 = sin(_2369);
        float _2373 = _2365 * _2367;
        float _2375 = 1.0 / _2373;
        float _2377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2377;
        float _2381 = 1.0 / _2379;
        float _2383 = _2371 * _2375;
        float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2387 = fma(_2341, _2383, _2385);
        float _2389 = _2387 * _2381;
        float _2391 = precise::clamp(_2389, 0.0, 1.0);
        _2335 = _2391;
    }
    float _2393 = _2335;
    if (!_2321)
    {
        float _2395 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2397 = _2395 * 0.15915493667125701904296875;
        float _2399 = _2397 * 6.283185482025146484375;
        float _2401 = cos(_2399);
        float _2403 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2405 = _2403 * 0.15915493667125701904296875;
        float _2407 = _2397 * 6.283185482025146484375;
        float _2409 = sin(_2407);
        float _2411 = 1.0 / _2401;
        float _2413 = _2405 * 6.283185482025146484375;
        float _2415 = cos(_2413);
        float _2417 = _2409 * _2411;
        float _2419 = _2405 * 6.283185482025146484375;
        float _2421 = sin(_2419);
        float _2423 = _2415 * _2417;
        float _2425 = 1.0 / _2423;
        float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2429 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2427;
        float _2431 = 1.0 / _2429;
        float _2433 = _2421 * _2425;
        float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2437 = fma(_2341, _2433, _2435);
        float _2439 = _2437 * _2431;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        float _2443 = -_2441;
        float _2445 = _2443 + 1.0;
        _2343 = _2445;
    }
    float _2447 = _2343;
    float _2449 = _2393 * _2447;
    float _2451 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2287);
    float _2453 = -_2327;
    float _2455 = _2453 + 1.0;
    bool _2457 = _2393 > 0.0;
    bool _2459 = isnan(_2393);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan(0.0);
    bool _2465 = _2461 || _2463;
    float _2467 = _2449 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2469 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2451);
    float _2471 = _682 * _2467;
    float _2473 = _2469 + _2190;
    bool _2475 = _2447 <= 0.0;
    bool _2477 = !_2465;
    bool _2479 = _2475 || _2477;
    out.gl_Position.x = _2224;
    out.gl_Position.y = _2214;
    out.gl_Position.z = _2469;
    out.gl_Position.w = _2190;
    float _2481 = _2471 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2485 = _2473 * 0.5;
    float _2487 = _2483 * _2246;
    float _2489 = -_2483;
    float _2491 = _2489 + 1.0;
    out.m_47.x = _2481;
    float _2493 = _2257 * _2487;
    float _2495 = _2267 * _2487;
    float _2497 = _2257 * _2491;
    out.m_67.z = _2485;
    out.m_67.w = _2190;
    float _2499 = fma(_2263, _2493, _2251);
    float _2501 = fma(_2265, _2493, _2253);
    float _2503 = fma(_2257, _2495, _2255);
    out.m_69.x = _2499;
    out.m_69.y = _2501;
    out.m_69.z = _2503;
    out.m_69.w = _2497;
    if (!_2479)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2505 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2505;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

