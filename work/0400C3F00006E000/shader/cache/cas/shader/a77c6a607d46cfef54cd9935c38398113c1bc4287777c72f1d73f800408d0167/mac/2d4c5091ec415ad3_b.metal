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
    float4 m_67 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _702 = false;
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
        float _2478 = as_type<float>(_106);
        out.gl_Position.z = _2478;
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
    float _130 = _124;
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
        float _2549 = as_type<float>(_146);
        out.gl_Position.z = _2549;
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
    float _194 = 0.0;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _156 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _156);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _128 = _212;
        _192 = _224;
        _194 = _214;
    }
    float _226 = _128;
    float _228 = _192;
    float _230 = _194;
    bool _232 = !_166;
    float _234 = _226;
    float _236 = _230;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _250;
        _236 = _244;
        _168 = _256;
    }
    float _258 = _234;
    float _260 = _236;
    float _262 = _168;
    float _264 = _260;
    float _266 = _258;
    if (!_166)
    {
        _264 = _124;
    }
    float _268 = _264;
    float _270 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _268;
    if (!_166)
    {
        float _274 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _274;
    }
    float _276 = _266;
    bool _278 = !_166;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _124 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _124);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_166;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _124 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_262, _152, _270);
    float _342 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_336, _152, _338);
    float _348 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_262, _150, _342);
    float _354 = fma(_336, _150, _344);
    float _356 = -_346;
    float _358 = _340 + _356;
    float _360 = fma(_262, _154, _348);
    float _362 = fma(_336, _154, _350);
    float _364 = -_354;
    float _366 = _352 + _364;
    float _368 = _358 * _358;
    float _370 = in.m_49.w;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(_366, _366, _368);
    float _380 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _384 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = fma(_374, _374, _378);
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _390 = in.m_42.x;
    float _392 = in.m_42.y;
    float _394 = in.m_42.z;
    float _396 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _382);
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _400 = sqrt(_386);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _404 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _388);
    bool _406 = _400 >= 9.9999999747524270787835121154785e-07;
    bool _408 = isnan(_400);
    bool _410 = _406 || _408;
    bool _412 = isnan(9.9999999747524270787835121154785e-07);
    bool _414 = _410 || _412;
    float _416 = fma(_352, _370, _390);
    float _418 = fma(_340, _370, _392);
    float _420 = fma(_360, _370, _394);
    float _422 = _404;
    float _424 = _398;
    float _426 = _402;
    if (!_414)
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
            _422 = _462;
            _424 = _460;
            _426 = _464;
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
                float _486 = _392 * _392;
                float _488 = fma(_390, _390, _486);
                float _490 = fma(_394, _394, _488);
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
                    _422 = _516;
                    _424 = _514;
                    _426 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _422 = _550;
                    _424 = _548;
                    _426 = _552;
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
                _422 = _584;
                _424 = _582;
                _426 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _422;
    float _590 = _424;
    float _592 = _426;
    float _594 = in.m_51.x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _598 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _638 = abs(_634);
    float _640 = -_618;
    float _642 = _614 + _640;
    bool _644 = !_606;
    int _646 = _644 ? 0 : 1;
    float _648 = -_642;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _652 = float(_626);
    int _654 = abs(_646);
    float _656 = fma(_630, 0.5, 0.5);
    float _658 = abs(_650);
    float _660 = _652 * _658;
    bool _662 = _642 < 0.5;
    float _664 = float(_662);
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _670 = float(_638);
    float _672 = -_664;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _676 = float(_654);
    float _678 = fma(_670, _668, _660);
    float _680 = abs(_674);
    float _682 = fma(_676, _680, _678);
    bool _684 = !_636;
    float _700;
    if (!_684)
    {
        float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _688 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _690 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _692 = _690 * _686;
        float _694 = floor(_692);
        float _696 = -_694;
        float _698 = _692 + _696;
        _700 = _698;
        _702 = true;
    }
    else
    {
        float _704 = float(_90);
        float _706 = 1.0 / _704;
        float _708 = _124 * _706;
        _700 = _708;
    }
    _702 = false;
    float _710 = _700;
    float _712 = in.m_51.z;
    float _714 = _594 * 2.0;
    float _716 = _418 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _728 = _726 != 0;
    float _730 = in.m_51.y;
    float _732 = floor(_714);
    float _734 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _736 = _418 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = _418 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _736);
    float _750 = -_744;
    float _752 = fma(_742, 2.0, _750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _756 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _758 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _734);
    bool _760 = _732 > 0.0;
    float _762 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _764 = log2(_762);
    bool _766 = _732 >= 0.0;
    bool _768 = isnan(_732);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    float _776 = _712 * 2.0;
    float _778 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _748);
    float _780 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _782 = _730 + _712;
    float _784 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = floor(_776);
    float _788 = _774 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _790 = _782 + (-1.0);
    float _792 = fma(_784, -2.0, _754);
    float _794 = _730 * 2.0;
    int _796 = ~as_type<int>(_788);
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _806 = !_724;
    int _808 = _806 ? 0 : 1;
    float _810 = floor(_794);
    int _812 = _800;
    float _814 = _788;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_760)
    {
        int _818 = ~as_type<int>(_788);
        int _820 = _818 + 1;
        _812 = _820;
    }
    int _822 = _812;
    float _824 = _764 * _124;
    if (_740)
    {
        _814 = _594;
    }
    float _826 = _814;
    float _828 = -_124;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    int _832 = abs(_808);
    float _834 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _792);
    bool _836 = _786 > 0.0;
    float _838 = exp2(_824);
    bool _840 = _786 >= 0.0;
    bool _842 = isnan(_786);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _852 = _826;
    if (_740)
    {
        _816 = _730;
    }
    float _854 = _816;
    float _856 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _858 = _854;
    if (!_740)
    {
        _858 = _594;
    }
    float _860 = _858;
    float _862 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_740)
    {
        _852 = _712;
    }
    float _864 = _852;
    float _866 = float(_822);
    float _868 = _860 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _870 = float(_832);
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _874 = _848 ? 0 : 1;
    float _876 = fma(_868, -2.0, _804);
    float _878 = _588 * _588;
    float _880 = _870 * _866;
    float _882 = -_850;
    float _884 = fma(_872, 2.0, _882);
    float _886 = fma(_590, _590, _878);
    float _888 = in.m_53.x;
    float _890 = in.m_53.y;
    float _892 = in.m_53.z;
    int _894 = ~_874;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _902 = 1.0 + _900;
    float _904 = fma(_592, _592, _886);
    int _906 = _898;
    if (!_836)
    {
        int _908 = ~_874;
        int _910 = _908 + 1;
        _906 = _910;
    }
    int _912 = _906;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    float _918 = 1.0 / _902;
    bool _920 = _810 > 0.0;
    float _922 = _880 * (-2.0);
    bool _924 = _810 >= 0.0;
    bool _926 = isnan(_810);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _936 = rsqrt(_904);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _952 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _960 = _956 || _958;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _964 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[88].z, _934);
    bool _966 = !_720;
    int _968 = _966 ? 0 : 1;
    float _970 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[88].w, _938);
    float _972 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].z, _950);
    float _974 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].w, _962);
    float _976 = _960 ? _916 : 0.0;
    float _978 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _964);
    int _980 = abs(_968);
    float _982 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _970);
    float _984 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _972);
    float _986 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _974);
    float _988 = -_124;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[86].x, _884);
    float _992 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _876);
    if (_948)
    {
        float _994 = _976 * _918;
        _130 = _994;
    }
    float _996 = _130;
    float _998 = _730 + (-0.5);
    float _1000 = fma(_922, _890, _890);
    float _1002 = _936 * _592;
    int _1004 = _932 ? 0 : 1;
    float _1006 = _778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1000);
    float _1010 = float(_980);
    float _1012 = fma(_802, _922, _802);
    float _1014 = float(_912);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1006 + _1016;
    int _1020 = ~_1004;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = _936 * _590;
    int _1028 = _1024;
    if (!_920)
    {
        int _1030 = ~_1004;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = _936 * _588;
    float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1040 = _1002 * _1038;
    float _1042 = _1010 * _1014;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1046 = _856 + _1044;
    float _1048 = _1018 * _1018;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1052 = _1036 * _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1056 = -_1040;
    float _1058 = fma(_1026, _1054, _1056);
    bool _1060 = !_728;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = fma(_1012, _996, _1008);
    float _1066 = fma(_1046, _1046, _1048);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = _862 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1074 = _1026 * _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1078 = -_1052;
    float _1080 = fma(_1002, _1076, _1078);
    float _1082 = _1058 * _1058;
    int _1084 = abs(_1062);
    float _1086 = fma(_1070, _1070, _1066);
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1090 = -_1074;
    float _1092 = fma(_1036, _1088, _1090);
    float _1094 = fma(_1080, _1080, _1082);
    float _1096 = _594 + _730;
    float _1098 = rsqrt(_1086);
    float _1100 = _1042 * (-2.0);
    float _1102 = float(_1084);
    float _1104 = _594 + _712;
    float _1106 = float(_1034);
    float _1108 = _1096 + (-1.0);
    float _1110 = fma(_1092, _1092, _1094);
    float _1112 = _594 + (-0.5);
    float _1114 = fma(_1100, _888, _888);
    float _1116 = _1104 + (-1.0);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1120 = _1102 * _1106;
    float _1122 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1114);
    float _1124 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1126 = fma(_1118, _1100, _1118);
    float _1128 = _1120 * (-2.0);
    float _1130 = _1046 * _1098;
    float _1132 = _1064 * 0.15915493667125701904296875;
    float _1134 = fma(_1126, _996, _1122);
    float _1136 = fma(_1124, _1128, _1124);
    float _1138 = fma(_1128, _892, _892);
    float _1140 = _1018 * _1098;
    float _1142 = in.m_49.x;
    float _1144 = in.m_49.y;
    float _1146 = in.m_49.z;
    float _1148 = _712 + (-0.5);
    float _1150 = _1134 * 0.15915493667125701904296875;
    float _1152 = -_1140;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    float _1156 = -_1130;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1138);
    float _1162 = _1070 * _1098;
    float _1164 = _1154 * _1154;
    float _1166 = rsqrt(_1110);
    float _1168 = fma(_1136, _996, _1160);
    float _1170 = fma(_1158, _1158, _1164);
    float _1172 = -_1162;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1070);
    float _1176 = _1168 * 0.15915493667125701904296875;
    float _1178 = in.m_55.x;
    float _1180 = in.m_55.y;
    float _1182 = in.m_55.z;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1188 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1192 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1190;
    float _1194 = _1132 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = -_1188;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1204 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1206 = -_1192;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _1200 * _1200;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1214 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1212;
    float _1216 = _1132 * 6.283185482025146484375;
    float _1218 = cos(_1216);
    float _1220 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1222 = fma(_1208, _1208, _1210);
    float _1224 = -_1214;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1080 * _1166;
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1232 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1234 = fma(_1226, _1226, _1222);
    float _1236 = _1150 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    float _1240 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1182);
    float _1244 = _1092 * _1166;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1248 = _1150 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1176 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    float _1258 = _1058 * _1166;
    float _1260 = _1238 * _1196;
    float _1262 = _1238 * _1218;
    float _1264 = sqrt(_1184);
    float _1266 = _1250 * _1218;
    float _1268 = _1176 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1218 * _1254;
    float _1274 = _1250 * _1196;
    float _1276 = _1250 * _1254;
    float _1278 = _1238 * _1254;
    float _1280 = _1196 * _1254;
    float _1282 = _1098 * _1264;
    float _1284 = sqrt(_1234);
    float _1286 = _1230 * _1282;
    float _1288 = _1232 * _1282;
    float _1290 = _1240 * _1282;
    float _1292 = _1036 * _1244;
    float _1294 = fma(_1270, _1266, _1260);
    float _1296 = fma(_1270, _1260, _1266);
    float _1298 = -_1274;
    float _1300 = fma(_1270, _1262, _1298);
    float _1302 = -_1262;
    float _1304 = fma(_1270, _1274, _1302);
    float _1306 = _1286 * _1242;
    float _1308 = _1288 * _1256;
    float _1310 = _1026 * _1258;
    float _1312 = _1276 * _1002;
    float _1314 = _1304 * _1002;
    float _1316 = _1294 * _1002;
    float _1318 = -_1310;
    float _1320 = fma(_1036, _1228, _1318);
    float _1322 = -_1270;
    float _1324 = fma(_1322, _1244, _1312);
    float _1326 = fma(_1280, _1244, _1314);
    float _1328 = fma(_1272, _1244, _1316);
    float _1330 = _1276 * _1026;
    float _1332 = _1290 * _1246;
    float _1334 = fma(_1278, _1320, _1324);
    float _1336 = fma(_1300, _1320, _1328);
    float _1338 = -_1292;
    float _1340 = fma(_1002, _1258, _1338);
    float _1342 = -_1270;
    float _1344 = fma(_1342, _1228, _1330);
    float _1346 = _1294 * _1026;
    float _1348 = fma(_1296, _1320, _1326);
    float _1350 = _1304 * _1026;
    float _1352 = fma(_1278, _1340, _1344);
    float _1354 = fma(_1272, _1228, _1346);
    float _1356 = _1332 * _1334;
    float _1358 = fma(_1280, _1228, _1350);
    float _1360 = fma(_1300, _1340, _1354);
    float _1362 = _1332 * _1352;
    float _1364 = fma(_1308, _1336, _1356);
    float _1366 = fma(_1284, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1368 = fma(_1296, _1340, _1358);
    float _1370 = fma(_1308, _1360, _1362);
    float _1372 = fma(_1306, _1348, _1364);
    float _1374 = _1002 * _1228;
    float _1376 = precise::max(_1366, 0.3499999940395355224609375);
    float _1378 = fma(_1306, _1368, _1370);
    float _1380 = _862 + _1372;
    float _1382 = _1276 * _1036;
    float _1384 = precise::min(_1376, 1.0);
    float _1386 = _856 + _1378;
    float _1388 = -_1214;
    float _1390 = _1380 + _1388;
    float _1392 = -_1374;
    float _1394 = fma(_1026, _1244, _1392);
    float _1396 = _1294 * _1036;
    float _1398 = -_1192;
    float _1400 = _1386 + _1398;
    float _1402 = fma(_1390, _1384, _1214);
    float _1404 = -_1270;
    float _1406 = fma(_1404, _1258, _1382);
    float _1408 = _1304 * _1036;
    float _1410 = fma(_1400, _1384, _1192);
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1414 = _1402 + _1412;
    float _1416 = fma(_1272, _1258, _1396);
    float _1418 = fma(_1278, _1394, _1406);
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1422 = _1410 + _1420;
    float _1424 = _1414 * _1414;
    float _1426 = fma(_1280, _1258, _1408);
    float _1428 = fma(_1300, _1394, _1416);
    float _1430 = _1332 * _1418;
    float _1432 = fma(_1422, _1422, _1424);
    float _1434 = fma(_1296, _1394, _1426);
    float _1436 = fma(_1308, _1428, _1430);
    float _1438 = sqrt(_1432);
    float _1440 = fma(_1306, _1434, _1436);
    float _1442 = _1006 + _1440;
    float _1444 = -_1188;
    float _1446 = _1442 + _1444;
    float _1448 = fma(_1446, _1384, _1188);
    bool _1450 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = _1446;
    float _1454 = _1410;
    float _1456 = _1402;
    float _1458 = _1374;
    float _1460 = _1448;
    float _1462 = _1406;
    if (!_1450)
    {
        _1452 = _1448;
    }
    float _1464 = _1452;
    bool _1466 = !_1450;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1438 + _1472;
        float _1476 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = rsqrt(_1432);
        float _1480 = _1474 * _1470;
        float _1482 = _1480 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1486 + (-1.0);
        float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = fma(_1490, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1498 = fma(_1448, _1486, _1494);
        float _1500 = _1478 * _1496;
        float _1502 = fma(_1422, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1504 = fma(_1414, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1468 = _1498;
        _1454 = _1502;
        _1456 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1454;
    float _1510 = _1456;
    float _1512 = -_1140;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1506);
    float _1516 = -_1130;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1520 = -_1162;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1514 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1518 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1522 + _1532;
    float _1536 = _1526 * _1526;
    float _1538 = fma(_1530, _1530, _1536);
    float _1540 = fma(_1534, _1534, _1538);
    float _1542 = rsqrt(_1540);
    float _1544 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1530 * _1544;
    float _1548 = _1534 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1538;
    float _1566 = _1562;
    float _1568 = _1526;
    float _1570 = _1546;
    if (_1558)
    {
        float _1572 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1572;
    }
    float _1574 = _1564;
    if (_1558)
    {
        float _1576 = rsqrt(_1554);
        _1458 = _1576;
    }
    float _1578 = _1458;
    float _1580 = _1578;
    if (_1558)
    {
        float _1582 = _1562 * _1574;
        _1566 = _1582;
    }
    float _1584 = _1566;
    if (_1558)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1460 = _1586;
    }
    float _1588 = _1460;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1592 = _1534;
    if (_1558)
    {
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1574;
    float _1606 = _1602;
    if (_1558)
    {
        float _1608 = _1588 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        _1604 = _1610;
    }
    float _1612 = _1604;
    float _1614 = -_1544;
    float _1616 = -_1602;
    float _1618 = fma(_1526, _1614, _1616);
    if (_1558)
    {
        float _1620 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1620;
    }
    float _1622 = _1568;
    float _1624 = sqrt(_1540);
    float _1626 = _1622;
    float _1628 = _1598;
    if (_1558)
    {
        float _1630 = fma(_1598, _1622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1558)
    {
        _1628 = _1618;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    float _1640 = _1612;
    if (_1558)
    {
        float _1642 = _1612 + (-1.0);
        _1606 = _1642;
    }
    float _1644 = _1606;
    float _1646 = _1644;
    if (_1558)
    {
        float _1648 = _1578 * _1632;
        _1462 = _1648;
    }
    float _1650 = _1462;
    if (!_1558)
    {
        _1634 = _1550;
    }
    float _1652 = _1634;
    float _1654 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1656 = _1652;
    if (_1558)
    {
        float _1658 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1658;
    }
    float _1660 = _1580;
    if (_1558)
    {
        float _1662 = _1546 * _1650;
        _1570 = _1662;
    }
    float _1664 = _1570;
    if (!_1558)
    {
        _1646 = _1548;
    }
    float _1666 = _1646;
    float _1668 = _1666;
    if (_1558)
    {
        float _1670 = _1548 * _1650;
        _1668 = _1670;
    }
    float _1672 = _1668;
    if (_1558)
    {
        float _1674 = fma(_1618, _1612, _1660);
        _1638 = _1674;
    }
    float _1676 = _1638;
    if (_1558)
    {
        float _1678 = _1664 * _1664;
        _1656 = _1678;
    }
    float _1680 = _1656;
    if (!_1558)
    {
        _1640 = _1552;
    }
    float _1682 = _1640;
    float _1684 = _1682;
    if (_1558)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1676, _1676, _1680);
    float _1692 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1654);
    float _1694 = _1690 + _1688;
    float _1696 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1624, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1692);
    float _1708 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1696);
    float _1710 = rsqrt(_1694);
    float _1712 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    float _1718 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1720 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1722 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1712);
    float _1724 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1726 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1720);
    float _1728 = abs(_1716);
    float _1730 = log2(_1728);
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1734 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1736 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1738 = -_1734;
    float _1740 = fma(_1738, _1590, 1.0);
    float _1742 = _1710 * _1664;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1710 * _1676;
    float _1748 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = _1710 * _1672;
    float _1754 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = -_1750;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1764 = log2(_1740);
    float _1766 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1768 = -_1752;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1772 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1776 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1778 = fma(_1770, -0.5, 0.5);
    float _1780 = fma(_1770, 0.5, 0.5);
    float _1782 = exp2(_1762);
    float _1784 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1786 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1774);
    float _1788 = fma(_1780, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1790 = _1746 + 1.0;
    float _1792 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1784);
    float _1794 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1796 = fma(_1780, _1788, -0.212114393711090087890625);
    float _1798 = 1.0 / _1776;
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1802 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = fma(_1780, _1796, 1.570728778839111328125);
    float _1806 = _1764 * 0.693147182464599609375;
    float _1808 = sqrt(_1778);
    float _1810 = -_1746;
    float _1812 = fma(_1782, _1790, _1810);
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1800 * _1798;
    float _1820 = _1802 * _1798;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = _1808 * 0.636619746685028076171875;
    float _1828 = -_1804;
    float _1830 = fma(_1826, _1828, 1.0);
    float3 _5239 = float3(_1822, _1824, _1814);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5239, float3(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5239, float3(0.0), isnan(_5239)), level(0.0)).x;
    float3 _5250 = float3(_1822, _1824, _1814);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5250, float3(0.0), isnan(_5250)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5250, float3(0.0), isnan(_5250)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _5267 = float2(_1830, _1816);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5267, float2(0.0), isnan(_5267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5267, float2(0.0), isnan(_5267)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    bool _1855 = _730 > 0.5;
    float _1857 = -_1140;
    float _1859 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1861 = in.m_57.y;
    float _1863 = -_1130;
    float _1865 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _1867 = -_1162;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1879 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1881 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(0.5);
    bool _1889 = _1885 || _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = 1.0 / _1873;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1905 = 1.0 / _1877;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1907 = _712 > 0.5;
    float _1909 = -_1861;
    float _1911 = _1909 + 1.0;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1921 = 1.0 / _1893;
    int _1923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1925 = _1923 != 0;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1929 = _1927 != 0;
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1933 = _1931 != 0;
    float _1935 = 1.0 / _1903;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1939 = _1907 ? as_type<int>(_1911) : as_type<int>(_1861);
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1943 = _1907;
    float _1945 = _1861;
    if (_1897)
    {
        bool _1947 = _594 > 0.5;
        _1943 = _1947;
    }
    bool _1949 = _1943;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1951;
    float _1955 = 1.0 / _1915;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1963 = _1953 * _1899;
    float _1965 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = 1.0 / _1919;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1973;
    float _1977 = _1961 * _1905;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    out.m_61.x = _1965;
    out.m_61.y = _1967;
    out.m_61.z = _1969;
    float _1983 = _1975 * _1921;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1995 = _710 + _1993;
    float _1997 = _1981 * _1955;
    bool _1999 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2001 = isnan(_710);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = in.m_57.x;
    float _2013 = fma(_1977, _1995, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2017 = _710 + _2015;
    float _2019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2021 = -_2009;
    float _2023 = _2021 + 1.0;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2027 = _710 + _2025;
    float _2029 = _1987 * _1935;
    bool _2031 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _2033 = isnan(_710);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _2039 = _2035 || _2037;
    float _2041 = float(_2039);
    float _2043 = _1991 * _1971;
    float _2045 = fma(_1963, _2027, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2047 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2049 = isnan(_710);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2055 = _2051 || _2053;
    float _2057 = float(_2055);
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2061 = -_2041;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_1983, _2017, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2067 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2069 = isnan(_710);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = -_2057;
    float _2081 = _2079 + 1.0;
    float _2083 = _2057 * _2063;
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2087 = _710 + _2085;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2091 = _710 + _2089;
    float _2093 = _2009 * _2081;
    bool _2095 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2097 = isnan(_710);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2103 = _2099 || _2101;
    float _2105 = float(_2103);
    float _2107 = fma(_2043, _2087, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _2109 = -_2077;
    float _2111 = _2109 + 1.0;
    float _2113 = _2077 * _2023;
    bool _2115 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2117 = isnan(_710);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2123);
    float _2127 = -_2105;
    float _2129 = _2127 + 1.0;
    float _2131 = fma(_1997, _2091, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2133 = _2105 * _2111;
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2137 = _1929 ? _1939 : as_type<int>(_1861);
    float _2139 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2141 = _2125 * _2129;
    int _2143 = as_type<int>(_2019);
    int _2145 = _2137;
    float _2147 = _2105;
    if (_1933)
    {
        float _2149 = _1855 ? _1911 : _1861;
        _1945 = _2149;
    }
    float _2151 = _1945;
    float _2153 = -_2125;
    float _2155 = _2153 + 1.0;
    float _2157 = fma(as_type<float>(_2137), _2139, -0.5);
    float _2159 = _2045 * _2141;
    float _2161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2163 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2165 = _2011;
    if (_1897)
    {
        float _2167 = -_2011;
        float _2169 = _2167 + 1.0;
        _2143 = as_type<int>(_2169);
    }
    int _2171 = _2143;
    if (_1925)
    {
        float _2173 = -_2011;
        float _2175 = _2173 + 1.0;
        _2145 = as_type<int>(_2175);
    }
    int _2177 = _2145;
    if (!_1897)
    {
        _2147 = _2011;
    }
    float _2179 = _2147;
    float _2181 = fma(_2163, _2151, -0.5);
    float _2183 = -_992;
    float _2185 = fma(_982, _2157, _2183);
    float _2187 = _2179;
    if (_1897)
    {
        float _2189 = _1949 ? as_type<float>(_2171) : _2011;
        _2187 = _2189;
    }
    float _2191 = _2187;
    float _2193 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2195 = -_834;
    float _2197 = fma(_986, _2181, _2195);
    if (_1925)
    {
        float _2199 = _1855 ? as_type<float>(_2177) : _2011;
        _2165 = _2199;
    }
    float _2201 = _2165;
    float _2203 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2159);
    float _2207 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2209 = fma(_2203, _2191, -0.5);
    float _2211 = _2161 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2213 = fma(_2013, _2133, _2205);
    float _2215 = fma(_984, _2209, _830);
    float _2217 = fma(_2211, _2201, -0.5);
    float _2219 = _2197 + 0.5;
    float _2221 = _2185 + 0.5;
    float _2223 = _2215 + 0.5;
    float _2225 = fma(_978, _2217, _990);
    float _2227 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2193);
    bool _2229 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _2231 = isnan(_710);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _2237 = _2233 || _2235;
    float _2239 = float(_2237);
    float _2241 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2207);
    float _2243 = _2225 + 0.5;
    float _2245 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    out.m_63.x = _2223;
    out.m_63.y = _2219;
    float _2247 = fma(_2065, _2113, _2213);
    float _2249 = -_2239;
    float _2251 = _2249 + 1.0;
    float _2253 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_65.x = _2243;
    out.m_65.y = _2221;
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2257 = _710 + _2255;
    float _2259 = fma(_2131, _2093, _2247);
    float _2261 = 1.0 / _2253;
    float _2263 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2241);
    float _2265 = _2041 * _2251;
    float _2267 = fma(_2029, _2257, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _2269 = fma(_2107, _2083, _2259);
    float _2271 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2273 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2275 = _2257;
    if (_1889)
    {
        _2275 = 1.0;
    }
    float _2277 = _2275;
    float _2279 = fma(_2267, _2265, _2269);
    float _2281 = _2271 + _2253;
    float _2283 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[121].x, _2279);
    float _2285 = _2281 * _2261;
    float _2287 = _2285 * 0.5;
    float _2289 = _2277;
    if (!_1889)
    {
        float _2291 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2293);
        float _2297 = _2291 * 0.15915493667125701904296875;
        float _2299 = _2297 * 6.283185482025146484375;
        float _2301 = cos(_2299);
        float _2303 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2305 = _2303 * 0.15915493667125701904296875;
        float _2307 = _2297 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        float _2311 = 1.0 / _2301;
        float _2313 = _2305 * 6.283185482025146484375;
        float _2315 = cos(_2313);
        float _2317 = _2309 * _2311;
        float _2319 = 1.0 / _2295;
        float _2321 = _2315 * _2317;
        float _2323 = _2305 * 6.283185482025146484375;
        float _2325 = sin(_2323);
        float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2329 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2327;
        float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2333 = _2319 * _2331;
        float _2335 = 1.0 / _2321;
        float _2337 = 1.0 / _2329;
        float _2339 = _2325 * _2335;
        float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2343 = fma(_2339, _2333, _2341);
        float _2345 = _2343 * _2337;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        float _2349 = -_2347;
        float _2351 = _2349 + 1.0;
        _2289 = _2351;
    }
    float _2353 = _2289;
    float _2355 = exp2(_1879);
    float _2357 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2273);
    float _2359 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2361 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2357);
    float _2363 = _682 * _2359;
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2367 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2361);
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2373 = _2353 > 0.0;
    bool _2375 = isnan(_2353);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = _2367 + _1776;
    float _2385 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2387 = _2365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2389 = -_2355;
    float _2391 = _2389 + 1.0;
    float _2393 = _2371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2395 = _2283 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2397 = _2383 * 0.5;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2401 = _2363 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2385;
    out.m_67.y = _2387;
    out.m_67.z = _2393;
    out.m_67.w = _2395;
    float _2403 = _2399 * _1832;
    float _2405 = -_2399;
    float _2407 = _2405 + 1.0;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2367;
    out.gl_Position.w = _1776;
    float _2409 = _1843 * _2403;
    float _2411 = _1853 * _2403;
    float _2413 = _1843 * _2407;
    out.m_69.z = _2397;
    out.m_69.w = _1776;
    float _2415 = fma(_1849, _2409, _1837);
    float _2417 = fma(_1851, _2409, _1839);
    float _2419 = fma(_1843, _2411, _1841);
    out.m_45.x = _2401;
    out.m_71.x = _2415;
    out.m_71.y = _2417;
    out.m_71.z = _2419;
    out.m_71.w = _2413;
    if (_2381)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2421 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2421;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _702 = false;
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
        float _2478 = as_type<float>(_106);
        out.gl_Position.z = _2478;
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
    float _130 = _124;
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
        float _2549 = as_type<float>(_146);
        out.gl_Position.z = _2549;
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
    float _194 = 0.0;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _156 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _156);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _128 = _212;
        _192 = _224;
        _194 = _214;
    }
    float _226 = _128;
    float _228 = _192;
    float _230 = _194;
    bool _232 = !_166;
    float _234 = _226;
    float _236 = _230;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _250;
        _236 = _244;
        _168 = _256;
    }
    float _258 = _234;
    float _260 = _236;
    float _262 = _168;
    float _264 = _260;
    float _266 = _258;
    if (!_166)
    {
        _264 = _124;
    }
    float _268 = _264;
    float _270 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _268;
    if (!_166)
    {
        float _274 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _274;
    }
    float _276 = _266;
    bool _278 = !_166;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _124 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _124);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_166;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _124 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_262, _152, _270);
    float _342 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_336, _152, _338);
    float _348 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_262, _150, _342);
    float _354 = fma(_336, _150, _344);
    float _356 = -_346;
    float _358 = _340 + _356;
    float _360 = fma(_262, _154, _348);
    float _362 = fma(_336, _154, _350);
    float _364 = -_354;
    float _366 = _352 + _364;
    float _368 = _358 * _358;
    float _370 = in.m_49.w;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(_366, _366, _368);
    float _380 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _384 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = fma(_374, _374, _378);
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _390 = in.m_42.x;
    float _392 = in.m_42.y;
    float _394 = in.m_42.z;
    float _396 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _382);
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _400 = sqrt(_386);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _404 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _388);
    bool _406 = _400 >= 9.9999999747524270787835121154785e-07;
    bool _408 = isnan(_400);
    bool _410 = _406 || _408;
    bool _412 = isnan(9.9999999747524270787835121154785e-07);
    bool _414 = _410 || _412;
    float _416 = fma(_352, _370, _390);
    float _418 = fma(_340, _370, _392);
    float _420 = fma(_360, _370, _394);
    float _422 = _404;
    float _424 = _398;
    float _426 = _402;
    if (!_414)
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
            _422 = _462;
            _424 = _460;
            _426 = _464;
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
                float _486 = _392 * _392;
                float _488 = fma(_390, _390, _486);
                float _490 = fma(_394, _394, _488);
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
                    _422 = _516;
                    _424 = _514;
                    _426 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _422 = _550;
                    _424 = _548;
                    _426 = _552;
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
                _422 = _584;
                _424 = _582;
                _426 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _422;
    float _590 = _424;
    float _592 = _426;
    float _594 = in.m_51.x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _598 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _638 = abs(_634);
    float _640 = -_618;
    float _642 = _614 + _640;
    bool _644 = !_606;
    int _646 = _644 ? 0 : 1;
    float _648 = -_642;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _652 = float(_626);
    int _654 = abs(_646);
    float _656 = fma(_630, 0.5, 0.5);
    float _658 = abs(_650);
    float _660 = _652 * _658;
    bool _662 = _642 < 0.5;
    float _664 = float(_662);
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _670 = float(_638);
    float _672 = -_664;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _676 = float(_654);
    float _678 = fma(_670, _668, _660);
    float _680 = abs(_674);
    float _682 = fma(_676, _680, _678);
    bool _684 = !_636;
    float _700;
    if (!_684)
    {
        float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _688 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _690 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _692 = _690 * _686;
        float _694 = floor(_692);
        float _696 = -_694;
        float _698 = _692 + _696;
        _700 = _698;
        _702 = true;
    }
    else
    {
        float _704 = float(_90);
        float _706 = 1.0 / _704;
        float _708 = _124 * _706;
        _700 = _708;
    }
    _702 = false;
    float _710 = _700;
    float _712 = in.m_51.z;
    float _714 = _594 * 2.0;
    float _716 = _418 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _728 = _726 != 0;
    float _730 = in.m_51.y;
    float _732 = floor(_714);
    float _734 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _736 = _418 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = _418 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _736);
    float _750 = -_744;
    float _752 = fma(_742, 2.0, _750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _756 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _758 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _734);
    bool _760 = _732 > 0.0;
    float _762 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _764 = log2(_762);
    bool _766 = _732 >= 0.0;
    bool _768 = isnan(_732);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    float _776 = _712 * 2.0;
    float _778 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _748);
    float _780 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _782 = _730 + _712;
    float _784 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = floor(_776);
    float _788 = _774 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _790 = _782 + (-1.0);
    float _792 = fma(_784, -2.0, _754);
    float _794 = _730 * 2.0;
    int _796 = ~as_type<int>(_788);
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _806 = !_724;
    int _808 = _806 ? 0 : 1;
    float _810 = floor(_794);
    int _812 = _800;
    float _814 = _788;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_760)
    {
        int _818 = ~as_type<int>(_788);
        int _820 = _818 + 1;
        _812 = _820;
    }
    int _822 = _812;
    float _824 = _764 * _124;
    if (_740)
    {
        _814 = _594;
    }
    float _826 = _814;
    float _828 = -_124;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    int _832 = abs(_808);
    float _834 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _792);
    bool _836 = _786 > 0.0;
    float _838 = exp2(_824);
    bool _840 = _786 >= 0.0;
    bool _842 = isnan(_786);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _852 = _826;
    if (_740)
    {
        _816 = _730;
    }
    float _854 = _816;
    float _856 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _858 = _854;
    if (!_740)
    {
        _858 = _594;
    }
    float _860 = _858;
    float _862 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_740)
    {
        _852 = _712;
    }
    float _864 = _852;
    float _866 = float(_822);
    float _868 = _860 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _870 = float(_832);
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _874 = _848 ? 0 : 1;
    float _876 = fma(_868, -2.0, _804);
    float _878 = _588 * _588;
    float _880 = _870 * _866;
    float _882 = -_850;
    float _884 = fma(_872, 2.0, _882);
    float _886 = fma(_590, _590, _878);
    float _888 = in.m_53.x;
    float _890 = in.m_53.y;
    float _892 = in.m_53.z;
    int _894 = ~_874;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _902 = 1.0 + _900;
    float _904 = fma(_592, _592, _886);
    int _906 = _898;
    if (!_836)
    {
        int _908 = ~_874;
        int _910 = _908 + 1;
        _906 = _910;
    }
    int _912 = _906;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    float _918 = 1.0 / _902;
    bool _920 = _810 > 0.0;
    float _922 = _880 * (-2.0);
    bool _924 = _810 >= 0.0;
    bool _926 = isnan(_810);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _936 = rsqrt(_904);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _952 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _960 = _956 || _958;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _964 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[88].z, _934);
    bool _966 = !_720;
    int _968 = _966 ? 0 : 1;
    float _970 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[88].w, _938);
    float _972 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].z, _950);
    float _974 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].w, _962);
    float _976 = _960 ? _916 : 0.0;
    float _978 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _964);
    int _980 = abs(_968);
    float _982 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _970);
    float _984 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _972);
    float _986 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _974);
    float _988 = -_124;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[86].x, _884);
    float _992 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _876);
    if (_948)
    {
        float _994 = _976 * _918;
        _130 = _994;
    }
    float _996 = _130;
    float _998 = _730 + (-0.5);
    float _1000 = fma(_922, _890, _890);
    float _1002 = _936 * _592;
    int _1004 = _932 ? 0 : 1;
    float _1006 = _778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1000);
    float _1010 = float(_980);
    float _1012 = fma(_802, _922, _802);
    float _1014 = float(_912);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1006 + _1016;
    int _1020 = ~_1004;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = _936 * _590;
    int _1028 = _1024;
    if (!_920)
    {
        int _1030 = ~_1004;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = _936 * _588;
    float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1040 = _1002 * _1038;
    float _1042 = _1010 * _1014;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1046 = _856 + _1044;
    float _1048 = _1018 * _1018;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1052 = _1036 * _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1056 = -_1040;
    float _1058 = fma(_1026, _1054, _1056);
    bool _1060 = !_728;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = fma(_1012, _996, _1008);
    float _1066 = fma(_1046, _1046, _1048);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = _862 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1074 = _1026 * _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1078 = -_1052;
    float _1080 = fma(_1002, _1076, _1078);
    float _1082 = _1058 * _1058;
    int _1084 = abs(_1062);
    float _1086 = fma(_1070, _1070, _1066);
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1090 = -_1074;
    float _1092 = fma(_1036, _1088, _1090);
    float _1094 = fma(_1080, _1080, _1082);
    float _1096 = _594 + _730;
    float _1098 = rsqrt(_1086);
    float _1100 = _1042 * (-2.0);
    float _1102 = float(_1084);
    float _1104 = _594 + _712;
    float _1106 = float(_1034);
    float _1108 = _1096 + (-1.0);
    float _1110 = fma(_1092, _1092, _1094);
    float _1112 = _594 + (-0.5);
    float _1114 = fma(_1100, _888, _888);
    float _1116 = _1104 + (-1.0);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1120 = _1102 * _1106;
    float _1122 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1114);
    float _1124 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1126 = fma(_1118, _1100, _1118);
    float _1128 = _1120 * (-2.0);
    float _1130 = _1046 * _1098;
    float _1132 = _1064 * 0.15915493667125701904296875;
    float _1134 = fma(_1126, _996, _1122);
    float _1136 = fma(_1124, _1128, _1124);
    float _1138 = fma(_1128, _892, _892);
    float _1140 = _1018 * _1098;
    float _1142 = in.m_49.x;
    float _1144 = in.m_49.y;
    float _1146 = in.m_49.z;
    float _1148 = _712 + (-0.5);
    float _1150 = _1134 * 0.15915493667125701904296875;
    float _1152 = -_1140;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    float _1156 = -_1130;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1138);
    float _1162 = _1070 * _1098;
    float _1164 = _1154 * _1154;
    float _1166 = rsqrt(_1110);
    float _1168 = fma(_1136, _996, _1160);
    float _1170 = fma(_1158, _1158, _1164);
    float _1172 = -_1162;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1070);
    float _1176 = _1168 * 0.15915493667125701904296875;
    float _1178 = in.m_55.x;
    float _1180 = in.m_55.y;
    float _1182 = in.m_55.z;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1188 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1192 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1190;
    float _1194 = _1132 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = -_1188;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1204 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1206 = -_1192;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _1200 * _1200;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1214 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1212;
    float _1216 = _1132 * 6.283185482025146484375;
    float _1218 = cos(_1216);
    float _1220 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1222 = fma(_1208, _1208, _1210);
    float _1224 = -_1214;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1080 * _1166;
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1232 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1234 = fma(_1226, _1226, _1222);
    float _1236 = _1150 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    float _1240 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1182);
    float _1244 = _1092 * _1166;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1248 = _1150 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1176 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    float _1258 = _1058 * _1166;
    float _1260 = _1238 * _1196;
    float _1262 = _1238 * _1218;
    float _1264 = sqrt(_1184);
    float _1266 = _1250 * _1218;
    float _1268 = _1176 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1218 * _1254;
    float _1274 = _1250 * _1196;
    float _1276 = _1250 * _1254;
    float _1278 = _1238 * _1254;
    float _1280 = _1196 * _1254;
    float _1282 = _1098 * _1264;
    float _1284 = sqrt(_1234);
    float _1286 = _1230 * _1282;
    float _1288 = _1232 * _1282;
    float _1290 = _1240 * _1282;
    float _1292 = _1036 * _1244;
    float _1294 = fma(_1270, _1266, _1260);
    float _1296 = fma(_1270, _1260, _1266);
    float _1298 = -_1274;
    float _1300 = fma(_1270, _1262, _1298);
    float _1302 = -_1262;
    float _1304 = fma(_1270, _1274, _1302);
    float _1306 = _1286 * _1242;
    float _1308 = _1288 * _1256;
    float _1310 = _1026 * _1258;
    float _1312 = _1276 * _1002;
    float _1314 = _1304 * _1002;
    float _1316 = _1294 * _1002;
    float _1318 = -_1310;
    float _1320 = fma(_1036, _1228, _1318);
    float _1322 = -_1270;
    float _1324 = fma(_1322, _1244, _1312);
    float _1326 = fma(_1280, _1244, _1314);
    float _1328 = fma(_1272, _1244, _1316);
    float _1330 = _1276 * _1026;
    float _1332 = _1290 * _1246;
    float _1334 = fma(_1278, _1320, _1324);
    float _1336 = fma(_1300, _1320, _1328);
    float _1338 = -_1292;
    float _1340 = fma(_1002, _1258, _1338);
    float _1342 = -_1270;
    float _1344 = fma(_1342, _1228, _1330);
    float _1346 = _1294 * _1026;
    float _1348 = fma(_1296, _1320, _1326);
    float _1350 = _1304 * _1026;
    float _1352 = fma(_1278, _1340, _1344);
    float _1354 = fma(_1272, _1228, _1346);
    float _1356 = _1332 * _1334;
    float _1358 = fma(_1280, _1228, _1350);
    float _1360 = fma(_1300, _1340, _1354);
    float _1362 = _1332 * _1352;
    float _1364 = fma(_1308, _1336, _1356);
    float _1366 = fma(_1284, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1368 = fma(_1296, _1340, _1358);
    float _1370 = fma(_1308, _1360, _1362);
    float _1372 = fma(_1306, _1348, _1364);
    float _1374 = _1002 * _1228;
    float _1376 = precise::max(_1366, 0.3499999940395355224609375);
    float _1378 = fma(_1306, _1368, _1370);
    float _1380 = _862 + _1372;
    float _1382 = _1276 * _1036;
    float _1384 = precise::min(_1376, 1.0);
    float _1386 = _856 + _1378;
    float _1388 = -_1214;
    float _1390 = _1380 + _1388;
    float _1392 = -_1374;
    float _1394 = fma(_1026, _1244, _1392);
    float _1396 = _1294 * _1036;
    float _1398 = -_1192;
    float _1400 = _1386 + _1398;
    float _1402 = fma(_1390, _1384, _1214);
    float _1404 = -_1270;
    float _1406 = fma(_1404, _1258, _1382);
    float _1408 = _1304 * _1036;
    float _1410 = fma(_1400, _1384, _1192);
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1414 = _1402 + _1412;
    float _1416 = fma(_1272, _1258, _1396);
    float _1418 = fma(_1278, _1394, _1406);
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1422 = _1410 + _1420;
    float _1424 = _1414 * _1414;
    float _1426 = fma(_1280, _1258, _1408);
    float _1428 = fma(_1300, _1394, _1416);
    float _1430 = _1332 * _1418;
    float _1432 = fma(_1422, _1422, _1424);
    float _1434 = fma(_1296, _1394, _1426);
    float _1436 = fma(_1308, _1428, _1430);
    float _1438 = sqrt(_1432);
    float _1440 = fma(_1306, _1434, _1436);
    float _1442 = _1006 + _1440;
    float _1444 = -_1188;
    float _1446 = _1442 + _1444;
    float _1448 = fma(_1446, _1384, _1188);
    bool _1450 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = _1446;
    float _1454 = _1410;
    float _1456 = _1402;
    float _1458 = _1374;
    float _1460 = _1448;
    float _1462 = _1406;
    if (!_1450)
    {
        _1452 = _1448;
    }
    float _1464 = _1452;
    bool _1466 = !_1450;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1438 + _1472;
        float _1476 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = rsqrt(_1432);
        float _1480 = _1474 * _1470;
        float _1482 = _1480 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1486 + (-1.0);
        float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = fma(_1490, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1498 = fma(_1448, _1486, _1494);
        float _1500 = _1478 * _1496;
        float _1502 = fma(_1422, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1504 = fma(_1414, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1468 = _1498;
        _1454 = _1502;
        _1456 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1454;
    float _1510 = _1456;
    float _1512 = -_1140;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1506);
    float _1516 = -_1130;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1520 = -_1162;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1514 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1518 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1522 + _1532;
    float _1536 = _1526 * _1526;
    float _1538 = fma(_1530, _1530, _1536);
    float _1540 = fma(_1534, _1534, _1538);
    float _1542 = rsqrt(_1540);
    float _1544 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1530 * _1544;
    float _1548 = _1534 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1538;
    float _1566 = _1562;
    float _1568 = _1526;
    float _1570 = _1546;
    if (_1558)
    {
        float _1572 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1572;
    }
    float _1574 = _1564;
    if (_1558)
    {
        float _1576 = rsqrt(_1554);
        _1458 = _1576;
    }
    float _1578 = _1458;
    float _1580 = _1578;
    if (_1558)
    {
        float _1582 = _1562 * _1574;
        _1566 = _1582;
    }
    float _1584 = _1566;
    if (_1558)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1460 = _1586;
    }
    float _1588 = _1460;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1592 = _1534;
    if (_1558)
    {
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1574;
    float _1606 = _1602;
    if (_1558)
    {
        float _1608 = _1588 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        _1604 = _1610;
    }
    float _1612 = _1604;
    float _1614 = -_1544;
    float _1616 = -_1602;
    float _1618 = fma(_1526, _1614, _1616);
    if (_1558)
    {
        float _1620 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1620;
    }
    float _1622 = _1568;
    float _1624 = sqrt(_1540);
    float _1626 = _1622;
    float _1628 = _1598;
    if (_1558)
    {
        float _1630 = fma(_1598, _1622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1558)
    {
        _1628 = _1618;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    float _1640 = _1612;
    if (_1558)
    {
        float _1642 = _1612 + (-1.0);
        _1606 = _1642;
    }
    float _1644 = _1606;
    float _1646 = _1644;
    if (_1558)
    {
        float _1648 = _1578 * _1632;
        _1462 = _1648;
    }
    float _1650 = _1462;
    if (!_1558)
    {
        _1634 = _1550;
    }
    float _1652 = _1634;
    float _1654 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1656 = _1652;
    if (_1558)
    {
        float _1658 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1658;
    }
    float _1660 = _1580;
    if (_1558)
    {
        float _1662 = _1546 * _1650;
        _1570 = _1662;
    }
    float _1664 = _1570;
    if (!_1558)
    {
        _1646 = _1548;
    }
    float _1666 = _1646;
    float _1668 = _1666;
    if (_1558)
    {
        float _1670 = _1548 * _1650;
        _1668 = _1670;
    }
    float _1672 = _1668;
    if (_1558)
    {
        float _1674 = fma(_1618, _1612, _1660);
        _1638 = _1674;
    }
    float _1676 = _1638;
    if (_1558)
    {
        float _1678 = _1664 * _1664;
        _1656 = _1678;
    }
    float _1680 = _1656;
    if (!_1558)
    {
        _1640 = _1552;
    }
    float _1682 = _1640;
    float _1684 = _1682;
    if (_1558)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1676, _1676, _1680);
    float _1692 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1654);
    float _1694 = _1690 + _1688;
    float _1696 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1624, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1692);
    float _1708 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1696);
    float _1710 = rsqrt(_1694);
    float _1712 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    float _1718 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1720 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1722 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1712);
    float _1724 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1726 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1720);
    float _1728 = abs(_1716);
    float _1730 = log2(_1728);
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1734 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1736 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1738 = -_1734;
    float _1740 = fma(_1738, _1590, 1.0);
    float _1742 = _1710 * _1664;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1710 * _1676;
    float _1748 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = _1710 * _1672;
    float _1754 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = -_1750;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1764 = log2(_1740);
    float _1766 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1768 = -_1752;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1772 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1776 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1778 = fma(_1770, -0.5, 0.5);
    float _1780 = fma(_1770, 0.5, 0.5);
    float _1782 = exp2(_1762);
    float _1784 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1786 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1774);
    float _1788 = fma(_1780, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1790 = _1746 + 1.0;
    float _1792 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1784);
    float _1794 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1796 = fma(_1780, _1788, -0.212114393711090087890625);
    float _1798 = 1.0 / _1776;
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1802 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = fma(_1780, _1796, 1.570728778839111328125);
    float _1806 = _1764 * 0.693147182464599609375;
    float _1808 = sqrt(_1778);
    float _1810 = -_1746;
    float _1812 = fma(_1782, _1790, _1810);
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1800 * _1798;
    float _1820 = _1802 * _1798;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = _1808 * 0.636619746685028076171875;
    float _1828 = -_1804;
    float _1830 = fma(_1826, _1828, 1.0);
    float3 _5239 = float3(_1822, _1824, _1814);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5239, float3(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5239, float3(0.0), isnan(_5239)), level(0.0)).x;
    float3 _5250 = float3(_1822, _1824, _1814);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5250, float3(0.0), isnan(_5250)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5250, float3(0.0), isnan(_5250)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _5267 = float2(_1830, _1816);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5267, float2(0.0), isnan(_5267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5267, float2(0.0), isnan(_5267)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    bool _1855 = _730 > 0.5;
    float _1857 = -_1140;
    float _1859 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1861 = in.m_57.y;
    float _1863 = -_1130;
    float _1865 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _1867 = -_1162;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1879 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1881 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(0.5);
    bool _1889 = _1885 || _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = 1.0 / _1873;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1905 = 1.0 / _1877;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1907 = _712 > 0.5;
    float _1909 = -_1861;
    float _1911 = _1909 + 1.0;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1921 = 1.0 / _1893;
    int _1923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1925 = _1923 != 0;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1929 = _1927 != 0;
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1933 = _1931 != 0;
    float _1935 = 1.0 / _1903;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1939 = _1907 ? as_type<int>(_1911) : as_type<int>(_1861);
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1943 = _1907;
    float _1945 = _1861;
    if (_1897)
    {
        bool _1947 = _594 > 0.5;
        _1943 = _1947;
    }
    bool _1949 = _1943;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1951;
    float _1955 = 1.0 / _1915;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1963 = _1953 * _1899;
    float _1965 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = 1.0 / _1919;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1973;
    float _1977 = _1961 * _1905;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    out.m_61.x = _1965;
    out.m_61.y = _1967;
    out.m_61.z = _1969;
    float _1983 = _1975 * _1921;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1995 = _710 + _1993;
    float _1997 = _1981 * _1955;
    bool _1999 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2001 = isnan(_710);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = in.m_57.x;
    float _2013 = fma(_1977, _1995, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2017 = _710 + _2015;
    float _2019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2021 = -_2009;
    float _2023 = _2021 + 1.0;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2027 = _710 + _2025;
    float _2029 = _1987 * _1935;
    bool _2031 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _2033 = isnan(_710);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _2039 = _2035 || _2037;
    float _2041 = float(_2039);
    float _2043 = _1991 * _1971;
    float _2045 = fma(_1963, _2027, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2047 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2049 = isnan(_710);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2055 = _2051 || _2053;
    float _2057 = float(_2055);
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2061 = -_2041;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_1983, _2017, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2067 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2069 = isnan(_710);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = -_2057;
    float _2081 = _2079 + 1.0;
    float _2083 = _2057 * _2063;
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2087 = _710 + _2085;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2091 = _710 + _2089;
    float _2093 = _2009 * _2081;
    bool _2095 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2097 = isnan(_710);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2103 = _2099 || _2101;
    float _2105 = float(_2103);
    float _2107 = fma(_2043, _2087, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _2109 = -_2077;
    float _2111 = _2109 + 1.0;
    float _2113 = _2077 * _2023;
    bool _2115 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2117 = isnan(_710);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2123);
    float _2127 = -_2105;
    float _2129 = _2127 + 1.0;
    float _2131 = fma(_1997, _2091, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2133 = _2105 * _2111;
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2137 = _1929 ? _1939 : as_type<int>(_1861);
    float _2139 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2141 = _2125 * _2129;
    int _2143 = as_type<int>(_2019);
    int _2145 = _2137;
    float _2147 = _2105;
    if (_1933)
    {
        float _2149 = _1855 ? _1911 : _1861;
        _1945 = _2149;
    }
    float _2151 = _1945;
    float _2153 = -_2125;
    float _2155 = _2153 + 1.0;
    float _2157 = fma(as_type<float>(_2137), _2139, -0.5);
    float _2159 = _2045 * _2141;
    float _2161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2163 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2165 = _2011;
    if (_1897)
    {
        float _2167 = -_2011;
        float _2169 = _2167 + 1.0;
        _2143 = as_type<int>(_2169);
    }
    int _2171 = _2143;
    if (_1925)
    {
        float _2173 = -_2011;
        float _2175 = _2173 + 1.0;
        _2145 = as_type<int>(_2175);
    }
    int _2177 = _2145;
    if (!_1897)
    {
        _2147 = _2011;
    }
    float _2179 = _2147;
    float _2181 = fma(_2163, _2151, -0.5);
    float _2183 = -_992;
    float _2185 = fma(_982, _2157, _2183);
    float _2187 = _2179;
    if (_1897)
    {
        float _2189 = _1949 ? as_type<float>(_2171) : _2011;
        _2187 = _2189;
    }
    float _2191 = _2187;
    float _2193 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2195 = -_834;
    float _2197 = fma(_986, _2181, _2195);
    if (_1925)
    {
        float _2199 = _1855 ? as_type<float>(_2177) : _2011;
        _2165 = _2199;
    }
    float _2201 = _2165;
    float _2203 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2159);
    float _2207 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2209 = fma(_2203, _2191, -0.5);
    float _2211 = _2161 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2213 = fma(_2013, _2133, _2205);
    float _2215 = fma(_984, _2209, _830);
    float _2217 = fma(_2211, _2201, -0.5);
    float _2219 = _2197 + 0.5;
    float _2221 = _2185 + 0.5;
    float _2223 = _2215 + 0.5;
    float _2225 = fma(_978, _2217, _990);
    float _2227 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2193);
    bool _2229 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _2231 = isnan(_710);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _2237 = _2233 || _2235;
    float _2239 = float(_2237);
    float _2241 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2207);
    float _2243 = _2225 + 0.5;
    float _2245 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    out.m_63.x = _2223;
    out.m_63.y = _2219;
    float _2247 = fma(_2065, _2113, _2213);
    float _2249 = -_2239;
    float _2251 = _2249 + 1.0;
    float _2253 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_65.x = _2243;
    out.m_65.y = _2221;
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2257 = _710 + _2255;
    float _2259 = fma(_2131, _2093, _2247);
    float _2261 = 1.0 / _2253;
    float _2263 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2241);
    float _2265 = _2041 * _2251;
    float _2267 = fma(_2029, _2257, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _2269 = fma(_2107, _2083, _2259);
    float _2271 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2273 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2275 = _2257;
    if (_1889)
    {
        _2275 = 1.0;
    }
    float _2277 = _2275;
    float _2279 = fma(_2267, _2265, _2269);
    float _2281 = _2271 + _2253;
    float _2283 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[121].x, _2279);
    float _2285 = _2281 * _2261;
    float _2287 = _2285 * 0.5;
    float _2289 = _2277;
    if (!_1889)
    {
        float _2291 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2293);
        float _2297 = _2291 * 0.15915493667125701904296875;
        float _2299 = _2297 * 6.283185482025146484375;
        float _2301 = cos(_2299);
        float _2303 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2305 = _2303 * 0.15915493667125701904296875;
        float _2307 = _2297 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        float _2311 = 1.0 / _2301;
        float _2313 = _2305 * 6.283185482025146484375;
        float _2315 = cos(_2313);
        float _2317 = _2309 * _2311;
        float _2319 = 1.0 / _2295;
        float _2321 = _2315 * _2317;
        float _2323 = _2305 * 6.283185482025146484375;
        float _2325 = sin(_2323);
        float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2329 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2327;
        float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2333 = _2319 * _2331;
        float _2335 = 1.0 / _2321;
        float _2337 = 1.0 / _2329;
        float _2339 = _2325 * _2335;
        float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2343 = fma(_2339, _2333, _2341);
        float _2345 = _2343 * _2337;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        float _2349 = -_2347;
        float _2351 = _2349 + 1.0;
        _2289 = _2351;
    }
    float _2353 = _2289;
    float _2355 = exp2(_1879);
    float _2357 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2273);
    float _2359 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2361 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2357);
    float _2363 = _682 * _2359;
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2367 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2361);
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2373 = _2353 > 0.0;
    bool _2375 = isnan(_2353);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = _2367 + _1776;
    float _2385 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2387 = _2365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2389 = -_2355;
    float _2391 = _2389 + 1.0;
    float _2393 = _2371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2395 = _2283 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2397 = _2383 * 0.5;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2401 = _2363 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2385;
    out.m_67.y = _2387;
    out.m_67.z = _2393;
    out.m_67.w = _2395;
    float _2403 = _2399 * _1832;
    float _2405 = -_2399;
    float _2407 = _2405 + 1.0;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2367;
    out.gl_Position.w = _1776;
    float _2409 = _1843 * _2403;
    float _2411 = _1853 * _2403;
    float _2413 = _1843 * _2407;
    out.m_69.z = _2397;
    out.m_69.w = _1776;
    float _2415 = fma(_1849, _2409, _1837);
    float _2417 = fma(_1851, _2409, _1839);
    float _2419 = fma(_1843, _2411, _1841);
    out.m_45.x = _2401;
    out.m_71.x = _2415;
    out.m_71.y = _2417;
    out.m_71.z = _2419;
    out.m_71.w = _2413;
    if (_2381)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2421 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2421;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _702 = false;
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
        float _2478 = as_type<float>(_106);
        out.gl_Position.z = _2478;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _130 = _124;
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
        float _2549 = as_type<float>(_146);
        out.gl_Position.z = _2549;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _194 = 0.0;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _156 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _156);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _128 = _212;
        _192 = _224;
        _194 = _214;
    }
    float _226 = _128;
    float _228 = _192;
    float _230 = _194;
    bool _232 = !_166;
    float _234 = _226;
    float _236 = _230;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _250;
        _236 = _244;
        _168 = _256;
    }
    float _258 = _234;
    float _260 = _236;
    float _262 = _168;
    float _264 = _260;
    float _266 = _258;
    if (!_166)
    {
        _264 = _124;
    }
    float _268 = _264;
    float _270 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _268;
    if (!_166)
    {
        float _274 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _274;
    }
    float _276 = _266;
    bool _278 = !_166;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _124 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _124);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_166;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _124 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_262, _152, _270);
    float _342 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_336, _152, _338);
    float _348 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_262, _150, _342);
    float _354 = fma(_336, _150, _344);
    float _356 = -_346;
    float _358 = _340 + _356;
    float _360 = fma(_262, _154, _348);
    float _362 = fma(_336, _154, _350);
    float _364 = -_354;
    float _366 = _352 + _364;
    float _368 = _358 * _358;
    float _370 = in.m_49.w;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(_366, _366, _368);
    float _380 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _384 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _386 = fma(_374, _374, _378);
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _390 = in.m_42.x;
    float _392 = in.m_42.y;
    float _394 = in.m_42.z;
    float _396 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _382);
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _400 = sqrt(_386);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _404 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _388);
    bool _406 = _400 >= 9.9999999747524270787835121154785e-07;
    bool _408 = isnan(_400);
    bool _410 = _406 || _408;
    bool _412 = isnan(9.9999999747524270787835121154785e-07);
    bool _414 = _410 || _412;
    float _416 = fma(_352, _370, _390);
    float _418 = fma(_340, _370, _392);
    float _420 = fma(_360, _370, _394);
    float _422 = _404;
    float _424 = _398;
    float _426 = _402;
    if (!_414)
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
            _422 = _462;
            _424 = _460;
            _426 = _464;
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
                float _486 = _392 * _392;
                float _488 = fma(_390, _390, _486);
                float _490 = fma(_394, _394, _488);
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
                    _422 = _516;
                    _424 = _514;
                    _426 = _518;
                    _466 = true;
                }
                else
                {
                    float _520 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _524 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _526 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
                    float _528 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
                    float _530 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
                    float _532 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _526);
                    float _534 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
                    float _536 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
                    float _538 = _532 * _532;
                    float _540 = fma(_534, _534, _538);
                    float _542 = fma(_536, _536, _540);
                    float _544 = rsqrt(_542);
                    float _546 = _544 * 9.9999999747524270787835121154785e-07;
                    float _548 = _534 * _546;
                    float _550 = _532 * _546;
                    float _552 = _536 * _546;
                    _422 = _550;
                    _424 = _548;
                    _426 = _552;
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
                _422 = _584;
                _424 = _582;
                _426 = _586;
            }
        }
    }
    _466 = false;
    float _588 = _422;
    float _590 = _424;
    float _592 = _426;
    float _594 = in.m_51.x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _598 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
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
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _638 = abs(_634);
    float _640 = -_618;
    float _642 = _614 + _640;
    bool _644 = !_606;
    int _646 = _644 ? 0 : 1;
    float _648 = -_642;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _652 = float(_626);
    int _654 = abs(_646);
    float _656 = fma(_630, 0.5, 0.5);
    float _658 = abs(_650);
    float _660 = _652 * _658;
    bool _662 = _642 < 0.5;
    float _664 = float(_662);
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _670 = float(_638);
    float _672 = -_664;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _676 = float(_654);
    float _678 = fma(_670, _668, _660);
    float _680 = abs(_674);
    float _682 = fma(_676, _680, _678);
    bool _684 = !_636;
    float _700;
    if (!_684)
    {
        float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _688 = _594 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _690 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _692 = _690 * _686;
        float _694 = floor(_692);
        float _696 = -_694;
        float _698 = _692 + _696;
        _700 = _698;
        _702 = true;
    }
    else
    {
        float _704 = float(_90);
        float _706 = 1.0 / _704;
        float _708 = _124 * _706;
        _700 = _708;
    }
    _702 = false;
    float _710 = _700;
    float _712 = in.m_51.z;
    float _714 = _594 * 2.0;
    float _716 = _418 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _728 = _726 != 0;
    float _730 = in.m_51.y;
    float _732 = floor(_714);
    float _734 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _736 = _418 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = _418 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _736);
    float _750 = -_744;
    float _752 = fma(_742, 2.0, _750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _756 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _758 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _734);
    bool _760 = _732 > 0.0;
    float _762 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _764 = log2(_762);
    bool _766 = _732 >= 0.0;
    bool _768 = isnan(_732);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    float _776 = _712 * 2.0;
    float _778 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _748);
    float _780 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _782 = _730 + _712;
    float _784 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = floor(_776);
    float _788 = _774 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _790 = _782 + (-1.0);
    float _792 = fma(_784, -2.0, _754);
    float _794 = _730 * 2.0;
    int _796 = ~as_type<int>(_788);
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _806 = !_724;
    int _808 = _806 ? 0 : 1;
    float _810 = floor(_794);
    int _812 = _800;
    float _814 = _788;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_760)
    {
        int _818 = ~as_type<int>(_788);
        int _820 = _818 + 1;
        _812 = _820;
    }
    int _822 = _812;
    float _824 = _764 * _124;
    if (_740)
    {
        _814 = _594;
    }
    float _826 = _814;
    float _828 = -_124;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    int _832 = abs(_808);
    float _834 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _792);
    bool _836 = _786 > 0.0;
    float _838 = exp2(_824);
    bool _840 = _786 >= 0.0;
    bool _842 = isnan(_786);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _852 = _826;
    if (_740)
    {
        _816 = _730;
    }
    float _854 = _816;
    float _856 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _858 = _854;
    if (!_740)
    {
        _858 = _594;
    }
    float _860 = _858;
    float _862 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_740)
    {
        _852 = _712;
    }
    float _864 = _852;
    float _866 = float(_822);
    float _868 = _860 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _870 = float(_832);
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _874 = _848 ? 0 : 1;
    float _876 = fma(_868, -2.0, _804);
    float _878 = _588 * _588;
    float _880 = _870 * _866;
    float _882 = -_850;
    float _884 = fma(_872, 2.0, _882);
    float _886 = fma(_590, _590, _878);
    float _888 = in.m_53.x;
    float _890 = in.m_53.y;
    float _892 = in.m_53.z;
    int _894 = ~_874;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _902 = 1.0 + _900;
    float _904 = fma(_592, _592, _886);
    int _906 = _898;
    if (!_836)
    {
        int _908 = ~_874;
        int _910 = _908 + 1;
        _906 = _910;
    }
    int _912 = _906;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    float _918 = 1.0 / _902;
    bool _920 = _810 > 0.0;
    float _922 = _880 * (-2.0);
    bool _924 = _810 >= 0.0;
    bool _926 = isnan(_810);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _936 = rsqrt(_904);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _952 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _960 = _956 || _958;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _964 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[88].z, _934);
    bool _966 = !_720;
    int _968 = _966 ? 0 : 1;
    float _970 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[88].w, _938);
    float _972 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].z, _950);
    float _974 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].w, _962);
    float _976 = _960 ? _916 : 0.0;
    float _978 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _964);
    int _980 = abs(_968);
    float _982 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _970);
    float _984 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _972);
    float _986 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _974);
    float _988 = -_124;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[86].x, _884);
    float _992 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _876);
    if (_948)
    {
        float _994 = _976 * _918;
        _130 = _994;
    }
    float _996 = _130;
    float _998 = _730 + (-0.5);
    float _1000 = fma(_922, _890, _890);
    float _1002 = _936 * _592;
    int _1004 = _932 ? 0 : 1;
    float _1006 = _778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1000);
    float _1010 = float(_980);
    float _1012 = fma(_802, _922, _802);
    float _1014 = float(_912);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1006 + _1016;
    int _1020 = ~_1004;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = _936 * _590;
    int _1028 = _1024;
    if (!_920)
    {
        int _1030 = ~_1004;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = _936 * _588;
    float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1040 = _1002 * _1038;
    float _1042 = _1010 * _1014;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1046 = _856 + _1044;
    float _1048 = _1018 * _1018;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1052 = _1036 * _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1056 = -_1040;
    float _1058 = fma(_1026, _1054, _1056);
    bool _1060 = !_728;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = fma(_1012, _996, _1008);
    float _1066 = fma(_1046, _1046, _1048);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = _862 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1074 = _1026 * _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1078 = -_1052;
    float _1080 = fma(_1002, _1076, _1078);
    float _1082 = _1058 * _1058;
    int _1084 = abs(_1062);
    float _1086 = fma(_1070, _1070, _1066);
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1090 = -_1074;
    float _1092 = fma(_1036, _1088, _1090);
    float _1094 = fma(_1080, _1080, _1082);
    float _1096 = _594 + _730;
    float _1098 = rsqrt(_1086);
    float _1100 = _1042 * (-2.0);
    float _1102 = float(_1084);
    float _1104 = _594 + _712;
    float _1106 = float(_1034);
    float _1108 = _1096 + (-1.0);
    float _1110 = fma(_1092, _1092, _1094);
    float _1112 = _594 + (-0.5);
    float _1114 = fma(_1100, _888, _888);
    float _1116 = _1104 + (-1.0);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1120 = _1102 * _1106;
    float _1122 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1114);
    float _1124 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1126 = fma(_1118, _1100, _1118);
    float _1128 = _1120 * (-2.0);
    float _1130 = _1046 * _1098;
    float _1132 = _1064 * 0.15915493667125701904296875;
    float _1134 = fma(_1126, _996, _1122);
    float _1136 = fma(_1124, _1128, _1124);
    float _1138 = fma(_1128, _892, _892);
    float _1140 = _1018 * _1098;
    float _1142 = in.m_49.x;
    float _1144 = in.m_49.y;
    float _1146 = in.m_49.z;
    float _1148 = _712 + (-0.5);
    float _1150 = _1134 * 0.15915493667125701904296875;
    float _1152 = -_1140;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    float _1156 = -_1130;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1138);
    float _1162 = _1070 * _1098;
    float _1164 = _1154 * _1154;
    float _1166 = rsqrt(_1110);
    float _1168 = fma(_1136, _996, _1160);
    float _1170 = fma(_1158, _1158, _1164);
    float _1172 = -_1162;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1070);
    float _1176 = _1168 * 0.15915493667125701904296875;
    float _1178 = in.m_55.x;
    float _1180 = in.m_55.y;
    float _1182 = in.m_55.z;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1188 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1192 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1190;
    float _1194 = _1132 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = -_1188;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1204 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1206 = -_1192;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _1200 * _1200;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1214 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1212;
    float _1216 = _1132 * 6.283185482025146484375;
    float _1218 = cos(_1216);
    float _1220 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1222 = fma(_1208, _1208, _1210);
    float _1224 = -_1214;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1080 * _1166;
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1232 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1234 = fma(_1226, _1226, _1222);
    float _1236 = _1150 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    float _1240 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1182);
    float _1244 = _1092 * _1166;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1248 = _1150 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1176 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    float _1258 = _1058 * _1166;
    float _1260 = _1238 * _1196;
    float _1262 = _1238 * _1218;
    float _1264 = sqrt(_1184);
    float _1266 = _1250 * _1218;
    float _1268 = _1176 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1218 * _1254;
    float _1274 = _1250 * _1196;
    float _1276 = _1250 * _1254;
    float _1278 = _1238 * _1254;
    float _1280 = _1196 * _1254;
    float _1282 = _1098 * _1264;
    float _1284 = sqrt(_1234);
    float _1286 = _1230 * _1282;
    float _1288 = _1232 * _1282;
    float _1290 = _1240 * _1282;
    float _1292 = _1036 * _1244;
    float _1294 = fma(_1270, _1266, _1260);
    float _1296 = fma(_1270, _1260, _1266);
    float _1298 = -_1274;
    float _1300 = fma(_1270, _1262, _1298);
    float _1302 = -_1262;
    float _1304 = fma(_1270, _1274, _1302);
    float _1306 = _1286 * _1242;
    float _1308 = _1288 * _1256;
    float _1310 = _1026 * _1258;
    float _1312 = _1276 * _1002;
    float _1314 = _1304 * _1002;
    float _1316 = _1294 * _1002;
    float _1318 = -_1310;
    float _1320 = fma(_1036, _1228, _1318);
    float _1322 = -_1270;
    float _1324 = fma(_1322, _1244, _1312);
    float _1326 = fma(_1280, _1244, _1314);
    float _1328 = fma(_1272, _1244, _1316);
    float _1330 = _1276 * _1026;
    float _1332 = _1290 * _1246;
    float _1334 = fma(_1278, _1320, _1324);
    float _1336 = fma(_1300, _1320, _1328);
    float _1338 = -_1292;
    float _1340 = fma(_1002, _1258, _1338);
    float _1342 = -_1270;
    float _1344 = fma(_1342, _1228, _1330);
    float _1346 = _1294 * _1026;
    float _1348 = fma(_1296, _1320, _1326);
    float _1350 = _1304 * _1026;
    float _1352 = fma(_1278, _1340, _1344);
    float _1354 = fma(_1272, _1228, _1346);
    float _1356 = _1332 * _1334;
    float _1358 = fma(_1280, _1228, _1350);
    float _1360 = fma(_1300, _1340, _1354);
    float _1362 = _1332 * _1352;
    float _1364 = fma(_1308, _1336, _1356);
    float _1366 = fma(_1284, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1368 = fma(_1296, _1340, _1358);
    float _1370 = fma(_1308, _1360, _1362);
    float _1372 = fma(_1306, _1348, _1364);
    float _1374 = _1002 * _1228;
    float _1376 = precise::max(_1366, 0.3499999940395355224609375);
    float _1378 = fma(_1306, _1368, _1370);
    float _1380 = _862 + _1372;
    float _1382 = _1276 * _1036;
    float _1384 = precise::min(_1376, 1.0);
    float _1386 = _856 + _1378;
    float _1388 = -_1214;
    float _1390 = _1380 + _1388;
    float _1392 = -_1374;
    float _1394 = fma(_1026, _1244, _1392);
    float _1396 = _1294 * _1036;
    float _1398 = -_1192;
    float _1400 = _1386 + _1398;
    float _1402 = fma(_1390, _1384, _1214);
    float _1404 = -_1270;
    float _1406 = fma(_1404, _1258, _1382);
    float _1408 = _1304 * _1036;
    float _1410 = fma(_1400, _1384, _1192);
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1414 = _1402 + _1412;
    float _1416 = fma(_1272, _1258, _1396);
    float _1418 = fma(_1278, _1394, _1406);
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1422 = _1410 + _1420;
    float _1424 = _1414 * _1414;
    float _1426 = fma(_1280, _1258, _1408);
    float _1428 = fma(_1300, _1394, _1416);
    float _1430 = _1332 * _1418;
    float _1432 = fma(_1422, _1422, _1424);
    float _1434 = fma(_1296, _1394, _1426);
    float _1436 = fma(_1308, _1428, _1430);
    float _1438 = sqrt(_1432);
    float _1440 = fma(_1306, _1434, _1436);
    float _1442 = _1006 + _1440;
    float _1444 = -_1188;
    float _1446 = _1442 + _1444;
    float _1448 = fma(_1446, _1384, _1188);
    bool _1450 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = _1446;
    float _1454 = _1410;
    float _1456 = _1402;
    float _1458 = _1374;
    float _1460 = _1448;
    float _1462 = _1406;
    if (!_1450)
    {
        _1452 = _1448;
    }
    float _1464 = _1452;
    bool _1466 = !_1450;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1438 + _1472;
        float _1476 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = rsqrt(_1432);
        float _1480 = _1474 * _1470;
        float _1482 = _1480 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1486 + (-1.0);
        float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = fma(_1490, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1498 = fma(_1448, _1486, _1494);
        float _1500 = _1478 * _1496;
        float _1502 = fma(_1422, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1504 = fma(_1414, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1468 = _1498;
        _1454 = _1502;
        _1456 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1454;
    float _1510 = _1456;
    float _1512 = -_1140;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1506);
    float _1516 = -_1130;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1520 = -_1162;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1514 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1518 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1522 + _1532;
    float _1536 = _1526 * _1526;
    float _1538 = fma(_1530, _1530, _1536);
    float _1540 = fma(_1534, _1534, _1538);
    float _1542 = rsqrt(_1540);
    float _1544 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1530 * _1544;
    float _1548 = _1534 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1538;
    float _1566 = _1562;
    float _1568 = _1526;
    float _1570 = _1546;
    if (_1558)
    {
        float _1572 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1572;
    }
    float _1574 = _1564;
    if (_1558)
    {
        float _1576 = rsqrt(_1554);
        _1458 = _1576;
    }
    float _1578 = _1458;
    float _1580 = _1578;
    if (_1558)
    {
        float _1582 = _1562 * _1574;
        _1566 = _1582;
    }
    float _1584 = _1566;
    if (_1558)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1460 = _1586;
    }
    float _1588 = _1460;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1592 = _1534;
    if (_1558)
    {
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1602 = precise::max(0.0, _1600);
    float _1604 = _1574;
    float _1606 = _1602;
    if (_1558)
    {
        float _1608 = _1588 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        _1604 = _1610;
    }
    float _1612 = _1604;
    float _1614 = -_1544;
    float _1616 = -_1602;
    float _1618 = fma(_1526, _1614, _1616);
    if (_1558)
    {
        float _1620 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1620;
    }
    float _1622 = _1568;
    float _1624 = sqrt(_1540);
    float _1626 = _1622;
    float _1628 = _1598;
    if (_1558)
    {
        float _1630 = fma(_1598, _1622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    if (!_1558)
    {
        _1628 = _1618;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    float _1640 = _1612;
    if (_1558)
    {
        float _1642 = _1612 + (-1.0);
        _1606 = _1642;
    }
    float _1644 = _1606;
    float _1646 = _1644;
    if (_1558)
    {
        float _1648 = _1578 * _1632;
        _1462 = _1648;
    }
    float _1650 = _1462;
    if (!_1558)
    {
        _1634 = _1550;
    }
    float _1652 = _1634;
    float _1654 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1656 = _1652;
    if (_1558)
    {
        float _1658 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1658;
    }
    float _1660 = _1580;
    if (_1558)
    {
        float _1662 = _1546 * _1650;
        _1570 = _1662;
    }
    float _1664 = _1570;
    if (!_1558)
    {
        _1646 = _1548;
    }
    float _1666 = _1646;
    float _1668 = _1666;
    if (_1558)
    {
        float _1670 = _1548 * _1650;
        _1668 = _1670;
    }
    float _1672 = _1668;
    if (_1558)
    {
        float _1674 = fma(_1618, _1612, _1660);
        _1638 = _1674;
    }
    float _1676 = _1638;
    if (_1558)
    {
        float _1678 = _1664 * _1664;
        _1656 = _1678;
    }
    float _1680 = _1656;
    if (!_1558)
    {
        _1640 = _1552;
    }
    float _1682 = _1640;
    float _1684 = _1682;
    if (_1558)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1676, _1676, _1680);
    float _1692 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1654);
    float _1694 = _1690 + _1688;
    float _1696 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1624, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1692);
    float _1708 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1696);
    float _1710 = rsqrt(_1694);
    float _1712 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    float _1718 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1720 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1722 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1712);
    float _1724 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1726 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1720);
    float _1728 = abs(_1716);
    float _1730 = log2(_1728);
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1734 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1736 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1738 = -_1734;
    float _1740 = fma(_1738, _1590, 1.0);
    float _1742 = _1710 * _1664;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1710 * _1676;
    float _1748 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = _1710 * _1672;
    float _1754 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = -_1750;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1764 = log2(_1740);
    float _1766 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1768 = -_1752;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1772 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1776 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1778 = fma(_1770, -0.5, 0.5);
    float _1780 = fma(_1770, 0.5, 0.5);
    float _1782 = exp2(_1762);
    float _1784 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1786 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1774);
    float _1788 = fma(_1780, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1790 = _1746 + 1.0;
    float _1792 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1784);
    float _1794 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1796 = fma(_1780, _1788, -0.212114393711090087890625);
    float _1798 = 1.0 / _1776;
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1802 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = fma(_1780, _1796, 1.570728778839111328125);
    float _1806 = _1764 * 0.693147182464599609375;
    float _1808 = sqrt(_1778);
    float _1810 = -_1746;
    float _1812 = fma(_1782, _1790, _1810);
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1800 * _1798;
    float _1820 = _1802 * _1798;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = _1808 * 0.636619746685028076171875;
    float _1828 = -_1804;
    float _1830 = fma(_1826, _1828, 1.0);
    float3 _5239 = float3(_1822, _1824, _1814);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5239, float3(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5239, float3(0.0), isnan(_5239)), level(0.0)).x;
    float3 _5250 = float3(_1822, _1824, _1814);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5250, float3(0.0), isnan(_5250)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5250, float3(0.0), isnan(_5250)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _5267 = float2(_1830, _1816);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5267, float2(0.0), isnan(_5267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5267, float2(0.0), isnan(_5267)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    bool _1855 = _730 > 0.5;
    float _1857 = -_1140;
    float _1859 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1861 = in.m_57.y;
    float _1863 = -_1130;
    float _1865 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _1867 = -_1162;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1879 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1881 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(0.5);
    bool _1889 = _1885 || _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = 1.0 / _1873;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1905 = 1.0 / _1877;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1907 = _712 > 0.5;
    float _1909 = -_1861;
    float _1911 = _1909 + 1.0;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1921 = 1.0 / _1893;
    int _1923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1925 = _1923 != 0;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1929 = _1927 != 0;
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1933 = _1931 != 0;
    float _1935 = 1.0 / _1903;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1939 = _1907 ? as_type<int>(_1911) : as_type<int>(_1861);
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1943 = _1907;
    float _1945 = _1861;
    if (_1897)
    {
        bool _1947 = _594 > 0.5;
        _1943 = _1947;
    }
    bool _1949 = _1943;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1951;
    float _1955 = 1.0 / _1915;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1963 = _1953 * _1899;
    float _1965 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = 1.0 / _1919;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1973;
    float _1977 = _1961 * _1905;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    out.m_61.x = _1965;
    out.m_61.y = _1967;
    out.m_61.z = _1969;
    float _1983 = _1975 * _1921;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1987 = _1985 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1995 = _710 + _1993;
    float _1997 = _1981 * _1955;
    bool _1999 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2001 = isnan(_710);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = in.m_57.x;
    float _2013 = fma(_1977, _1995, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2017 = _710 + _2015;
    float _2019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2021 = -_2009;
    float _2023 = _2021 + 1.0;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2027 = _710 + _2025;
    float _2029 = _1987 * _1935;
    bool _2031 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _2033 = isnan(_710);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _2039 = _2035 || _2037;
    float _2041 = float(_2039);
    float _2043 = _1991 * _1971;
    float _2045 = fma(_1963, _2027, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2047 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2049 = isnan(_710);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2055 = _2051 || _2053;
    float _2057 = float(_2055);
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2061 = -_2041;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_1983, _2017, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2067 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2069 = isnan(_710);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = -_2057;
    float _2081 = _2079 + 1.0;
    float _2083 = _2057 * _2063;
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _2087 = _710 + _2085;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2091 = _710 + _2089;
    float _2093 = _2009 * _2081;
    bool _2095 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2097 = isnan(_710);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2103 = _2099 || _2101;
    float _2105 = float(_2103);
    float _2107 = fma(_2043, _2087, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _2109 = -_2077;
    float _2111 = _2109 + 1.0;
    float _2113 = _2077 * _2023;
    bool _2115 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2117 = isnan(_710);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2123);
    float _2127 = -_2105;
    float _2129 = _2127 + 1.0;
    float _2131 = fma(_1997, _2091, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2133 = _2105 * _2111;
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2137 = _1929 ? _1939 : as_type<int>(_1861);
    float _2139 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2141 = _2125 * _2129;
    int _2143 = as_type<int>(_2019);
    int _2145 = _2137;
    float _2147 = _2105;
    if (_1933)
    {
        float _2149 = _1855 ? _1911 : _1861;
        _1945 = _2149;
    }
    float _2151 = _1945;
    float _2153 = -_2125;
    float _2155 = _2153 + 1.0;
    float _2157 = fma(as_type<float>(_2137), _2139, -0.5);
    float _2159 = _2045 * _2141;
    float _2161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2163 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2165 = _2011;
    if (_1897)
    {
        float _2167 = -_2011;
        float _2169 = _2167 + 1.0;
        _2143 = as_type<int>(_2169);
    }
    int _2171 = _2143;
    if (_1925)
    {
        float _2173 = -_2011;
        float _2175 = _2173 + 1.0;
        _2145 = as_type<int>(_2175);
    }
    int _2177 = _2145;
    if (!_1897)
    {
        _2147 = _2011;
    }
    float _2179 = _2147;
    float _2181 = fma(_2163, _2151, -0.5);
    float _2183 = -_992;
    float _2185 = fma(_982, _2157, _2183);
    float _2187 = _2179;
    if (_1897)
    {
        float _2189 = _1949 ? as_type<float>(_2171) : _2011;
        _2187 = _2189;
    }
    float _2191 = _2187;
    float _2193 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2195 = -_834;
    float _2197 = fma(_986, _2181, _2195);
    if (_1925)
    {
        float _2199 = _1855 ? as_type<float>(_2177) : _2011;
        _2165 = _2199;
    }
    float _2201 = _2165;
    float _2203 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2159);
    float _2207 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2209 = fma(_2203, _2191, -0.5);
    float _2211 = _2161 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2213 = fma(_2013, _2133, _2205);
    float _2215 = fma(_984, _2209, _830);
    float _2217 = fma(_2211, _2201, -0.5);
    float _2219 = _2197 + 0.5;
    float _2221 = _2185 + 0.5;
    float _2223 = _2215 + 0.5;
    float _2225 = fma(_978, _2217, _990);
    float _2227 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2193);
    bool _2229 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _2231 = isnan(_710);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _2237 = _2233 || _2235;
    float _2239 = float(_2237);
    float _2241 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2207);
    float _2243 = _2225 + 0.5;
    float _2245 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    out.m_63.x = _2223;
    out.m_63.y = _2219;
    float _2247 = fma(_2065, _2113, _2213);
    float _2249 = -_2239;
    float _2251 = _2249 + 1.0;
    float _2253 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_65.x = _2243;
    out.m_65.y = _2221;
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _2257 = _710 + _2255;
    float _2259 = fma(_2131, _2093, _2247);
    float _2261 = 1.0 / _2253;
    float _2263 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2241);
    float _2265 = _2041 * _2251;
    float _2267 = fma(_2029, _2257, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _2269 = fma(_2107, _2083, _2259);
    float _2271 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2273 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2275 = _2257;
    if (_1889)
    {
        _2275 = 1.0;
    }
    float _2277 = _2275;
    float _2279 = fma(_2267, _2265, _2269);
    float _2281 = _2271 + _2253;
    float _2283 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[121].x, _2279);
    float _2285 = _2281 * _2261;
    float _2287 = _2285 * 0.5;
    float _2289 = _2277;
    if (!_1889)
    {
        float _2291 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2293);
        float _2297 = _2291 * 0.15915493667125701904296875;
        float _2299 = _2297 * 6.283185482025146484375;
        float _2301 = cos(_2299);
        float _2303 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2305 = _2303 * 0.15915493667125701904296875;
        float _2307 = _2297 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        float _2311 = 1.0 / _2301;
        float _2313 = _2305 * 6.283185482025146484375;
        float _2315 = cos(_2313);
        float _2317 = _2309 * _2311;
        float _2319 = 1.0 / _2295;
        float _2321 = _2315 * _2317;
        float _2323 = _2305 * 6.283185482025146484375;
        float _2325 = sin(_2323);
        float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2329 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2327;
        float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2333 = _2319 * _2331;
        float _2335 = 1.0 / _2321;
        float _2337 = 1.0 / _2329;
        float _2339 = _2325 * _2335;
        float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2343 = fma(_2339, _2333, _2341);
        float _2345 = _2343 * _2337;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        float _2349 = -_2347;
        float _2351 = _2349 + 1.0;
        _2289 = _2351;
    }
    float _2353 = _2289;
    float _2355 = exp2(_1879);
    float _2357 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2273);
    float _2359 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2361 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2357);
    float _2363 = _682 * _2359;
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2367 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2361);
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2373 = _2353 > 0.0;
    bool _2375 = isnan(_2353);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = _2367 + _1776;
    float _2385 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2387 = _2365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2389 = -_2355;
    float _2391 = _2389 + 1.0;
    float _2393 = _2371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2395 = _2283 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2397 = _2383 * 0.5;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2401 = _2363 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2385;
    out.m_67.y = _2387;
    out.m_67.z = _2393;
    out.m_67.w = _2395;
    float _2403 = _2399 * _1832;
    float _2405 = -_2399;
    float _2407 = _2405 + 1.0;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2367;
    out.gl_Position.w = _1776;
    float _2409 = _1843 * _2403;
    float _2411 = _1853 * _2403;
    float _2413 = _1843 * _2407;
    out.m_69.z = _2397;
    out.m_69.w = _1776;
    float _2415 = fma(_1849, _2409, _1837);
    float _2417 = fma(_1851, _2409, _1839);
    float _2419 = fma(_1843, _2411, _1841);
    out.m_45.x = _2401;
    out.m_71.x = _2415;
    out.m_71.y = _2417;
    out.m_71.z = _2419;
    out.m_71.w = _2413;
    if (_2381)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2421 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2421;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

