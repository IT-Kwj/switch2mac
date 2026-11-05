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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1568 = false;
    bool _798 = false;
    bool _618 = false;
    bool _468 = false;
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
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2045 = as_type<float>(_106);
        out.gl_Position.z = _2045;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_92);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    float _140 = 0.0;
    float _142 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _140;
    float _146 = _144;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _148 = _144 * 5.0;
        _108 = as_type<int>(_148);
    }
    int _150 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_150);
        out.gl_Position.z = _2116;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    float _158 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 0.0;
    float _172 = _158;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = 0.0;
    float _182 = _178;
    if (!_168)
    {
        float _184 = _124 * _124;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    if (!_168)
    {
        float _190 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _190;
    }
    float _192 = _182;
    bool _194 = !_168;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _158 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _158);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _146 = _216;
        _196 = _226;
        _142 = _214;
    }
    float _228 = _146;
    float _230 = _196;
    float _232 = _142;
    bool _234 = !_168;
    float _236 = _228;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _236 = _252;
        _238 = _246;
        _172 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _172;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _124;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _276;
    }
    float _278 = _268;
    bool _280 = !_168;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _124 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _124);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_168;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _124 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _342 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_264, _154, _272);
    float _346 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = fma(_338, _154, _340);
    float _350 = fma(_264, _152, _342);
    float _352 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_338, _156, _352);
    float _364 = fma(_264, _156, _354);
    float _366 = -_356;
    float _368 = _350 + _366;
    float _370 = _360 * _360;
    float _372 = in.m_51.w;
    float _374 = -_362;
    float _376 = _364 + _374;
    float _378 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = fma(_368, _368, _370);
    float _382 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _384 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = fma(_376, _376, _380);
    float _390 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _392 = in.m_44.x;
    float _394 = in.m_44.y;
    float _396 = in.m_44.z;
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _402 = sqrt(_388);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _390);
    float _406 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _398);
    bool _408 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_402);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_350, _372, _392);
    float _420 = fma(_344, _372, _394);
    float _422 = fma(_364, _372, _396);
    float _424 = _400;
    float _426 = _404;
    float _428 = _406;
    if (!_416)
    {
        bool _430 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _432 = !_430;
        if (!_432)
        {
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
            float _452 = _446 * _446;
            float _454 = fma(_448, _448, _452);
            float _456 = fma(_450, _450, _454);
            float _458 = rsqrt(_456);
            float _460 = _458 * 9.9999999747524270787835121154785e-07;
            float _462 = _448 * _460;
            float _464 = _446 * _460;
            float _466 = _450 * _460;
            _424 = _464;
            _426 = _462;
            _428 = _466;
            _468 = true;
        }
        else
        {
            float _470 = _154 * _154;
            float _472 = fma(_152, _152, _470);
            float _474 = fma(_156, _156, _472);
            float _476 = sqrt(_474);
            bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
            bool _480 = isnan(_476);
            bool _482 = _478 || _480;
            bool _484 = isnan(9.9999999747524270787835121154785e-07);
            bool _486 = _482 || _484;
            if (!_486)
            {
                float _488 = _394 * _394;
                float _490 = fma(_392, _392, _488);
                float _492 = fma(_396, _396, _490);
                float _494 = sqrt(_492);
                bool _496 = _494 >= 9.9999999747524270787835121154785e-07;
                bool _498 = isnan(_494);
                bool _500 = _496 || _498;
                bool _502 = isnan(9.9999999747524270787835121154785e-07);
                bool _504 = _500 || _502;
                if (!_504)
                {
                    float _506 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _508 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _506);
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _508);
                    float _512 = rsqrt(_510);
                    float _514 = _512 * 9.9999999747524270787835121154785e-07;
                    float _516 = _514 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _518 = _514 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _514 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _424 = _518;
                    _426 = _516;
                    _428 = _520;
                    _468 = true;
                }
                else
                {
                    float _522 = _394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _526 = _394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _528 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
                    float _530 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
                    float _534 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
                    float _536 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
                    float _538 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
                    float _540 = _534 * _534;
                    float _542 = fma(_536, _536, _540);
                    float _544 = fma(_538, _538, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _536 * _548;
                    float _552 = _534 * _548;
                    float _554 = _538 * _548;
                    _424 = _552;
                    _426 = _550;
                    _428 = _554;
                    _468 = true;
                }
            }
            else
            {
                float _556 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _558 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _560 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _562 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                float _564 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                float _568 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                float _570 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                float _574 = _568 * _568;
                float _576 = fma(_570, _570, _574);
                float _578 = fma(_572, _572, _576);
                float _580 = rsqrt(_578);
                float _582 = _580 * 9.9999999747524270787835121154785e-07;
                float _584 = _570 * _582;
                float _586 = _568 * _582;
                float _588 = _572 * _582;
                _424 = _586;
                _426 = _584;
                _428 = _588;
            }
        }
    }
    _468 = false;
    float _590 = _424;
    float _592 = _426;
    float _594 = _428;
    bool _596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _598 = !_596;
    float _616;
    if (!_598)
    {
        float _600 = in.m_53.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_92);
        float _622 = 1.0 / _620;
        float _624 = _124 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _630 = _626 + _628;
    bool _632 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _646 = _626 + _644;
    bool _648 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _650 = isnan(_626);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _668 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_642;
    float _682 = _680 + 1.0;
    float _684 = 1.0 / _666;
    float _686 = _678 * _682;
    float _688 = -_678;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _692;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _698 = 1.0 / _662;
    float _700 = _658 * _690;
    float _702 = -_658;
    float _704 = _702 + 1.0;
    float _706 = _646 * _684;
    float _708 = _630 * _698;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _714;
    float _718 = fma(_694, _708, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _720 = fma(_712, _708, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _722 = fma(_716, _708, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = _718 * _700;
    float _732 = _720 * _700;
    float _734 = _722 * _700;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].y, _732);
    float _750 = fma(_738, _706, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _752 = fma(_742, _706, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_746, _706, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _758 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].z, _734);
    float _760 = fma(_750, _686, _748);
    float _762 = fma(_752, _686, _756);
    float _764 = fma(_754, _686, _758);
    float _766 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].y, _760);
    float _768 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].x, _762);
    float _770 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].z, _764);
    float _772 = _766 * _726;
    float _774 = _768 * _724;
    float _776 = _770 * _728;
    bool _778 = !_696;
    float _796;
    if (!_778)
    {
        float _780 = in.m_53.x;
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _784 = _780 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _788 = _786 * _782;
        float _790 = floor(_788);
        float _792 = -_790;
        float _794 = _788 + _792;
        _796 = _794;
        _798 = true;
    }
    else
    {
        float _800 = float(_92);
        float _802 = 1.0 / _800;
        float _804 = _124 * _802;
        _796 = _804;
    }
    _798 = false;
    float _806 = _796;
    float _808 = in.m_55.y;
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _812 = in.m_53.y;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _816 = _814 != 0;
    float _818 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = in.m_53.z;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _828 = _826 != 0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _834 = _832 != 0;
    float _836 = in.m_53.w;
    float _838 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _840 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _844 = in.m_57.x;
    float _846 = in.m_57.y;
    float _848 = in.m_57.z;
    float _850 = in.m_53.x;
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _854 = -_808;
    float _856 = _854 + 1.0;
    float _858 = in.m_55.x;
    bool _860 = _812 > 0.5;
    float _862 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _864 = _824 > 0.5;
    int _866 = _860 ? as_type<int>(_856) : as_type<int>(_808);
    int _868 = _864 ? as_type<int>(_856) : as_type<int>(_808);
    bool _870 = _836 > 0.5;
    float _872 = _852 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _874 = _822 ? as_type<float>(_866) : _808;
    float _876 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = _828 ? as_type<float>(_868) : _808;
    float _880 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _882 = _808;
    bool _884 = _816;
    int _886 = as_type<int>(_862);
    if (_816)
    {
        float _888 = _870 ? _856 : _808;
        _882 = _888;
    }
    float _890 = _882;
    float _892 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _894 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _880);
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _898 = _896 != 0;
    float _900 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _904 = _902 != 0;
    float _906 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _892);
    float _908 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _906);
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _912 = _910 != 0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _922 = 1.0 / _916;
    float _924 = _812 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _848);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _844);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _936 = fma(_924, -2.0, _830);
    float _938 = 1.0 / _920;
    float _940 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _900);
    float _942 = _590 * _590;
    float _944 = -_932;
    float _946 = fma(_934, 2.0, _944);
    float _948 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _894);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _958 = fma(_592, _592, _942);
    float _960 = _818 * _930;
    float _962 = _952 * _922;
    float _964 = _838 * _926;
    float _966 = fma(_594, _594, _958);
    float _968 = _840 * _928;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _972 = _806 + _970;
    float _974 = _958;
    float _976 = _972;
    float _978 = _966;
    float _980 = _960;
    if (!_834)
    {
        _974 = _858;
    }
    float _982 = _974;
    float _984 = _956 * _938;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _988 = _806 + _986;
    float _990 = rsqrt(_966);
    float _992 = fma(_984, _972, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _994 = fma(_962, _988, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _996 = _810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _998 = _982;
    float _1000 = _994;
    if (!_834)
    {
        _976 = _982;
    }
    float _1002 = _976;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1010 = fma(_996, _874, -0.5);
    float _1012 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _936);
    float _1014 = _1002;
    if (_834)
    {
        _998 = _858;
    }
    float _1016 = _998;
    float _1018 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1008);
    bool _1020 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1022 = isnan(_806);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1004);
    float _1034 = _990 * _594;
    float _1036 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1018);
    float _1038 = _990 * _592;
    float _1040 = _990 * _590;
    float _1042 = -_1012;
    float _1044 = fma(_1036, _1010, _1042);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1048 = _1034 * _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1052 = _1040 * _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1056 = _1038 * _1054;
    float _1058 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1062 = -_1048;
    float _1064 = fma(_1038, _1060, _1062);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = -_1052;
    float _1070 = fma(_1034, _1066, _1068);
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1074 = -_1056;
    float _1076 = fma(_1040, _1072, _1074);
    float _1078 = fma(_878, _1058, -0.5);
    float _1080 = _1064 * _1064;
    bool _1082 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1084 = isnan(_806);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    int _1094 = 0;
    float _1096 = _1052;
    float _1098 = _1064;
    if (_898)
    {
        float _1100 = -_1016;
        float _1102 = _1100 + 1.0;
        _1094 = as_type<int>(_1102);
    }
    int _1104 = _1094;
    bool _1106 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1108 = isnan(_806);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = fma(_1070, _1070, _1080);
    if (_912)
    {
        _1096 = _850;
    }
    float _1120 = _1096;
    float _1122 = -_1092;
    float _1124 = _1122 + 1.0;
    float _1126 = _1120;
    if (!_912)
    {
        _1126 = _824;
    }
    float _1128 = _1126;
    float _1130 = fma(_1076, _1076, _1118);
    int _1132 = 0;
    if (_904)
    {
        float _1134 = -_1016;
        float _1136 = _1134 + 1.0;
        _1132 = as_type<int>(_1136);
    }
    int _1138 = _1132;
    float _1140 = _1116 * _1124;
    float _1142 = -_1116;
    float _1144 = _1142 + 1.0;
    if (_834)
    {
        bool _1146 = _850 > 0.5;
        _884 = _1146;
    }
    bool _1148 = _884;
    float _1150 = -_1030;
    float _1152 = _1150 + 1.0;
    float _1154 = rsqrt(_1130);
    float _1156 = _1030 * _1144;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1160 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1162 = fma(_862, _890, -0.5);
    float _1164 = _1158;
    if (_834)
    {
        float _1166 = -_1016;
        float _1168 = _1166 + 1.0;
        _886 = as_type<int>(_1168);
    }
    int _1170 = _886;
    float _1172 = _994 * _1156;
    float _1174 = -_1158;
    float _1176 = fma(_1160, 2.0, _1174);
    if (!_898)
    {
        _1000 = _1016;
    }
    float _1178 = _1000;
    float _1180 = _960 * _1040;
    float _1182 = _1178;
    if (!_904)
    {
        _1164 = _1016;
    }
    float _1184 = _1164;
    float _1186 = _960 * _1038;
    float _1188 = _1184;
    if (_834)
    {
        float _1190 = _1148 ? as_type<float>(_1170) : _1016;
        _1014 = _1190;
    }
    float _1192 = _1014;
    float _1194 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1172);
    if (_898)
    {
        float _1196 = _864 ? as_type<float>(_1104) : _1016;
        _1182 = _1196;
    }
    float _1198 = _1182;
    float _1200 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1202 = _1070 * _1154;
    float _1204 = _1064 * _1154;
    if (_904)
    {
        float _1206 = _860 ? as_type<float>(_1138) : _1016;
        _1188 = _1206;
    }
    float _1208 = _1188;
    float _1210 = _1076 * _1154;
    float _1212 = _1038 * _1204;
    if (!_912)
    {
        _978 = _812;
    }
    float _1214 = _978;
    float _1216 = fma(_968, _1202, _1186);
    float _1218 = _1214;
    if (_912)
    {
        _1218 = _850;
    }
    float _1220 = _1218;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1224 = -_1212;
    float _1226 = fma(_1040, _1202, _1224);
    float _1228 = _1040 * _1210;
    float _1230 = _960 * _1034;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1222);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1236 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1238 = fma(_968, _1210, _1230);
    float _1240 = -_1228;
    float _1242 = fma(_1034, _1204, _1240);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_912)
    {
        _980 = _824;
    }
    float _1246 = _980;
    float _1248 = -_1234;
    float _1250 = fma(_1236, 2.0, _1248);
    float _1252 = _1246;
    if (_912)
    {
        _1252 = _812;
    }
    float _1254 = _1252;
    float _1256 = fma(_964, _1226, _1238);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1260 = fma(_964, _1242, _1216);
    float _1262 = _908 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_912)
    {
        _1098 = _824;
    }
    float _1264 = _1098;
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    float _1268 = _1200 + _1256;
    float _1270 = _1262 + _1260;
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1274 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1276 = _1268 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1280 = _1270 + _1278;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1284 = _1276 * _1276;
    float _1286 = _1280 * _1280;
    float _1288 = _1264;
    float _1290 = _1286;
    float _1292 = _1284;
    float _1294 = _1270;
    float _1296 = _1268;
    if (_912)
    {
        _1288 = _812;
    }
    float _1298 = _1288;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_912)
    {
        _1244 = _812;
    }
    float _1302 = _1244;
    float _1304 = _1286 + _1284;
    float _1306 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1282);
    float _1308 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1310 = _1302;
    if (!_912)
    {
        _1310 = _850;
    }
    float _1312 = _1310;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1316 = _1034 * _1202;
    float _1318 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1320 = fma(_968, _1204, _1180);
    float _1322 = fma(_992, _1140, _1194);
    float _1324 = -_1316;
    float _1326 = fma(_1038, _1210, _1324);
    float _1328 = fma(_1318, _1192, -0.5);
    float _1330 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1306);
    float _1332 = sqrt(_1304);
    float _1334 = -_124;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    float _1338 = fma(_964, _1326, _1320);
    float _1340 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1342 = fma(_1330, _1328, _1336);
    float _1344 = -_124;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1176);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1350 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1352 = _1340 + _1338;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1358 = fma(_1350, _1208, -0.5);
    float _1360 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1308);
    float _1362 = fma(_872, _1198, -0.5);
    float _1364 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1232);
    bool _1366 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1368 = -_124;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1250);
    float _1372 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1374 = fma(_1360, _1358, _1346);
    float _1376 = fma(_1356, -2.0, _1354);
    float _1378 = fma(_1364, _1362, _1370);
    float _1380 = fma(_1372, -2.0, _1348);
    float _1382 = _1346;
    if (!_1366)
    {
        _1382 = _1352;
    }
    float _1384 = _1382;
    bool _1386 = !_1366;
    float _1388 = _1384;
    if (!_1386)
    {
        float _1390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1394 = _1332 + _1392;
        float _1396 = rsqrt(_1304);
        float _1398 = _1394 * _1390;
        float _1400 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = _1398 * 0.15915493667125701904296875;
        float _1404 = _1402 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        float _1408 = _1402 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = fma(_1406, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1414 = _1396 * _1412;
        float _1416 = _1410 + (-1.0);
        float _1418 = fma(_1280, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1420 = fma(_1276, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1422 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1426 = _1418 + _1424;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1430 = _1420 + _1428;
        float _1432 = fma(_1352, _1410, _1422);
        float _1434 = _1426 * _1426;
        float _1436 = _1430 * _1430;
        _1388 = _1432;
        _1290 = _1434;
        _1292 = _1436;
        _1294 = _1418;
        _1296 = _1420;
    }
    float _1438 = _1388;
    float _1440 = _1290;
    float _1442 = _1292;
    float _1444 = _1294;
    float _1446 = _1296;
    float _1448 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1032);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1452 = _1438 + _1450;
    float _1454 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1266);
    float _1456 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1376);
    float _1458 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1380);
    float _1460 = fma(_1452, _1452, _1440);
    float _1462 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1322);
    float _1464 = in.m_59.w;
    float _1466 = -_1456;
    float _1468 = fma(_1454, _1162, _1466);
    float _1470 = _1460 + _1442;
    float _1472 = -_1458;
    float _1474 = fma(_1448, _1078, _1472);
    float _1476 = _1044 + 0.5;
    float _1478 = _1374 + 0.5;
    float _1480 = sqrt(_1470);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1510 = _1342 + 0.5;
    float _1512 = _1378 + 0.5;
    float _1514 = _1468 + 0.5;
    float _1516 = _1474 + 0.5;
    out.m_61.w = _1464;
    bool _1518 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1520 = isnan(_1480);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1526 = _1522 || _1524;
    out.m_63.x = _1502;
    out.m_63.y = _1504;
    out.m_63.z = _1506;
    out.m_63.w = _1496;
    out.m_65.x = _1494;
    out.m_65.y = _1498;
    out.m_65.z = _1500;
    out.m_65.w = _1508;
    out.m_67.x = _1510;
    out.m_67.y = _1476;
    out.m_67.z = _1512;
    out.m_67.w = _1514;
    float _1528 = _1498;
    float _1530 = _1500;
    float _1532 = _1454;
    if (!_1526)
    {
        _128 = 1.0;
    }
    float _1534 = _128;
    out.m_69.x = _1478;
    out.m_69.y = _1516;
    bool _1536 = !_1526;
    float _1538 = _1534;
    if (!_1536)
    {
        bool _1540 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1542 = isnan(_1480);
        bool _1544 = _1540 || _1542;
        bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1548 = _1544 || _1546;
        if (!_1548)
        {
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = _1480 + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1556 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1554;
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1562 = 1.0 / _1556;
            float _1564 = _1552 * _1562;
            float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1538 = _1566;
            _1568 = true;
        }
        else
        {
            bool _1570 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1572 = isnan(_1480);
            bool _1574 = _1570 || _1572;
            bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1578 = _1574 || _1576;
            if (!_1578)
            {
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1480 + _1580;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1590 = _1588 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1592 = 1.0 / _1586;
                float _1594 = _1582 * _1592;
                float _1596 = fma(_1594, _1590, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1538 = _1596;
                _1568 = true;
            }
            else
            {
                _1538 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1568 = false;
    float _1598 = _1538;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1602 = _1438 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1606 = _1444 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1610 = _1446 + _1608;
    float _1612 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1614 = fma(_1606, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1616 = fma(_1610, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1620 = _1612 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1614 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1616 + _1626;
    float _1630 = _1620 * _1620;
    float _1632 = fma(_1624, _1624, _1630);
    float _1634 = fma(_1628, _1628, _1632);
    float _1636 = rsqrt(_1634);
    float _1638 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1640 = _1624 * _1638;
    float _1642 = _1628 * _1638;
    float _1644 = _1640 * _1640;
    float _1646 = _1642 * _1642;
    float _1648 = _1644 + _1646;
    float _1650 = sqrt(_1648);
    bool _1652 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1656 = _1650 + _1654;
    float _1658 = _1628;
    float _1660 = _1656;
    float _1662 = _1620;
    float _1664 = _1640;
    if (_1652)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1658 = _1666;
    }
    float _1668 = _1658;
    if (_1652)
    {
        float _1670 = rsqrt(_1648);
        _1528 = _1670;
    }
    float _1672 = _1528;
    float _1674 = _1672;
    if (_1652)
    {
        float _1676 = _1656 * _1668;
        _1660 = _1676;
    }
    float _1678 = _1660;
    if (_1652)
    {
        float _1680 = _1678 * 0.15915493667125701904296875;
        _1530 = _1680;
    }
    float _1682 = _1530;
    float _1684 = _1630;
    if (_1652)
    {
        float _1686 = _1682 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1694 = precise::max(0.0, _1692);
    float _1696 = _1636;
    float _1698 = _1694;
    float _1700 = _1692;
    if (_1652)
    {
        float _1702 = _1682 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        _1696 = _1704;
    }
    float _1706 = _1696;
    float _1708 = -_1638;
    float _1710 = -_1694;
    float _1712 = fma(_1620, _1708, _1710);
    if (!_1652)
    {
        _1698 = _1642;
    }
    float _1714 = _1698;
    float _1716 = _1714;
    if (_1652)
    {
        float _1718 = _1712 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1718;
    }
    float _1720 = _1700;
    float _1722 = sqrt(_1634);
    float _1724 = _1690;
    float _1726 = _1720;
    if (_1652)
    {
        float _1728 = fma(_1690, _1720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1662 = _1728;
    }
    float _1730 = _1662;
    float _1732 = _1730;
    if (!_1652)
    {
        _1724 = _1712;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (_1652)
    {
        float _1738 = _1706 + (-1.0);
        _1726 = _1738;
    }
    float _1740 = _1726;
    float _1742 = _1740;
    if (_1652)
    {
        float _1744 = _1672 * _1730;
        _1532 = _1744;
    }
    float _1746 = _1532;
    if (!_1652)
    {
        _1732 = _1646;
    }
    float _1748 = _1732;
    float _1750 = _1748;
    if (_1652)
    {
        float _1752 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1752;
    }
    float _1754 = _1674;
    if (_1652)
    {
        float _1756 = _1640 * _1746;
        _1664 = _1756;
    }
    float _1758 = _1664;
    if (!_1652)
    {
        _1742 = _1644;
    }
    float _1760 = _1742;
    float _1762 = _1760;
    if (_1652)
    {
        float _1764 = _1642 * _1746;
        _1716 = _1764;
    }
    float _1766 = _1716;
    if (_1652)
    {
        float _1768 = fma(_1712, _1706, _1754);
        _1736 = _1768;
    }
    float _1770 = _1736;
    if (_1652)
    {
        float _1772 = _1758 * _1758;
        _1762 = _1772;
    }
    float _1774 = _1762;
    if (_1652)
    {
        float _1776 = _1766 * _1766;
        _1750 = _1776;
    }
    float _1778 = _1750;
    float _1780 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1782 = fma(_1770, _1770, _1774);
    float _1784 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1788 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1786);
    float _1790 = precise::clamp(_1788, 0.0, 1.0);
    float _1792 = _1782 + _1778;
    float _1794 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1784);
    float _1796 = -_1790;
    float _1798 = _1796 + 1.0;
    float _1800 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1802 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1794);
    float _1806 = rsqrt(_1792);
    float _1808 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1810 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1812 = _1804 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1814 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1780);
    float _1816 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1808);
    float _1818 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1820 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1822 = abs(_1798);
    float _1824 = log2(_1822);
    float _1826 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1814);
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = -_1820;
    float _1832 = fma(_1830, _1810, 1.0);
    float _1834 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1818);
    float _1836 = _1826 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1840 = _1806 * _1758;
    float _1842 = _1806 * _1770;
    float _1844 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1838);
    float _1846 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1806 * _1766;
    float _1852 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1854 = log2(_1832);
    float _1856 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1858 = -_1848;
    float _1860 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1852);
    float _1864 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1866 = -_1850;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1872 = exp2(_1856);
    float _1874 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1864);
    float _1876 = fma(_1868, -0.5, 0.5);
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1870);
    float _1880 = fma(_1868, 0.5, 0.5);
    float _1882 = _1842 + 1.0;
    float _1884 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1886 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1888 = 1.0 / _1862;
    float _1890 = fma(_1880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = _1854 * 0.693147182464599609375;
    float _1894 = fma(_1880, _1890, -0.212114393711090087890625);
    float _1896 = sqrt(_1876);
    float _1898 = -_1842;
    float _1900 = fma(_1872, _1882, _1898);
    float _1902 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1886);
    float _1904 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1884);
    float _1906 = fma(_1880, _1894, 1.570728778839111328125);
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1910 = fma(_1900, 0.5, 0.5);
    float _1912 = _1902 * _1888;
    float _1914 = _1904 * _1888;
    float _1916 = fma(_1912, 0.5, 0.5);
    float _1918 = fma(_1914, -0.5, 0.5);
    float _1920 = _1896 * 0.636619746685028076171875;
    float3 _5114 = float3(_1916, _1918, _1908);
    float _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5114, float3(0.0), isnan(_5114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5114, float3(0.0), isnan(_5114)), level(0.0)).x;
    float _1924 = -_1906;
    float _1926 = fma(_1920, _1924, 1.0);
    float3 _5130 = float3(_1916, _1918, _1908);
    float4 _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5130, float3(0.0), isnan(_5130)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5130, float3(0.0), isnan(_5130)), level(0.0)).xyzw;
    float _1931 = _1929.x;
    float _1933 = _1929.y;
    float _1935 = _1929.z;
    float _1937 = _1929.w;
    float2 _5147 = float2(_1926, _1910);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5147, float2(0.0), isnan(_5147)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5147, float2(0.0), isnan(_5147)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1951 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1953 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1951);
    float _1955 = exp2(_1949);
    float _1957 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1953);
    float _1959 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1957);
    float _1961 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1963 = _1959 + _1862;
    out.gl_Position.x = _1902;
    out.gl_Position.y = _1904;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1862;
    float _1965 = _1963 * 0.5;
    float _1967 = -_1955;
    float _1969 = _1967 + 1.0;
    out.m_47.x = _1961;
    float _1971 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _1965;
    out.m_71.w = _1862;
    float _1973 = -_1971;
    float _1975 = _1973 + 1.0;
    float _1977 = _1971 * _1922;
    float _1979 = _1937 * _1977;
    float _1981 = _1947 * _1977;
    float _1983 = fma(_1943, _1979, _1931);
    float _1985 = fma(_1945, _1979, _1933);
    float _1987 = _1937 * _1975;
    float _1989 = fma(_1937, _1981, _1935);
    out.m_73.x = _1983;
    out.m_73.y = _1985;
    out.m_73.z = _1989;
    out.m_73.w = _1987;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1568 = false;
    bool _798 = false;
    bool _618 = false;
    bool _468 = false;
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
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2045 = as_type<float>(_106);
        out.gl_Position.z = _2045;
    }
    if (!_96)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_92);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    float _140 = 0.0;
    float _142 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _140;
    float _146 = _144;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _148 = _144 * 5.0;
        _108 = as_type<int>(_148);
    }
    int _150 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_150);
        out.gl_Position.z = _2116;
    }
    if (_138)
    {
        return out;
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    float _158 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 0.0;
    float _172 = _158;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = 0.0;
    float _182 = _178;
    if (!_168)
    {
        float _184 = _124 * _124;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    if (!_168)
    {
        float _190 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _190;
    }
    float _192 = _182;
    bool _194 = !_168;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _158 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _158);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _146 = _216;
        _196 = _226;
        _142 = _214;
    }
    float _228 = _146;
    float _230 = _196;
    float _232 = _142;
    bool _234 = !_168;
    float _236 = _228;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _236 = _252;
        _238 = _246;
        _172 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _172;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _124;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _276;
    }
    float _278 = _268;
    bool _280 = !_168;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _124 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _124);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_168;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _124 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _342 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_264, _154, _272);
    float _346 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = fma(_338, _154, _340);
    float _350 = fma(_264, _152, _342);
    float _352 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_338, _156, _352);
    float _364 = fma(_264, _156, _354);
    float _366 = -_356;
    float _368 = _350 + _366;
    float _370 = _360 * _360;
    float _372 = in.m_51.w;
    float _374 = -_362;
    float _376 = _364 + _374;
    float _378 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = fma(_368, _368, _370);
    float _382 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _384 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = fma(_376, _376, _380);
    float _390 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _392 = in.m_44.x;
    float _394 = in.m_44.y;
    float _396 = in.m_44.z;
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _402 = sqrt(_388);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _390);
    float _406 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _398);
    bool _408 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_402);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_350, _372, _392);
    float _420 = fma(_344, _372, _394);
    float _422 = fma(_364, _372, _396);
    float _424 = _400;
    float _426 = _404;
    float _428 = _406;
    if (!_416)
    {
        bool _430 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _432 = !_430;
        if (!_432)
        {
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
            float _452 = _446 * _446;
            float _454 = fma(_448, _448, _452);
            float _456 = fma(_450, _450, _454);
            float _458 = rsqrt(_456);
            float _460 = _458 * 9.9999999747524270787835121154785e-07;
            float _462 = _448 * _460;
            float _464 = _446 * _460;
            float _466 = _450 * _460;
            _424 = _464;
            _426 = _462;
            _428 = _466;
            _468 = true;
        }
        else
        {
            float _470 = _154 * _154;
            float _472 = fma(_152, _152, _470);
            float _474 = fma(_156, _156, _472);
            float _476 = sqrt(_474);
            bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
            bool _480 = isnan(_476);
            bool _482 = _478 || _480;
            bool _484 = isnan(9.9999999747524270787835121154785e-07);
            bool _486 = _482 || _484;
            if (!_486)
            {
                float _488 = _394 * _394;
                float _490 = fma(_392, _392, _488);
                float _492 = fma(_396, _396, _490);
                float _494 = sqrt(_492);
                bool _496 = _494 >= 9.9999999747524270787835121154785e-07;
                bool _498 = isnan(_494);
                bool _500 = _496 || _498;
                bool _502 = isnan(9.9999999747524270787835121154785e-07);
                bool _504 = _500 || _502;
                if (!_504)
                {
                    float _506 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _508 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _506);
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _508);
                    float _512 = rsqrt(_510);
                    float _514 = _512 * 9.9999999747524270787835121154785e-07;
                    float _516 = _514 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _518 = _514 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _514 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _424 = _518;
                    _426 = _516;
                    _428 = _520;
                    _468 = true;
                }
                else
                {
                    float _522 = _394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _526 = _394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _528 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
                    float _530 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
                    float _534 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
                    float _536 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
                    float _538 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
                    float _540 = _534 * _534;
                    float _542 = fma(_536, _536, _540);
                    float _544 = fma(_538, _538, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _536 * _548;
                    float _552 = _534 * _548;
                    float _554 = _538 * _548;
                    _424 = _552;
                    _426 = _550;
                    _428 = _554;
                    _468 = true;
                }
            }
            else
            {
                float _556 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _558 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _560 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _562 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                float _564 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                float _568 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                float _570 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                float _574 = _568 * _568;
                float _576 = fma(_570, _570, _574);
                float _578 = fma(_572, _572, _576);
                float _580 = rsqrt(_578);
                float _582 = _580 * 9.9999999747524270787835121154785e-07;
                float _584 = _570 * _582;
                float _586 = _568 * _582;
                float _588 = _572 * _582;
                _424 = _586;
                _426 = _584;
                _428 = _588;
            }
        }
    }
    _468 = false;
    float _590 = _424;
    float _592 = _426;
    float _594 = _428;
    bool _596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _598 = !_596;
    float _616;
    if (!_598)
    {
        float _600 = in.m_53.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_92);
        float _622 = 1.0 / _620;
        float _624 = _124 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _630 = _626 + _628;
    bool _632 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _646 = _626 + _644;
    bool _648 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _650 = isnan(_626);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _668 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_642;
    float _682 = _680 + 1.0;
    float _684 = 1.0 / _666;
    float _686 = _678 * _682;
    float _688 = -_678;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _692;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _698 = 1.0 / _662;
    float _700 = _658 * _690;
    float _702 = -_658;
    float _704 = _702 + 1.0;
    float _706 = _646 * _684;
    float _708 = _630 * _698;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _714;
    float _718 = fma(_694, _708, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _720 = fma(_712, _708, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _722 = fma(_716, _708, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = _718 * _700;
    float _732 = _720 * _700;
    float _734 = _722 * _700;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].y, _732);
    float _750 = fma(_738, _706, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _752 = fma(_742, _706, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_746, _706, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _758 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].z, _734);
    float _760 = fma(_750, _686, _748);
    float _762 = fma(_752, _686, _756);
    float _764 = fma(_754, _686, _758);
    float _766 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].y, _760);
    float _768 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].x, _762);
    float _770 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].z, _764);
    float _772 = _766 * _726;
    float _774 = _768 * _724;
    float _776 = _770 * _728;
    bool _778 = !_696;
    float _796;
    if (!_778)
    {
        float _780 = in.m_53.x;
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _784 = _780 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _788 = _786 * _782;
        float _790 = floor(_788);
        float _792 = -_790;
        float _794 = _788 + _792;
        _796 = _794;
        _798 = true;
    }
    else
    {
        float _800 = float(_92);
        float _802 = 1.0 / _800;
        float _804 = _124 * _802;
        _796 = _804;
    }
    _798 = false;
    float _806 = _796;
    float _808 = in.m_55.y;
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _812 = in.m_53.y;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _816 = _814 != 0;
    float _818 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = in.m_53.z;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _828 = _826 != 0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _834 = _832 != 0;
    float _836 = in.m_53.w;
    float _838 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _840 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _844 = in.m_57.x;
    float _846 = in.m_57.y;
    float _848 = in.m_57.z;
    float _850 = in.m_53.x;
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _854 = -_808;
    float _856 = _854 + 1.0;
    float _858 = in.m_55.x;
    bool _860 = _812 > 0.5;
    float _862 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _864 = _824 > 0.5;
    int _866 = _860 ? as_type<int>(_856) : as_type<int>(_808);
    int _868 = _864 ? as_type<int>(_856) : as_type<int>(_808);
    bool _870 = _836 > 0.5;
    float _872 = _852 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _874 = _822 ? as_type<float>(_866) : _808;
    float _876 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = _828 ? as_type<float>(_868) : _808;
    float _880 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _882 = _808;
    bool _884 = _816;
    int _886 = as_type<int>(_862);
    if (_816)
    {
        float _888 = _870 ? _856 : _808;
        _882 = _888;
    }
    float _890 = _882;
    float _892 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _894 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _880);
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _898 = _896 != 0;
    float _900 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _904 = _902 != 0;
    float _906 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _892);
    float _908 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _906);
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _912 = _910 != 0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _922 = 1.0 / _916;
    float _924 = _812 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _848);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _844);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _936 = fma(_924, -2.0, _830);
    float _938 = 1.0 / _920;
    float _940 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _900);
    float _942 = _590 * _590;
    float _944 = -_932;
    float _946 = fma(_934, 2.0, _944);
    float _948 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _894);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _958 = fma(_592, _592, _942);
    float _960 = _818 * _930;
    float _962 = _952 * _922;
    float _964 = _838 * _926;
    float _966 = fma(_594, _594, _958);
    float _968 = _840 * _928;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _972 = _806 + _970;
    float _974 = _958;
    float _976 = _972;
    float _978 = _966;
    float _980 = _960;
    if (!_834)
    {
        _974 = _858;
    }
    float _982 = _974;
    float _984 = _956 * _938;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _988 = _806 + _986;
    float _990 = rsqrt(_966);
    float _992 = fma(_984, _972, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _994 = fma(_962, _988, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _996 = _810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _998 = _982;
    float _1000 = _994;
    if (!_834)
    {
        _976 = _982;
    }
    float _1002 = _976;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1010 = fma(_996, _874, -0.5);
    float _1012 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _936);
    float _1014 = _1002;
    if (_834)
    {
        _998 = _858;
    }
    float _1016 = _998;
    float _1018 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1008);
    bool _1020 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1022 = isnan(_806);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1004);
    float _1034 = _990 * _594;
    float _1036 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1018);
    float _1038 = _990 * _592;
    float _1040 = _990 * _590;
    float _1042 = -_1012;
    float _1044 = fma(_1036, _1010, _1042);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1048 = _1034 * _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1052 = _1040 * _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1056 = _1038 * _1054;
    float _1058 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1062 = -_1048;
    float _1064 = fma(_1038, _1060, _1062);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = -_1052;
    float _1070 = fma(_1034, _1066, _1068);
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1074 = -_1056;
    float _1076 = fma(_1040, _1072, _1074);
    float _1078 = fma(_878, _1058, -0.5);
    float _1080 = _1064 * _1064;
    bool _1082 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1084 = isnan(_806);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    int _1094 = 0;
    float _1096 = _1052;
    float _1098 = _1064;
    if (_898)
    {
        float _1100 = -_1016;
        float _1102 = _1100 + 1.0;
        _1094 = as_type<int>(_1102);
    }
    int _1104 = _1094;
    bool _1106 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1108 = isnan(_806);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = fma(_1070, _1070, _1080);
    if (_912)
    {
        _1096 = _850;
    }
    float _1120 = _1096;
    float _1122 = -_1092;
    float _1124 = _1122 + 1.0;
    float _1126 = _1120;
    if (!_912)
    {
        _1126 = _824;
    }
    float _1128 = _1126;
    float _1130 = fma(_1076, _1076, _1118);
    int _1132 = 0;
    if (_904)
    {
        float _1134 = -_1016;
        float _1136 = _1134 + 1.0;
        _1132 = as_type<int>(_1136);
    }
    int _1138 = _1132;
    float _1140 = _1116 * _1124;
    float _1142 = -_1116;
    float _1144 = _1142 + 1.0;
    if (_834)
    {
        bool _1146 = _850 > 0.5;
        _884 = _1146;
    }
    bool _1148 = _884;
    float _1150 = -_1030;
    float _1152 = _1150 + 1.0;
    float _1154 = rsqrt(_1130);
    float _1156 = _1030 * _1144;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1160 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1162 = fma(_862, _890, -0.5);
    float _1164 = _1158;
    if (_834)
    {
        float _1166 = -_1016;
        float _1168 = _1166 + 1.0;
        _886 = as_type<int>(_1168);
    }
    int _1170 = _886;
    float _1172 = _994 * _1156;
    float _1174 = -_1158;
    float _1176 = fma(_1160, 2.0, _1174);
    if (!_898)
    {
        _1000 = _1016;
    }
    float _1178 = _1000;
    float _1180 = _960 * _1040;
    float _1182 = _1178;
    if (!_904)
    {
        _1164 = _1016;
    }
    float _1184 = _1164;
    float _1186 = _960 * _1038;
    float _1188 = _1184;
    if (_834)
    {
        float _1190 = _1148 ? as_type<float>(_1170) : _1016;
        _1014 = _1190;
    }
    float _1192 = _1014;
    float _1194 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1172);
    if (_898)
    {
        float _1196 = _864 ? as_type<float>(_1104) : _1016;
        _1182 = _1196;
    }
    float _1198 = _1182;
    float _1200 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1202 = _1070 * _1154;
    float _1204 = _1064 * _1154;
    if (_904)
    {
        float _1206 = _860 ? as_type<float>(_1138) : _1016;
        _1188 = _1206;
    }
    float _1208 = _1188;
    float _1210 = _1076 * _1154;
    float _1212 = _1038 * _1204;
    if (!_912)
    {
        _978 = _812;
    }
    float _1214 = _978;
    float _1216 = fma(_968, _1202, _1186);
    float _1218 = _1214;
    if (_912)
    {
        _1218 = _850;
    }
    float _1220 = _1218;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1224 = -_1212;
    float _1226 = fma(_1040, _1202, _1224);
    float _1228 = _1040 * _1210;
    float _1230 = _960 * _1034;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1222);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1236 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1238 = fma(_968, _1210, _1230);
    float _1240 = -_1228;
    float _1242 = fma(_1034, _1204, _1240);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_912)
    {
        _980 = _824;
    }
    float _1246 = _980;
    float _1248 = -_1234;
    float _1250 = fma(_1236, 2.0, _1248);
    float _1252 = _1246;
    if (_912)
    {
        _1252 = _812;
    }
    float _1254 = _1252;
    float _1256 = fma(_964, _1226, _1238);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1260 = fma(_964, _1242, _1216);
    float _1262 = _908 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_912)
    {
        _1098 = _824;
    }
    float _1264 = _1098;
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    float _1268 = _1200 + _1256;
    float _1270 = _1262 + _1260;
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1274 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1276 = _1268 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1280 = _1270 + _1278;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1284 = _1276 * _1276;
    float _1286 = _1280 * _1280;
    float _1288 = _1264;
    float _1290 = _1286;
    float _1292 = _1284;
    float _1294 = _1270;
    float _1296 = _1268;
    if (_912)
    {
        _1288 = _812;
    }
    float _1298 = _1288;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_912)
    {
        _1244 = _812;
    }
    float _1302 = _1244;
    float _1304 = _1286 + _1284;
    float _1306 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1282);
    float _1308 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1310 = _1302;
    if (!_912)
    {
        _1310 = _850;
    }
    float _1312 = _1310;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1316 = _1034 * _1202;
    float _1318 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1320 = fma(_968, _1204, _1180);
    float _1322 = fma(_992, _1140, _1194);
    float _1324 = -_1316;
    float _1326 = fma(_1038, _1210, _1324);
    float _1328 = fma(_1318, _1192, -0.5);
    float _1330 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1306);
    float _1332 = sqrt(_1304);
    float _1334 = -_124;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    float _1338 = fma(_964, _1326, _1320);
    float _1340 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1342 = fma(_1330, _1328, _1336);
    float _1344 = -_124;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1176);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1350 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1352 = _1340 + _1338;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1358 = fma(_1350, _1208, -0.5);
    float _1360 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1308);
    float _1362 = fma(_872, _1198, -0.5);
    float _1364 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1232);
    bool _1366 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1368 = -_124;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1250);
    float _1372 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1374 = fma(_1360, _1358, _1346);
    float _1376 = fma(_1356, -2.0, _1354);
    float _1378 = fma(_1364, _1362, _1370);
    float _1380 = fma(_1372, -2.0, _1348);
    float _1382 = _1346;
    if (!_1366)
    {
        _1382 = _1352;
    }
    float _1384 = _1382;
    bool _1386 = !_1366;
    float _1388 = _1384;
    if (!_1386)
    {
        float _1390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1394 = _1332 + _1392;
        float _1396 = rsqrt(_1304);
        float _1398 = _1394 * _1390;
        float _1400 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = _1398 * 0.15915493667125701904296875;
        float _1404 = _1402 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        float _1408 = _1402 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = fma(_1406, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1414 = _1396 * _1412;
        float _1416 = _1410 + (-1.0);
        float _1418 = fma(_1280, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1420 = fma(_1276, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1422 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1426 = _1418 + _1424;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1430 = _1420 + _1428;
        float _1432 = fma(_1352, _1410, _1422);
        float _1434 = _1426 * _1426;
        float _1436 = _1430 * _1430;
        _1388 = _1432;
        _1290 = _1434;
        _1292 = _1436;
        _1294 = _1418;
        _1296 = _1420;
    }
    float _1438 = _1388;
    float _1440 = _1290;
    float _1442 = _1292;
    float _1444 = _1294;
    float _1446 = _1296;
    float _1448 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1032);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1452 = _1438 + _1450;
    float _1454 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1266);
    float _1456 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1376);
    float _1458 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1380);
    float _1460 = fma(_1452, _1452, _1440);
    float _1462 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1322);
    float _1464 = in.m_59.w;
    float _1466 = -_1456;
    float _1468 = fma(_1454, _1162, _1466);
    float _1470 = _1460 + _1442;
    float _1472 = -_1458;
    float _1474 = fma(_1448, _1078, _1472);
    float _1476 = _1044 + 0.5;
    float _1478 = _1374 + 0.5;
    float _1480 = sqrt(_1470);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1510 = _1342 + 0.5;
    float _1512 = _1378 + 0.5;
    float _1514 = _1468 + 0.5;
    float _1516 = _1474 + 0.5;
    out.m_61.w = _1464;
    bool _1518 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1520 = isnan(_1480);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1526 = _1522 || _1524;
    out.m_63.x = _1502;
    out.m_63.y = _1504;
    out.m_63.z = _1506;
    out.m_63.w = _1496;
    out.m_65.x = _1494;
    out.m_65.y = _1498;
    out.m_65.z = _1500;
    out.m_65.w = _1508;
    out.m_67.x = _1510;
    out.m_67.y = _1476;
    out.m_67.z = _1512;
    out.m_67.w = _1514;
    float _1528 = _1498;
    float _1530 = _1500;
    float _1532 = _1454;
    if (!_1526)
    {
        _128 = 1.0;
    }
    float _1534 = _128;
    out.m_69.x = _1478;
    out.m_69.y = _1516;
    bool _1536 = !_1526;
    float _1538 = _1534;
    if (!_1536)
    {
        bool _1540 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1542 = isnan(_1480);
        bool _1544 = _1540 || _1542;
        bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1548 = _1544 || _1546;
        if (!_1548)
        {
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = _1480 + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1556 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1554;
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1562 = 1.0 / _1556;
            float _1564 = _1552 * _1562;
            float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1538 = _1566;
            _1568 = true;
        }
        else
        {
            bool _1570 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1572 = isnan(_1480);
            bool _1574 = _1570 || _1572;
            bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1578 = _1574 || _1576;
            if (!_1578)
            {
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1480 + _1580;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1590 = _1588 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1592 = 1.0 / _1586;
                float _1594 = _1582 * _1592;
                float _1596 = fma(_1594, _1590, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1538 = _1596;
                _1568 = true;
            }
            else
            {
                _1538 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1568 = false;
    float _1598 = _1538;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1602 = _1438 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1606 = _1444 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1610 = _1446 + _1608;
    float _1612 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1614 = fma(_1606, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1616 = fma(_1610, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1620 = _1612 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1614 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1616 + _1626;
    float _1630 = _1620 * _1620;
    float _1632 = fma(_1624, _1624, _1630);
    float _1634 = fma(_1628, _1628, _1632);
    float _1636 = rsqrt(_1634);
    float _1638 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1640 = _1624 * _1638;
    float _1642 = _1628 * _1638;
    float _1644 = _1640 * _1640;
    float _1646 = _1642 * _1642;
    float _1648 = _1644 + _1646;
    float _1650 = sqrt(_1648);
    bool _1652 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1656 = _1650 + _1654;
    float _1658 = _1628;
    float _1660 = _1656;
    float _1662 = _1620;
    float _1664 = _1640;
    if (_1652)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1658 = _1666;
    }
    float _1668 = _1658;
    if (_1652)
    {
        float _1670 = rsqrt(_1648);
        _1528 = _1670;
    }
    float _1672 = _1528;
    float _1674 = _1672;
    if (_1652)
    {
        float _1676 = _1656 * _1668;
        _1660 = _1676;
    }
    float _1678 = _1660;
    if (_1652)
    {
        float _1680 = _1678 * 0.15915493667125701904296875;
        _1530 = _1680;
    }
    float _1682 = _1530;
    float _1684 = _1630;
    if (_1652)
    {
        float _1686 = _1682 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1694 = precise::max(0.0, _1692);
    float _1696 = _1636;
    float _1698 = _1694;
    float _1700 = _1692;
    if (_1652)
    {
        float _1702 = _1682 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        _1696 = _1704;
    }
    float _1706 = _1696;
    float _1708 = -_1638;
    float _1710 = -_1694;
    float _1712 = fma(_1620, _1708, _1710);
    if (!_1652)
    {
        _1698 = _1642;
    }
    float _1714 = _1698;
    float _1716 = _1714;
    if (_1652)
    {
        float _1718 = _1712 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1718;
    }
    float _1720 = _1700;
    float _1722 = sqrt(_1634);
    float _1724 = _1690;
    float _1726 = _1720;
    if (_1652)
    {
        float _1728 = fma(_1690, _1720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1662 = _1728;
    }
    float _1730 = _1662;
    float _1732 = _1730;
    if (!_1652)
    {
        _1724 = _1712;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (_1652)
    {
        float _1738 = _1706 + (-1.0);
        _1726 = _1738;
    }
    float _1740 = _1726;
    float _1742 = _1740;
    if (_1652)
    {
        float _1744 = _1672 * _1730;
        _1532 = _1744;
    }
    float _1746 = _1532;
    if (!_1652)
    {
        _1732 = _1646;
    }
    float _1748 = _1732;
    float _1750 = _1748;
    if (_1652)
    {
        float _1752 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1752;
    }
    float _1754 = _1674;
    if (_1652)
    {
        float _1756 = _1640 * _1746;
        _1664 = _1756;
    }
    float _1758 = _1664;
    if (!_1652)
    {
        _1742 = _1644;
    }
    float _1760 = _1742;
    float _1762 = _1760;
    if (_1652)
    {
        float _1764 = _1642 * _1746;
        _1716 = _1764;
    }
    float _1766 = _1716;
    if (_1652)
    {
        float _1768 = fma(_1712, _1706, _1754);
        _1736 = _1768;
    }
    float _1770 = _1736;
    if (_1652)
    {
        float _1772 = _1758 * _1758;
        _1762 = _1772;
    }
    float _1774 = _1762;
    if (_1652)
    {
        float _1776 = _1766 * _1766;
        _1750 = _1776;
    }
    float _1778 = _1750;
    float _1780 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1782 = fma(_1770, _1770, _1774);
    float _1784 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1788 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1786);
    float _1790 = precise::clamp(_1788, 0.0, 1.0);
    float _1792 = _1782 + _1778;
    float _1794 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1784);
    float _1796 = -_1790;
    float _1798 = _1796 + 1.0;
    float _1800 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1802 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1794);
    float _1806 = rsqrt(_1792);
    float _1808 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1810 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1812 = _1804 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1814 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1780);
    float _1816 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1808);
    float _1818 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1820 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1822 = abs(_1798);
    float _1824 = log2(_1822);
    float _1826 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1814);
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = -_1820;
    float _1832 = fma(_1830, _1810, 1.0);
    float _1834 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1818);
    float _1836 = _1826 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1840 = _1806 * _1758;
    float _1842 = _1806 * _1770;
    float _1844 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1838);
    float _1846 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1806 * _1766;
    float _1852 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1854 = log2(_1832);
    float _1856 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1858 = -_1848;
    float _1860 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1852);
    float _1864 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1866 = -_1850;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1872 = exp2(_1856);
    float _1874 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1864);
    float _1876 = fma(_1868, -0.5, 0.5);
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1870);
    float _1880 = fma(_1868, 0.5, 0.5);
    float _1882 = _1842 + 1.0;
    float _1884 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1886 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1888 = 1.0 / _1862;
    float _1890 = fma(_1880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = _1854 * 0.693147182464599609375;
    float _1894 = fma(_1880, _1890, -0.212114393711090087890625);
    float _1896 = sqrt(_1876);
    float _1898 = -_1842;
    float _1900 = fma(_1872, _1882, _1898);
    float _1902 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1886);
    float _1904 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1884);
    float _1906 = fma(_1880, _1894, 1.570728778839111328125);
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1910 = fma(_1900, 0.5, 0.5);
    float _1912 = _1902 * _1888;
    float _1914 = _1904 * _1888;
    float _1916 = fma(_1912, 0.5, 0.5);
    float _1918 = fma(_1914, -0.5, 0.5);
    float _1920 = _1896 * 0.636619746685028076171875;
    float3 _5114 = float3(_1916, _1918, _1908);
    float _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5114, float3(0.0), isnan(_5114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5114, float3(0.0), isnan(_5114)), level(0.0)).x;
    float _1924 = -_1906;
    float _1926 = fma(_1920, _1924, 1.0);
    float3 _5130 = float3(_1916, _1918, _1908);
    float4 _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5130, float3(0.0), isnan(_5130)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5130, float3(0.0), isnan(_5130)), level(0.0)).xyzw;
    float _1931 = _1929.x;
    float _1933 = _1929.y;
    float _1935 = _1929.z;
    float _1937 = _1929.w;
    float2 _5147 = float2(_1926, _1910);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5147, float2(0.0), isnan(_5147)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5147, float2(0.0), isnan(_5147)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1951 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1953 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1951);
    float _1955 = exp2(_1949);
    float _1957 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1953);
    float _1959 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1957);
    float _1961 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1963 = _1959 + _1862;
    out.gl_Position.x = _1902;
    out.gl_Position.y = _1904;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1862;
    float _1965 = _1963 * 0.5;
    float _1967 = -_1955;
    float _1969 = _1967 + 1.0;
    out.m_47.x = _1961;
    float _1971 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _1965;
    out.m_71.w = _1862;
    float _1973 = -_1971;
    float _1975 = _1973 + 1.0;
    float _1977 = _1971 * _1922;
    float _1979 = _1937 * _1977;
    float _1981 = _1947 * _1977;
    float _1983 = fma(_1943, _1979, _1931);
    float _1985 = fma(_1945, _1979, _1933);
    float _1987 = _1937 * _1975;
    float _1989 = fma(_1937, _1981, _1935);
    out.m_73.x = _1983;
    out.m_73.y = _1985;
    out.m_73.z = _1989;
    out.m_73.w = _1987;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1568 = false;
    bool _798 = false;
    bool _618 = false;
    bool _468 = false;
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
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2045 = as_type<float>(_106);
        out.gl_Position.z = _2045;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_92);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    float _140 = 0.0;
    float _142 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _140;
    float _146 = _144;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _148 = _144 * 5.0;
        _108 = as_type<int>(_148);
    }
    int _150 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_150);
        out.gl_Position.z = _2116;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    float _158 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 0.0;
    float _172 = _158;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = 0.0;
    float _182 = _178;
    if (!_168)
    {
        float _184 = _124 * _124;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    if (!_168)
    {
        float _190 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _190;
    }
    float _192 = _182;
    bool _194 = !_168;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _158 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _158);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _146 = _216;
        _196 = _226;
        _142 = _214;
    }
    float _228 = _146;
    float _230 = _196;
    float _232 = _142;
    bool _234 = !_168;
    float _236 = _228;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _236 = _252;
        _238 = _246;
        _172 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _172;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _124;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _276;
    }
    float _278 = _268;
    bool _280 = !_168;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _124 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _124);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_168;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _124 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _342 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_264, _154, _272);
    float _346 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = fma(_338, _154, _340);
    float _350 = fma(_264, _152, _342);
    float _352 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_338, _156, _352);
    float _364 = fma(_264, _156, _354);
    float _366 = -_356;
    float _368 = _350 + _366;
    float _370 = _360 * _360;
    float _372 = in.m_51.w;
    float _374 = -_362;
    float _376 = _364 + _374;
    float _378 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = fma(_368, _368, _370);
    float _382 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _384 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = fma(_376, _376, _380);
    float _390 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _392 = in.m_44.x;
    float _394 = in.m_44.y;
    float _396 = in.m_44.z;
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _402 = sqrt(_388);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _390);
    float _406 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _398);
    bool _408 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_402);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_350, _372, _392);
    float _420 = fma(_344, _372, _394);
    float _422 = fma(_364, _372, _396);
    float _424 = _400;
    float _426 = _404;
    float _428 = _406;
    if (!_416)
    {
        bool _430 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _432 = !_430;
        if (!_432)
        {
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
            float _452 = _446 * _446;
            float _454 = fma(_448, _448, _452);
            float _456 = fma(_450, _450, _454);
            float _458 = rsqrt(_456);
            float _460 = _458 * 9.9999999747524270787835121154785e-07;
            float _462 = _448 * _460;
            float _464 = _446 * _460;
            float _466 = _450 * _460;
            _424 = _464;
            _426 = _462;
            _428 = _466;
            _468 = true;
        }
        else
        {
            float _470 = _154 * _154;
            float _472 = fma(_152, _152, _470);
            float _474 = fma(_156, _156, _472);
            float _476 = sqrt(_474);
            bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
            bool _480 = isnan(_476);
            bool _482 = _478 || _480;
            bool _484 = isnan(9.9999999747524270787835121154785e-07);
            bool _486 = _482 || _484;
            if (!_486)
            {
                float _488 = _394 * _394;
                float _490 = fma(_392, _392, _488);
                float _492 = fma(_396, _396, _490);
                float _494 = sqrt(_492);
                bool _496 = _494 >= 9.9999999747524270787835121154785e-07;
                bool _498 = isnan(_494);
                bool _500 = _496 || _498;
                bool _502 = isnan(9.9999999747524270787835121154785e-07);
                bool _504 = _500 || _502;
                if (!_504)
                {
                    float _506 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _508 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _506);
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _508);
                    float _512 = rsqrt(_510);
                    float _514 = _512 * 9.9999999747524270787835121154785e-07;
                    float _516 = _514 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _518 = _514 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _514 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _424 = _518;
                    _426 = _516;
                    _428 = _520;
                    _468 = true;
                }
                else
                {
                    float _522 = _394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _526 = _394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _528 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
                    float _530 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
                    float _534 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
                    float _536 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
                    float _538 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
                    float _540 = _534 * _534;
                    float _542 = fma(_536, _536, _540);
                    float _544 = fma(_538, _538, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _536 * _548;
                    float _552 = _534 * _548;
                    float _554 = _538 * _548;
                    _424 = _552;
                    _426 = _550;
                    _428 = _554;
                    _468 = true;
                }
            }
            else
            {
                float _556 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _558 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _560 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _562 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                float _564 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                float _568 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                float _570 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                float _574 = _568 * _568;
                float _576 = fma(_570, _570, _574);
                float _578 = fma(_572, _572, _576);
                float _580 = rsqrt(_578);
                float _582 = _580 * 9.9999999747524270787835121154785e-07;
                float _584 = _570 * _582;
                float _586 = _568 * _582;
                float _588 = _572 * _582;
                _424 = _586;
                _426 = _584;
                _428 = _588;
            }
        }
    }
    _468 = false;
    float _590 = _424;
    float _592 = _426;
    float _594 = _428;
    bool _596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _598 = !_596;
    float _616;
    if (!_598)
    {
        float _600 = in.m_53.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_92);
        float _622 = 1.0 / _620;
        float _624 = _124 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _630 = _626 + _628;
    bool _632 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _646 = _626 + _644;
    bool _648 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _650 = isnan(_626);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _668 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_642;
    float _682 = _680 + 1.0;
    float _684 = 1.0 / _666;
    float _686 = _678 * _682;
    float _688 = -_678;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _692;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _698 = 1.0 / _662;
    float _700 = _658 * _690;
    float _702 = -_658;
    float _704 = _702 + 1.0;
    float _706 = _646 * _684;
    float _708 = _630 * _698;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _714;
    float _718 = fma(_694, _708, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _720 = fma(_712, _708, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _722 = fma(_716, _708, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = _718 * _700;
    float _732 = _720 * _700;
    float _734 = _722 * _700;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].y, _732);
    float _750 = fma(_738, _706, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _752 = fma(_742, _706, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_746, _706, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _758 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].z, _734);
    float _760 = fma(_750, _686, _748);
    float _762 = fma(_752, _686, _756);
    float _764 = fma(_754, _686, _758);
    float _766 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].y, _760);
    float _768 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].x, _762);
    float _770 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[145].z, _764);
    float _772 = _766 * _726;
    float _774 = _768 * _724;
    float _776 = _770 * _728;
    bool _778 = !_696;
    float _796;
    if (!_778)
    {
        float _780 = in.m_53.x;
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _784 = _780 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _788 = _786 * _782;
        float _790 = floor(_788);
        float _792 = -_790;
        float _794 = _788 + _792;
        _796 = _794;
        _798 = true;
    }
    else
    {
        float _800 = float(_92);
        float _802 = 1.0 / _800;
        float _804 = _124 * _802;
        _796 = _804;
    }
    _798 = false;
    float _806 = _796;
    float _808 = in.m_55.y;
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _812 = in.m_53.y;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _816 = _814 != 0;
    float _818 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = in.m_53.z;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _828 = _826 != 0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _834 = _832 != 0;
    float _836 = in.m_53.w;
    float _838 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _840 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _844 = in.m_57.x;
    float _846 = in.m_57.y;
    float _848 = in.m_57.z;
    float _850 = in.m_53.x;
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _854 = -_808;
    float _856 = _854 + 1.0;
    float _858 = in.m_55.x;
    bool _860 = _812 > 0.5;
    float _862 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _864 = _824 > 0.5;
    int _866 = _860 ? as_type<int>(_856) : as_type<int>(_808);
    int _868 = _864 ? as_type<int>(_856) : as_type<int>(_808);
    bool _870 = _836 > 0.5;
    float _872 = _852 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _874 = _822 ? as_type<float>(_866) : _808;
    float _876 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = _828 ? as_type<float>(_868) : _808;
    float _880 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _882 = _808;
    bool _884 = _816;
    int _886 = as_type<int>(_862);
    if (_816)
    {
        float _888 = _870 ? _856 : _808;
        _882 = _888;
    }
    float _890 = _882;
    float _892 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _894 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _880);
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _898 = _896 != 0;
    float _900 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _904 = _902 != 0;
    float _906 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _892);
    float _908 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _906);
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _912 = _910 != 0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _922 = 1.0 / _916;
    float _924 = _812 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _848);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _844);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _936 = fma(_924, -2.0, _830);
    float _938 = 1.0 / _920;
    float _940 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _900);
    float _942 = _590 * _590;
    float _944 = -_932;
    float _946 = fma(_934, 2.0, _944);
    float _948 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _894);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _958 = fma(_592, _592, _942);
    float _960 = _818 * _930;
    float _962 = _952 * _922;
    float _964 = _838 * _926;
    float _966 = fma(_594, _594, _958);
    float _968 = _840 * _928;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _972 = _806 + _970;
    float _974 = _958;
    float _976 = _972;
    float _978 = _966;
    float _980 = _960;
    if (!_834)
    {
        _974 = _858;
    }
    float _982 = _974;
    float _984 = _956 * _938;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _988 = _806 + _986;
    float _990 = rsqrt(_966);
    float _992 = fma(_984, _972, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _994 = fma(_962, _988, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _996 = _810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _998 = _982;
    float _1000 = _994;
    if (!_834)
    {
        _976 = _982;
    }
    float _1002 = _976;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1010 = fma(_996, _874, -0.5);
    float _1012 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _936);
    float _1014 = _1002;
    if (_834)
    {
        _998 = _858;
    }
    float _1016 = _998;
    float _1018 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1008);
    bool _1020 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1022 = isnan(_806);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1004);
    float _1034 = _990 * _594;
    float _1036 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1018);
    float _1038 = _990 * _592;
    float _1040 = _990 * _590;
    float _1042 = -_1012;
    float _1044 = fma(_1036, _1010, _1042);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1048 = _1034 * _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1052 = _1040 * _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1056 = _1038 * _1054;
    float _1058 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1062 = -_1048;
    float _1064 = fma(_1038, _1060, _1062);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = -_1052;
    float _1070 = fma(_1034, _1066, _1068);
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1074 = -_1056;
    float _1076 = fma(_1040, _1072, _1074);
    float _1078 = fma(_878, _1058, -0.5);
    float _1080 = _1064 * _1064;
    bool _1082 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1084 = isnan(_806);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    int _1094 = 0;
    float _1096 = _1052;
    float _1098 = _1064;
    if (_898)
    {
        float _1100 = -_1016;
        float _1102 = _1100 + 1.0;
        _1094 = as_type<int>(_1102);
    }
    int _1104 = _1094;
    bool _1106 = _806 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1108 = isnan(_806);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = fma(_1070, _1070, _1080);
    if (_912)
    {
        _1096 = _850;
    }
    float _1120 = _1096;
    float _1122 = -_1092;
    float _1124 = _1122 + 1.0;
    float _1126 = _1120;
    if (!_912)
    {
        _1126 = _824;
    }
    float _1128 = _1126;
    float _1130 = fma(_1076, _1076, _1118);
    int _1132 = 0;
    if (_904)
    {
        float _1134 = -_1016;
        float _1136 = _1134 + 1.0;
        _1132 = as_type<int>(_1136);
    }
    int _1138 = _1132;
    float _1140 = _1116 * _1124;
    float _1142 = -_1116;
    float _1144 = _1142 + 1.0;
    if (_834)
    {
        bool _1146 = _850 > 0.5;
        _884 = _1146;
    }
    bool _1148 = _884;
    float _1150 = -_1030;
    float _1152 = _1150 + 1.0;
    float _1154 = rsqrt(_1130);
    float _1156 = _1030 * _1144;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1160 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1162 = fma(_862, _890, -0.5);
    float _1164 = _1158;
    if (_834)
    {
        float _1166 = -_1016;
        float _1168 = _1166 + 1.0;
        _886 = as_type<int>(_1168);
    }
    int _1170 = _886;
    float _1172 = _994 * _1156;
    float _1174 = -_1158;
    float _1176 = fma(_1160, 2.0, _1174);
    if (!_898)
    {
        _1000 = _1016;
    }
    float _1178 = _1000;
    float _1180 = _960 * _1040;
    float _1182 = _1178;
    if (!_904)
    {
        _1164 = _1016;
    }
    float _1184 = _1164;
    float _1186 = _960 * _1038;
    float _1188 = _1184;
    if (_834)
    {
        float _1190 = _1148 ? as_type<float>(_1170) : _1016;
        _1014 = _1190;
    }
    float _1192 = _1014;
    float _1194 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1172);
    if (_898)
    {
        float _1196 = _864 ? as_type<float>(_1104) : _1016;
        _1182 = _1196;
    }
    float _1198 = _1182;
    float _1200 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1202 = _1070 * _1154;
    float _1204 = _1064 * _1154;
    if (_904)
    {
        float _1206 = _860 ? as_type<float>(_1138) : _1016;
        _1188 = _1206;
    }
    float _1208 = _1188;
    float _1210 = _1076 * _1154;
    float _1212 = _1038 * _1204;
    if (!_912)
    {
        _978 = _812;
    }
    float _1214 = _978;
    float _1216 = fma(_968, _1202, _1186);
    float _1218 = _1214;
    if (_912)
    {
        _1218 = _850;
    }
    float _1220 = _1218;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1224 = -_1212;
    float _1226 = fma(_1040, _1202, _1224);
    float _1228 = _1040 * _1210;
    float _1230 = _960 * _1034;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1222);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1236 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1238 = fma(_968, _1210, _1230);
    float _1240 = -_1228;
    float _1242 = fma(_1034, _1204, _1240);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_912)
    {
        _980 = _824;
    }
    float _1246 = _980;
    float _1248 = -_1234;
    float _1250 = fma(_1236, 2.0, _1248);
    float _1252 = _1246;
    if (_912)
    {
        _1252 = _812;
    }
    float _1254 = _1252;
    float _1256 = fma(_964, _1226, _1238);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1260 = fma(_964, _1242, _1216);
    float _1262 = _908 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_912)
    {
        _1098 = _824;
    }
    float _1264 = _1098;
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    float _1268 = _1200 + _1256;
    float _1270 = _1262 + _1260;
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1274 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1276 = _1268 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1280 = _1270 + _1278;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1284 = _1276 * _1276;
    float _1286 = _1280 * _1280;
    float _1288 = _1264;
    float _1290 = _1286;
    float _1292 = _1284;
    float _1294 = _1270;
    float _1296 = _1268;
    if (_912)
    {
        _1288 = _812;
    }
    float _1298 = _1288;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_912)
    {
        _1244 = _812;
    }
    float _1302 = _1244;
    float _1304 = _1286 + _1284;
    float _1306 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1282);
    float _1308 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1310 = _1302;
    if (!_912)
    {
        _1310 = _850;
    }
    float _1312 = _1310;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1316 = _1034 * _1202;
    float _1318 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1320 = fma(_968, _1204, _1180);
    float _1322 = fma(_992, _1140, _1194);
    float _1324 = -_1316;
    float _1326 = fma(_1038, _1210, _1324);
    float _1328 = fma(_1318, _1192, -0.5);
    float _1330 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1306);
    float _1332 = sqrt(_1304);
    float _1334 = -_124;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    float _1338 = fma(_964, _1326, _1320);
    float _1340 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1342 = fma(_1330, _1328, _1336);
    float _1344 = -_124;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1176);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1350 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1352 = _1340 + _1338;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1358 = fma(_1350, _1208, -0.5);
    float _1360 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1308);
    float _1362 = fma(_872, _1198, -0.5);
    float _1364 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1232);
    bool _1366 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1368 = -_124;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1250);
    float _1372 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1374 = fma(_1360, _1358, _1346);
    float _1376 = fma(_1356, -2.0, _1354);
    float _1378 = fma(_1364, _1362, _1370);
    float _1380 = fma(_1372, -2.0, _1348);
    float _1382 = _1346;
    if (!_1366)
    {
        _1382 = _1352;
    }
    float _1384 = _1382;
    bool _1386 = !_1366;
    float _1388 = _1384;
    if (!_1386)
    {
        float _1390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1394 = _1332 + _1392;
        float _1396 = rsqrt(_1304);
        float _1398 = _1394 * _1390;
        float _1400 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = _1398 * 0.15915493667125701904296875;
        float _1404 = _1402 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        float _1408 = _1402 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = fma(_1406, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1414 = _1396 * _1412;
        float _1416 = _1410 + (-1.0);
        float _1418 = fma(_1280, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1420 = fma(_1276, _1414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1422 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1426 = _1418 + _1424;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1430 = _1420 + _1428;
        float _1432 = fma(_1352, _1410, _1422);
        float _1434 = _1426 * _1426;
        float _1436 = _1430 * _1430;
        _1388 = _1432;
        _1290 = _1434;
        _1292 = _1436;
        _1294 = _1418;
        _1296 = _1420;
    }
    float _1438 = _1388;
    float _1440 = _1290;
    float _1442 = _1292;
    float _1444 = _1294;
    float _1446 = _1296;
    float _1448 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1032);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1452 = _1438 + _1450;
    float _1454 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1266);
    float _1456 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1376);
    float _1458 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1380);
    float _1460 = fma(_1452, _1452, _1440);
    float _1462 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1322);
    float _1464 = in.m_59.w;
    float _1466 = -_1456;
    float _1468 = fma(_1454, _1162, _1466);
    float _1470 = _1460 + _1442;
    float _1472 = -_1458;
    float _1474 = fma(_1448, _1078, _1472);
    float _1476 = _1044 + 0.5;
    float _1478 = _1374 + 0.5;
    float _1480 = sqrt(_1470);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1510 = _1342 + 0.5;
    float _1512 = _1378 + 0.5;
    float _1514 = _1468 + 0.5;
    float _1516 = _1474 + 0.5;
    out.m_61.w = _1464;
    bool _1518 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1520 = isnan(_1480);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1526 = _1522 || _1524;
    out.m_63.x = _1502;
    out.m_63.y = _1504;
    out.m_63.z = _1506;
    out.m_63.w = _1496;
    out.m_65.x = _1494;
    out.m_65.y = _1498;
    out.m_65.z = _1500;
    out.m_65.w = _1508;
    out.m_67.x = _1510;
    out.m_67.y = _1476;
    out.m_67.z = _1512;
    out.m_67.w = _1514;
    float _1528 = _1498;
    float _1530 = _1500;
    float _1532 = _1454;
    if (!_1526)
    {
        _128 = 1.0;
    }
    float _1534 = _128;
    out.m_69.x = _1478;
    out.m_69.y = _1516;
    bool _1536 = !_1526;
    float _1538 = _1534;
    if (!_1536)
    {
        bool _1540 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1542 = isnan(_1480);
        bool _1544 = _1540 || _1542;
        bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1548 = _1544 || _1546;
        if (!_1548)
        {
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = _1480 + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1556 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1554;
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1562 = 1.0 / _1556;
            float _1564 = _1552 * _1562;
            float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1538 = _1566;
            _1568 = true;
        }
        else
        {
            bool _1570 = _1480 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1572 = isnan(_1480);
            bool _1574 = _1570 || _1572;
            bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1578 = _1574 || _1576;
            if (!_1578)
            {
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1480 + _1580;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1590 = _1588 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1592 = 1.0 / _1586;
                float _1594 = _1582 * _1592;
                float _1596 = fma(_1594, _1590, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1538 = _1596;
                _1568 = true;
            }
            else
            {
                _1538 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1568 = false;
    float _1598 = _1538;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1602 = _1438 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1606 = _1444 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1610 = _1446 + _1608;
    float _1612 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1614 = fma(_1606, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1616 = fma(_1610, _1598, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1620 = _1612 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1614 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1616 + _1626;
    float _1630 = _1620 * _1620;
    float _1632 = fma(_1624, _1624, _1630);
    float _1634 = fma(_1628, _1628, _1632);
    float _1636 = rsqrt(_1634);
    float _1638 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1640 = _1624 * _1638;
    float _1642 = _1628 * _1638;
    float _1644 = _1640 * _1640;
    float _1646 = _1642 * _1642;
    float _1648 = _1644 + _1646;
    float _1650 = sqrt(_1648);
    bool _1652 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1656 = _1650 + _1654;
    float _1658 = _1628;
    float _1660 = _1656;
    float _1662 = _1620;
    float _1664 = _1640;
    if (_1652)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1658 = _1666;
    }
    float _1668 = _1658;
    if (_1652)
    {
        float _1670 = rsqrt(_1648);
        _1528 = _1670;
    }
    float _1672 = _1528;
    float _1674 = _1672;
    if (_1652)
    {
        float _1676 = _1656 * _1668;
        _1660 = _1676;
    }
    float _1678 = _1660;
    if (_1652)
    {
        float _1680 = _1678 * 0.15915493667125701904296875;
        _1530 = _1680;
    }
    float _1682 = _1530;
    float _1684 = _1630;
    if (_1652)
    {
        float _1686 = _1682 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1694 = precise::max(0.0, _1692);
    float _1696 = _1636;
    float _1698 = _1694;
    float _1700 = _1692;
    if (_1652)
    {
        float _1702 = _1682 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        _1696 = _1704;
    }
    float _1706 = _1696;
    float _1708 = -_1638;
    float _1710 = -_1694;
    float _1712 = fma(_1620, _1708, _1710);
    if (!_1652)
    {
        _1698 = _1642;
    }
    float _1714 = _1698;
    float _1716 = _1714;
    if (_1652)
    {
        float _1718 = _1712 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1718;
    }
    float _1720 = _1700;
    float _1722 = sqrt(_1634);
    float _1724 = _1690;
    float _1726 = _1720;
    if (_1652)
    {
        float _1728 = fma(_1690, _1720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1662 = _1728;
    }
    float _1730 = _1662;
    float _1732 = _1730;
    if (!_1652)
    {
        _1724 = _1712;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (_1652)
    {
        float _1738 = _1706 + (-1.0);
        _1726 = _1738;
    }
    float _1740 = _1726;
    float _1742 = _1740;
    if (_1652)
    {
        float _1744 = _1672 * _1730;
        _1532 = _1744;
    }
    float _1746 = _1532;
    if (!_1652)
    {
        _1732 = _1646;
    }
    float _1748 = _1732;
    float _1750 = _1748;
    if (_1652)
    {
        float _1752 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1752;
    }
    float _1754 = _1674;
    if (_1652)
    {
        float _1756 = _1640 * _1746;
        _1664 = _1756;
    }
    float _1758 = _1664;
    if (!_1652)
    {
        _1742 = _1644;
    }
    float _1760 = _1742;
    float _1762 = _1760;
    if (_1652)
    {
        float _1764 = _1642 * _1746;
        _1716 = _1764;
    }
    float _1766 = _1716;
    if (_1652)
    {
        float _1768 = fma(_1712, _1706, _1754);
        _1736 = _1768;
    }
    float _1770 = _1736;
    if (_1652)
    {
        float _1772 = _1758 * _1758;
        _1762 = _1772;
    }
    float _1774 = _1762;
    if (_1652)
    {
        float _1776 = _1766 * _1766;
        _1750 = _1776;
    }
    float _1778 = _1750;
    float _1780 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1782 = fma(_1770, _1770, _1774);
    float _1784 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1788 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1786);
    float _1790 = precise::clamp(_1788, 0.0, 1.0);
    float _1792 = _1782 + _1778;
    float _1794 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1784);
    float _1796 = -_1790;
    float _1798 = _1796 + 1.0;
    float _1800 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1802 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1794);
    float _1806 = rsqrt(_1792);
    float _1808 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1810 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1812 = _1804 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1814 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1780);
    float _1816 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1808);
    float _1818 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1820 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1822 = abs(_1798);
    float _1824 = log2(_1822);
    float _1826 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1814);
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = -_1820;
    float _1832 = fma(_1830, _1810, 1.0);
    float _1834 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1818);
    float _1836 = _1826 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1840 = _1806 * _1758;
    float _1842 = _1806 * _1770;
    float _1844 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1838);
    float _1846 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1806 * _1766;
    float _1852 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1854 = log2(_1832);
    float _1856 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1858 = -_1848;
    float _1860 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1852);
    float _1864 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1866 = -_1850;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1872 = exp2(_1856);
    float _1874 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1864);
    float _1876 = fma(_1868, -0.5, 0.5);
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1870);
    float _1880 = fma(_1868, 0.5, 0.5);
    float _1882 = _1842 + 1.0;
    float _1884 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1886 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1888 = 1.0 / _1862;
    float _1890 = fma(_1880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = _1854 * 0.693147182464599609375;
    float _1894 = fma(_1880, _1890, -0.212114393711090087890625);
    float _1896 = sqrt(_1876);
    float _1898 = -_1842;
    float _1900 = fma(_1872, _1882, _1898);
    float _1902 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1886);
    float _1904 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1884);
    float _1906 = fma(_1880, _1894, 1.570728778839111328125);
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1910 = fma(_1900, 0.5, 0.5);
    float _1912 = _1902 * _1888;
    float _1914 = _1904 * _1888;
    float _1916 = fma(_1912, 0.5, 0.5);
    float _1918 = fma(_1914, -0.5, 0.5);
    float _1920 = _1896 * 0.636619746685028076171875;
    float3 _5114 = float3(_1916, _1918, _1908);
    float _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5114, float3(0.0), isnan(_5114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5114, float3(0.0), isnan(_5114)), level(0.0)).x;
    float _1924 = -_1906;
    float _1926 = fma(_1920, _1924, 1.0);
    float3 _5130 = float3(_1916, _1918, _1908);
    float4 _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5130, float3(0.0), isnan(_5130)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5130, float3(0.0), isnan(_5130)), level(0.0)).xyzw;
    float _1931 = _1929.x;
    float _1933 = _1929.y;
    float _1935 = _1929.z;
    float _1937 = _1929.w;
    float2 _5147 = float2(_1926, _1910);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5147, float2(0.0), isnan(_5147)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5147, float2(0.0), isnan(_5147)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1951 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1953 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1951);
    float _1955 = exp2(_1949);
    float _1957 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1953);
    float _1959 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1957);
    float _1961 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1963 = _1959 + _1862;
    out.gl_Position.x = _1902;
    out.gl_Position.y = _1904;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1862;
    float _1965 = _1963 * 0.5;
    float _1967 = -_1955;
    float _1969 = _1967 + 1.0;
    out.m_47.x = _1961;
    float _1971 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _1965;
    out.m_71.w = _1862;
    float _1973 = -_1971;
    float _1975 = _1973 + 1.0;
    float _1977 = _1971 * _1922;
    float _1979 = _1937 * _1977;
    float _1981 = _1947 * _1977;
    float _1983 = fma(_1943, _1979, _1931);
    float _1985 = fma(_1945, _1979, _1933);
    float _1987 = _1937 * _1975;
    float _1989 = fma(_1937, _1981, _1935);
    out.m_73.x = _1983;
    out.m_73.y = _1985;
    out.m_73.z = _1989;
    out.m_73.w = _1987;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

