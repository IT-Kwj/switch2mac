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
    float4 m_57 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1718 = false;
    bool _774 = false;
    bool _618 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2344 = as_type<float>(_106);
        out.gl_Position.z = _2344;
    }
    if (!_94)
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
    float _128 = 0.0;
    if (_120)
    {
        float _130 = float(_90);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    float _148 = as_type<float>(_146);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2415 = as_type<float>(_146);
        out.gl_Position.z = _2415;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = _156;
    if (!_166)
    {
        float _170 = _156 * _156;
        float _172 = _170 * 0.5;
        _148 = _172;
    }
    float _174 = _148;
    float _176 = 0.0;
    float _178 = _174;
    if (!_166)
    {
        float _180 = _124 * _124;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    if (!_166)
    {
        float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _186;
    }
    float _188 = _178;
    bool _190 = !_166;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _156 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _156);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _126 = _212;
        _192 = _222;
        _128 = _210;
    }
    float _224 = _126;
    float _226 = _192;
    float _228 = _128;
    bool _230 = !_166;
    float _232 = _224;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _156 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _232 = _248;
        _234 = _242;
        _168 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _168;
    float _262 = _258;
    float _264 = _256;
    if (!_166)
    {
        _262 = _124;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _266;
    if (!_166)
    {
        float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _272;
    }
    float _274 = _264;
    bool _276 = !_166;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _124 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _124);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    bool _312 = !_166;
    if (!_312)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _124 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _270 = _332;
    }
    float _334 = _270;
    float _336 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_260, _152, _268);
    float _340 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_334, _152, _336);
    float _346 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_260, _150, _340);
    float _352 = fma(_334, _150, _342);
    float _354 = -_344;
    float _356 = _338 + _354;
    float _358 = fma(_260, _154, _346);
    float _360 = fma(_334, _154, _348);
    float _362 = -_352;
    float _364 = _350 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_51.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = in.m_44.x;
    float _390 = in.m_44.y;
    float _392 = in.m_44.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _414 = fma(_338, _368, _390);
    float _416 = fma(_350, _368, _388);
    float _418 = fma(_358, _368, _392);
    float _420 = _338;
    float _422 = _396;
    float _424 = _412;
    if (_410)
    {
        _420 = _400;
    }
    float _426 = _420;
    float _428 = _426;
    if (!_410)
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
            _422 = _464;
            _424 = _462;
            _428 = _466;
            _468 = true;
        }
        else
        {
            float _470 = _152 * _152;
            float _472 = fma(_150, _150, _470);
            float _474 = fma(_154, _154, _472);
            float _476 = sqrt(_474);
            bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
            bool _480 = isnan(_476);
            bool _482 = _478 || _480;
            bool _484 = isnan(9.9999999747524270787835121154785e-07);
            bool _486 = _482 || _484;
            if (!_486)
            {
                float _488 = _390 * _390;
                float _490 = fma(_388, _388, _488);
                float _492 = fma(_392, _392, _490);
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
                    _422 = _518;
                    _424 = _516;
                    _428 = _520;
                    _468 = true;
                }
                else
                {
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _526 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
                    float _538 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
                    float _540 = _534 * _534;
                    float _542 = fma(_536, _536, _540);
                    float _544 = fma(_538, _538, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _536 * _548;
                    float _552 = _534 * _548;
                    float _554 = _538 * _548;
                    _422 = _552;
                    _424 = _550;
                    _428 = _554;
                    _468 = true;
                }
            }
            else
            {
                float _556 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _558 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _560 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _562 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                float _566 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                float _568 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                float _570 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                float _572 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                float _574 = _568 * _568;
                float _576 = fma(_570, _570, _574);
                float _578 = fma(_572, _572, _576);
                float _580 = rsqrt(_578);
                float _582 = _580 * 9.9999999747524270787835121154785e-07;
                float _584 = _570 * _582;
                float _586 = _568 * _582;
                float _588 = _572 * _582;
                _422 = _586;
                _424 = _584;
                _428 = _588;
            }
        }
    }
    _468 = false;
    float _590 = _422;
    float _592 = _424;
    float _594 = _428;
    bool _596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _598 = !_596;
    float _616;
    if (!_598)
    {
        float _600 = in.m_53.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_90);
        float _622 = 1.0 / _620;
        float _624 = _124 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _626 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = isnan(_626);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _652 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _654 = isnan(_626);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    bool _668 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = 1.0 / _634;
    float _682 = -_646;
    float _684 = _682 + 1.0;
    float _686 = -_678;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _694 = 1.0 / _650;
    float _696 = _646 * _688;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _700 = _666 * _680;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_700, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _710 = _662 * _684;
    float _712 = -_662;
    float _714 = _712 + 1.0;
    float _716 = _704 * _694;
    float _718 = _708 * _710;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _626 + _720;
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _726 = fma(_716, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = fma(_726, _696, _724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _734 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[117].x, _730);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _740 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _748;
    out.m_55.y = _750;
    out.m_55.z = _706;
    out.m_55.w = _692;
    out.m_57.x = _740;
    out.m_57.y = _744;
    out.m_57.z = _746;
    out.m_57.w = _752;
    bool _754 = !_690;
    float _772;
    if (!_754)
    {
        float _756 = in.m_53.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = in.m_59.y;
    float _786 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _788 = in.m_53.z;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _796 = _794 != 0;
    float _798 = in.m_53.y;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _802 = _800 != 0;
    float _804 = 1.0 / _792;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _808 = _806 != 0;
    float _810 = in.m_53.w;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _818 = _816 != 0;
    float _820 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = in.m_51.x;
    float _824 = in.m_51.y;
    float _826 = in.m_51.z;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _830 = _828 != 0;
    float _832 = 1.0 / _814;
    float _834 = in.m_53.x;
    float _836 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    float _838 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _840 = -_784;
    float _842 = _840 + 1.0;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _846;
    bool _850 = _788 > 0.5;
    float _852 = in.m_59.x;
    float _854 = _848 * _804;
    bool _856 = _798 > 0.5;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _858;
    int _862 = _850 ? as_type<int>(_842) : as_type<int>(_784);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _868 = _856 ? as_type<int>(_842) : as_type<int>(_784);
    float _870 = _802 ? as_type<float>(_862) : _784;
    bool _872 = _810 > 0.5;
    float _874 = _824 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _876 = _808 ? as_type<float>(_868) : _784;
    float _878 = _822 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _886 = _884 != 0;
    float _888 = _826 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _890 = 1.0 / _882;
    float _892 = _784;
    bool _894 = _796;
    float _896 = _798;
    float _898 = _852;
    if (_796)
    {
        float _900 = _872 ? _842 : _784;
        _892 = _900;
    }
    float _902 = _892;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _908 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _912 = _910 != 0;
    float _914 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _920 = 1.0 / _906;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _930 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _914);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = _798 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _936 = _924 * _832;
    float _938 = 1.0 / _918;
    float _940 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _942 = fma(_934, -2.0, _844);
    float _944 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _930);
    float _946 = _590 * _590;
    float _948 = -_932;
    float _950 = fma(_940, 2.0, _948);
    float _952 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _954 = 1.0 / _928;
    float _956 = 0.0;
    if (_912)
    {
        _956 = _834;
    }
    float _958 = _956;
    float _960 = fma(_592, _592, _946);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _970 = _958;
    if (!_912)
    {
        _970 = _788;
    }
    float _972 = _970;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _952 + _974;
    float _978 = fma(_594, _594, _960);
    float _980 = _968 * _938;
    float _982 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _836);
    float _984 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _838);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _990 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = _866 * _954;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _998 = _990 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _992 + _1000;
    float _1004 = rsqrt(_978);
    float _1006 = _860 * _920;
    float _1008 = _998 * _998;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _782 + _1014;
    float _1018 = fma(_976, _976, _1008);
    float _1020 = 1.0 / _988;
    float _1022 = fma(_1002, _1002, _1018);
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1028 = fma(_936, _1016, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1032 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1024);
    float _1034 = rsqrt(_1022);
    float _1036 = _1004 * _594;
    float _1038 = _1004 * _592;
    float _1040 = _1004 * _590;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1046 = _1036 * _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1050 = _1038 * _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1054 = _1040 * _1052;
    float _1056 = _1012 * _1020;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1060 = -_1046;
    float _1062 = fma(_1038, _1058, _1060);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1066 = _782 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1070 = -_1054;
    float _1072 = fma(_1036, _1068, _1070);
    float _1074 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1026);
    float _1076 = _1062 * _1062;
    float _1078 = _1040;
    if (_818)
    {
        bool _1080 = _834 > 0.5;
        _894 = _1080;
    }
    bool _1082 = _894;
    float _1084 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1030);
    float _1086 = _998 * _1034;
    float _1088 = _976 * _1034;
    float _1090 = fma(_1072, _1072, _1076);
    float _1092 = _1002 * _1034;
    float _1094 = -_1086;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1098 = -_1088;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1102 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1042);
    if (!_912)
    {
        _896 = _834;
    }
    float _1104 = _896;
    float _1106 = _1096 * _1096;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1110 = -_1050;
    float _1112 = fma(_1040, _1108, _1110);
    float _1114 = fma(_854, _1066, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1120 = _782 + _1118;
    float _1122 = fma(_1112, _1112, _1090);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1126 = _782 + _1124;
    float _1128 = -_1092;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    float _1132 = fma(_1100, _1100, _1106);
    float _1134 = _964 * _890;
    float _1136 = fma(_1006, _1120, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1140 = fma(_994, _1126, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1142 = fma(_1130, _1130, _1132);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1146 = _782 + _1144;
    float _1148 = in.m_61.x;
    float _1150 = in.m_61.y;
    float _1152 = in.m_61.z;
    float _1154 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _942);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1158 = _782 + _1156;
    float _1160 = fma(_980, _1146, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1162 = sqrt(_1142);
    float _1164 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1166 = fma(_1056, _1158, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1168 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1172 = _782 + _1170;
    float _1174 = fma(_1164, _876, -0.5);
    bool _1176 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1178 = isnan(_782);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _972 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1190 = rsqrt(_1122);
    float _1192 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1194 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1032);
    bool _1196 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1198 = isnan(_782);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1204);
    float _1208 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1210 = fma(_870, _1192, -0.5);
    float _1212 = -_1154;
    float _1214 = fma(_1194, _1174, _1212);
    float _1216 = _1034 * _1162;
    bool _1218 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1220 = isnan(_782);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1232 = _908 * _1216;
    float _1234 = _1168 * _1216;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1150);
    float _1238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1240 = _1072 * _1190;
    float _1242 = _1112 * _1190;
    float _1244 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1148);
    float _1248 = -_1228;
    float _1250 = _1248 + 1.0;
    float _1252 = _1234 * _1236;
    float _1254 = _1244 * _1216;
    float _1256 = _1232 * _1246;
    bool _1258 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1260 = isnan(_782);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1206 * _1250;
    float _1272 = -_1206;
    float _1274 = _1272 + 1.0;
    bool _1276 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1278 = isnan(_782);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = _1062 * _1190;
    float _1290 = -_1268;
    float _1292 = _1290 + 1.0;
    float _1294 = _1268 * _1274;
    bool _1296 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1298 = isnan(_782);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = _1254 * _1238;
    float _1310 = _1286 * _1292;
    float _1312 = -_1286;
    float _1314 = _1312 + 1.0;
    bool _1316 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1318 = isnan(_782);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1252 * _1038;
    bool _1330 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1332 = isnan(_782);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1306 * _1314;
    float _1344 = -_1306;
    float _1346 = _1344 + 1.0;
    float _1348 = _1252 * _1036;
    float _1350 = fma(_1256, _1240, _1328);
    float _1352 = -_1340;
    float _1354 = _1352 + 1.0;
    float _1356 = _1340 * _1346;
    float _1358 = _1040 * _1242;
    float _1360 = _1038 * _1288;
    float _1362 = fma(_1256, _1242, _1348);
    float _1364 = _1326 * _1354;
    float _1366 = -_1358;
    float _1368 = fma(_1036, _1288, _1366);
    float _1370 = -_1360;
    float _1372 = fma(_1040, _1240, _1370);
    float _1374 = -_1326;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1308, _1368, _1350);
    float _1380 = fma(_1308, _1372, _1362);
    float _1382 = _1186 * _1376;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1386 = _952 + _1378;
    float _1388 = _992 + _1380;
    float _1390 = _1114 * _1382;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1386 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1400 = _1388 + _1398;
    float _1402 = -_1384;
    float _1404 = fma(_1188, 2.0, _1402);
    float _1406 = fma(_1208, -2.0, _1392);
    float _1408 = _1396 * _1396;
    float _1410 = _1400 * _1400;
    float _1412 = -_1186;
    float _1414 = _1412 + 1.0;
    int _1416 = as_type<int>(_1392);
    float _1418 = _1172;
    float _1420 = _1104;
    float _1422 = _1408;
    float _1424 = _1410;
    float _1426 = _1386;
    float _1428 = _1388;
    float _1430 = _1140;
    if (_818)
    {
        float _1432 = -_852;
        float _1434 = _1432 + 1.0;
        _1416 = as_type<int>(_1434);
    }
    int _1436 = _1416;
    int _1438 = 0;
    if (_830)
    {
        float _1440 = -_852;
        float _1442 = _1440 + 1.0;
        _1438 = as_type<int>(_1442);
    }
    int _1444 = _1438;
    float _1446 = _1408 + _1410;
    int _1448 = 0;
    if (_886)
    {
        float _1450 = -_852;
        float _1452 = _1450 + 1.0;
        _1448 = as_type<int>(_1452);
    }
    int _1454 = _1448;
    float _1456 = fma(_1134, _1172, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1458 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1390);
    float _1460 = sqrt(_1446);
    if (!_818)
    {
        _1418 = _852;
    }
    float _1462 = _1418;
    float _1464 = _1036 * _1240;
    float _1466 = _1462;
    if (!_830)
    {
        _1420 = _852;
    }
    float _1468 = _1420;
    float _1470 = _1252 * _1040;
    float _1472 = _1468;
    if (_818)
    {
        float _1474 = _1082 ? as_type<float>(_1436) : _852;
        _1466 = _1474;
    }
    float _1476 = _1466;
    float _1478 = fma(_1028, _1364, _1458);
    if (_830)
    {
        float _1480 = _850 ? as_type<float>(_1444) : _852;
        _1472 = _1480;
    }
    float _1482 = _1472;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_886)
    {
        float _1486 = _856 ? as_type<float>(_1454) : _852;
        _898 = _1486;
    }
    float _1488 = _898;
    float _1490 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1074);
    float _1492 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1084);
    float _1494 = -_124;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[76].x, _950);
    float _1498 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1102);
    float _1500 = -_124;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1404);
    float _1504 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1406);
    bool _1506 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = fma(_1256, _1288, _1470);
    float _1510 = -_1464;
    float _1512 = fma(_1038, _1242, _1510);
    float _1514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1516 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1518 = fma(_1136, _1356, _1478);
    float _1520 = fma(_1308, _1512, _1508);
    float _1522 = -_1504;
    float _1524 = fma(_1490, _1210, _1522);
    float _1526 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1528 = fma(_1140, _1342, _1518);
    float _1530 = _990 + _1520;
    float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1534 = _1518;
    if (!_1506)
    {
        _1534 = _1530;
    }
    float _1536 = _1534;
    bool _1538 = !_1506;
    float _1540 = _1536;
    if (!_1538)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1546 = _1460 + _1544;
        float _1548 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = rsqrt(_1446);
        float _1552 = _1546 * _1542;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        float _1560 = _1554 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        float _1564 = fma(_1558, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1566 = _1550 * _1564;
        float _1568 = _1562 + (-1.0);
        float _1570 = fma(_1396, _1566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1572 = fma(_1400, _1566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1574 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1578 = _1570 + _1576;
        float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1582 = _1572 + _1580;
        float _1584 = fma(_1530, _1562, _1574);
        float _1586 = _1578 * _1578;
        float _1588 = _1582 * _1582;
        _1540 = _1584;
        _1422 = _1586;
        _1424 = _1588;
        _1426 = _1570;
        _1428 = _1572;
        _1430 = _1574;
    }
    float _1590 = _1540;
    float _1592 = _1422;
    float _1594 = _1424;
    float _1596 = _1426;
    float _1598 = _1428;
    float _1600 = _1430;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1604 = _1590 + _1602;
    float _1606 = fma(_1456, _1310, _1528);
    float _1608 = fma(_1516, _1476, -0.5);
    float _1610 = fma(_1526, _1488, -0.5);
    float _1612 = fma(_1604, _1604, _1592);
    float _1614 = fma(_1160, _1294, _1606);
    float _1616 = _902 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1620 = _1612 + _1594;
    float _1622 = fma(_1492, _1608, _1496);
    float _1624 = fma(_1498, _1610, _1502);
    float _1626 = fma(_1166, _1270, _1614);
    float _1628 = _1616 * _1532;
    float _1630 = _1618 * _1514;
    float _1632 = sqrt(_1620);
    float _1634 = _1214 + 0.5;
    float _1636 = _1524 + 0.5;
    float _1638 = _1622 + 0.5;
    float _1640 = _1624 + 0.5;
    float _1642 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1626);
    float _1644 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_63.x = _1638;
    out.m_63.y = _1634;
    out.m_63.z = _1630;
    out.m_63.w = _1628;
    float _1646 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1648 = _1038 * _1644;
    float _1650 = _1040 * _1644;
    out.m_65.x = _1640;
    out.m_65.y = _1636;
    float _1652 = _1036 * _1644;
    float _1654 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1656 = fma(_1240, _1646, _1648);
    out.m_67.x = _1642;
    bool _1658 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1660 = isnan(_1632);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1666 = _1662 || _1664;
    float _1668 = fma(_1288, _1646, _1650);
    float _1670 = fma(_1242, _1646, _1652);
    float _1672 = fma(_1368, _1654, _1656);
    float _1674 = fma(_1512, _1654, _1668);
    float _1676 = fma(_1372, _1654, _1670);
    float _1678 = _1646;
    float _1680 = _1600;
    float _1682 = _1652;
    if (!_1666)
    {
        _1678 = 1.0;
    }
    float _1684 = _1678;
    bool _1686 = !_1666;
    float _1688 = _1684;
    if (!_1686)
    {
        bool _1690 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1692 = isnan(_1632);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = _1632 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1706 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1712 = 1.0 / _1706;
            float _1714 = _1702 * _1712;
            float _1716 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1688 = _1716;
            _1718 = true;
        }
        else
        {
            bool _1720 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1722 = isnan(_1632);
            bool _1724 = _1720 || _1722;
            bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1728 = _1724 || _1726;
            if (!_1728)
            {
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1632 + _1730;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1742 = 1.0 / _1736;
                float _1744 = _1732 * _1742;
                float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1688 = _1746;
                _1718 = true;
            }
            else
            {
                _1688 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1718 = false;
    float _1748 = _1688;
    float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1752 = _1590 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1756 = _1596 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1760 = _1598 + _1758;
    float _1762 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1764 = fma(_1756, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1766 = fma(_1760, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1768 = -_1086;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _1772 = -_1088;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    float _1776 = -_1092;
    float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1770 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1786 = _1774 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1790 = _1778 + _1788;
    float _1792 = _1782 * _1782;
    float _1794 = fma(_1786, _1786, _1792);
    float _1796 = fma(_1790, _1790, _1794);
    float _1798 = rsqrt(_1796);
    float _1800 = _1786 * _1798;
    float _1802 = _1790 * _1798;
    float _1804 = _1782 * _1798;
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1810 = _1806 * _1806;
    float _1812 = _1808 * _1808;
    float _1814 = _1810 + _1812;
    float _1816 = sqrt(_1814);
    bool _1818 = _1816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1822 = _1816 + _1820;
    float _1824 = _1630;
    float _1826 = _1814;
    float _1828 = _1822;
    if (_1818)
    {
        float _1830 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1830;
    }
    float _1832 = _1824;
    if (_1818)
    {
        float _1834 = rsqrt(_1814);
        _1826 = _1834;
    }
    float _1836 = _1826;
    float _1838 = _1836;
    if (_1818)
    {
        float _1840 = _1822 * _1832;
        _1828 = _1840;
    }
    float _1842 = _1828;
    if (_1818)
    {
        float _1844 = _1842 * 0.15915493667125701904296875;
        _1078 = _1844;
    }
    float _1846 = _1078;
    float _1848 = _1832;
    if (_1818)
    {
        float _1850 = _1846 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        _1848 = _1852;
    }
    float _1854 = _1848;
    float _1856 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1858 = precise::max(0.0, _1856);
    float _1860 = _1628;
    float _1862 = _1856;
    float _1864 = _1858;
    if (_1818)
    {
        float _1866 = _1846 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        _1860 = _1868;
    }
    float _1870 = _1860;
    float _1872 = -_1804;
    float _1874 = -_1858;
    float _1876 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1874);
    if (_1818)
    {
        float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1862 = _1878;
    }
    float _1880 = _1862;
    float _1882 = sqrt(_1796);
    float _1884 = _1880;
    float _1886 = _1854;
    if (_1818)
    {
        float _1888 = fma(_1854, _1880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = _1890;
    if (!_1818)
    {
        _1886 = _1806;
    }
    float _1894 = _1886;
    float _1896 = _1894;
    float _1898 = _1870;
    if (_1818)
    {
        float _1900 = _1870 + (-1.0);
        _1864 = _1900;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1818)
    {
        float _1906 = _1836 * _1890;
        _1680 = _1906;
    }
    float _1908 = _1680;
    if (!_1818)
    {
        _1892 = _1876;
    }
    float _1910 = _1892;
    float _1912 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1914 = _1910;
    if (_1818)
    {
        float _1916 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1682 = _1916;
    }
    float _1918 = _1682;
    if (_1818)
    {
        float _1920 = _1806 * _1908;
        _1896 = _1920;
    }
    float _1922 = _1896;
    if (!_1818)
    {
        _1904 = _1808;
    }
    float _1924 = _1904;
    float _1926 = _1924;
    if (_1818)
    {
        float _1928 = _1808 * _1908;
        _1926 = _1928;
    }
    float _1930 = _1926;
    if (!_1818)
    {
        _1838 = _1810;
    }
    float _1932 = _1838;
    float _1934 = _1932;
    if (_1818)
    {
        float _1936 = fma(_1876, _1870, _1918);
        _1914 = _1936;
    }
    float _1938 = _1914;
    if (_1818)
    {
        float _1940 = _1922 * _1922;
        _1934 = _1940;
    }
    float _1942 = _1934;
    if (!_1818)
    {
        _1898 = _1812;
    }
    float _1944 = _1898;
    float _1946 = _1944;
    if (_1818)
    {
        float _1948 = _1930 * _1930;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = fma(_1938, _1938, _1942);
    float _1954 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1956 = _1952 + _1950;
    float _1958 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1962 = fma(_1882, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1960);
    float _1964 = precise::clamp(_1962, 0.0, 1.0);
    float _1966 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1968 = rsqrt(_1956);
    float _1970 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1958);
    float _1972 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1974 = -_1964;
    float _1976 = _1974 + 1.0;
    float _1978 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1970);
    float _1980 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1954);
    float _1982 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1972);
    float _1984 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1912);
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1980);
    float _1990 = abs(_1976);
    float _1992 = log2(_1990);
    float _1994 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1982);
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2000 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2002 = _1968 * _1922;
    float _2004 = _1968 * _1938;
    float _2006 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2008 = -_1996;
    float _2010 = fma(_2008, _1966, 1.0);
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2014 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2016 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2018 = _1968 * _1930;
    float _2020 = -_2012;
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2020);
    float _2024 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2014);
    float _2026 = log2(_2010);
    float _2028 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = -_2018;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2022);
    float _2034 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2024);
    float _2036 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2038 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2034);
    float _2044 = exp2(_2028);
    float _2046 = fma(_2032, 0.5, 0.5);
    float _2048 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2036);
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = _2004 + 1.0;
    float _2054 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2056 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2048);
    float _2058 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2060 = 1.0 / _2042;
    float _2062 = fma(_2046, _2054, -0.212114393711090087890625);
    float _2064 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2066 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2058);
    float _2068 = _2026 * 0.693147182464599609375;
    float _2070 = fma(_2046, _2062, 1.570728778839111328125);
    float _2072 = sqrt(_2040);
    float _2074 = -_2004;
    float _2076 = fma(_2044, _2052, _2074);
    float _2078 = _2064 * _2060;
    float _2080 = _2066 * _2060;
    float _2082 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2076, 0.5, 0.5);
    float _2086 = fma(_2078, 0.5, 0.5);
    float _2088 = fma(_2080, -0.5, 0.5);
    float _2090 = _2072 * 0.636619746685028076171875;
    float _2092 = -_2070;
    float _2094 = fma(_2090, _2092, 1.0);
    float3 _5659 = float3(_2086, _2088, _2082);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5659, float3(0.0), isnan(_5659)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5659, float3(0.0), isnan(_5659)), level(0.0)).x;
    float3 _5670 = float3(_2086, _2088, _2082);
    float4 _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5670, float3(0.0), isnan(_5670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5670, float3(0.0), isnan(_5670)), level(0.0)).xyzw;
    float _2101 = _2099.x;
    float _2103 = _2099.y;
    float _2105 = _2099.z;
    float _2107 = _2099.w;
    float2 _5687 = float2(_2094, _2084);
    float3 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5687, float2(0.0), isnan(_5687)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5687, float2(0.0), isnan(_5687)), level(0.0)).xyz;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = -_1086;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _2123 = -_1088;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _2127 = -_1092;
    float _2129 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _992);
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2135;
    float _2139 = _1674 * _1804;
    float _2141 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2131);
    float _2143 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2133);
    float _2145 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2147 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2141);
    float _2149 = 1.0 / _2137;
    float _2151 = fma(_1672, _1800, _2139);
    bool _2153 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2155 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(0.5);
    bool _2161 = _2157 || _2159;
    float _2163 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2165 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2143);
    float _2167 = fma(_1676, _1802, _2151);
    float _2169 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2171 = 1.0 / _2163;
    float _2173 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2175 = abs(_2167);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2179 = _2175 + _2177;
    float _2181 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2169);
    float _2183 = _2173 + _2163;
    float _2185 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2181);
    float _2187 = exp2(_2145);
    float _2189 = _2179 * _2149;
    float _2191 = precise::clamp(_2189, 0.0, 1.0);
    float _2193 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2185);
    float _2195 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2161)
    {
        _2195 = 1.0;
    }
    float _2197 = _2195;
    float _2199 = fma(_2191, -2.0, 3.0);
    float _2201 = _2191 * _2191;
    float _2203 = _2183 * _2171;
    float _2205 = _2203 * 0.5;
    float _2207 = _2197;
    if (!_2161)
    {
        float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2211 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2209);
        float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2217 = 1.0 / _2211;
        float _2219 = 1.0 / _2215;
        float _2221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2225 = fma(_2217, _2221, _2223);
        float _2227 = _2225 * _2219;
        float _2229 = precise::clamp(_2227, 0.0, 1.0);
        _2207 = _2229;
    }
    float _2231 = _2207;
    float _2233 = _2201 * _2199;
    float _2235 = -_2187;
    float _2237 = _2235 + 1.0;
    float _2239 = _2042 * 0.5;
    bool _2241 = _2231 > 0.0;
    bool _2243 = isnan(_2231);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = _2233 * _2231;
    float _2253 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2255 = fma(_2066, -0.5, _2239);
    float _2257 = _2193 + _2042;
    float _2259 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2261 = _2253 * _2096;
    float _2263 = _2064 + _2042;
    float _2265 = -_2253;
    float _2267 = _2265 + 1.0;
    float _2269 = _2259 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2271 = _2107 * _2261;
    float _2273 = _2117 * _2261;
    out.gl_Position.x = _2064;
    out.gl_Position.y = _2066;
    out.gl_Position.z = _2193;
    out.gl_Position.w = _2042;
    float _2275 = fma(_2113, _2271, _2101);
    float _2277 = fma(_2115, _2271, _2103);
    float _2279 = _2257 * 0.5;
    float _2281 = _2263 * 0.5;
    float _2283 = _2107 * _2267;
    float _2285 = fma(_2107, _2273, _2105);
    out.m_47.x = _2269;
    out.m_69.x = _2281;
    out.m_69.y = _2255;
    out.m_69.z = _2279;
    out.m_69.w = _2042;
    out.m_71.x = _2275;
    out.m_71.y = _2277;
    out.m_71.z = _2285;
    out.m_71.w = _2283;
    if (_2249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2287 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2287;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1718 = false;
    bool _774 = false;
    bool _618 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2344 = as_type<float>(_106);
        out.gl_Position.z = _2344;
    }
    if (!_94)
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
    float _128 = 0.0;
    if (_120)
    {
        float _130 = float(_90);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    float _148 = as_type<float>(_146);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2415 = as_type<float>(_146);
        out.gl_Position.z = _2415;
    }
    if (_138)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = _156;
    if (!_166)
    {
        float _170 = _156 * _156;
        float _172 = _170 * 0.5;
        _148 = _172;
    }
    float _174 = _148;
    float _176 = 0.0;
    float _178 = _174;
    if (!_166)
    {
        float _180 = _124 * _124;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    if (!_166)
    {
        float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _186;
    }
    float _188 = _178;
    bool _190 = !_166;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _156 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _156);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _126 = _212;
        _192 = _222;
        _128 = _210;
    }
    float _224 = _126;
    float _226 = _192;
    float _228 = _128;
    bool _230 = !_166;
    float _232 = _224;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _156 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _232 = _248;
        _234 = _242;
        _168 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _168;
    float _262 = _258;
    float _264 = _256;
    if (!_166)
    {
        _262 = _124;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _266;
    if (!_166)
    {
        float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _272;
    }
    float _274 = _264;
    bool _276 = !_166;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _124 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _124);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    bool _312 = !_166;
    if (!_312)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _124 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _270 = _332;
    }
    float _334 = _270;
    float _336 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_260, _152, _268);
    float _340 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_334, _152, _336);
    float _346 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_260, _150, _340);
    float _352 = fma(_334, _150, _342);
    float _354 = -_344;
    float _356 = _338 + _354;
    float _358 = fma(_260, _154, _346);
    float _360 = fma(_334, _154, _348);
    float _362 = -_352;
    float _364 = _350 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_51.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = in.m_44.x;
    float _390 = in.m_44.y;
    float _392 = in.m_44.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _414 = fma(_338, _368, _390);
    float _416 = fma(_350, _368, _388);
    float _418 = fma(_358, _368, _392);
    float _420 = _338;
    float _422 = _396;
    float _424 = _412;
    if (_410)
    {
        _420 = _400;
    }
    float _426 = _420;
    float _428 = _426;
    if (!_410)
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
            _422 = _464;
            _424 = _462;
            _428 = _466;
            _468 = true;
        }
        else
        {
            float _470 = _152 * _152;
            float _472 = fma(_150, _150, _470);
            float _474 = fma(_154, _154, _472);
            float _476 = sqrt(_474);
            bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
            bool _480 = isnan(_476);
            bool _482 = _478 || _480;
            bool _484 = isnan(9.9999999747524270787835121154785e-07);
            bool _486 = _482 || _484;
            if (!_486)
            {
                float _488 = _390 * _390;
                float _490 = fma(_388, _388, _488);
                float _492 = fma(_392, _392, _490);
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
                    _422 = _518;
                    _424 = _516;
                    _428 = _520;
                    _468 = true;
                }
                else
                {
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _526 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
                    float _538 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
                    float _540 = _534 * _534;
                    float _542 = fma(_536, _536, _540);
                    float _544 = fma(_538, _538, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _536 * _548;
                    float _552 = _534 * _548;
                    float _554 = _538 * _548;
                    _422 = _552;
                    _424 = _550;
                    _428 = _554;
                    _468 = true;
                }
            }
            else
            {
                float _556 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _558 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _560 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _562 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                float _566 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                float _568 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                float _570 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                float _572 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                float _574 = _568 * _568;
                float _576 = fma(_570, _570, _574);
                float _578 = fma(_572, _572, _576);
                float _580 = rsqrt(_578);
                float _582 = _580 * 9.9999999747524270787835121154785e-07;
                float _584 = _570 * _582;
                float _586 = _568 * _582;
                float _588 = _572 * _582;
                _422 = _586;
                _424 = _584;
                _428 = _588;
            }
        }
    }
    _468 = false;
    float _590 = _422;
    float _592 = _424;
    float _594 = _428;
    bool _596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _598 = !_596;
    float _616;
    if (!_598)
    {
        float _600 = in.m_53.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_90);
        float _622 = 1.0 / _620;
        float _624 = _124 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _626 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = isnan(_626);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _652 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _654 = isnan(_626);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    bool _668 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = 1.0 / _634;
    float _682 = -_646;
    float _684 = _682 + 1.0;
    float _686 = -_678;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _694 = 1.0 / _650;
    float _696 = _646 * _688;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _700 = _666 * _680;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_700, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _710 = _662 * _684;
    float _712 = -_662;
    float _714 = _712 + 1.0;
    float _716 = _704 * _694;
    float _718 = _708 * _710;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _626 + _720;
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _726 = fma(_716, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = fma(_726, _696, _724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _734 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[117].x, _730);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _740 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _748;
    out.m_55.y = _750;
    out.m_55.z = _706;
    out.m_55.w = _692;
    out.m_57.x = _740;
    out.m_57.y = _744;
    out.m_57.z = _746;
    out.m_57.w = _752;
    bool _754 = !_690;
    float _772;
    if (!_754)
    {
        float _756 = in.m_53.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = in.m_59.y;
    float _786 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _788 = in.m_53.z;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _796 = _794 != 0;
    float _798 = in.m_53.y;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _802 = _800 != 0;
    float _804 = 1.0 / _792;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _808 = _806 != 0;
    float _810 = in.m_53.w;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _818 = _816 != 0;
    float _820 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = in.m_51.x;
    float _824 = in.m_51.y;
    float _826 = in.m_51.z;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _830 = _828 != 0;
    float _832 = 1.0 / _814;
    float _834 = in.m_53.x;
    float _836 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    float _838 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _840 = -_784;
    float _842 = _840 + 1.0;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _846;
    bool _850 = _788 > 0.5;
    float _852 = in.m_59.x;
    float _854 = _848 * _804;
    bool _856 = _798 > 0.5;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _858;
    int _862 = _850 ? as_type<int>(_842) : as_type<int>(_784);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _868 = _856 ? as_type<int>(_842) : as_type<int>(_784);
    float _870 = _802 ? as_type<float>(_862) : _784;
    bool _872 = _810 > 0.5;
    float _874 = _824 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _876 = _808 ? as_type<float>(_868) : _784;
    float _878 = _822 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _886 = _884 != 0;
    float _888 = _826 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _890 = 1.0 / _882;
    float _892 = _784;
    bool _894 = _796;
    float _896 = _798;
    float _898 = _852;
    if (_796)
    {
        float _900 = _872 ? _842 : _784;
        _892 = _900;
    }
    float _902 = _892;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _908 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _912 = _910 != 0;
    float _914 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _920 = 1.0 / _906;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _930 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _914);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = _798 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _936 = _924 * _832;
    float _938 = 1.0 / _918;
    float _940 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _942 = fma(_934, -2.0, _844);
    float _944 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _930);
    float _946 = _590 * _590;
    float _948 = -_932;
    float _950 = fma(_940, 2.0, _948);
    float _952 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _954 = 1.0 / _928;
    float _956 = 0.0;
    if (_912)
    {
        _956 = _834;
    }
    float _958 = _956;
    float _960 = fma(_592, _592, _946);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _970 = _958;
    if (!_912)
    {
        _970 = _788;
    }
    float _972 = _970;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _952 + _974;
    float _978 = fma(_594, _594, _960);
    float _980 = _968 * _938;
    float _982 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _836);
    float _984 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _838);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _990 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = _866 * _954;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _998 = _990 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _992 + _1000;
    float _1004 = rsqrt(_978);
    float _1006 = _860 * _920;
    float _1008 = _998 * _998;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _782 + _1014;
    float _1018 = fma(_976, _976, _1008);
    float _1020 = 1.0 / _988;
    float _1022 = fma(_1002, _1002, _1018);
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1028 = fma(_936, _1016, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1032 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1024);
    float _1034 = rsqrt(_1022);
    float _1036 = _1004 * _594;
    float _1038 = _1004 * _592;
    float _1040 = _1004 * _590;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1046 = _1036 * _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1050 = _1038 * _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1054 = _1040 * _1052;
    float _1056 = _1012 * _1020;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1060 = -_1046;
    float _1062 = fma(_1038, _1058, _1060);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1066 = _782 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1070 = -_1054;
    float _1072 = fma(_1036, _1068, _1070);
    float _1074 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1026);
    float _1076 = _1062 * _1062;
    float _1078 = _1040;
    if (_818)
    {
        bool _1080 = _834 > 0.5;
        _894 = _1080;
    }
    bool _1082 = _894;
    float _1084 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1030);
    float _1086 = _998 * _1034;
    float _1088 = _976 * _1034;
    float _1090 = fma(_1072, _1072, _1076);
    float _1092 = _1002 * _1034;
    float _1094 = -_1086;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1098 = -_1088;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1102 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1042);
    if (!_912)
    {
        _896 = _834;
    }
    float _1104 = _896;
    float _1106 = _1096 * _1096;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1110 = -_1050;
    float _1112 = fma(_1040, _1108, _1110);
    float _1114 = fma(_854, _1066, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1120 = _782 + _1118;
    float _1122 = fma(_1112, _1112, _1090);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1126 = _782 + _1124;
    float _1128 = -_1092;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    float _1132 = fma(_1100, _1100, _1106);
    float _1134 = _964 * _890;
    float _1136 = fma(_1006, _1120, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1140 = fma(_994, _1126, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1142 = fma(_1130, _1130, _1132);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1146 = _782 + _1144;
    float _1148 = in.m_61.x;
    float _1150 = in.m_61.y;
    float _1152 = in.m_61.z;
    float _1154 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _942);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1158 = _782 + _1156;
    float _1160 = fma(_980, _1146, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1162 = sqrt(_1142);
    float _1164 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1166 = fma(_1056, _1158, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1168 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1172 = _782 + _1170;
    float _1174 = fma(_1164, _876, -0.5);
    bool _1176 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1178 = isnan(_782);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _972 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1190 = rsqrt(_1122);
    float _1192 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1194 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1032);
    bool _1196 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1198 = isnan(_782);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1204);
    float _1208 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1210 = fma(_870, _1192, -0.5);
    float _1212 = -_1154;
    float _1214 = fma(_1194, _1174, _1212);
    float _1216 = _1034 * _1162;
    bool _1218 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1220 = isnan(_782);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1232 = _908 * _1216;
    float _1234 = _1168 * _1216;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1150);
    float _1238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1240 = _1072 * _1190;
    float _1242 = _1112 * _1190;
    float _1244 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1148);
    float _1248 = -_1228;
    float _1250 = _1248 + 1.0;
    float _1252 = _1234 * _1236;
    float _1254 = _1244 * _1216;
    float _1256 = _1232 * _1246;
    bool _1258 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1260 = isnan(_782);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1206 * _1250;
    float _1272 = -_1206;
    float _1274 = _1272 + 1.0;
    bool _1276 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1278 = isnan(_782);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = _1062 * _1190;
    float _1290 = -_1268;
    float _1292 = _1290 + 1.0;
    float _1294 = _1268 * _1274;
    bool _1296 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1298 = isnan(_782);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = _1254 * _1238;
    float _1310 = _1286 * _1292;
    float _1312 = -_1286;
    float _1314 = _1312 + 1.0;
    bool _1316 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1318 = isnan(_782);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1252 * _1038;
    bool _1330 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1332 = isnan(_782);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1306 * _1314;
    float _1344 = -_1306;
    float _1346 = _1344 + 1.0;
    float _1348 = _1252 * _1036;
    float _1350 = fma(_1256, _1240, _1328);
    float _1352 = -_1340;
    float _1354 = _1352 + 1.0;
    float _1356 = _1340 * _1346;
    float _1358 = _1040 * _1242;
    float _1360 = _1038 * _1288;
    float _1362 = fma(_1256, _1242, _1348);
    float _1364 = _1326 * _1354;
    float _1366 = -_1358;
    float _1368 = fma(_1036, _1288, _1366);
    float _1370 = -_1360;
    float _1372 = fma(_1040, _1240, _1370);
    float _1374 = -_1326;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1308, _1368, _1350);
    float _1380 = fma(_1308, _1372, _1362);
    float _1382 = _1186 * _1376;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1386 = _952 + _1378;
    float _1388 = _992 + _1380;
    float _1390 = _1114 * _1382;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1386 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1400 = _1388 + _1398;
    float _1402 = -_1384;
    float _1404 = fma(_1188, 2.0, _1402);
    float _1406 = fma(_1208, -2.0, _1392);
    float _1408 = _1396 * _1396;
    float _1410 = _1400 * _1400;
    float _1412 = -_1186;
    float _1414 = _1412 + 1.0;
    int _1416 = as_type<int>(_1392);
    float _1418 = _1172;
    float _1420 = _1104;
    float _1422 = _1408;
    float _1424 = _1410;
    float _1426 = _1386;
    float _1428 = _1388;
    float _1430 = _1140;
    if (_818)
    {
        float _1432 = -_852;
        float _1434 = _1432 + 1.0;
        _1416 = as_type<int>(_1434);
    }
    int _1436 = _1416;
    int _1438 = 0;
    if (_830)
    {
        float _1440 = -_852;
        float _1442 = _1440 + 1.0;
        _1438 = as_type<int>(_1442);
    }
    int _1444 = _1438;
    float _1446 = _1408 + _1410;
    int _1448 = 0;
    if (_886)
    {
        float _1450 = -_852;
        float _1452 = _1450 + 1.0;
        _1448 = as_type<int>(_1452);
    }
    int _1454 = _1448;
    float _1456 = fma(_1134, _1172, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1458 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1390);
    float _1460 = sqrt(_1446);
    if (!_818)
    {
        _1418 = _852;
    }
    float _1462 = _1418;
    float _1464 = _1036 * _1240;
    float _1466 = _1462;
    if (!_830)
    {
        _1420 = _852;
    }
    float _1468 = _1420;
    float _1470 = _1252 * _1040;
    float _1472 = _1468;
    if (_818)
    {
        float _1474 = _1082 ? as_type<float>(_1436) : _852;
        _1466 = _1474;
    }
    float _1476 = _1466;
    float _1478 = fma(_1028, _1364, _1458);
    if (_830)
    {
        float _1480 = _850 ? as_type<float>(_1444) : _852;
        _1472 = _1480;
    }
    float _1482 = _1472;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_886)
    {
        float _1486 = _856 ? as_type<float>(_1454) : _852;
        _898 = _1486;
    }
    float _1488 = _898;
    float _1490 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1074);
    float _1492 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1084);
    float _1494 = -_124;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[76].x, _950);
    float _1498 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1102);
    float _1500 = -_124;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1404);
    float _1504 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1406);
    bool _1506 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = fma(_1256, _1288, _1470);
    float _1510 = -_1464;
    float _1512 = fma(_1038, _1242, _1510);
    float _1514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1516 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1518 = fma(_1136, _1356, _1478);
    float _1520 = fma(_1308, _1512, _1508);
    float _1522 = -_1504;
    float _1524 = fma(_1490, _1210, _1522);
    float _1526 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1528 = fma(_1140, _1342, _1518);
    float _1530 = _990 + _1520;
    float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1534 = _1518;
    if (!_1506)
    {
        _1534 = _1530;
    }
    float _1536 = _1534;
    bool _1538 = !_1506;
    float _1540 = _1536;
    if (!_1538)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1546 = _1460 + _1544;
        float _1548 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = rsqrt(_1446);
        float _1552 = _1546 * _1542;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        float _1560 = _1554 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        float _1564 = fma(_1558, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1566 = _1550 * _1564;
        float _1568 = _1562 + (-1.0);
        float _1570 = fma(_1396, _1566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1572 = fma(_1400, _1566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1574 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1578 = _1570 + _1576;
        float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1582 = _1572 + _1580;
        float _1584 = fma(_1530, _1562, _1574);
        float _1586 = _1578 * _1578;
        float _1588 = _1582 * _1582;
        _1540 = _1584;
        _1422 = _1586;
        _1424 = _1588;
        _1426 = _1570;
        _1428 = _1572;
        _1430 = _1574;
    }
    float _1590 = _1540;
    float _1592 = _1422;
    float _1594 = _1424;
    float _1596 = _1426;
    float _1598 = _1428;
    float _1600 = _1430;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1604 = _1590 + _1602;
    float _1606 = fma(_1456, _1310, _1528);
    float _1608 = fma(_1516, _1476, -0.5);
    float _1610 = fma(_1526, _1488, -0.5);
    float _1612 = fma(_1604, _1604, _1592);
    float _1614 = fma(_1160, _1294, _1606);
    float _1616 = _902 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1620 = _1612 + _1594;
    float _1622 = fma(_1492, _1608, _1496);
    float _1624 = fma(_1498, _1610, _1502);
    float _1626 = fma(_1166, _1270, _1614);
    float _1628 = _1616 * _1532;
    float _1630 = _1618 * _1514;
    float _1632 = sqrt(_1620);
    float _1634 = _1214 + 0.5;
    float _1636 = _1524 + 0.5;
    float _1638 = _1622 + 0.5;
    float _1640 = _1624 + 0.5;
    float _1642 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1626);
    float _1644 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_63.x = _1638;
    out.m_63.y = _1634;
    out.m_63.z = _1630;
    out.m_63.w = _1628;
    float _1646 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1648 = _1038 * _1644;
    float _1650 = _1040 * _1644;
    out.m_65.x = _1640;
    out.m_65.y = _1636;
    float _1652 = _1036 * _1644;
    float _1654 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1656 = fma(_1240, _1646, _1648);
    out.m_67.x = _1642;
    bool _1658 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1660 = isnan(_1632);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1666 = _1662 || _1664;
    float _1668 = fma(_1288, _1646, _1650);
    float _1670 = fma(_1242, _1646, _1652);
    float _1672 = fma(_1368, _1654, _1656);
    float _1674 = fma(_1512, _1654, _1668);
    float _1676 = fma(_1372, _1654, _1670);
    float _1678 = _1646;
    float _1680 = _1600;
    float _1682 = _1652;
    if (!_1666)
    {
        _1678 = 1.0;
    }
    float _1684 = _1678;
    bool _1686 = !_1666;
    float _1688 = _1684;
    if (!_1686)
    {
        bool _1690 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1692 = isnan(_1632);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = _1632 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1706 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1712 = 1.0 / _1706;
            float _1714 = _1702 * _1712;
            float _1716 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1688 = _1716;
            _1718 = true;
        }
        else
        {
            bool _1720 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1722 = isnan(_1632);
            bool _1724 = _1720 || _1722;
            bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1728 = _1724 || _1726;
            if (!_1728)
            {
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1632 + _1730;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1742 = 1.0 / _1736;
                float _1744 = _1732 * _1742;
                float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1688 = _1746;
                _1718 = true;
            }
            else
            {
                _1688 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1718 = false;
    float _1748 = _1688;
    float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1752 = _1590 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1756 = _1596 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1760 = _1598 + _1758;
    float _1762 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1764 = fma(_1756, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1766 = fma(_1760, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1768 = -_1086;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _1772 = -_1088;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    float _1776 = -_1092;
    float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1770 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1786 = _1774 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1790 = _1778 + _1788;
    float _1792 = _1782 * _1782;
    float _1794 = fma(_1786, _1786, _1792);
    float _1796 = fma(_1790, _1790, _1794);
    float _1798 = rsqrt(_1796);
    float _1800 = _1786 * _1798;
    float _1802 = _1790 * _1798;
    float _1804 = _1782 * _1798;
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1810 = _1806 * _1806;
    float _1812 = _1808 * _1808;
    float _1814 = _1810 + _1812;
    float _1816 = sqrt(_1814);
    bool _1818 = _1816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1822 = _1816 + _1820;
    float _1824 = _1630;
    float _1826 = _1814;
    float _1828 = _1822;
    if (_1818)
    {
        float _1830 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1830;
    }
    float _1832 = _1824;
    if (_1818)
    {
        float _1834 = rsqrt(_1814);
        _1826 = _1834;
    }
    float _1836 = _1826;
    float _1838 = _1836;
    if (_1818)
    {
        float _1840 = _1822 * _1832;
        _1828 = _1840;
    }
    float _1842 = _1828;
    if (_1818)
    {
        float _1844 = _1842 * 0.15915493667125701904296875;
        _1078 = _1844;
    }
    float _1846 = _1078;
    float _1848 = _1832;
    if (_1818)
    {
        float _1850 = _1846 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        _1848 = _1852;
    }
    float _1854 = _1848;
    float _1856 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1858 = precise::max(0.0, _1856);
    float _1860 = _1628;
    float _1862 = _1856;
    float _1864 = _1858;
    if (_1818)
    {
        float _1866 = _1846 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        _1860 = _1868;
    }
    float _1870 = _1860;
    float _1872 = -_1804;
    float _1874 = -_1858;
    float _1876 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1874);
    if (_1818)
    {
        float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1862 = _1878;
    }
    float _1880 = _1862;
    float _1882 = sqrt(_1796);
    float _1884 = _1880;
    float _1886 = _1854;
    if (_1818)
    {
        float _1888 = fma(_1854, _1880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = _1890;
    if (!_1818)
    {
        _1886 = _1806;
    }
    float _1894 = _1886;
    float _1896 = _1894;
    float _1898 = _1870;
    if (_1818)
    {
        float _1900 = _1870 + (-1.0);
        _1864 = _1900;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1818)
    {
        float _1906 = _1836 * _1890;
        _1680 = _1906;
    }
    float _1908 = _1680;
    if (!_1818)
    {
        _1892 = _1876;
    }
    float _1910 = _1892;
    float _1912 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1914 = _1910;
    if (_1818)
    {
        float _1916 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1682 = _1916;
    }
    float _1918 = _1682;
    if (_1818)
    {
        float _1920 = _1806 * _1908;
        _1896 = _1920;
    }
    float _1922 = _1896;
    if (!_1818)
    {
        _1904 = _1808;
    }
    float _1924 = _1904;
    float _1926 = _1924;
    if (_1818)
    {
        float _1928 = _1808 * _1908;
        _1926 = _1928;
    }
    float _1930 = _1926;
    if (!_1818)
    {
        _1838 = _1810;
    }
    float _1932 = _1838;
    float _1934 = _1932;
    if (_1818)
    {
        float _1936 = fma(_1876, _1870, _1918);
        _1914 = _1936;
    }
    float _1938 = _1914;
    if (_1818)
    {
        float _1940 = _1922 * _1922;
        _1934 = _1940;
    }
    float _1942 = _1934;
    if (!_1818)
    {
        _1898 = _1812;
    }
    float _1944 = _1898;
    float _1946 = _1944;
    if (_1818)
    {
        float _1948 = _1930 * _1930;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = fma(_1938, _1938, _1942);
    float _1954 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1956 = _1952 + _1950;
    float _1958 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1962 = fma(_1882, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1960);
    float _1964 = precise::clamp(_1962, 0.0, 1.0);
    float _1966 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1968 = rsqrt(_1956);
    float _1970 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1958);
    float _1972 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1974 = -_1964;
    float _1976 = _1974 + 1.0;
    float _1978 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1970);
    float _1980 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1954);
    float _1982 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1972);
    float _1984 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1912);
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1980);
    float _1990 = abs(_1976);
    float _1992 = log2(_1990);
    float _1994 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1982);
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2000 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2002 = _1968 * _1922;
    float _2004 = _1968 * _1938;
    float _2006 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2008 = -_1996;
    float _2010 = fma(_2008, _1966, 1.0);
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2014 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2016 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2018 = _1968 * _1930;
    float _2020 = -_2012;
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2020);
    float _2024 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2014);
    float _2026 = log2(_2010);
    float _2028 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = -_2018;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2022);
    float _2034 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2024);
    float _2036 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2038 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2034);
    float _2044 = exp2(_2028);
    float _2046 = fma(_2032, 0.5, 0.5);
    float _2048 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2036);
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = _2004 + 1.0;
    float _2054 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2056 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2048);
    float _2058 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2060 = 1.0 / _2042;
    float _2062 = fma(_2046, _2054, -0.212114393711090087890625);
    float _2064 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2066 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2058);
    float _2068 = _2026 * 0.693147182464599609375;
    float _2070 = fma(_2046, _2062, 1.570728778839111328125);
    float _2072 = sqrt(_2040);
    float _2074 = -_2004;
    float _2076 = fma(_2044, _2052, _2074);
    float _2078 = _2064 * _2060;
    float _2080 = _2066 * _2060;
    float _2082 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2076, 0.5, 0.5);
    float _2086 = fma(_2078, 0.5, 0.5);
    float _2088 = fma(_2080, -0.5, 0.5);
    float _2090 = _2072 * 0.636619746685028076171875;
    float _2092 = -_2070;
    float _2094 = fma(_2090, _2092, 1.0);
    float3 _5659 = float3(_2086, _2088, _2082);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5659, float3(0.0), isnan(_5659)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5659, float3(0.0), isnan(_5659)), level(0.0)).x;
    float3 _5670 = float3(_2086, _2088, _2082);
    float4 _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5670, float3(0.0), isnan(_5670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5670, float3(0.0), isnan(_5670)), level(0.0)).xyzw;
    float _2101 = _2099.x;
    float _2103 = _2099.y;
    float _2105 = _2099.z;
    float _2107 = _2099.w;
    float2 _5687 = float2(_2094, _2084);
    float3 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5687, float2(0.0), isnan(_5687)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5687, float2(0.0), isnan(_5687)), level(0.0)).xyz;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = -_1086;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _2123 = -_1088;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _2127 = -_1092;
    float _2129 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _992);
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2135;
    float _2139 = _1674 * _1804;
    float _2141 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2131);
    float _2143 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2133);
    float _2145 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2147 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2141);
    float _2149 = 1.0 / _2137;
    float _2151 = fma(_1672, _1800, _2139);
    bool _2153 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2155 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(0.5);
    bool _2161 = _2157 || _2159;
    float _2163 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2165 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2143);
    float _2167 = fma(_1676, _1802, _2151);
    float _2169 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2171 = 1.0 / _2163;
    float _2173 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2175 = abs(_2167);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2179 = _2175 + _2177;
    float _2181 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2169);
    float _2183 = _2173 + _2163;
    float _2185 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2181);
    float _2187 = exp2(_2145);
    float _2189 = _2179 * _2149;
    float _2191 = precise::clamp(_2189, 0.0, 1.0);
    float _2193 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2185);
    float _2195 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2161)
    {
        _2195 = 1.0;
    }
    float _2197 = _2195;
    float _2199 = fma(_2191, -2.0, 3.0);
    float _2201 = _2191 * _2191;
    float _2203 = _2183 * _2171;
    float _2205 = _2203 * 0.5;
    float _2207 = _2197;
    if (!_2161)
    {
        float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2211 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2209);
        float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2217 = 1.0 / _2211;
        float _2219 = 1.0 / _2215;
        float _2221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2225 = fma(_2217, _2221, _2223);
        float _2227 = _2225 * _2219;
        float _2229 = precise::clamp(_2227, 0.0, 1.0);
        _2207 = _2229;
    }
    float _2231 = _2207;
    float _2233 = _2201 * _2199;
    float _2235 = -_2187;
    float _2237 = _2235 + 1.0;
    float _2239 = _2042 * 0.5;
    bool _2241 = _2231 > 0.0;
    bool _2243 = isnan(_2231);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = _2233 * _2231;
    float _2253 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2255 = fma(_2066, -0.5, _2239);
    float _2257 = _2193 + _2042;
    float _2259 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2261 = _2253 * _2096;
    float _2263 = _2064 + _2042;
    float _2265 = -_2253;
    float _2267 = _2265 + 1.0;
    float _2269 = _2259 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2271 = _2107 * _2261;
    float _2273 = _2117 * _2261;
    out.gl_Position.x = _2064;
    out.gl_Position.y = _2066;
    out.gl_Position.z = _2193;
    out.gl_Position.w = _2042;
    float _2275 = fma(_2113, _2271, _2101);
    float _2277 = fma(_2115, _2271, _2103);
    float _2279 = _2257 * 0.5;
    float _2281 = _2263 * 0.5;
    float _2283 = _2107 * _2267;
    float _2285 = fma(_2107, _2273, _2105);
    out.m_47.x = _2269;
    out.m_69.x = _2281;
    out.m_69.y = _2255;
    out.m_69.z = _2279;
    out.m_69.w = _2042;
    out.m_71.x = _2275;
    out.m_71.y = _2277;
    out.m_71.z = _2285;
    out.m_71.w = _2283;
    if (_2249)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2287 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2287;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1718 = false;
    bool _774 = false;
    bool _618 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2344 = as_type<float>(_106);
        out.gl_Position.z = _2344;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _128 = 0.0;
    if (_120)
    {
        float _130 = float(_90);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    float _148 = as_type<float>(_146);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2415 = as_type<float>(_146);
        out.gl_Position.z = _2415;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = _156;
    if (!_166)
    {
        float _170 = _156 * _156;
        float _172 = _170 * 0.5;
        _148 = _172;
    }
    float _174 = _148;
    float _176 = 0.0;
    float _178 = _174;
    if (!_166)
    {
        float _180 = _124 * _124;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    if (!_166)
    {
        float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _186;
    }
    float _188 = _178;
    bool _190 = !_166;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _156 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _156);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _126 = _212;
        _192 = _222;
        _128 = _210;
    }
    float _224 = _126;
    float _226 = _192;
    float _228 = _128;
    bool _230 = !_166;
    float _232 = _224;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _156 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _232 = _248;
        _234 = _242;
        _168 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _168;
    float _262 = _258;
    float _264 = _256;
    if (!_166)
    {
        _262 = _124;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _266;
    if (!_166)
    {
        float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _272;
    }
    float _274 = _264;
    bool _276 = !_166;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _124 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _124);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    bool _312 = !_166;
    if (!_312)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _124 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _270 = _332;
    }
    float _334 = _270;
    float _336 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_260, _152, _268);
    float _340 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_334, _152, _336);
    float _346 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_260, _150, _340);
    float _352 = fma(_334, _150, _342);
    float _354 = -_344;
    float _356 = _338 + _354;
    float _358 = fma(_260, _154, _346);
    float _360 = fma(_334, _154, _348);
    float _362 = -_352;
    float _364 = _350 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_51.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = in.m_44.x;
    float _390 = in.m_44.y;
    float _392 = in.m_44.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _402 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_398);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _414 = fma(_338, _368, _390);
    float _416 = fma(_350, _368, _388);
    float _418 = fma(_358, _368, _392);
    float _420 = _338;
    float _422 = _396;
    float _424 = _412;
    if (_410)
    {
        _420 = _400;
    }
    float _426 = _420;
    float _428 = _426;
    if (!_410)
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
            _422 = _464;
            _424 = _462;
            _428 = _466;
            _468 = true;
        }
        else
        {
            float _470 = _152 * _152;
            float _472 = fma(_150, _150, _470);
            float _474 = fma(_154, _154, _472);
            float _476 = sqrt(_474);
            bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
            bool _480 = isnan(_476);
            bool _482 = _478 || _480;
            bool _484 = isnan(9.9999999747524270787835121154785e-07);
            bool _486 = _482 || _484;
            if (!_486)
            {
                float _488 = _390 * _390;
                float _490 = fma(_388, _388, _488);
                float _492 = fma(_392, _392, _490);
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
                    _422 = _518;
                    _424 = _516;
                    _428 = _520;
                    _468 = true;
                }
                else
                {
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _526 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
                    float _538 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
                    float _540 = _534 * _534;
                    float _542 = fma(_536, _536, _540);
                    float _544 = fma(_538, _538, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _536 * _548;
                    float _552 = _534 * _548;
                    float _554 = _538 * _548;
                    _422 = _552;
                    _424 = _550;
                    _428 = _554;
                    _468 = true;
                }
            }
            else
            {
                float _556 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _558 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _560 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _562 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                float _566 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                float _568 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                float _570 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                float _572 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                float _574 = _568 * _568;
                float _576 = fma(_570, _570, _574);
                float _578 = fma(_572, _572, _576);
                float _580 = rsqrt(_578);
                float _582 = _580 * 9.9999999747524270787835121154785e-07;
                float _584 = _570 * _582;
                float _586 = _568 * _582;
                float _588 = _572 * _582;
                _422 = _586;
                _424 = _584;
                _428 = _588;
            }
        }
    }
    _468 = false;
    float _590 = _422;
    float _592 = _424;
    float _594 = _428;
    bool _596 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _598 = !_596;
    float _616;
    if (!_598)
    {
        float _600 = in.m_53.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_90);
        float _622 = 1.0 / _620;
        float _624 = _124 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _626 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = isnan(_626);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _652 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _654 = isnan(_626);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    bool _668 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = 1.0 / _634;
    float _682 = -_646;
    float _684 = _682 + 1.0;
    float _686 = -_678;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _694 = 1.0 / _650;
    float _696 = _646 * _688;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _700 = _666 * _680;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_700, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _710 = _662 * _684;
    float _712 = -_662;
    float _714 = _712 + 1.0;
    float _716 = _704 * _694;
    float _718 = _708 * _710;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _626 + _720;
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _726 = fma(_716, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = fma(_726, _696, _724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _734 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[117].x, _730);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _740 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _748;
    out.m_55.y = _750;
    out.m_55.z = _706;
    out.m_55.w = _692;
    out.m_57.x = _740;
    out.m_57.y = _744;
    out.m_57.z = _746;
    out.m_57.w = _752;
    bool _754 = !_690;
    float _772;
    if (!_754)
    {
        float _756 = in.m_53.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = in.m_59.y;
    float _786 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _788 = in.m_53.z;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _796 = _794 != 0;
    float _798 = in.m_53.y;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _802 = _800 != 0;
    float _804 = 1.0 / _792;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _808 = _806 != 0;
    float _810 = in.m_53.w;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _818 = _816 != 0;
    float _820 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = in.m_51.x;
    float _824 = in.m_51.y;
    float _826 = in.m_51.z;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _830 = _828 != 0;
    float _832 = 1.0 / _814;
    float _834 = in.m_53.x;
    float _836 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    float _838 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _840 = -_784;
    float _842 = _840 + 1.0;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _846;
    bool _850 = _788 > 0.5;
    float _852 = in.m_59.x;
    float _854 = _848 * _804;
    bool _856 = _798 > 0.5;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _858;
    int _862 = _850 ? as_type<int>(_842) : as_type<int>(_784);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _868 = _856 ? as_type<int>(_842) : as_type<int>(_784);
    float _870 = _802 ? as_type<float>(_862) : _784;
    bool _872 = _810 > 0.5;
    float _874 = _824 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _876 = _808 ? as_type<float>(_868) : _784;
    float _878 = _822 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _886 = _884 != 0;
    float _888 = _826 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _890 = 1.0 / _882;
    float _892 = _784;
    bool _894 = _796;
    float _896 = _798;
    float _898 = _852;
    if (_796)
    {
        float _900 = _872 ? _842 : _784;
        _892 = _900;
    }
    float _902 = _892;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _908 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _912 = _910 != 0;
    float _914 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _920 = 1.0 / _906;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _930 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _914);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = _798 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _936 = _924 * _832;
    float _938 = 1.0 / _918;
    float _940 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _942 = fma(_934, -2.0, _844);
    float _944 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _930);
    float _946 = _590 * _590;
    float _948 = -_932;
    float _950 = fma(_940, 2.0, _948);
    float _952 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _954 = 1.0 / _928;
    float _956 = 0.0;
    if (_912)
    {
        _956 = _834;
    }
    float _958 = _956;
    float _960 = fma(_592, _592, _946);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _970 = _958;
    if (!_912)
    {
        _970 = _788;
    }
    float _972 = _970;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _952 + _974;
    float _978 = fma(_594, _594, _960);
    float _980 = _968 * _938;
    float _982 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _836);
    float _984 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _838);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _990 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = _866 * _954;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _998 = _990 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _992 + _1000;
    float _1004 = rsqrt(_978);
    float _1006 = _860 * _920;
    float _1008 = _998 * _998;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _782 + _1014;
    float _1018 = fma(_976, _976, _1008);
    float _1020 = 1.0 / _988;
    float _1022 = fma(_1002, _1002, _1018);
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1028 = fma(_936, _1016, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1032 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1024);
    float _1034 = rsqrt(_1022);
    float _1036 = _1004 * _594;
    float _1038 = _1004 * _592;
    float _1040 = _1004 * _590;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1046 = _1036 * _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1050 = _1038 * _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1054 = _1040 * _1052;
    float _1056 = _1012 * _1020;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1060 = -_1046;
    float _1062 = fma(_1038, _1058, _1060);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1066 = _782 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1070 = -_1054;
    float _1072 = fma(_1036, _1068, _1070);
    float _1074 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1026);
    float _1076 = _1062 * _1062;
    float _1078 = _1040;
    if (_818)
    {
        bool _1080 = _834 > 0.5;
        _894 = _1080;
    }
    bool _1082 = _894;
    float _1084 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1030);
    float _1086 = _998 * _1034;
    float _1088 = _976 * _1034;
    float _1090 = fma(_1072, _1072, _1076);
    float _1092 = _1002 * _1034;
    float _1094 = -_1086;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1098 = -_1088;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1102 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1042);
    if (!_912)
    {
        _896 = _834;
    }
    float _1104 = _896;
    float _1106 = _1096 * _1096;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1110 = -_1050;
    float _1112 = fma(_1040, _1108, _1110);
    float _1114 = fma(_854, _1066, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1120 = _782 + _1118;
    float _1122 = fma(_1112, _1112, _1090);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1126 = _782 + _1124;
    float _1128 = -_1092;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    float _1132 = fma(_1100, _1100, _1106);
    float _1134 = _964 * _890;
    float _1136 = fma(_1006, _1120, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1140 = fma(_994, _1126, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1142 = fma(_1130, _1130, _1132);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1146 = _782 + _1144;
    float _1148 = in.m_61.x;
    float _1150 = in.m_61.y;
    float _1152 = in.m_61.z;
    float _1154 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _942);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1158 = _782 + _1156;
    float _1160 = fma(_980, _1146, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1162 = sqrt(_1142);
    float _1164 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1166 = fma(_1056, _1158, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1168 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1172 = _782 + _1170;
    float _1174 = fma(_1164, _876, -0.5);
    bool _1176 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1178 = isnan(_782);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _972 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1190 = rsqrt(_1122);
    float _1192 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1194 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1032);
    bool _1196 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1198 = isnan(_782);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1204);
    float _1208 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1210 = fma(_870, _1192, -0.5);
    float _1212 = -_1154;
    float _1214 = fma(_1194, _1174, _1212);
    float _1216 = _1034 * _1162;
    bool _1218 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1220 = isnan(_782);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1232 = _908 * _1216;
    float _1234 = _1168 * _1216;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1150);
    float _1238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1240 = _1072 * _1190;
    float _1242 = _1112 * _1190;
    float _1244 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1148);
    float _1248 = -_1228;
    float _1250 = _1248 + 1.0;
    float _1252 = _1234 * _1236;
    float _1254 = _1244 * _1216;
    float _1256 = _1232 * _1246;
    bool _1258 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1260 = isnan(_782);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1206 * _1250;
    float _1272 = -_1206;
    float _1274 = _1272 + 1.0;
    bool _1276 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1278 = isnan(_782);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = _1062 * _1190;
    float _1290 = -_1268;
    float _1292 = _1290 + 1.0;
    float _1294 = _1268 * _1274;
    bool _1296 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1298 = isnan(_782);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = _1254 * _1238;
    float _1310 = _1286 * _1292;
    float _1312 = -_1286;
    float _1314 = _1312 + 1.0;
    bool _1316 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1318 = isnan(_782);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1252 * _1038;
    bool _1330 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1332 = isnan(_782);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1306 * _1314;
    float _1344 = -_1306;
    float _1346 = _1344 + 1.0;
    float _1348 = _1252 * _1036;
    float _1350 = fma(_1256, _1240, _1328);
    float _1352 = -_1340;
    float _1354 = _1352 + 1.0;
    float _1356 = _1340 * _1346;
    float _1358 = _1040 * _1242;
    float _1360 = _1038 * _1288;
    float _1362 = fma(_1256, _1242, _1348);
    float _1364 = _1326 * _1354;
    float _1366 = -_1358;
    float _1368 = fma(_1036, _1288, _1366);
    float _1370 = -_1360;
    float _1372 = fma(_1040, _1240, _1370);
    float _1374 = -_1326;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1308, _1368, _1350);
    float _1380 = fma(_1308, _1372, _1362);
    float _1382 = _1186 * _1376;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1386 = _952 + _1378;
    float _1388 = _992 + _1380;
    float _1390 = _1114 * _1382;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1386 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1400 = _1388 + _1398;
    float _1402 = -_1384;
    float _1404 = fma(_1188, 2.0, _1402);
    float _1406 = fma(_1208, -2.0, _1392);
    float _1408 = _1396 * _1396;
    float _1410 = _1400 * _1400;
    float _1412 = -_1186;
    float _1414 = _1412 + 1.0;
    int _1416 = as_type<int>(_1392);
    float _1418 = _1172;
    float _1420 = _1104;
    float _1422 = _1408;
    float _1424 = _1410;
    float _1426 = _1386;
    float _1428 = _1388;
    float _1430 = _1140;
    if (_818)
    {
        float _1432 = -_852;
        float _1434 = _1432 + 1.0;
        _1416 = as_type<int>(_1434);
    }
    int _1436 = _1416;
    int _1438 = 0;
    if (_830)
    {
        float _1440 = -_852;
        float _1442 = _1440 + 1.0;
        _1438 = as_type<int>(_1442);
    }
    int _1444 = _1438;
    float _1446 = _1408 + _1410;
    int _1448 = 0;
    if (_886)
    {
        float _1450 = -_852;
        float _1452 = _1450 + 1.0;
        _1448 = as_type<int>(_1452);
    }
    int _1454 = _1448;
    float _1456 = fma(_1134, _1172, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1458 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1390);
    float _1460 = sqrt(_1446);
    if (!_818)
    {
        _1418 = _852;
    }
    float _1462 = _1418;
    float _1464 = _1036 * _1240;
    float _1466 = _1462;
    if (!_830)
    {
        _1420 = _852;
    }
    float _1468 = _1420;
    float _1470 = _1252 * _1040;
    float _1472 = _1468;
    if (_818)
    {
        float _1474 = _1082 ? as_type<float>(_1436) : _852;
        _1466 = _1474;
    }
    float _1476 = _1466;
    float _1478 = fma(_1028, _1364, _1458);
    if (_830)
    {
        float _1480 = _850 ? as_type<float>(_1444) : _852;
        _1472 = _1480;
    }
    float _1482 = _1472;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_886)
    {
        float _1486 = _856 ? as_type<float>(_1454) : _852;
        _898 = _1486;
    }
    float _1488 = _898;
    float _1490 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1074);
    float _1492 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1084);
    float _1494 = -_124;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[76].x, _950);
    float _1498 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1102);
    float _1500 = -_124;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1404);
    float _1504 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1406);
    bool _1506 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = fma(_1256, _1288, _1470);
    float _1510 = -_1464;
    float _1512 = fma(_1038, _1242, _1510);
    float _1514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1516 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1518 = fma(_1136, _1356, _1478);
    float _1520 = fma(_1308, _1512, _1508);
    float _1522 = -_1504;
    float _1524 = fma(_1490, _1210, _1522);
    float _1526 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1528 = fma(_1140, _1342, _1518);
    float _1530 = _990 + _1520;
    float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1534 = _1518;
    if (!_1506)
    {
        _1534 = _1530;
    }
    float _1536 = _1534;
    bool _1538 = !_1506;
    float _1540 = _1536;
    if (!_1538)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1546 = _1460 + _1544;
        float _1548 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = rsqrt(_1446);
        float _1552 = _1546 * _1542;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        float _1560 = _1554 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        float _1564 = fma(_1558, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1566 = _1550 * _1564;
        float _1568 = _1562 + (-1.0);
        float _1570 = fma(_1396, _1566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1572 = fma(_1400, _1566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1574 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1578 = _1570 + _1576;
        float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1582 = _1572 + _1580;
        float _1584 = fma(_1530, _1562, _1574);
        float _1586 = _1578 * _1578;
        float _1588 = _1582 * _1582;
        _1540 = _1584;
        _1422 = _1586;
        _1424 = _1588;
        _1426 = _1570;
        _1428 = _1572;
        _1430 = _1574;
    }
    float _1590 = _1540;
    float _1592 = _1422;
    float _1594 = _1424;
    float _1596 = _1426;
    float _1598 = _1428;
    float _1600 = _1430;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1604 = _1590 + _1602;
    float _1606 = fma(_1456, _1310, _1528);
    float _1608 = fma(_1516, _1476, -0.5);
    float _1610 = fma(_1526, _1488, -0.5);
    float _1612 = fma(_1604, _1604, _1592);
    float _1614 = fma(_1160, _1294, _1606);
    float _1616 = _902 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1620 = _1612 + _1594;
    float _1622 = fma(_1492, _1608, _1496);
    float _1624 = fma(_1498, _1610, _1502);
    float _1626 = fma(_1166, _1270, _1614);
    float _1628 = _1616 * _1532;
    float _1630 = _1618 * _1514;
    float _1632 = sqrt(_1620);
    float _1634 = _1214 + 0.5;
    float _1636 = _1524 + 0.5;
    float _1638 = _1622 + 0.5;
    float _1640 = _1624 + 0.5;
    float _1642 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1626);
    float _1644 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_63.x = _1638;
    out.m_63.y = _1634;
    out.m_63.z = _1630;
    out.m_63.w = _1628;
    float _1646 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1648 = _1038 * _1644;
    float _1650 = _1040 * _1644;
    out.m_65.x = _1640;
    out.m_65.y = _1636;
    float _1652 = _1036 * _1644;
    float _1654 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1656 = fma(_1240, _1646, _1648);
    out.m_67.x = _1642;
    bool _1658 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1660 = isnan(_1632);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1666 = _1662 || _1664;
    float _1668 = fma(_1288, _1646, _1650);
    float _1670 = fma(_1242, _1646, _1652);
    float _1672 = fma(_1368, _1654, _1656);
    float _1674 = fma(_1512, _1654, _1668);
    float _1676 = fma(_1372, _1654, _1670);
    float _1678 = _1646;
    float _1680 = _1600;
    float _1682 = _1652;
    if (!_1666)
    {
        _1678 = 1.0;
    }
    float _1684 = _1678;
    bool _1686 = !_1666;
    float _1688 = _1684;
    if (!_1686)
    {
        bool _1690 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1692 = isnan(_1632);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = _1632 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1706 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1712 = 1.0 / _1706;
            float _1714 = _1702 * _1712;
            float _1716 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1688 = _1716;
            _1718 = true;
        }
        else
        {
            bool _1720 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1722 = isnan(_1632);
            bool _1724 = _1720 || _1722;
            bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1728 = _1724 || _1726;
            if (!_1728)
            {
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1632 + _1730;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1742 = 1.0 / _1736;
                float _1744 = _1732 * _1742;
                float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1688 = _1746;
                _1718 = true;
            }
            else
            {
                _1688 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1718 = false;
    float _1748 = _1688;
    float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1752 = _1590 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1756 = _1596 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1760 = _1598 + _1758;
    float _1762 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1764 = fma(_1756, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1766 = fma(_1760, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1768 = -_1086;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _1772 = -_1088;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    float _1776 = -_1092;
    float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1770 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1786 = _1774 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1790 = _1778 + _1788;
    float _1792 = _1782 * _1782;
    float _1794 = fma(_1786, _1786, _1792);
    float _1796 = fma(_1790, _1790, _1794);
    float _1798 = rsqrt(_1796);
    float _1800 = _1786 * _1798;
    float _1802 = _1790 * _1798;
    float _1804 = _1782 * _1798;
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1810 = _1806 * _1806;
    float _1812 = _1808 * _1808;
    float _1814 = _1810 + _1812;
    float _1816 = sqrt(_1814);
    bool _1818 = _1816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1822 = _1816 + _1820;
    float _1824 = _1630;
    float _1826 = _1814;
    float _1828 = _1822;
    if (_1818)
    {
        float _1830 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1830;
    }
    float _1832 = _1824;
    if (_1818)
    {
        float _1834 = rsqrt(_1814);
        _1826 = _1834;
    }
    float _1836 = _1826;
    float _1838 = _1836;
    if (_1818)
    {
        float _1840 = _1822 * _1832;
        _1828 = _1840;
    }
    float _1842 = _1828;
    if (_1818)
    {
        float _1844 = _1842 * 0.15915493667125701904296875;
        _1078 = _1844;
    }
    float _1846 = _1078;
    float _1848 = _1832;
    if (_1818)
    {
        float _1850 = _1846 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        _1848 = _1852;
    }
    float _1854 = _1848;
    float _1856 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1858 = precise::max(0.0, _1856);
    float _1860 = _1628;
    float _1862 = _1856;
    float _1864 = _1858;
    if (_1818)
    {
        float _1866 = _1846 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        _1860 = _1868;
    }
    float _1870 = _1860;
    float _1872 = -_1804;
    float _1874 = -_1858;
    float _1876 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1874);
    if (_1818)
    {
        float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1862 = _1878;
    }
    float _1880 = _1862;
    float _1882 = sqrt(_1796);
    float _1884 = _1880;
    float _1886 = _1854;
    if (_1818)
    {
        float _1888 = fma(_1854, _1880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = _1890;
    if (!_1818)
    {
        _1886 = _1806;
    }
    float _1894 = _1886;
    float _1896 = _1894;
    float _1898 = _1870;
    if (_1818)
    {
        float _1900 = _1870 + (-1.0);
        _1864 = _1900;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1818)
    {
        float _1906 = _1836 * _1890;
        _1680 = _1906;
    }
    float _1908 = _1680;
    if (!_1818)
    {
        _1892 = _1876;
    }
    float _1910 = _1892;
    float _1912 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1914 = _1910;
    if (_1818)
    {
        float _1916 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1682 = _1916;
    }
    float _1918 = _1682;
    if (_1818)
    {
        float _1920 = _1806 * _1908;
        _1896 = _1920;
    }
    float _1922 = _1896;
    if (!_1818)
    {
        _1904 = _1808;
    }
    float _1924 = _1904;
    float _1926 = _1924;
    if (_1818)
    {
        float _1928 = _1808 * _1908;
        _1926 = _1928;
    }
    float _1930 = _1926;
    if (!_1818)
    {
        _1838 = _1810;
    }
    float _1932 = _1838;
    float _1934 = _1932;
    if (_1818)
    {
        float _1936 = fma(_1876, _1870, _1918);
        _1914 = _1936;
    }
    float _1938 = _1914;
    if (_1818)
    {
        float _1940 = _1922 * _1922;
        _1934 = _1940;
    }
    float _1942 = _1934;
    if (!_1818)
    {
        _1898 = _1812;
    }
    float _1944 = _1898;
    float _1946 = _1944;
    if (_1818)
    {
        float _1948 = _1930 * _1930;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = fma(_1938, _1938, _1942);
    float _1954 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1956 = _1952 + _1950;
    float _1958 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1962 = fma(_1882, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1960);
    float _1964 = precise::clamp(_1962, 0.0, 1.0);
    float _1966 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1968 = rsqrt(_1956);
    float _1970 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1958);
    float _1972 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1974 = -_1964;
    float _1976 = _1974 + 1.0;
    float _1978 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1970);
    float _1980 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1954);
    float _1982 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1972);
    float _1984 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1912);
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1980);
    float _1990 = abs(_1976);
    float _1992 = log2(_1990);
    float _1994 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1982);
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2000 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2002 = _1968 * _1922;
    float _2004 = _1968 * _1938;
    float _2006 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2008 = -_1996;
    float _2010 = fma(_2008, _1966, 1.0);
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2014 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2016 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2018 = _1968 * _1930;
    float _2020 = -_2012;
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2020);
    float _2024 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2014);
    float _2026 = log2(_2010);
    float _2028 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = -_2018;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2022);
    float _2034 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2024);
    float _2036 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2038 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2034);
    float _2044 = exp2(_2028);
    float _2046 = fma(_2032, 0.5, 0.5);
    float _2048 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2036);
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = _2004 + 1.0;
    float _2054 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2056 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2048);
    float _2058 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2060 = 1.0 / _2042;
    float _2062 = fma(_2046, _2054, -0.212114393711090087890625);
    float _2064 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2066 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2058);
    float _2068 = _2026 * 0.693147182464599609375;
    float _2070 = fma(_2046, _2062, 1.570728778839111328125);
    float _2072 = sqrt(_2040);
    float _2074 = -_2004;
    float _2076 = fma(_2044, _2052, _2074);
    float _2078 = _2064 * _2060;
    float _2080 = _2066 * _2060;
    float _2082 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2076, 0.5, 0.5);
    float _2086 = fma(_2078, 0.5, 0.5);
    float _2088 = fma(_2080, -0.5, 0.5);
    float _2090 = _2072 * 0.636619746685028076171875;
    float _2092 = -_2070;
    float _2094 = fma(_2090, _2092, 1.0);
    float3 _5659 = float3(_2086, _2088, _2082);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5659, float3(0.0), isnan(_5659)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5659, float3(0.0), isnan(_5659)), level(0.0)).x;
    float3 _5670 = float3(_2086, _2088, _2082);
    float4 _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5670, float3(0.0), isnan(_5670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5670, float3(0.0), isnan(_5670)), level(0.0)).xyzw;
    float _2101 = _2099.x;
    float _2103 = _2099.y;
    float _2105 = _2099.z;
    float _2107 = _2099.w;
    float2 _5687 = float2(_2094, _2084);
    float3 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5687, float2(0.0), isnan(_5687)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5687, float2(0.0), isnan(_5687)), level(0.0)).xyz;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = -_1086;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _2123 = -_1088;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _2127 = -_1092;
    float _2129 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _992);
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2135;
    float _2139 = _1674 * _1804;
    float _2141 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2131);
    float _2143 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2133);
    float _2145 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2147 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2141);
    float _2149 = 1.0 / _2137;
    float _2151 = fma(_1672, _1800, _2139);
    bool _2153 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2155 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(0.5);
    bool _2161 = _2157 || _2159;
    float _2163 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2165 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2143);
    float _2167 = fma(_1676, _1802, _2151);
    float _2169 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2171 = 1.0 / _2163;
    float _2173 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2175 = abs(_2167);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2179 = _2175 + _2177;
    float _2181 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2169);
    float _2183 = _2173 + _2163;
    float _2185 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2181);
    float _2187 = exp2(_2145);
    float _2189 = _2179 * _2149;
    float _2191 = precise::clamp(_2189, 0.0, 1.0);
    float _2193 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2185);
    float _2195 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2161)
    {
        _2195 = 1.0;
    }
    float _2197 = _2195;
    float _2199 = fma(_2191, -2.0, 3.0);
    float _2201 = _2191 * _2191;
    float _2203 = _2183 * _2171;
    float _2205 = _2203 * 0.5;
    float _2207 = _2197;
    if (!_2161)
    {
        float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2211 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2209);
        float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2217 = 1.0 / _2211;
        float _2219 = 1.0 / _2215;
        float _2221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2225 = fma(_2217, _2221, _2223);
        float _2227 = _2225 * _2219;
        float _2229 = precise::clamp(_2227, 0.0, 1.0);
        _2207 = _2229;
    }
    float _2231 = _2207;
    float _2233 = _2201 * _2199;
    float _2235 = -_2187;
    float _2237 = _2235 + 1.0;
    float _2239 = _2042 * 0.5;
    bool _2241 = _2231 > 0.0;
    bool _2243 = isnan(_2231);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = _2233 * _2231;
    float _2253 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2255 = fma(_2066, -0.5, _2239);
    float _2257 = _2193 + _2042;
    float _2259 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2261 = _2253 * _2096;
    float _2263 = _2064 + _2042;
    float _2265 = -_2253;
    float _2267 = _2265 + 1.0;
    float _2269 = _2259 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2271 = _2107 * _2261;
    float _2273 = _2117 * _2261;
    out.gl_Position.x = _2064;
    out.gl_Position.y = _2066;
    out.gl_Position.z = _2193;
    out.gl_Position.w = _2042;
    float _2275 = fma(_2113, _2271, _2101);
    float _2277 = fma(_2115, _2271, _2103);
    float _2279 = _2257 * 0.5;
    float _2281 = _2263 * 0.5;
    float _2283 = _2107 * _2267;
    float _2285 = fma(_2107, _2273, _2105);
    out.m_47.x = _2269;
    out.m_69.x = _2281;
    out.m_69.y = _2255;
    out.m_69.z = _2279;
    out.m_69.w = _2042;
    out.m_71.x = _2275;
    out.m_71.y = _2277;
    out.m_71.z = _2285;
    out.m_71.w = _2283;
    if (_2249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2287 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2287;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

