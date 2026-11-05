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
    float4 m_69 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1996 = false;
    bool _712 = false;
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
        float _2620 = as_type<float>(_108);
        out.gl_Position.z = _2620;
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
    float _128 = 0.0;
    float _130 = 0.0;
    float _132 = _126;
    if (_122)
    {
        float _134 = float(_92);
        _128 = _134;
    }
    float _136 = _128;
    bool _138 = _126 >= _136;
    bool _140 = !_122;
    bool _142 = _138 || _140;
    if (_142)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _102;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    float _150 = as_type<float>(_148);
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_148);
        out.gl_Position.z = _2691;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _158;
    if (!_168)
    {
        float _172 = _158 * _158;
        float _174 = _172 * 0.5;
        _150 = _174;
    }
    float _176 = _150;
    float _178 = 0.0;
    float _180 = _176;
    if (!_168)
    {
        float _182 = _126 * _126;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_168)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_168;
    float _194 = _190;
    float _196 = 0.0;
    if (!_192)
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
        _130 = _214;
        _194 = _226;
        _196 = _216;
    }
    float _228 = _130;
    float _230 = _194;
    float _232 = _196;
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
        _170 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _170;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _126;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
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
        float _294 = _126 * _286;
        float _296 = exp2(_294);
        float _298 = _292 * 0.693147182464599609375;
        float _300 = 1.0 / _298;
        float _302 = 1.0 / _290;
        float _304 = _296 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _300, _126);
        float _310 = _308 * _302;
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
        float _328 = _126 * _320;
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
    float _350 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_264, _152, _342);
    float _354 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_264, _156, _350);
    float _364 = fma(_338, _156, _354);
    float _366 = -_356;
    float _368 = _352 + _366;
    float _370 = _360 * _360;
    float _372 = in.m_51.w;
    float _374 = -_364;
    float _376 = _362 + _374;
    float _378 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = fma(_368, _368, _370);
    float _382 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = fma(_376, _376, _380);
    float _390 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _392 = in.m_44.x;
    float _394 = in.m_44.y;
    float _396 = in.m_44.z;
    float _398 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _402 = sqrt(_388);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _406 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _400);
    bool _408 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_402);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_352, _372, _392);
    float _420 = fma(_344, _372, _394);
    float _422 = fma(_362, _372, _396);
    float _424 = _362;
    float _426 = _404;
    float _428 = _406;
    if (_416)
    {
        _424 = _398;
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
            _426 = _468;
            _432 = _466;
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
                    _426 = _522;
                    _432 = _520;
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
                    _426 = _556;
                    _432 = _554;
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
                _426 = _590;
                _432 = _588;
                _428 = _592;
            }
        }
    }
    _472 = false;
    float _594 = _426;
    float _596 = _432;
    float _598 = _428;
    float _600 = in.m_53.x;
    float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _604 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _612 = _610 != 0;
    int _614 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _616 = _614 != 0;
    float _618 = _604 * _602;
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[20].x, _618);
    float _622 = _620 * 6.283185482025146484375;
    float _624 = floor(_620);
    float _626 = _622 * 0.15915493667125701904296875;
    bool _628 = !_608;
    int _630 = _628 ? 0 : 1;
    int _632 = abs(_630);
    float _634 = _626 * 6.283185482025146484375;
    float _636 = cos(_634);
    bool _638 = !_616;
    int _640 = _638 ? 0 : 1;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _644 = abs(_640);
    float _646 = -_624;
    float _648 = _620 + _646;
    bool _650 = !_612;
    int _652 = _650 ? 0 : 1;
    float _654 = float(_632);
    int _656 = abs(_652);
    float _658 = -_648;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _662 = _648 < 0.5;
    float _664 = float(_662);
    float _666 = fma(_636, 0.5, 0.5);
    float _668 = abs(_660);
    float _670 = _654 * _668;
    float _672 = float(_644);
    float _674 = -_664;
    float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _678 = -_666;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_656);
    float _684 = fma(_672, _680, _670);
    float _686 = abs(_676);
    float _688 = fma(_682, _686, _684);
    bool _690 = !_642;
    float _692 = as_type<float>(_644);
    float _694 = _670;
    float _710;
    if (!_690)
    {
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _698 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        float _714 = float(_92);
        float _716 = 1.0 / _714;
        float _718 = _126 * _716;
        _710 = _718;
    }
    _712 = false;
    float _720 = _710;
    float _722 = in.m_53.y;
    float _724 = _600 * 2.0;
    float _726 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = in.m_53.z;
    float _730 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = floor(_724);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = in.m_51.x;
    float _740 = in.m_51.y;
    float _742 = in.m_51.z;
    float _744 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _746 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _748 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _744);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _752;
    if (_736)
    {
        _692 = _600;
    }
    float _756 = _692;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = _722 * 2.0;
    bool _764 = _732 > 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _768 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _766;
    bool _770 = _732 >= 0.0;
    bool _772 = isnan(_732);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = _756;
    if (_736)
    {
        _694 = _722;
    }
    float _782 = _694;
    float _784 = floor(_762);
    int _786 = _778 ? 0 : 1;
    float _788 = _782;
    if (!_736)
    {
        _780 = _728;
    }
    float _790 = _780;
    float _792 = _738 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _794 = ~_786;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = _742 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _802 = _798;
    if (!_736)
    {
        _788 = _600;
    }
    float _804 = _788;
    float _806 = _740 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    if (!_764)
    {
        int _808 = ~_786;
        int _810 = _808 + 1;
        _802 = _810;
    }
    int _812 = _802;
    float _814 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _818 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _816;
    bool _820 = _784 > 0.0;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _824 = _784 >= 0.0;
    bool _826 = isnan(_784);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = -_818;
    float _836 = _834 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _840 = _832 ? 0 : 1;
    float _842 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[88].z, _838);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    int _860 = ~_840;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    int _866 = _864;
    if (!_820)
    {
        int _868 = ~_840;
        int _870 = _868 + 1;
        _866 = _870;
    }
    int _872 = _866;
    float _874 = in.m_55.x;
    float _876 = in.m_55.y;
    float _878 = in.m_55.z;
    float _880 = 1.0 / _858;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _896 = _894 != 0;
    float _898 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _904 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _898);
    float _906 = 1.0 / _902;
    float _908 = _722 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _914 = fma(_908, -2.0, _750);
    float _916 = 1.0 / _912;
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _878);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _876);
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _874);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _932 = _600 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _936 = 1.0 / _930;
    float _938 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _904);
    float _940 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _746);
    float _942 = -_934;
    float _944 = fma(_932, 2.0, _942);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _960 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _958;
    float _962 = 1.0 / _926;
    float _964 = _728 * 2.0;
    float _966 = _754 * _906;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _968;
    float _972 = _760 * _916;
    bool _974 = !_854;
    int _976 = _974 ? 0 : 1;
    float _978 = _938 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _980 = !_846;
    int _982 = _980 ? 0 : 1;
    float _984 = floor(_964);
    float _986 = _594 * _594;
    float _988 = _956 * _936;
    float _990 = fma(_596, _596, _986);
    int _992 = abs(_976);
    float _994 = 1.0 / _948;
    bool _996 = !_850;
    int _998 = _996 ? 0 : 1;
    float _1000 = _952 * _962;
    float _1002 = -_960;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1006 = abs(_982);
    int _1008 = abs(_998);
    float _1010 = _1004 * _1004;
    bool _1012 = _984 >= 0.0;
    bool _1014 = isnan(_984);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    float _1022 = fma(_598, _598, _990);
    float _1024 = _722 + _728;
    float _1026 = _804 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1028 = _1020 ? 0 : 1;
    bool _1030 = _984 > 0.0;
    float _1032 = rsqrt(_1022);
    float _1034 = _1024 + (-1.0);
    float _1036 = _970 * _994;
    float _1038 = fma(_1026, -2.0, _822);
    float _1040 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = -_768;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1046 = ~_1028;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    float _1052 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1054 = log2(_1052);
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1058 = float(_1008);
    float _1060 = float(_812);
    int _1062 = _1050;
    if (!_1030)
    {
        int _1064 = ~_1028;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    float _1070 = _1032 * _596;
    float _1072 = _1032 * _594;
    float _1074 = _1032 * _598;
    float _1076 = fma(_1044, _1044, _1010);
    float _1078 = _790 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1080 = _1058 * _1060;
    float _1082 = in.m_57.x;
    float _1084 = in.m_57.y;
    float _1086 = in.m_57.z;
    float _1088 = _1054 * _126;
    float _1090 = -_1056;
    float _1092 = fma(_1078, 2.0, _1090);
    float _1094 = fma(_836, _836, _1076);
    float _1096 = exp2(_1088);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1102 = 1.0 + _1100;
    float _1104 = _1080 * (-2.0);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1108 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1110 = isnan(1.0);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1098);
    float _1120 = 1.0 / _1102;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1106);
    float _1136 = float(_992);
    float _1138 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1122);
    float _1140 = -_126;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[76].x, _944);
    float _1144 = -_1096;
    float _1146 = _1144 + 1.0;
    float _1148 = -_126;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1092);
    float _1152 = float(_872);
    float _1154 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _842);
    float _1156 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1158 = _1132 ? _1146 : 0.0;
    float _1160 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1038);
    float _1162 = float(_1006);
    float _1164 = _1136 * _1152;
    float _1166 = float(_1068);
    float _1168 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _914);
    float _1170 = _722 + (-0.5);
    float _1172 = fma(_1104, _1084, _1084);
    float _1174 = fma(_1040, _1104, _1040);
    float _1176 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1118);
    float _1178 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1134);
    float _1180 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1138);
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1184 = _1156 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1188 = _1074 * _1186;
    bool _1190 = _1132;
    float _1192 = _1168;
    if (_1116)
    {
        float _1194 = _1158 * _1120;
        _132 = _1194;
    }
    float _1196 = _132;
    float _1198 = _1162 * _1166;
    float _1200 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1172);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1206 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _978 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1214 = _1072 * _1212;
    float _1216 = _1184 * _1184;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1220 = -_1188;
    float _1222 = fma(_1070, _1218, _1220);
    bool _1224 = _722 > 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1206 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = -_1214;
    float _1234 = fma(_1074, _1230, _1232);
    float _1236 = fma(_1210, _1210, _1216);
    float _1238 = _1222 * _1222;
    float _1240 = _600 + _722;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1244 = _1070 * _1242;
    float _1246 = fma(_1228, _1228, _1236);
    float _1248 = fma(_1234, _1234, _1238);
    float _1250 = _1240 + (-1.0);
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1254 = -_1244;
    float _1256 = fma(_1072, _1252, _1254);
    float _1258 = _1198 * (-2.0);
    float _1260 = _1164 * (-2.0);
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1264 = rsqrt(_1246);
    float _1266 = fma(_1258, _1082, _1082);
    float _1268 = fma(_1174, _1196, _1200);
    float _1270 = _600 + (-0.5);
    float _1272 = _600 + _728;
    float _1274 = fma(_1262, _1258, _1262);
    float _1276 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1266);
    float _1278 = _1272 + (-1.0);
    if (_884)
    {
        bool _1280 = _600 > 0.5;
        _1190 = _1280;
    }
    bool _1282 = _1190;
    float _1284 = fma(_1256, _1256, _1248);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1288 = _720 + _1286;
    bool _1290 = _728 > 0.5;
    float _1292 = fma(_1274, _1196, _1276);
    float _1294 = fma(_1260, _1086, _1086);
    float _1296 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1298 = _728 + (-0.5);
    float _1300 = _1204 * _880;
    float _1302 = fma(_966, _1288, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1304 = rsqrt(_1284);
    float _1306 = fma(_1296, _1260, _1296);
    float _1308 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1294);
    float _1310 = in.m_59.x;
    float _1312 = _1184 * _1264;
    float _1314 = _1268 * 0.15915493667125701904296875;
    float _1316 = fma(_1306, _1196, _1308);
    float _1318 = in.m_59.y;
    float _1320 = _1210 * _1264;
    float _1322 = _1292 * 0.15915493667125701904296875;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1326 = _720 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1330 = _720 + _1328;
    float _1332 = -_1320;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1336 = _1314 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = fma(_972, _1326, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1342 = -_1312;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1346 = fma(_1000, _1330, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1350 = _720 + _1348;
    float _1352 = _1316 * 0.15915493667125701904296875;
    float _1354 = _1344 * _1344;
    float _1356 = _1228 * _1264;
    float _1358 = _1314 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = fma(_988, _1350, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1364 = _1234 * _1304;
    float _1366 = _1222 * _1304;
    float _1368 = _1256 * _1304;
    float _1370 = _1322 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = fma(_1334, _1334, _1354);
    float _1376 = -_1356;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1382 = _720 + _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1386 = _720 + _1384;
    float _1388 = -_1318;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1378, _1378, _1374);
    float _1394 = fma(_1036, _1382, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1396 = _1322 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma(_1300, _1386, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1402 = _1300;
    float _1404 = _1386;
    float _1406 = _1318;
    if (!_884)
    {
        _1402 = _1310;
    }
    float _1408 = _1402;
    int _1410 = _1290 ? as_type<int>(_1390) : as_type<int>(_1318);
    float _1412 = _1408;
    if (!_884)
    {
        _1404 = _1408;
    }
    float _1414 = _1404;
    float _1416 = _1352 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1414;
    if (_884)
    {
        _1412 = _1310;
    }
    float _1422 = _1412;
    float _1424 = _1372 * _1338;
    float _1426 = _892 ? as_type<float>(_1410) : _1318;
    float _1428 = _1372 * _1360;
    float _1430 = _1422;
    if (_896)
    {
        float _1432 = _1224 ? _1390 : _1318;
        _1406 = _1432;
    }
    float _1434 = _1406;
    float _1436 = sqrt(_1392);
    float _1438 = _1398 * _1360;
    float _1440 = _1398 * _1338;
    float _1442 = _1352 * 6.283185482025146484375;
    float _1444 = sin(_1442);
    float _1446 = _1360 * _1418;
    float _1448 = _1372 * _1418;
    float _1450 = _1398 * _1418;
    float _1452 = _1338 * _1418;
    float _1454 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1456 = sqrt(_1094);
    float _1458 = _1264 * _1436;
    float _1460 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1462 = _1454 * _1458;
    float _1464 = _1460 * _1458;
    float _1466 = _814 * _1458;
    float _1468 = fma(_1444, _1438, _1424);
    float _1470 = -_1428;
    float _1472 = fma(_1444, _1440, _1470);
    float _1474 = -_1440;
    float _1476 = fma(_1444, _1428, _1474);
    float _1478 = fma(_1444, _1424, _1438);
    float _1480 = _1464 * _920;
    float _1482 = _1462 * _918;
    float _1484 = _1450 * _1070;
    float _1486 = _1072 * _1368;
    float _1488 = _1468 * _1070;
    float _1490 = _1472 * _1070;
    float _1492 = _1466 * _922;
    float _1494 = _1070 * _1366;
    float _1496 = -_1444;
    float _1498 = fma(_1496, _1364, _1484);
    float _1500 = _1450 * _1074;
    float _1502 = fma(_1446, _1364, _1488);
    float _1504 = fma(_1452, _1364, _1490);
    float _1506 = -_1486;
    float _1508 = fma(_1074, _1366, _1506);
    float _1510 = fma(_1456, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1512 = _1468 * _1074;
    float _1514 = _1472 * _1074;
    float _1516 = -_1494;
    float _1518 = fma(_1072, _1364, _1516);
    float _1520 = -_1444;
    float _1522 = fma(_1520, _1368, _1500);
    float _1524 = fma(_1448, _1508, _1498);
    float _1526 = fma(_1476, _1508, _1502);
    float _1528 = fma(_1478, _1508, _1504);
    float _1530 = fma(_1446, _1368, _1512);
    float _1532 = fma(_1452, _1368, _1514);
    float _1534 = fma(_1448, _1518, _1522);
    float _1536 = _1074 * _1364;
    bool _1538 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1540 = isnan(_720);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = fma(_1476, _1518, _1530);
    float _1552 = fma(_1478, _1518, _1532);
    float _1554 = _1480 * _1524;
    float _1556 = _1480 * _1534;
    bool _1558 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1560 = isnan(_720);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = -_1548;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1492, _1526, _1554);
    float _1576 = fma(_1492, _1550, _1556);
    bool _1578 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1580 = isnan(_720);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = -_1568;
    float _1592 = _1590 + 1.0;
    float _1594 = fma(_1482, _1528, _1574);
    float _1596 = _1568 * _1572;
    float _1598 = fma(_1482, _1552, _1576);
    bool _1600 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1602 = isnan(_720);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = _1588 * _1592;
    float _1614 = -_1588;
    float _1616 = _1614 + 1.0;
    float _1618 = precise::max(_1510, 0.3499999940395355224609375);
    float _1620 = _978 + _1594;
    float _1622 = _1206 + _1598;
    bool _1624 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1626 = isnan(_720);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = _1610 * _1616;
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    float _1642 = precise::min(_1618, 1.0);
    float _1644 = -_768;
    float _1646 = _1620 + _1644;
    float _1648 = -_818;
    float _1650 = _1622 + _1648;
    bool _1652 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1654 = isnan(_720);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = -_1634;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1646, _1642, _768);
    float _1670 = fma(_1650, _1642, _818);
    bool _1672 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1674 = isnan(_720);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = -_1662;
    float _1686 = _1684 + 1.0;
    float _1688 = _1662 * _1666;
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1692 = _1668 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1696 = _1670 + _1694;
    float _1698 = _1682 * _1686;
    float _1700 = _1450 * _1072;
    float _1702 = _1692 * _1692;
    float _1704 = _1696 * _1696;
    float _1706 = _1302 * _1698;
    float _1708 = -_1536;
    float _1710 = fma(_1070, _1368, _1708);
    float _1712 = -_1444;
    float _1714 = fma(_1712, _1366, _1700);
    float _1716 = _1702 + _1704;
    float _1718 = _1468 * _1072;
    float _1720 = _1472 * _1072;
    float _1722 = fma(_1448, _1710, _1714);
    float _1724 = sqrt(_1716);
    float _1726 = fma(_1446, _1366, _1718);
    float _1728 = _1634 * _1640;
    float _1730 = _1480 * _1722;
    float _1732 = fma(_1452, _1366, _1720);
    float _1734 = fma(_1476, _1710, _1726);
    float _1736 = -_1682;
    float _1738 = _1736 + 1.0;
    int _1740 = as_type<int>(_1718);
    float _1742 = _1702;
    float _1744 = _1704;
    float _1746 = _1668;
    float _1748 = _1670;
    if (_888)
    {
        float _1750 = -_1422;
        float _1752 = _1750 + 1.0;
        _1740 = as_type<int>(_1752);
    }
    int _1754 = _1740;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1758 = fma(_1492, _1734, _1730);
    float _1760 = fma(_1478, _1710, _1732);
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1706);
    float _1764 = fma(_1482, _1760, _1758);
    float _1766 = fma(_1340, _1688, _1762);
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1770 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = _1156 + _1764;
    float _1774 = fma(_1346, _1728, _1766);
    int _1776 = as_type<int>(_1762);
    if (_884)
    {
        float _1778 = -_1422;
        float _1780 = _1778 + 1.0;
        _1776 = as_type<int>(_1780);
    }
    int _1782 = _1776;
    float _1784 = -_960;
    float _1786 = _1772 + _1784;
    float _1788 = fma(_1362, _1636, _1774);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1792 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1794 = fma(_1786, _1642, _960);
    if (_884)
    {
        float _1796 = _1282 ? as_type<float>(_1782) : _1422;
        _1420 = _1796;
    }
    float _1798 = _1420;
    float _1800 = fma(_1394, _1612, _1788);
    float _1802 = fma(_1792, _1434, -0.5);
    if (_888)
    {
        float _1804 = _1224 ? as_type<float>(_1754) : _1422;
        _1430 = _1804;
    }
    float _1806 = _1430;
    float _1808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1810 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1812 = -_1168;
    float _1814 = fma(_1178, _1802, _1812);
    float _1816 = _1814;
    if (!_1770)
    {
        _1192 = _1794;
    }
    float _1818 = _1192;
    float _1820 = fma(_1426, _1810, -0.5);
    float _1822 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1824 = -_1160;
    float _1826 = fma(_1180, _1820, _1824);
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1830 = !_1770;
    float _1832 = _1818;
    if (!_1830)
    {
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1838 = _1724 + _1836;
        float _1840 = rsqrt(_1716);
        float _1842 = _1838 * _1834;
        float _1844 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = _1842 * 0.15915493667125701904296875;
        float _1848 = _1846 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = _1846 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        float _1856 = fma(_1850, _1844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1858 = _1840 * _1856;
        float _1860 = fma(_1692, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1862 = _1854 + (-1.0);
        float _1864 = fma(_1696, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1868 = _1860 + _1866;
        float _1870 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1874 = _1864 + _1872;
        float _1876 = _1868 * _1868;
        float _1878 = fma(_1794, _1854, _1870);
        float _1880 = _1874 * _1874;
        _1832 = _1878;
        _1742 = _1876;
        _1744 = _1880;
        _1746 = _1860;
        _1748 = _1864;
    }
    float _1882 = _1832;
    float _1884 = _1742;
    float _1886 = _1744;
    float _1888 = _1746;
    float _1890 = _1748;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1894 = _1882 + _1892;
    float _1896 = fma(_1822, _1798, -0.5);
    float _1898 = fma(_1828, _1806, -0.5);
    float _1900 = fma(_1400, _1596, _1800);
    float _1902 = fma(_1894, _1894, _1884);
    float _1904 = fma(_1176, _1896, _1142);
    float _1906 = fma(_1154, _1898, _1150);
    float _1908 = _1902 + _1886;
    float _1910 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1900);
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1914 = sqrt(_1908);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1926 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1928 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1930 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1814 + 0.5;
    float _1940 = _1826 + 0.5;
    float _1942 = _1904 + 0.5;
    float _1944 = _1906 + 0.5;
    float _1946 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1948 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1950 = isnan(_1914);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1956 = _1952 || _1954;
    out.m_63.x = _1932;
    out.m_63.y = _1934;
    out.m_63.z = _1936;
    out.m_65.x = _1942;
    out.m_65.y = _1938;
    out.m_67.x = _1944;
    out.m_67.y = _1940;
    float _1958 = _1904;
    float _1960 = _1882;
    if (!_1956)
    {
        _1958 = 1.0;
    }
    float _1962 = _1958;
    out.m_69.x = _1926;
    out.m_69.y = _1928;
    out.m_69.z = _1930;
    out.m_69.w = _1946;
    bool _1964 = !_1956;
    float _1966 = _1962;
    if (!_1964)
    {
        bool _1968 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1970 = isnan(_1914);
        bool _1972 = _1968 || _1970;
        bool _1974 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1976 = _1972 || _1974;
        if (!_1976)
        {
            float _1978 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1980 = _1914 + _1978;
            float _1982 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1984 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1990 = 1.0 / _1984;
            float _1992 = _1980 * _1990;
            float _1994 = fma(_1992, _1988, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1966 = _1994;
            _1996 = true;
        }
        else
        {
            bool _1998 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2000 = isnan(_1914);
            bool _2002 = _1998 || _2000;
            bool _2004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2006 = _2002 || _2004;
            if (!_2006)
            {
                float _2008 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2010 = _1914 + _2008;
                float _2012 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2014 = _2012 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2018 = _2016 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2020 = 1.0 / _2014;
                float _2022 = _2010 * _2020;
                float _2024 = fma(_2022, _2018, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1966 = _2024;
                _1996 = true;
            }
            else
            {
                _1966 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1996 = false;
    float _2026 = _1966;
    float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2030 = _1882 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2034 = _1888 + _2032;
    float _2036 = fma(_2030, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2038 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2040 = _1890 + _2038;
    float _2042 = fma(_2034, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2044 = -_1312;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2036);
    float _2048 = fma(_2040, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2050 = -_1320;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2046 + _2054;
    float _2058 = -_1356;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2064 = _2052 + _2062;
    float _2066 = _2056 * _2056;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2060 + _2068;
    float _2072 = fma(_2064, _2064, _2066);
    float _2074 = fma(_2070, _2070, _2072);
    float _2076 = rsqrt(_2074);
    float _2078 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2080 = _2064 * _2078;
    float _2082 = _2070 * _2078;
    float _2084 = _2080 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 + _2086;
    float _2090 = sqrt(_2088);
    bool _2092 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = _2090 + _2094;
    float _2098 = _2070;
    float _2100 = _2096;
    float _2102 = _2056;
    float _2104 = _2078;
    if (_2092)
    {
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2106;
    }
    float _2108 = _2098;
    if (_2092)
    {
        float _2110 = rsqrt(_2088);
        _1816 = _2110;
    }
    float _2112 = _1816;
    float _2114 = _2112;
    if (_2092)
    {
        float _2116 = _2096 * _2108;
        _2100 = _2116;
    }
    float _2118 = _2100;
    if (_2092)
    {
        float _2120 = _2118 * 0.15915493667125701904296875;
        _1960 = _2120;
    }
    float _2122 = _1960;
    float _2124 = _2076;
    if (_2092)
    {
        float _2126 = _2122 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        _2124 = _2128;
    }
    float _2130 = _2124;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2134 = precise::max(0.0, _2132);
    float _2136 = _2072;
    float _2138 = _2132;
    if (_2092)
    {
        float _2140 = _2122 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        _2136 = _2142;
    }
    float _2144 = _2136;
    float _2146 = -_2078;
    float _2148 = -_2134;
    float _2150 = fma(_2056, _2146, _2148);
    float _2152 = _2150;
    if (_2092)
    {
        float _2154 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2138 = _2154;
    }
    float _2156 = _2138;
    float _2158 = sqrt(_2074);
    float _2160 = _2130;
    float _2162 = _2156;
    if (_2092)
    {
        float _2164 = fma(_2130, _2156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2102 = _2164;
    }
    float _2166 = _2102;
    float _2168 = _2166;
    if (!_2092)
    {
        _2160 = _2080;
    }
    float _2170 = _2160;
    float _2172 = _2170;
    float _2174 = _2144;
    if (_2092)
    {
        float _2176 = _2144 + (-1.0);
        _2162 = _2176;
    }
    float _2178 = _2162;
    float _2180 = _2178;
    if (_2092)
    {
        float _2182 = _2112 * _2166;
        _2104 = _2182;
    }
    float _2184 = _2104;
    if (!_2092)
    {
        _2168 = _2084;
    }
    float _2186 = _2168;
    float _2188 = _2186;
    if (_2092)
    {
        float _2190 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2190;
    }
    float _2192 = _2114;
    if (_2092)
    {
        float _2194 = _2080 * _2184;
        _2172 = _2194;
    }
    float _2196 = _2172;
    if (!_2092)
    {
        _2180 = _2082;
    }
    float _2198 = _2180;
    float _2200 = _2198;
    if (_2092)
    {
        float _2202 = _2082 * _2184;
        _2200 = _2202;
    }
    float _2204 = _2200;
    if (_2092)
    {
        float _2206 = fma(_2150, _2144, _2192);
        _2152 = _2206;
    }
    float _2208 = _2152;
    if (_2092)
    {
        float _2210 = _2196 * _2196;
        _2188 = _2210;
    }
    float _2212 = _2188;
    if (!_2092)
    {
        _2174 = _2086;
    }
    float _2214 = _2174;
    float _2216 = _2214;
    if (_2092)
    {
        float _2218 = _2204 * _2204;
        _2216 = _2218;
    }
    float _2220 = _2216;
    float _2222 = fma(_2208, _2208, _2212);
    float _2224 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2226 = _2222 + _2220;
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2230 = fma(_2158, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2228);
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2224);
    float _2236 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2238 = rsqrt(_2226);
    float _2240 = -_2232;
    float _2242 = _2240 + 1.0;
    float _2244 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2234);
    float _2246 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2236);
    float _2250 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2252 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2254 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2246);
    float _2256 = abs(_2242);
    float _2258 = log2(_2256);
    float _2260 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2248);
    float _2262 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2250);
    float _2264 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2254);
    float _2266 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2270 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2262);
    float _2272 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2274 = _2238 * _2196;
    float _2276 = _2238 * _2208;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = _2238 * _2204;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2284 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2288 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2290 = -_2282;
    float _2292 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2290);
    float _2294 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2296 = -_2284;
    float _2298 = fma(_2296, _2266, 1.0);
    float _2300 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2302 = -_2280;
    float _2304 = fma(_2302, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2292);
    float _2306 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2308 = exp2(_2294);
    float _2310 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2312 = fma(_2304, -0.5, 0.5);
    float _2314 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2306);
    float _2316 = fma(_2304, 0.5, 0.5);
    float _2318 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2310);
    float _2320 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2288);
    float _2322 = log2(_2298);
    float _2324 = _2276 + 1.0;
    float _2326 = fma(_2316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2328 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2318);
    float _2330 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2320);
    float _2332 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2328);
    float _2334 = 1.0 / _2314;
    float _2336 = -_2276;
    float _2338 = fma(_2308, _2324, _2336);
    float _2340 = fma(_2316, _2326, -0.212114393711090087890625);
    float _2342 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2330);
    float _2344 = fma(_2338, 0.5, 0.5);
    float _2346 = fma(_2316, _2340, 1.570728778839111328125);
    float _2348 = sqrt(_2312);
    float _2350 = _2322 * 0.693147182464599609375;
    float _2352 = _2332 * _2334;
    float _2354 = _2342 * _2334;
    float _2356 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2358 = fma(_2352, 0.5, 0.5);
    float _2360 = fma(_2354, -0.5, 0.5);
    float _2362 = _2348 * 0.636619746685028076171875;
    float _2364 = -_2346;
    float _2366 = fma(_2362, _2364, 1.0);
    float3 _6264 = float3(_2358, _2360, _2356);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6264, float3(0.0), isnan(_6264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6264, float3(0.0), isnan(_6264)), level(0.0)).x;
    float3 _6275 = float3(_2358, _2360, _2356);
    float4 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6275, float3(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6275, float3(0.0), isnan(_6275)), level(0.0)).xyzw;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = _2371.w;
    float2 _6292 = float2(_2366, _2344);
    float3 _2383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6292, float2(0.0), isnan(_6292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6292, float2(0.0), isnan(_6292)), level(0.0)).xyz;
    float _2385 = _2383.x;
    float _2387 = _2383.y;
    float _2389 = _2383.z;
    float _2391 = -_1312;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _2395 = -_1320;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _2399 = -_1356;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1206);
    float _2403 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2405 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2407 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2409 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2411 = fma(_2397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2405);
    float _2413 = fma(_2397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2407);
    float _2415 = exp2(_2403);
    float _2417 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2409);
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2411);
    float _2421 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2413);
    float _2423 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2417);
    float _2425 = _2419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2427 = _2421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2429 = 1.0 / _2425;
    bool _2431 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(0.5);
    bool _2439 = _2435 || _2437;
    float _2441 = _2427 + _2425;
    float _2443 = _2401;
    if (_2439)
    {
        _2443 = 1.0;
    }
    float _2445 = _2443;
    float _2447 = _2441 * _2429;
    float _2449 = _2447 * 0.5;
    float _2451 = _2445;
    if (!_2439)
    {
        float _2453 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2455);
        float _2459 = _2453 * 0.15915493667125701904296875;
        float _2461 = _2459 * 6.283185482025146484375;
        float _2463 = cos(_2461);
        float _2465 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2467 = _2465 * 0.15915493667125701904296875;
        float _2469 = _2459 * 6.283185482025146484375;
        float _2471 = sin(_2469);
        float _2473 = 1.0 / _2463;
        float _2475 = _2467 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = _2471 * _2473;
        float _2481 = 1.0 / _2457;
        float _2483 = _2477 * _2479;
        float _2485 = _2467 * 6.283185482025146484375;
        float _2487 = sin(_2485);
        float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2491 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2489;
        float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2495 = _2481 * _2493;
        float _2497 = 1.0 / _2483;
        float _2499 = 1.0 / _2491;
        float _2501 = _2487 * _2497;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2505 = fma(_2501, _2495, _2503);
        float _2507 = _2505 * _2499;
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -_2509;
        float _2513 = _2511 + 1.0;
        _2451 = _2513;
    }
    float _2515 = _2451;
    float _2517 = -_2415;
    float _2519 = _2517 + 1.0;
    float _2521 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2423);
    float _2523 = _2515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2525 = _2515 > 0.0;
    bool _2527 = isnan(_2515);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2537 = _2521 + _2314;
    float _2539 = _688 * _2523;
    float _2541 = _2535 * _2368;
    float _2543 = _2537 * 0.5;
    float _2545 = _2539 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2547 = -_2535;
    float _2549 = _2547 + 1.0;
    float _2551 = _2379 * _2541;
    float _2553 = _2389 * _2541;
    float _2555 = _2379 * _2549;
    float _2557 = fma(_2385, _2551, _2373);
    float _2559 = fma(_2387, _2551, _2375);
    float _2561 = fma(_2379, _2553, _2377);
    out.gl_Position.x = _2332;
    out.gl_Position.y = _2342;
    out.gl_Position.z = _2521;
    out.gl_Position.w = _2314;
    out.m_71.z = _2543;
    out.m_71.w = _2314;
    out.m_47.x = _2545;
    out.m_73.x = _2557;
    out.m_73.y = _2559;
    out.m_73.z = _2561;
    out.m_73.w = _2555;
    if (_2533)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2563 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2563;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1996 = false;
    bool _712 = false;
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
        float _2620 = as_type<float>(_108);
        out.gl_Position.z = _2620;
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
    float _128 = 0.0;
    float _130 = 0.0;
    float _132 = _126;
    if (_122)
    {
        float _134 = float(_92);
        _128 = _134;
    }
    float _136 = _128;
    bool _138 = _126 >= _136;
    bool _140 = !_122;
    bool _142 = _138 || _140;
    if (_142)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _102;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    float _150 = as_type<float>(_148);
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_148);
        out.gl_Position.z = _2691;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _158;
    if (!_168)
    {
        float _172 = _158 * _158;
        float _174 = _172 * 0.5;
        _150 = _174;
    }
    float _176 = _150;
    float _178 = 0.0;
    float _180 = _176;
    if (!_168)
    {
        float _182 = _126 * _126;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_168)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_168;
    float _194 = _190;
    float _196 = 0.0;
    if (!_192)
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
        _130 = _214;
        _194 = _226;
        _196 = _216;
    }
    float _228 = _130;
    float _230 = _194;
    float _232 = _196;
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
        _170 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _170;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _126;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
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
        float _294 = _126 * _286;
        float _296 = exp2(_294);
        float _298 = _292 * 0.693147182464599609375;
        float _300 = 1.0 / _298;
        float _302 = 1.0 / _290;
        float _304 = _296 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _300, _126);
        float _310 = _308 * _302;
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
        float _328 = _126 * _320;
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
    float _350 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_264, _152, _342);
    float _354 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_264, _156, _350);
    float _364 = fma(_338, _156, _354);
    float _366 = -_356;
    float _368 = _352 + _366;
    float _370 = _360 * _360;
    float _372 = in.m_51.w;
    float _374 = -_364;
    float _376 = _362 + _374;
    float _378 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = fma(_368, _368, _370);
    float _382 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = fma(_376, _376, _380);
    float _390 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _392 = in.m_44.x;
    float _394 = in.m_44.y;
    float _396 = in.m_44.z;
    float _398 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _402 = sqrt(_388);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _406 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _400);
    bool _408 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_402);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_352, _372, _392);
    float _420 = fma(_344, _372, _394);
    float _422 = fma(_362, _372, _396);
    float _424 = _362;
    float _426 = _404;
    float _428 = _406;
    if (_416)
    {
        _424 = _398;
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
            _426 = _468;
            _432 = _466;
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
                    _426 = _522;
                    _432 = _520;
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
                    _426 = _556;
                    _432 = _554;
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
                _426 = _590;
                _432 = _588;
                _428 = _592;
            }
        }
    }
    _472 = false;
    float _594 = _426;
    float _596 = _432;
    float _598 = _428;
    float _600 = in.m_53.x;
    float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _604 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _612 = _610 != 0;
    int _614 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _616 = _614 != 0;
    float _618 = _604 * _602;
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[20].x, _618);
    float _622 = _620 * 6.283185482025146484375;
    float _624 = floor(_620);
    float _626 = _622 * 0.15915493667125701904296875;
    bool _628 = !_608;
    int _630 = _628 ? 0 : 1;
    int _632 = abs(_630);
    float _634 = _626 * 6.283185482025146484375;
    float _636 = cos(_634);
    bool _638 = !_616;
    int _640 = _638 ? 0 : 1;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _644 = abs(_640);
    float _646 = -_624;
    float _648 = _620 + _646;
    bool _650 = !_612;
    int _652 = _650 ? 0 : 1;
    float _654 = float(_632);
    int _656 = abs(_652);
    float _658 = -_648;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _662 = _648 < 0.5;
    float _664 = float(_662);
    float _666 = fma(_636, 0.5, 0.5);
    float _668 = abs(_660);
    float _670 = _654 * _668;
    float _672 = float(_644);
    float _674 = -_664;
    float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _678 = -_666;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_656);
    float _684 = fma(_672, _680, _670);
    float _686 = abs(_676);
    float _688 = fma(_682, _686, _684);
    bool _690 = !_642;
    float _692 = as_type<float>(_644);
    float _694 = _670;
    float _710;
    if (!_690)
    {
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _698 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        float _714 = float(_92);
        float _716 = 1.0 / _714;
        float _718 = _126 * _716;
        _710 = _718;
    }
    _712 = false;
    float _720 = _710;
    float _722 = in.m_53.y;
    float _724 = _600 * 2.0;
    float _726 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = in.m_53.z;
    float _730 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = floor(_724);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = in.m_51.x;
    float _740 = in.m_51.y;
    float _742 = in.m_51.z;
    float _744 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _746 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _748 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _744);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _752;
    if (_736)
    {
        _692 = _600;
    }
    float _756 = _692;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = _722 * 2.0;
    bool _764 = _732 > 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _768 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _766;
    bool _770 = _732 >= 0.0;
    bool _772 = isnan(_732);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = _756;
    if (_736)
    {
        _694 = _722;
    }
    float _782 = _694;
    float _784 = floor(_762);
    int _786 = _778 ? 0 : 1;
    float _788 = _782;
    if (!_736)
    {
        _780 = _728;
    }
    float _790 = _780;
    float _792 = _738 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _794 = ~_786;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = _742 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _802 = _798;
    if (!_736)
    {
        _788 = _600;
    }
    float _804 = _788;
    float _806 = _740 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    if (!_764)
    {
        int _808 = ~_786;
        int _810 = _808 + 1;
        _802 = _810;
    }
    int _812 = _802;
    float _814 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _818 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _816;
    bool _820 = _784 > 0.0;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _824 = _784 >= 0.0;
    bool _826 = isnan(_784);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = -_818;
    float _836 = _834 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _840 = _832 ? 0 : 1;
    float _842 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[88].z, _838);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    int _860 = ~_840;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    int _866 = _864;
    if (!_820)
    {
        int _868 = ~_840;
        int _870 = _868 + 1;
        _866 = _870;
    }
    int _872 = _866;
    float _874 = in.m_55.x;
    float _876 = in.m_55.y;
    float _878 = in.m_55.z;
    float _880 = 1.0 / _858;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _896 = _894 != 0;
    float _898 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _904 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _898);
    float _906 = 1.0 / _902;
    float _908 = _722 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _914 = fma(_908, -2.0, _750);
    float _916 = 1.0 / _912;
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _878);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _876);
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _874);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _932 = _600 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _936 = 1.0 / _930;
    float _938 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _904);
    float _940 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _746);
    float _942 = -_934;
    float _944 = fma(_932, 2.0, _942);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _960 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _958;
    float _962 = 1.0 / _926;
    float _964 = _728 * 2.0;
    float _966 = _754 * _906;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _968;
    float _972 = _760 * _916;
    bool _974 = !_854;
    int _976 = _974 ? 0 : 1;
    float _978 = _938 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _980 = !_846;
    int _982 = _980 ? 0 : 1;
    float _984 = floor(_964);
    float _986 = _594 * _594;
    float _988 = _956 * _936;
    float _990 = fma(_596, _596, _986);
    int _992 = abs(_976);
    float _994 = 1.0 / _948;
    bool _996 = !_850;
    int _998 = _996 ? 0 : 1;
    float _1000 = _952 * _962;
    float _1002 = -_960;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1006 = abs(_982);
    int _1008 = abs(_998);
    float _1010 = _1004 * _1004;
    bool _1012 = _984 >= 0.0;
    bool _1014 = isnan(_984);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    float _1022 = fma(_598, _598, _990);
    float _1024 = _722 + _728;
    float _1026 = _804 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1028 = _1020 ? 0 : 1;
    bool _1030 = _984 > 0.0;
    float _1032 = rsqrt(_1022);
    float _1034 = _1024 + (-1.0);
    float _1036 = _970 * _994;
    float _1038 = fma(_1026, -2.0, _822);
    float _1040 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = -_768;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1046 = ~_1028;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    float _1052 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1054 = log2(_1052);
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1058 = float(_1008);
    float _1060 = float(_812);
    int _1062 = _1050;
    if (!_1030)
    {
        int _1064 = ~_1028;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    float _1070 = _1032 * _596;
    float _1072 = _1032 * _594;
    float _1074 = _1032 * _598;
    float _1076 = fma(_1044, _1044, _1010);
    float _1078 = _790 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1080 = _1058 * _1060;
    float _1082 = in.m_57.x;
    float _1084 = in.m_57.y;
    float _1086 = in.m_57.z;
    float _1088 = _1054 * _126;
    float _1090 = -_1056;
    float _1092 = fma(_1078, 2.0, _1090);
    float _1094 = fma(_836, _836, _1076);
    float _1096 = exp2(_1088);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1102 = 1.0 + _1100;
    float _1104 = _1080 * (-2.0);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1108 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1110 = isnan(1.0);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1098);
    float _1120 = 1.0 / _1102;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1106);
    float _1136 = float(_992);
    float _1138 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1122);
    float _1140 = -_126;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[76].x, _944);
    float _1144 = -_1096;
    float _1146 = _1144 + 1.0;
    float _1148 = -_126;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1092);
    float _1152 = float(_872);
    float _1154 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _842);
    float _1156 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1158 = _1132 ? _1146 : 0.0;
    float _1160 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1038);
    float _1162 = float(_1006);
    float _1164 = _1136 * _1152;
    float _1166 = float(_1068);
    float _1168 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _914);
    float _1170 = _722 + (-0.5);
    float _1172 = fma(_1104, _1084, _1084);
    float _1174 = fma(_1040, _1104, _1040);
    float _1176 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1118);
    float _1178 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1134);
    float _1180 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1138);
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1184 = _1156 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1188 = _1074 * _1186;
    bool _1190 = _1132;
    float _1192 = _1168;
    if (_1116)
    {
        float _1194 = _1158 * _1120;
        _132 = _1194;
    }
    float _1196 = _132;
    float _1198 = _1162 * _1166;
    float _1200 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1172);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1206 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _978 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1214 = _1072 * _1212;
    float _1216 = _1184 * _1184;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1220 = -_1188;
    float _1222 = fma(_1070, _1218, _1220);
    bool _1224 = _722 > 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1206 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = -_1214;
    float _1234 = fma(_1074, _1230, _1232);
    float _1236 = fma(_1210, _1210, _1216);
    float _1238 = _1222 * _1222;
    float _1240 = _600 + _722;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1244 = _1070 * _1242;
    float _1246 = fma(_1228, _1228, _1236);
    float _1248 = fma(_1234, _1234, _1238);
    float _1250 = _1240 + (-1.0);
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1254 = -_1244;
    float _1256 = fma(_1072, _1252, _1254);
    float _1258 = _1198 * (-2.0);
    float _1260 = _1164 * (-2.0);
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1264 = rsqrt(_1246);
    float _1266 = fma(_1258, _1082, _1082);
    float _1268 = fma(_1174, _1196, _1200);
    float _1270 = _600 + (-0.5);
    float _1272 = _600 + _728;
    float _1274 = fma(_1262, _1258, _1262);
    float _1276 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1266);
    float _1278 = _1272 + (-1.0);
    if (_884)
    {
        bool _1280 = _600 > 0.5;
        _1190 = _1280;
    }
    bool _1282 = _1190;
    float _1284 = fma(_1256, _1256, _1248);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1288 = _720 + _1286;
    bool _1290 = _728 > 0.5;
    float _1292 = fma(_1274, _1196, _1276);
    float _1294 = fma(_1260, _1086, _1086);
    float _1296 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1298 = _728 + (-0.5);
    float _1300 = _1204 * _880;
    float _1302 = fma(_966, _1288, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1304 = rsqrt(_1284);
    float _1306 = fma(_1296, _1260, _1296);
    float _1308 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1294);
    float _1310 = in.m_59.x;
    float _1312 = _1184 * _1264;
    float _1314 = _1268 * 0.15915493667125701904296875;
    float _1316 = fma(_1306, _1196, _1308);
    float _1318 = in.m_59.y;
    float _1320 = _1210 * _1264;
    float _1322 = _1292 * 0.15915493667125701904296875;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1326 = _720 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1330 = _720 + _1328;
    float _1332 = -_1320;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1336 = _1314 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = fma(_972, _1326, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1342 = -_1312;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1346 = fma(_1000, _1330, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1350 = _720 + _1348;
    float _1352 = _1316 * 0.15915493667125701904296875;
    float _1354 = _1344 * _1344;
    float _1356 = _1228 * _1264;
    float _1358 = _1314 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = fma(_988, _1350, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1364 = _1234 * _1304;
    float _1366 = _1222 * _1304;
    float _1368 = _1256 * _1304;
    float _1370 = _1322 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = fma(_1334, _1334, _1354);
    float _1376 = -_1356;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1382 = _720 + _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1386 = _720 + _1384;
    float _1388 = -_1318;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1378, _1378, _1374);
    float _1394 = fma(_1036, _1382, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1396 = _1322 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma(_1300, _1386, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1402 = _1300;
    float _1404 = _1386;
    float _1406 = _1318;
    if (!_884)
    {
        _1402 = _1310;
    }
    float _1408 = _1402;
    int _1410 = _1290 ? as_type<int>(_1390) : as_type<int>(_1318);
    float _1412 = _1408;
    if (!_884)
    {
        _1404 = _1408;
    }
    float _1414 = _1404;
    float _1416 = _1352 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1414;
    if (_884)
    {
        _1412 = _1310;
    }
    float _1422 = _1412;
    float _1424 = _1372 * _1338;
    float _1426 = _892 ? as_type<float>(_1410) : _1318;
    float _1428 = _1372 * _1360;
    float _1430 = _1422;
    if (_896)
    {
        float _1432 = _1224 ? _1390 : _1318;
        _1406 = _1432;
    }
    float _1434 = _1406;
    float _1436 = sqrt(_1392);
    float _1438 = _1398 * _1360;
    float _1440 = _1398 * _1338;
    float _1442 = _1352 * 6.283185482025146484375;
    float _1444 = sin(_1442);
    float _1446 = _1360 * _1418;
    float _1448 = _1372 * _1418;
    float _1450 = _1398 * _1418;
    float _1452 = _1338 * _1418;
    float _1454 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1456 = sqrt(_1094);
    float _1458 = _1264 * _1436;
    float _1460 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1462 = _1454 * _1458;
    float _1464 = _1460 * _1458;
    float _1466 = _814 * _1458;
    float _1468 = fma(_1444, _1438, _1424);
    float _1470 = -_1428;
    float _1472 = fma(_1444, _1440, _1470);
    float _1474 = -_1440;
    float _1476 = fma(_1444, _1428, _1474);
    float _1478 = fma(_1444, _1424, _1438);
    float _1480 = _1464 * _920;
    float _1482 = _1462 * _918;
    float _1484 = _1450 * _1070;
    float _1486 = _1072 * _1368;
    float _1488 = _1468 * _1070;
    float _1490 = _1472 * _1070;
    float _1492 = _1466 * _922;
    float _1494 = _1070 * _1366;
    float _1496 = -_1444;
    float _1498 = fma(_1496, _1364, _1484);
    float _1500 = _1450 * _1074;
    float _1502 = fma(_1446, _1364, _1488);
    float _1504 = fma(_1452, _1364, _1490);
    float _1506 = -_1486;
    float _1508 = fma(_1074, _1366, _1506);
    float _1510 = fma(_1456, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1512 = _1468 * _1074;
    float _1514 = _1472 * _1074;
    float _1516 = -_1494;
    float _1518 = fma(_1072, _1364, _1516);
    float _1520 = -_1444;
    float _1522 = fma(_1520, _1368, _1500);
    float _1524 = fma(_1448, _1508, _1498);
    float _1526 = fma(_1476, _1508, _1502);
    float _1528 = fma(_1478, _1508, _1504);
    float _1530 = fma(_1446, _1368, _1512);
    float _1532 = fma(_1452, _1368, _1514);
    float _1534 = fma(_1448, _1518, _1522);
    float _1536 = _1074 * _1364;
    bool _1538 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1540 = isnan(_720);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = fma(_1476, _1518, _1530);
    float _1552 = fma(_1478, _1518, _1532);
    float _1554 = _1480 * _1524;
    float _1556 = _1480 * _1534;
    bool _1558 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1560 = isnan(_720);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = -_1548;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1492, _1526, _1554);
    float _1576 = fma(_1492, _1550, _1556);
    bool _1578 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1580 = isnan(_720);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = -_1568;
    float _1592 = _1590 + 1.0;
    float _1594 = fma(_1482, _1528, _1574);
    float _1596 = _1568 * _1572;
    float _1598 = fma(_1482, _1552, _1576);
    bool _1600 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1602 = isnan(_720);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = _1588 * _1592;
    float _1614 = -_1588;
    float _1616 = _1614 + 1.0;
    float _1618 = precise::max(_1510, 0.3499999940395355224609375);
    float _1620 = _978 + _1594;
    float _1622 = _1206 + _1598;
    bool _1624 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1626 = isnan(_720);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = _1610 * _1616;
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    float _1642 = precise::min(_1618, 1.0);
    float _1644 = -_768;
    float _1646 = _1620 + _1644;
    float _1648 = -_818;
    float _1650 = _1622 + _1648;
    bool _1652 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1654 = isnan(_720);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = -_1634;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1646, _1642, _768);
    float _1670 = fma(_1650, _1642, _818);
    bool _1672 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1674 = isnan(_720);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = -_1662;
    float _1686 = _1684 + 1.0;
    float _1688 = _1662 * _1666;
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1692 = _1668 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1696 = _1670 + _1694;
    float _1698 = _1682 * _1686;
    float _1700 = _1450 * _1072;
    float _1702 = _1692 * _1692;
    float _1704 = _1696 * _1696;
    float _1706 = _1302 * _1698;
    float _1708 = -_1536;
    float _1710 = fma(_1070, _1368, _1708);
    float _1712 = -_1444;
    float _1714 = fma(_1712, _1366, _1700);
    float _1716 = _1702 + _1704;
    float _1718 = _1468 * _1072;
    float _1720 = _1472 * _1072;
    float _1722 = fma(_1448, _1710, _1714);
    float _1724 = sqrt(_1716);
    float _1726 = fma(_1446, _1366, _1718);
    float _1728 = _1634 * _1640;
    float _1730 = _1480 * _1722;
    float _1732 = fma(_1452, _1366, _1720);
    float _1734 = fma(_1476, _1710, _1726);
    float _1736 = -_1682;
    float _1738 = _1736 + 1.0;
    int _1740 = as_type<int>(_1718);
    float _1742 = _1702;
    float _1744 = _1704;
    float _1746 = _1668;
    float _1748 = _1670;
    if (_888)
    {
        float _1750 = -_1422;
        float _1752 = _1750 + 1.0;
        _1740 = as_type<int>(_1752);
    }
    int _1754 = _1740;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1758 = fma(_1492, _1734, _1730);
    float _1760 = fma(_1478, _1710, _1732);
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1706);
    float _1764 = fma(_1482, _1760, _1758);
    float _1766 = fma(_1340, _1688, _1762);
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1770 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = _1156 + _1764;
    float _1774 = fma(_1346, _1728, _1766);
    int _1776 = as_type<int>(_1762);
    if (_884)
    {
        float _1778 = -_1422;
        float _1780 = _1778 + 1.0;
        _1776 = as_type<int>(_1780);
    }
    int _1782 = _1776;
    float _1784 = -_960;
    float _1786 = _1772 + _1784;
    float _1788 = fma(_1362, _1636, _1774);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1792 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1794 = fma(_1786, _1642, _960);
    if (_884)
    {
        float _1796 = _1282 ? as_type<float>(_1782) : _1422;
        _1420 = _1796;
    }
    float _1798 = _1420;
    float _1800 = fma(_1394, _1612, _1788);
    float _1802 = fma(_1792, _1434, -0.5);
    if (_888)
    {
        float _1804 = _1224 ? as_type<float>(_1754) : _1422;
        _1430 = _1804;
    }
    float _1806 = _1430;
    float _1808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1810 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1812 = -_1168;
    float _1814 = fma(_1178, _1802, _1812);
    float _1816 = _1814;
    if (!_1770)
    {
        _1192 = _1794;
    }
    float _1818 = _1192;
    float _1820 = fma(_1426, _1810, -0.5);
    float _1822 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1824 = -_1160;
    float _1826 = fma(_1180, _1820, _1824);
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1830 = !_1770;
    float _1832 = _1818;
    if (!_1830)
    {
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1838 = _1724 + _1836;
        float _1840 = rsqrt(_1716);
        float _1842 = _1838 * _1834;
        float _1844 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = _1842 * 0.15915493667125701904296875;
        float _1848 = _1846 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = _1846 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        float _1856 = fma(_1850, _1844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1858 = _1840 * _1856;
        float _1860 = fma(_1692, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1862 = _1854 + (-1.0);
        float _1864 = fma(_1696, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1868 = _1860 + _1866;
        float _1870 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1874 = _1864 + _1872;
        float _1876 = _1868 * _1868;
        float _1878 = fma(_1794, _1854, _1870);
        float _1880 = _1874 * _1874;
        _1832 = _1878;
        _1742 = _1876;
        _1744 = _1880;
        _1746 = _1860;
        _1748 = _1864;
    }
    float _1882 = _1832;
    float _1884 = _1742;
    float _1886 = _1744;
    float _1888 = _1746;
    float _1890 = _1748;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1894 = _1882 + _1892;
    float _1896 = fma(_1822, _1798, -0.5);
    float _1898 = fma(_1828, _1806, -0.5);
    float _1900 = fma(_1400, _1596, _1800);
    float _1902 = fma(_1894, _1894, _1884);
    float _1904 = fma(_1176, _1896, _1142);
    float _1906 = fma(_1154, _1898, _1150);
    float _1908 = _1902 + _1886;
    float _1910 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1900);
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1914 = sqrt(_1908);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1926 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1928 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1930 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1814 + 0.5;
    float _1940 = _1826 + 0.5;
    float _1942 = _1904 + 0.5;
    float _1944 = _1906 + 0.5;
    float _1946 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1948 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1950 = isnan(_1914);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1956 = _1952 || _1954;
    out.m_63.x = _1932;
    out.m_63.y = _1934;
    out.m_63.z = _1936;
    out.m_65.x = _1942;
    out.m_65.y = _1938;
    out.m_67.x = _1944;
    out.m_67.y = _1940;
    float _1958 = _1904;
    float _1960 = _1882;
    if (!_1956)
    {
        _1958 = 1.0;
    }
    float _1962 = _1958;
    out.m_69.x = _1926;
    out.m_69.y = _1928;
    out.m_69.z = _1930;
    out.m_69.w = _1946;
    bool _1964 = !_1956;
    float _1966 = _1962;
    if (!_1964)
    {
        bool _1968 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1970 = isnan(_1914);
        bool _1972 = _1968 || _1970;
        bool _1974 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1976 = _1972 || _1974;
        if (!_1976)
        {
            float _1978 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1980 = _1914 + _1978;
            float _1982 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1984 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1990 = 1.0 / _1984;
            float _1992 = _1980 * _1990;
            float _1994 = fma(_1992, _1988, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1966 = _1994;
            _1996 = true;
        }
        else
        {
            bool _1998 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2000 = isnan(_1914);
            bool _2002 = _1998 || _2000;
            bool _2004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2006 = _2002 || _2004;
            if (!_2006)
            {
                float _2008 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2010 = _1914 + _2008;
                float _2012 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2014 = _2012 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2018 = _2016 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2020 = 1.0 / _2014;
                float _2022 = _2010 * _2020;
                float _2024 = fma(_2022, _2018, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1966 = _2024;
                _1996 = true;
            }
            else
            {
                _1966 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1996 = false;
    float _2026 = _1966;
    float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2030 = _1882 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2034 = _1888 + _2032;
    float _2036 = fma(_2030, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2038 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2040 = _1890 + _2038;
    float _2042 = fma(_2034, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2044 = -_1312;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2036);
    float _2048 = fma(_2040, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2050 = -_1320;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2046 + _2054;
    float _2058 = -_1356;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2064 = _2052 + _2062;
    float _2066 = _2056 * _2056;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2060 + _2068;
    float _2072 = fma(_2064, _2064, _2066);
    float _2074 = fma(_2070, _2070, _2072);
    float _2076 = rsqrt(_2074);
    float _2078 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2080 = _2064 * _2078;
    float _2082 = _2070 * _2078;
    float _2084 = _2080 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 + _2086;
    float _2090 = sqrt(_2088);
    bool _2092 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = _2090 + _2094;
    float _2098 = _2070;
    float _2100 = _2096;
    float _2102 = _2056;
    float _2104 = _2078;
    if (_2092)
    {
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2106;
    }
    float _2108 = _2098;
    if (_2092)
    {
        float _2110 = rsqrt(_2088);
        _1816 = _2110;
    }
    float _2112 = _1816;
    float _2114 = _2112;
    if (_2092)
    {
        float _2116 = _2096 * _2108;
        _2100 = _2116;
    }
    float _2118 = _2100;
    if (_2092)
    {
        float _2120 = _2118 * 0.15915493667125701904296875;
        _1960 = _2120;
    }
    float _2122 = _1960;
    float _2124 = _2076;
    if (_2092)
    {
        float _2126 = _2122 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        _2124 = _2128;
    }
    float _2130 = _2124;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2134 = precise::max(0.0, _2132);
    float _2136 = _2072;
    float _2138 = _2132;
    if (_2092)
    {
        float _2140 = _2122 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        _2136 = _2142;
    }
    float _2144 = _2136;
    float _2146 = -_2078;
    float _2148 = -_2134;
    float _2150 = fma(_2056, _2146, _2148);
    float _2152 = _2150;
    if (_2092)
    {
        float _2154 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2138 = _2154;
    }
    float _2156 = _2138;
    float _2158 = sqrt(_2074);
    float _2160 = _2130;
    float _2162 = _2156;
    if (_2092)
    {
        float _2164 = fma(_2130, _2156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2102 = _2164;
    }
    float _2166 = _2102;
    float _2168 = _2166;
    if (!_2092)
    {
        _2160 = _2080;
    }
    float _2170 = _2160;
    float _2172 = _2170;
    float _2174 = _2144;
    if (_2092)
    {
        float _2176 = _2144 + (-1.0);
        _2162 = _2176;
    }
    float _2178 = _2162;
    float _2180 = _2178;
    if (_2092)
    {
        float _2182 = _2112 * _2166;
        _2104 = _2182;
    }
    float _2184 = _2104;
    if (!_2092)
    {
        _2168 = _2084;
    }
    float _2186 = _2168;
    float _2188 = _2186;
    if (_2092)
    {
        float _2190 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2190;
    }
    float _2192 = _2114;
    if (_2092)
    {
        float _2194 = _2080 * _2184;
        _2172 = _2194;
    }
    float _2196 = _2172;
    if (!_2092)
    {
        _2180 = _2082;
    }
    float _2198 = _2180;
    float _2200 = _2198;
    if (_2092)
    {
        float _2202 = _2082 * _2184;
        _2200 = _2202;
    }
    float _2204 = _2200;
    if (_2092)
    {
        float _2206 = fma(_2150, _2144, _2192);
        _2152 = _2206;
    }
    float _2208 = _2152;
    if (_2092)
    {
        float _2210 = _2196 * _2196;
        _2188 = _2210;
    }
    float _2212 = _2188;
    if (!_2092)
    {
        _2174 = _2086;
    }
    float _2214 = _2174;
    float _2216 = _2214;
    if (_2092)
    {
        float _2218 = _2204 * _2204;
        _2216 = _2218;
    }
    float _2220 = _2216;
    float _2222 = fma(_2208, _2208, _2212);
    float _2224 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2226 = _2222 + _2220;
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2230 = fma(_2158, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2228);
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2224);
    float _2236 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2238 = rsqrt(_2226);
    float _2240 = -_2232;
    float _2242 = _2240 + 1.0;
    float _2244 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2234);
    float _2246 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2236);
    float _2250 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2252 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2254 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2246);
    float _2256 = abs(_2242);
    float _2258 = log2(_2256);
    float _2260 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2248);
    float _2262 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2250);
    float _2264 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2254);
    float _2266 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2270 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2262);
    float _2272 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2274 = _2238 * _2196;
    float _2276 = _2238 * _2208;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = _2238 * _2204;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2284 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2288 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2290 = -_2282;
    float _2292 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2290);
    float _2294 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2296 = -_2284;
    float _2298 = fma(_2296, _2266, 1.0);
    float _2300 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2302 = -_2280;
    float _2304 = fma(_2302, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2292);
    float _2306 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2308 = exp2(_2294);
    float _2310 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2312 = fma(_2304, -0.5, 0.5);
    float _2314 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2306);
    float _2316 = fma(_2304, 0.5, 0.5);
    float _2318 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2310);
    float _2320 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2288);
    float _2322 = log2(_2298);
    float _2324 = _2276 + 1.0;
    float _2326 = fma(_2316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2328 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2318);
    float _2330 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2320);
    float _2332 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2328);
    float _2334 = 1.0 / _2314;
    float _2336 = -_2276;
    float _2338 = fma(_2308, _2324, _2336);
    float _2340 = fma(_2316, _2326, -0.212114393711090087890625);
    float _2342 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2330);
    float _2344 = fma(_2338, 0.5, 0.5);
    float _2346 = fma(_2316, _2340, 1.570728778839111328125);
    float _2348 = sqrt(_2312);
    float _2350 = _2322 * 0.693147182464599609375;
    float _2352 = _2332 * _2334;
    float _2354 = _2342 * _2334;
    float _2356 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2358 = fma(_2352, 0.5, 0.5);
    float _2360 = fma(_2354, -0.5, 0.5);
    float _2362 = _2348 * 0.636619746685028076171875;
    float _2364 = -_2346;
    float _2366 = fma(_2362, _2364, 1.0);
    float3 _6264 = float3(_2358, _2360, _2356);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6264, float3(0.0), isnan(_6264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6264, float3(0.0), isnan(_6264)), level(0.0)).x;
    float3 _6275 = float3(_2358, _2360, _2356);
    float4 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6275, float3(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6275, float3(0.0), isnan(_6275)), level(0.0)).xyzw;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = _2371.w;
    float2 _6292 = float2(_2366, _2344);
    float3 _2383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6292, float2(0.0), isnan(_6292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6292, float2(0.0), isnan(_6292)), level(0.0)).xyz;
    float _2385 = _2383.x;
    float _2387 = _2383.y;
    float _2389 = _2383.z;
    float _2391 = -_1312;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _2395 = -_1320;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _2399 = -_1356;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1206);
    float _2403 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2405 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2407 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2409 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2411 = fma(_2397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2405);
    float _2413 = fma(_2397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2407);
    float _2415 = exp2(_2403);
    float _2417 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2409);
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2411);
    float _2421 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2413);
    float _2423 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2417);
    float _2425 = _2419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2427 = _2421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2429 = 1.0 / _2425;
    bool _2431 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(0.5);
    bool _2439 = _2435 || _2437;
    float _2441 = _2427 + _2425;
    float _2443 = _2401;
    if (_2439)
    {
        _2443 = 1.0;
    }
    float _2445 = _2443;
    float _2447 = _2441 * _2429;
    float _2449 = _2447 * 0.5;
    float _2451 = _2445;
    if (!_2439)
    {
        float _2453 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2455);
        float _2459 = _2453 * 0.15915493667125701904296875;
        float _2461 = _2459 * 6.283185482025146484375;
        float _2463 = cos(_2461);
        float _2465 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2467 = _2465 * 0.15915493667125701904296875;
        float _2469 = _2459 * 6.283185482025146484375;
        float _2471 = sin(_2469);
        float _2473 = 1.0 / _2463;
        float _2475 = _2467 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = _2471 * _2473;
        float _2481 = 1.0 / _2457;
        float _2483 = _2477 * _2479;
        float _2485 = _2467 * 6.283185482025146484375;
        float _2487 = sin(_2485);
        float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2491 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2489;
        float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2495 = _2481 * _2493;
        float _2497 = 1.0 / _2483;
        float _2499 = 1.0 / _2491;
        float _2501 = _2487 * _2497;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2505 = fma(_2501, _2495, _2503);
        float _2507 = _2505 * _2499;
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -_2509;
        float _2513 = _2511 + 1.0;
        _2451 = _2513;
    }
    float _2515 = _2451;
    float _2517 = -_2415;
    float _2519 = _2517 + 1.0;
    float _2521 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2423);
    float _2523 = _2515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2525 = _2515 > 0.0;
    bool _2527 = isnan(_2515);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2537 = _2521 + _2314;
    float _2539 = _688 * _2523;
    float _2541 = _2535 * _2368;
    float _2543 = _2537 * 0.5;
    float _2545 = _2539 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2547 = -_2535;
    float _2549 = _2547 + 1.0;
    float _2551 = _2379 * _2541;
    float _2553 = _2389 * _2541;
    float _2555 = _2379 * _2549;
    float _2557 = fma(_2385, _2551, _2373);
    float _2559 = fma(_2387, _2551, _2375);
    float _2561 = fma(_2379, _2553, _2377);
    out.gl_Position.x = _2332;
    out.gl_Position.y = _2342;
    out.gl_Position.z = _2521;
    out.gl_Position.w = _2314;
    out.m_71.z = _2543;
    out.m_71.w = _2314;
    out.m_47.x = _2545;
    out.m_73.x = _2557;
    out.m_73.y = _2559;
    out.m_73.z = _2561;
    out.m_73.w = _2555;
    if (_2533)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2563 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2563;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1996 = false;
    bool _712 = false;
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
        float _2620 = as_type<float>(_108);
        out.gl_Position.z = _2620;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = 0.0;
    float _132 = _126;
    if (_122)
    {
        float _134 = float(_92);
        _128 = _134;
    }
    float _136 = _128;
    bool _138 = _126 >= _136;
    bool _140 = !_122;
    bool _142 = _138 || _140;
    if (_142)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _102;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    float _150 = as_type<float>(_148);
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_148);
        out.gl_Position.z = _2691;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _158;
    if (!_168)
    {
        float _172 = _158 * _158;
        float _174 = _172 * 0.5;
        _150 = _174;
    }
    float _176 = _150;
    float _178 = 0.0;
    float _180 = _176;
    if (!_168)
    {
        float _182 = _126 * _126;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_168)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_168;
    float _194 = _190;
    float _196 = 0.0;
    if (!_192)
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
        _130 = _214;
        _194 = _226;
        _196 = _216;
    }
    float _228 = _130;
    float _230 = _194;
    float _232 = _196;
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
        _170 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _170;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _126;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
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
        float _294 = _126 * _286;
        float _296 = exp2(_294);
        float _298 = _292 * 0.693147182464599609375;
        float _300 = 1.0 / _298;
        float _302 = 1.0 / _290;
        float _304 = _296 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _300, _126);
        float _310 = _308 * _302;
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
        float _328 = _126 * _320;
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
    float _350 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_264, _152, _342);
    float _354 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = fma(_264, _156, _350);
    float _364 = fma(_338, _156, _354);
    float _366 = -_356;
    float _368 = _352 + _366;
    float _370 = _360 * _360;
    float _372 = in.m_51.w;
    float _374 = -_364;
    float _376 = _362 + _374;
    float _378 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = fma(_368, _368, _370);
    float _382 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = fma(_376, _376, _380);
    float _390 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _392 = in.m_44.x;
    float _394 = in.m_44.y;
    float _396 = in.m_44.z;
    float _398 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _402 = sqrt(_388);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _406 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _400);
    bool _408 = _402 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_402);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_352, _372, _392);
    float _420 = fma(_344, _372, _394);
    float _422 = fma(_362, _372, _396);
    float _424 = _362;
    float _426 = _404;
    float _428 = _406;
    if (_416)
    {
        _424 = _398;
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
            _426 = _468;
            _432 = _466;
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
                    _426 = _522;
                    _432 = _520;
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
                    _426 = _556;
                    _432 = _554;
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
                _426 = _590;
                _432 = _588;
                _428 = _592;
            }
        }
    }
    _472 = false;
    float _594 = _426;
    float _596 = _432;
    float _598 = _428;
    float _600 = in.m_53.x;
    float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _604 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _612 = _610 != 0;
    int _614 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _616 = _614 != 0;
    float _618 = _604 * _602;
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[20].x, _618);
    float _622 = _620 * 6.283185482025146484375;
    float _624 = floor(_620);
    float _626 = _622 * 0.15915493667125701904296875;
    bool _628 = !_608;
    int _630 = _628 ? 0 : 1;
    int _632 = abs(_630);
    float _634 = _626 * 6.283185482025146484375;
    float _636 = cos(_634);
    bool _638 = !_616;
    int _640 = _638 ? 0 : 1;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _644 = abs(_640);
    float _646 = -_624;
    float _648 = _620 + _646;
    bool _650 = !_612;
    int _652 = _650 ? 0 : 1;
    float _654 = float(_632);
    int _656 = abs(_652);
    float _658 = -_648;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _662 = _648 < 0.5;
    float _664 = float(_662);
    float _666 = fma(_636, 0.5, 0.5);
    float _668 = abs(_660);
    float _670 = _654 * _668;
    float _672 = float(_644);
    float _674 = -_664;
    float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _678 = -_666;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_656);
    float _684 = fma(_672, _680, _670);
    float _686 = abs(_676);
    float _688 = fma(_682, _686, _684);
    bool _690 = !_642;
    float _692 = as_type<float>(_644);
    float _694 = _670;
    float _710;
    if (!_690)
    {
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _698 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        float _714 = float(_92);
        float _716 = 1.0 / _714;
        float _718 = _126 * _716;
        _710 = _718;
    }
    _712 = false;
    float _720 = _710;
    float _722 = in.m_53.y;
    float _724 = _600 * 2.0;
    float _726 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = in.m_53.z;
    float _730 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = floor(_724);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = in.m_51.x;
    float _740 = in.m_51.y;
    float _742 = in.m_51.z;
    float _744 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _746 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _748 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _744);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _752;
    if (_736)
    {
        _692 = _600;
    }
    float _756 = _692;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = _722 * 2.0;
    bool _764 = _732 > 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _768 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _766;
    bool _770 = _732 >= 0.0;
    bool _772 = isnan(_732);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = _756;
    if (_736)
    {
        _694 = _722;
    }
    float _782 = _694;
    float _784 = floor(_762);
    int _786 = _778 ? 0 : 1;
    float _788 = _782;
    if (!_736)
    {
        _780 = _728;
    }
    float _790 = _780;
    float _792 = _738 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _794 = ~_786;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = _742 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _802 = _798;
    if (!_736)
    {
        _788 = _600;
    }
    float _804 = _788;
    float _806 = _740 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    if (!_764)
    {
        int _808 = ~_786;
        int _810 = _808 + 1;
        _802 = _810;
    }
    int _812 = _802;
    float _814 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _818 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _816;
    bool _820 = _784 > 0.0;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _824 = _784 >= 0.0;
    bool _826 = isnan(_784);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = -_818;
    float _836 = _834 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _840 = _832 ? 0 : 1;
    float _842 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[88].z, _838);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    int _860 = ~_840;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    int _866 = _864;
    if (!_820)
    {
        int _868 = ~_840;
        int _870 = _868 + 1;
        _866 = _870;
    }
    int _872 = _866;
    float _874 = in.m_55.x;
    float _876 = in.m_55.y;
    float _878 = in.m_55.z;
    float _880 = 1.0 / _858;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _896 = _894 != 0;
    float _898 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _904 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _898);
    float _906 = 1.0 / _902;
    float _908 = _722 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _914 = fma(_908, -2.0, _750);
    float _916 = 1.0 / _912;
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _878);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _876);
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _874);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _932 = _600 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _936 = 1.0 / _930;
    float _938 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _904);
    float _940 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _746);
    float _942 = -_934;
    float _944 = fma(_932, 2.0, _942);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _960 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _958;
    float _962 = 1.0 / _926;
    float _964 = _728 * 2.0;
    float _966 = _754 * _906;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _968;
    float _972 = _760 * _916;
    bool _974 = !_854;
    int _976 = _974 ? 0 : 1;
    float _978 = _938 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _980 = !_846;
    int _982 = _980 ? 0 : 1;
    float _984 = floor(_964);
    float _986 = _594 * _594;
    float _988 = _956 * _936;
    float _990 = fma(_596, _596, _986);
    int _992 = abs(_976);
    float _994 = 1.0 / _948;
    bool _996 = !_850;
    int _998 = _996 ? 0 : 1;
    float _1000 = _952 * _962;
    float _1002 = -_960;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1006 = abs(_982);
    int _1008 = abs(_998);
    float _1010 = _1004 * _1004;
    bool _1012 = _984 >= 0.0;
    bool _1014 = isnan(_984);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    float _1022 = fma(_598, _598, _990);
    float _1024 = _722 + _728;
    float _1026 = _804 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1028 = _1020 ? 0 : 1;
    bool _1030 = _984 > 0.0;
    float _1032 = rsqrt(_1022);
    float _1034 = _1024 + (-1.0);
    float _1036 = _970 * _994;
    float _1038 = fma(_1026, -2.0, _822);
    float _1040 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = -_768;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1046 = ~_1028;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    float _1052 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1054 = log2(_1052);
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1058 = float(_1008);
    float _1060 = float(_812);
    int _1062 = _1050;
    if (!_1030)
    {
        int _1064 = ~_1028;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    float _1070 = _1032 * _596;
    float _1072 = _1032 * _594;
    float _1074 = _1032 * _598;
    float _1076 = fma(_1044, _1044, _1010);
    float _1078 = _790 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1080 = _1058 * _1060;
    float _1082 = in.m_57.x;
    float _1084 = in.m_57.y;
    float _1086 = in.m_57.z;
    float _1088 = _1054 * _126;
    float _1090 = -_1056;
    float _1092 = fma(_1078, 2.0, _1090);
    float _1094 = fma(_836, _836, _1076);
    float _1096 = exp2(_1088);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1102 = 1.0 + _1100;
    float _1104 = _1080 * (-2.0);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1108 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1110 = isnan(1.0);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1116 = _1112 || _1114;
    float _1118 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1098);
    float _1120 = 1.0 / _1102;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1106);
    float _1136 = float(_992);
    float _1138 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1122);
    float _1140 = -_126;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[76].x, _944);
    float _1144 = -_1096;
    float _1146 = _1144 + 1.0;
    float _1148 = -_126;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1092);
    float _1152 = float(_872);
    float _1154 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _842);
    float _1156 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1158 = _1132 ? _1146 : 0.0;
    float _1160 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1038);
    float _1162 = float(_1006);
    float _1164 = _1136 * _1152;
    float _1166 = float(_1068);
    float _1168 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _914);
    float _1170 = _722 + (-0.5);
    float _1172 = fma(_1104, _1084, _1084);
    float _1174 = fma(_1040, _1104, _1040);
    float _1176 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1118);
    float _1178 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1134);
    float _1180 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1138);
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1184 = _1156 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1188 = _1074 * _1186;
    bool _1190 = _1132;
    float _1192 = _1168;
    if (_1116)
    {
        float _1194 = _1158 * _1120;
        _132 = _1194;
    }
    float _1196 = _132;
    float _1198 = _1162 * _1166;
    float _1200 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1172);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1206 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _978 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1214 = _1072 * _1212;
    float _1216 = _1184 * _1184;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1220 = -_1188;
    float _1222 = fma(_1070, _1218, _1220);
    bool _1224 = _722 > 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1206 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = -_1214;
    float _1234 = fma(_1074, _1230, _1232);
    float _1236 = fma(_1210, _1210, _1216);
    float _1238 = _1222 * _1222;
    float _1240 = _600 + _722;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1244 = _1070 * _1242;
    float _1246 = fma(_1228, _1228, _1236);
    float _1248 = fma(_1234, _1234, _1238);
    float _1250 = _1240 + (-1.0);
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1254 = -_1244;
    float _1256 = fma(_1072, _1252, _1254);
    float _1258 = _1198 * (-2.0);
    float _1260 = _1164 * (-2.0);
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1264 = rsqrt(_1246);
    float _1266 = fma(_1258, _1082, _1082);
    float _1268 = fma(_1174, _1196, _1200);
    float _1270 = _600 + (-0.5);
    float _1272 = _600 + _728;
    float _1274 = fma(_1262, _1258, _1262);
    float _1276 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1266);
    float _1278 = _1272 + (-1.0);
    if (_884)
    {
        bool _1280 = _600 > 0.5;
        _1190 = _1280;
    }
    bool _1282 = _1190;
    float _1284 = fma(_1256, _1256, _1248);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1288 = _720 + _1286;
    bool _1290 = _728 > 0.5;
    float _1292 = fma(_1274, _1196, _1276);
    float _1294 = fma(_1260, _1086, _1086);
    float _1296 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1298 = _728 + (-0.5);
    float _1300 = _1204 * _880;
    float _1302 = fma(_966, _1288, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1304 = rsqrt(_1284);
    float _1306 = fma(_1296, _1260, _1296);
    float _1308 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1294);
    float _1310 = in.m_59.x;
    float _1312 = _1184 * _1264;
    float _1314 = _1268 * 0.15915493667125701904296875;
    float _1316 = fma(_1306, _1196, _1308);
    float _1318 = in.m_59.y;
    float _1320 = _1210 * _1264;
    float _1322 = _1292 * 0.15915493667125701904296875;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1326 = _720 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1330 = _720 + _1328;
    float _1332 = -_1320;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1336 = _1314 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = fma(_972, _1326, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1342 = -_1312;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1346 = fma(_1000, _1330, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1350 = _720 + _1348;
    float _1352 = _1316 * 0.15915493667125701904296875;
    float _1354 = _1344 * _1344;
    float _1356 = _1228 * _1264;
    float _1358 = _1314 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = fma(_988, _1350, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1364 = _1234 * _1304;
    float _1366 = _1222 * _1304;
    float _1368 = _1256 * _1304;
    float _1370 = _1322 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = fma(_1334, _1334, _1354);
    float _1376 = -_1356;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1382 = _720 + _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1386 = _720 + _1384;
    float _1388 = -_1318;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_1378, _1378, _1374);
    float _1394 = fma(_1036, _1382, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1396 = _1322 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma(_1300, _1386, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1402 = _1300;
    float _1404 = _1386;
    float _1406 = _1318;
    if (!_884)
    {
        _1402 = _1310;
    }
    float _1408 = _1402;
    int _1410 = _1290 ? as_type<int>(_1390) : as_type<int>(_1318);
    float _1412 = _1408;
    if (!_884)
    {
        _1404 = _1408;
    }
    float _1414 = _1404;
    float _1416 = _1352 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1414;
    if (_884)
    {
        _1412 = _1310;
    }
    float _1422 = _1412;
    float _1424 = _1372 * _1338;
    float _1426 = _892 ? as_type<float>(_1410) : _1318;
    float _1428 = _1372 * _1360;
    float _1430 = _1422;
    if (_896)
    {
        float _1432 = _1224 ? _1390 : _1318;
        _1406 = _1432;
    }
    float _1434 = _1406;
    float _1436 = sqrt(_1392);
    float _1438 = _1398 * _1360;
    float _1440 = _1398 * _1338;
    float _1442 = _1352 * 6.283185482025146484375;
    float _1444 = sin(_1442);
    float _1446 = _1360 * _1418;
    float _1448 = _1372 * _1418;
    float _1450 = _1398 * _1418;
    float _1452 = _1338 * _1418;
    float _1454 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1456 = sqrt(_1094);
    float _1458 = _1264 * _1436;
    float _1460 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1462 = _1454 * _1458;
    float _1464 = _1460 * _1458;
    float _1466 = _814 * _1458;
    float _1468 = fma(_1444, _1438, _1424);
    float _1470 = -_1428;
    float _1472 = fma(_1444, _1440, _1470);
    float _1474 = -_1440;
    float _1476 = fma(_1444, _1428, _1474);
    float _1478 = fma(_1444, _1424, _1438);
    float _1480 = _1464 * _920;
    float _1482 = _1462 * _918;
    float _1484 = _1450 * _1070;
    float _1486 = _1072 * _1368;
    float _1488 = _1468 * _1070;
    float _1490 = _1472 * _1070;
    float _1492 = _1466 * _922;
    float _1494 = _1070 * _1366;
    float _1496 = -_1444;
    float _1498 = fma(_1496, _1364, _1484);
    float _1500 = _1450 * _1074;
    float _1502 = fma(_1446, _1364, _1488);
    float _1504 = fma(_1452, _1364, _1490);
    float _1506 = -_1486;
    float _1508 = fma(_1074, _1366, _1506);
    float _1510 = fma(_1456, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1512 = _1468 * _1074;
    float _1514 = _1472 * _1074;
    float _1516 = -_1494;
    float _1518 = fma(_1072, _1364, _1516);
    float _1520 = -_1444;
    float _1522 = fma(_1520, _1368, _1500);
    float _1524 = fma(_1448, _1508, _1498);
    float _1526 = fma(_1476, _1508, _1502);
    float _1528 = fma(_1478, _1508, _1504);
    float _1530 = fma(_1446, _1368, _1512);
    float _1532 = fma(_1452, _1368, _1514);
    float _1534 = fma(_1448, _1518, _1522);
    float _1536 = _1074 * _1364;
    bool _1538 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1540 = isnan(_720);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = fma(_1476, _1518, _1530);
    float _1552 = fma(_1478, _1518, _1532);
    float _1554 = _1480 * _1524;
    float _1556 = _1480 * _1534;
    bool _1558 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1560 = isnan(_720);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = -_1548;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1492, _1526, _1554);
    float _1576 = fma(_1492, _1550, _1556);
    bool _1578 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1580 = isnan(_720);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = -_1568;
    float _1592 = _1590 + 1.0;
    float _1594 = fma(_1482, _1528, _1574);
    float _1596 = _1568 * _1572;
    float _1598 = fma(_1482, _1552, _1576);
    bool _1600 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1602 = isnan(_720);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = _1588 * _1592;
    float _1614 = -_1588;
    float _1616 = _1614 + 1.0;
    float _1618 = precise::max(_1510, 0.3499999940395355224609375);
    float _1620 = _978 + _1594;
    float _1622 = _1206 + _1598;
    bool _1624 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1626 = isnan(_720);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = _1610 * _1616;
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    float _1642 = precise::min(_1618, 1.0);
    float _1644 = -_768;
    float _1646 = _1620 + _1644;
    float _1648 = -_818;
    float _1650 = _1622 + _1648;
    bool _1652 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1654 = isnan(_720);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = -_1634;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1646, _1642, _768);
    float _1670 = fma(_1650, _1642, _818);
    bool _1672 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1674 = isnan(_720);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = -_1662;
    float _1686 = _1684 + 1.0;
    float _1688 = _1662 * _1666;
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1692 = _1668 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1696 = _1670 + _1694;
    float _1698 = _1682 * _1686;
    float _1700 = _1450 * _1072;
    float _1702 = _1692 * _1692;
    float _1704 = _1696 * _1696;
    float _1706 = _1302 * _1698;
    float _1708 = -_1536;
    float _1710 = fma(_1070, _1368, _1708);
    float _1712 = -_1444;
    float _1714 = fma(_1712, _1366, _1700);
    float _1716 = _1702 + _1704;
    float _1718 = _1468 * _1072;
    float _1720 = _1472 * _1072;
    float _1722 = fma(_1448, _1710, _1714);
    float _1724 = sqrt(_1716);
    float _1726 = fma(_1446, _1366, _1718);
    float _1728 = _1634 * _1640;
    float _1730 = _1480 * _1722;
    float _1732 = fma(_1452, _1366, _1720);
    float _1734 = fma(_1476, _1710, _1726);
    float _1736 = -_1682;
    float _1738 = _1736 + 1.0;
    int _1740 = as_type<int>(_1718);
    float _1742 = _1702;
    float _1744 = _1704;
    float _1746 = _1668;
    float _1748 = _1670;
    if (_888)
    {
        float _1750 = -_1422;
        float _1752 = _1750 + 1.0;
        _1740 = as_type<int>(_1752);
    }
    int _1754 = _1740;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1758 = fma(_1492, _1734, _1730);
    float _1760 = fma(_1478, _1710, _1732);
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1706);
    float _1764 = fma(_1482, _1760, _1758);
    float _1766 = fma(_1340, _1688, _1762);
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1770 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = _1156 + _1764;
    float _1774 = fma(_1346, _1728, _1766);
    int _1776 = as_type<int>(_1762);
    if (_884)
    {
        float _1778 = -_1422;
        float _1780 = _1778 + 1.0;
        _1776 = as_type<int>(_1780);
    }
    int _1782 = _1776;
    float _1784 = -_960;
    float _1786 = _1772 + _1784;
    float _1788 = fma(_1362, _1636, _1774);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1792 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1794 = fma(_1786, _1642, _960);
    if (_884)
    {
        float _1796 = _1282 ? as_type<float>(_1782) : _1422;
        _1420 = _1796;
    }
    float _1798 = _1420;
    float _1800 = fma(_1394, _1612, _1788);
    float _1802 = fma(_1792, _1434, -0.5);
    if (_888)
    {
        float _1804 = _1224 ? as_type<float>(_1754) : _1422;
        _1430 = _1804;
    }
    float _1806 = _1430;
    float _1808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1810 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1812 = -_1168;
    float _1814 = fma(_1178, _1802, _1812);
    float _1816 = _1814;
    if (!_1770)
    {
        _1192 = _1794;
    }
    float _1818 = _1192;
    float _1820 = fma(_1426, _1810, -0.5);
    float _1822 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1824 = -_1160;
    float _1826 = fma(_1180, _1820, _1824);
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1830 = !_1770;
    float _1832 = _1818;
    if (!_1830)
    {
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1838 = _1724 + _1836;
        float _1840 = rsqrt(_1716);
        float _1842 = _1838 * _1834;
        float _1844 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = _1842 * 0.15915493667125701904296875;
        float _1848 = _1846 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = _1846 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        float _1856 = fma(_1850, _1844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1858 = _1840 * _1856;
        float _1860 = fma(_1692, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1862 = _1854 + (-1.0);
        float _1864 = fma(_1696, _1858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1868 = _1860 + _1866;
        float _1870 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1874 = _1864 + _1872;
        float _1876 = _1868 * _1868;
        float _1878 = fma(_1794, _1854, _1870);
        float _1880 = _1874 * _1874;
        _1832 = _1878;
        _1742 = _1876;
        _1744 = _1880;
        _1746 = _1860;
        _1748 = _1864;
    }
    float _1882 = _1832;
    float _1884 = _1742;
    float _1886 = _1744;
    float _1888 = _1746;
    float _1890 = _1748;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1894 = _1882 + _1892;
    float _1896 = fma(_1822, _1798, -0.5);
    float _1898 = fma(_1828, _1806, -0.5);
    float _1900 = fma(_1400, _1596, _1800);
    float _1902 = fma(_1894, _1894, _1884);
    float _1904 = fma(_1176, _1896, _1142);
    float _1906 = fma(_1154, _1898, _1150);
    float _1908 = _1902 + _1886;
    float _1910 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1900);
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1914 = sqrt(_1908);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1926 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1928 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1930 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1814 + 0.5;
    float _1940 = _1826 + 0.5;
    float _1942 = _1904 + 0.5;
    float _1944 = _1906 + 0.5;
    float _1946 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1948 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1950 = isnan(_1914);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1956 = _1952 || _1954;
    out.m_63.x = _1932;
    out.m_63.y = _1934;
    out.m_63.z = _1936;
    out.m_65.x = _1942;
    out.m_65.y = _1938;
    out.m_67.x = _1944;
    out.m_67.y = _1940;
    float _1958 = _1904;
    float _1960 = _1882;
    if (!_1956)
    {
        _1958 = 1.0;
    }
    float _1962 = _1958;
    out.m_69.x = _1926;
    out.m_69.y = _1928;
    out.m_69.z = _1930;
    out.m_69.w = _1946;
    bool _1964 = !_1956;
    float _1966 = _1962;
    if (!_1964)
    {
        bool _1968 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1970 = isnan(_1914);
        bool _1972 = _1968 || _1970;
        bool _1974 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1976 = _1972 || _1974;
        if (!_1976)
        {
            float _1978 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1980 = _1914 + _1978;
            float _1982 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1984 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1990 = 1.0 / _1984;
            float _1992 = _1980 * _1990;
            float _1994 = fma(_1992, _1988, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1966 = _1994;
            _1996 = true;
        }
        else
        {
            bool _1998 = _1914 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2000 = isnan(_1914);
            bool _2002 = _1998 || _2000;
            bool _2004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2006 = _2002 || _2004;
            if (!_2006)
            {
                float _2008 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2010 = _1914 + _2008;
                float _2012 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2014 = _2012 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2018 = _2016 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2020 = 1.0 / _2014;
                float _2022 = _2010 * _2020;
                float _2024 = fma(_2022, _2018, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1966 = _2024;
                _1996 = true;
            }
            else
            {
                _1966 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1996 = false;
    float _2026 = _1966;
    float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2030 = _1882 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2034 = _1888 + _2032;
    float _2036 = fma(_2030, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2038 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2040 = _1890 + _2038;
    float _2042 = fma(_2034, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2044 = -_1312;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2036);
    float _2048 = fma(_2040, _2026, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2050 = -_1320;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2046 + _2054;
    float _2058 = -_1356;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2064 = _2052 + _2062;
    float _2066 = _2056 * _2056;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2060 + _2068;
    float _2072 = fma(_2064, _2064, _2066);
    float _2074 = fma(_2070, _2070, _2072);
    float _2076 = rsqrt(_2074);
    float _2078 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2080 = _2064 * _2078;
    float _2082 = _2070 * _2078;
    float _2084 = _2080 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 + _2086;
    float _2090 = sqrt(_2088);
    bool _2092 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = _2090 + _2094;
    float _2098 = _2070;
    float _2100 = _2096;
    float _2102 = _2056;
    float _2104 = _2078;
    if (_2092)
    {
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2106;
    }
    float _2108 = _2098;
    if (_2092)
    {
        float _2110 = rsqrt(_2088);
        _1816 = _2110;
    }
    float _2112 = _1816;
    float _2114 = _2112;
    if (_2092)
    {
        float _2116 = _2096 * _2108;
        _2100 = _2116;
    }
    float _2118 = _2100;
    if (_2092)
    {
        float _2120 = _2118 * 0.15915493667125701904296875;
        _1960 = _2120;
    }
    float _2122 = _1960;
    float _2124 = _2076;
    if (_2092)
    {
        float _2126 = _2122 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        _2124 = _2128;
    }
    float _2130 = _2124;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2134 = precise::max(0.0, _2132);
    float _2136 = _2072;
    float _2138 = _2132;
    if (_2092)
    {
        float _2140 = _2122 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        _2136 = _2142;
    }
    float _2144 = _2136;
    float _2146 = -_2078;
    float _2148 = -_2134;
    float _2150 = fma(_2056, _2146, _2148);
    float _2152 = _2150;
    if (_2092)
    {
        float _2154 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2138 = _2154;
    }
    float _2156 = _2138;
    float _2158 = sqrt(_2074);
    float _2160 = _2130;
    float _2162 = _2156;
    if (_2092)
    {
        float _2164 = fma(_2130, _2156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2102 = _2164;
    }
    float _2166 = _2102;
    float _2168 = _2166;
    if (!_2092)
    {
        _2160 = _2080;
    }
    float _2170 = _2160;
    float _2172 = _2170;
    float _2174 = _2144;
    if (_2092)
    {
        float _2176 = _2144 + (-1.0);
        _2162 = _2176;
    }
    float _2178 = _2162;
    float _2180 = _2178;
    if (_2092)
    {
        float _2182 = _2112 * _2166;
        _2104 = _2182;
    }
    float _2184 = _2104;
    if (!_2092)
    {
        _2168 = _2084;
    }
    float _2186 = _2168;
    float _2188 = _2186;
    if (_2092)
    {
        float _2190 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2190;
    }
    float _2192 = _2114;
    if (_2092)
    {
        float _2194 = _2080 * _2184;
        _2172 = _2194;
    }
    float _2196 = _2172;
    if (!_2092)
    {
        _2180 = _2082;
    }
    float _2198 = _2180;
    float _2200 = _2198;
    if (_2092)
    {
        float _2202 = _2082 * _2184;
        _2200 = _2202;
    }
    float _2204 = _2200;
    if (_2092)
    {
        float _2206 = fma(_2150, _2144, _2192);
        _2152 = _2206;
    }
    float _2208 = _2152;
    if (_2092)
    {
        float _2210 = _2196 * _2196;
        _2188 = _2210;
    }
    float _2212 = _2188;
    if (!_2092)
    {
        _2174 = _2086;
    }
    float _2214 = _2174;
    float _2216 = _2214;
    if (_2092)
    {
        float _2218 = _2204 * _2204;
        _2216 = _2218;
    }
    float _2220 = _2216;
    float _2222 = fma(_2208, _2208, _2212);
    float _2224 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2226 = _2222 + _2220;
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2230 = fma(_2158, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2228);
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2224);
    float _2236 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2238 = rsqrt(_2226);
    float _2240 = -_2232;
    float _2242 = _2240 + 1.0;
    float _2244 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2234);
    float _2246 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2236);
    float _2250 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2252 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2254 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2246);
    float _2256 = abs(_2242);
    float _2258 = log2(_2256);
    float _2260 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2248);
    float _2262 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2250);
    float _2264 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2254);
    float _2266 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2270 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2262);
    float _2272 = _2264 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2274 = _2238 * _2196;
    float _2276 = _2238 * _2208;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = _2238 * _2204;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2284 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2288 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2290 = -_2282;
    float _2292 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2290);
    float _2294 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2296 = -_2284;
    float _2298 = fma(_2296, _2266, 1.0);
    float _2300 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2302 = -_2280;
    float _2304 = fma(_2302, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2292);
    float _2306 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2286);
    float _2308 = exp2(_2294);
    float _2310 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2312 = fma(_2304, -0.5, 0.5);
    float _2314 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2306);
    float _2316 = fma(_2304, 0.5, 0.5);
    float _2318 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2310);
    float _2320 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2288);
    float _2322 = log2(_2298);
    float _2324 = _2276 + 1.0;
    float _2326 = fma(_2316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2328 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2318);
    float _2330 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2320);
    float _2332 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2328);
    float _2334 = 1.0 / _2314;
    float _2336 = -_2276;
    float _2338 = fma(_2308, _2324, _2336);
    float _2340 = fma(_2316, _2326, -0.212114393711090087890625);
    float _2342 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2330);
    float _2344 = fma(_2338, 0.5, 0.5);
    float _2346 = fma(_2316, _2340, 1.570728778839111328125);
    float _2348 = sqrt(_2312);
    float _2350 = _2322 * 0.693147182464599609375;
    float _2352 = _2332 * _2334;
    float _2354 = _2342 * _2334;
    float _2356 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2358 = fma(_2352, 0.5, 0.5);
    float _2360 = fma(_2354, -0.5, 0.5);
    float _2362 = _2348 * 0.636619746685028076171875;
    float _2364 = -_2346;
    float _2366 = fma(_2362, _2364, 1.0);
    float3 _6264 = float3(_2358, _2360, _2356);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6264, float3(0.0), isnan(_6264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6264, float3(0.0), isnan(_6264)), level(0.0)).x;
    float3 _6275 = float3(_2358, _2360, _2356);
    float4 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6275, float3(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6275, float3(0.0), isnan(_6275)), level(0.0)).xyzw;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = _2371.w;
    float2 _6292 = float2(_2366, _2344);
    float3 _2383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6292, float2(0.0), isnan(_6292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6292, float2(0.0), isnan(_6292)), level(0.0)).xyz;
    float _2385 = _2383.x;
    float _2387 = _2383.y;
    float _2389 = _2383.z;
    float _2391 = -_1312;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _2395 = -_1320;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _2399 = -_1356;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1206);
    float _2403 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2405 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2407 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2409 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2411 = fma(_2397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2405);
    float _2413 = fma(_2397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2407);
    float _2415 = exp2(_2403);
    float _2417 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2409);
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2411);
    float _2421 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2413);
    float _2423 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2417);
    float _2425 = _2419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2427 = _2421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2429 = 1.0 / _2425;
    bool _2431 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(0.5);
    bool _2439 = _2435 || _2437;
    float _2441 = _2427 + _2425;
    float _2443 = _2401;
    if (_2439)
    {
        _2443 = 1.0;
    }
    float _2445 = _2443;
    float _2447 = _2441 * _2429;
    float _2449 = _2447 * 0.5;
    float _2451 = _2445;
    if (!_2439)
    {
        float _2453 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2455);
        float _2459 = _2453 * 0.15915493667125701904296875;
        float _2461 = _2459 * 6.283185482025146484375;
        float _2463 = cos(_2461);
        float _2465 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2467 = _2465 * 0.15915493667125701904296875;
        float _2469 = _2459 * 6.283185482025146484375;
        float _2471 = sin(_2469);
        float _2473 = 1.0 / _2463;
        float _2475 = _2467 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = _2471 * _2473;
        float _2481 = 1.0 / _2457;
        float _2483 = _2477 * _2479;
        float _2485 = _2467 * 6.283185482025146484375;
        float _2487 = sin(_2485);
        float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2491 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2489;
        float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2495 = _2481 * _2493;
        float _2497 = 1.0 / _2483;
        float _2499 = 1.0 / _2491;
        float _2501 = _2487 * _2497;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2505 = fma(_2501, _2495, _2503);
        float _2507 = _2505 * _2499;
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -_2509;
        float _2513 = _2511 + 1.0;
        _2451 = _2513;
    }
    float _2515 = _2451;
    float _2517 = -_2415;
    float _2519 = _2517 + 1.0;
    float _2521 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2423);
    float _2523 = _2515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2525 = _2515 > 0.0;
    bool _2527 = isnan(_2515);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2537 = _2521 + _2314;
    float _2539 = _688 * _2523;
    float _2541 = _2535 * _2368;
    float _2543 = _2537 * 0.5;
    float _2545 = _2539 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2547 = -_2535;
    float _2549 = _2547 + 1.0;
    float _2551 = _2379 * _2541;
    float _2553 = _2389 * _2541;
    float _2555 = _2379 * _2549;
    float _2557 = fma(_2385, _2551, _2373);
    float _2559 = fma(_2387, _2551, _2375);
    float _2561 = fma(_2379, _2553, _2377);
    out.gl_Position.x = _2332;
    out.gl_Position.y = _2342;
    out.gl_Position.z = _2521;
    out.gl_Position.w = _2314;
    out.m_71.z = _2543;
    out.m_71.w = _2314;
    out.m_47.x = _2545;
    out.m_73.x = _2557;
    out.m_73.y = _2559;
    out.m_73.z = _2561;
    out.m_73.w = _2555;
    if (_2533)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2563 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2563;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

