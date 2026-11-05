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
    bool _1572 = false;
    bool _804 = false;
    bool _624 = false;
    bool _472 = false;
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
        float _2167 = as_type<float>(_106);
        out.gl_Position.z = _2167;
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
        float _2238 = as_type<float>(_150);
        out.gl_Position.z = _2238;
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
    float _424 = _372;
    float _426 = _404;
    float _428 = _406;
    if (_416)
    {
        _424 = _400;
    }
    float _430 = _424;
    float _432 = _430;
    if (!_416)
    {
        bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _436 = !_434;
        if (!_436)
        {
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _442 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
            float _456 = _450 * _450;
            float _458 = fma(_452, _452, _456);
            float _460 = fma(_454, _454, _458);
            float _462 = rsqrt(_460);
            float _464 = _462 * 9.9999999747524270787835121154785e-07;
            float _466 = _452 * _464;
            float _468 = _450 * _464;
            float _470 = _454 * _464;
            _432 = _468;
            _426 = _466;
            _428 = _470;
            _472 = true;
        }
        else
        {
            float _474 = _154 * _154;
            float _476 = fma(_152, _152, _474);
            float _478 = fma(_156, _156, _476);
            float _480 = sqrt(_478);
            bool _482 = _480 >= 9.9999999747524270787835121154785e-07;
            bool _484 = isnan(_480);
            bool _486 = _482 || _484;
            bool _488 = isnan(9.9999999747524270787835121154785e-07);
            bool _490 = _486 || _488;
            if (!_490)
            {
                float _492 = _394 * _394;
                float _494 = fma(_392, _392, _492);
                float _496 = fma(_396, _396, _494);
                float _498 = sqrt(_496);
                bool _500 = _498 >= 9.9999999747524270787835121154785e-07;
                bool _502 = isnan(_498);
                bool _504 = _500 || _502;
                bool _506 = isnan(9.9999999747524270787835121154785e-07);
                bool _508 = _504 || _506;
                if (!_508)
                {
                    float _510 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _510);
                    float _514 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _512);
                    float _516 = rsqrt(_514);
                    float _518 = _516 * 9.9999999747524270787835121154785e-07;
                    float _520 = _518 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _518 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _518 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _432 = _522;
                    _426 = _520;
                    _428 = _524;
                    _472 = true;
                }
                else
                {
                    float _526 = _394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _528 = _394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _530 = _394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _530);
                    float _538 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
                    float _540 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
                    float _542 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
                    float _544 = _538 * _538;
                    float _546 = fma(_540, _540, _544);
                    float _548 = fma(_542, _542, _546);
                    float _550 = rsqrt(_548);
                    float _552 = _550 * 9.9999999747524270787835121154785e-07;
                    float _554 = _540 * _552;
                    float _556 = _538 * _552;
                    float _558 = _542 * _552;
                    _432 = _556;
                    _426 = _554;
                    _428 = _558;
                    _472 = true;
                }
            }
            else
            {
                float _560 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _562 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _564 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _560);
                float _568 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _562);
                float _570 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _564);
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _566);
                float _574 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
                float _576 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _570);
                float _578 = _572 * _572;
                float _580 = fma(_574, _574, _578);
                float _582 = fma(_576, _576, _580);
                float _584 = rsqrt(_582);
                float _586 = _584 * 9.9999999747524270787835121154785e-07;
                float _588 = _574 * _586;
                float _590 = _572 * _586;
                float _592 = _576 * _586;
                _432 = _590;
                _426 = _588;
                _428 = _592;
            }
        }
    }
    _472 = false;
    float _594 = _432;
    float _596 = _426;
    float _598 = _428;
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _602 = !_600;
    float _604 = _596;
    float _622;
    if (!_602)
    {
        float _606 = in.m_53.x;
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _610 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_92);
        float _628 = 1.0 / _626;
        float _630 = _124 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _632 + _634;
    bool _638 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _640 = isnan(_632);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _652 = _632 + _650;
    bool _654 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _656 = isnan(_632);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _674 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _676 = isnan(_632);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _672;
    float _688 = -_684;
    float _690 = _688 + 1.0;
    bool _692 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _694 = _664 * _690;
    float _696 = -_664;
    float _698 = _696 + 1.0;
    float _700 = 1.0 / _668;
    float _702 = _652 * _686;
    float _704 = _636 * _700;
    float _706 = -_648;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _710;
    float _714 = _684 * _708;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _720;
    float _724 = fma(_712, _704, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _726 = fma(_718, _704, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _728 = fma(_722, _704, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _730 = in.m_51.x;
    float _732 = in.m_51.y;
    float _734 = in.m_51.z;
    float _736 = _724 * _694;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = _728 * _694;
    float _744 = _726 * _694;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _754 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].x, _742);
    float _756 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].y, _736);
    float _758 = fma(_748, _702, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _760 = fma(_740, _702, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _762 = fma(_752, _702, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _764 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].z, _744);
    float _766 = fma(_758, _714, _754);
    float _768 = fma(_760, _714, _756);
    float _770 = fma(_762, _714, _764);
    float _772 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].x, _766);
    float _774 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    float _776 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].z, _770);
    float _778 = _772 * _730;
    float _780 = _774 * _732;
    float _782 = _776 * _734;
    bool _784 = !_692;
    float _802;
    if (!_784)
    {
        float _786 = in.m_53.x;
        float _788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _790 = _786 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _794 = _792 * _788;
        float _796 = floor(_794);
        float _798 = -_796;
        float _800 = _794 + _798;
        _802 = _800;
        _804 = true;
    }
    else
    {
        float _806 = float(_92);
        float _808 = 1.0 / _806;
        float _810 = _124 * _808;
        _802 = _810;
    }
    _804 = false;
    float _812 = _802;
    float _814 = in.m_53.w;
    float _816 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _818 = in.m_55.y;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _822 = _820 != 0;
    float _824 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _816);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _828 = _826 != 0;
    float _830 = in.m_53.y;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _834 = _832 != 0;
    float _836 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _840 = _838 != 0;
    float _842 = in.m_53.z;
    float _844 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _848 = in.m_57.x;
    float _850 = in.m_57.y;
    float _852 = in.m_57.z;
    float _854 = in.m_53.x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _860 = _814 > 0.5;
    float _862 = in.m_55.x;
    float _864 = -_818;
    float _866 = _864 + 1.0;
    float _868 = _846 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _872 = _830 > 0.5;
    bool _874 = _842 > 0.5;
    int _876 = _872 ? as_type<int>(_866) : as_type<int>(_818);
    float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _880 = _874 ? as_type<int>(_866) : as_type<int>(_818);
    float _882 = _828 ? as_type<float>(_876) : _818;
    float _884 = _834 ? as_type<float>(_880) : _818;
    float _886 = _818;
    bool _888 = _822;
    if (_822)
    {
        float _890 = _860 ? _866 : _818;
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _896 = _894 != 0;
    float _898 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _902 = _900 != 0;
    float _904 = fma(_884, _868, -0.5);
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _908 = _906 != 0;
    float _910 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _912 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    float _914 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _916 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _850);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _848);
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _932 = _830 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _936 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _938 = 1.0 / _924;
    float _940 = fma(_932, -2.0, _930);
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _852);
    float _944 = -_934;
    float _946 = fma(_936, 2.0, _944);
    float _948 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _950 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _916);
    float _952 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _824);
    float _954 = _594 * _594;
    float _956 = 1.0 / _920;
    float _958 = _948 * _928;
    float _960 = _836 * _926;
    float _962 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _912);
    float _964 = fma(_596, _596, _954);
    float _966 = _844 * _942;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _970 = _812 + _968;
    float _972 = _954;
    float _974 = _970;
    if (!_840)
    {
        _972 = _862;
    }
    float _976 = _972;
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _980 = fma(_598, _598, _964);
    bool _982 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _984 = isnan(_812);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _940);
    float _996 = _976;
    float _998 = _980;
    if (_840)
    {
        bool _1000 = _854 > 0.5;
        _888 = _1000;
    }
    bool _1002 = _888;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1012 = rsqrt(_980);
    float _1014 = -_992;
    float _1016 = _1014 + 1.0;
    float _1018 = _1006 * _956;
    float _1020 = _1010 * _938;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1024 = _812 + _1022;
    float _1026 = fma(_1018, _970, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1028 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1030 = isnan(_812);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = fma(_1020, _1024, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _978 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_840)
    {
        _974 = _976;
    }
    float _1046 = _974;
    float _1048 = fma(_1042, _882, -0.5);
    bool _1050 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1052 = isnan(_812);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1038;
    float _1064 = _1062 + 1.0;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1068 = _1046;
    if (_840)
    {
        _996 = _862;
    }
    float _1070 = _996;
    float _1072 = _1012 * _598;
    float _1074 = _1060 * _1064;
    float _1076 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1066);
    float _1078 = -_1060;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1044);
    float _1084 = _1012 * _594;
    float _1086 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1076);
    float _1088 = _992 * _1080;
    float _1090 = _1012 * _596;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1094 = _1072 * _1092;
    float _1096 = -_994;
    float _1098 = fma(_1086, _1048, _1096);
    float _1100 = _1026 * _1088;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1104 = _1084 * _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1108 = -_1094;
    float _1110 = fma(_1090, _1106, _1108);
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1114 = _1090 * _1112;
    float _1116 = _858 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1120 = -_1104;
    float _1122 = fma(_1072, _1118, _1120);
    float _1124 = _1110 * _1110;
    float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1128 = -_1114;
    float _1130 = fma(_1084, _1126, _1128);
    float _1132 = _1070;
    if (_896)
    {
        _604 = _854;
    }
    float _1134 = _604;
    int _1136 = 0;
    float _1138 = _1134;
    if (_902)
    {
        float _1140 = -_1070;
        float _1142 = _1140 + 1.0;
        _1136 = as_type<int>(_1142);
    }
    int _1144 = _1136;
    float _1146 = fma(_1122, _1122, _1124);
    int _1148 = 0;
    if (_908)
    {
        float _1150 = -_1070;
        float _1152 = _1150 + 1.0;
        _1148 = as_type<int>(_1152);
    }
    int _1154 = _1148;
    if (!_896)
    {
        _1138 = _842;
    }
    float _1156 = _1138;
    float _1158 = fma(_1130, _1130, _1146);
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1162 = _1160;
    if (!_896)
    {
        _998 = _830;
    }
    float _1164 = _998;
    float _1166 = rsqrt(_1158);
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1170 = _1164;
    int _1172 = as_type<int>(_1168);
    if (_896)
    {
        _1170 = _854;
    }
    float _1174 = _1170;
    float _1176 = fma(_1116, _892, -0.5);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1180 = -_1160;
    float _1182 = fma(_1168, 2.0, _1180);
    if (_840)
    {
        float _1184 = -_1070;
        float _1186 = _1184 + 1.0;
        _1172 = as_type<int>(_1186);
    }
    int _1188 = _1172;
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1178);
    float _1192 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1196 = _1192;
    if (!_902)
    {
        _1162 = _1070;
    }
    float _1198 = _1162;
    float _1200 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1100);
    float _1202 = _1198;
    if (_840)
    {
        float _1204 = _1002 ? as_type<float>(_1188) : _1070;
        _1068 = _1204;
    }
    float _1206 = _1068;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_908)
    {
        _1194 = _1070;
    }
    float _1210 = _1194;
    float _1212 = _950 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1214 = _1110 * _1166;
    float _1216 = _1122 * _1166;
    float _1218 = _1130 * _1166;
    float _1220 = _1210;
    if (_902)
    {
        float _1222 = _874 ? as_type<float>(_1144) : _1070;
        _1202 = _1222;
    }
    float _1224 = _1202;
    float _1226 = _1090 * _1214;
    if (_908)
    {
        float _1228 = _872 ? as_type<float>(_1154) : _1070;
        _1220 = _1228;
    }
    float _1230 = _1220;
    float _1232 = _960 * _1084;
    float _1234 = _960 * _1090;
    float _1236 = -_1226;
    float _1238 = fma(_1084, _1216, _1236);
    float _1240 = _1084 * _1218;
    float _1242 = _960 * _1072;
    float _1244 = fma(_958, _1216, _1234);
    float _1246 = -_1240;
    float _1248 = fma(_1072, _1214, _1246);
    float _1250 = fma(_958, _1218, _1242);
    float _1252 = _952 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_896)
    {
        _1132 = _842;
    }
    float _1254 = _1132;
    float _1256 = fma(_966, _1248, _1244);
    float _1258 = fma(_966, _1238, _1250);
    float _1260 = _1254;
    if (_896)
    {
        _1260 = _830;
    }
    float _1262 = _1260;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1266 = _1212 + _1256;
    float _1268 = _1252 + _1258;
    float _1270 = 0.0;
    float _1272 = _1266;
    float _1274 = _1268;
    if (!_896)
    {
        _1270 = _842;
    }
    float _1276 = _1270;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1264);
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1266 + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1286 = _1268 + _1284;
    float _1288 = -_1208;
    float _1290 = fma(_1192, 2.0, _1288);
    float _1292 = _1282 * _1282;
    float _1294 = _1286 * _1286;
    float _1296 = _1276;
    float _1298 = _1292;
    float _1300 = _1294;
    if (_896)
    {
        _1296 = _830;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_896)
    {
        _1196 = _830;
    }
    float _1306 = _1196;
    float _1308 = _1292 + _1294;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1312 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1304);
    float _1314 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].z, _856);
    float _1316 = _1306;
    if (!_896)
    {
        _1316 = _854;
    }
    float _1318 = _1316;
    float _1320 = fma(_1040, _1074, _1200);
    float _1322 = _1072 * _1216;
    float _1324 = fma(_958, _1214, _1232);
    float _1326 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1312);
    float _1328 = sqrt(_1308);
    float _1330 = -_124;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    float _1334 = -_1322;
    float _1336 = fma(_1090, _1218, _1334);
    float _1338 = _870 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1340 = _962 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1342 = fma(_914, _1224, -0.5);
    float _1344 = fma(_1338, _1230, -0.5);
    float _1346 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1348 = -_124;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1290);
    float _1352 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1190);
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = fma(_1346, _1206, -0.5);
    float _1358 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1360 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1314);
    float _1362 = fma(_1352, _1342, _1350);
    bool _1364 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = fma(_1326, _1356, _1332);
    float _1368 = fma(_966, _1336, _1324);
    float _1370 = -_124;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1376 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1378 = _1340 + _1368;
    float _1380 = fma(_1358, -2.0, _1354);
    float _1382 = fma(_1360, _1344, _1372);
    float _1384 = fma(_1376, -2.0, _1374);
    float _1386 = _1352;
    if (!_1364)
    {
        _1386 = _1378;
    }
    float _1388 = _1386;
    bool _1390 = !_1364;
    float _1392 = _1388;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1328 + _1396;
        float _1400 = _1378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1308);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = sin(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = fma(_1410, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1418 = _1402 * _1416;
        float _1420 = fma(_1282, _1418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1422 = _1414 + (-1.0);
        float _1424 = fma(_1286, _1418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1428 = _1420 + _1426;
        float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1434 = _1424 + _1432;
        float _1436 = _1428 * _1428;
        float _1438 = fma(_1378, _1414, _1430);
        float _1440 = _1434 * _1434;
        _1392 = _1438;
        _1298 = _1436;
        _1300 = _1440;
        _1272 = _1420;
        _1274 = _1424;
    }
    float _1442 = _1392;
    float _1444 = _1298;
    float _1446 = _1300;
    float _1448 = _1272;
    float _1450 = _1274;
    float _1452 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1380);
    float _1454 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1278);
    float _1456 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1082);
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1460 = _1442 + _1458;
    float _1462 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1384);
    float _1464 = -_1452;
    float _1466 = fma(_1454, _1176, _1464);
    float _1468 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1320);
    float _1470 = in.m_59.w;
    float _1472 = fma(_1460, _1460, _1444);
    float _1474 = -_1462;
    float _1476 = fma(_1456, _904, _1474);
    float _1478 = _1366 + 0.5;
    float _1480 = _1472 + _1446;
    float _1482 = _1098 + 0.5;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1486 = sqrt(_1480);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1382 + 0.5;
    float _1514 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1516 = _1362 + 0.5;
    float _1518 = _1466 + 0.5;
    float _1520 = _1476 + 0.5;
    out.m_61.w = _1470;
    bool _1522 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1524 = isnan(_1486);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1530 = _1526 || _1528;
    out.m_63.x = _1506;
    out.m_63.y = _1508;
    out.m_63.z = _1510;
    out.m_63.w = _1500;
    out.m_65.x = _1498;
    out.m_65.y = _1502;
    out.m_65.z = _1504;
    out.m_65.w = _1514;
    out.m_67.x = _1478;
    out.m_67.y = _1482;
    out.m_67.z = _1516;
    out.m_67.w = _1518;
    float _1532 = _1506;
    float _1534 = _1508;
    float _1536 = _1482;
    if (!_1530)
    {
        _128 = 1.0;
    }
    float _1538 = _128;
    out.m_69.x = _1512;
    out.m_69.y = _1520;
    bool _1540 = !_1530;
    float _1542 = _1538;
    if (!_1540)
    {
        bool _1544 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1546 = isnan(_1486);
        bool _1548 = _1544 || _1546;
        bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1552 = _1548 || _1550;
        if (!_1552)
        {
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1556 = _1486 + _1554;
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1564 = _1562 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1566 = 1.0 / _1560;
            float _1568 = _1556 * _1566;
            float _1570 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1542 = _1570;
            _1572 = true;
        }
        else
        {
            bool _1574 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1576 = isnan(_1486);
            bool _1578 = _1574 || _1576;
            bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1582 = _1578 || _1580;
            if (!_1582)
            {
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1586 = _1486 + _1584;
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1588 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1596 = 1.0 / _1590;
                float _1598 = _1586 * _1596;
                float _1600 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1542 = _1600;
                _1572 = true;
            }
            else
            {
                _1542 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1572 = false;
    float _1602 = _1542;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1606 = _1442 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1610 = _1448 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1614 = _1450 + _1612;
    float _1616 = fma(_1606, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1618 = fma(_1610, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1620 = fma(_1614, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1616 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1618 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1620 + _1630;
    float _1634 = _1624 * _1624;
    float _1636 = fma(_1628, _1628, _1634);
    float _1638 = fma(_1632, _1632, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1644 = _1628 * _1642;
    float _1646 = _1632 * _1642;
    float _1648 = _1644 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 + _1650;
    float _1654 = sqrt(_1652);
    bool _1656 = _1654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = _1654 + _1658;
    float _1662 = _1632;
    float _1664 = _1660;
    float _1666 = _1624;
    if (_1656)
    {
        float _1668 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1668;
    }
    float _1670 = _1662;
    if (_1656)
    {
        float _1672 = rsqrt(_1652);
        _1532 = _1672;
    }
    float _1674 = _1532;
    float _1676 = _1674;
    if (_1656)
    {
        float _1678 = _1660 * _1670;
        _1664 = _1678;
    }
    float _1680 = _1664;
    if (_1656)
    {
        float _1682 = _1680 * 0.15915493667125701904296875;
        _1534 = _1682;
    }
    float _1684 = _1534;
    float _1686 = _1640;
    if (_1656)
    {
        float _1688 = _1684 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        _1686 = _1690;
    }
    float _1692 = _1686;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = precise::max(0.0, _1694);
    float _1698 = _1636;
    float _1700 = _1696;
    float _1702 = _1694;
    if (_1656)
    {
        float _1704 = _1684 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        _1698 = _1706;
    }
    float _1708 = _1698;
    float _1710 = -_1642;
    float _1712 = -_1696;
    float _1714 = fma(_1624, _1710, _1712);
    if (!_1656)
    {
        _1700 = _1648;
    }
    float _1716 = _1700;
    float _1718 = _1716;
    if (_1656)
    {
        float _1720 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1720;
    }
    float _1722 = _1702;
    float _1724 = sqrt(_1638);
    float _1726 = _1692;
    float _1728 = _1722;
    if (_1656)
    {
        float _1730 = fma(_1692, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1666 = _1730;
    }
    float _1732 = _1666;
    float _1734 = _1732;
    if (!_1656)
    {
        _1726 = _1644;
    }
    float _1736 = _1726;
    float _1738 = _1736;
    float _1740 = _1708;
    if (_1656)
    {
        float _1742 = _1708 + (-1.0);
        _1728 = _1742;
    }
    float _1744 = _1728;
    float _1746 = _1744;
    if (_1656)
    {
        float _1748 = _1674 * _1732;
        _1536 = _1748;
    }
    float _1750 = _1536;
    if (!_1656)
    {
        _1734 = _1714;
    }
    float _1752 = _1734;
    float _1754 = _1752;
    if (_1656)
    {
        float _1756 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1756;
    }
    float _1758 = _1676;
    if (_1656)
    {
        float _1760 = _1644 * _1750;
        _1738 = _1760;
    }
    float _1762 = _1738;
    if (!_1656)
    {
        _1746 = _1646;
    }
    float _1764 = _1746;
    float _1766 = _1764;
    if (_1656)
    {
        float _1768 = _1646 * _1750;
        _1766 = _1768;
    }
    float _1770 = _1766;
    if (_1656)
    {
        float _1772 = fma(_1714, _1708, _1758);
        _1754 = _1772;
    }
    float _1774 = _1754;
    if (_1656)
    {
        float _1776 = _1762 * _1762;
        _1718 = _1776;
    }
    float _1778 = _1718;
    if (!_1656)
    {
        _1740 = _1650;
    }
    float _1780 = _1740;
    float _1782 = _1780;
    if (_1656)
    {
        float _1784 = _1770 * _1770;
        _1782 = _1784;
    }
    float _1786 = _1782;
    float _1788 = fma(_1774, _1774, _1778);
    float _1790 = _1788 + _1786;
    float _1792 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1802 = rsqrt(_1790);
    float _1804 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = -_1798;
    float _1808 = _1806 + 1.0;
    float _1810 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1814 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1816 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    float _1822 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1824 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1826 = abs(_1808);
    float _1828 = log2(_1826);
    float _1830 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1832 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1834 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1824);
    float _1836 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1838 = _1802 * _1762;
    float _1840 = _1802 * _1774;
    float _1842 = -_1832;
    float _1844 = fma(_1842, _1812, 1.0);
    float _1846 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1848 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1854 = _1802 * _1770;
    float _1856 = -_1848;
    float _1858 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1862 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1852);
    float _1864 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1866 = -_1854;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1870 = log2(_1844);
    float _1872 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1862);
    float _1874 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1876 = fma(_1868, -0.5, 0.5);
    float _1878 = fma(_1868, 0.5, 0.5);
    float _1880 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1872);
    float _1882 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1874);
    float _1884 = _1840 + 1.0;
    float _1886 = exp2(_1864);
    float _1888 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1890 = fma(_1878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1882);
    float _1894 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1888);
    float _1896 = fma(_1878, _1890, -0.212114393711090087890625);
    float _1898 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1892);
    float _1900 = 1.0 / _1880;
    float _1902 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1894);
    float _1904 = _1870 * 0.693147182464599609375;
    float _1906 = fma(_1878, _1896, 1.570728778839111328125);
    float _1908 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1902);
    float _1910 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1912 = sqrt(_1876);
    float _1914 = -_1840;
    float _1916 = fma(_1886, _1884, _1914);
    float _1918 = fma(_1916, 0.5, 0.5);
    float _1920 = _1898 * _1900;
    float _1922 = _1908 * _1900;
    float _1924 = fma(_1920, 0.5, 0.5);
    float _1926 = fma(_1922, -0.5, 0.5);
    float _1928 = _1912 * 0.636619746685028076171875;
    float _1930 = -_1906;
    float _1932 = fma(_1928, _1930, 1.0);
    float3 _5253 = float3(_1924, _1926, _1910);
    float _1934 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5253, float3(0.0), isnan(_5253)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5253, float3(0.0), isnan(_5253)), level(0.0)).x;
    float3 _5264 = float3(_1924, _1926, _1910);
    float4 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5264, float3(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5264, float3(0.0), isnan(_5264)), level(0.0)).xyzw;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _1937.w;
    float2 _5281 = float2(_1932, _1918);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5281, float2(0.0), isnan(_5281)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5281, float2(0.0), isnan(_5281)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1959 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1961 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1963 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1957);
    float _1965 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1959);
    float _1967 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1969 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1963);
    float _1971 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1965);
    float _1973 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1967);
    float _1975 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1977 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1979 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1981 = 1.0 / _1975;
    bool _1983 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    float _1993 = _1977 + _1975;
    float _1995 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1979);
    float _1997 = exp2(_1961);
    float _1999 = _1822;
    if (_1991)
    {
        _1999 = 1.0;
    }
    float _2001 = _1999;
    float _2003 = _1993 * _1981;
    float _2005 = _2003 * 0.5;
    float _2007 = _2001;
    if (!_1991)
    {
        float _2009 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
        float _2015 = _2009 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = 1.0 / _2013;
        float _2039 = _2033 * _2035;
        float _2041 = _2023 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2045;
        float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2051 = _2037 * _2049;
        float _2053 = 1.0 / _2039;
        float _2055 = 1.0 / _2047;
        float _2057 = _2043 * _2053;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_2057, _2051, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2007 = _2065;
    }
    float _2067 = _2007;
    float _2069 = -_1997;
    float _2071 = _2069 + 1.0;
    float _2073 = _1995 + _1880;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2077 = _2067 > 0.0;
    bool _2079 = isnan(_2067);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2089 = _2073 * 0.5;
    float _2091 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2093 = _2087 * _1934;
    float _2095 = -_2087;
    float _2097 = _2095 + 1.0;
    out.m_47.x = _2091;
    float _2099 = _1945 * _2093;
    float _2101 = _1955 * _2093;
    float _2103 = _1945 * _2097;
    out.gl_Position.x = _1898;
    out.gl_Position.y = _1908;
    out.gl_Position.z = _1995;
    out.gl_Position.w = _1880;
    float _2105 = fma(_1951, _2099, _1939);
    float _2107 = fma(_1953, _2099, _1941);
    float _2109 = fma(_1945, _2101, _1943);
    out.m_71.z = _2089;
    out.m_71.w = _1880;
    out.m_73.x = _2105;
    out.m_73.y = _2107;
    out.m_73.z = _2109;
    out.m_73.w = _2103;
    if (_2085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2111 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2111;
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
    bool _1572 = false;
    bool _804 = false;
    bool _624 = false;
    bool _472 = false;
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
        float _2167 = as_type<float>(_106);
        out.gl_Position.z = _2167;
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
        float _2238 = as_type<float>(_150);
        out.gl_Position.z = _2238;
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
    float _424 = _372;
    float _426 = _404;
    float _428 = _406;
    if (_416)
    {
        _424 = _400;
    }
    float _430 = _424;
    float _432 = _430;
    if (!_416)
    {
        bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _436 = !_434;
        if (!_436)
        {
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _442 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
            float _456 = _450 * _450;
            float _458 = fma(_452, _452, _456);
            float _460 = fma(_454, _454, _458);
            float _462 = rsqrt(_460);
            float _464 = _462 * 9.9999999747524270787835121154785e-07;
            float _466 = _452 * _464;
            float _468 = _450 * _464;
            float _470 = _454 * _464;
            _432 = _468;
            _426 = _466;
            _428 = _470;
            _472 = true;
        }
        else
        {
            float _474 = _154 * _154;
            float _476 = fma(_152, _152, _474);
            float _478 = fma(_156, _156, _476);
            float _480 = sqrt(_478);
            bool _482 = _480 >= 9.9999999747524270787835121154785e-07;
            bool _484 = isnan(_480);
            bool _486 = _482 || _484;
            bool _488 = isnan(9.9999999747524270787835121154785e-07);
            bool _490 = _486 || _488;
            if (!_490)
            {
                float _492 = _394 * _394;
                float _494 = fma(_392, _392, _492);
                float _496 = fma(_396, _396, _494);
                float _498 = sqrt(_496);
                bool _500 = _498 >= 9.9999999747524270787835121154785e-07;
                bool _502 = isnan(_498);
                bool _504 = _500 || _502;
                bool _506 = isnan(9.9999999747524270787835121154785e-07);
                bool _508 = _504 || _506;
                if (!_508)
                {
                    float _510 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _510);
                    float _514 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _512);
                    float _516 = rsqrt(_514);
                    float _518 = _516 * 9.9999999747524270787835121154785e-07;
                    float _520 = _518 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _518 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _518 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _432 = _522;
                    _426 = _520;
                    _428 = _524;
                    _472 = true;
                }
                else
                {
                    float _526 = _394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _528 = _394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _530 = _394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _530);
                    float _538 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
                    float _540 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
                    float _542 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
                    float _544 = _538 * _538;
                    float _546 = fma(_540, _540, _544);
                    float _548 = fma(_542, _542, _546);
                    float _550 = rsqrt(_548);
                    float _552 = _550 * 9.9999999747524270787835121154785e-07;
                    float _554 = _540 * _552;
                    float _556 = _538 * _552;
                    float _558 = _542 * _552;
                    _432 = _556;
                    _426 = _554;
                    _428 = _558;
                    _472 = true;
                }
            }
            else
            {
                float _560 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _562 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _564 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _560);
                float _568 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _562);
                float _570 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _564);
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _566);
                float _574 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
                float _576 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _570);
                float _578 = _572 * _572;
                float _580 = fma(_574, _574, _578);
                float _582 = fma(_576, _576, _580);
                float _584 = rsqrt(_582);
                float _586 = _584 * 9.9999999747524270787835121154785e-07;
                float _588 = _574 * _586;
                float _590 = _572 * _586;
                float _592 = _576 * _586;
                _432 = _590;
                _426 = _588;
                _428 = _592;
            }
        }
    }
    _472 = false;
    float _594 = _432;
    float _596 = _426;
    float _598 = _428;
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _602 = !_600;
    float _604 = _596;
    float _622;
    if (!_602)
    {
        float _606 = in.m_53.x;
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _610 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_92);
        float _628 = 1.0 / _626;
        float _630 = _124 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _632 + _634;
    bool _638 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _640 = isnan(_632);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _652 = _632 + _650;
    bool _654 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _656 = isnan(_632);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _674 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _676 = isnan(_632);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _672;
    float _688 = -_684;
    float _690 = _688 + 1.0;
    bool _692 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _694 = _664 * _690;
    float _696 = -_664;
    float _698 = _696 + 1.0;
    float _700 = 1.0 / _668;
    float _702 = _652 * _686;
    float _704 = _636 * _700;
    float _706 = -_648;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _710;
    float _714 = _684 * _708;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _720;
    float _724 = fma(_712, _704, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _726 = fma(_718, _704, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _728 = fma(_722, _704, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _730 = in.m_51.x;
    float _732 = in.m_51.y;
    float _734 = in.m_51.z;
    float _736 = _724 * _694;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = _728 * _694;
    float _744 = _726 * _694;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _754 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].x, _742);
    float _756 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].y, _736);
    float _758 = fma(_748, _702, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _760 = fma(_740, _702, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _762 = fma(_752, _702, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _764 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].z, _744);
    float _766 = fma(_758, _714, _754);
    float _768 = fma(_760, _714, _756);
    float _770 = fma(_762, _714, _764);
    float _772 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].x, _766);
    float _774 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    float _776 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].z, _770);
    float _778 = _772 * _730;
    float _780 = _774 * _732;
    float _782 = _776 * _734;
    bool _784 = !_692;
    float _802;
    if (!_784)
    {
        float _786 = in.m_53.x;
        float _788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _790 = _786 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _794 = _792 * _788;
        float _796 = floor(_794);
        float _798 = -_796;
        float _800 = _794 + _798;
        _802 = _800;
        _804 = true;
    }
    else
    {
        float _806 = float(_92);
        float _808 = 1.0 / _806;
        float _810 = _124 * _808;
        _802 = _810;
    }
    _804 = false;
    float _812 = _802;
    float _814 = in.m_53.w;
    float _816 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _818 = in.m_55.y;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _822 = _820 != 0;
    float _824 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _816);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _828 = _826 != 0;
    float _830 = in.m_53.y;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _834 = _832 != 0;
    float _836 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _840 = _838 != 0;
    float _842 = in.m_53.z;
    float _844 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _848 = in.m_57.x;
    float _850 = in.m_57.y;
    float _852 = in.m_57.z;
    float _854 = in.m_53.x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _860 = _814 > 0.5;
    float _862 = in.m_55.x;
    float _864 = -_818;
    float _866 = _864 + 1.0;
    float _868 = _846 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _872 = _830 > 0.5;
    bool _874 = _842 > 0.5;
    int _876 = _872 ? as_type<int>(_866) : as_type<int>(_818);
    float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _880 = _874 ? as_type<int>(_866) : as_type<int>(_818);
    float _882 = _828 ? as_type<float>(_876) : _818;
    float _884 = _834 ? as_type<float>(_880) : _818;
    float _886 = _818;
    bool _888 = _822;
    if (_822)
    {
        float _890 = _860 ? _866 : _818;
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _896 = _894 != 0;
    float _898 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _902 = _900 != 0;
    float _904 = fma(_884, _868, -0.5);
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _908 = _906 != 0;
    float _910 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _912 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    float _914 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _916 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _850);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _848);
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _932 = _830 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _936 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _938 = 1.0 / _924;
    float _940 = fma(_932, -2.0, _930);
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _852);
    float _944 = -_934;
    float _946 = fma(_936, 2.0, _944);
    float _948 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _950 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _916);
    float _952 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _824);
    float _954 = _594 * _594;
    float _956 = 1.0 / _920;
    float _958 = _948 * _928;
    float _960 = _836 * _926;
    float _962 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _912);
    float _964 = fma(_596, _596, _954);
    float _966 = _844 * _942;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _970 = _812 + _968;
    float _972 = _954;
    float _974 = _970;
    if (!_840)
    {
        _972 = _862;
    }
    float _976 = _972;
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _980 = fma(_598, _598, _964);
    bool _982 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _984 = isnan(_812);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _940);
    float _996 = _976;
    float _998 = _980;
    if (_840)
    {
        bool _1000 = _854 > 0.5;
        _888 = _1000;
    }
    bool _1002 = _888;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1012 = rsqrt(_980);
    float _1014 = -_992;
    float _1016 = _1014 + 1.0;
    float _1018 = _1006 * _956;
    float _1020 = _1010 * _938;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1024 = _812 + _1022;
    float _1026 = fma(_1018, _970, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1028 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1030 = isnan(_812);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = fma(_1020, _1024, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _978 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_840)
    {
        _974 = _976;
    }
    float _1046 = _974;
    float _1048 = fma(_1042, _882, -0.5);
    bool _1050 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1052 = isnan(_812);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1038;
    float _1064 = _1062 + 1.0;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1068 = _1046;
    if (_840)
    {
        _996 = _862;
    }
    float _1070 = _996;
    float _1072 = _1012 * _598;
    float _1074 = _1060 * _1064;
    float _1076 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1066);
    float _1078 = -_1060;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1044);
    float _1084 = _1012 * _594;
    float _1086 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1076);
    float _1088 = _992 * _1080;
    float _1090 = _1012 * _596;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1094 = _1072 * _1092;
    float _1096 = -_994;
    float _1098 = fma(_1086, _1048, _1096);
    float _1100 = _1026 * _1088;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1104 = _1084 * _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1108 = -_1094;
    float _1110 = fma(_1090, _1106, _1108);
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1114 = _1090 * _1112;
    float _1116 = _858 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1120 = -_1104;
    float _1122 = fma(_1072, _1118, _1120);
    float _1124 = _1110 * _1110;
    float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1128 = -_1114;
    float _1130 = fma(_1084, _1126, _1128);
    float _1132 = _1070;
    if (_896)
    {
        _604 = _854;
    }
    float _1134 = _604;
    int _1136 = 0;
    float _1138 = _1134;
    if (_902)
    {
        float _1140 = -_1070;
        float _1142 = _1140 + 1.0;
        _1136 = as_type<int>(_1142);
    }
    int _1144 = _1136;
    float _1146 = fma(_1122, _1122, _1124);
    int _1148 = 0;
    if (_908)
    {
        float _1150 = -_1070;
        float _1152 = _1150 + 1.0;
        _1148 = as_type<int>(_1152);
    }
    int _1154 = _1148;
    if (!_896)
    {
        _1138 = _842;
    }
    float _1156 = _1138;
    float _1158 = fma(_1130, _1130, _1146);
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1162 = _1160;
    if (!_896)
    {
        _998 = _830;
    }
    float _1164 = _998;
    float _1166 = rsqrt(_1158);
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1170 = _1164;
    int _1172 = as_type<int>(_1168);
    if (_896)
    {
        _1170 = _854;
    }
    float _1174 = _1170;
    float _1176 = fma(_1116, _892, -0.5);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1180 = -_1160;
    float _1182 = fma(_1168, 2.0, _1180);
    if (_840)
    {
        float _1184 = -_1070;
        float _1186 = _1184 + 1.0;
        _1172 = as_type<int>(_1186);
    }
    int _1188 = _1172;
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1178);
    float _1192 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1196 = _1192;
    if (!_902)
    {
        _1162 = _1070;
    }
    float _1198 = _1162;
    float _1200 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1100);
    float _1202 = _1198;
    if (_840)
    {
        float _1204 = _1002 ? as_type<float>(_1188) : _1070;
        _1068 = _1204;
    }
    float _1206 = _1068;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_908)
    {
        _1194 = _1070;
    }
    float _1210 = _1194;
    float _1212 = _950 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1214 = _1110 * _1166;
    float _1216 = _1122 * _1166;
    float _1218 = _1130 * _1166;
    float _1220 = _1210;
    if (_902)
    {
        float _1222 = _874 ? as_type<float>(_1144) : _1070;
        _1202 = _1222;
    }
    float _1224 = _1202;
    float _1226 = _1090 * _1214;
    if (_908)
    {
        float _1228 = _872 ? as_type<float>(_1154) : _1070;
        _1220 = _1228;
    }
    float _1230 = _1220;
    float _1232 = _960 * _1084;
    float _1234 = _960 * _1090;
    float _1236 = -_1226;
    float _1238 = fma(_1084, _1216, _1236);
    float _1240 = _1084 * _1218;
    float _1242 = _960 * _1072;
    float _1244 = fma(_958, _1216, _1234);
    float _1246 = -_1240;
    float _1248 = fma(_1072, _1214, _1246);
    float _1250 = fma(_958, _1218, _1242);
    float _1252 = _952 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_896)
    {
        _1132 = _842;
    }
    float _1254 = _1132;
    float _1256 = fma(_966, _1248, _1244);
    float _1258 = fma(_966, _1238, _1250);
    float _1260 = _1254;
    if (_896)
    {
        _1260 = _830;
    }
    float _1262 = _1260;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1266 = _1212 + _1256;
    float _1268 = _1252 + _1258;
    float _1270 = 0.0;
    float _1272 = _1266;
    float _1274 = _1268;
    if (!_896)
    {
        _1270 = _842;
    }
    float _1276 = _1270;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1264);
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1266 + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1286 = _1268 + _1284;
    float _1288 = -_1208;
    float _1290 = fma(_1192, 2.0, _1288);
    float _1292 = _1282 * _1282;
    float _1294 = _1286 * _1286;
    float _1296 = _1276;
    float _1298 = _1292;
    float _1300 = _1294;
    if (_896)
    {
        _1296 = _830;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_896)
    {
        _1196 = _830;
    }
    float _1306 = _1196;
    float _1308 = _1292 + _1294;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1312 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1304);
    float _1314 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].z, _856);
    float _1316 = _1306;
    if (!_896)
    {
        _1316 = _854;
    }
    float _1318 = _1316;
    float _1320 = fma(_1040, _1074, _1200);
    float _1322 = _1072 * _1216;
    float _1324 = fma(_958, _1214, _1232);
    float _1326 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1312);
    float _1328 = sqrt(_1308);
    float _1330 = -_124;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    float _1334 = -_1322;
    float _1336 = fma(_1090, _1218, _1334);
    float _1338 = _870 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1340 = _962 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1342 = fma(_914, _1224, -0.5);
    float _1344 = fma(_1338, _1230, -0.5);
    float _1346 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1348 = -_124;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1290);
    float _1352 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1190);
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = fma(_1346, _1206, -0.5);
    float _1358 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1360 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1314);
    float _1362 = fma(_1352, _1342, _1350);
    bool _1364 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = fma(_1326, _1356, _1332);
    float _1368 = fma(_966, _1336, _1324);
    float _1370 = -_124;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1376 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1378 = _1340 + _1368;
    float _1380 = fma(_1358, -2.0, _1354);
    float _1382 = fma(_1360, _1344, _1372);
    float _1384 = fma(_1376, -2.0, _1374);
    float _1386 = _1352;
    if (!_1364)
    {
        _1386 = _1378;
    }
    float _1388 = _1386;
    bool _1390 = !_1364;
    float _1392 = _1388;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1328 + _1396;
        float _1400 = _1378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1308);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = sin(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = fma(_1410, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1418 = _1402 * _1416;
        float _1420 = fma(_1282, _1418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1422 = _1414 + (-1.0);
        float _1424 = fma(_1286, _1418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1428 = _1420 + _1426;
        float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1434 = _1424 + _1432;
        float _1436 = _1428 * _1428;
        float _1438 = fma(_1378, _1414, _1430);
        float _1440 = _1434 * _1434;
        _1392 = _1438;
        _1298 = _1436;
        _1300 = _1440;
        _1272 = _1420;
        _1274 = _1424;
    }
    float _1442 = _1392;
    float _1444 = _1298;
    float _1446 = _1300;
    float _1448 = _1272;
    float _1450 = _1274;
    float _1452 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1380);
    float _1454 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1278);
    float _1456 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1082);
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1460 = _1442 + _1458;
    float _1462 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1384);
    float _1464 = -_1452;
    float _1466 = fma(_1454, _1176, _1464);
    float _1468 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1320);
    float _1470 = in.m_59.w;
    float _1472 = fma(_1460, _1460, _1444);
    float _1474 = -_1462;
    float _1476 = fma(_1456, _904, _1474);
    float _1478 = _1366 + 0.5;
    float _1480 = _1472 + _1446;
    float _1482 = _1098 + 0.5;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1486 = sqrt(_1480);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1382 + 0.5;
    float _1514 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1516 = _1362 + 0.5;
    float _1518 = _1466 + 0.5;
    float _1520 = _1476 + 0.5;
    out.m_61.w = _1470;
    bool _1522 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1524 = isnan(_1486);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1530 = _1526 || _1528;
    out.m_63.x = _1506;
    out.m_63.y = _1508;
    out.m_63.z = _1510;
    out.m_63.w = _1500;
    out.m_65.x = _1498;
    out.m_65.y = _1502;
    out.m_65.z = _1504;
    out.m_65.w = _1514;
    out.m_67.x = _1478;
    out.m_67.y = _1482;
    out.m_67.z = _1516;
    out.m_67.w = _1518;
    float _1532 = _1506;
    float _1534 = _1508;
    float _1536 = _1482;
    if (!_1530)
    {
        _128 = 1.0;
    }
    float _1538 = _128;
    out.m_69.x = _1512;
    out.m_69.y = _1520;
    bool _1540 = !_1530;
    float _1542 = _1538;
    if (!_1540)
    {
        bool _1544 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1546 = isnan(_1486);
        bool _1548 = _1544 || _1546;
        bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1552 = _1548 || _1550;
        if (!_1552)
        {
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1556 = _1486 + _1554;
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1564 = _1562 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1566 = 1.0 / _1560;
            float _1568 = _1556 * _1566;
            float _1570 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1542 = _1570;
            _1572 = true;
        }
        else
        {
            bool _1574 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1576 = isnan(_1486);
            bool _1578 = _1574 || _1576;
            bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1582 = _1578 || _1580;
            if (!_1582)
            {
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1586 = _1486 + _1584;
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1588 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1596 = 1.0 / _1590;
                float _1598 = _1586 * _1596;
                float _1600 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1542 = _1600;
                _1572 = true;
            }
            else
            {
                _1542 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1572 = false;
    float _1602 = _1542;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1606 = _1442 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1610 = _1448 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1614 = _1450 + _1612;
    float _1616 = fma(_1606, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1618 = fma(_1610, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1620 = fma(_1614, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1616 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1618 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1620 + _1630;
    float _1634 = _1624 * _1624;
    float _1636 = fma(_1628, _1628, _1634);
    float _1638 = fma(_1632, _1632, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1644 = _1628 * _1642;
    float _1646 = _1632 * _1642;
    float _1648 = _1644 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 + _1650;
    float _1654 = sqrt(_1652);
    bool _1656 = _1654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = _1654 + _1658;
    float _1662 = _1632;
    float _1664 = _1660;
    float _1666 = _1624;
    if (_1656)
    {
        float _1668 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1668;
    }
    float _1670 = _1662;
    if (_1656)
    {
        float _1672 = rsqrt(_1652);
        _1532 = _1672;
    }
    float _1674 = _1532;
    float _1676 = _1674;
    if (_1656)
    {
        float _1678 = _1660 * _1670;
        _1664 = _1678;
    }
    float _1680 = _1664;
    if (_1656)
    {
        float _1682 = _1680 * 0.15915493667125701904296875;
        _1534 = _1682;
    }
    float _1684 = _1534;
    float _1686 = _1640;
    if (_1656)
    {
        float _1688 = _1684 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        _1686 = _1690;
    }
    float _1692 = _1686;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = precise::max(0.0, _1694);
    float _1698 = _1636;
    float _1700 = _1696;
    float _1702 = _1694;
    if (_1656)
    {
        float _1704 = _1684 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        _1698 = _1706;
    }
    float _1708 = _1698;
    float _1710 = -_1642;
    float _1712 = -_1696;
    float _1714 = fma(_1624, _1710, _1712);
    if (!_1656)
    {
        _1700 = _1648;
    }
    float _1716 = _1700;
    float _1718 = _1716;
    if (_1656)
    {
        float _1720 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1720;
    }
    float _1722 = _1702;
    float _1724 = sqrt(_1638);
    float _1726 = _1692;
    float _1728 = _1722;
    if (_1656)
    {
        float _1730 = fma(_1692, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1666 = _1730;
    }
    float _1732 = _1666;
    float _1734 = _1732;
    if (!_1656)
    {
        _1726 = _1644;
    }
    float _1736 = _1726;
    float _1738 = _1736;
    float _1740 = _1708;
    if (_1656)
    {
        float _1742 = _1708 + (-1.0);
        _1728 = _1742;
    }
    float _1744 = _1728;
    float _1746 = _1744;
    if (_1656)
    {
        float _1748 = _1674 * _1732;
        _1536 = _1748;
    }
    float _1750 = _1536;
    if (!_1656)
    {
        _1734 = _1714;
    }
    float _1752 = _1734;
    float _1754 = _1752;
    if (_1656)
    {
        float _1756 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1756;
    }
    float _1758 = _1676;
    if (_1656)
    {
        float _1760 = _1644 * _1750;
        _1738 = _1760;
    }
    float _1762 = _1738;
    if (!_1656)
    {
        _1746 = _1646;
    }
    float _1764 = _1746;
    float _1766 = _1764;
    if (_1656)
    {
        float _1768 = _1646 * _1750;
        _1766 = _1768;
    }
    float _1770 = _1766;
    if (_1656)
    {
        float _1772 = fma(_1714, _1708, _1758);
        _1754 = _1772;
    }
    float _1774 = _1754;
    if (_1656)
    {
        float _1776 = _1762 * _1762;
        _1718 = _1776;
    }
    float _1778 = _1718;
    if (!_1656)
    {
        _1740 = _1650;
    }
    float _1780 = _1740;
    float _1782 = _1780;
    if (_1656)
    {
        float _1784 = _1770 * _1770;
        _1782 = _1784;
    }
    float _1786 = _1782;
    float _1788 = fma(_1774, _1774, _1778);
    float _1790 = _1788 + _1786;
    float _1792 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1802 = rsqrt(_1790);
    float _1804 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = -_1798;
    float _1808 = _1806 + 1.0;
    float _1810 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1814 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1816 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    float _1822 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1824 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1826 = abs(_1808);
    float _1828 = log2(_1826);
    float _1830 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1832 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1834 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1824);
    float _1836 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1838 = _1802 * _1762;
    float _1840 = _1802 * _1774;
    float _1842 = -_1832;
    float _1844 = fma(_1842, _1812, 1.0);
    float _1846 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1848 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1854 = _1802 * _1770;
    float _1856 = -_1848;
    float _1858 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1862 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1852);
    float _1864 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1866 = -_1854;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1870 = log2(_1844);
    float _1872 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1862);
    float _1874 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1876 = fma(_1868, -0.5, 0.5);
    float _1878 = fma(_1868, 0.5, 0.5);
    float _1880 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1872);
    float _1882 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1874);
    float _1884 = _1840 + 1.0;
    float _1886 = exp2(_1864);
    float _1888 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1890 = fma(_1878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1882);
    float _1894 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1888);
    float _1896 = fma(_1878, _1890, -0.212114393711090087890625);
    float _1898 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1892);
    float _1900 = 1.0 / _1880;
    float _1902 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1894);
    float _1904 = _1870 * 0.693147182464599609375;
    float _1906 = fma(_1878, _1896, 1.570728778839111328125);
    float _1908 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1902);
    float _1910 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1912 = sqrt(_1876);
    float _1914 = -_1840;
    float _1916 = fma(_1886, _1884, _1914);
    float _1918 = fma(_1916, 0.5, 0.5);
    float _1920 = _1898 * _1900;
    float _1922 = _1908 * _1900;
    float _1924 = fma(_1920, 0.5, 0.5);
    float _1926 = fma(_1922, -0.5, 0.5);
    float _1928 = _1912 * 0.636619746685028076171875;
    float _1930 = -_1906;
    float _1932 = fma(_1928, _1930, 1.0);
    float3 _5253 = float3(_1924, _1926, _1910);
    float _1934 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5253, float3(0.0), isnan(_5253)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5253, float3(0.0), isnan(_5253)), level(0.0)).x;
    float3 _5264 = float3(_1924, _1926, _1910);
    float4 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5264, float3(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5264, float3(0.0), isnan(_5264)), level(0.0)).xyzw;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _1937.w;
    float2 _5281 = float2(_1932, _1918);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5281, float2(0.0), isnan(_5281)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5281, float2(0.0), isnan(_5281)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1959 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1961 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1963 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1957);
    float _1965 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1959);
    float _1967 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1969 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1963);
    float _1971 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1965);
    float _1973 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1967);
    float _1975 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1977 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1979 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1981 = 1.0 / _1975;
    bool _1983 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    float _1993 = _1977 + _1975;
    float _1995 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1979);
    float _1997 = exp2(_1961);
    float _1999 = _1822;
    if (_1991)
    {
        _1999 = 1.0;
    }
    float _2001 = _1999;
    float _2003 = _1993 * _1981;
    float _2005 = _2003 * 0.5;
    float _2007 = _2001;
    if (!_1991)
    {
        float _2009 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
        float _2015 = _2009 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = 1.0 / _2013;
        float _2039 = _2033 * _2035;
        float _2041 = _2023 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2045;
        float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2051 = _2037 * _2049;
        float _2053 = 1.0 / _2039;
        float _2055 = 1.0 / _2047;
        float _2057 = _2043 * _2053;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_2057, _2051, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2007 = _2065;
    }
    float _2067 = _2007;
    float _2069 = -_1997;
    float _2071 = _2069 + 1.0;
    float _2073 = _1995 + _1880;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2077 = _2067 > 0.0;
    bool _2079 = isnan(_2067);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2089 = _2073 * 0.5;
    float _2091 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2093 = _2087 * _1934;
    float _2095 = -_2087;
    float _2097 = _2095 + 1.0;
    out.m_47.x = _2091;
    float _2099 = _1945 * _2093;
    float _2101 = _1955 * _2093;
    float _2103 = _1945 * _2097;
    out.gl_Position.x = _1898;
    out.gl_Position.y = _1908;
    out.gl_Position.z = _1995;
    out.gl_Position.w = _1880;
    float _2105 = fma(_1951, _2099, _1939);
    float _2107 = fma(_1953, _2099, _1941);
    float _2109 = fma(_1945, _2101, _1943);
    out.m_71.z = _2089;
    out.m_71.w = _1880;
    out.m_73.x = _2105;
    out.m_73.y = _2107;
    out.m_73.z = _2109;
    out.m_73.w = _2103;
    if (_2085)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2111 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2111;
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
    bool _1572 = false;
    bool _804 = false;
    bool _624 = false;
    bool _472 = false;
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
        float _2167 = as_type<float>(_106);
        out.gl_Position.z = _2167;
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
        float _2238 = as_type<float>(_150);
        out.gl_Position.z = _2238;
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
    float _424 = _372;
    float _426 = _404;
    float _428 = _406;
    if (_416)
    {
        _424 = _400;
    }
    float _430 = _424;
    float _432 = _430;
    if (!_416)
    {
        bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _436 = !_434;
        if (!_436)
        {
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _442 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
            float _456 = _450 * _450;
            float _458 = fma(_452, _452, _456);
            float _460 = fma(_454, _454, _458);
            float _462 = rsqrt(_460);
            float _464 = _462 * 9.9999999747524270787835121154785e-07;
            float _466 = _452 * _464;
            float _468 = _450 * _464;
            float _470 = _454 * _464;
            _432 = _468;
            _426 = _466;
            _428 = _470;
            _472 = true;
        }
        else
        {
            float _474 = _154 * _154;
            float _476 = fma(_152, _152, _474);
            float _478 = fma(_156, _156, _476);
            float _480 = sqrt(_478);
            bool _482 = _480 >= 9.9999999747524270787835121154785e-07;
            bool _484 = isnan(_480);
            bool _486 = _482 || _484;
            bool _488 = isnan(9.9999999747524270787835121154785e-07);
            bool _490 = _486 || _488;
            if (!_490)
            {
                float _492 = _394 * _394;
                float _494 = fma(_392, _392, _492);
                float _496 = fma(_396, _396, _494);
                float _498 = sqrt(_496);
                bool _500 = _498 >= 9.9999999747524270787835121154785e-07;
                bool _502 = isnan(_498);
                bool _504 = _500 || _502;
                bool _506 = isnan(9.9999999747524270787835121154785e-07);
                bool _508 = _504 || _506;
                if (!_508)
                {
                    float _510 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _510);
                    float _514 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _512);
                    float _516 = rsqrt(_514);
                    float _518 = _516 * 9.9999999747524270787835121154785e-07;
                    float _520 = _518 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _518 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _518 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _432 = _522;
                    _426 = _520;
                    _428 = _524;
                    _472 = true;
                }
                else
                {
                    float _526 = _394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _528 = _394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _530 = _394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _530);
                    float _538 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
                    float _540 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
                    float _542 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
                    float _544 = _538 * _538;
                    float _546 = fma(_540, _540, _544);
                    float _548 = fma(_542, _542, _546);
                    float _550 = rsqrt(_548);
                    float _552 = _550 * 9.9999999747524270787835121154785e-07;
                    float _554 = _540 * _552;
                    float _556 = _538 * _552;
                    float _558 = _542 * _552;
                    _432 = _556;
                    _426 = _554;
                    _428 = _558;
                    _472 = true;
                }
            }
            else
            {
                float _560 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _562 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _564 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _560);
                float _568 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _562);
                float _570 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _564);
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _566);
                float _574 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
                float _576 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _570);
                float _578 = _572 * _572;
                float _580 = fma(_574, _574, _578);
                float _582 = fma(_576, _576, _580);
                float _584 = rsqrt(_582);
                float _586 = _584 * 9.9999999747524270787835121154785e-07;
                float _588 = _574 * _586;
                float _590 = _572 * _586;
                float _592 = _576 * _586;
                _432 = _590;
                _426 = _588;
                _428 = _592;
            }
        }
    }
    _472 = false;
    float _594 = _432;
    float _596 = _426;
    float _598 = _428;
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _602 = !_600;
    float _604 = _596;
    float _622;
    if (!_602)
    {
        float _606 = in.m_53.x;
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _610 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_92);
        float _628 = 1.0 / _626;
        float _630 = _124 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = _632 + _634;
    bool _638 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _640 = isnan(_632);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _652 = _632 + _650;
    bool _654 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _656 = isnan(_632);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _674 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _676 = isnan(_632);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _672;
    float _688 = -_684;
    float _690 = _688 + 1.0;
    bool _692 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _694 = _664 * _690;
    float _696 = -_664;
    float _698 = _696 + 1.0;
    float _700 = 1.0 / _668;
    float _702 = _652 * _686;
    float _704 = _636 * _700;
    float _706 = -_648;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _710;
    float _714 = _684 * _708;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _720;
    float _724 = fma(_712, _704, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _726 = fma(_718, _704, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _728 = fma(_722, _704, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _730 = in.m_51.x;
    float _732 = in.m_51.y;
    float _734 = in.m_51.z;
    float _736 = _724 * _694;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = _728 * _694;
    float _744 = _726 * _694;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _754 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].x, _742);
    float _756 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].y, _736);
    float _758 = fma(_748, _702, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _760 = fma(_740, _702, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _762 = fma(_752, _702, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _764 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].z, _744);
    float _766 = fma(_758, _714, _754);
    float _768 = fma(_760, _714, _756);
    float _770 = fma(_762, _714, _764);
    float _772 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].x, _766);
    float _774 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    float _776 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[145].z, _770);
    float _778 = _772 * _730;
    float _780 = _774 * _732;
    float _782 = _776 * _734;
    bool _784 = !_692;
    float _802;
    if (!_784)
    {
        float _786 = in.m_53.x;
        float _788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _790 = _786 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _794 = _792 * _788;
        float _796 = floor(_794);
        float _798 = -_796;
        float _800 = _794 + _798;
        _802 = _800;
        _804 = true;
    }
    else
    {
        float _806 = float(_92);
        float _808 = 1.0 / _806;
        float _810 = _124 * _808;
        _802 = _810;
    }
    _804 = false;
    float _812 = _802;
    float _814 = in.m_53.w;
    float _816 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _818 = in.m_55.y;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _822 = _820 != 0;
    float _824 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _816);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _828 = _826 != 0;
    float _830 = in.m_53.y;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _834 = _832 != 0;
    float _836 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _840 = _838 != 0;
    float _842 = in.m_53.z;
    float _844 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _848 = in.m_57.x;
    float _850 = in.m_57.y;
    float _852 = in.m_57.z;
    float _854 = in.m_53.x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _860 = _814 > 0.5;
    float _862 = in.m_55.x;
    float _864 = -_818;
    float _866 = _864 + 1.0;
    float _868 = _846 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _872 = _830 > 0.5;
    bool _874 = _842 > 0.5;
    int _876 = _872 ? as_type<int>(_866) : as_type<int>(_818);
    float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _880 = _874 ? as_type<int>(_866) : as_type<int>(_818);
    float _882 = _828 ? as_type<float>(_876) : _818;
    float _884 = _834 ? as_type<float>(_880) : _818;
    float _886 = _818;
    bool _888 = _822;
    if (_822)
    {
        float _890 = _860 ? _866 : _818;
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _896 = _894 != 0;
    float _898 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _902 = _900 != 0;
    float _904 = fma(_884, _868, -0.5);
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _908 = _906 != 0;
    float _910 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _912 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    float _914 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _916 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _850);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _848);
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _932 = _830 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _936 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _938 = 1.0 / _924;
    float _940 = fma(_932, -2.0, _930);
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _852);
    float _944 = -_934;
    float _946 = fma(_936, 2.0, _944);
    float _948 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _950 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _916);
    float _952 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _824);
    float _954 = _594 * _594;
    float _956 = 1.0 / _920;
    float _958 = _948 * _928;
    float _960 = _836 * _926;
    float _962 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _912);
    float _964 = fma(_596, _596, _954);
    float _966 = _844 * _942;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _970 = _812 + _968;
    float _972 = _954;
    float _974 = _970;
    if (!_840)
    {
        _972 = _862;
    }
    float _976 = _972;
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _980 = fma(_598, _598, _964);
    bool _982 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _984 = isnan(_812);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _940);
    float _996 = _976;
    float _998 = _980;
    if (_840)
    {
        bool _1000 = _854 > 0.5;
        _888 = _1000;
    }
    bool _1002 = _888;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1012 = rsqrt(_980);
    float _1014 = -_992;
    float _1016 = _1014 + 1.0;
    float _1018 = _1006 * _956;
    float _1020 = _1010 * _938;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1024 = _812 + _1022;
    float _1026 = fma(_1018, _970, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1028 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1030 = isnan(_812);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = fma(_1020, _1024, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _978 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_840)
    {
        _974 = _976;
    }
    float _1046 = _974;
    float _1048 = fma(_1042, _882, -0.5);
    bool _1050 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1052 = isnan(_812);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1038;
    float _1064 = _1062 + 1.0;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1068 = _1046;
    if (_840)
    {
        _996 = _862;
    }
    float _1070 = _996;
    float _1072 = _1012 * _598;
    float _1074 = _1060 * _1064;
    float _1076 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1066);
    float _1078 = -_1060;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1044);
    float _1084 = _1012 * _594;
    float _1086 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1076);
    float _1088 = _992 * _1080;
    float _1090 = _1012 * _596;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1094 = _1072 * _1092;
    float _1096 = -_994;
    float _1098 = fma(_1086, _1048, _1096);
    float _1100 = _1026 * _1088;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1104 = _1084 * _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1108 = -_1094;
    float _1110 = fma(_1090, _1106, _1108);
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1114 = _1090 * _1112;
    float _1116 = _858 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1120 = -_1104;
    float _1122 = fma(_1072, _1118, _1120);
    float _1124 = _1110 * _1110;
    float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1128 = -_1114;
    float _1130 = fma(_1084, _1126, _1128);
    float _1132 = _1070;
    if (_896)
    {
        _604 = _854;
    }
    float _1134 = _604;
    int _1136 = 0;
    float _1138 = _1134;
    if (_902)
    {
        float _1140 = -_1070;
        float _1142 = _1140 + 1.0;
        _1136 = as_type<int>(_1142);
    }
    int _1144 = _1136;
    float _1146 = fma(_1122, _1122, _1124);
    int _1148 = 0;
    if (_908)
    {
        float _1150 = -_1070;
        float _1152 = _1150 + 1.0;
        _1148 = as_type<int>(_1152);
    }
    int _1154 = _1148;
    if (!_896)
    {
        _1138 = _842;
    }
    float _1156 = _1138;
    float _1158 = fma(_1130, _1130, _1146);
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1162 = _1160;
    if (!_896)
    {
        _998 = _830;
    }
    float _1164 = _998;
    float _1166 = rsqrt(_1158);
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1170 = _1164;
    int _1172 = as_type<int>(_1168);
    if (_896)
    {
        _1170 = _854;
    }
    float _1174 = _1170;
    float _1176 = fma(_1116, _892, -0.5);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1180 = -_1160;
    float _1182 = fma(_1168, 2.0, _1180);
    if (_840)
    {
        float _1184 = -_1070;
        float _1186 = _1184 + 1.0;
        _1172 = as_type<int>(_1186);
    }
    int _1188 = _1172;
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1178);
    float _1192 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1196 = _1192;
    if (!_902)
    {
        _1162 = _1070;
    }
    float _1198 = _1162;
    float _1200 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1100);
    float _1202 = _1198;
    if (_840)
    {
        float _1204 = _1002 ? as_type<float>(_1188) : _1070;
        _1068 = _1204;
    }
    float _1206 = _1068;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_908)
    {
        _1194 = _1070;
    }
    float _1210 = _1194;
    float _1212 = _950 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1214 = _1110 * _1166;
    float _1216 = _1122 * _1166;
    float _1218 = _1130 * _1166;
    float _1220 = _1210;
    if (_902)
    {
        float _1222 = _874 ? as_type<float>(_1144) : _1070;
        _1202 = _1222;
    }
    float _1224 = _1202;
    float _1226 = _1090 * _1214;
    if (_908)
    {
        float _1228 = _872 ? as_type<float>(_1154) : _1070;
        _1220 = _1228;
    }
    float _1230 = _1220;
    float _1232 = _960 * _1084;
    float _1234 = _960 * _1090;
    float _1236 = -_1226;
    float _1238 = fma(_1084, _1216, _1236);
    float _1240 = _1084 * _1218;
    float _1242 = _960 * _1072;
    float _1244 = fma(_958, _1216, _1234);
    float _1246 = -_1240;
    float _1248 = fma(_1072, _1214, _1246);
    float _1250 = fma(_958, _1218, _1242);
    float _1252 = _952 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_896)
    {
        _1132 = _842;
    }
    float _1254 = _1132;
    float _1256 = fma(_966, _1248, _1244);
    float _1258 = fma(_966, _1238, _1250);
    float _1260 = _1254;
    if (_896)
    {
        _1260 = _830;
    }
    float _1262 = _1260;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1266 = _1212 + _1256;
    float _1268 = _1252 + _1258;
    float _1270 = 0.0;
    float _1272 = _1266;
    float _1274 = _1268;
    if (!_896)
    {
        _1270 = _842;
    }
    float _1276 = _1270;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1264);
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1266 + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1286 = _1268 + _1284;
    float _1288 = -_1208;
    float _1290 = fma(_1192, 2.0, _1288);
    float _1292 = _1282 * _1282;
    float _1294 = _1286 * _1286;
    float _1296 = _1276;
    float _1298 = _1292;
    float _1300 = _1294;
    if (_896)
    {
        _1296 = _830;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_896)
    {
        _1196 = _830;
    }
    float _1306 = _1196;
    float _1308 = _1292 + _1294;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1312 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1304);
    float _1314 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].z, _856);
    float _1316 = _1306;
    if (!_896)
    {
        _1316 = _854;
    }
    float _1318 = _1316;
    float _1320 = fma(_1040, _1074, _1200);
    float _1322 = _1072 * _1216;
    float _1324 = fma(_958, _1214, _1232);
    float _1326 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1312);
    float _1328 = sqrt(_1308);
    float _1330 = -_124;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    float _1334 = -_1322;
    float _1336 = fma(_1090, _1218, _1334);
    float _1338 = _870 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1340 = _962 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1342 = fma(_914, _1224, -0.5);
    float _1344 = fma(_1338, _1230, -0.5);
    float _1346 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1348 = -_124;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1290);
    float _1352 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1190);
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1356 = fma(_1346, _1206, -0.5);
    float _1358 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1360 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1314);
    float _1362 = fma(_1352, _1342, _1350);
    bool _1364 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = fma(_1326, _1356, _1332);
    float _1368 = fma(_966, _1336, _1324);
    float _1370 = -_124;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1376 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1378 = _1340 + _1368;
    float _1380 = fma(_1358, -2.0, _1354);
    float _1382 = fma(_1360, _1344, _1372);
    float _1384 = fma(_1376, -2.0, _1374);
    float _1386 = _1352;
    if (!_1364)
    {
        _1386 = _1378;
    }
    float _1388 = _1386;
    bool _1390 = !_1364;
    float _1392 = _1388;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1328 + _1396;
        float _1400 = _1378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1308);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = sin(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = fma(_1410, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1418 = _1402 * _1416;
        float _1420 = fma(_1282, _1418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1422 = _1414 + (-1.0);
        float _1424 = fma(_1286, _1418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1428 = _1420 + _1426;
        float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1434 = _1424 + _1432;
        float _1436 = _1428 * _1428;
        float _1438 = fma(_1378, _1414, _1430);
        float _1440 = _1434 * _1434;
        _1392 = _1438;
        _1298 = _1436;
        _1300 = _1440;
        _1272 = _1420;
        _1274 = _1424;
    }
    float _1442 = _1392;
    float _1444 = _1298;
    float _1446 = _1300;
    float _1448 = _1272;
    float _1450 = _1274;
    float _1452 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1380);
    float _1454 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1278);
    float _1456 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1082);
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1460 = _1442 + _1458;
    float _1462 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1384);
    float _1464 = -_1452;
    float _1466 = fma(_1454, _1176, _1464);
    float _1468 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1320);
    float _1470 = in.m_59.w;
    float _1472 = fma(_1460, _1460, _1444);
    float _1474 = -_1462;
    float _1476 = fma(_1456, _904, _1474);
    float _1478 = _1366 + 0.5;
    float _1480 = _1472 + _1446;
    float _1482 = _1098 + 0.5;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1486 = sqrt(_1480);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1382 + 0.5;
    float _1514 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1516 = _1362 + 0.5;
    float _1518 = _1466 + 0.5;
    float _1520 = _1476 + 0.5;
    out.m_61.w = _1470;
    bool _1522 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1524 = isnan(_1486);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1530 = _1526 || _1528;
    out.m_63.x = _1506;
    out.m_63.y = _1508;
    out.m_63.z = _1510;
    out.m_63.w = _1500;
    out.m_65.x = _1498;
    out.m_65.y = _1502;
    out.m_65.z = _1504;
    out.m_65.w = _1514;
    out.m_67.x = _1478;
    out.m_67.y = _1482;
    out.m_67.z = _1516;
    out.m_67.w = _1518;
    float _1532 = _1506;
    float _1534 = _1508;
    float _1536 = _1482;
    if (!_1530)
    {
        _128 = 1.0;
    }
    float _1538 = _128;
    out.m_69.x = _1512;
    out.m_69.y = _1520;
    bool _1540 = !_1530;
    float _1542 = _1538;
    if (!_1540)
    {
        bool _1544 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1546 = isnan(_1486);
        bool _1548 = _1544 || _1546;
        bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1552 = _1548 || _1550;
        if (!_1552)
        {
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1556 = _1486 + _1554;
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1564 = _1562 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1566 = 1.0 / _1560;
            float _1568 = _1556 * _1566;
            float _1570 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1542 = _1570;
            _1572 = true;
        }
        else
        {
            bool _1574 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1576 = isnan(_1486);
            bool _1578 = _1574 || _1576;
            bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1582 = _1578 || _1580;
            if (!_1582)
            {
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1586 = _1486 + _1584;
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1588 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1596 = 1.0 / _1590;
                float _1598 = _1586 * _1596;
                float _1600 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1542 = _1600;
                _1572 = true;
            }
            else
            {
                _1542 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1572 = false;
    float _1602 = _1542;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1606 = _1442 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1610 = _1448 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1614 = _1450 + _1612;
    float _1616 = fma(_1606, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1618 = fma(_1610, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1620 = fma(_1614, _1602, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1616 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1618 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1620 + _1630;
    float _1634 = _1624 * _1624;
    float _1636 = fma(_1628, _1628, _1634);
    float _1638 = fma(_1632, _1632, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1644 = _1628 * _1642;
    float _1646 = _1632 * _1642;
    float _1648 = _1644 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 + _1650;
    float _1654 = sqrt(_1652);
    bool _1656 = _1654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = _1654 + _1658;
    float _1662 = _1632;
    float _1664 = _1660;
    float _1666 = _1624;
    if (_1656)
    {
        float _1668 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1668;
    }
    float _1670 = _1662;
    if (_1656)
    {
        float _1672 = rsqrt(_1652);
        _1532 = _1672;
    }
    float _1674 = _1532;
    float _1676 = _1674;
    if (_1656)
    {
        float _1678 = _1660 * _1670;
        _1664 = _1678;
    }
    float _1680 = _1664;
    if (_1656)
    {
        float _1682 = _1680 * 0.15915493667125701904296875;
        _1534 = _1682;
    }
    float _1684 = _1534;
    float _1686 = _1640;
    if (_1656)
    {
        float _1688 = _1684 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        _1686 = _1690;
    }
    float _1692 = _1686;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = precise::max(0.0, _1694);
    float _1698 = _1636;
    float _1700 = _1696;
    float _1702 = _1694;
    if (_1656)
    {
        float _1704 = _1684 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        _1698 = _1706;
    }
    float _1708 = _1698;
    float _1710 = -_1642;
    float _1712 = -_1696;
    float _1714 = fma(_1624, _1710, _1712);
    if (!_1656)
    {
        _1700 = _1648;
    }
    float _1716 = _1700;
    float _1718 = _1716;
    if (_1656)
    {
        float _1720 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1720;
    }
    float _1722 = _1702;
    float _1724 = sqrt(_1638);
    float _1726 = _1692;
    float _1728 = _1722;
    if (_1656)
    {
        float _1730 = fma(_1692, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1666 = _1730;
    }
    float _1732 = _1666;
    float _1734 = _1732;
    if (!_1656)
    {
        _1726 = _1644;
    }
    float _1736 = _1726;
    float _1738 = _1736;
    float _1740 = _1708;
    if (_1656)
    {
        float _1742 = _1708 + (-1.0);
        _1728 = _1742;
    }
    float _1744 = _1728;
    float _1746 = _1744;
    if (_1656)
    {
        float _1748 = _1674 * _1732;
        _1536 = _1748;
    }
    float _1750 = _1536;
    if (!_1656)
    {
        _1734 = _1714;
    }
    float _1752 = _1734;
    float _1754 = _1752;
    if (_1656)
    {
        float _1756 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1756;
    }
    float _1758 = _1676;
    if (_1656)
    {
        float _1760 = _1644 * _1750;
        _1738 = _1760;
    }
    float _1762 = _1738;
    if (!_1656)
    {
        _1746 = _1646;
    }
    float _1764 = _1746;
    float _1766 = _1764;
    if (_1656)
    {
        float _1768 = _1646 * _1750;
        _1766 = _1768;
    }
    float _1770 = _1766;
    if (_1656)
    {
        float _1772 = fma(_1714, _1708, _1758);
        _1754 = _1772;
    }
    float _1774 = _1754;
    if (_1656)
    {
        float _1776 = _1762 * _1762;
        _1718 = _1776;
    }
    float _1778 = _1718;
    if (!_1656)
    {
        _1740 = _1650;
    }
    float _1780 = _1740;
    float _1782 = _1780;
    if (_1656)
    {
        float _1784 = _1770 * _1770;
        _1782 = _1784;
    }
    float _1786 = _1782;
    float _1788 = fma(_1774, _1774, _1778);
    float _1790 = _1788 + _1786;
    float _1792 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1802 = rsqrt(_1790);
    float _1804 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = -_1798;
    float _1808 = _1806 + 1.0;
    float _1810 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1814 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1816 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    float _1822 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1824 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1826 = abs(_1808);
    float _1828 = log2(_1826);
    float _1830 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1832 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1834 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1824);
    float _1836 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1838 = _1802 * _1762;
    float _1840 = _1802 * _1774;
    float _1842 = -_1832;
    float _1844 = fma(_1842, _1812, 1.0);
    float _1846 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1848 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1854 = _1802 * _1770;
    float _1856 = -_1848;
    float _1858 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1862 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1852);
    float _1864 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1866 = -_1854;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1870 = log2(_1844);
    float _1872 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1862);
    float _1874 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1876 = fma(_1868, -0.5, 0.5);
    float _1878 = fma(_1868, 0.5, 0.5);
    float _1880 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1872);
    float _1882 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1874);
    float _1884 = _1840 + 1.0;
    float _1886 = exp2(_1864);
    float _1888 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1890 = fma(_1878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1882);
    float _1894 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1888);
    float _1896 = fma(_1878, _1890, -0.212114393711090087890625);
    float _1898 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1892);
    float _1900 = 1.0 / _1880;
    float _1902 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1894);
    float _1904 = _1870 * 0.693147182464599609375;
    float _1906 = fma(_1878, _1896, 1.570728778839111328125);
    float _1908 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1902);
    float _1910 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1912 = sqrt(_1876);
    float _1914 = -_1840;
    float _1916 = fma(_1886, _1884, _1914);
    float _1918 = fma(_1916, 0.5, 0.5);
    float _1920 = _1898 * _1900;
    float _1922 = _1908 * _1900;
    float _1924 = fma(_1920, 0.5, 0.5);
    float _1926 = fma(_1922, -0.5, 0.5);
    float _1928 = _1912 * 0.636619746685028076171875;
    float _1930 = -_1906;
    float _1932 = fma(_1928, _1930, 1.0);
    float3 _5253 = float3(_1924, _1926, _1910);
    float _1934 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5253, float3(0.0), isnan(_5253)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5253, float3(0.0), isnan(_5253)), level(0.0)).x;
    float3 _5264 = float3(_1924, _1926, _1910);
    float4 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5264, float3(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5264, float3(0.0), isnan(_5264)), level(0.0)).xyzw;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _1937.w;
    float2 _5281 = float2(_1932, _1918);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5281, float2(0.0), isnan(_5281)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5281, float2(0.0), isnan(_5281)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1959 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1961 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1963 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1957);
    float _1965 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1959);
    float _1967 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1969 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1963);
    float _1971 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1965);
    float _1973 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1967);
    float _1975 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1977 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1979 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1981 = 1.0 / _1975;
    bool _1983 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    float _1993 = _1977 + _1975;
    float _1995 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1979);
    float _1997 = exp2(_1961);
    float _1999 = _1822;
    if (_1991)
    {
        _1999 = 1.0;
    }
    float _2001 = _1999;
    float _2003 = _1993 * _1981;
    float _2005 = _2003 * 0.5;
    float _2007 = _2001;
    if (!_1991)
    {
        float _2009 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
        float _2015 = _2009 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = 1.0 / _2013;
        float _2039 = _2033 * _2035;
        float _2041 = _2023 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2045;
        float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2051 = _2037 * _2049;
        float _2053 = 1.0 / _2039;
        float _2055 = 1.0 / _2047;
        float _2057 = _2043 * _2053;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_2057, _2051, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2007 = _2065;
    }
    float _2067 = _2007;
    float _2069 = -_1997;
    float _2071 = _2069 + 1.0;
    float _2073 = _1995 + _1880;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2077 = _2067 > 0.0;
    bool _2079 = isnan(_2067);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2089 = _2073 * 0.5;
    float _2091 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2093 = _2087 * _1934;
    float _2095 = -_2087;
    float _2097 = _2095 + 1.0;
    out.m_47.x = _2091;
    float _2099 = _1945 * _2093;
    float _2101 = _1955 * _2093;
    float _2103 = _1945 * _2097;
    out.gl_Position.x = _1898;
    out.gl_Position.y = _1908;
    out.gl_Position.z = _1995;
    out.gl_Position.w = _1880;
    float _2105 = fma(_1951, _2099, _1939);
    float _2107 = fma(_1953, _2099, _1941);
    float _2109 = fma(_1945, _2101, _1943);
    out.m_71.z = _2089;
    out.m_71.w = _1880;
    out.m_73.x = _2105;
    out.m_73.y = _2107;
    out.m_73.z = _2109;
    out.m_73.w = _2103;
    if (_2085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2111 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2111;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

