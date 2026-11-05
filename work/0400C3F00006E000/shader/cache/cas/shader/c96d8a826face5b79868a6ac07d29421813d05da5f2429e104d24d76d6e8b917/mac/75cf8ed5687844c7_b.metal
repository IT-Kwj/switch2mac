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
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad5 [[user(locn5)]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _942 = false;
    bool _796 = false;
    bool _616 = false;
    bool _466 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2068 = as_type<float>(_106);
        out.gl_Position.z = _2068;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = 0.0;
    float _130 = 0.0;
    if (_120)
    {
        float _132 = float(_90);
        _126 = _132;
    }
    float _134 = _126;
    bool _136 = _124 >= _134;
    bool _138 = !_120;
    bool _140 = _136 || _138;
    if (_140)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _100;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    float _148 = as_type<float>(_146);
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2138 = as_type<float>(_146);
        out.gl_Position.z = _2138;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
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
        _128 = _212;
        _192 = _222;
        _130 = _210;
    }
    float _224 = _128;
    float _226 = _192;
    float _228 = _130;
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
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _124);
        float _306 = _304 * _298;
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
    float _348 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_334, _150, _342);
    float _354 = -_344;
    float _356 = _340 + _354;
    float _358 = fma(_260, _154, _348);
    float _360 = fma(_334, _154, _350);
    float _362 = -_352;
    float _364 = _346 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_49.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = in.m_42.x;
    float _390 = in.m_42.y;
    float _392 = in.m_42.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_346, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    float _426 = _414;
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
        float _598 = in.m_51.x;
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
    bool _630 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _624 + _642;
    bool _646 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_624);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _664;
    float _684 = _676 * _680;
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _690;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _696 = 1.0 / _660;
    float _698 = _656 * _688;
    float _700 = -_656;
    float _702 = _700 + 1.0;
    float _704 = _644 * _682;
    float _706 = _628 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _712;
    float _716 = fma(_692, _706, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _720 = fma(_714, _706, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _722 = in.m_49.x;
    float _724 = in.m_49.y;
    float _726 = in.m_49.z;
    float _728 = _718 * _698;
    float _730 = _716 * _698;
    float _732 = _720 * _698;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _746 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _748 = fma(_736, _704, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].y, _728);
    float _752 = fma(_740, _704, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_744, _704, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].z, _732);
    float _758 = fma(_748, _684, _750);
    float _760 = fma(_752, _684, _746);
    float _762 = fma(_754, _684, _756);
    float _764 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].y, _758);
    float _766 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].x, _760);
    float _768 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].z, _762);
    float _770 = _764 * _724;
    float _772 = _766 * _722;
    float _774 = _768 * _726;
    bool _776 = !_694;
    float _794;
    if (!_776)
    {
        float _778 = in.m_51.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_90);
        float _800 = 1.0 / _798;
        float _802 = _124 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _808 = _804 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _814 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _816 = isnan(_804);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _830 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _832 = isnan(_804);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _842;
    bool _846 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _848 = isnan(_804);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _812;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _866 = 1.0 / _828;
    float _868 = _844 * _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _874 = -_856;
    float _876 = _874 + 1.0;
    float _878 = fma(_868, _808, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _880 = _840 * _862;
    float _882 = -_840;
    float _884 = _882 + 1.0;
    float _886 = _824 * _876;
    float _888 = _872 * _866;
    float _890 = _878 * _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _894 = _804 + _892;
    float _896 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[115].x, _890);
    float _898 = fma(_888, _894, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _902 = fma(_898, _886, _896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _906 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _910 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[117].x, _902);
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _906;
    out.m_53.y = _912;
    out.m_53.z = _914;
    out.m_53.w = _916;
    bool _918 = !_864;
    float _920 = _908;
    float _922 = _912;
    float _940;
    if (!_918)
    {
        float _924 = in.m_51.x;
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _928 = _924 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _932 = _930 * _926;
        float _934 = floor(_932);
        float _936 = -_934;
        float _938 = _932 + _936;
        _940 = _938;
        _942 = true;
    }
    else
    {
        float _944 = float(_90);
        float _946 = 1.0 / _944;
        float _948 = _124 * _946;
        _940 = _948;
    }
    _942 = false;
    float _950 = _940;
    float _952 = _588 * _588;
    float _954 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _956 = fma(_590, _590, _952);
    float _958 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _960 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _962 = fma(_592, _592, _956);
    float _964 = rsqrt(_962);
    float _966 = _964 * _588;
    float _968 = _964 * _590;
    float _970 = _964 * _592;
    float _972 = _966 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[8].y, _972);
    float _976 = fma(_970, (*spvDescriptorSet0.vp_c10)._m0[10].y, _974);
    float _978 = abs(_976);
    bool _980 = _978 > 0.99989998340606689453125;
    float _982 = _976;
    float _984 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_980)
    {
        _920 = 0.001000000047497451305389404296875;
    }
    float _986 = _920;
    if (!_980)
    {
        _922 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _988 = _922;
    float _990 = _988;
    if (!_980)
    {
        _982 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _992 = _982;
    float _994 = _992;
    if (_980)
    {
        float _996 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _990 = _996;
    }
    float _998 = _990;
    if (_980)
    {
        float _1000 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _994 = _1000;
    }
    float _1002 = _994;
    if (!_980)
    {
        _984 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1004 = _984;
    float _1006 = _1004;
    if (_980)
    {
        float _1008 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1006 = _1008;
    }
    float _1010 = _1006;
    float _1012 = -_998;
    float _1014 = _970 * _1012;
    float _1016 = -_1002;
    float _1018 = _966 * _1016;
    float _1020 = in.m_55.x;
    float _1022 = in.m_55.y;
    float _1024 = in.m_55.z;
    float _1026 = -_1002;
    float _1028 = -_1014;
    float _1030 = fma(_968, _1026, _1028);
    float _1032 = -_1010;
    float _1034 = -_1018;
    float _1036 = fma(_970, _1032, _1034);
    float _1038 = -_1010;
    float _1040 = _968 * _1038;
    float _1042 = _1030 * _1030;
    float _1044 = -_998;
    float _1046 = -_1040;
    float _1048 = fma(_966, _1044, _1046);
    float _1050 = fma(_1036, _1036, _1042);
    float _1052 = fma(_1048, _1048, _1050);
    float _1054 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1056 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1054);
    float _1058 = rsqrt(_1052);
    float _1060 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1056);
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1020);
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1022);
    float _1066 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = _954 * _1062;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1024);
    float _1072 = _958 * _1064;
    float _1074 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1076 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1078 = _960 * _1070;
    float _1080 = _1072 * _970;
    float _1082 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1074);
    float _1084 = _1030 * _1058;
    float _1086 = _1036 * _1058;
    float _1088 = _1048 * _1058;
    float _1090 = _1072 * _968;
    float _1092 = _968 * _1084;
    float _1094 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1082);
    float _1096 = fma(_1068, _1088, _1080);
    float _1098 = _966 * _1088;
    float _1100 = -_1092;
    float _1102 = fma(_966, _1086, _1100);
    float _1104 = fma(_1068, _1086, _1090);
    float _1106 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = -_1098;
    float _1110 = fma(_970, _1084, _1108);
    float _1112 = fma(_1078, _1102, _1096);
    float _1114 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1076);
    float _1116 = _970 * _1086;
    float _1118 = fma(_1078, _1110, _1104);
    float _1120 = _1066 + _1112;
    float _1122 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1114);
    float _1124 = -_1116;
    float _1126 = fma(_968, _1088, _1124);
    float _1128 = _1106 + _1118;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1120 + _1130;
    float _1134 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1138 = _1128 + _1136;
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1138, _1138, _1140);
    float _1144 = _1072 * _966;
    float _1146 = sqrt(_1142);
    float _1148 = fma(_1068, _1084, _1144);
    float _1150 = fma(_1078, _1126, _1148);
    float _1152 = _1134 + _1150;
    bool _1154 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1096;
    float _1158 = _1128;
    float _1160 = _1132;
    float _1162 = _1024;
    if (!_1154)
    {
        _426 = _1120;
    }
    float _1164 = _426;
    float _1166 = _1164;
    if (!_1154)
    {
        _1156 = _1152;
    }
    float _1168 = _1156;
    bool _1170 = !_1154;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1146 + _1176;
        float _1180 = rsqrt(_1142);
        float _1182 = _1178 * _1174;
        float _1184 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = _1182 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        float _1196 = fma(_1190, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1198 = _1180 * _1196;
        float _1200 = _1194 + (-1.0);
        float _1202 = fma(_1138, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1204 = fma(_1132, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1206 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1152, _1194, _1206);
        _1172 = _1208;
        _1158 = _1202;
        _1166 = _1204;
    }
    float _1210 = _1172;
    float _1212 = _1158;
    float _1214 = _1166;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1210 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1212 + _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1226 = _1214 + _1224;
    float _1228 = _1218 * _1218;
    float _1230 = fma(_1222, _1222, _1228);
    float _1232 = fma(_1226, _1226, _1230);
    float _1234 = rsqrt(_1232);
    float _1236 = sqrt(_1232);
    float _1238 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1240 = _1222 * _1238;
    float _1242 = _1226 * _1238;
    float _1244 = _1240 * _1240;
    float _1246 = _1242 * _1242;
    float _1248 = _1244 + _1246;
    float _1250 = sqrt(_1248);
    bool _1252 = _1250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1250 + _1254;
    float _1258 = _1230;
    float _1260 = _1248;
    float _1262 = _1256;
    float _1264 = _1240;
    if (_1252)
    {
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1266;
    }
    float _1268 = _1258;
    if (_1252)
    {
        float _1270 = rsqrt(_1248);
        _1260 = _1270;
    }
    float _1272 = _1260;
    float _1274 = _1272;
    if (_1252)
    {
        float _1276 = _1256 * _1268;
        _1262 = _1276;
    }
    float _1278 = _1262;
    if (_1252)
    {
        float _1280 = _1278 * 0.15915493667125701904296875;
        _1160 = _1280;
    }
    float _1282 = _1160;
    float _1284 = _1268;
    float _1286 = _1282;
    if (_1252)
    {
        float _1288 = _1282 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        _1284 = _1290;
    }
    float _1292 = _1284;
    float _1294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1296 = precise::max(0.0, _1294);
    float _1298 = _1138;
    float _1300 = _1296;
    if (_1252)
    {
        float _1302 = _1282 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = -_1238;
    float _1310 = -_1296;
    float _1312 = fma(_1218, _1308, _1310);
    if (_1252)
    {
        float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    float _1318 = _1292;
    float _1320 = _1316;
    if (_1252)
    {
        float _1322 = fma(_1292, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1318 = _1322;
    }
    float _1324 = _1318;
    float _1326 = _1324;
    float _1328 = _1306;
    if (_1252)
    {
        float _1330 = _1306 + (-1.0);
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = 0.0;
    float _1336 = _1332;
    if (_1252)
    {
        float _1338 = _1272 * _1324;
        _1334 = _1338;
    }
    float _1340 = _1334;
    if (!_1252)
    {
        _1326 = _1312;
    }
    float _1342 = _1326;
    float _1344 = _1342;
    if (_1252)
    {
        float _1346 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1346;
    }
    float _1348 = _1286;
    if (_1252)
    {
        float _1350 = _1240 * _1340;
        _1264 = _1350;
    }
    float _1352 = _1264;
    if (!_1252)
    {
        _1336 = _1242;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1252)
    {
        float _1358 = _1242 * _1340;
        _1356 = _1358;
    }
    float _1360 = _1356;
    if (!_1252)
    {
        _1274 = _1244;
    }
    float _1362 = _1274;
    float _1364 = _1362;
    if (_1252)
    {
        float _1366 = fma(_1312, _1306, _1348);
        _1344 = _1366;
    }
    float _1368 = _1344;
    if (_1252)
    {
        float _1370 = _1352 * _1352;
        _1364 = _1370;
    }
    float _1372 = _1364;
    if (!_1252)
    {
        _1328 = _1246;
    }
    float _1374 = _1328;
    float _1376 = _1374;
    if (_1252)
    {
        float _1378 = _1360 * _1360;
        _1376 = _1378;
    }
    float _1380 = _1376;
    float _1382 = fma(_1368, _1368, _1372);
    float _1384 = _1382 + _1380;
    float _1386 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1390 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1388);
    float _1392 = precise::clamp(_1390, 0.0, 1.0);
    float _1394 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1398 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1386);
    float _1400 = rsqrt(_1384);
    float _1402 = -_1392;
    float _1404 = _1402 + 1.0;
    float _1406 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1398);
    float _1410 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1412 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1414 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1418 = abs(_1404);
    float _1420 = log2(_1418);
    float _1422 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1410);
    float _1424 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1426 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1412);
    float _1428 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1434 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1426);
    float _1436 = _1400 * _1352;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1440 = _1400 * _1368;
    float _1442 = _1400 * _1360;
    float _1444 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1438);
    float _1448 = -_1428;
    float _1450 = fma(_1448, _1396, 1.0);
    float _1452 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1454 = -_1444;
    float _1456 = fma(_1440, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1454);
    float _1458 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1446);
    float _1462 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1464 = -_1442;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1456);
    float _1468 = log2(_1450);
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1472 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1474 = fma(_1466, -0.5, 0.5);
    float _1476 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1462);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1472);
    float _1480 = fma(_1466, 0.5, 0.5);
    float _1482 = exp2(_1458);
    float _1484 = _1440 + 1.0;
    float _1486 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1478);
    float _1488 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1490 = fma(_1480, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1492 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1494 = 1.0 / _1470;
    float _1496 = fma(_1480, _1490, -0.212114393711090087890625);
    float _1498 = _1468 * 0.693147182464599609375;
    float _1500 = fma(_1480, _1496, 1.570728778839111328125);
    float _1502 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1504 = sqrt(_1474);
    float _1506 = -_1440;
    float _1508 = fma(_1482, _1484, _1506);
    float _1510 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1486);
    float _1512 = fma(_1508, 0.5, 0.5);
    float _1514 = _1510 * _1494;
    float _1516 = _1492 * _1494;
    float _1518 = fma(_1514, 0.5, 0.5);
    float _1520 = fma(_1516, -0.5, 0.5);
    float _1522 = _1504 * 0.636619746685028076171875;
    float3 _4414 = float3(_1518, _1520, _1502);
    float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4414, float3(0.0), isnan(_4414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4414, float3(0.0), isnan(_4414)), level(0.0)).x;
    float _1526 = -_1500;
    float _1528 = fma(_1522, _1526, 1.0);
    float3 _4430 = float3(_1518, _1520, _1502);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4447 = float2(_1528, _1512);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4447, float2(0.0), isnan(_4447)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4447, float2(0.0), isnan(_4447)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_57.y;
    float _1553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1555 = in.m_51.x;
    float _1557 = in.m_51.y;
    float _1559 = in.m_51.z;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1563 = _1561 != 0;
    float _1565 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1569 = _1567 != 0;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_59.x = _1222;
    out.m_59.y = _1218;
    out.m_59.z = _1226;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1577 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan(0.5);
    bool _1585 = _1581 || _1583;
    float _1587 = 1.0 / _1573;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1591 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1595 = _1593 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1597 = -_1551;
    float _1599 = _1597 + 1.0;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1603 = _1557 > 0.5;
    float _1605 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1575);
    float _1607 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1609 = _1551;
    if (_1563)
    {
        float _1611 = _1603 ? _1599 : _1551;
        _1609 = _1611;
    }
    float _1613 = _1609;
    float _1615 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1589);
    float _1617 = _1599;
    if (_1569)
    {
        float _1619 = in.m_51.x;
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1625 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1629 = 1.0 / _1595;
    float _1631 = -_1623;
    float _1633 = fma(_1607, 2.0, _1631);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1635;
    float _1639 = fma(_1625, -2.0, _1601);
    float _1641 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1627);
    float _1643 = fma(_1591, _1613, -0.5);
    float _1645 = _1637 * _1587;
    float _1647 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1605);
    float _1649 = -_124;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1633);
    float _1653 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1615);
    float _1655 = in.m_57.x;
    bool _1657 = _1022 != 0.0;
    bool _1659 = isnan(_1022);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1673 = _950 + _1671;
    float _1675 = _1647 * (-0.15915493667125701904296875);
    bool _1677 = _1020 == 0.0;
    bool _1679 = !_1665;
    bool _1681 = _1677 && _1679;
    float _1683 = _1669 * _1629;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1687 = _950 + _1685;
    float _1689 = fma(_1645, _1673, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1691 = _1024 == 0.0;
    bool _1693 = _1691 && _1681;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1697 = _1621 > 0.5;
    bool _1699 = _1697 && _1569;
    float _1701 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1639);
    float _1703 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1641);
    float _1705 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = in.m_61.x;
    float _1709 = in.m_61.y;
    float _1711 = in.m_61.z;
    float _1713 = fma(_1683, _1687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1715 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1717 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1719 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1721 = isnan(_950);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    float _1731 = _1675 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1715);
    float _1737 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1717);
    float _1739 = 0.0;
    float _1741 = _1655;
    float _1743 = _1703;
    if (_1569)
    {
        _1739 = _1655;
    }
    float _1745 = _1739;
    float _1747 = -_1729;
    float _1749 = _1747 + 1.0;
    float _1751 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1753 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1755 = isnan(_950);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    bool _1767 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1769 = isnan(_950);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = 1.0 / _1751;
    float _1781 = _1745;
    if (_1699)
    {
        float _1783 = -_1745;
        float _1785 = _1783 + 1.0;
        _1781 = _1785;
    }
    float _1787 = _1781;
    float _1789 = _1763 * _1749;
    float _1791 = -_1763;
    float _1793 = _1791 + 1.0;
    float _1795 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1797 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1569)
    {
        _1741 = _1787;
    }
    float _1799 = _1741;
    float _1801 = _1709;
    float _1803 = _1707;
    float _1805 = _1711;
    if (!_1693)
    {
        float _1807 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = _1795 + _1751;
    float _1813 = _1675 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    if (!_1693)
    {
        float _1817 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1707);
        _1803 = _1817;
    }
    float _1819 = _1803;
    float _1821 = _1777 * _1793;
    if (!_1693)
    {
        float _1823 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1805 = _1823;
    }
    float _1825 = _1805;
    if (!_1585)
    {
        _1162 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1827 = _1162;
    float _1829 = _1811 * _1779;
    float _1831 = _1829 * 0.5;
    float _1833 = _1689 * _1821;
    float _1835 = fma(_1797, _1799, -0.5);
    float _1837 = _1733 * _1643;
    float _1839 = _1827;
    if (!_1585)
    {
        float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1843 = fma(_1831, _1827, _1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = -_1777;
    float _1849 = _1847 + 1.0;
    float _1851 = _970 * _1809;
    float _1853 = _968 * _1809;
    float _1855 = _966 * _1809;
    float _1857 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1833);
    float _1859 = _1815 * _1643;
    float _1861 = -_1837;
    float _1863 = fma(_1815, _1835, _1861);
    float _1865 = fma(_1713, _1789, _1857);
    float _1867 = _1815;
    if (!_1585)
    {
        float _1869 = 1.0 / _1845;
        _1867 = _1869;
    }
    float _1871 = _1867;
    float _1873 = fma(_1733, _1835, _1859);
    float _1875 = fma(_1653, _1863, _1651);
    float _1877 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1865);
    float _1879 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1881 = -_1701;
    float _1883 = fma(_1703, _1873, _1881);
    if (!_1585)
    {
        _1743 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1885 = _1743;
    float _1887 = fma(_1086, _1819, _1853);
    float _1889 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1891 = fma(_1088, _1819, _1851);
    float _1893 = _1877 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1895 = fma(_1084, _1819, _1855);
    float _1897 = exp2(_1565);
    float _1899 = fma(_1110, _1825, _1887);
    float _1901 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1889);
    float _1903 = fma(_1126, _1825, _1895);
    float _1905 = _1871;
    float _1907 = _1885;
    if (!_1585)
    {
        float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1911 = -_1885;
        float _1913 = fma(_1871, _1909, _1911);
        _1905 = _1913;
    }
    float _1915 = _1905;
    if (!_1585)
    {
        float _1917 = -_1885;
        float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1907 = _1919;
    }
    float _1921 = _1907;
    float _1923 = fma(_1102, _1825, _1891);
    float _1925 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _1927 = _1779;
    float _1929 = _1921;
    if (!_1585)
    {
        float _1931 = 1.0 / _1921;
        _1927 = _1931;
    }
    float _1933 = _1927;
    out.m_63.x = _1899;
    out.m_63.y = _1903;
    out.m_63.z = _1923;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1937 = _1925 + _1470;
    float _1939 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1941 = -_1897;
    float _1943 = _1941 + 1.0;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1585)
    {
        _1929 = 1.0;
    }
    float _1947 = _1929;
    float _1949 = _1510 + _1470;
    float _1951 = _1470 * 0.5;
    float _1953 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1955 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1947;
    if (!_1585)
    {
        float _1963 = _1915 * _1933;
        float _1965 = precise::clamp(_1963, 0.0, 1.0);
        _1961 = _1965;
    }
    float _1967 = _1961;
    float _1969 = _1875 + 0.5;
    float _1971 = _1883 + 0.5;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1975 = _1967 > 0.0;
    bool _1977 = isnan(_1967);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(0.0);
    bool _1983 = _1979 || _1981;
    float _1985 = _1937 * 0.5;
    float _1987 = _1949 * 0.5;
    float _1989 = fma(_1492, -0.5, _1951);
    float _1991 = _1973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1953;
    out.m_65.y = _1955;
    out.m_65.z = _1959;
    out.m_65.w = _1893;
    out.m_67.x = _1969;
    out.m_67.y = _1971;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1492;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1470;
    out.m_69.x = _1987;
    out.m_69.y = _1989;
    out.m_69.z = _1985;
    out.m_69.w = _1470;
    out.m_45.x = _1991;
    float _1993 = _1957 * _1524;
    float _1995 = -_1957;
    float _1997 = _1995 + 1.0;
    float _1999 = _1539 * _1993;
    float _2001 = _1539 * _1997;
    float _2003 = _1549 * _1993;
    float _2005 = fma(_1545, _1999, _1533);
    float _2007 = fma(_1547, _1999, _1535);
    float _2009 = fma(_1539, _2003, _1537);
    out.m_71.x = _2005;
    out.m_71.y = _2007;
    out.m_71.z = _2009;
    out.m_71.w = _2001;
    if (_1983)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2011;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _942 = false;
    bool _796 = false;
    bool _616 = false;
    bool _466 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2068 = as_type<float>(_106);
        out.gl_Position.z = _2068;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = 0.0;
    float _130 = 0.0;
    if (_120)
    {
        float _132 = float(_90);
        _126 = _132;
    }
    float _134 = _126;
    bool _136 = _124 >= _134;
    bool _138 = !_120;
    bool _140 = _136 || _138;
    if (_140)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _100;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    float _148 = as_type<float>(_146);
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2138 = as_type<float>(_146);
        out.gl_Position.z = _2138;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
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
        _128 = _212;
        _192 = _222;
        _130 = _210;
    }
    float _224 = _128;
    float _226 = _192;
    float _228 = _130;
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
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _124);
        float _306 = _304 * _298;
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
    float _348 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_334, _150, _342);
    float _354 = -_344;
    float _356 = _340 + _354;
    float _358 = fma(_260, _154, _348);
    float _360 = fma(_334, _154, _350);
    float _362 = -_352;
    float _364 = _346 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_49.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = in.m_42.x;
    float _390 = in.m_42.y;
    float _392 = in.m_42.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_346, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    float _426 = _414;
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
        float _598 = in.m_51.x;
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
    bool _630 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _624 + _642;
    bool _646 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_624);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _664;
    float _684 = _676 * _680;
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _690;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _696 = 1.0 / _660;
    float _698 = _656 * _688;
    float _700 = -_656;
    float _702 = _700 + 1.0;
    float _704 = _644 * _682;
    float _706 = _628 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _712;
    float _716 = fma(_692, _706, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _720 = fma(_714, _706, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _722 = in.m_49.x;
    float _724 = in.m_49.y;
    float _726 = in.m_49.z;
    float _728 = _718 * _698;
    float _730 = _716 * _698;
    float _732 = _720 * _698;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _746 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _748 = fma(_736, _704, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].y, _728);
    float _752 = fma(_740, _704, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_744, _704, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].z, _732);
    float _758 = fma(_748, _684, _750);
    float _760 = fma(_752, _684, _746);
    float _762 = fma(_754, _684, _756);
    float _764 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].y, _758);
    float _766 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].x, _760);
    float _768 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].z, _762);
    float _770 = _764 * _724;
    float _772 = _766 * _722;
    float _774 = _768 * _726;
    bool _776 = !_694;
    float _794;
    if (!_776)
    {
        float _778 = in.m_51.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_90);
        float _800 = 1.0 / _798;
        float _802 = _124 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _808 = _804 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _814 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _816 = isnan(_804);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _830 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _832 = isnan(_804);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _842;
    bool _846 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _848 = isnan(_804);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _812;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _866 = 1.0 / _828;
    float _868 = _844 * _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _874 = -_856;
    float _876 = _874 + 1.0;
    float _878 = fma(_868, _808, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _880 = _840 * _862;
    float _882 = -_840;
    float _884 = _882 + 1.0;
    float _886 = _824 * _876;
    float _888 = _872 * _866;
    float _890 = _878 * _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _894 = _804 + _892;
    float _896 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[115].x, _890);
    float _898 = fma(_888, _894, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _902 = fma(_898, _886, _896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _906 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _910 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[117].x, _902);
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _906;
    out.m_53.y = _912;
    out.m_53.z = _914;
    out.m_53.w = _916;
    bool _918 = !_864;
    float _920 = _908;
    float _922 = _912;
    float _940;
    if (!_918)
    {
        float _924 = in.m_51.x;
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _928 = _924 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _932 = _930 * _926;
        float _934 = floor(_932);
        float _936 = -_934;
        float _938 = _932 + _936;
        _940 = _938;
        _942 = true;
    }
    else
    {
        float _944 = float(_90);
        float _946 = 1.0 / _944;
        float _948 = _124 * _946;
        _940 = _948;
    }
    _942 = false;
    float _950 = _940;
    float _952 = _588 * _588;
    float _954 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _956 = fma(_590, _590, _952);
    float _958 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _960 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _962 = fma(_592, _592, _956);
    float _964 = rsqrt(_962);
    float _966 = _964 * _588;
    float _968 = _964 * _590;
    float _970 = _964 * _592;
    float _972 = _966 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[8].y, _972);
    float _976 = fma(_970, (*spvDescriptorSet0.vp_c10)._m0[10].y, _974);
    float _978 = abs(_976);
    bool _980 = _978 > 0.99989998340606689453125;
    float _982 = _976;
    float _984 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_980)
    {
        _920 = 0.001000000047497451305389404296875;
    }
    float _986 = _920;
    if (!_980)
    {
        _922 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _988 = _922;
    float _990 = _988;
    if (!_980)
    {
        _982 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _992 = _982;
    float _994 = _992;
    if (_980)
    {
        float _996 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _990 = _996;
    }
    float _998 = _990;
    if (_980)
    {
        float _1000 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _994 = _1000;
    }
    float _1002 = _994;
    if (!_980)
    {
        _984 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1004 = _984;
    float _1006 = _1004;
    if (_980)
    {
        float _1008 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1006 = _1008;
    }
    float _1010 = _1006;
    float _1012 = -_998;
    float _1014 = _970 * _1012;
    float _1016 = -_1002;
    float _1018 = _966 * _1016;
    float _1020 = in.m_55.x;
    float _1022 = in.m_55.y;
    float _1024 = in.m_55.z;
    float _1026 = -_1002;
    float _1028 = -_1014;
    float _1030 = fma(_968, _1026, _1028);
    float _1032 = -_1010;
    float _1034 = -_1018;
    float _1036 = fma(_970, _1032, _1034);
    float _1038 = -_1010;
    float _1040 = _968 * _1038;
    float _1042 = _1030 * _1030;
    float _1044 = -_998;
    float _1046 = -_1040;
    float _1048 = fma(_966, _1044, _1046);
    float _1050 = fma(_1036, _1036, _1042);
    float _1052 = fma(_1048, _1048, _1050);
    float _1054 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1056 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1054);
    float _1058 = rsqrt(_1052);
    float _1060 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1056);
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1020);
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1022);
    float _1066 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = _954 * _1062;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1024);
    float _1072 = _958 * _1064;
    float _1074 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1076 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1078 = _960 * _1070;
    float _1080 = _1072 * _970;
    float _1082 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1074);
    float _1084 = _1030 * _1058;
    float _1086 = _1036 * _1058;
    float _1088 = _1048 * _1058;
    float _1090 = _1072 * _968;
    float _1092 = _968 * _1084;
    float _1094 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1082);
    float _1096 = fma(_1068, _1088, _1080);
    float _1098 = _966 * _1088;
    float _1100 = -_1092;
    float _1102 = fma(_966, _1086, _1100);
    float _1104 = fma(_1068, _1086, _1090);
    float _1106 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = -_1098;
    float _1110 = fma(_970, _1084, _1108);
    float _1112 = fma(_1078, _1102, _1096);
    float _1114 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1076);
    float _1116 = _970 * _1086;
    float _1118 = fma(_1078, _1110, _1104);
    float _1120 = _1066 + _1112;
    float _1122 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1114);
    float _1124 = -_1116;
    float _1126 = fma(_968, _1088, _1124);
    float _1128 = _1106 + _1118;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1120 + _1130;
    float _1134 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1138 = _1128 + _1136;
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1138, _1138, _1140);
    float _1144 = _1072 * _966;
    float _1146 = sqrt(_1142);
    float _1148 = fma(_1068, _1084, _1144);
    float _1150 = fma(_1078, _1126, _1148);
    float _1152 = _1134 + _1150;
    bool _1154 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1096;
    float _1158 = _1128;
    float _1160 = _1132;
    float _1162 = _1024;
    if (!_1154)
    {
        _426 = _1120;
    }
    float _1164 = _426;
    float _1166 = _1164;
    if (!_1154)
    {
        _1156 = _1152;
    }
    float _1168 = _1156;
    bool _1170 = !_1154;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1146 + _1176;
        float _1180 = rsqrt(_1142);
        float _1182 = _1178 * _1174;
        float _1184 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = _1182 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        float _1196 = fma(_1190, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1198 = _1180 * _1196;
        float _1200 = _1194 + (-1.0);
        float _1202 = fma(_1138, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1204 = fma(_1132, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1206 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1152, _1194, _1206);
        _1172 = _1208;
        _1158 = _1202;
        _1166 = _1204;
    }
    float _1210 = _1172;
    float _1212 = _1158;
    float _1214 = _1166;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1210 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1212 + _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1226 = _1214 + _1224;
    float _1228 = _1218 * _1218;
    float _1230 = fma(_1222, _1222, _1228);
    float _1232 = fma(_1226, _1226, _1230);
    float _1234 = rsqrt(_1232);
    float _1236 = sqrt(_1232);
    float _1238 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1240 = _1222 * _1238;
    float _1242 = _1226 * _1238;
    float _1244 = _1240 * _1240;
    float _1246 = _1242 * _1242;
    float _1248 = _1244 + _1246;
    float _1250 = sqrt(_1248);
    bool _1252 = _1250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1250 + _1254;
    float _1258 = _1230;
    float _1260 = _1248;
    float _1262 = _1256;
    float _1264 = _1240;
    if (_1252)
    {
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1266;
    }
    float _1268 = _1258;
    if (_1252)
    {
        float _1270 = rsqrt(_1248);
        _1260 = _1270;
    }
    float _1272 = _1260;
    float _1274 = _1272;
    if (_1252)
    {
        float _1276 = _1256 * _1268;
        _1262 = _1276;
    }
    float _1278 = _1262;
    if (_1252)
    {
        float _1280 = _1278 * 0.15915493667125701904296875;
        _1160 = _1280;
    }
    float _1282 = _1160;
    float _1284 = _1268;
    float _1286 = _1282;
    if (_1252)
    {
        float _1288 = _1282 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        _1284 = _1290;
    }
    float _1292 = _1284;
    float _1294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1296 = precise::max(0.0, _1294);
    float _1298 = _1138;
    float _1300 = _1296;
    if (_1252)
    {
        float _1302 = _1282 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = -_1238;
    float _1310 = -_1296;
    float _1312 = fma(_1218, _1308, _1310);
    if (_1252)
    {
        float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    float _1318 = _1292;
    float _1320 = _1316;
    if (_1252)
    {
        float _1322 = fma(_1292, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1318 = _1322;
    }
    float _1324 = _1318;
    float _1326 = _1324;
    float _1328 = _1306;
    if (_1252)
    {
        float _1330 = _1306 + (-1.0);
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = 0.0;
    float _1336 = _1332;
    if (_1252)
    {
        float _1338 = _1272 * _1324;
        _1334 = _1338;
    }
    float _1340 = _1334;
    if (!_1252)
    {
        _1326 = _1312;
    }
    float _1342 = _1326;
    float _1344 = _1342;
    if (_1252)
    {
        float _1346 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1346;
    }
    float _1348 = _1286;
    if (_1252)
    {
        float _1350 = _1240 * _1340;
        _1264 = _1350;
    }
    float _1352 = _1264;
    if (!_1252)
    {
        _1336 = _1242;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1252)
    {
        float _1358 = _1242 * _1340;
        _1356 = _1358;
    }
    float _1360 = _1356;
    if (!_1252)
    {
        _1274 = _1244;
    }
    float _1362 = _1274;
    float _1364 = _1362;
    if (_1252)
    {
        float _1366 = fma(_1312, _1306, _1348);
        _1344 = _1366;
    }
    float _1368 = _1344;
    if (_1252)
    {
        float _1370 = _1352 * _1352;
        _1364 = _1370;
    }
    float _1372 = _1364;
    if (!_1252)
    {
        _1328 = _1246;
    }
    float _1374 = _1328;
    float _1376 = _1374;
    if (_1252)
    {
        float _1378 = _1360 * _1360;
        _1376 = _1378;
    }
    float _1380 = _1376;
    float _1382 = fma(_1368, _1368, _1372);
    float _1384 = _1382 + _1380;
    float _1386 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1390 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1388);
    float _1392 = precise::clamp(_1390, 0.0, 1.0);
    float _1394 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1398 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1386);
    float _1400 = rsqrt(_1384);
    float _1402 = -_1392;
    float _1404 = _1402 + 1.0;
    float _1406 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1398);
    float _1410 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1412 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1414 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1418 = abs(_1404);
    float _1420 = log2(_1418);
    float _1422 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1410);
    float _1424 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1426 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1412);
    float _1428 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1434 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1426);
    float _1436 = _1400 * _1352;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1440 = _1400 * _1368;
    float _1442 = _1400 * _1360;
    float _1444 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1438);
    float _1448 = -_1428;
    float _1450 = fma(_1448, _1396, 1.0);
    float _1452 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1454 = -_1444;
    float _1456 = fma(_1440, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1454);
    float _1458 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1446);
    float _1462 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1464 = -_1442;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1456);
    float _1468 = log2(_1450);
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1472 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1474 = fma(_1466, -0.5, 0.5);
    float _1476 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1462);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1472);
    float _1480 = fma(_1466, 0.5, 0.5);
    float _1482 = exp2(_1458);
    float _1484 = _1440 + 1.0;
    float _1486 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1478);
    float _1488 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1490 = fma(_1480, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1492 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1494 = 1.0 / _1470;
    float _1496 = fma(_1480, _1490, -0.212114393711090087890625);
    float _1498 = _1468 * 0.693147182464599609375;
    float _1500 = fma(_1480, _1496, 1.570728778839111328125);
    float _1502 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1504 = sqrt(_1474);
    float _1506 = -_1440;
    float _1508 = fma(_1482, _1484, _1506);
    float _1510 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1486);
    float _1512 = fma(_1508, 0.5, 0.5);
    float _1514 = _1510 * _1494;
    float _1516 = _1492 * _1494;
    float _1518 = fma(_1514, 0.5, 0.5);
    float _1520 = fma(_1516, -0.5, 0.5);
    float _1522 = _1504 * 0.636619746685028076171875;
    float3 _4414 = float3(_1518, _1520, _1502);
    float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4414, float3(0.0), isnan(_4414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4414, float3(0.0), isnan(_4414)), level(0.0)).x;
    float _1526 = -_1500;
    float _1528 = fma(_1522, _1526, 1.0);
    float3 _4430 = float3(_1518, _1520, _1502);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4447 = float2(_1528, _1512);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4447, float2(0.0), isnan(_4447)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4447, float2(0.0), isnan(_4447)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_57.y;
    float _1553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1555 = in.m_51.x;
    float _1557 = in.m_51.y;
    float _1559 = in.m_51.z;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1563 = _1561 != 0;
    float _1565 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1569 = _1567 != 0;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_59.x = _1222;
    out.m_59.y = _1218;
    out.m_59.z = _1226;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1577 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan(0.5);
    bool _1585 = _1581 || _1583;
    float _1587 = 1.0 / _1573;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1591 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1595 = _1593 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1597 = -_1551;
    float _1599 = _1597 + 1.0;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1603 = _1557 > 0.5;
    float _1605 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1575);
    float _1607 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1609 = _1551;
    if (_1563)
    {
        float _1611 = _1603 ? _1599 : _1551;
        _1609 = _1611;
    }
    float _1613 = _1609;
    float _1615 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1589);
    float _1617 = _1599;
    if (_1569)
    {
        float _1619 = in.m_51.x;
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1625 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1629 = 1.0 / _1595;
    float _1631 = -_1623;
    float _1633 = fma(_1607, 2.0, _1631);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1635;
    float _1639 = fma(_1625, -2.0, _1601);
    float _1641 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1627);
    float _1643 = fma(_1591, _1613, -0.5);
    float _1645 = _1637 * _1587;
    float _1647 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1605);
    float _1649 = -_124;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1633);
    float _1653 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1615);
    float _1655 = in.m_57.x;
    bool _1657 = _1022 != 0.0;
    bool _1659 = isnan(_1022);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1673 = _950 + _1671;
    float _1675 = _1647 * (-0.15915493667125701904296875);
    bool _1677 = _1020 == 0.0;
    bool _1679 = !_1665;
    bool _1681 = _1677 && _1679;
    float _1683 = _1669 * _1629;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1687 = _950 + _1685;
    float _1689 = fma(_1645, _1673, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1691 = _1024 == 0.0;
    bool _1693 = _1691 && _1681;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1697 = _1621 > 0.5;
    bool _1699 = _1697 && _1569;
    float _1701 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1639);
    float _1703 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1641);
    float _1705 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = in.m_61.x;
    float _1709 = in.m_61.y;
    float _1711 = in.m_61.z;
    float _1713 = fma(_1683, _1687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1715 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1717 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1719 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1721 = isnan(_950);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    float _1731 = _1675 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1715);
    float _1737 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1717);
    float _1739 = 0.0;
    float _1741 = _1655;
    float _1743 = _1703;
    if (_1569)
    {
        _1739 = _1655;
    }
    float _1745 = _1739;
    float _1747 = -_1729;
    float _1749 = _1747 + 1.0;
    float _1751 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1753 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1755 = isnan(_950);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    bool _1767 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1769 = isnan(_950);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = 1.0 / _1751;
    float _1781 = _1745;
    if (_1699)
    {
        float _1783 = -_1745;
        float _1785 = _1783 + 1.0;
        _1781 = _1785;
    }
    float _1787 = _1781;
    float _1789 = _1763 * _1749;
    float _1791 = -_1763;
    float _1793 = _1791 + 1.0;
    float _1795 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1797 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1569)
    {
        _1741 = _1787;
    }
    float _1799 = _1741;
    float _1801 = _1709;
    float _1803 = _1707;
    float _1805 = _1711;
    if (!_1693)
    {
        float _1807 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = _1795 + _1751;
    float _1813 = _1675 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    if (!_1693)
    {
        float _1817 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1707);
        _1803 = _1817;
    }
    float _1819 = _1803;
    float _1821 = _1777 * _1793;
    if (!_1693)
    {
        float _1823 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1805 = _1823;
    }
    float _1825 = _1805;
    if (!_1585)
    {
        _1162 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1827 = _1162;
    float _1829 = _1811 * _1779;
    float _1831 = _1829 * 0.5;
    float _1833 = _1689 * _1821;
    float _1835 = fma(_1797, _1799, -0.5);
    float _1837 = _1733 * _1643;
    float _1839 = _1827;
    if (!_1585)
    {
        float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1843 = fma(_1831, _1827, _1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = -_1777;
    float _1849 = _1847 + 1.0;
    float _1851 = _970 * _1809;
    float _1853 = _968 * _1809;
    float _1855 = _966 * _1809;
    float _1857 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1833);
    float _1859 = _1815 * _1643;
    float _1861 = -_1837;
    float _1863 = fma(_1815, _1835, _1861);
    float _1865 = fma(_1713, _1789, _1857);
    float _1867 = _1815;
    if (!_1585)
    {
        float _1869 = 1.0 / _1845;
        _1867 = _1869;
    }
    float _1871 = _1867;
    float _1873 = fma(_1733, _1835, _1859);
    float _1875 = fma(_1653, _1863, _1651);
    float _1877 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1865);
    float _1879 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1881 = -_1701;
    float _1883 = fma(_1703, _1873, _1881);
    if (!_1585)
    {
        _1743 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1885 = _1743;
    float _1887 = fma(_1086, _1819, _1853);
    float _1889 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1891 = fma(_1088, _1819, _1851);
    float _1893 = _1877 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1895 = fma(_1084, _1819, _1855);
    float _1897 = exp2(_1565);
    float _1899 = fma(_1110, _1825, _1887);
    float _1901 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1889);
    float _1903 = fma(_1126, _1825, _1895);
    float _1905 = _1871;
    float _1907 = _1885;
    if (!_1585)
    {
        float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1911 = -_1885;
        float _1913 = fma(_1871, _1909, _1911);
        _1905 = _1913;
    }
    float _1915 = _1905;
    if (!_1585)
    {
        float _1917 = -_1885;
        float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1907 = _1919;
    }
    float _1921 = _1907;
    float _1923 = fma(_1102, _1825, _1891);
    float _1925 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _1927 = _1779;
    float _1929 = _1921;
    if (!_1585)
    {
        float _1931 = 1.0 / _1921;
        _1927 = _1931;
    }
    float _1933 = _1927;
    out.m_63.x = _1899;
    out.m_63.y = _1903;
    out.m_63.z = _1923;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1937 = _1925 + _1470;
    float _1939 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1941 = -_1897;
    float _1943 = _1941 + 1.0;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1585)
    {
        _1929 = 1.0;
    }
    float _1947 = _1929;
    float _1949 = _1510 + _1470;
    float _1951 = _1470 * 0.5;
    float _1953 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1955 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1947;
    if (!_1585)
    {
        float _1963 = _1915 * _1933;
        float _1965 = precise::clamp(_1963, 0.0, 1.0);
        _1961 = _1965;
    }
    float _1967 = _1961;
    float _1969 = _1875 + 0.5;
    float _1971 = _1883 + 0.5;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1975 = _1967 > 0.0;
    bool _1977 = isnan(_1967);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(0.0);
    bool _1983 = _1979 || _1981;
    float _1985 = _1937 * 0.5;
    float _1987 = _1949 * 0.5;
    float _1989 = fma(_1492, -0.5, _1951);
    float _1991 = _1973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1953;
    out.m_65.y = _1955;
    out.m_65.z = _1959;
    out.m_65.w = _1893;
    out.m_67.x = _1969;
    out.m_67.y = _1971;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1492;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1470;
    out.m_69.x = _1987;
    out.m_69.y = _1989;
    out.m_69.z = _1985;
    out.m_69.w = _1470;
    out.m_45.x = _1991;
    float _1993 = _1957 * _1524;
    float _1995 = -_1957;
    float _1997 = _1995 + 1.0;
    float _1999 = _1539 * _1993;
    float _2001 = _1539 * _1997;
    float _2003 = _1549 * _1993;
    float _2005 = fma(_1545, _1999, _1533);
    float _2007 = fma(_1547, _1999, _1535);
    float _2009 = fma(_1539, _2003, _1537);
    out.m_71.x = _2005;
    out.m_71.y = _2007;
    out.m_71.z = _2009;
    out.m_71.w = _2001;
    if (_1983)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2011;
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
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _942 = false;
    bool _796 = false;
    bool _616 = false;
    bool _466 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2068 = as_type<float>(_106);
        out.gl_Position.z = _2068;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = 0.0;
    float _130 = 0.0;
    if (_120)
    {
        float _132 = float(_90);
        _126 = _132;
    }
    float _134 = _126;
    bool _136 = _124 >= _134;
    bool _138 = !_120;
    bool _140 = _136 || _138;
    if (_140)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _100;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    float _148 = as_type<float>(_146);
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2138 = as_type<float>(_146);
        out.gl_Position.z = _2138;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
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
        _128 = _212;
        _192 = _222;
        _130 = _210;
    }
    float _224 = _128;
    float _226 = _192;
    float _228 = _130;
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
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _124);
        float _306 = _304 * _298;
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
    float _348 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_334, _150, _342);
    float _354 = -_344;
    float _356 = _340 + _354;
    float _358 = fma(_260, _154, _348);
    float _360 = fma(_334, _154, _350);
    float _362 = -_352;
    float _364 = _346 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_49.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _388 = in.m_42.x;
    float _390 = in.m_42.y;
    float _392 = in.m_42.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _386);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_346, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    float _426 = _414;
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
        float _598 = in.m_51.x;
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
    bool _630 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _624 + _642;
    bool _646 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_624);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _664;
    float _684 = _676 * _680;
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _690;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _696 = 1.0 / _660;
    float _698 = _656 * _688;
    float _700 = -_656;
    float _702 = _700 + 1.0;
    float _704 = _644 * _682;
    float _706 = _628 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _712;
    float _716 = fma(_692, _706, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _720 = fma(_714, _706, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _722 = in.m_49.x;
    float _724 = in.m_49.y;
    float _726 = in.m_49.z;
    float _728 = _718 * _698;
    float _730 = _716 * _698;
    float _732 = _720 * _698;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _746 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].x, _730);
    float _748 = fma(_736, _704, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].y, _728);
    float _752 = fma(_740, _704, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _754 = fma(_744, _704, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _756 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].z, _732);
    float _758 = fma(_748, _684, _750);
    float _760 = fma(_752, _684, _746);
    float _762 = fma(_754, _684, _756);
    float _764 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].y, _758);
    float _766 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].x, _760);
    float _768 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[145].z, _762);
    float _770 = _764 * _724;
    float _772 = _766 * _722;
    float _774 = _768 * _726;
    bool _776 = !_694;
    float _794;
    if (!_776)
    {
        float _778 = in.m_51.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_90);
        float _800 = 1.0 / _798;
        float _802 = _124 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _808 = _804 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _814 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _816 = isnan(_804);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _830 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _832 = isnan(_804);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _842;
    bool _846 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _848 = isnan(_804);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _812;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _866 = 1.0 / _828;
    float _868 = _844 * _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _874 = -_856;
    float _876 = _874 + 1.0;
    float _878 = fma(_868, _808, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _880 = _840 * _862;
    float _882 = -_840;
    float _884 = _882 + 1.0;
    float _886 = _824 * _876;
    float _888 = _872 * _866;
    float _890 = _878 * _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _894 = _804 + _892;
    float _896 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[115].x, _890);
    float _898 = fma(_888, _894, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _902 = fma(_898, _886, _896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _906 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _910 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[117].x, _902);
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _910 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _906;
    out.m_53.y = _912;
    out.m_53.z = _914;
    out.m_53.w = _916;
    bool _918 = !_864;
    float _920 = _908;
    float _922 = _912;
    float _940;
    if (!_918)
    {
        float _924 = in.m_51.x;
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _928 = _924 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _932 = _930 * _926;
        float _934 = floor(_932);
        float _936 = -_934;
        float _938 = _932 + _936;
        _940 = _938;
        _942 = true;
    }
    else
    {
        float _944 = float(_90);
        float _946 = 1.0 / _944;
        float _948 = _124 * _946;
        _940 = _948;
    }
    _942 = false;
    float _950 = _940;
    float _952 = _588 * _588;
    float _954 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _956 = fma(_590, _590, _952);
    float _958 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _960 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _962 = fma(_592, _592, _956);
    float _964 = rsqrt(_962);
    float _966 = _964 * _588;
    float _968 = _964 * _590;
    float _970 = _964 * _592;
    float _972 = _966 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[8].y, _972);
    float _976 = fma(_970, (*spvDescriptorSet0.vp_c10)._m0[10].y, _974);
    float _978 = abs(_976);
    bool _980 = _978 > 0.99989998340606689453125;
    float _982 = _976;
    float _984 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_980)
    {
        _920 = 0.001000000047497451305389404296875;
    }
    float _986 = _920;
    if (!_980)
    {
        _922 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _988 = _922;
    float _990 = _988;
    if (!_980)
    {
        _982 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _992 = _982;
    float _994 = _992;
    if (_980)
    {
        float _996 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _990 = _996;
    }
    float _998 = _990;
    if (_980)
    {
        float _1000 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _994 = _1000;
    }
    float _1002 = _994;
    if (!_980)
    {
        _984 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1004 = _984;
    float _1006 = _1004;
    if (_980)
    {
        float _1008 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1006 = _1008;
    }
    float _1010 = _1006;
    float _1012 = -_998;
    float _1014 = _970 * _1012;
    float _1016 = -_1002;
    float _1018 = _966 * _1016;
    float _1020 = in.m_55.x;
    float _1022 = in.m_55.y;
    float _1024 = in.m_55.z;
    float _1026 = -_1002;
    float _1028 = -_1014;
    float _1030 = fma(_968, _1026, _1028);
    float _1032 = -_1010;
    float _1034 = -_1018;
    float _1036 = fma(_970, _1032, _1034);
    float _1038 = -_1010;
    float _1040 = _968 * _1038;
    float _1042 = _1030 * _1030;
    float _1044 = -_998;
    float _1046 = -_1040;
    float _1048 = fma(_966, _1044, _1046);
    float _1050 = fma(_1036, _1036, _1042);
    float _1052 = fma(_1048, _1048, _1050);
    float _1054 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1056 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1054);
    float _1058 = rsqrt(_1052);
    float _1060 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1056);
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1020);
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1022);
    float _1066 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = _954 * _1062;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1024);
    float _1072 = _958 * _1064;
    float _1074 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1076 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1078 = _960 * _1070;
    float _1080 = _1072 * _970;
    float _1082 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1074);
    float _1084 = _1030 * _1058;
    float _1086 = _1036 * _1058;
    float _1088 = _1048 * _1058;
    float _1090 = _1072 * _968;
    float _1092 = _968 * _1084;
    float _1094 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1082);
    float _1096 = fma(_1068, _1088, _1080);
    float _1098 = _966 * _1088;
    float _1100 = -_1092;
    float _1102 = fma(_966, _1086, _1100);
    float _1104 = fma(_1068, _1086, _1090);
    float _1106 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = -_1098;
    float _1110 = fma(_970, _1084, _1108);
    float _1112 = fma(_1078, _1102, _1096);
    float _1114 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1076);
    float _1116 = _970 * _1086;
    float _1118 = fma(_1078, _1110, _1104);
    float _1120 = _1066 + _1112;
    float _1122 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1114);
    float _1124 = -_1116;
    float _1126 = fma(_968, _1088, _1124);
    float _1128 = _1106 + _1118;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1120 + _1130;
    float _1134 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1138 = _1128 + _1136;
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1138, _1138, _1140);
    float _1144 = _1072 * _966;
    float _1146 = sqrt(_1142);
    float _1148 = fma(_1068, _1084, _1144);
    float _1150 = fma(_1078, _1126, _1148);
    float _1152 = _1134 + _1150;
    bool _1154 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1096;
    float _1158 = _1128;
    float _1160 = _1132;
    float _1162 = _1024;
    if (!_1154)
    {
        _426 = _1120;
    }
    float _1164 = _426;
    float _1166 = _1164;
    if (!_1154)
    {
        _1156 = _1152;
    }
    float _1168 = _1156;
    bool _1170 = !_1154;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1146 + _1176;
        float _1180 = rsqrt(_1142);
        float _1182 = _1178 * _1174;
        float _1184 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = _1182 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = cos(_1192);
        float _1196 = fma(_1190, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1198 = _1180 * _1196;
        float _1200 = _1194 + (-1.0);
        float _1202 = fma(_1138, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1204 = fma(_1132, _1198, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1206 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = fma(_1152, _1194, _1206);
        _1172 = _1208;
        _1158 = _1202;
        _1166 = _1204;
    }
    float _1210 = _1172;
    float _1212 = _1158;
    float _1214 = _1166;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1210 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1212 + _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1226 = _1214 + _1224;
    float _1228 = _1218 * _1218;
    float _1230 = fma(_1222, _1222, _1228);
    float _1232 = fma(_1226, _1226, _1230);
    float _1234 = rsqrt(_1232);
    float _1236 = sqrt(_1232);
    float _1238 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1240 = _1222 * _1238;
    float _1242 = _1226 * _1238;
    float _1244 = _1240 * _1240;
    float _1246 = _1242 * _1242;
    float _1248 = _1244 + _1246;
    float _1250 = sqrt(_1248);
    bool _1252 = _1250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = _1250 + _1254;
    float _1258 = _1230;
    float _1260 = _1248;
    float _1262 = _1256;
    float _1264 = _1240;
    if (_1252)
    {
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1266;
    }
    float _1268 = _1258;
    if (_1252)
    {
        float _1270 = rsqrt(_1248);
        _1260 = _1270;
    }
    float _1272 = _1260;
    float _1274 = _1272;
    if (_1252)
    {
        float _1276 = _1256 * _1268;
        _1262 = _1276;
    }
    float _1278 = _1262;
    if (_1252)
    {
        float _1280 = _1278 * 0.15915493667125701904296875;
        _1160 = _1280;
    }
    float _1282 = _1160;
    float _1284 = _1268;
    float _1286 = _1282;
    if (_1252)
    {
        float _1288 = _1282 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        _1284 = _1290;
    }
    float _1292 = _1284;
    float _1294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1296 = precise::max(0.0, _1294);
    float _1298 = _1138;
    float _1300 = _1296;
    if (_1252)
    {
        float _1302 = _1282 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = -_1238;
    float _1310 = -_1296;
    float _1312 = fma(_1218, _1308, _1310);
    if (_1252)
    {
        float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    float _1318 = _1292;
    float _1320 = _1316;
    if (_1252)
    {
        float _1322 = fma(_1292, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1318 = _1322;
    }
    float _1324 = _1318;
    float _1326 = _1324;
    float _1328 = _1306;
    if (_1252)
    {
        float _1330 = _1306 + (-1.0);
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = 0.0;
    float _1336 = _1332;
    if (_1252)
    {
        float _1338 = _1272 * _1324;
        _1334 = _1338;
    }
    float _1340 = _1334;
    if (!_1252)
    {
        _1326 = _1312;
    }
    float _1342 = _1326;
    float _1344 = _1342;
    if (_1252)
    {
        float _1346 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1346;
    }
    float _1348 = _1286;
    if (_1252)
    {
        float _1350 = _1240 * _1340;
        _1264 = _1350;
    }
    float _1352 = _1264;
    if (!_1252)
    {
        _1336 = _1242;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1252)
    {
        float _1358 = _1242 * _1340;
        _1356 = _1358;
    }
    float _1360 = _1356;
    if (!_1252)
    {
        _1274 = _1244;
    }
    float _1362 = _1274;
    float _1364 = _1362;
    if (_1252)
    {
        float _1366 = fma(_1312, _1306, _1348);
        _1344 = _1366;
    }
    float _1368 = _1344;
    if (_1252)
    {
        float _1370 = _1352 * _1352;
        _1364 = _1370;
    }
    float _1372 = _1364;
    if (!_1252)
    {
        _1328 = _1246;
    }
    float _1374 = _1328;
    float _1376 = _1374;
    if (_1252)
    {
        float _1378 = _1360 * _1360;
        _1376 = _1378;
    }
    float _1380 = _1376;
    float _1382 = fma(_1368, _1368, _1372);
    float _1384 = _1382 + _1380;
    float _1386 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1390 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1388);
    float _1392 = precise::clamp(_1390, 0.0, 1.0);
    float _1394 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1398 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1386);
    float _1400 = rsqrt(_1384);
    float _1402 = -_1392;
    float _1404 = _1402 + 1.0;
    float _1406 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1398);
    float _1410 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1412 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1414 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1418 = abs(_1404);
    float _1420 = log2(_1418);
    float _1422 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1410);
    float _1424 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1426 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1412);
    float _1428 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1434 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1426);
    float _1436 = _1400 * _1352;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1440 = _1400 * _1368;
    float _1442 = _1400 * _1360;
    float _1444 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1438);
    float _1448 = -_1428;
    float _1450 = fma(_1448, _1396, 1.0);
    float _1452 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1454 = -_1444;
    float _1456 = fma(_1440, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1454);
    float _1458 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1446);
    float _1462 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1464 = -_1442;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1456);
    float _1468 = log2(_1450);
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1472 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1474 = fma(_1466, -0.5, 0.5);
    float _1476 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1462);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1472);
    float _1480 = fma(_1466, 0.5, 0.5);
    float _1482 = exp2(_1458);
    float _1484 = _1440 + 1.0;
    float _1486 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1478);
    float _1488 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1490 = fma(_1480, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1492 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1494 = 1.0 / _1470;
    float _1496 = fma(_1480, _1490, -0.212114393711090087890625);
    float _1498 = _1468 * 0.693147182464599609375;
    float _1500 = fma(_1480, _1496, 1.570728778839111328125);
    float _1502 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1504 = sqrt(_1474);
    float _1506 = -_1440;
    float _1508 = fma(_1482, _1484, _1506);
    float _1510 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1486);
    float _1512 = fma(_1508, 0.5, 0.5);
    float _1514 = _1510 * _1494;
    float _1516 = _1492 * _1494;
    float _1518 = fma(_1514, 0.5, 0.5);
    float _1520 = fma(_1516, -0.5, 0.5);
    float _1522 = _1504 * 0.636619746685028076171875;
    float3 _4414 = float3(_1518, _1520, _1502);
    float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4414, float3(0.0), isnan(_4414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4414, float3(0.0), isnan(_4414)), level(0.0)).x;
    float _1526 = -_1500;
    float _1528 = fma(_1522, _1526, 1.0);
    float3 _4430 = float3(_1518, _1520, _1502);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4447 = float2(_1528, _1512);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4447, float2(0.0), isnan(_4447)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4447, float2(0.0), isnan(_4447)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_57.y;
    float _1553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1555 = in.m_51.x;
    float _1557 = in.m_51.y;
    float _1559 = in.m_51.z;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1563 = _1561 != 0;
    float _1565 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1569 = _1567 != 0;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_59.x = _1222;
    out.m_59.y = _1218;
    out.m_59.z = _1226;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1577 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan(0.5);
    bool _1585 = _1581 || _1583;
    float _1587 = 1.0 / _1573;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1591 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1595 = _1593 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1597 = -_1551;
    float _1599 = _1597 + 1.0;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1603 = _1557 > 0.5;
    float _1605 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1575);
    float _1607 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1609 = _1551;
    if (_1563)
    {
        float _1611 = _1603 ? _1599 : _1551;
        _1609 = _1611;
    }
    float _1613 = _1609;
    float _1615 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1589);
    float _1617 = _1599;
    if (_1569)
    {
        float _1619 = in.m_51.x;
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1625 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1629 = 1.0 / _1595;
    float _1631 = -_1623;
    float _1633 = fma(_1607, 2.0, _1631);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1635;
    float _1639 = fma(_1625, -2.0, _1601);
    float _1641 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1627);
    float _1643 = fma(_1591, _1613, -0.5);
    float _1645 = _1637 * _1587;
    float _1647 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1605);
    float _1649 = -_124;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1633);
    float _1653 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1615);
    float _1655 = in.m_57.x;
    bool _1657 = _1022 != 0.0;
    bool _1659 = isnan(_1022);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1673 = _950 + _1671;
    float _1675 = _1647 * (-0.15915493667125701904296875);
    bool _1677 = _1020 == 0.0;
    bool _1679 = !_1665;
    bool _1681 = _1677 && _1679;
    float _1683 = _1669 * _1629;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1687 = _950 + _1685;
    float _1689 = fma(_1645, _1673, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1691 = _1024 == 0.0;
    bool _1693 = _1691 && _1681;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1697 = _1621 > 0.5;
    bool _1699 = _1697 && _1569;
    float _1701 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1639);
    float _1703 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1641);
    float _1705 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = in.m_61.x;
    float _1709 = in.m_61.y;
    float _1711 = in.m_61.z;
    float _1713 = fma(_1683, _1687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1715 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1717 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1719 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1721 = isnan(_950);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    float _1731 = _1675 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1715);
    float _1737 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1717);
    float _1739 = 0.0;
    float _1741 = _1655;
    float _1743 = _1703;
    if (_1569)
    {
        _1739 = _1655;
    }
    float _1745 = _1739;
    float _1747 = -_1729;
    float _1749 = _1747 + 1.0;
    float _1751 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1753 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1755 = isnan(_950);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    bool _1767 = _950 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1769 = isnan(_950);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = 1.0 / _1751;
    float _1781 = _1745;
    if (_1699)
    {
        float _1783 = -_1745;
        float _1785 = _1783 + 1.0;
        _1781 = _1785;
    }
    float _1787 = _1781;
    float _1789 = _1763 * _1749;
    float _1791 = -_1763;
    float _1793 = _1791 + 1.0;
    float _1795 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1797 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1569)
    {
        _1741 = _1787;
    }
    float _1799 = _1741;
    float _1801 = _1709;
    float _1803 = _1707;
    float _1805 = _1711;
    if (!_1693)
    {
        float _1807 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1709);
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = _1795 + _1751;
    float _1813 = _1675 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    if (!_1693)
    {
        float _1817 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1707);
        _1803 = _1817;
    }
    float _1819 = _1803;
    float _1821 = _1777 * _1793;
    if (!_1693)
    {
        float _1823 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1805 = _1823;
    }
    float _1825 = _1805;
    if (!_1585)
    {
        _1162 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1827 = _1162;
    float _1829 = _1811 * _1779;
    float _1831 = _1829 * 0.5;
    float _1833 = _1689 * _1821;
    float _1835 = fma(_1797, _1799, -0.5);
    float _1837 = _1733 * _1643;
    float _1839 = _1827;
    if (!_1585)
    {
        float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1843 = fma(_1831, _1827, _1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = -_1777;
    float _1849 = _1847 + 1.0;
    float _1851 = _970 * _1809;
    float _1853 = _968 * _1809;
    float _1855 = _966 * _1809;
    float _1857 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1833);
    float _1859 = _1815 * _1643;
    float _1861 = -_1837;
    float _1863 = fma(_1815, _1835, _1861);
    float _1865 = fma(_1713, _1789, _1857);
    float _1867 = _1815;
    if (!_1585)
    {
        float _1869 = 1.0 / _1845;
        _1867 = _1869;
    }
    float _1871 = _1867;
    float _1873 = fma(_1733, _1835, _1859);
    float _1875 = fma(_1653, _1863, _1651);
    float _1877 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1865);
    float _1879 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1881 = -_1701;
    float _1883 = fma(_1703, _1873, _1881);
    if (!_1585)
    {
        _1743 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1885 = _1743;
    float _1887 = fma(_1086, _1819, _1853);
    float _1889 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1891 = fma(_1088, _1819, _1851);
    float _1893 = _1877 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1895 = fma(_1084, _1819, _1855);
    float _1897 = exp2(_1565);
    float _1899 = fma(_1110, _1825, _1887);
    float _1901 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1889);
    float _1903 = fma(_1126, _1825, _1895);
    float _1905 = _1871;
    float _1907 = _1885;
    if (!_1585)
    {
        float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1911 = -_1885;
        float _1913 = fma(_1871, _1909, _1911);
        _1905 = _1913;
    }
    float _1915 = _1905;
    if (!_1585)
    {
        float _1917 = -_1885;
        float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1907 = _1919;
    }
    float _1921 = _1907;
    float _1923 = fma(_1102, _1825, _1891);
    float _1925 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _1927 = _1779;
    float _1929 = _1921;
    if (!_1585)
    {
        float _1931 = 1.0 / _1921;
        _1927 = _1931;
    }
    float _1933 = _1927;
    out.m_63.x = _1899;
    out.m_63.y = _1903;
    out.m_63.z = _1923;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1937 = _1925 + _1470;
    float _1939 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1941 = -_1897;
    float _1943 = _1941 + 1.0;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1585)
    {
        _1929 = 1.0;
    }
    float _1947 = _1929;
    float _1949 = _1510 + _1470;
    float _1951 = _1470 * 0.5;
    float _1953 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1955 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1947;
    if (!_1585)
    {
        float _1963 = _1915 * _1933;
        float _1965 = precise::clamp(_1963, 0.0, 1.0);
        _1961 = _1965;
    }
    float _1967 = _1961;
    float _1969 = _1875 + 0.5;
    float _1971 = _1883 + 0.5;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1975 = _1967 > 0.0;
    bool _1977 = isnan(_1967);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(0.0);
    bool _1983 = _1979 || _1981;
    float _1985 = _1937 * 0.5;
    float _1987 = _1949 * 0.5;
    float _1989 = fma(_1492, -0.5, _1951);
    float _1991 = _1973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1953;
    out.m_65.y = _1955;
    out.m_65.z = _1959;
    out.m_65.w = _1893;
    out.m_67.x = _1969;
    out.m_67.y = _1971;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1492;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1470;
    out.m_69.x = _1987;
    out.m_69.y = _1989;
    out.m_69.z = _1985;
    out.m_69.w = _1470;
    out.m_45.x = _1991;
    float _1993 = _1957 * _1524;
    float _1995 = -_1957;
    float _1997 = _1995 + 1.0;
    float _1999 = _1539 * _1993;
    float _2001 = _1539 * _1997;
    float _2003 = _1549 * _1993;
    float _2005 = fma(_1545, _1999, _1533);
    float _2007 = fma(_1547, _1999, _1535);
    float _2009 = fma(_1539, _2003, _1537);
    out.m_71.x = _2005;
    out.m_71.y = _2007;
    out.m_71.z = _2009;
    out.m_71.w = _2001;
    if (_1983)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2011;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

