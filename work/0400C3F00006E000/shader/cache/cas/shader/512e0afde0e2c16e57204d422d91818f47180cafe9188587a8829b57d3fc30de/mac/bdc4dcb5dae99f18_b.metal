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
    float4 m_61 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1388 = false;
    bool _616 = false;
    bool _466 = false;
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
        float _2112 = as_type<float>(_106);
        out.gl_Position.z = _2112;
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
        float _2183 = as_type<float>(_146);
        out.gl_Position.z = _2183;
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
    float _338 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = fma(_260, _152, _268);
    float _342 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_334, _152, _336);
    float _346 = fma(_260, _150, _338);
    float _348 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_334, _150, _342);
    float _352 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = -_344;
    float _356 = _340 + _354;
    float _358 = fma(_334, _154, _348);
    float _360 = -_350;
    float _362 = _346 + _360;
    float _364 = fma(_260, _154, _352);
    float _366 = _356 * _356;
    float _368 = in.m_51.w;
    float _370 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = -_358;
    float _374 = _364 + _372;
    float _376 = fma(_362, _362, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _384 = fma(_374, _374, _376);
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = in.m_44.x;
    float _390 = in.m_44.y;
    float _392 = in.m_44.z;
    float _394 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_346, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_364, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    float _426 = _418;
    if (!_412)
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
            _420 = _462;
            _422 = _460;
            _424 = _464;
            _466 = true;
        }
        else
        {
            float _468 = _152 * _152;
            float _470 = fma(_150, _150, _468);
            float _472 = fma(_154, _154, _470);
            float _474 = sqrt(_472);
            bool _476 = _474 >= 9.9999999747524270787835121154785e-07;
            bool _478 = isnan(_474);
            bool _480 = _476 || _478;
            bool _482 = isnan(9.9999999747524270787835121154785e-07);
            bool _484 = _480 || _482;
            if (!_484)
            {
                float _486 = _390 * _390;
                float _488 = fma(_388, _388, _486);
                float _490 = fma(_392, _392, _488);
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
                    _420 = _516;
                    _422 = _514;
                    _424 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _420 = _550;
                    _422 = _548;
                    _424 = _552;
                    _466 = true;
                }
            }
            else
            {
                float _554 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _556 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _558 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _560 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
                float _562 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
                float _566 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
                float _568 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
                float _570 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
                float _572 = _566 * _566;
                float _574 = fma(_568, _568, _572);
                float _576 = fma(_570, _570, _574);
                float _578 = rsqrt(_576);
                float _580 = _578 * 9.9999999747524270787835121154785e-07;
                float _582 = _568 * _580;
                float _584 = _566 * _580;
                float _586 = _570 * _580;
                _420 = _584;
                _422 = _582;
                _424 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _420;
    float _590 = _422;
    float _592 = _424;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _596 = !_594;
    float _614;
    if (!_596)
    {
        float _598 = in.m_53.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_90);
        float _620 = 1.0 / _618;
        float _622 = _124 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _632 = _624 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _652 = _624 + _650;
    float _654 = 1.0 / _636;
    bool _656 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _658 = isnan(_624);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _640;
    float _670 = _628 * _654;
    float _672 = _588 * _588;
    float _674 = 1.0 / _644;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _678 = _624 + _676;
    float _680 = fma(_590, _590, _672);
    float _682 = _632 * _668;
    float _684 = fma(_592, _592, _680);
    float _686 = 1.0 / _648;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _696;
    float _700 = fma(_698, _670, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _702 = rsqrt(_684);
    float _704 = _652 * _674;
    float _706 = fma(_690, _670, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _708 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _710 = isnan(_624);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = fma(_694, _670, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _730 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _732 = isnan(_624);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _678 * _686;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _748 = -_718;
    float _750 = _748 + 1.0;
    float _752 = fma(_724, _682, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_728, _682, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_746, _682, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _758 = _666 * _750;
    float _760 = -_666;
    float _762 = _760 + 1.0;
    float _764 = _702 * _590;
    float _766 = _702 * _588;
    float _768 = _702 * _592;
    bool _770 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _772 = isnan(_624);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -_740;
    float _784 = _782 + 1.0;
    bool _786 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _788 = isnan(_624);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _766 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _800 = _740 * _762;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _802;
    float _806 = -_796;
    float _808 = _806 + 1.0;
    float _810 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[8].y, _798);
    float _812 = _796 * _784;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _818;
    float _822 = _780 * _808;
    float _824 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[10].y, _810);
    float _826 = fma(_816, _704, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _828 = fma(_804, _704, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _830 = fma(_820, _704, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _832 = _720 * _822;
    float _834 = _706 * _822;
    float _836 = _700 * _822;
    float _838 = abs(_824);
    bool _840 = _838 > 0.99989998340606689453125;
    float _842 = -_780;
    float _844 = _842 + 1.0;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].x, _832);
    float _860 = fma(_848, _742, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _862 = fma(_852, _742, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _864 = fma(_856, _742, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _866 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].y, _834);
    float _868 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].z, _836);
    float _870 = fma(_752, _812, _858);
    float _872 = fma(_756, _812, _866);
    float _874 = fma(_754, _812, _868);
    float _876 = _752;
    float _878 = _856;
    float _880 = _754;
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_840)
    {
        _876 = 0.001000000047497451305389404296875;
    }
    float _884 = _876;
    float _886 = in.m_51.x;
    float _888 = in.m_51.y;
    float _890 = in.m_51.z;
    float _892 = fma(_826, _800, _870);
    if (!_840)
    {
        _878 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _894 = _878;
    float _896 = _894;
    if (_840)
    {
        float _898 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _896 = _898;
    }
    float _900 = _896;
    if (!_840)
    {
        _880 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _902 = _880;
    float _904 = _902;
    if (_840)
    {
        float _906 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _904 = _906;
    }
    float _908 = _904;
    float _910 = -_900;
    float _912 = _768 * _910;
    if (!_840)
    {
        _882 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _914 = _882;
    float _916 = fma(_828, _800, _872);
    float _918 = fma(_830, _800, _874);
    float _920 = _914;
    if (_840)
    {
        float _922 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _920 = _922;
    }
    float _924 = _920;
    float _926 = -_908;
    float _928 = _766 * _926;
    float _930 = -_908;
    float _932 = -_912;
    float _934 = fma(_764, _930, _932);
    float _936 = in.m_55.x;
    float _938 = in.m_55.y;
    float _940 = in.m_55.z;
    float _942 = fma(_860, _758, _892);
    float _944 = -_924;
    float _946 = _764 * _944;
    float _948 = -_924;
    float _950 = -_928;
    float _952 = fma(_768, _948, _950);
    float _954 = _934 * _934;
    float _956 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].x, _942);
    float _958 = -_900;
    float _960 = -_946;
    float _962 = fma(_766, _958, _960);
    float _964 = fma(_862, _758, _916);
    float _966 = fma(_952, _952, _954);
    float _968 = _956 * _886;
    float _970 = fma(_864, _758, _918);
    float _972 = fma(_962, _962, _966);
    float _974 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].y, _964);
    float _976 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].z, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = rsqrt(_972);
    float _982 = _974 * _888;
    float _984 = _976 * _890;
    float _986 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _936);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _940);
    float _996 = _978 * _990;
    float _998 = _984 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1000 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1002 = _988 * _992;
    float _1004 = _934 * _980;
    float _1006 = _962 * _980;
    float _1008 = _998 * _994;
    float _1010 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1000);
    float _1012 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _1014 = _952 * _980;
    float _1016 = _1002 * _768;
    float _1018 = _764 * _1004;
    float _1020 = _1002 * _764;
    float _1022 = _766 * _1006;
    float _1024 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1026 = fma(_996, _1006, _1016);
    float _1028 = -_1018;
    float _1030 = fma(_766, _1014, _1028);
    float _1032 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1010);
    float _1034 = fma(_996, _1014, _1020);
    float _1036 = -_1022;
    float _1038 = fma(_768, _1004, _1036);
    float _1040 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = fma(_1008, _1030, _1026);
    float _1044 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = fma(_1008, _1038, _1034);
    float _1048 = in.m_53.y;
    float _1050 = _1040 + _1042;
    float _1052 = _1044 + _1046;
    float _1054 = in.m_57.y;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1058 = _1050 + _1056;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1062 = _1060 != 0;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1052 + _1064;
    float _1068 = in.m_57.x;
    float _1070 = _1058 * _1058;
    float _1072 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1074 = _1066 * _1066;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1078 = _1076 != 0;
    float _1080 = _1002 * _766;
    float _1082 = _768 * _1014;
    float _1084 = _1074 + _1070;
    float _1086 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1072);
    float _1088 = fma(_996, _1004, _1080);
    float _1090 = -_1082;
    float _1092 = fma(_764, _1006, _1090);
    float _1094 = sqrt(_1084);
    float _1096 = _980;
    float _1098 = _996;
    float _1100 = _1050;
    float _1102 = _1052;
    float _1104 = _936;
    float _1106 = _1006;
    if (_1062)
    {
        float _1108 = in.m_53.x;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1114 = fma(_1008, _1092, _1088);
    bool _1116 = _1048 > 0.5;
    float _1118 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1122 = -_1054;
    float _1124 = _1122 + 1.0;
    float _1126 = _1054;
    float _1128 = _1124;
    if (_1062)
    {
        _1098 = _1068;
    }
    float _1130 = _1098;
    float _1132 = _1130;
    if (_1078)
    {
        float _1134 = _1116 ? _1124 : _1054;
        _1126 = _1134;
    }
    float _1136 = _1126;
    bool _1138 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1140 = _1110 > 0.5;
    bool _1142 = _1140 && _1062;
    float _1144 = _1118 + _1114;
    float _1146 = _1144;
    if (!_1138)
    {
        _426 = _1070;
    }
    float _1148 = _426;
    float _1150 = _1148;
    if (!_1138)
    {
        _1128 = _1074;
    }
    float _1152 = _1128;
    float _1154 = 0.0;
    float _1156 = _1152;
    if (!_1138)
    {
        _1154 = _1144;
    }
    float _1158 = _1154;
    bool _1160 = !_1138;
    float _1162 = _1158;
    if (!_1160)
    {
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1168 = _1094 + _1166;
        float _1170 = rsqrt(_1084);
        float _1172 = _1168 * _1164;
        float _1174 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = _1172 * 0.15915493667125701904296875;
        float _1178 = _1176 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = _1176 * 6.283185482025146484375;
        float _1184 = cos(_1182);
        float _1186 = fma(_1180, _1174, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1188 = _1170 * _1186;
        float _1190 = _1184 + (-1.0);
        float _1192 = fma(_1066, _1188, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1194 = fma(_1058, _1188, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1196 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1200 = _1192 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1204 = _1194 + _1202;
        float _1206 = fma(_1144, _1184, _1196);
        float _1208 = _1200 * _1200;
        float _1210 = _1204 * _1204;
        _1162 = _1206;
        _1156 = _1208;
        _1150 = _1210;
        _1100 = _1194;
        _1102 = _1192;
    }
    float _1212 = _1162;
    float _1214 = _1156;
    float _1216 = _1150;
    float _1218 = _1100;
    float _1220 = _1102;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1224 = _1212 + _1222;
    if (_1142)
    {
        float _1226 = -_1130;
        float _1228 = _1226 + 1.0;
        _1132 = _1228;
    }
    float _1230 = _1132;
    float _1232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1234 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1236 = fma(_1224, _1224, _1214);
    if (!_1062)
    {
        _1146 = _1068;
    }
    float _1238 = _1146;
    float _1240 = _1238;
    if (_1062)
    {
        _1240 = _1230;
    }
    float _1242 = _1240;
    float _1244 = _1236 + _1216;
    float _1246 = in.m_59.x;
    float _1248 = in.m_59.y;
    float _1250 = in.m_59.z;
    float _1252 = _1234 * _1120;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1258 = sqrt(_1244);
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1262 = _938 != 0.0;
    bool _1264 = isnan(_938);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(0.0);
    bool _1270 = _1266 || _1268;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1276 = _936 == 0.0;
    bool _1278 = !_1270;
    bool _1280 = _1276 && _1278;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1284 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1286 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1288 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1290 = _940 == 0.0;
    bool _1292 = _1290 && _1280;
    float _1294 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1298 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1284 * _1232;
    out.m_61.x = _1286;
    out.m_61.y = _1288;
    out.m_61.z = _1294;
    bool _1306 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1308 = isnan(_1258);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1314 = _1310 || _1312;
    float _1316 = _1248;
    float _1318 = _1246;
    float _1320 = _1250;
    float _1322 = _1300;
    if (!_1292)
    {
        float _1324 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1316 = _1324;
    }
    float _1326 = _1316;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    if (!_1292)
    {
        float _1328 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1318 = _1328;
    }
    float _1330 = _1318;
    if (!_1292)
    {
        float _1332 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1320 = _1332;
    }
    float _1334 = _1320;
    float _1336 = _764 * _1326;
    out.m_65.x = _1298;
    out.m_65.y = _1300;
    out.m_65.z = _1302;
    out.m_65.w = _1296;
    float _1338 = _766 * _1326;
    float _1340 = _768 * _1326;
    float _1342 = fma(_1014, _1330, _1336);
    out.m_67.x = _1304;
    out.m_67.y = _1252;
    float _1344 = fma(_1004, _1330, _1338);
    float _1346 = fma(_1006, _1330, _1340);
    float _1348 = fma(_1038, _1334, _1342);
    if (!_1314)
    {
        _1104 = 1.0;
    }
    float _1350 = _1104;
    float _1352 = fma(_1092, _1334, _1344);
    float _1354 = fma(_1030, _1334, _1346);
    bool _1356 = !_1314;
    float _1358 = _1350;
    if (!_1356)
    {
        bool _1360 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1362 = isnan(_1258);
        bool _1364 = _1360 || _1362;
        bool _1366 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1368 = _1364 || _1366;
        if (!_1368)
        {
            float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1372 = _1258 + _1370;
            float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1376 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1374;
            float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1382 = 1.0 / _1376;
            float _1384 = _1372 * _1382;
            float _1386 = fma(_1384, _1380, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1358 = _1386;
            _1388 = true;
        }
        else
        {
            bool _1390 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1392 = isnan(_1258);
            bool _1394 = _1390 || _1392;
            bool _1396 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1398 = _1394 || _1396;
            if (!_1398)
            {
                float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1402 = _1258 + _1400;
                float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1406 = _1404 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1408 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1410 = _1408 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1412 = 1.0 / _1406;
                float _1414 = _1402 * _1412;
                float _1416 = fma(_1414, _1410, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1358 = _1416;
                _1388 = true;
            }
            else
            {
                _1358 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1388 = false;
    float _1418 = _1358;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1422 = _1212 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1218 + _1424;
    bool _1428 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.5);
    bool _1436 = _1432 || _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1440 = _1220 + _1438;
    float _1442 = fma(_1422, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1444 = fma(_1426, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = fma(_1440, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = _1440;
    float _1450 = _1422;
    float _1452 = _1418;
    float _1454 = _1446;
    float _1456 = _1444;
    if (_1436)
    {
        _1448 = _1446;
    }
    float _1458 = _1448;
    float _1460 = _1458;
    if (_1436)
    {
        _1450 = _1442;
    }
    float _1462 = _1450;
    float _1464 = _1462;
    if (_1436)
    {
        _1452 = _1444;
    }
    float _1466 = _1452;
    float _1468 = _1466;
    if (!_1436)
    {
        float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1472 = _1118 + _1470;
        float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1476 = _1044 + _1474;
        float _1478 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1480 = _1472 * _1472;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1484 = _1040 + _1482;
        float _1486 = fma(_1476, _1476, _1480);
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1490 = fma(_1484, _1484, _1486);
        float _1492 = sqrt(_1490);
        float _1494 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1496 = precise::min(_1492, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1498 = _1496 * _1488;
        float _1500 = -_1044;
        float _1502 = _1500 + _1446;
        float _1504 = -_1040;
        float _1506 = _1504 + _1444;
        float _1508 = _1494 * _1498;
        float _1510 = -_1118;
        float _1512 = _1510 + _1442;
        float _1514 = fma(_1502, _1508, _1044);
        float _1516 = fma(_1512, _1508, _1118);
        float _1518 = fma(_1506, _1508, _1040);
        _1464 = _1516;
        _1460 = _1514;
        _1468 = _1518;
        _1454 = _1506;
    }
    float _1520 = _1464;
    float _1522 = _1460;
    float _1524 = _1468;
    float _1526 = _1454;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1520 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1522 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1524 + _1536;
    float _1540 = _1530 * _1530;
    float _1542 = fma(_1534, _1534, _1540);
    float _1544 = fma(_1538, _1538, _1542);
    float _1546 = rsqrt(_1544);
    float _1548 = _1534 * _1546;
    float _1550 = _1538 * _1546;
    float _1552 = _1530 * _1546;
    float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1326;
    float _1574 = _1570;
    float _1576 = _1554;
    if (_1566)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1578;
    }
    float _1580 = _1572;
    if (_1566)
    {
        float _1582 = rsqrt(_1562);
        _1456 = _1582;
    }
    float _1584 = _1456;
    float _1586 = _1584;
    if (_1566)
    {
        float _1588 = _1570 * _1580;
        _1574 = _1588;
    }
    float _1590 = _1574;
    if (_1566)
    {
        float _1592 = _1590 * 0.15915493667125701904296875;
        _1322 = _1592;
    }
    float _1594 = _1322;
    float _1596 = _1526;
    if (_1566)
    {
        float _1598 = _1594 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1606 = precise::max(0.0, _1604);
    float _1608 = _1580;
    float _1610 = _1606;
    float _1612 = _1604;
    if (_1566)
    {
        float _1614 = _1594 * 6.283185482025146484375;
        float _1616 = cos(_1614);
        _1608 = _1616;
    }
    float _1618 = _1608;
    float _1620 = -_1552;
    float _1622 = -_1606;
    float _1624 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1622);
    if (_1566)
    {
        float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1610 = _1626;
    }
    float _1628 = _1610;
    float _1630 = sqrt(_1544);
    float _1632 = _1628;
    float _1634 = _1602;
    if (_1566)
    {
        float _1636 = fma(_1602, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (!_1566)
    {
        _1634 = _1558;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    float _1646 = _1618;
    if (_1566)
    {
        float _1648 = _1618 + (-1.0);
        _1612 = _1648;
    }
    float _1650 = _1612;
    float _1652 = _1650;
    if (_1566)
    {
        float _1654 = _1584 * _1638;
        _1106 = _1654;
    }
    float _1656 = _1106;
    if (!_1566)
    {
        _1640 = _1624;
    }
    float _1658 = _1640;
    float _1660 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = _1658;
    if (_1566)
    {
        float _1664 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1664;
    }
    float _1666 = _1586;
    if (_1566)
    {
        float _1668 = _1554 * _1656;
        _1576 = _1668;
    }
    float _1670 = _1576;
    if (!_1566)
    {
        _1652 = _1556;
    }
    float _1672 = _1652;
    float _1674 = _1672;
    if (_1566)
    {
        float _1676 = _1556 * _1656;
        _1674 = _1676;
    }
    float _1678 = _1674;
    if (_1566)
    {
        float _1680 = fma(_1624, _1618, _1666);
        _1662 = _1680;
    }
    float _1682 = _1662;
    if (_1566)
    {
        float _1684 = _1670 * _1670;
        _1644 = _1684;
    }
    float _1686 = _1644;
    if (!_1566)
    {
        _1646 = _1560;
    }
    float _1688 = _1646;
    float _1690 = _1688;
    if (_1566)
    {
        float _1692 = _1678 * _1678;
        _1690 = _1692;
    }
    float _1694 = _1690;
    float _1696 = fma(_1682, _1682, _1686);
    float _1698 = _1696 + _1694;
    float _1700 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1704 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1702);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1710 = rsqrt(_1698);
    float _1712 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1700);
    float _1714 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1716 = -_1706;
    float _1718 = _1716 + 1.0;
    float _1720 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1722 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1712);
    float _1724 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1714);
    float _1726 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1720);
    float _1728 = abs(_1718);
    float _1730 = log2(_1728);
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1724);
    float _1736 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1738 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1744 = _1710 * _1670;
    float _1746 = _1710 * _1682;
    float _1748 = -_1740;
    float _1750 = fma(_1748, _1708, 1.0);
    float _1752 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1736);
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1756 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1710 * _1678;
    float _1762 = -_1754;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1768 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1770 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = -_1760;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1776 = log2(_1750);
    float _1778 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1768);
    float _1780 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1786 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    float _1788 = fma(_1774, 0.5, 0.5);
    float _1790 = exp2(_1770);
    float _1792 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1794 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1784);
    float _1796 = _1746 + 1.0;
    float _1798 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1800 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1794);
    float _1802 = 1.0 / _1786;
    float _1804 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = _1776 * 0.693147182464599609375;
    float _1808 = fma(_1788, _1804, -0.212114393711090087890625);
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = sqrt(_1782);
    float _1814 = -_1746;
    float _1816 = fma(_1790, _1796, _1814);
    float _1818 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1820 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1822 = fma(_1788, _1808, 1.570728778839111328125);
    float _1824 = fma(_1816, 0.5, 0.5);
    float _1826 = _1818 * _1802;
    float _1828 = _1820 * _1802;
    float _1830 = fma(_1826, 0.5, 0.5);
    float _1832 = fma(_1828, -0.5, 0.5);
    float _1834 = _1812 * 0.636619746685028076171875;
    float _1836 = -_1822;
    float _1838 = fma(_1834, _1836, 1.0);
    float3 _4995 = float3(_1830, _1832, _1810);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4995, float3(0.0), isnan(_4995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4995, float3(0.0), isnan(_4995)), level(0.0)).x;
    float3 _5006 = float3(_1830, _1832, _1810);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5006, float3(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5006, float3(0.0), isnan(_5006)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float2 _5023 = float2(_1838, _1824);
    float3 _1855 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5023, float2(0.0), isnan(_5023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5023, float2(0.0), isnan(_5023)), level(0.0)).xyz;
    float _1857 = _1855.x;
    float _1859 = _1855.y;
    float _1861 = _1855.z;
    float _1863 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1865 = _1352 * _1552;
    float _1867 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1863);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1871;
    float _1875 = fma(_1348, _1548, _1865);
    float _1877 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1869);
    float _1879 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1881 = fma(_1354, _1550, _1875);
    float _1883 = 1.0 / _1873;
    float _1885 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1879);
    float _1887 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1889 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    float _1899 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    float _1901 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1885);
    float _1903 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1905 = abs(_1881);
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1909 = _1905 + _1907;
    float _1911 = 1.0 / _1887;
    float _1913 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1915 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    float _1917 = _1913 + _1887;
    float _1919 = exp2(_1903);
    float _1921 = _1909 * _1883;
    float _1923 = precise::clamp(_1921, 0.0, 1.0);
    float _1925 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1927 = fma(_1923, -2.0, 3.0);
    float _1929 = _1923 * _1923;
    float _1931 = _1923;
    if (_1897)
    {
        _1931 = 1.0;
    }
    float _1933 = _1931;
    float _1935 = _1917 * _1911;
    float _1937 = _1935 * 0.5;
    float _1939 = _1933;
    if (!_1897)
    {
        float _1941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1943);
        float _1947 = _1941 * 0.15915493667125701904296875;
        float _1949 = _1947 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1955 = _1953 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1951;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = 1.0 / _1945;
        float _1971 = _1965 * _1967;
        float _1973 = _1955 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1983 = _1969 * _1981;
        float _1985 = 1.0 / _1971;
        float _1987 = 1.0 / _1979;
        float _1989 = _1975 * _1985;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1993 = fma(_1989, _1983, _1991);
        float _1995 = _1993 * _1987;
        float _1997 = precise::clamp(_1995, 0.0, 1.0);
        _1939 = _1997;
    }
    float _1999 = _1939;
    float _2001 = -_1919;
    float _2003 = _2001 + 1.0;
    float _2005 = _1929 * _1927;
    float _2007 = _1786 * 0.5;
    bool _2009 = _1999 > 0.0;
    bool _2011 = isnan(_1999);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(0.0);
    bool _2017 = _2013 || _2015;
    float _2019 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2021 = _2005 * _1999;
    float _2023 = fma(_1820, -0.5, _2007);
    float _2025 = _1925 + _1786;
    float _2027 = _2019 * _1840;
    float _2029 = -_2019;
    float _2031 = _2029 + 1.0;
    float _2033 = _1818 + _1786;
    float _2035 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _1851 * _2027;
    float _2039 = _1861 * _2027;
    out.gl_Position.x = _1818;
    out.gl_Position.y = _1820;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1786;
    float _2041 = fma(_1857, _2037, _1845);
    float _2043 = fma(_1859, _2037, _1847);
    float _2045 = _1851 * _2031;
    float _2047 = _2025 * 0.5;
    float _2049 = _2033 * 0.5;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2053 = fma(_1851, _2039, _1849);
    out.m_69.x = _2049;
    out.m_69.y = _2023;
    out.m_69.z = _2047;
    out.m_69.w = _1786;
    out.m_47.x = _2051;
    out.m_71.x = _2041;
    out.m_71.y = _2043;
    out.m_71.z = _2053;
    out.m_71.w = _2045;
    if (_2017)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2055;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1388 = false;
    bool _616 = false;
    bool _466 = false;
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
        float _2112 = as_type<float>(_106);
        out.gl_Position.z = _2112;
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
        float _2183 = as_type<float>(_146);
        out.gl_Position.z = _2183;
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
    float _338 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = fma(_260, _152, _268);
    float _342 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_334, _152, _336);
    float _346 = fma(_260, _150, _338);
    float _348 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_334, _150, _342);
    float _352 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = -_344;
    float _356 = _340 + _354;
    float _358 = fma(_334, _154, _348);
    float _360 = -_350;
    float _362 = _346 + _360;
    float _364 = fma(_260, _154, _352);
    float _366 = _356 * _356;
    float _368 = in.m_51.w;
    float _370 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = -_358;
    float _374 = _364 + _372;
    float _376 = fma(_362, _362, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _384 = fma(_374, _374, _376);
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = in.m_44.x;
    float _390 = in.m_44.y;
    float _392 = in.m_44.z;
    float _394 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_346, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_364, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    float _426 = _418;
    if (!_412)
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
            _420 = _462;
            _422 = _460;
            _424 = _464;
            _466 = true;
        }
        else
        {
            float _468 = _152 * _152;
            float _470 = fma(_150, _150, _468);
            float _472 = fma(_154, _154, _470);
            float _474 = sqrt(_472);
            bool _476 = _474 >= 9.9999999747524270787835121154785e-07;
            bool _478 = isnan(_474);
            bool _480 = _476 || _478;
            bool _482 = isnan(9.9999999747524270787835121154785e-07);
            bool _484 = _480 || _482;
            if (!_484)
            {
                float _486 = _390 * _390;
                float _488 = fma(_388, _388, _486);
                float _490 = fma(_392, _392, _488);
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
                    _420 = _516;
                    _422 = _514;
                    _424 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _420 = _550;
                    _422 = _548;
                    _424 = _552;
                    _466 = true;
                }
            }
            else
            {
                float _554 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _556 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _558 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _560 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
                float _562 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
                float _566 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
                float _568 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
                float _570 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
                float _572 = _566 * _566;
                float _574 = fma(_568, _568, _572);
                float _576 = fma(_570, _570, _574);
                float _578 = rsqrt(_576);
                float _580 = _578 * 9.9999999747524270787835121154785e-07;
                float _582 = _568 * _580;
                float _584 = _566 * _580;
                float _586 = _570 * _580;
                _420 = _584;
                _422 = _582;
                _424 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _420;
    float _590 = _422;
    float _592 = _424;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _596 = !_594;
    float _614;
    if (!_596)
    {
        float _598 = in.m_53.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_90);
        float _620 = 1.0 / _618;
        float _622 = _124 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _632 = _624 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _652 = _624 + _650;
    float _654 = 1.0 / _636;
    bool _656 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _658 = isnan(_624);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _640;
    float _670 = _628 * _654;
    float _672 = _588 * _588;
    float _674 = 1.0 / _644;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _678 = _624 + _676;
    float _680 = fma(_590, _590, _672);
    float _682 = _632 * _668;
    float _684 = fma(_592, _592, _680);
    float _686 = 1.0 / _648;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _696;
    float _700 = fma(_698, _670, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _702 = rsqrt(_684);
    float _704 = _652 * _674;
    float _706 = fma(_690, _670, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _708 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _710 = isnan(_624);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = fma(_694, _670, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _730 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _732 = isnan(_624);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _678 * _686;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _748 = -_718;
    float _750 = _748 + 1.0;
    float _752 = fma(_724, _682, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_728, _682, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_746, _682, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _758 = _666 * _750;
    float _760 = -_666;
    float _762 = _760 + 1.0;
    float _764 = _702 * _590;
    float _766 = _702 * _588;
    float _768 = _702 * _592;
    bool _770 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _772 = isnan(_624);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -_740;
    float _784 = _782 + 1.0;
    bool _786 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _788 = isnan(_624);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _766 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _800 = _740 * _762;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _802;
    float _806 = -_796;
    float _808 = _806 + 1.0;
    float _810 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[8].y, _798);
    float _812 = _796 * _784;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _818;
    float _822 = _780 * _808;
    float _824 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[10].y, _810);
    float _826 = fma(_816, _704, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _828 = fma(_804, _704, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _830 = fma(_820, _704, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _832 = _720 * _822;
    float _834 = _706 * _822;
    float _836 = _700 * _822;
    float _838 = abs(_824);
    bool _840 = _838 > 0.99989998340606689453125;
    float _842 = -_780;
    float _844 = _842 + 1.0;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].x, _832);
    float _860 = fma(_848, _742, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _862 = fma(_852, _742, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _864 = fma(_856, _742, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _866 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].y, _834);
    float _868 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].z, _836);
    float _870 = fma(_752, _812, _858);
    float _872 = fma(_756, _812, _866);
    float _874 = fma(_754, _812, _868);
    float _876 = _752;
    float _878 = _856;
    float _880 = _754;
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_840)
    {
        _876 = 0.001000000047497451305389404296875;
    }
    float _884 = _876;
    float _886 = in.m_51.x;
    float _888 = in.m_51.y;
    float _890 = in.m_51.z;
    float _892 = fma(_826, _800, _870);
    if (!_840)
    {
        _878 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _894 = _878;
    float _896 = _894;
    if (_840)
    {
        float _898 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _896 = _898;
    }
    float _900 = _896;
    if (!_840)
    {
        _880 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _902 = _880;
    float _904 = _902;
    if (_840)
    {
        float _906 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _904 = _906;
    }
    float _908 = _904;
    float _910 = -_900;
    float _912 = _768 * _910;
    if (!_840)
    {
        _882 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _914 = _882;
    float _916 = fma(_828, _800, _872);
    float _918 = fma(_830, _800, _874);
    float _920 = _914;
    if (_840)
    {
        float _922 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _920 = _922;
    }
    float _924 = _920;
    float _926 = -_908;
    float _928 = _766 * _926;
    float _930 = -_908;
    float _932 = -_912;
    float _934 = fma(_764, _930, _932);
    float _936 = in.m_55.x;
    float _938 = in.m_55.y;
    float _940 = in.m_55.z;
    float _942 = fma(_860, _758, _892);
    float _944 = -_924;
    float _946 = _764 * _944;
    float _948 = -_924;
    float _950 = -_928;
    float _952 = fma(_768, _948, _950);
    float _954 = _934 * _934;
    float _956 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].x, _942);
    float _958 = -_900;
    float _960 = -_946;
    float _962 = fma(_766, _958, _960);
    float _964 = fma(_862, _758, _916);
    float _966 = fma(_952, _952, _954);
    float _968 = _956 * _886;
    float _970 = fma(_864, _758, _918);
    float _972 = fma(_962, _962, _966);
    float _974 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].y, _964);
    float _976 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].z, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = rsqrt(_972);
    float _982 = _974 * _888;
    float _984 = _976 * _890;
    float _986 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _936);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _940);
    float _996 = _978 * _990;
    float _998 = _984 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1000 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1002 = _988 * _992;
    float _1004 = _934 * _980;
    float _1006 = _962 * _980;
    float _1008 = _998 * _994;
    float _1010 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1000);
    float _1012 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _1014 = _952 * _980;
    float _1016 = _1002 * _768;
    float _1018 = _764 * _1004;
    float _1020 = _1002 * _764;
    float _1022 = _766 * _1006;
    float _1024 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1026 = fma(_996, _1006, _1016);
    float _1028 = -_1018;
    float _1030 = fma(_766, _1014, _1028);
    float _1032 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1010);
    float _1034 = fma(_996, _1014, _1020);
    float _1036 = -_1022;
    float _1038 = fma(_768, _1004, _1036);
    float _1040 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = fma(_1008, _1030, _1026);
    float _1044 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = fma(_1008, _1038, _1034);
    float _1048 = in.m_53.y;
    float _1050 = _1040 + _1042;
    float _1052 = _1044 + _1046;
    float _1054 = in.m_57.y;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1058 = _1050 + _1056;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1062 = _1060 != 0;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1052 + _1064;
    float _1068 = in.m_57.x;
    float _1070 = _1058 * _1058;
    float _1072 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1074 = _1066 * _1066;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1078 = _1076 != 0;
    float _1080 = _1002 * _766;
    float _1082 = _768 * _1014;
    float _1084 = _1074 + _1070;
    float _1086 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1072);
    float _1088 = fma(_996, _1004, _1080);
    float _1090 = -_1082;
    float _1092 = fma(_764, _1006, _1090);
    float _1094 = sqrt(_1084);
    float _1096 = _980;
    float _1098 = _996;
    float _1100 = _1050;
    float _1102 = _1052;
    float _1104 = _936;
    float _1106 = _1006;
    if (_1062)
    {
        float _1108 = in.m_53.x;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1114 = fma(_1008, _1092, _1088);
    bool _1116 = _1048 > 0.5;
    float _1118 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1122 = -_1054;
    float _1124 = _1122 + 1.0;
    float _1126 = _1054;
    float _1128 = _1124;
    if (_1062)
    {
        _1098 = _1068;
    }
    float _1130 = _1098;
    float _1132 = _1130;
    if (_1078)
    {
        float _1134 = _1116 ? _1124 : _1054;
        _1126 = _1134;
    }
    float _1136 = _1126;
    bool _1138 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1140 = _1110 > 0.5;
    bool _1142 = _1140 && _1062;
    float _1144 = _1118 + _1114;
    float _1146 = _1144;
    if (!_1138)
    {
        _426 = _1070;
    }
    float _1148 = _426;
    float _1150 = _1148;
    if (!_1138)
    {
        _1128 = _1074;
    }
    float _1152 = _1128;
    float _1154 = 0.0;
    float _1156 = _1152;
    if (!_1138)
    {
        _1154 = _1144;
    }
    float _1158 = _1154;
    bool _1160 = !_1138;
    float _1162 = _1158;
    if (!_1160)
    {
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1168 = _1094 + _1166;
        float _1170 = rsqrt(_1084);
        float _1172 = _1168 * _1164;
        float _1174 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = _1172 * 0.15915493667125701904296875;
        float _1178 = _1176 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = _1176 * 6.283185482025146484375;
        float _1184 = cos(_1182);
        float _1186 = fma(_1180, _1174, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1188 = _1170 * _1186;
        float _1190 = _1184 + (-1.0);
        float _1192 = fma(_1066, _1188, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1194 = fma(_1058, _1188, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1196 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1200 = _1192 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1204 = _1194 + _1202;
        float _1206 = fma(_1144, _1184, _1196);
        float _1208 = _1200 * _1200;
        float _1210 = _1204 * _1204;
        _1162 = _1206;
        _1156 = _1208;
        _1150 = _1210;
        _1100 = _1194;
        _1102 = _1192;
    }
    float _1212 = _1162;
    float _1214 = _1156;
    float _1216 = _1150;
    float _1218 = _1100;
    float _1220 = _1102;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1224 = _1212 + _1222;
    if (_1142)
    {
        float _1226 = -_1130;
        float _1228 = _1226 + 1.0;
        _1132 = _1228;
    }
    float _1230 = _1132;
    float _1232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1234 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1236 = fma(_1224, _1224, _1214);
    if (!_1062)
    {
        _1146 = _1068;
    }
    float _1238 = _1146;
    float _1240 = _1238;
    if (_1062)
    {
        _1240 = _1230;
    }
    float _1242 = _1240;
    float _1244 = _1236 + _1216;
    float _1246 = in.m_59.x;
    float _1248 = in.m_59.y;
    float _1250 = in.m_59.z;
    float _1252 = _1234 * _1120;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1258 = sqrt(_1244);
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1262 = _938 != 0.0;
    bool _1264 = isnan(_938);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(0.0);
    bool _1270 = _1266 || _1268;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1276 = _936 == 0.0;
    bool _1278 = !_1270;
    bool _1280 = _1276 && _1278;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1284 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1286 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1288 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1290 = _940 == 0.0;
    bool _1292 = _1290 && _1280;
    float _1294 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1298 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1284 * _1232;
    out.m_61.x = _1286;
    out.m_61.y = _1288;
    out.m_61.z = _1294;
    bool _1306 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1308 = isnan(_1258);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1314 = _1310 || _1312;
    float _1316 = _1248;
    float _1318 = _1246;
    float _1320 = _1250;
    float _1322 = _1300;
    if (!_1292)
    {
        float _1324 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1316 = _1324;
    }
    float _1326 = _1316;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    if (!_1292)
    {
        float _1328 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1318 = _1328;
    }
    float _1330 = _1318;
    if (!_1292)
    {
        float _1332 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1320 = _1332;
    }
    float _1334 = _1320;
    float _1336 = _764 * _1326;
    out.m_65.x = _1298;
    out.m_65.y = _1300;
    out.m_65.z = _1302;
    out.m_65.w = _1296;
    float _1338 = _766 * _1326;
    float _1340 = _768 * _1326;
    float _1342 = fma(_1014, _1330, _1336);
    out.m_67.x = _1304;
    out.m_67.y = _1252;
    float _1344 = fma(_1004, _1330, _1338);
    float _1346 = fma(_1006, _1330, _1340);
    float _1348 = fma(_1038, _1334, _1342);
    if (!_1314)
    {
        _1104 = 1.0;
    }
    float _1350 = _1104;
    float _1352 = fma(_1092, _1334, _1344);
    float _1354 = fma(_1030, _1334, _1346);
    bool _1356 = !_1314;
    float _1358 = _1350;
    if (!_1356)
    {
        bool _1360 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1362 = isnan(_1258);
        bool _1364 = _1360 || _1362;
        bool _1366 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1368 = _1364 || _1366;
        if (!_1368)
        {
            float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1372 = _1258 + _1370;
            float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1376 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1374;
            float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1382 = 1.0 / _1376;
            float _1384 = _1372 * _1382;
            float _1386 = fma(_1384, _1380, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1358 = _1386;
            _1388 = true;
        }
        else
        {
            bool _1390 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1392 = isnan(_1258);
            bool _1394 = _1390 || _1392;
            bool _1396 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1398 = _1394 || _1396;
            if (!_1398)
            {
                float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1402 = _1258 + _1400;
                float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1406 = _1404 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1408 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1410 = _1408 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1412 = 1.0 / _1406;
                float _1414 = _1402 * _1412;
                float _1416 = fma(_1414, _1410, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1358 = _1416;
                _1388 = true;
            }
            else
            {
                _1358 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1388 = false;
    float _1418 = _1358;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1422 = _1212 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1218 + _1424;
    bool _1428 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.5);
    bool _1436 = _1432 || _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1440 = _1220 + _1438;
    float _1442 = fma(_1422, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1444 = fma(_1426, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = fma(_1440, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = _1440;
    float _1450 = _1422;
    float _1452 = _1418;
    float _1454 = _1446;
    float _1456 = _1444;
    if (_1436)
    {
        _1448 = _1446;
    }
    float _1458 = _1448;
    float _1460 = _1458;
    if (_1436)
    {
        _1450 = _1442;
    }
    float _1462 = _1450;
    float _1464 = _1462;
    if (_1436)
    {
        _1452 = _1444;
    }
    float _1466 = _1452;
    float _1468 = _1466;
    if (!_1436)
    {
        float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1472 = _1118 + _1470;
        float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1476 = _1044 + _1474;
        float _1478 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1480 = _1472 * _1472;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1484 = _1040 + _1482;
        float _1486 = fma(_1476, _1476, _1480);
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1490 = fma(_1484, _1484, _1486);
        float _1492 = sqrt(_1490);
        float _1494 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1496 = precise::min(_1492, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1498 = _1496 * _1488;
        float _1500 = -_1044;
        float _1502 = _1500 + _1446;
        float _1504 = -_1040;
        float _1506 = _1504 + _1444;
        float _1508 = _1494 * _1498;
        float _1510 = -_1118;
        float _1512 = _1510 + _1442;
        float _1514 = fma(_1502, _1508, _1044);
        float _1516 = fma(_1512, _1508, _1118);
        float _1518 = fma(_1506, _1508, _1040);
        _1464 = _1516;
        _1460 = _1514;
        _1468 = _1518;
        _1454 = _1506;
    }
    float _1520 = _1464;
    float _1522 = _1460;
    float _1524 = _1468;
    float _1526 = _1454;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1520 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1522 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1524 + _1536;
    float _1540 = _1530 * _1530;
    float _1542 = fma(_1534, _1534, _1540);
    float _1544 = fma(_1538, _1538, _1542);
    float _1546 = rsqrt(_1544);
    float _1548 = _1534 * _1546;
    float _1550 = _1538 * _1546;
    float _1552 = _1530 * _1546;
    float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1326;
    float _1574 = _1570;
    float _1576 = _1554;
    if (_1566)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1578;
    }
    float _1580 = _1572;
    if (_1566)
    {
        float _1582 = rsqrt(_1562);
        _1456 = _1582;
    }
    float _1584 = _1456;
    float _1586 = _1584;
    if (_1566)
    {
        float _1588 = _1570 * _1580;
        _1574 = _1588;
    }
    float _1590 = _1574;
    if (_1566)
    {
        float _1592 = _1590 * 0.15915493667125701904296875;
        _1322 = _1592;
    }
    float _1594 = _1322;
    float _1596 = _1526;
    if (_1566)
    {
        float _1598 = _1594 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1606 = precise::max(0.0, _1604);
    float _1608 = _1580;
    float _1610 = _1606;
    float _1612 = _1604;
    if (_1566)
    {
        float _1614 = _1594 * 6.283185482025146484375;
        float _1616 = cos(_1614);
        _1608 = _1616;
    }
    float _1618 = _1608;
    float _1620 = -_1552;
    float _1622 = -_1606;
    float _1624 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1622);
    if (_1566)
    {
        float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1610 = _1626;
    }
    float _1628 = _1610;
    float _1630 = sqrt(_1544);
    float _1632 = _1628;
    float _1634 = _1602;
    if (_1566)
    {
        float _1636 = fma(_1602, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (!_1566)
    {
        _1634 = _1558;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    float _1646 = _1618;
    if (_1566)
    {
        float _1648 = _1618 + (-1.0);
        _1612 = _1648;
    }
    float _1650 = _1612;
    float _1652 = _1650;
    if (_1566)
    {
        float _1654 = _1584 * _1638;
        _1106 = _1654;
    }
    float _1656 = _1106;
    if (!_1566)
    {
        _1640 = _1624;
    }
    float _1658 = _1640;
    float _1660 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = _1658;
    if (_1566)
    {
        float _1664 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1664;
    }
    float _1666 = _1586;
    if (_1566)
    {
        float _1668 = _1554 * _1656;
        _1576 = _1668;
    }
    float _1670 = _1576;
    if (!_1566)
    {
        _1652 = _1556;
    }
    float _1672 = _1652;
    float _1674 = _1672;
    if (_1566)
    {
        float _1676 = _1556 * _1656;
        _1674 = _1676;
    }
    float _1678 = _1674;
    if (_1566)
    {
        float _1680 = fma(_1624, _1618, _1666);
        _1662 = _1680;
    }
    float _1682 = _1662;
    if (_1566)
    {
        float _1684 = _1670 * _1670;
        _1644 = _1684;
    }
    float _1686 = _1644;
    if (!_1566)
    {
        _1646 = _1560;
    }
    float _1688 = _1646;
    float _1690 = _1688;
    if (_1566)
    {
        float _1692 = _1678 * _1678;
        _1690 = _1692;
    }
    float _1694 = _1690;
    float _1696 = fma(_1682, _1682, _1686);
    float _1698 = _1696 + _1694;
    float _1700 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1704 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1702);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1710 = rsqrt(_1698);
    float _1712 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1700);
    float _1714 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1716 = -_1706;
    float _1718 = _1716 + 1.0;
    float _1720 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1722 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1712);
    float _1724 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1714);
    float _1726 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1720);
    float _1728 = abs(_1718);
    float _1730 = log2(_1728);
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1724);
    float _1736 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1738 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1744 = _1710 * _1670;
    float _1746 = _1710 * _1682;
    float _1748 = -_1740;
    float _1750 = fma(_1748, _1708, 1.0);
    float _1752 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1736);
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1756 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1710 * _1678;
    float _1762 = -_1754;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1768 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1770 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = -_1760;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1776 = log2(_1750);
    float _1778 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1768);
    float _1780 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1786 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    float _1788 = fma(_1774, 0.5, 0.5);
    float _1790 = exp2(_1770);
    float _1792 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1794 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1784);
    float _1796 = _1746 + 1.0;
    float _1798 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1800 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1794);
    float _1802 = 1.0 / _1786;
    float _1804 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = _1776 * 0.693147182464599609375;
    float _1808 = fma(_1788, _1804, -0.212114393711090087890625);
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = sqrt(_1782);
    float _1814 = -_1746;
    float _1816 = fma(_1790, _1796, _1814);
    float _1818 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1820 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1822 = fma(_1788, _1808, 1.570728778839111328125);
    float _1824 = fma(_1816, 0.5, 0.5);
    float _1826 = _1818 * _1802;
    float _1828 = _1820 * _1802;
    float _1830 = fma(_1826, 0.5, 0.5);
    float _1832 = fma(_1828, -0.5, 0.5);
    float _1834 = _1812 * 0.636619746685028076171875;
    float _1836 = -_1822;
    float _1838 = fma(_1834, _1836, 1.0);
    float3 _4995 = float3(_1830, _1832, _1810);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4995, float3(0.0), isnan(_4995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4995, float3(0.0), isnan(_4995)), level(0.0)).x;
    float3 _5006 = float3(_1830, _1832, _1810);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5006, float3(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5006, float3(0.0), isnan(_5006)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float2 _5023 = float2(_1838, _1824);
    float3 _1855 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5023, float2(0.0), isnan(_5023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5023, float2(0.0), isnan(_5023)), level(0.0)).xyz;
    float _1857 = _1855.x;
    float _1859 = _1855.y;
    float _1861 = _1855.z;
    float _1863 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1865 = _1352 * _1552;
    float _1867 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1863);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1871;
    float _1875 = fma(_1348, _1548, _1865);
    float _1877 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1869);
    float _1879 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1881 = fma(_1354, _1550, _1875);
    float _1883 = 1.0 / _1873;
    float _1885 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1879);
    float _1887 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1889 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    float _1899 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    float _1901 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1885);
    float _1903 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1905 = abs(_1881);
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1909 = _1905 + _1907;
    float _1911 = 1.0 / _1887;
    float _1913 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1915 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    float _1917 = _1913 + _1887;
    float _1919 = exp2(_1903);
    float _1921 = _1909 * _1883;
    float _1923 = precise::clamp(_1921, 0.0, 1.0);
    float _1925 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1927 = fma(_1923, -2.0, 3.0);
    float _1929 = _1923 * _1923;
    float _1931 = _1923;
    if (_1897)
    {
        _1931 = 1.0;
    }
    float _1933 = _1931;
    float _1935 = _1917 * _1911;
    float _1937 = _1935 * 0.5;
    float _1939 = _1933;
    if (!_1897)
    {
        float _1941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1943);
        float _1947 = _1941 * 0.15915493667125701904296875;
        float _1949 = _1947 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1955 = _1953 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1951;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = 1.0 / _1945;
        float _1971 = _1965 * _1967;
        float _1973 = _1955 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1983 = _1969 * _1981;
        float _1985 = 1.0 / _1971;
        float _1987 = 1.0 / _1979;
        float _1989 = _1975 * _1985;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1993 = fma(_1989, _1983, _1991);
        float _1995 = _1993 * _1987;
        float _1997 = precise::clamp(_1995, 0.0, 1.0);
        _1939 = _1997;
    }
    float _1999 = _1939;
    float _2001 = -_1919;
    float _2003 = _2001 + 1.0;
    float _2005 = _1929 * _1927;
    float _2007 = _1786 * 0.5;
    bool _2009 = _1999 > 0.0;
    bool _2011 = isnan(_1999);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(0.0);
    bool _2017 = _2013 || _2015;
    float _2019 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2021 = _2005 * _1999;
    float _2023 = fma(_1820, -0.5, _2007);
    float _2025 = _1925 + _1786;
    float _2027 = _2019 * _1840;
    float _2029 = -_2019;
    float _2031 = _2029 + 1.0;
    float _2033 = _1818 + _1786;
    float _2035 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _1851 * _2027;
    float _2039 = _1861 * _2027;
    out.gl_Position.x = _1818;
    out.gl_Position.y = _1820;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1786;
    float _2041 = fma(_1857, _2037, _1845);
    float _2043 = fma(_1859, _2037, _1847);
    float _2045 = _1851 * _2031;
    float _2047 = _2025 * 0.5;
    float _2049 = _2033 * 0.5;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2053 = fma(_1851, _2039, _1849);
    out.m_69.x = _2049;
    out.m_69.y = _2023;
    out.m_69.z = _2047;
    out.m_69.w = _1786;
    out.m_47.x = _2051;
    out.m_71.x = _2041;
    out.m_71.y = _2043;
    out.m_71.z = _2053;
    out.m_71.w = _2045;
    if (_2017)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2055;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1388 = false;
    bool _616 = false;
    bool _466 = false;
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
        float _2112 = as_type<float>(_106);
        out.gl_Position.z = _2112;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2183 = as_type<float>(_146);
        out.gl_Position.z = _2183;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _338 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = fma(_260, _152, _268);
    float _342 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = fma(_334, _152, _336);
    float _346 = fma(_260, _150, _338);
    float _348 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_334, _150, _342);
    float _352 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = -_344;
    float _356 = _340 + _354;
    float _358 = fma(_334, _154, _348);
    float _360 = -_350;
    float _362 = _346 + _360;
    float _364 = fma(_260, _154, _352);
    float _366 = _356 * _356;
    float _368 = in.m_51.w;
    float _370 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = -_358;
    float _374 = _364 + _372;
    float _376 = fma(_362, _362, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _384 = fma(_374, _374, _376);
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = in.m_44.x;
    float _390 = in.m_44.y;
    float _392 = in.m_44.z;
    float _394 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_346, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_364, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    float _426 = _418;
    if (!_412)
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
            _420 = _462;
            _422 = _460;
            _424 = _464;
            _466 = true;
        }
        else
        {
            float _468 = _152 * _152;
            float _470 = fma(_150, _150, _468);
            float _472 = fma(_154, _154, _470);
            float _474 = sqrt(_472);
            bool _476 = _474 >= 9.9999999747524270787835121154785e-07;
            bool _478 = isnan(_474);
            bool _480 = _476 || _478;
            bool _482 = isnan(9.9999999747524270787835121154785e-07);
            bool _484 = _480 || _482;
            if (!_484)
            {
                float _486 = _390 * _390;
                float _488 = fma(_388, _388, _486);
                float _490 = fma(_392, _392, _488);
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
                    _420 = _516;
                    _422 = _514;
                    _424 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _420 = _550;
                    _422 = _548;
                    _424 = _552;
                    _466 = true;
                }
            }
            else
            {
                float _554 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _556 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _558 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _560 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
                float _562 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
                float _566 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
                float _568 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
                float _570 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
                float _572 = _566 * _566;
                float _574 = fma(_568, _568, _572);
                float _576 = fma(_570, _570, _574);
                float _578 = rsqrt(_576);
                float _580 = _578 * 9.9999999747524270787835121154785e-07;
                float _582 = _568 * _580;
                float _584 = _566 * _580;
                float _586 = _570 * _580;
                _420 = _584;
                _422 = _582;
                _424 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _420;
    float _590 = _422;
    float _592 = _424;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _596 = !_594;
    float _614;
    if (!_596)
    {
        float _598 = in.m_53.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_90);
        float _620 = 1.0 / _618;
        float _622 = _124 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _632 = _624 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _652 = _624 + _650;
    float _654 = 1.0 / _636;
    bool _656 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _658 = isnan(_624);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _640;
    float _670 = _628 * _654;
    float _672 = _588 * _588;
    float _674 = 1.0 / _644;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _678 = _624 + _676;
    float _680 = fma(_590, _590, _672);
    float _682 = _632 * _668;
    float _684 = fma(_592, _592, _680);
    float _686 = 1.0 / _648;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _696;
    float _700 = fma(_698, _670, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _702 = rsqrt(_684);
    float _704 = _652 * _674;
    float _706 = fma(_690, _670, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _708 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _710 = isnan(_624);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = fma(_694, _670, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _730 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _732 = isnan(_624);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _678 * _686;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _748 = -_718;
    float _750 = _748 + 1.0;
    float _752 = fma(_724, _682, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_728, _682, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_746, _682, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _758 = _666 * _750;
    float _760 = -_666;
    float _762 = _760 + 1.0;
    float _764 = _702 * _590;
    float _766 = _702 * _588;
    float _768 = _702 * _592;
    bool _770 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _772 = isnan(_624);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -_740;
    float _784 = _782 + 1.0;
    bool _786 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _788 = isnan(_624);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _766 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _800 = _740 * _762;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _802;
    float _806 = -_796;
    float _808 = _806 + 1.0;
    float _810 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[8].y, _798);
    float _812 = _796 * _784;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _818;
    float _822 = _780 * _808;
    float _824 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[10].y, _810);
    float _826 = fma(_816, _704, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _828 = fma(_804, _704, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _830 = fma(_820, _704, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _832 = _720 * _822;
    float _834 = _706 * _822;
    float _836 = _700 * _822;
    float _838 = abs(_824);
    bool _840 = _838 > 0.99989998340606689453125;
    float _842 = -_780;
    float _844 = _842 + 1.0;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].x, _832);
    float _860 = fma(_848, _742, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _862 = fma(_852, _742, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _864 = fma(_856, _742, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _866 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].y, _834);
    float _868 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[143].z, _836);
    float _870 = fma(_752, _812, _858);
    float _872 = fma(_756, _812, _866);
    float _874 = fma(_754, _812, _868);
    float _876 = _752;
    float _878 = _856;
    float _880 = _754;
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_840)
    {
        _876 = 0.001000000047497451305389404296875;
    }
    float _884 = _876;
    float _886 = in.m_51.x;
    float _888 = in.m_51.y;
    float _890 = in.m_51.z;
    float _892 = fma(_826, _800, _870);
    if (!_840)
    {
        _878 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _894 = _878;
    float _896 = _894;
    if (_840)
    {
        float _898 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _896 = _898;
    }
    float _900 = _896;
    if (!_840)
    {
        _880 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _902 = _880;
    float _904 = _902;
    if (_840)
    {
        float _906 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _904 = _906;
    }
    float _908 = _904;
    float _910 = -_900;
    float _912 = _768 * _910;
    if (!_840)
    {
        _882 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _914 = _882;
    float _916 = fma(_828, _800, _872);
    float _918 = fma(_830, _800, _874);
    float _920 = _914;
    if (_840)
    {
        float _922 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _920 = _922;
    }
    float _924 = _920;
    float _926 = -_908;
    float _928 = _766 * _926;
    float _930 = -_908;
    float _932 = -_912;
    float _934 = fma(_764, _930, _932);
    float _936 = in.m_55.x;
    float _938 = in.m_55.y;
    float _940 = in.m_55.z;
    float _942 = fma(_860, _758, _892);
    float _944 = -_924;
    float _946 = _764 * _944;
    float _948 = -_924;
    float _950 = -_928;
    float _952 = fma(_768, _948, _950);
    float _954 = _934 * _934;
    float _956 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].x, _942);
    float _958 = -_900;
    float _960 = -_946;
    float _962 = fma(_766, _958, _960);
    float _964 = fma(_862, _758, _916);
    float _966 = fma(_952, _952, _954);
    float _968 = _956 * _886;
    float _970 = fma(_864, _758, _918);
    float _972 = fma(_962, _962, _966);
    float _974 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].y, _964);
    float _976 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[147].z, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = rsqrt(_972);
    float _982 = _974 * _888;
    float _984 = _976 * _890;
    float _986 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _936);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _940);
    float _996 = _978 * _990;
    float _998 = _984 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1000 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1002 = _988 * _992;
    float _1004 = _934 * _980;
    float _1006 = _962 * _980;
    float _1008 = _998 * _994;
    float _1010 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1000);
    float _1012 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _1014 = _952 * _980;
    float _1016 = _1002 * _768;
    float _1018 = _764 * _1004;
    float _1020 = _1002 * _764;
    float _1022 = _766 * _1006;
    float _1024 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1026 = fma(_996, _1006, _1016);
    float _1028 = -_1018;
    float _1030 = fma(_766, _1014, _1028);
    float _1032 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1010);
    float _1034 = fma(_996, _1014, _1020);
    float _1036 = -_1022;
    float _1038 = fma(_768, _1004, _1036);
    float _1040 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = fma(_1008, _1030, _1026);
    float _1044 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = fma(_1008, _1038, _1034);
    float _1048 = in.m_53.y;
    float _1050 = _1040 + _1042;
    float _1052 = _1044 + _1046;
    float _1054 = in.m_57.y;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1058 = _1050 + _1056;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1062 = _1060 != 0;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1052 + _1064;
    float _1068 = in.m_57.x;
    float _1070 = _1058 * _1058;
    float _1072 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1074 = _1066 * _1066;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1078 = _1076 != 0;
    float _1080 = _1002 * _766;
    float _1082 = _768 * _1014;
    float _1084 = _1074 + _1070;
    float _1086 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1072);
    float _1088 = fma(_996, _1004, _1080);
    float _1090 = -_1082;
    float _1092 = fma(_764, _1006, _1090);
    float _1094 = sqrt(_1084);
    float _1096 = _980;
    float _1098 = _996;
    float _1100 = _1050;
    float _1102 = _1052;
    float _1104 = _936;
    float _1106 = _1006;
    if (_1062)
    {
        float _1108 = in.m_53.x;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1114 = fma(_1008, _1092, _1088);
    bool _1116 = _1048 > 0.5;
    float _1118 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1122 = -_1054;
    float _1124 = _1122 + 1.0;
    float _1126 = _1054;
    float _1128 = _1124;
    if (_1062)
    {
        _1098 = _1068;
    }
    float _1130 = _1098;
    float _1132 = _1130;
    if (_1078)
    {
        float _1134 = _1116 ? _1124 : _1054;
        _1126 = _1134;
    }
    float _1136 = _1126;
    bool _1138 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1140 = _1110 > 0.5;
    bool _1142 = _1140 && _1062;
    float _1144 = _1118 + _1114;
    float _1146 = _1144;
    if (!_1138)
    {
        _426 = _1070;
    }
    float _1148 = _426;
    float _1150 = _1148;
    if (!_1138)
    {
        _1128 = _1074;
    }
    float _1152 = _1128;
    float _1154 = 0.0;
    float _1156 = _1152;
    if (!_1138)
    {
        _1154 = _1144;
    }
    float _1158 = _1154;
    bool _1160 = !_1138;
    float _1162 = _1158;
    if (!_1160)
    {
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1168 = _1094 + _1166;
        float _1170 = rsqrt(_1084);
        float _1172 = _1168 * _1164;
        float _1174 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = _1172 * 0.15915493667125701904296875;
        float _1178 = _1176 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = _1176 * 6.283185482025146484375;
        float _1184 = cos(_1182);
        float _1186 = fma(_1180, _1174, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1188 = _1170 * _1186;
        float _1190 = _1184 + (-1.0);
        float _1192 = fma(_1066, _1188, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1194 = fma(_1058, _1188, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1196 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1200 = _1192 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1204 = _1194 + _1202;
        float _1206 = fma(_1144, _1184, _1196);
        float _1208 = _1200 * _1200;
        float _1210 = _1204 * _1204;
        _1162 = _1206;
        _1156 = _1208;
        _1150 = _1210;
        _1100 = _1194;
        _1102 = _1192;
    }
    float _1212 = _1162;
    float _1214 = _1156;
    float _1216 = _1150;
    float _1218 = _1100;
    float _1220 = _1102;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1224 = _1212 + _1222;
    if (_1142)
    {
        float _1226 = -_1130;
        float _1228 = _1226 + 1.0;
        _1132 = _1228;
    }
    float _1230 = _1132;
    float _1232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1234 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1236 = fma(_1224, _1224, _1214);
    if (!_1062)
    {
        _1146 = _1068;
    }
    float _1238 = _1146;
    float _1240 = _1238;
    if (_1062)
    {
        _1240 = _1230;
    }
    float _1242 = _1240;
    float _1244 = _1236 + _1216;
    float _1246 = in.m_59.x;
    float _1248 = in.m_59.y;
    float _1250 = in.m_59.z;
    float _1252 = _1234 * _1120;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1258 = sqrt(_1244);
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1262 = _938 != 0.0;
    bool _1264 = isnan(_938);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(0.0);
    bool _1270 = _1266 || _1268;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1276 = _936 == 0.0;
    bool _1278 = !_1270;
    bool _1280 = _1276 && _1278;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1284 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1286 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1288 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1290 = _940 == 0.0;
    bool _1292 = _1290 && _1280;
    float _1294 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1298 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1284 * _1232;
    out.m_61.x = _1286;
    out.m_61.y = _1288;
    out.m_61.z = _1294;
    bool _1306 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1308 = isnan(_1258);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1314 = _1310 || _1312;
    float _1316 = _1248;
    float _1318 = _1246;
    float _1320 = _1250;
    float _1322 = _1300;
    if (!_1292)
    {
        float _1324 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1316 = _1324;
    }
    float _1326 = _1316;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    if (!_1292)
    {
        float _1328 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1318 = _1328;
    }
    float _1330 = _1318;
    if (!_1292)
    {
        float _1332 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1320 = _1332;
    }
    float _1334 = _1320;
    float _1336 = _764 * _1326;
    out.m_65.x = _1298;
    out.m_65.y = _1300;
    out.m_65.z = _1302;
    out.m_65.w = _1296;
    float _1338 = _766 * _1326;
    float _1340 = _768 * _1326;
    float _1342 = fma(_1014, _1330, _1336);
    out.m_67.x = _1304;
    out.m_67.y = _1252;
    float _1344 = fma(_1004, _1330, _1338);
    float _1346 = fma(_1006, _1330, _1340);
    float _1348 = fma(_1038, _1334, _1342);
    if (!_1314)
    {
        _1104 = 1.0;
    }
    float _1350 = _1104;
    float _1352 = fma(_1092, _1334, _1344);
    float _1354 = fma(_1030, _1334, _1346);
    bool _1356 = !_1314;
    float _1358 = _1350;
    if (!_1356)
    {
        bool _1360 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1362 = isnan(_1258);
        bool _1364 = _1360 || _1362;
        bool _1366 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1368 = _1364 || _1366;
        if (!_1368)
        {
            float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1372 = _1258 + _1370;
            float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1376 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1374;
            float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1382 = 1.0 / _1376;
            float _1384 = _1372 * _1382;
            float _1386 = fma(_1384, _1380, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1358 = _1386;
            _1388 = true;
        }
        else
        {
            bool _1390 = _1258 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1392 = isnan(_1258);
            bool _1394 = _1390 || _1392;
            bool _1396 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1398 = _1394 || _1396;
            if (!_1398)
            {
                float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1402 = _1258 + _1400;
                float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1406 = _1404 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1408 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1410 = _1408 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1412 = 1.0 / _1406;
                float _1414 = _1402 * _1412;
                float _1416 = fma(_1414, _1410, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1358 = _1416;
                _1388 = true;
            }
            else
            {
                _1358 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1388 = false;
    float _1418 = _1358;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1422 = _1212 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1218 + _1424;
    bool _1428 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.5);
    bool _1436 = _1432 || _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1440 = _1220 + _1438;
    float _1442 = fma(_1422, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1444 = fma(_1426, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = fma(_1440, _1418, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = _1440;
    float _1450 = _1422;
    float _1452 = _1418;
    float _1454 = _1446;
    float _1456 = _1444;
    if (_1436)
    {
        _1448 = _1446;
    }
    float _1458 = _1448;
    float _1460 = _1458;
    if (_1436)
    {
        _1450 = _1442;
    }
    float _1462 = _1450;
    float _1464 = _1462;
    if (_1436)
    {
        _1452 = _1444;
    }
    float _1466 = _1452;
    float _1468 = _1466;
    if (!_1436)
    {
        float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1472 = _1118 + _1470;
        float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1476 = _1044 + _1474;
        float _1478 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1480 = _1472 * _1472;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1484 = _1040 + _1482;
        float _1486 = fma(_1476, _1476, _1480);
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1490 = fma(_1484, _1484, _1486);
        float _1492 = sqrt(_1490);
        float _1494 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1496 = precise::min(_1492, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1498 = _1496 * _1488;
        float _1500 = -_1044;
        float _1502 = _1500 + _1446;
        float _1504 = -_1040;
        float _1506 = _1504 + _1444;
        float _1508 = _1494 * _1498;
        float _1510 = -_1118;
        float _1512 = _1510 + _1442;
        float _1514 = fma(_1502, _1508, _1044);
        float _1516 = fma(_1512, _1508, _1118);
        float _1518 = fma(_1506, _1508, _1040);
        _1464 = _1516;
        _1460 = _1514;
        _1468 = _1518;
        _1454 = _1506;
    }
    float _1520 = _1464;
    float _1522 = _1460;
    float _1524 = _1468;
    float _1526 = _1454;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1520 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1522 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = _1524 + _1536;
    float _1540 = _1530 * _1530;
    float _1542 = fma(_1534, _1534, _1540);
    float _1544 = fma(_1538, _1538, _1542);
    float _1546 = rsqrt(_1544);
    float _1548 = _1534 * _1546;
    float _1550 = _1538 * _1546;
    float _1552 = _1530 * _1546;
    float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1326;
    float _1574 = _1570;
    float _1576 = _1554;
    if (_1566)
    {
        float _1578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1578;
    }
    float _1580 = _1572;
    if (_1566)
    {
        float _1582 = rsqrt(_1562);
        _1456 = _1582;
    }
    float _1584 = _1456;
    float _1586 = _1584;
    if (_1566)
    {
        float _1588 = _1570 * _1580;
        _1574 = _1588;
    }
    float _1590 = _1574;
    if (_1566)
    {
        float _1592 = _1590 * 0.15915493667125701904296875;
        _1322 = _1592;
    }
    float _1594 = _1322;
    float _1596 = _1526;
    if (_1566)
    {
        float _1598 = _1594 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1606 = precise::max(0.0, _1604);
    float _1608 = _1580;
    float _1610 = _1606;
    float _1612 = _1604;
    if (_1566)
    {
        float _1614 = _1594 * 6.283185482025146484375;
        float _1616 = cos(_1614);
        _1608 = _1616;
    }
    float _1618 = _1608;
    float _1620 = -_1552;
    float _1622 = -_1606;
    float _1624 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1622);
    if (_1566)
    {
        float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1610 = _1626;
    }
    float _1628 = _1610;
    float _1630 = sqrt(_1544);
    float _1632 = _1628;
    float _1634 = _1602;
    if (_1566)
    {
        float _1636 = fma(_1602, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (!_1566)
    {
        _1634 = _1558;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    float _1646 = _1618;
    if (_1566)
    {
        float _1648 = _1618 + (-1.0);
        _1612 = _1648;
    }
    float _1650 = _1612;
    float _1652 = _1650;
    if (_1566)
    {
        float _1654 = _1584 * _1638;
        _1106 = _1654;
    }
    float _1656 = _1106;
    if (!_1566)
    {
        _1640 = _1624;
    }
    float _1658 = _1640;
    float _1660 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = _1658;
    if (_1566)
    {
        float _1664 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1664;
    }
    float _1666 = _1586;
    if (_1566)
    {
        float _1668 = _1554 * _1656;
        _1576 = _1668;
    }
    float _1670 = _1576;
    if (!_1566)
    {
        _1652 = _1556;
    }
    float _1672 = _1652;
    float _1674 = _1672;
    if (_1566)
    {
        float _1676 = _1556 * _1656;
        _1674 = _1676;
    }
    float _1678 = _1674;
    if (_1566)
    {
        float _1680 = fma(_1624, _1618, _1666);
        _1662 = _1680;
    }
    float _1682 = _1662;
    if (_1566)
    {
        float _1684 = _1670 * _1670;
        _1644 = _1684;
    }
    float _1686 = _1644;
    if (!_1566)
    {
        _1646 = _1560;
    }
    float _1688 = _1646;
    float _1690 = _1688;
    if (_1566)
    {
        float _1692 = _1678 * _1678;
        _1690 = _1692;
    }
    float _1694 = _1690;
    float _1696 = fma(_1682, _1682, _1686);
    float _1698 = _1696 + _1694;
    float _1700 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1704 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1702);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1710 = rsqrt(_1698);
    float _1712 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1700);
    float _1714 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1716 = -_1706;
    float _1718 = _1716 + 1.0;
    float _1720 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1722 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1712);
    float _1724 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1714);
    float _1726 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1720);
    float _1728 = abs(_1718);
    float _1730 = log2(_1728);
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1724);
    float _1736 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1738 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1744 = _1710 * _1670;
    float _1746 = _1710 * _1682;
    float _1748 = -_1740;
    float _1750 = fma(_1748, _1708, 1.0);
    float _1752 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1736);
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1756 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1710 * _1678;
    float _1762 = -_1754;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1768 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1770 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = -_1760;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1776 = log2(_1750);
    float _1778 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1768);
    float _1780 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1786 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    float _1788 = fma(_1774, 0.5, 0.5);
    float _1790 = exp2(_1770);
    float _1792 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1794 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1784);
    float _1796 = _1746 + 1.0;
    float _1798 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1800 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1794);
    float _1802 = 1.0 / _1786;
    float _1804 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = _1776 * 0.693147182464599609375;
    float _1808 = fma(_1788, _1804, -0.212114393711090087890625);
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = sqrt(_1782);
    float _1814 = -_1746;
    float _1816 = fma(_1790, _1796, _1814);
    float _1818 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1820 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1822 = fma(_1788, _1808, 1.570728778839111328125);
    float _1824 = fma(_1816, 0.5, 0.5);
    float _1826 = _1818 * _1802;
    float _1828 = _1820 * _1802;
    float _1830 = fma(_1826, 0.5, 0.5);
    float _1832 = fma(_1828, -0.5, 0.5);
    float _1834 = _1812 * 0.636619746685028076171875;
    float _1836 = -_1822;
    float _1838 = fma(_1834, _1836, 1.0);
    float3 _4995 = float3(_1830, _1832, _1810);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4995, float3(0.0), isnan(_4995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4995, float3(0.0), isnan(_4995)), level(0.0)).x;
    float3 _5006 = float3(_1830, _1832, _1810);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5006, float3(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5006, float3(0.0), isnan(_5006)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float2 _5023 = float2(_1838, _1824);
    float3 _1855 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5023, float2(0.0), isnan(_5023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5023, float2(0.0), isnan(_5023)), level(0.0)).xyz;
    float _1857 = _1855.x;
    float _1859 = _1855.y;
    float _1861 = _1855.z;
    float _1863 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1865 = _1352 * _1552;
    float _1867 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1863);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1871;
    float _1875 = fma(_1348, _1548, _1865);
    float _1877 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1869);
    float _1879 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1881 = fma(_1354, _1550, _1875);
    float _1883 = 1.0 / _1873;
    float _1885 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1879);
    float _1887 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1889 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    float _1899 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    float _1901 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1885);
    float _1903 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1905 = abs(_1881);
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1909 = _1905 + _1907;
    float _1911 = 1.0 / _1887;
    float _1913 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1915 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    float _1917 = _1913 + _1887;
    float _1919 = exp2(_1903);
    float _1921 = _1909 * _1883;
    float _1923 = precise::clamp(_1921, 0.0, 1.0);
    float _1925 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1927 = fma(_1923, -2.0, 3.0);
    float _1929 = _1923 * _1923;
    float _1931 = _1923;
    if (_1897)
    {
        _1931 = 1.0;
    }
    float _1933 = _1931;
    float _1935 = _1917 * _1911;
    float _1937 = _1935 * 0.5;
    float _1939 = _1933;
    if (!_1897)
    {
        float _1941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1945 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1943);
        float _1947 = _1941 * 0.15915493667125701904296875;
        float _1949 = _1947 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1955 = _1953 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1951;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = 1.0 / _1945;
        float _1971 = _1965 * _1967;
        float _1973 = _1955 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1983 = _1969 * _1981;
        float _1985 = 1.0 / _1971;
        float _1987 = 1.0 / _1979;
        float _1989 = _1975 * _1985;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1993 = fma(_1989, _1983, _1991);
        float _1995 = _1993 * _1987;
        float _1997 = precise::clamp(_1995, 0.0, 1.0);
        _1939 = _1997;
    }
    float _1999 = _1939;
    float _2001 = -_1919;
    float _2003 = _2001 + 1.0;
    float _2005 = _1929 * _1927;
    float _2007 = _1786 * 0.5;
    bool _2009 = _1999 > 0.0;
    bool _2011 = isnan(_1999);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(0.0);
    bool _2017 = _2013 || _2015;
    float _2019 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2021 = _2005 * _1999;
    float _2023 = fma(_1820, -0.5, _2007);
    float _2025 = _1925 + _1786;
    float _2027 = _2019 * _1840;
    float _2029 = -_2019;
    float _2031 = _2029 + 1.0;
    float _2033 = _1818 + _1786;
    float _2035 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _1851 * _2027;
    float _2039 = _1861 * _2027;
    out.gl_Position.x = _1818;
    out.gl_Position.y = _1820;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1786;
    float _2041 = fma(_1857, _2037, _1845);
    float _2043 = fma(_1859, _2037, _1847);
    float _2045 = _1851 * _2031;
    float _2047 = _2025 * 0.5;
    float _2049 = _2033 * 0.5;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2053 = fma(_1851, _2039, _1849);
    out.m_69.x = _2049;
    out.m_69.y = _2023;
    out.m_69.z = _2047;
    out.m_69.w = _1786;
    out.m_47.x = _2051;
    out.m_71.x = _2041;
    out.m_71.y = _2043;
    out.m_71.z = _2053;
    out.m_71.w = _2045;
    if (_2017)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2055;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

