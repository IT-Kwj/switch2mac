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
    float4 m_55 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
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
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1744 = false;
    bool _924 = false;
    bool _796 = false;
    bool _670 = false;
    bool _514 = false;
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
        float _2582 = as_type<float>(_104);
        out.gl_Position.z = _2582;
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
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2650 = as_type<float>(_142);
        out.gl_Position.z = _2650;
    }
    if (_136)
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
        _126 = _166;
    }
    float _168 = _126;
    float _170 = _168;
    if (!_160)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_160;
    float _178 = _174;
    float _180 = _148;
    float _182 = _148;
    if (!_176)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _150 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _150);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _212;
    }
    float _214 = _178;
    float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _218 = !_160;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _150 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _162 = _238;
    }
    float _240 = _162;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _250 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _252 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _244);
    float _254 = _244;
    float _256 = _248;
    if (!_160)
    {
        float _258 = _122 * _122;
        float _260 = _258 * 0.5;
        _254 = _260;
    }
    float _262 = _254;
    float _264 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].y, _248);
    float _266 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].z, _250);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _252);
    if (!_160)
    {
        float _270 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _270;
    }
    float _272 = _256;
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
        float _290 = exp2(_288);
        float _292 = _286 * 0.693147182464599609375;
        float _294 = 1.0 / _292;
        float _296 = 1.0 / _284;
        float _298 = _290 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _294, _122);
        float _304 = _302 * _296;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _312 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _266);
    float _314 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].y, _264);
    float _318 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _320 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _322 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _324 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].y, _318);
    float _328 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _322);
    float _332 = fma(_240, _146, _316);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    float _336 = _314;
    if (!_160)
    {
        _336 = _122;
    }
    float _338 = _336;
    bool _340 = !_160;
    float _342 = _338;
    if (!_340)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _122 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _342 = _362;
    }
    float _364 = _342;
    float _366 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].x, _328);
    float _368 = fma(_364, _146, _334);
    float _370 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].z, _330);
    float _372 = fma(_240, _144, _268);
    float _374 = fma(_364, _144, _366);
    float _376 = -_368;
    float _378 = _332 + _376;
    float _380 = fma(_240, _148, _312);
    float _382 = fma(_364, _148, _370);
    float _384 = -_374;
    float _386 = _372 + _384;
    float _388 = _378 * _378;
    float _390 = in.m_51.w;
    float _392 = -_382;
    float _394 = _380 + _392;
    float _396 = _378 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _398 = fma(_386, _386, _388);
    float _400 = _378 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _402 = _378 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _406 = fma(_394, _394, _398);
    float _408 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _410 = in.m_44.x;
    float _412 = in.m_44.y;
    float _414 = in.m_44.z;
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _418 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _404);
    float _420 = sqrt(_406);
    float _422 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _408);
    bool _426 = _420 >= 9.9999999747524270787835121154785e-07;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(9.9999999747524270787835121154785e-07);
    bool _434 = _430 || _432;
    float _436 = fma(_372, _390, _410);
    float _438 = fma(_380, _390, _414);
    float _440 = fma(_332, _390, _412);
    float _442 = _372;
    float _444 = _380;
    float _446 = _424;
    float _448 = _382;
    if (_434)
    {
        _442 = _418;
    }
    float _450 = _442;
    float _452 = _450;
    if (_434)
    {
        _444 = _422;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_434)
    {
        bool _458 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _460 = !_458;
        if (!_460)
        {
            float _462 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _464 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _466 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _468 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _462);
            float _470 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _464);
            float _472 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _466);
            float _474 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _468);
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _472);
            float _480 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _482 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _484 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _486 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _480);
            float _488 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
            float _490 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _484);
            float _492 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
            float _494 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
            float _496 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
            float _498 = _492 * _492;
            float _500 = fma(_494, _494, _498);
            float _502 = fma(_496, _496, _500);
            float _504 = rsqrt(_502);
            float _506 = _504 * 9.9999999747524270787835121154785e-07;
            float _508 = _494 * _506;
            float _510 = _492 * _506;
            float _512 = _496 * _506;
            _446 = _510;
            _452 = _508;
            _456 = _512;
            _514 = true;
        }
        else
        {
            float _516 = _146 * _146;
            float _518 = fma(_144, _144, _516);
            float _520 = fma(_148, _148, _518);
            float _522 = sqrt(_520);
            bool _524 = _522 >= 9.9999999747524270787835121154785e-07;
            bool _526 = isnan(_522);
            bool _528 = _524 || _526;
            bool _530 = isnan(9.9999999747524270787835121154785e-07);
            bool _532 = _528 || _530;
            if (!_532)
            {
                float _534 = _412 * _412;
                float _536 = fma(_410, _410, _534);
                float _538 = fma(_414, _414, _536);
                float _540 = sqrt(_538);
                bool _542 = _540 >= 9.9999999747524270787835121154785e-07;
                bool _544 = isnan(_540);
                bool _546 = _542 || _544;
                bool _548 = isnan(9.9999999747524270787835121154785e-07);
                bool _550 = _546 || _548;
                if (!_550)
                {
                    float _552 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _554 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _552);
                    float _556 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _554);
                    float _558 = rsqrt(_556);
                    float _560 = _558 * 9.9999999747524270787835121154785e-07;
                    float _562 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _564 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _566 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _446 = _564;
                    _452 = _562;
                    _456 = _566;
                    _514 = true;
                }
                else
                {
                    float _568 = _412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _570 = _412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _572 = _412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _574 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _568);
                    float _576 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _570);
                    float _578 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
                    float _580 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _574);
                    float _582 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
                    float _584 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
                    float _586 = _580 * _580;
                    float _588 = fma(_582, _582, _586);
                    float _590 = fma(_584, _584, _588);
                    float _592 = rsqrt(_590);
                    float _594 = _592 * 9.9999999747524270787835121154785e-07;
                    float _596 = _582 * _594;
                    float _598 = _580 * _594;
                    float _600 = _584 * _594;
                    _446 = _598;
                    _452 = _596;
                    _456 = _600;
                    _514 = true;
                }
            }
            else
            {
                float _602 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _604 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _606 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _608 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
                float _610 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
                float _612 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
                float _614 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
                float _616 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
                float _618 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
                float _620 = _614 * _614;
                float _622 = fma(_616, _616, _620);
                float _624 = fma(_618, _618, _622);
                float _626 = rsqrt(_624);
                float _628 = _626 * 9.9999999747524270787835121154785e-07;
                float _630 = _616 * _628;
                float _632 = _614 * _628;
                float _634 = _618 * _628;
                _446 = _632;
                _452 = _630;
                _456 = _634;
            }
        }
    }
    _514 = false;
    float _636 = _446;
    float _638 = _452;
    float _640 = _456;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _644 = !_642;
    float _646 = _636;
    float _648 = _638;
    float _650 = _640;
    float _668;
    if (!_644)
    {
        float _652 = in.m_53.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        float _672 = float(_88);
        float _674 = 1.0 / _672;
        float _676 = _122 * _674;
        _668 = _676;
    }
    _670 = false;
    float _678 = _668;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = _678 + _680;
    bool _684 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _686 = isnan(_678);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _696;
    float _700 = 1.0 / _698;
    bool _702 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _704 = isnan(_678);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_694;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _722;
    bool _726 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _728;
    float _732 = _712 * _716;
    float _734 = -_712;
    float _736 = _734 + 1.0;
    float _738 = _682 * _700;
    float _740 = in.m_51.x;
    float _742 = in.m_51.y;
    float _744 = in.m_51.z;
    float _746 = fma(_720, _738, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _748 = fma(_730, _738, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _750 = fma(_724, _738, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _752 = _746 * _732;
    float _754 = _748 * _732;
    float _756 = _750 * _732;
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].x, _752);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].y, _754);
    float _762 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].z, _756);
    float _764 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].x, _758);
    float _766 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].y, _760);
    float _768 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].z, _762);
    float _770 = _764 * _740;
    float _772 = _766 * _742;
    float _774 = _768 * _744;
    bool _776 = !_726;
    float _794;
    if (!_776)
    {
        float _778 = in.m_53.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_88);
        float _800 = 1.0 / _798;
        float _802 = _122 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _808 = _804 + _806;
    bool _810 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _812 = isnan(_804);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _822;
    bool _826 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _828 = isnan(_804);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_820;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _842;
    float _846 = 1.0 / _824;
    bool _848 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _850 = _836 * _840;
    float _852 = -_836;
    float _854 = _852 + 1.0;
    float _856 = _808 * _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _858;
    float _862 = fma(_844, _856, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _864;
    float _868 = fma(_860, _856, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _870 = _862 * _850;
    float _872 = fma(_866, _856, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _874 = _868 * _850;
    float _876 = _872 * _850;
    float _878 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].x, _870);
    float _880 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].y, _876);
    float _882 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].z, _874);
    float _884 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].x, _878);
    float _886 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].y, _880);
    float _888 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].z, _882);
    float _890 = _884 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = _886 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _894 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _898;
    out.m_55.y = _900;
    out.m_55.z = _902;
    out.m_55.w = _896;
    bool _904 = !_848;
    float _922;
    if (!_904)
    {
        float _906 = in.m_53.x;
        float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _910 = _906 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _914 = _912 * _908;
        float _916 = floor(_914);
        float _918 = -_916;
        float _920 = _914 + _918;
        _922 = _920;
        _924 = true;
    }
    else
    {
        float _926 = float(_88);
        float _928 = 1.0 / _926;
        float _930 = _122 * _928;
        _922 = _930;
    }
    _924 = false;
    float _932 = _922;
    float _934 = _636 * _636;
    float _936 = in.m_53.w;
    float _938 = fma(_638, _638, _934);
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _942 = _940 != 0;
    float _944 = in.m_57.x;
    float _946 = in.m_57.y;
    float _948 = in.m_57.z;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _952 = _950 != 0;
    float _954 = fma(_640, _640, _938);
    float _956 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = in.m_59.y;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _962 = _960 != 0;
    float _964 = rsqrt(_954);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _968 = _966 != 0;
    float _970 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _974 = _972 != 0;
    float _976 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _978 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _982 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _976);
    float _984 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].z, _970);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _986;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _994 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _980);
    bool _996 = _936 > 0.5;
    float _998 = 1.0 / _988;
    float _1000 = _964 * _636;
    float _1002 = _964 * _638;
    float _1004 = _964 * _640;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1008 = _964;
    bool _1010 = _968;
    float _1012 = _954;
    if (_952)
    {
        float _1014 = in.m_53.x;
        _1008 = _1014;
    }
    float _1016 = _1008;
    float _1018 = -_958;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / _992;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1006);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _1028 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1030 = _996 ? as_type<int>(_1020) : as_type<int>(_958);
    float _1032 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1024);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _944);
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _948);
    float _1038 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1040;
    float _1044 = abs(_1032);
    bool _1046 = _1044 > 0.99989998340606689453125;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1050 = _932 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1054 = _932 + _1052;
    float _1056 = _1028 * _1026;
    float _1058 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1064 = _1038 * _1036;
    float _1066 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].z, _994);
    float _1068 = _1050 * _998;
    float _1070 = _1054 * _1022;
    float _1072 = 1.0 / _1042;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1076 = _932 + _1074;
    float _1078 = _1054;
    float _1080 = _1032;
    float _1082 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1084 = _1046;
    float _1086 = _958;
    if (_1046)
    {
        _1078 = 0.001000000047497451305389404296875;
    }
    float _1088 = _1078;
    float _1090 = _978 * _1034;
    float _1092 = _968 ? as_type<float>(_1030) : _958;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1096 = _932 + _1094;
    if (_952)
    {
        bool _1098 = _1016 > 0.5;
        _1010 = _1098;
    }
    bool _1100 = _1010;
    float _1102 = 1.0 / _1062;
    float _1104 = _1042;
    if (_962)
    {
        float _1106 = in.m_53.z;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = _1056 * _1002;
    float _1112 = in.m_59.x;
    float _1114 = 0.0;
    if (!_1046)
    {
        _1114 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1116 = _1114;
    float _1118 = _1116;
    if (_1046)
    {
        float _1120 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1118 = _1120;
    }
    float _1122 = _1118;
    if (!_1046)
    {
        _1080 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1124 = _1080;
    float _1126 = _1124;
    if (_1046)
    {
        float _1128 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1126 = _1128;
    }
    float _1130 = _1126;
    if (!_1046)
    {
        _1082 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1132 = _1082;
    float _1134 = _1132;
    if (_1046)
    {
        float _1136 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1134 = _1136;
    }
    float _1138 = _1134;
    float _1140 = _1088;
    float _1142 = _1138;
    if (!_942)
    {
        float _1144 = in.m_53.y;
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = -_1122;
    float _1150 = _1004 * _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1152;
    float _1156 = -_1138;
    float _1158 = _1000 * _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1160;
    float _1164 = -_1138;
    float _1166 = -_1150;
    float _1168 = fma(_1002, _1164, _1166);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1170;
    float _1174 = fma(_1154, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1176 = fma(_1162, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1178 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1180 = isnan(_932);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_1172, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1192 = _1076 * _1072;
    if (_962)
    {
        bool _1194 = _1108 > 0.5;
        _1084 = _1194;
    }
    bool _1196 = _1084;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1210 = -_1130;
    float _1212 = -_1158;
    float _1214 = fma(_1004, _1210, _1212);
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1216;
    bool _1220 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1222 = isnan(_932);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1130;
    float _1234 = _1002 * _1232;
    float _1236 = _1168 * _1168;
    bool _1238 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1240 = isnan(_932);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = fma(_1200, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1252 = fma(_1204, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1254 = fma(_1208, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1256 = -_1188;
    float _1258 = _1256 + 1.0;
    float _1260 = _1096 * _1102;
    float _1262 = fma(_1218, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1264 = -_1122;
    float _1266 = -_1234;
    float _1268 = fma(_1000, _1264, _1266);
    float _1270 = fma(_1214, _1214, _1236);
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1272;
    bool _1276 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1278 = isnan(_932);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = -_1230;
    float _1290 = _1288 + 1.0;
    float _1292 = _1146;
    if (!_942)
    {
        _1142 = _1146;
    }
    float _1294 = _1142;
    float _1296 = _1248 * _1258;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1298;
    float _1302 = fma(_1268, _1268, _1270);
    float _1304 = fma(_1274, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1306 = _1286 * _1290;
    float _1308 = _1294;
    if (_942)
    {
        float _1310 = in.m_53.x;
        float _1312 = in.m_53.y;
        _1292 = _1312;
        _1308 = _1310;
    }
    float _1314 = _1292;
    float _1316 = _1308;
    float _1318 = fma(_1300, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1320 = -_1286;
    float _1322 = _1320 + 1.0;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1326 = _1290;
    int _1328 = as_type<int>(_1314);
    if (!_942)
    {
        float _1330 = in.m_53.z;
        _1326 = _1330;
    }
    float _1332 = _1326;
    bool _1334 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1336 = isnan(_932);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = -_1248;
    float _1348 = _1346 + 1.0;
    float _1350 = _1188 * _1322;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1360 = _1344 * _1348;
    float _1362 = rsqrt(_1302);
    float _1364 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = fma(_1358, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1368 = _1174 * _1360;
    float _1370 = _1176 * _1360;
    float _1372 = _1190 * _1360;
    float _1374 = _1056 * _1000;
    float _1376 = _1358;
    if (!_952)
    {
        _1376 = _1112;
    }
    float _1378 = _1376;
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1382 = _1056 * _1004;
    float _1384 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1390 = fma(_1380, _1092, -0.5);
    float _1392 = -_1344;
    float _1394 = _1392 + 1.0;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1398 = fma(_1388, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1400 = _1168 * _1362;
    float _1402 = _1268 * _1362;
    float _1404 = _1214 * _1362;
    float _1406 = _1380;
    float _1408 = _1332;
    int _1410 = as_type<int>(_1362);
    float _1412 = _1378;
    if (!_942)
    {
        _1406 = _1332;
    }
    float _1414 = _1406;
    float _1416 = _1002 * _1400;
    float _1418 = _1000 * _1402;
    float _1420 = _1414;
    if (_942)
    {
        _1420 = _1314;
    }
    float _1422 = _1420;
    float _1424 = fma(_1090, _1404, _1110);
    if (_942)
    {
        _1408 = _1314;
    }
    float _1426 = _1408;
    float _1428 = -_1416;
    float _1430 = fma(_1000, _1404, _1428);
    bool _1432 = _1314 > 0.5;
    if (_952)
    {
        float _1434 = -_1112;
        float _1436 = _1434 + 1.0;
        _1328 = as_type<int>(_1436);
    }
    int _1438 = _1328;
    float _1440 = -_1418;
    float _1442 = fma(_1004, _1400, _1440);
    float _1444 = fma(_1090, _1402, _1382);
    float _1446 = as_type<float>(_1438);
    if (_962)
    {
        float _1448 = -_1112;
        float _1450 = _1448 + 1.0;
        _1410 = as_type<int>(_1450);
    }
    int _1452 = _1410;
    float _1454 = fma(_1064, _1442, _1424);
    float _1456 = fma(_1064, _1430, _1444);
    if (_952)
    {
        float _1458 = _1100 ? as_type<float>(_1438) : _1112;
        _1412 = _1458;
    }
    float _1460 = _1412;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_962)
    {
        _1446 = _1112;
    }
    float _1464 = _1446;
    float _1466 = _1364 + _1454;
    float _1468 = _1464;
    float _1470 = _1466;
    if (_962)
    {
        float _1472 = _1196 ? as_type<float>(_1452) : _1112;
        _1468 = _1472;
    }
    float _1474 = _1468;
    float _1476 = _1384 + _1456;
    float _1478 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1462);
    float _1480 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1466 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1488 = _1476 + _1486;
    float _1490 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1368);
    float _1492 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1372);
    float _1494 = _1484 * _1484;
    float _1496 = _1488 * _1488;
    float _1498 = fma(_1354, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1500 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1370);
    float _1502 = _1494 + _1496;
    float _1504 = _1004 * _1404;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1508 = sqrt(_1502);
    float _1510 = fma(_1252, _1296, _1500);
    float _1512 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1506);
    float _1514 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1516 = fma(_1250, _1296, _1490);
    float _1518 = fma(_1254, _1296, _1492);
    float _1520 = fma(_1090, _1400, _1374);
    float _1522 = _1494;
    float _1524 = _1496;
    float _1526 = _1476;
    if (_974)
    {
        float _1528 = _1432 ? _1020 : _958;
        _1086 = _1528;
    }
    float _1530 = _1086;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1534 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1538 = fma(_1514, _1474, -0.5);
    float _1540 = -_1504;
    float _1542 = fma(_1002, _1402, _1540);
    float _1544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1546 = fma(_1534, -2.0, _1532);
    bool _1548 = _1508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1550 = -_1536;
    float _1552 = fma(_1480, 2.0, _1550);
    float _1554 = fma(_1064, _1542, _1520);
    float _1556 = _984 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1558 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1478);
    float _1560 = -_122;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1552);
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1566 = _1556 + _1554;
    float _1568 = fma(_1304, _1350, _1516);
    float _1570 = fma(_1262, _1350, _1510);
    float _1572 = fma(_1318, _1350, _1518);
    float _1574 = fma(_1558, _1538, _1562);
    float _1576 = fma(_1366, _1306, _1568);
    float _1578 = _1538;
    float _1580 = _1574;
    if (!_1548)
    {
        _1578 = _1566;
    }
    float _1582 = _1578;
    bool _1584 = !_1548;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1508 + _1590;
        float _1594 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1502);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1484, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1488, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1566, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1522 = _1632;
        _1524 = _1634;
        _1470 = _1616;
        _1526 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1522;
    float _1640 = _1524;
    float _1642 = _1470;
    float _1644 = _1526;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1398, _1306, _1570);
    float _1652 = fma(_1498, _1306, _1572);
    float _1654 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1512);
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1546);
    float _1660 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1662 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1576);
    float _1664 = _1656 + _1640;
    float _1666 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1650);
    float _1668 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1652);
    float _1670 = -_1658;
    float _1672 = fma(_1654, _1390, _1670);
    float _1674 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1676 = _1660 * _1564;
    float _1678 = sqrt(_1664);
    float _1680 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1682 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1684 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1686 = _1674 * _1544;
    float _1688 = _1574 + 0.5;
    float _1690 = _1672 + 0.5;
    float _1692 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1686;
    out.m_61.y = _1676;
    out.m_61.z = _1688;
    out.m_61.w = _1690;
    bool _1698 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1700 = isnan(_1678);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1706 = _1702 || _1704;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1692;
    out.m_65.y = _1694;
    out.m_65.z = _1696;
    float _1708 = _1696;
    if (!_1706)
    {
        _1580 = 1.0;
    }
    float _1710 = _1580;
    bool _1712 = !_1706;
    float _1714 = _1710;
    if (!_1712)
    {
        bool _1716 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1718 = isnan(_1678);
        bool _1720 = _1716 || _1718;
        bool _1722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1724 = _1720 || _1722;
        if (!_1724)
        {
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = _1678 + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1738 = 1.0 / _1732;
            float _1740 = _1728 * _1738;
            float _1742 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1714 = _1742;
            _1744 = true;
        }
        else
        {
            bool _1746 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1748 = isnan(_1678);
            bool _1750 = _1746 || _1748;
            bool _1752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1754 = _1750 || _1752;
            if (!_1754)
            {
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1678 + _1756;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1768 = 1.0 / _1762;
                float _1770 = _1758 * _1768;
                float _1772 = fma(_1770, _1766, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1714 = _1772;
                _1744 = true;
            }
            else
            {
                _1714 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1744 = false;
    float _1774 = _1714;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1778 = _1636 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1782 = _1642 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1786 = _1644 + _1784;
    float _1788 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1790 = fma(_1782, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1792 = fma(_1786, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1794 = -_1556;
    float _1796 = _1794 + _1788;
    float _1798 = -_1364;
    float _1800 = _1798 + _1790;
    float _1802 = -_1384;
    float _1804 = _1802 + _1792;
    float _1806 = _1796 * _1796;
    float _1808 = fma(_1800, _1800, _1806);
    float _1810 = fma(_1804, _1804, _1808);
    float _1812 = sqrt(_1810);
    bool _1814 = _1812 > 0.0;
    bool _1816 = !_1814;
    float _1818 = _1806;
    float _1820 = _1790;
    float _1822 = _1792;
    float _1824 = _1796;
    float _1826 = _1788;
    float _1828 = _1800;
    float _1830 = _1810;
    if (!_1816)
    {
        bool _1832 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1834 = _1812;
        if (_1832)
        {
            float _1836 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1834 = _1836;
        }
        float _1838 = _1834;
        if (_1832)
        {
            _1818 = _954;
        }
        float _1840 = _1818;
        float _1842 = _1838;
        float _1844 = _1840;
        if (_1832)
        {
            float _1846 = _1838 * _638;
            _1012 = _1846;
        }
        float _1848 = _1012;
        float _1850 = _1848;
        float _1852 = _1848;
        if (_1832)
        {
            float _1854 = _1838 * _636;
            _1708 = _1854;
        }
        float _1856 = _1708;
        float _1858 = _1856;
        if (_1832)
        {
            float _1860 = _1838 * _640;
            _1842 = _1860;
        }
        float _1862 = _1842;
        float _1864 = _1862;
        if (!_1832)
        {
            float _1866 = _122 + 1.0;
            if (!_160)
            {
                float _1868 = _1866 * _1866;
                float _1870 = _1868 * 0.5;
                _1850 = _1870;
            }
            float _1872 = _1850;
            float _1874 = _1872;
            if (!_160)
            {
                float _1876 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1874 = _1876;
            }
            float _1878 = _1874;
            bool _1880 = !_160;
            float _1882 = _1878;
            if (!_1880)
            {
                float _1884 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1886 = log2(_1884);
                float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1890 = _1888 + 1.0;
                float _1892 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1894 = _1886 * _1866;
                float _1896 = 1.0 / _1890;
                float _1898 = _1892 * 0.693147182464599609375;
                float _1900 = exp2(_1894);
                float _1902 = 1.0 / _1898;
                float _1904 = _1900 + (-1.0);
                float _1906 = -_1904;
                float _1908 = fma(_1906, _1902, _1866);
                float _1910 = _1908 * _1896;
                float _1912 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1882 = _1912;
            }
            float _1914 = _1882;
            float _1916 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1918 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1920 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1922 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1924 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1926 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1928 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1922);
            float _1930 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1924);
            float _1932 = _1924;
            if (!_160)
            {
                _1932 = _1866;
            }
            float _1934 = _1932;
            float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1928);
            bool _1938 = !_160;
            float _1940 = _1934;
            if (!_1938)
            {
                float _1942 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1944 = log2(_1942);
                float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1948 = _1946 + 1.0;
                float _1950 = 1.0 / _1948;
                float _1952 = _1944 * _1866;
                float _1954 = exp2(_1952);
                float _1956 = -_1954;
                float _1958 = _1956 + 1.0;
                float _1960 = _1958 * _1950;
                _1940 = _1960;
            }
            float _1962 = _1940;
            float _1964 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1926);
            float _1966 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1930);
            float _1968 = fma(_1962, _146, _1936);
            float _1970 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1964);
            float _1972 = fma(_1962, _144, _1966);
            float _1974 = -_368;
            float _1976 = _1974 + _1968;
            float _1978 = fma(_1962, _148, _1970);
            float _1980 = -_374;
            float _1982 = _1980 + _1972;
            float _1984 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1986 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1988 = -_382;
            float _1990 = _1988 + _1978;
            float _1992 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1984);
            float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1986);
            float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1992);
            float _2000 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1994);
            float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1996);
            float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1998);
            float _2006 = _2000 * _2000;
            float _2008 = fma(_2002, _2002, _2006);
            float _2010 = fma(_2004, _2004, _2008);
            _1844 = _2010;
            _646 = _2000;
            _648 = _2002;
            _650 = _2004;
            _1852 = _2002;
            _1858 = _2000;
            _1864 = _2004;
            _180 = _2008;
        }
        float _2012 = _1844;
        float _2014 = _646;
        float _2016 = _648;
        float _2018 = _650;
        float _2020 = _1852;
        float _2022 = _1858;
        float _2024 = _1864;
        float _2026 = _180;
        float _2028 = sqrt(_2012);
        float _2030 = rsqrt(_1810);
        bool _2032 = _2028 > 0.0;
        float _2034 = _1796 * _2030;
        float _2036 = _1800 * _2030;
        float _2038 = _1804 * _2030;
        bool _2040 = !_2032;
        _1824 = _2038;
        _182 = _2026;
        if (!_2040)
        {
            float _2042 = rsqrt(_2012);
            float _2044 = _2042 * _2014;
            float _2046 = _2042 * _2016;
            float _2048 = _2042 * _2018;
            float _2050 = _2034 * _2044;
            float _2052 = fma(_2036, _2046, _2050);
            float _2054 = fma(_2038, _2048, _2052);
            float _2056 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2058 = fma(_2020, _2056, _1790);
            float _2060 = fma(_2022, _2056, _1788);
            float _2062 = fma(_2024, _2056, _1792);
            _1820 = _2058;
            _1822 = _2062;
            _1826 = _2060;
            _182 = _2050;
        }
    }
    float _2064 = _1820;
    float _2066 = _1822;
    float _2068 = _1824;
    float _2070 = _1826;
    float _2072 = _182;
    bool _2074 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(0.5);
    bool _2082 = _2078 || _2080;
    float _2084 = _2072;
    float _2086 = _2068;
    float _2088 = _2070;
    if (_2082)
    {
        _2084 = _2064;
    }
    float _2090 = _2084;
    float _2092 = _2090;
    if (_2082)
    {
        _2086 = _2066;
    }
    float _2094 = _2086;
    float _2096 = _2094;
    if (!_2082)
    {
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2100 = _1556 + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2104 = _1364 + _2102;
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2108 = -_1556;
        float _2110 = _2108 + _2070;
        float _2112 = _2100 * _2100;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2116 = _1384 + _2114;
        float _2118 = -_1384;
        float _2120 = _2118 + _2066;
        float _2122 = fma(_2104, _2104, _2112);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2126 = fma(_2116, _2116, _2122);
        float _2128 = sqrt(_2126);
        float _2130 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2124;
        float _2136 = -_1364;
        float _2138 = _2136 + _2064;
        float _2140 = _2130 * _2134;
        float _2142 = fma(_2138, _2140, _1364);
        float _2144 = fma(_2110, _2140, _1556);
        float _2146 = fma(_2120, _2140, _1384);
        _2088 = _2144;
        _2092 = _2142;
        _2096 = _2146;
    }
    float _2148 = _2088;
    float _2150 = _2092;
    float _2152 = _2096;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2148 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2160 = _2150 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2164 = _2152 + _2162;
    float _2166 = _2156 * _2156;
    float _2168 = fma(_2160, _2160, _2166);
    float _2170 = fma(_2164, _2164, _2168);
    float _2172 = rsqrt(_2170);
    float _2174 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2176 = _2160 * _2174;
    float _2178 = _2164 * _2174;
    float _2180 = _2176 * _2176;
    float _2182 = _2178 * _2178;
    float _2184 = _2180 + _2182;
    float _2186 = sqrt(_2184);
    bool _2188 = _2186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2186 + _2190;
    float _2194 = _2172;
    float _2196 = _2192;
    float _2198 = _2156;
    float _2200 = _2174;
    float _2202 = _2176;
    if (_2188)
    {
        float _2204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (_2188)
    {
        float _2208 = rsqrt(_2184);
        _1828 = _2208;
    }
    float _2210 = _1828;
    float _2212 = _2210;
    if (_2188)
    {
        float _2214 = _2192 * _2206;
        _2196 = _2214;
    }
    float _2216 = _2196;
    if (_2188)
    {
        float _2218 = _2216 * 0.15915493667125701904296875;
        _1830 = _2218;
    }
    float _2220 = _1830;
    float _2222 = _2206;
    if (_2188)
    {
        float _2224 = _2220 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        _2222 = _2226;
    }
    float _2228 = _2222;
    float _2230 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2232 = precise::max(0.0, _2230);
    float _2234 = _2164;
    float _2236 = _2232;
    if (_2188)
    {
        float _2238 = _2220 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        _2234 = _2240;
    }
    float _2242 = _2234;
    float _2244 = -_2174;
    float _2246 = -_2232;
    float _2248 = fma(_2156, _2244, _2246);
    if (!_2188)
    {
        _2198 = _2180;
    }
    float _2250 = _2198;
    float _2252 = _2250;
    if (_2188)
    {
        float _2254 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2236 = _2254;
    }
    float _2256 = _2236;
    float _2258 = sqrt(_2170);
    float _2260 = _2228;
    float _2262 = _2256;
    if (_2188)
    {
        float _2264 = fma(_2228, _2256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2260 = _2264;
    }
    float _2266 = _2260;
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = _2266;
    if (_2188)
    {
        float _2272 = _2242 + (-1.0);
        _2262 = _2272;
    }
    float _2274 = _2262;
    float _2276 = _2274;
    if (_2188)
    {
        float _2278 = _2210 * _2266;
        _448 = _2278;
    }
    float _2280 = _448;
    if (!_2188)
    {
        _2212 = _2248;
    }
    float _2282 = _2212;
    float _2284 = _2282;
    if (_2188)
    {
        float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2286;
    }
    float _2288 = _2200;
    if (_2188)
    {
        float _2290 = _2176 * _2280;
        _2202 = _2290;
    }
    float _2292 = _2202;
    if (!_2188)
    {
        _2270 = _2178;
    }
    float _2294 = _2270;
    float _2296 = _2294;
    if (_2188)
    {
        float _2298 = _2178 * _2280;
        _2296 = _2298;
    }
    float _2300 = _2296;
    if (_2188)
    {
        float _2302 = fma(_2248, _2242, _2288);
        _2284 = _2302;
    }
    float _2304 = _2284;
    if (_2188)
    {
        float _2306 = _2292 * _2292;
        _2252 = _2306;
    }
    float _2308 = _2252;
    if (!_2188)
    {
        _2276 = _2182;
    }
    float _2310 = _2276;
    float _2312 = _2310;
    if (_2188)
    {
        float _2314 = _2300 * _2300;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = fma(_2304, _2304, _2308);
    float _2320 = _2318 + _2316;
    float _2322 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2326 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2324);
    float _2328 = precise::clamp(_2326, 0.0, 1.0);
    float _2330 = rsqrt(_2320);
    float _2332 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2322);
    float _2334 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2336 = -_2328;
    float _2338 = _2336 + 1.0;
    float _2340 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2342 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2344 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2334);
    float _2346 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2348 = abs(_2338);
    float _2350 = log2(_2348);
    float _2352 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2342);
    float _2354 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2344);
    float _2356 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2346);
    float _2358 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2360 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2352);
    float _2362 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2364 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2356);
    float _2366 = _2330 * _2292;
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2372 = _2330 * _2304;
    float _2374 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2376 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2378 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2370);
    float _2380 = _2330 * _2300;
    float _2382 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2384 = -_2374;
    float _2386 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = -_2376;
    float _2390 = fma(_2388, _2268, 1.0);
    float _2392 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2394 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2378);
    float _2396 = exp2(_2382);
    float _2398 = -_2380;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2402 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2394);
    float _2406 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2408 = fma(_2400, -0.5, 0.5);
    float _2410 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2402);
    float _2412 = fma(_2400, 0.5, 0.5);
    float _2414 = log2(_2390);
    float _2416 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2406);
    float _2418 = _2372 + 1.0;
    float _2420 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2410);
    float _2422 = fma(_2412, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2424 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2416);
    float _2426 = 1.0 / _2404;
    float _2428 = -_2372;
    float _2430 = fma(_2396, _2418, _2428);
    float _2432 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2434 = fma(_2412, _2422, -0.212114393711090087890625);
    float _2436 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2424);
    float _2438 = fma(_2430, 0.5, 0.5);
    float _2440 = fma(_2412, _2434, 1.570728778839111328125);
    float _2442 = sqrt(_2408);
    float _2444 = _2414 * 0.693147182464599609375;
    float _2446 = _2432 * _2426;
    float _2448 = _2436 * _2426;
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = fma(_2446, 0.5, 0.5);
    float _2454 = fma(_2448, -0.5, 0.5);
    float _2456 = _2442 * 0.636619746685028076171875;
    float3 _6501 = float3(_2452, _2454, _2450);
    float _2458 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6501, float3(0.0), isnan(_6501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6501, float3(0.0), isnan(_6501)), level(0.0)).x;
    float3 _6512 = float3(_2452, _2454, _2450);
    float4 _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6512, float3(0.0), isnan(_6512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6512, float3(0.0), isnan(_6512)), level(0.0)).xyzw;
    float _2463 = _2461.x;
    float _2465 = _2461.y;
    float _2467 = _2461.z;
    float _2469 = _2461.w;
    float _2471 = -_2440;
    float _2473 = fma(_2456, _2471, 1.0);
    float2 _6534 = float2(_2473, _2438);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2487 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2489 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2487);
    float _2491 = exp2(_2485);
    float _2493 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2489);
    float _2495 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2493);
    float _2497 = _2495 + _2404;
    out.gl_Position.x = _2432;
    out.gl_Position.y = _2436;
    out.gl_Position.z = _2495;
    out.gl_Position.w = _2404;
    float _2499 = -_2491;
    float _2501 = _2499 + 1.0;
    float _2503 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2505 = _2497 * 0.5;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _2503;
    out.m_67.z = _2505;
    out.m_67.w = _2404;
    float _2509 = _2507 * _2458;
    float _2511 = -_2507;
    float _2513 = _2511 + 1.0;
    float _2515 = _2469 * _2509;
    float _2517 = _2483 * _2509;
    float _2519 = fma(_2479, _2515, _2463);
    float _2521 = fma(_2481, _2515, _2465);
    float _2523 = _2469 * _2513;
    float _2525 = fma(_2469, _2517, _2467);
    out.m_69.x = _2519;
    out.m_69.y = _2521;
    out.m_69.z = _2525;
    out.m_69.w = _2523;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1744 = false;
    bool _924 = false;
    bool _796 = false;
    bool _670 = false;
    bool _514 = false;
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
        float _2582 = as_type<float>(_104);
        out.gl_Position.z = _2582;
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
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2650 = as_type<float>(_142);
        out.gl_Position.z = _2650;
    }
    if (_136)
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
        _126 = _166;
    }
    float _168 = _126;
    float _170 = _168;
    if (!_160)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_160;
    float _178 = _174;
    float _180 = _148;
    float _182 = _148;
    if (!_176)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _150 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _150);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _212;
    }
    float _214 = _178;
    float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _218 = !_160;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _150 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _162 = _238;
    }
    float _240 = _162;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _250 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _252 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _244);
    float _254 = _244;
    float _256 = _248;
    if (!_160)
    {
        float _258 = _122 * _122;
        float _260 = _258 * 0.5;
        _254 = _260;
    }
    float _262 = _254;
    float _264 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].y, _248);
    float _266 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].z, _250);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _252);
    if (!_160)
    {
        float _270 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _270;
    }
    float _272 = _256;
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
        float _290 = exp2(_288);
        float _292 = _286 * 0.693147182464599609375;
        float _294 = 1.0 / _292;
        float _296 = 1.0 / _284;
        float _298 = _290 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _294, _122);
        float _304 = _302 * _296;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _312 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _266);
    float _314 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].y, _264);
    float _318 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _320 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _322 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _324 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].y, _318);
    float _328 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _322);
    float _332 = fma(_240, _146, _316);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    float _336 = _314;
    if (!_160)
    {
        _336 = _122;
    }
    float _338 = _336;
    bool _340 = !_160;
    float _342 = _338;
    if (!_340)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _122 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _342 = _362;
    }
    float _364 = _342;
    float _366 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].x, _328);
    float _368 = fma(_364, _146, _334);
    float _370 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].z, _330);
    float _372 = fma(_240, _144, _268);
    float _374 = fma(_364, _144, _366);
    float _376 = -_368;
    float _378 = _332 + _376;
    float _380 = fma(_240, _148, _312);
    float _382 = fma(_364, _148, _370);
    float _384 = -_374;
    float _386 = _372 + _384;
    float _388 = _378 * _378;
    float _390 = in.m_51.w;
    float _392 = -_382;
    float _394 = _380 + _392;
    float _396 = _378 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _398 = fma(_386, _386, _388);
    float _400 = _378 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _402 = _378 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _406 = fma(_394, _394, _398);
    float _408 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _410 = in.m_44.x;
    float _412 = in.m_44.y;
    float _414 = in.m_44.z;
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _418 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _404);
    float _420 = sqrt(_406);
    float _422 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _408);
    bool _426 = _420 >= 9.9999999747524270787835121154785e-07;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(9.9999999747524270787835121154785e-07);
    bool _434 = _430 || _432;
    float _436 = fma(_372, _390, _410);
    float _438 = fma(_380, _390, _414);
    float _440 = fma(_332, _390, _412);
    float _442 = _372;
    float _444 = _380;
    float _446 = _424;
    float _448 = _382;
    if (_434)
    {
        _442 = _418;
    }
    float _450 = _442;
    float _452 = _450;
    if (_434)
    {
        _444 = _422;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_434)
    {
        bool _458 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _460 = !_458;
        if (!_460)
        {
            float _462 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _464 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _466 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _468 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _462);
            float _470 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _464);
            float _472 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _466);
            float _474 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _468);
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _472);
            float _480 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _482 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _484 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _486 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _480);
            float _488 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
            float _490 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _484);
            float _492 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
            float _494 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
            float _496 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
            float _498 = _492 * _492;
            float _500 = fma(_494, _494, _498);
            float _502 = fma(_496, _496, _500);
            float _504 = rsqrt(_502);
            float _506 = _504 * 9.9999999747524270787835121154785e-07;
            float _508 = _494 * _506;
            float _510 = _492 * _506;
            float _512 = _496 * _506;
            _446 = _510;
            _452 = _508;
            _456 = _512;
            _514 = true;
        }
        else
        {
            float _516 = _146 * _146;
            float _518 = fma(_144, _144, _516);
            float _520 = fma(_148, _148, _518);
            float _522 = sqrt(_520);
            bool _524 = _522 >= 9.9999999747524270787835121154785e-07;
            bool _526 = isnan(_522);
            bool _528 = _524 || _526;
            bool _530 = isnan(9.9999999747524270787835121154785e-07);
            bool _532 = _528 || _530;
            if (!_532)
            {
                float _534 = _412 * _412;
                float _536 = fma(_410, _410, _534);
                float _538 = fma(_414, _414, _536);
                float _540 = sqrt(_538);
                bool _542 = _540 >= 9.9999999747524270787835121154785e-07;
                bool _544 = isnan(_540);
                bool _546 = _542 || _544;
                bool _548 = isnan(9.9999999747524270787835121154785e-07);
                bool _550 = _546 || _548;
                if (!_550)
                {
                    float _552 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _554 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _552);
                    float _556 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _554);
                    float _558 = rsqrt(_556);
                    float _560 = _558 * 9.9999999747524270787835121154785e-07;
                    float _562 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _564 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _566 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _446 = _564;
                    _452 = _562;
                    _456 = _566;
                    _514 = true;
                }
                else
                {
                    float _568 = _412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _570 = _412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _572 = _412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _574 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _568);
                    float _576 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _570);
                    float _578 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
                    float _580 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _574);
                    float _582 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
                    float _584 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
                    float _586 = _580 * _580;
                    float _588 = fma(_582, _582, _586);
                    float _590 = fma(_584, _584, _588);
                    float _592 = rsqrt(_590);
                    float _594 = _592 * 9.9999999747524270787835121154785e-07;
                    float _596 = _582 * _594;
                    float _598 = _580 * _594;
                    float _600 = _584 * _594;
                    _446 = _598;
                    _452 = _596;
                    _456 = _600;
                    _514 = true;
                }
            }
            else
            {
                float _602 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _604 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _606 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _608 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
                float _610 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
                float _612 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
                float _614 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
                float _616 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
                float _618 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
                float _620 = _614 * _614;
                float _622 = fma(_616, _616, _620);
                float _624 = fma(_618, _618, _622);
                float _626 = rsqrt(_624);
                float _628 = _626 * 9.9999999747524270787835121154785e-07;
                float _630 = _616 * _628;
                float _632 = _614 * _628;
                float _634 = _618 * _628;
                _446 = _632;
                _452 = _630;
                _456 = _634;
            }
        }
    }
    _514 = false;
    float _636 = _446;
    float _638 = _452;
    float _640 = _456;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _644 = !_642;
    float _646 = _636;
    float _648 = _638;
    float _650 = _640;
    float _668;
    if (!_644)
    {
        float _652 = in.m_53.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        float _672 = float(_88);
        float _674 = 1.0 / _672;
        float _676 = _122 * _674;
        _668 = _676;
    }
    _670 = false;
    float _678 = _668;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = _678 + _680;
    bool _684 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _686 = isnan(_678);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _696;
    float _700 = 1.0 / _698;
    bool _702 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _704 = isnan(_678);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_694;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _722;
    bool _726 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _728;
    float _732 = _712 * _716;
    float _734 = -_712;
    float _736 = _734 + 1.0;
    float _738 = _682 * _700;
    float _740 = in.m_51.x;
    float _742 = in.m_51.y;
    float _744 = in.m_51.z;
    float _746 = fma(_720, _738, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _748 = fma(_730, _738, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _750 = fma(_724, _738, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _752 = _746 * _732;
    float _754 = _748 * _732;
    float _756 = _750 * _732;
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].x, _752);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].y, _754);
    float _762 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].z, _756);
    float _764 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].x, _758);
    float _766 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].y, _760);
    float _768 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].z, _762);
    float _770 = _764 * _740;
    float _772 = _766 * _742;
    float _774 = _768 * _744;
    bool _776 = !_726;
    float _794;
    if (!_776)
    {
        float _778 = in.m_53.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_88);
        float _800 = 1.0 / _798;
        float _802 = _122 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _808 = _804 + _806;
    bool _810 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _812 = isnan(_804);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _822;
    bool _826 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _828 = isnan(_804);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_820;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _842;
    float _846 = 1.0 / _824;
    bool _848 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _850 = _836 * _840;
    float _852 = -_836;
    float _854 = _852 + 1.0;
    float _856 = _808 * _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _858;
    float _862 = fma(_844, _856, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _864;
    float _868 = fma(_860, _856, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _870 = _862 * _850;
    float _872 = fma(_866, _856, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _874 = _868 * _850;
    float _876 = _872 * _850;
    float _878 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].x, _870);
    float _880 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].y, _876);
    float _882 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].z, _874);
    float _884 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].x, _878);
    float _886 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].y, _880);
    float _888 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].z, _882);
    float _890 = _884 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = _886 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _894 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _898;
    out.m_55.y = _900;
    out.m_55.z = _902;
    out.m_55.w = _896;
    bool _904 = !_848;
    float _922;
    if (!_904)
    {
        float _906 = in.m_53.x;
        float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _910 = _906 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _914 = _912 * _908;
        float _916 = floor(_914);
        float _918 = -_916;
        float _920 = _914 + _918;
        _922 = _920;
        _924 = true;
    }
    else
    {
        float _926 = float(_88);
        float _928 = 1.0 / _926;
        float _930 = _122 * _928;
        _922 = _930;
    }
    _924 = false;
    float _932 = _922;
    float _934 = _636 * _636;
    float _936 = in.m_53.w;
    float _938 = fma(_638, _638, _934);
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _942 = _940 != 0;
    float _944 = in.m_57.x;
    float _946 = in.m_57.y;
    float _948 = in.m_57.z;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _952 = _950 != 0;
    float _954 = fma(_640, _640, _938);
    float _956 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = in.m_59.y;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _962 = _960 != 0;
    float _964 = rsqrt(_954);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _968 = _966 != 0;
    float _970 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _974 = _972 != 0;
    float _976 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _978 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _982 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _976);
    float _984 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].z, _970);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _986;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _994 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _980);
    bool _996 = _936 > 0.5;
    float _998 = 1.0 / _988;
    float _1000 = _964 * _636;
    float _1002 = _964 * _638;
    float _1004 = _964 * _640;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1008 = _964;
    bool _1010 = _968;
    float _1012 = _954;
    if (_952)
    {
        float _1014 = in.m_53.x;
        _1008 = _1014;
    }
    float _1016 = _1008;
    float _1018 = -_958;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / _992;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1006);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _1028 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1030 = _996 ? as_type<int>(_1020) : as_type<int>(_958);
    float _1032 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1024);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _944);
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _948);
    float _1038 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1040;
    float _1044 = abs(_1032);
    bool _1046 = _1044 > 0.99989998340606689453125;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1050 = _932 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1054 = _932 + _1052;
    float _1056 = _1028 * _1026;
    float _1058 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1064 = _1038 * _1036;
    float _1066 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].z, _994);
    float _1068 = _1050 * _998;
    float _1070 = _1054 * _1022;
    float _1072 = 1.0 / _1042;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1076 = _932 + _1074;
    float _1078 = _1054;
    float _1080 = _1032;
    float _1082 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1084 = _1046;
    float _1086 = _958;
    if (_1046)
    {
        _1078 = 0.001000000047497451305389404296875;
    }
    float _1088 = _1078;
    float _1090 = _978 * _1034;
    float _1092 = _968 ? as_type<float>(_1030) : _958;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1096 = _932 + _1094;
    if (_952)
    {
        bool _1098 = _1016 > 0.5;
        _1010 = _1098;
    }
    bool _1100 = _1010;
    float _1102 = 1.0 / _1062;
    float _1104 = _1042;
    if (_962)
    {
        float _1106 = in.m_53.z;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = _1056 * _1002;
    float _1112 = in.m_59.x;
    float _1114 = 0.0;
    if (!_1046)
    {
        _1114 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1116 = _1114;
    float _1118 = _1116;
    if (_1046)
    {
        float _1120 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1118 = _1120;
    }
    float _1122 = _1118;
    if (!_1046)
    {
        _1080 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1124 = _1080;
    float _1126 = _1124;
    if (_1046)
    {
        float _1128 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1126 = _1128;
    }
    float _1130 = _1126;
    if (!_1046)
    {
        _1082 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1132 = _1082;
    float _1134 = _1132;
    if (_1046)
    {
        float _1136 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1134 = _1136;
    }
    float _1138 = _1134;
    float _1140 = _1088;
    float _1142 = _1138;
    if (!_942)
    {
        float _1144 = in.m_53.y;
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = -_1122;
    float _1150 = _1004 * _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1152;
    float _1156 = -_1138;
    float _1158 = _1000 * _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1160;
    float _1164 = -_1138;
    float _1166 = -_1150;
    float _1168 = fma(_1002, _1164, _1166);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1170;
    float _1174 = fma(_1154, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1176 = fma(_1162, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1178 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1180 = isnan(_932);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_1172, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1192 = _1076 * _1072;
    if (_962)
    {
        bool _1194 = _1108 > 0.5;
        _1084 = _1194;
    }
    bool _1196 = _1084;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1210 = -_1130;
    float _1212 = -_1158;
    float _1214 = fma(_1004, _1210, _1212);
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1216;
    bool _1220 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1222 = isnan(_932);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1130;
    float _1234 = _1002 * _1232;
    float _1236 = _1168 * _1168;
    bool _1238 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1240 = isnan(_932);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = fma(_1200, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1252 = fma(_1204, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1254 = fma(_1208, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1256 = -_1188;
    float _1258 = _1256 + 1.0;
    float _1260 = _1096 * _1102;
    float _1262 = fma(_1218, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1264 = -_1122;
    float _1266 = -_1234;
    float _1268 = fma(_1000, _1264, _1266);
    float _1270 = fma(_1214, _1214, _1236);
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1272;
    bool _1276 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1278 = isnan(_932);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = -_1230;
    float _1290 = _1288 + 1.0;
    float _1292 = _1146;
    if (!_942)
    {
        _1142 = _1146;
    }
    float _1294 = _1142;
    float _1296 = _1248 * _1258;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1298;
    float _1302 = fma(_1268, _1268, _1270);
    float _1304 = fma(_1274, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1306 = _1286 * _1290;
    float _1308 = _1294;
    if (_942)
    {
        float _1310 = in.m_53.x;
        float _1312 = in.m_53.y;
        _1292 = _1312;
        _1308 = _1310;
    }
    float _1314 = _1292;
    float _1316 = _1308;
    float _1318 = fma(_1300, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1320 = -_1286;
    float _1322 = _1320 + 1.0;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1326 = _1290;
    int _1328 = as_type<int>(_1314);
    if (!_942)
    {
        float _1330 = in.m_53.z;
        _1326 = _1330;
    }
    float _1332 = _1326;
    bool _1334 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1336 = isnan(_932);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = -_1248;
    float _1348 = _1346 + 1.0;
    float _1350 = _1188 * _1322;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1360 = _1344 * _1348;
    float _1362 = rsqrt(_1302);
    float _1364 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = fma(_1358, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1368 = _1174 * _1360;
    float _1370 = _1176 * _1360;
    float _1372 = _1190 * _1360;
    float _1374 = _1056 * _1000;
    float _1376 = _1358;
    if (!_952)
    {
        _1376 = _1112;
    }
    float _1378 = _1376;
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1382 = _1056 * _1004;
    float _1384 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1390 = fma(_1380, _1092, -0.5);
    float _1392 = -_1344;
    float _1394 = _1392 + 1.0;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1398 = fma(_1388, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1400 = _1168 * _1362;
    float _1402 = _1268 * _1362;
    float _1404 = _1214 * _1362;
    float _1406 = _1380;
    float _1408 = _1332;
    int _1410 = as_type<int>(_1362);
    float _1412 = _1378;
    if (!_942)
    {
        _1406 = _1332;
    }
    float _1414 = _1406;
    float _1416 = _1002 * _1400;
    float _1418 = _1000 * _1402;
    float _1420 = _1414;
    if (_942)
    {
        _1420 = _1314;
    }
    float _1422 = _1420;
    float _1424 = fma(_1090, _1404, _1110);
    if (_942)
    {
        _1408 = _1314;
    }
    float _1426 = _1408;
    float _1428 = -_1416;
    float _1430 = fma(_1000, _1404, _1428);
    bool _1432 = _1314 > 0.5;
    if (_952)
    {
        float _1434 = -_1112;
        float _1436 = _1434 + 1.0;
        _1328 = as_type<int>(_1436);
    }
    int _1438 = _1328;
    float _1440 = -_1418;
    float _1442 = fma(_1004, _1400, _1440);
    float _1444 = fma(_1090, _1402, _1382);
    float _1446 = as_type<float>(_1438);
    if (_962)
    {
        float _1448 = -_1112;
        float _1450 = _1448 + 1.0;
        _1410 = as_type<int>(_1450);
    }
    int _1452 = _1410;
    float _1454 = fma(_1064, _1442, _1424);
    float _1456 = fma(_1064, _1430, _1444);
    if (_952)
    {
        float _1458 = _1100 ? as_type<float>(_1438) : _1112;
        _1412 = _1458;
    }
    float _1460 = _1412;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_962)
    {
        _1446 = _1112;
    }
    float _1464 = _1446;
    float _1466 = _1364 + _1454;
    float _1468 = _1464;
    float _1470 = _1466;
    if (_962)
    {
        float _1472 = _1196 ? as_type<float>(_1452) : _1112;
        _1468 = _1472;
    }
    float _1474 = _1468;
    float _1476 = _1384 + _1456;
    float _1478 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1462);
    float _1480 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1466 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1488 = _1476 + _1486;
    float _1490 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1368);
    float _1492 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1372);
    float _1494 = _1484 * _1484;
    float _1496 = _1488 * _1488;
    float _1498 = fma(_1354, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1500 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1370);
    float _1502 = _1494 + _1496;
    float _1504 = _1004 * _1404;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1508 = sqrt(_1502);
    float _1510 = fma(_1252, _1296, _1500);
    float _1512 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1506);
    float _1514 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1516 = fma(_1250, _1296, _1490);
    float _1518 = fma(_1254, _1296, _1492);
    float _1520 = fma(_1090, _1400, _1374);
    float _1522 = _1494;
    float _1524 = _1496;
    float _1526 = _1476;
    if (_974)
    {
        float _1528 = _1432 ? _1020 : _958;
        _1086 = _1528;
    }
    float _1530 = _1086;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1534 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1538 = fma(_1514, _1474, -0.5);
    float _1540 = -_1504;
    float _1542 = fma(_1002, _1402, _1540);
    float _1544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1546 = fma(_1534, -2.0, _1532);
    bool _1548 = _1508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1550 = -_1536;
    float _1552 = fma(_1480, 2.0, _1550);
    float _1554 = fma(_1064, _1542, _1520);
    float _1556 = _984 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1558 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1478);
    float _1560 = -_122;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1552);
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1566 = _1556 + _1554;
    float _1568 = fma(_1304, _1350, _1516);
    float _1570 = fma(_1262, _1350, _1510);
    float _1572 = fma(_1318, _1350, _1518);
    float _1574 = fma(_1558, _1538, _1562);
    float _1576 = fma(_1366, _1306, _1568);
    float _1578 = _1538;
    float _1580 = _1574;
    if (!_1548)
    {
        _1578 = _1566;
    }
    float _1582 = _1578;
    bool _1584 = !_1548;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1508 + _1590;
        float _1594 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1502);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1484, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1488, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1566, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1522 = _1632;
        _1524 = _1634;
        _1470 = _1616;
        _1526 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1522;
    float _1640 = _1524;
    float _1642 = _1470;
    float _1644 = _1526;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1398, _1306, _1570);
    float _1652 = fma(_1498, _1306, _1572);
    float _1654 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1512);
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1546);
    float _1660 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1662 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1576);
    float _1664 = _1656 + _1640;
    float _1666 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1650);
    float _1668 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1652);
    float _1670 = -_1658;
    float _1672 = fma(_1654, _1390, _1670);
    float _1674 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1676 = _1660 * _1564;
    float _1678 = sqrt(_1664);
    float _1680 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1682 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1684 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1686 = _1674 * _1544;
    float _1688 = _1574 + 0.5;
    float _1690 = _1672 + 0.5;
    float _1692 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1686;
    out.m_61.y = _1676;
    out.m_61.z = _1688;
    out.m_61.w = _1690;
    bool _1698 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1700 = isnan(_1678);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1706 = _1702 || _1704;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1692;
    out.m_65.y = _1694;
    out.m_65.z = _1696;
    float _1708 = _1696;
    if (!_1706)
    {
        _1580 = 1.0;
    }
    float _1710 = _1580;
    bool _1712 = !_1706;
    float _1714 = _1710;
    if (!_1712)
    {
        bool _1716 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1718 = isnan(_1678);
        bool _1720 = _1716 || _1718;
        bool _1722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1724 = _1720 || _1722;
        if (!_1724)
        {
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = _1678 + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1738 = 1.0 / _1732;
            float _1740 = _1728 * _1738;
            float _1742 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1714 = _1742;
            _1744 = true;
        }
        else
        {
            bool _1746 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1748 = isnan(_1678);
            bool _1750 = _1746 || _1748;
            bool _1752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1754 = _1750 || _1752;
            if (!_1754)
            {
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1678 + _1756;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1768 = 1.0 / _1762;
                float _1770 = _1758 * _1768;
                float _1772 = fma(_1770, _1766, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1714 = _1772;
                _1744 = true;
            }
            else
            {
                _1714 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1744 = false;
    float _1774 = _1714;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1778 = _1636 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1782 = _1642 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1786 = _1644 + _1784;
    float _1788 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1790 = fma(_1782, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1792 = fma(_1786, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1794 = -_1556;
    float _1796 = _1794 + _1788;
    float _1798 = -_1364;
    float _1800 = _1798 + _1790;
    float _1802 = -_1384;
    float _1804 = _1802 + _1792;
    float _1806 = _1796 * _1796;
    float _1808 = fma(_1800, _1800, _1806);
    float _1810 = fma(_1804, _1804, _1808);
    float _1812 = sqrt(_1810);
    bool _1814 = _1812 > 0.0;
    bool _1816 = !_1814;
    float _1818 = _1806;
    float _1820 = _1790;
    float _1822 = _1792;
    float _1824 = _1796;
    float _1826 = _1788;
    float _1828 = _1800;
    float _1830 = _1810;
    if (!_1816)
    {
        bool _1832 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1834 = _1812;
        if (_1832)
        {
            float _1836 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1834 = _1836;
        }
        float _1838 = _1834;
        if (_1832)
        {
            _1818 = _954;
        }
        float _1840 = _1818;
        float _1842 = _1838;
        float _1844 = _1840;
        if (_1832)
        {
            float _1846 = _1838 * _638;
            _1012 = _1846;
        }
        float _1848 = _1012;
        float _1850 = _1848;
        float _1852 = _1848;
        if (_1832)
        {
            float _1854 = _1838 * _636;
            _1708 = _1854;
        }
        float _1856 = _1708;
        float _1858 = _1856;
        if (_1832)
        {
            float _1860 = _1838 * _640;
            _1842 = _1860;
        }
        float _1862 = _1842;
        float _1864 = _1862;
        if (!_1832)
        {
            float _1866 = _122 + 1.0;
            if (!_160)
            {
                float _1868 = _1866 * _1866;
                float _1870 = _1868 * 0.5;
                _1850 = _1870;
            }
            float _1872 = _1850;
            float _1874 = _1872;
            if (!_160)
            {
                float _1876 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1874 = _1876;
            }
            float _1878 = _1874;
            bool _1880 = !_160;
            float _1882 = _1878;
            if (!_1880)
            {
                float _1884 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1886 = log2(_1884);
                float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1890 = _1888 + 1.0;
                float _1892 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1894 = _1886 * _1866;
                float _1896 = 1.0 / _1890;
                float _1898 = _1892 * 0.693147182464599609375;
                float _1900 = exp2(_1894);
                float _1902 = 1.0 / _1898;
                float _1904 = _1900 + (-1.0);
                float _1906 = -_1904;
                float _1908 = fma(_1906, _1902, _1866);
                float _1910 = _1908 * _1896;
                float _1912 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1882 = _1912;
            }
            float _1914 = _1882;
            float _1916 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1918 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1920 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1922 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1924 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1926 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1928 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1922);
            float _1930 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1924);
            float _1932 = _1924;
            if (!_160)
            {
                _1932 = _1866;
            }
            float _1934 = _1932;
            float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1928);
            bool _1938 = !_160;
            float _1940 = _1934;
            if (!_1938)
            {
                float _1942 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1944 = log2(_1942);
                float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1948 = _1946 + 1.0;
                float _1950 = 1.0 / _1948;
                float _1952 = _1944 * _1866;
                float _1954 = exp2(_1952);
                float _1956 = -_1954;
                float _1958 = _1956 + 1.0;
                float _1960 = _1958 * _1950;
                _1940 = _1960;
            }
            float _1962 = _1940;
            float _1964 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1926);
            float _1966 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1930);
            float _1968 = fma(_1962, _146, _1936);
            float _1970 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1964);
            float _1972 = fma(_1962, _144, _1966);
            float _1974 = -_368;
            float _1976 = _1974 + _1968;
            float _1978 = fma(_1962, _148, _1970);
            float _1980 = -_374;
            float _1982 = _1980 + _1972;
            float _1984 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1986 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1988 = -_382;
            float _1990 = _1988 + _1978;
            float _1992 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1984);
            float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1986);
            float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1992);
            float _2000 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1994);
            float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1996);
            float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1998);
            float _2006 = _2000 * _2000;
            float _2008 = fma(_2002, _2002, _2006);
            float _2010 = fma(_2004, _2004, _2008);
            _1844 = _2010;
            _646 = _2000;
            _648 = _2002;
            _650 = _2004;
            _1852 = _2002;
            _1858 = _2000;
            _1864 = _2004;
            _180 = _2008;
        }
        float _2012 = _1844;
        float _2014 = _646;
        float _2016 = _648;
        float _2018 = _650;
        float _2020 = _1852;
        float _2022 = _1858;
        float _2024 = _1864;
        float _2026 = _180;
        float _2028 = sqrt(_2012);
        float _2030 = rsqrt(_1810);
        bool _2032 = _2028 > 0.0;
        float _2034 = _1796 * _2030;
        float _2036 = _1800 * _2030;
        float _2038 = _1804 * _2030;
        bool _2040 = !_2032;
        _1824 = _2038;
        _182 = _2026;
        if (!_2040)
        {
            float _2042 = rsqrt(_2012);
            float _2044 = _2042 * _2014;
            float _2046 = _2042 * _2016;
            float _2048 = _2042 * _2018;
            float _2050 = _2034 * _2044;
            float _2052 = fma(_2036, _2046, _2050);
            float _2054 = fma(_2038, _2048, _2052);
            float _2056 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2058 = fma(_2020, _2056, _1790);
            float _2060 = fma(_2022, _2056, _1788);
            float _2062 = fma(_2024, _2056, _1792);
            _1820 = _2058;
            _1822 = _2062;
            _1826 = _2060;
            _182 = _2050;
        }
    }
    float _2064 = _1820;
    float _2066 = _1822;
    float _2068 = _1824;
    float _2070 = _1826;
    float _2072 = _182;
    bool _2074 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(0.5);
    bool _2082 = _2078 || _2080;
    float _2084 = _2072;
    float _2086 = _2068;
    float _2088 = _2070;
    if (_2082)
    {
        _2084 = _2064;
    }
    float _2090 = _2084;
    float _2092 = _2090;
    if (_2082)
    {
        _2086 = _2066;
    }
    float _2094 = _2086;
    float _2096 = _2094;
    if (!_2082)
    {
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2100 = _1556 + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2104 = _1364 + _2102;
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2108 = -_1556;
        float _2110 = _2108 + _2070;
        float _2112 = _2100 * _2100;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2116 = _1384 + _2114;
        float _2118 = -_1384;
        float _2120 = _2118 + _2066;
        float _2122 = fma(_2104, _2104, _2112);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2126 = fma(_2116, _2116, _2122);
        float _2128 = sqrt(_2126);
        float _2130 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2124;
        float _2136 = -_1364;
        float _2138 = _2136 + _2064;
        float _2140 = _2130 * _2134;
        float _2142 = fma(_2138, _2140, _1364);
        float _2144 = fma(_2110, _2140, _1556);
        float _2146 = fma(_2120, _2140, _1384);
        _2088 = _2144;
        _2092 = _2142;
        _2096 = _2146;
    }
    float _2148 = _2088;
    float _2150 = _2092;
    float _2152 = _2096;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2148 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2160 = _2150 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2164 = _2152 + _2162;
    float _2166 = _2156 * _2156;
    float _2168 = fma(_2160, _2160, _2166);
    float _2170 = fma(_2164, _2164, _2168);
    float _2172 = rsqrt(_2170);
    float _2174 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2176 = _2160 * _2174;
    float _2178 = _2164 * _2174;
    float _2180 = _2176 * _2176;
    float _2182 = _2178 * _2178;
    float _2184 = _2180 + _2182;
    float _2186 = sqrt(_2184);
    bool _2188 = _2186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2186 + _2190;
    float _2194 = _2172;
    float _2196 = _2192;
    float _2198 = _2156;
    float _2200 = _2174;
    float _2202 = _2176;
    if (_2188)
    {
        float _2204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (_2188)
    {
        float _2208 = rsqrt(_2184);
        _1828 = _2208;
    }
    float _2210 = _1828;
    float _2212 = _2210;
    if (_2188)
    {
        float _2214 = _2192 * _2206;
        _2196 = _2214;
    }
    float _2216 = _2196;
    if (_2188)
    {
        float _2218 = _2216 * 0.15915493667125701904296875;
        _1830 = _2218;
    }
    float _2220 = _1830;
    float _2222 = _2206;
    if (_2188)
    {
        float _2224 = _2220 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        _2222 = _2226;
    }
    float _2228 = _2222;
    float _2230 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2232 = precise::max(0.0, _2230);
    float _2234 = _2164;
    float _2236 = _2232;
    if (_2188)
    {
        float _2238 = _2220 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        _2234 = _2240;
    }
    float _2242 = _2234;
    float _2244 = -_2174;
    float _2246 = -_2232;
    float _2248 = fma(_2156, _2244, _2246);
    if (!_2188)
    {
        _2198 = _2180;
    }
    float _2250 = _2198;
    float _2252 = _2250;
    if (_2188)
    {
        float _2254 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2236 = _2254;
    }
    float _2256 = _2236;
    float _2258 = sqrt(_2170);
    float _2260 = _2228;
    float _2262 = _2256;
    if (_2188)
    {
        float _2264 = fma(_2228, _2256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2260 = _2264;
    }
    float _2266 = _2260;
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = _2266;
    if (_2188)
    {
        float _2272 = _2242 + (-1.0);
        _2262 = _2272;
    }
    float _2274 = _2262;
    float _2276 = _2274;
    if (_2188)
    {
        float _2278 = _2210 * _2266;
        _448 = _2278;
    }
    float _2280 = _448;
    if (!_2188)
    {
        _2212 = _2248;
    }
    float _2282 = _2212;
    float _2284 = _2282;
    if (_2188)
    {
        float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2286;
    }
    float _2288 = _2200;
    if (_2188)
    {
        float _2290 = _2176 * _2280;
        _2202 = _2290;
    }
    float _2292 = _2202;
    if (!_2188)
    {
        _2270 = _2178;
    }
    float _2294 = _2270;
    float _2296 = _2294;
    if (_2188)
    {
        float _2298 = _2178 * _2280;
        _2296 = _2298;
    }
    float _2300 = _2296;
    if (_2188)
    {
        float _2302 = fma(_2248, _2242, _2288);
        _2284 = _2302;
    }
    float _2304 = _2284;
    if (_2188)
    {
        float _2306 = _2292 * _2292;
        _2252 = _2306;
    }
    float _2308 = _2252;
    if (!_2188)
    {
        _2276 = _2182;
    }
    float _2310 = _2276;
    float _2312 = _2310;
    if (_2188)
    {
        float _2314 = _2300 * _2300;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = fma(_2304, _2304, _2308);
    float _2320 = _2318 + _2316;
    float _2322 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2326 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2324);
    float _2328 = precise::clamp(_2326, 0.0, 1.0);
    float _2330 = rsqrt(_2320);
    float _2332 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2322);
    float _2334 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2336 = -_2328;
    float _2338 = _2336 + 1.0;
    float _2340 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2342 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2344 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2334);
    float _2346 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2348 = abs(_2338);
    float _2350 = log2(_2348);
    float _2352 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2342);
    float _2354 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2344);
    float _2356 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2346);
    float _2358 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2360 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2352);
    float _2362 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2364 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2356);
    float _2366 = _2330 * _2292;
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2372 = _2330 * _2304;
    float _2374 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2376 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2378 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2370);
    float _2380 = _2330 * _2300;
    float _2382 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2384 = -_2374;
    float _2386 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = -_2376;
    float _2390 = fma(_2388, _2268, 1.0);
    float _2392 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2394 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2378);
    float _2396 = exp2(_2382);
    float _2398 = -_2380;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2402 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2394);
    float _2406 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2408 = fma(_2400, -0.5, 0.5);
    float _2410 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2402);
    float _2412 = fma(_2400, 0.5, 0.5);
    float _2414 = log2(_2390);
    float _2416 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2406);
    float _2418 = _2372 + 1.0;
    float _2420 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2410);
    float _2422 = fma(_2412, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2424 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2416);
    float _2426 = 1.0 / _2404;
    float _2428 = -_2372;
    float _2430 = fma(_2396, _2418, _2428);
    float _2432 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2434 = fma(_2412, _2422, -0.212114393711090087890625);
    float _2436 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2424);
    float _2438 = fma(_2430, 0.5, 0.5);
    float _2440 = fma(_2412, _2434, 1.570728778839111328125);
    float _2442 = sqrt(_2408);
    float _2444 = _2414 * 0.693147182464599609375;
    float _2446 = _2432 * _2426;
    float _2448 = _2436 * _2426;
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = fma(_2446, 0.5, 0.5);
    float _2454 = fma(_2448, -0.5, 0.5);
    float _2456 = _2442 * 0.636619746685028076171875;
    float3 _6501 = float3(_2452, _2454, _2450);
    float _2458 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6501, float3(0.0), isnan(_6501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6501, float3(0.0), isnan(_6501)), level(0.0)).x;
    float3 _6512 = float3(_2452, _2454, _2450);
    float4 _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6512, float3(0.0), isnan(_6512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6512, float3(0.0), isnan(_6512)), level(0.0)).xyzw;
    float _2463 = _2461.x;
    float _2465 = _2461.y;
    float _2467 = _2461.z;
    float _2469 = _2461.w;
    float _2471 = -_2440;
    float _2473 = fma(_2456, _2471, 1.0);
    float2 _6534 = float2(_2473, _2438);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2487 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2489 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2487);
    float _2491 = exp2(_2485);
    float _2493 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2489);
    float _2495 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2493);
    float _2497 = _2495 + _2404;
    out.gl_Position.x = _2432;
    out.gl_Position.y = _2436;
    out.gl_Position.z = _2495;
    out.gl_Position.w = _2404;
    float _2499 = -_2491;
    float _2501 = _2499 + 1.0;
    float _2503 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2505 = _2497 * 0.5;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _2503;
    out.m_67.z = _2505;
    out.m_67.w = _2404;
    float _2509 = _2507 * _2458;
    float _2511 = -_2507;
    float _2513 = _2511 + 1.0;
    float _2515 = _2469 * _2509;
    float _2517 = _2483 * _2509;
    float _2519 = fma(_2479, _2515, _2463);
    float _2521 = fma(_2481, _2515, _2465);
    float _2523 = _2469 * _2513;
    float _2525 = fma(_2469, _2517, _2467);
    out.m_69.x = _2519;
    out.m_69.y = _2521;
    out.m_69.z = _2525;
    out.m_69.w = _2523;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1744 = false;
    bool _924 = false;
    bool _796 = false;
    bool _670 = false;
    bool _514 = false;
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
        float _2582 = as_type<float>(_104);
        out.gl_Position.z = _2582;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2650 = as_type<float>(_142);
        out.gl_Position.z = _2650;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _126 = _166;
    }
    float _168 = _126;
    float _170 = _168;
    if (!_160)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_160;
    float _178 = _174;
    float _180 = _148;
    float _182 = _148;
    if (!_176)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _150 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _150);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _212;
    }
    float _214 = _178;
    float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _218 = !_160;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _150 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _162 = _238;
    }
    float _240 = _162;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _250 = _216 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _252 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _244);
    float _254 = _244;
    float _256 = _248;
    if (!_160)
    {
        float _258 = _122 * _122;
        float _260 = _258 * 0.5;
        _254 = _260;
    }
    float _262 = _254;
    float _264 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].y, _248);
    float _266 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].z, _250);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _252);
    if (!_160)
    {
        float _270 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _270;
    }
    float _272 = _256;
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
        float _290 = exp2(_288);
        float _292 = _286 * 0.693147182464599609375;
        float _294 = 1.0 / _292;
        float _296 = 1.0 / _284;
        float _298 = _290 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _294, _122);
        float _304 = _302 * _296;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _312 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _266);
    float _314 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].y, _264);
    float _318 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _320 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _322 = _310 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _324 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].y, _318);
    float _328 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _322);
    float _332 = fma(_240, _146, _316);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    float _336 = _314;
    if (!_160)
    {
        _336 = _122;
    }
    float _338 = _336;
    bool _340 = !_160;
    float _342 = _338;
    if (!_340)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _122 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _342 = _362;
    }
    float _364 = _342;
    float _366 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].x, _328);
    float _368 = fma(_364, _146, _334);
    float _370 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].z, _330);
    float _372 = fma(_240, _144, _268);
    float _374 = fma(_364, _144, _366);
    float _376 = -_368;
    float _378 = _332 + _376;
    float _380 = fma(_240, _148, _312);
    float _382 = fma(_364, _148, _370);
    float _384 = -_374;
    float _386 = _372 + _384;
    float _388 = _378 * _378;
    float _390 = in.m_51.w;
    float _392 = -_382;
    float _394 = _380 + _392;
    float _396 = _378 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _398 = fma(_386, _386, _388);
    float _400 = _378 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _402 = _378 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _406 = fma(_394, _394, _398);
    float _408 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _410 = in.m_44.x;
    float _412 = in.m_44.y;
    float _414 = in.m_44.z;
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _418 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _404);
    float _420 = sqrt(_406);
    float _422 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _408);
    bool _426 = _420 >= 9.9999999747524270787835121154785e-07;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(9.9999999747524270787835121154785e-07);
    bool _434 = _430 || _432;
    float _436 = fma(_372, _390, _410);
    float _438 = fma(_380, _390, _414);
    float _440 = fma(_332, _390, _412);
    float _442 = _372;
    float _444 = _380;
    float _446 = _424;
    float _448 = _382;
    if (_434)
    {
        _442 = _418;
    }
    float _450 = _442;
    float _452 = _450;
    if (_434)
    {
        _444 = _422;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_434)
    {
        bool _458 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _460 = !_458;
        if (!_460)
        {
            float _462 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _464 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _466 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _468 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _462);
            float _470 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _464);
            float _472 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _466);
            float _474 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _468);
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _472);
            float _480 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _482 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _484 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _486 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _480);
            float _488 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
            float _490 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _484);
            float _492 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
            float _494 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
            float _496 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
            float _498 = _492 * _492;
            float _500 = fma(_494, _494, _498);
            float _502 = fma(_496, _496, _500);
            float _504 = rsqrt(_502);
            float _506 = _504 * 9.9999999747524270787835121154785e-07;
            float _508 = _494 * _506;
            float _510 = _492 * _506;
            float _512 = _496 * _506;
            _446 = _510;
            _452 = _508;
            _456 = _512;
            _514 = true;
        }
        else
        {
            float _516 = _146 * _146;
            float _518 = fma(_144, _144, _516);
            float _520 = fma(_148, _148, _518);
            float _522 = sqrt(_520);
            bool _524 = _522 >= 9.9999999747524270787835121154785e-07;
            bool _526 = isnan(_522);
            bool _528 = _524 || _526;
            bool _530 = isnan(9.9999999747524270787835121154785e-07);
            bool _532 = _528 || _530;
            if (!_532)
            {
                float _534 = _412 * _412;
                float _536 = fma(_410, _410, _534);
                float _538 = fma(_414, _414, _536);
                float _540 = sqrt(_538);
                bool _542 = _540 >= 9.9999999747524270787835121154785e-07;
                bool _544 = isnan(_540);
                bool _546 = _542 || _544;
                bool _548 = isnan(9.9999999747524270787835121154785e-07);
                bool _550 = _546 || _548;
                if (!_550)
                {
                    float _552 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _554 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _552);
                    float _556 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _554);
                    float _558 = rsqrt(_556);
                    float _560 = _558 * 9.9999999747524270787835121154785e-07;
                    float _562 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _564 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _566 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _446 = _564;
                    _452 = _562;
                    _456 = _566;
                    _514 = true;
                }
                else
                {
                    float _568 = _412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _570 = _412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _572 = _412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _574 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _568);
                    float _576 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _570);
                    float _578 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
                    float _580 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _574);
                    float _582 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
                    float _584 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
                    float _586 = _580 * _580;
                    float _588 = fma(_582, _582, _586);
                    float _590 = fma(_584, _584, _588);
                    float _592 = rsqrt(_590);
                    float _594 = _592 * 9.9999999747524270787835121154785e-07;
                    float _596 = _582 * _594;
                    float _598 = _580 * _594;
                    float _600 = _584 * _594;
                    _446 = _598;
                    _452 = _596;
                    _456 = _600;
                    _514 = true;
                }
            }
            else
            {
                float _602 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _604 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _606 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _608 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
                float _610 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
                float _612 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
                float _614 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
                float _616 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
                float _618 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
                float _620 = _614 * _614;
                float _622 = fma(_616, _616, _620);
                float _624 = fma(_618, _618, _622);
                float _626 = rsqrt(_624);
                float _628 = _626 * 9.9999999747524270787835121154785e-07;
                float _630 = _616 * _628;
                float _632 = _614 * _628;
                float _634 = _618 * _628;
                _446 = _632;
                _452 = _630;
                _456 = _634;
            }
        }
    }
    _514 = false;
    float _636 = _446;
    float _638 = _452;
    float _640 = _456;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _644 = !_642;
    float _646 = _636;
    float _648 = _638;
    float _650 = _640;
    float _668;
    if (!_644)
    {
        float _652 = in.m_53.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        float _672 = float(_88);
        float _674 = 1.0 / _672;
        float _676 = _122 * _674;
        _668 = _676;
    }
    _670 = false;
    float _678 = _668;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = _678 + _680;
    bool _684 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _686 = isnan(_678);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _696;
    float _700 = 1.0 / _698;
    bool _702 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _704 = isnan(_678);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_694;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _722;
    bool _726 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _728;
    float _732 = _712 * _716;
    float _734 = -_712;
    float _736 = _734 + 1.0;
    float _738 = _682 * _700;
    float _740 = in.m_51.x;
    float _742 = in.m_51.y;
    float _744 = in.m_51.z;
    float _746 = fma(_720, _738, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _748 = fma(_730, _738, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _750 = fma(_724, _738, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _752 = _746 * _732;
    float _754 = _748 * _732;
    float _756 = _750 * _732;
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].x, _752);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].y, _754);
    float _762 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].z, _756);
    float _764 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].x, _758);
    float _766 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].y, _760);
    float _768 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[144].z, _762);
    float _770 = _764 * _740;
    float _772 = _766 * _742;
    float _774 = _768 * _744;
    bool _776 = !_726;
    float _794;
    if (!_776)
    {
        float _778 = in.m_53.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_88);
        float _800 = 1.0 / _798;
        float _802 = _122 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _808 = _804 + _806;
    bool _810 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _812 = isnan(_804);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _822;
    bool _826 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _828 = isnan(_804);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_820;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _842;
    float _846 = 1.0 / _824;
    bool _848 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _850 = _836 * _840;
    float _852 = -_836;
    float _854 = _852 + 1.0;
    float _856 = _808 * _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _858;
    float _862 = fma(_844, _856, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _864;
    float _868 = fma(_860, _856, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _870 = _862 * _850;
    float _872 = fma(_866, _856, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _874 = _868 * _850;
    float _876 = _872 * _850;
    float _878 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].x, _870);
    float _880 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].y, _876);
    float _882 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[107].z, _874);
    float _884 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].x, _878);
    float _886 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].y, _880);
    float _888 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[108].z, _882);
    float _890 = _884 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = _886 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _894 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _898;
    out.m_55.y = _900;
    out.m_55.z = _902;
    out.m_55.w = _896;
    bool _904 = !_848;
    float _922;
    if (!_904)
    {
        float _906 = in.m_53.x;
        float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _910 = _906 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _914 = _912 * _908;
        float _916 = floor(_914);
        float _918 = -_916;
        float _920 = _914 + _918;
        _922 = _920;
        _924 = true;
    }
    else
    {
        float _926 = float(_88);
        float _928 = 1.0 / _926;
        float _930 = _122 * _928;
        _922 = _930;
    }
    _924 = false;
    float _932 = _922;
    float _934 = _636 * _636;
    float _936 = in.m_53.w;
    float _938 = fma(_638, _638, _934);
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _942 = _940 != 0;
    float _944 = in.m_57.x;
    float _946 = in.m_57.y;
    float _948 = in.m_57.z;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _952 = _950 != 0;
    float _954 = fma(_640, _640, _938);
    float _956 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = in.m_59.y;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _962 = _960 != 0;
    float _964 = rsqrt(_954);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _968 = _966 != 0;
    float _970 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _974 = _972 != 0;
    float _976 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _978 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _982 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _976);
    float _984 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].z, _970);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _986;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _994 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _980);
    bool _996 = _936 > 0.5;
    float _998 = 1.0 / _988;
    float _1000 = _964 * _636;
    float _1002 = _964 * _638;
    float _1004 = _964 * _640;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1008 = _964;
    bool _1010 = _968;
    float _1012 = _954;
    if (_952)
    {
        float _1014 = in.m_53.x;
        _1008 = _1014;
    }
    float _1016 = _1008;
    float _1018 = -_958;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / _992;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1006);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _1028 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1030 = _996 ? as_type<int>(_1020) : as_type<int>(_958);
    float _1032 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1024);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _944);
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _948);
    float _1038 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1040;
    float _1044 = abs(_1032);
    bool _1046 = _1044 > 0.99989998340606689453125;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1050 = _932 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1054 = _932 + _1052;
    float _1056 = _1028 * _1026;
    float _1058 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1064 = _1038 * _1036;
    float _1066 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].z, _994);
    float _1068 = _1050 * _998;
    float _1070 = _1054 * _1022;
    float _1072 = 1.0 / _1042;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1076 = _932 + _1074;
    float _1078 = _1054;
    float _1080 = _1032;
    float _1082 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1084 = _1046;
    float _1086 = _958;
    if (_1046)
    {
        _1078 = 0.001000000047497451305389404296875;
    }
    float _1088 = _1078;
    float _1090 = _978 * _1034;
    float _1092 = _968 ? as_type<float>(_1030) : _958;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1096 = _932 + _1094;
    if (_952)
    {
        bool _1098 = _1016 > 0.5;
        _1010 = _1098;
    }
    bool _1100 = _1010;
    float _1102 = 1.0 / _1062;
    float _1104 = _1042;
    if (_962)
    {
        float _1106 = in.m_53.z;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = _1056 * _1002;
    float _1112 = in.m_59.x;
    float _1114 = 0.0;
    if (!_1046)
    {
        _1114 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1116 = _1114;
    float _1118 = _1116;
    if (_1046)
    {
        float _1120 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1118 = _1120;
    }
    float _1122 = _1118;
    if (!_1046)
    {
        _1080 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1124 = _1080;
    float _1126 = _1124;
    if (_1046)
    {
        float _1128 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1126 = _1128;
    }
    float _1130 = _1126;
    if (!_1046)
    {
        _1082 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1132 = _1082;
    float _1134 = _1132;
    if (_1046)
    {
        float _1136 = fma(_1088, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1134 = _1136;
    }
    float _1138 = _1134;
    float _1140 = _1088;
    float _1142 = _1138;
    if (!_942)
    {
        float _1144 = in.m_53.y;
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = -_1122;
    float _1150 = _1004 * _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1152;
    float _1156 = -_1138;
    float _1158 = _1000 * _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1160;
    float _1164 = -_1138;
    float _1166 = -_1150;
    float _1168 = fma(_1002, _1164, _1166);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1170;
    float _1174 = fma(_1154, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1176 = fma(_1162, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1178 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1180 = isnan(_932);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_1172, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1192 = _1076 * _1072;
    if (_962)
    {
        bool _1194 = _1108 > 0.5;
        _1084 = _1194;
    }
    bool _1196 = _1084;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1210 = -_1130;
    float _1212 = -_1158;
    float _1214 = fma(_1004, _1210, _1212);
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1216;
    bool _1220 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1222 = isnan(_932);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1130;
    float _1234 = _1002 * _1232;
    float _1236 = _1168 * _1168;
    bool _1238 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1240 = isnan(_932);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = fma(_1200, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1252 = fma(_1204, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1254 = fma(_1208, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1256 = -_1188;
    float _1258 = _1256 + 1.0;
    float _1260 = _1096 * _1102;
    float _1262 = fma(_1218, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1264 = -_1122;
    float _1266 = -_1234;
    float _1268 = fma(_1000, _1264, _1266);
    float _1270 = fma(_1214, _1214, _1236);
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1272;
    bool _1276 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1278 = isnan(_932);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = -_1230;
    float _1290 = _1288 + 1.0;
    float _1292 = _1146;
    if (!_942)
    {
        _1142 = _1146;
    }
    float _1294 = _1142;
    float _1296 = _1248 * _1258;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1298;
    float _1302 = fma(_1268, _1268, _1270);
    float _1304 = fma(_1274, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1306 = _1286 * _1290;
    float _1308 = _1294;
    if (_942)
    {
        float _1310 = in.m_53.x;
        float _1312 = in.m_53.y;
        _1292 = _1312;
        _1308 = _1310;
    }
    float _1314 = _1292;
    float _1316 = _1308;
    float _1318 = fma(_1300, _1192, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1320 = -_1286;
    float _1322 = _1320 + 1.0;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1326 = _1290;
    int _1328 = as_type<int>(_1314);
    if (!_942)
    {
        float _1330 = in.m_53.z;
        _1326 = _1330;
    }
    float _1332 = _1326;
    bool _1334 = _932 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1336 = isnan(_932);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = -_1248;
    float _1348 = _1346 + 1.0;
    float _1350 = _1188 * _1322;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1360 = _1344 * _1348;
    float _1362 = rsqrt(_1302);
    float _1364 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = fma(_1358, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1368 = _1174 * _1360;
    float _1370 = _1176 * _1360;
    float _1372 = _1190 * _1360;
    float _1374 = _1056 * _1000;
    float _1376 = _1358;
    if (!_952)
    {
        _1376 = _1112;
    }
    float _1378 = _1376;
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1382 = _1056 * _1004;
    float _1384 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1390 = fma(_1380, _1092, -0.5);
    float _1392 = -_1344;
    float _1394 = _1392 + 1.0;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1398 = fma(_1388, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1400 = _1168 * _1362;
    float _1402 = _1268 * _1362;
    float _1404 = _1214 * _1362;
    float _1406 = _1380;
    float _1408 = _1332;
    int _1410 = as_type<int>(_1362);
    float _1412 = _1378;
    if (!_942)
    {
        _1406 = _1332;
    }
    float _1414 = _1406;
    float _1416 = _1002 * _1400;
    float _1418 = _1000 * _1402;
    float _1420 = _1414;
    if (_942)
    {
        _1420 = _1314;
    }
    float _1422 = _1420;
    float _1424 = fma(_1090, _1404, _1110);
    if (_942)
    {
        _1408 = _1314;
    }
    float _1426 = _1408;
    float _1428 = -_1416;
    float _1430 = fma(_1000, _1404, _1428);
    bool _1432 = _1314 > 0.5;
    if (_952)
    {
        float _1434 = -_1112;
        float _1436 = _1434 + 1.0;
        _1328 = as_type<int>(_1436);
    }
    int _1438 = _1328;
    float _1440 = -_1418;
    float _1442 = fma(_1004, _1400, _1440);
    float _1444 = fma(_1090, _1402, _1382);
    float _1446 = as_type<float>(_1438);
    if (_962)
    {
        float _1448 = -_1112;
        float _1450 = _1448 + 1.0;
        _1410 = as_type<int>(_1450);
    }
    int _1452 = _1410;
    float _1454 = fma(_1064, _1442, _1424);
    float _1456 = fma(_1064, _1430, _1444);
    if (_952)
    {
        float _1458 = _1100 ? as_type<float>(_1438) : _1112;
        _1412 = _1458;
    }
    float _1460 = _1412;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_962)
    {
        _1446 = _1112;
    }
    float _1464 = _1446;
    float _1466 = _1364 + _1454;
    float _1468 = _1464;
    float _1470 = _1466;
    if (_962)
    {
        float _1472 = _1196 ? as_type<float>(_1452) : _1112;
        _1468 = _1472;
    }
    float _1474 = _1468;
    float _1476 = _1384 + _1456;
    float _1478 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1462);
    float _1480 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1466 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1488 = _1476 + _1486;
    float _1490 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1368);
    float _1492 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1372);
    float _1494 = _1484 * _1484;
    float _1496 = _1488 * _1488;
    float _1498 = fma(_1354, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1500 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1370);
    float _1502 = _1494 + _1496;
    float _1504 = _1004 * _1404;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1508 = sqrt(_1502);
    float _1510 = fma(_1252, _1296, _1500);
    float _1512 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1506);
    float _1514 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1516 = fma(_1250, _1296, _1490);
    float _1518 = fma(_1254, _1296, _1492);
    float _1520 = fma(_1090, _1400, _1374);
    float _1522 = _1494;
    float _1524 = _1496;
    float _1526 = _1476;
    if (_974)
    {
        float _1528 = _1432 ? _1020 : _958;
        _1086 = _1528;
    }
    float _1530 = _1086;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1534 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1538 = fma(_1514, _1474, -0.5);
    float _1540 = -_1504;
    float _1542 = fma(_1002, _1402, _1540);
    float _1544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1546 = fma(_1534, -2.0, _1532);
    bool _1548 = _1508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1550 = -_1536;
    float _1552 = fma(_1480, 2.0, _1550);
    float _1554 = fma(_1064, _1542, _1520);
    float _1556 = _984 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1558 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1478);
    float _1560 = -_122;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1552);
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1566 = _1556 + _1554;
    float _1568 = fma(_1304, _1350, _1516);
    float _1570 = fma(_1262, _1350, _1510);
    float _1572 = fma(_1318, _1350, _1518);
    float _1574 = fma(_1558, _1538, _1562);
    float _1576 = fma(_1366, _1306, _1568);
    float _1578 = _1538;
    float _1580 = _1574;
    if (!_1548)
    {
        _1578 = _1566;
    }
    float _1582 = _1578;
    bool _1584 = !_1548;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1508 + _1590;
        float _1594 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1502);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1484, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1488, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1566, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1522 = _1632;
        _1524 = _1634;
        _1470 = _1616;
        _1526 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1522;
    float _1640 = _1524;
    float _1642 = _1470;
    float _1644 = _1526;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1398, _1306, _1570);
    float _1652 = fma(_1498, _1306, _1572);
    float _1654 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1512);
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1546);
    float _1660 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1662 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1576);
    float _1664 = _1656 + _1640;
    float _1666 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1650);
    float _1668 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1652);
    float _1670 = -_1658;
    float _1672 = fma(_1654, _1390, _1670);
    float _1674 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1676 = _1660 * _1564;
    float _1678 = sqrt(_1664);
    float _1680 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1682 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1684 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1686 = _1674 * _1544;
    float _1688 = _1574 + 0.5;
    float _1690 = _1672 + 0.5;
    float _1692 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1686;
    out.m_61.y = _1676;
    out.m_61.z = _1688;
    out.m_61.w = _1690;
    bool _1698 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1700 = isnan(_1678);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1706 = _1702 || _1704;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1692;
    out.m_65.y = _1694;
    out.m_65.z = _1696;
    float _1708 = _1696;
    if (!_1706)
    {
        _1580 = 1.0;
    }
    float _1710 = _1580;
    bool _1712 = !_1706;
    float _1714 = _1710;
    if (!_1712)
    {
        bool _1716 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1718 = isnan(_1678);
        bool _1720 = _1716 || _1718;
        bool _1722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1724 = _1720 || _1722;
        if (!_1724)
        {
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = _1678 + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1738 = 1.0 / _1732;
            float _1740 = _1728 * _1738;
            float _1742 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1714 = _1742;
            _1744 = true;
        }
        else
        {
            bool _1746 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1748 = isnan(_1678);
            bool _1750 = _1746 || _1748;
            bool _1752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1754 = _1750 || _1752;
            if (!_1754)
            {
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1678 + _1756;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1768 = 1.0 / _1762;
                float _1770 = _1758 * _1768;
                float _1772 = fma(_1770, _1766, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1714 = _1772;
                _1744 = true;
            }
            else
            {
                _1714 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1744 = false;
    float _1774 = _1714;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1778 = _1636 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1782 = _1642 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1786 = _1644 + _1784;
    float _1788 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1790 = fma(_1782, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1792 = fma(_1786, _1774, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1794 = -_1556;
    float _1796 = _1794 + _1788;
    float _1798 = -_1364;
    float _1800 = _1798 + _1790;
    float _1802 = -_1384;
    float _1804 = _1802 + _1792;
    float _1806 = _1796 * _1796;
    float _1808 = fma(_1800, _1800, _1806);
    float _1810 = fma(_1804, _1804, _1808);
    float _1812 = sqrt(_1810);
    bool _1814 = _1812 > 0.0;
    bool _1816 = !_1814;
    float _1818 = _1806;
    float _1820 = _1790;
    float _1822 = _1792;
    float _1824 = _1796;
    float _1826 = _1788;
    float _1828 = _1800;
    float _1830 = _1810;
    if (!_1816)
    {
        bool _1832 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1834 = _1812;
        if (_1832)
        {
            float _1836 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1834 = _1836;
        }
        float _1838 = _1834;
        if (_1832)
        {
            _1818 = _954;
        }
        float _1840 = _1818;
        float _1842 = _1838;
        float _1844 = _1840;
        if (_1832)
        {
            float _1846 = _1838 * _638;
            _1012 = _1846;
        }
        float _1848 = _1012;
        float _1850 = _1848;
        float _1852 = _1848;
        if (_1832)
        {
            float _1854 = _1838 * _636;
            _1708 = _1854;
        }
        float _1856 = _1708;
        float _1858 = _1856;
        if (_1832)
        {
            float _1860 = _1838 * _640;
            _1842 = _1860;
        }
        float _1862 = _1842;
        float _1864 = _1862;
        if (!_1832)
        {
            float _1866 = _122 + 1.0;
            if (!_160)
            {
                float _1868 = _1866 * _1866;
                float _1870 = _1868 * 0.5;
                _1850 = _1870;
            }
            float _1872 = _1850;
            float _1874 = _1872;
            if (!_160)
            {
                float _1876 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1874 = _1876;
            }
            float _1878 = _1874;
            bool _1880 = !_160;
            float _1882 = _1878;
            if (!_1880)
            {
                float _1884 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1886 = log2(_1884);
                float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1890 = _1888 + 1.0;
                float _1892 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1894 = _1886 * _1866;
                float _1896 = 1.0 / _1890;
                float _1898 = _1892 * 0.693147182464599609375;
                float _1900 = exp2(_1894);
                float _1902 = 1.0 / _1898;
                float _1904 = _1900 + (-1.0);
                float _1906 = -_1904;
                float _1908 = fma(_1906, _1902, _1866);
                float _1910 = _1908 * _1896;
                float _1912 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1882 = _1912;
            }
            float _1914 = _1882;
            float _1916 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1918 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1920 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1922 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1924 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1926 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1928 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1922);
            float _1930 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1924);
            float _1932 = _1924;
            if (!_160)
            {
                _1932 = _1866;
            }
            float _1934 = _1932;
            float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1928);
            bool _1938 = !_160;
            float _1940 = _1934;
            if (!_1938)
            {
                float _1942 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1944 = log2(_1942);
                float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1948 = _1946 + 1.0;
                float _1950 = 1.0 / _1948;
                float _1952 = _1944 * _1866;
                float _1954 = exp2(_1952);
                float _1956 = -_1954;
                float _1958 = _1956 + 1.0;
                float _1960 = _1958 * _1950;
                _1940 = _1960;
            }
            float _1962 = _1940;
            float _1964 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1926);
            float _1966 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1930);
            float _1968 = fma(_1962, _146, _1936);
            float _1970 = fma(_1920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1964);
            float _1972 = fma(_1962, _144, _1966);
            float _1974 = -_368;
            float _1976 = _1974 + _1968;
            float _1978 = fma(_1962, _148, _1970);
            float _1980 = -_374;
            float _1982 = _1980 + _1972;
            float _1984 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1986 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1988 = -_382;
            float _1990 = _1988 + _1978;
            float _1992 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1984);
            float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1986);
            float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1992);
            float _2000 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1994);
            float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1996);
            float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1998);
            float _2006 = _2000 * _2000;
            float _2008 = fma(_2002, _2002, _2006);
            float _2010 = fma(_2004, _2004, _2008);
            _1844 = _2010;
            _646 = _2000;
            _648 = _2002;
            _650 = _2004;
            _1852 = _2002;
            _1858 = _2000;
            _1864 = _2004;
            _180 = _2008;
        }
        float _2012 = _1844;
        float _2014 = _646;
        float _2016 = _648;
        float _2018 = _650;
        float _2020 = _1852;
        float _2022 = _1858;
        float _2024 = _1864;
        float _2026 = _180;
        float _2028 = sqrt(_2012);
        float _2030 = rsqrt(_1810);
        bool _2032 = _2028 > 0.0;
        float _2034 = _1796 * _2030;
        float _2036 = _1800 * _2030;
        float _2038 = _1804 * _2030;
        bool _2040 = !_2032;
        _1824 = _2038;
        _182 = _2026;
        if (!_2040)
        {
            float _2042 = rsqrt(_2012);
            float _2044 = _2042 * _2014;
            float _2046 = _2042 * _2016;
            float _2048 = _2042 * _2018;
            float _2050 = _2034 * _2044;
            float _2052 = fma(_2036, _2046, _2050);
            float _2054 = fma(_2038, _2048, _2052);
            float _2056 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2058 = fma(_2020, _2056, _1790);
            float _2060 = fma(_2022, _2056, _1788);
            float _2062 = fma(_2024, _2056, _1792);
            _1820 = _2058;
            _1822 = _2062;
            _1826 = _2060;
            _182 = _2050;
        }
    }
    float _2064 = _1820;
    float _2066 = _1822;
    float _2068 = _1824;
    float _2070 = _1826;
    float _2072 = _182;
    bool _2074 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(0.5);
    bool _2082 = _2078 || _2080;
    float _2084 = _2072;
    float _2086 = _2068;
    float _2088 = _2070;
    if (_2082)
    {
        _2084 = _2064;
    }
    float _2090 = _2084;
    float _2092 = _2090;
    if (_2082)
    {
        _2086 = _2066;
    }
    float _2094 = _2086;
    float _2096 = _2094;
    if (!_2082)
    {
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2100 = _1556 + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2104 = _1364 + _2102;
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2108 = -_1556;
        float _2110 = _2108 + _2070;
        float _2112 = _2100 * _2100;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2116 = _1384 + _2114;
        float _2118 = -_1384;
        float _2120 = _2118 + _2066;
        float _2122 = fma(_2104, _2104, _2112);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2126 = fma(_2116, _2116, _2122);
        float _2128 = sqrt(_2126);
        float _2130 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2124;
        float _2136 = -_1364;
        float _2138 = _2136 + _2064;
        float _2140 = _2130 * _2134;
        float _2142 = fma(_2138, _2140, _1364);
        float _2144 = fma(_2110, _2140, _1556);
        float _2146 = fma(_2120, _2140, _1384);
        _2088 = _2144;
        _2092 = _2142;
        _2096 = _2146;
    }
    float _2148 = _2088;
    float _2150 = _2092;
    float _2152 = _2096;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2148 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2160 = _2150 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2164 = _2152 + _2162;
    float _2166 = _2156 * _2156;
    float _2168 = fma(_2160, _2160, _2166);
    float _2170 = fma(_2164, _2164, _2168);
    float _2172 = rsqrt(_2170);
    float _2174 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2176 = _2160 * _2174;
    float _2178 = _2164 * _2174;
    float _2180 = _2176 * _2176;
    float _2182 = _2178 * _2178;
    float _2184 = _2180 + _2182;
    float _2186 = sqrt(_2184);
    bool _2188 = _2186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2186 + _2190;
    float _2194 = _2172;
    float _2196 = _2192;
    float _2198 = _2156;
    float _2200 = _2174;
    float _2202 = _2176;
    if (_2188)
    {
        float _2204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (_2188)
    {
        float _2208 = rsqrt(_2184);
        _1828 = _2208;
    }
    float _2210 = _1828;
    float _2212 = _2210;
    if (_2188)
    {
        float _2214 = _2192 * _2206;
        _2196 = _2214;
    }
    float _2216 = _2196;
    if (_2188)
    {
        float _2218 = _2216 * 0.15915493667125701904296875;
        _1830 = _2218;
    }
    float _2220 = _1830;
    float _2222 = _2206;
    if (_2188)
    {
        float _2224 = _2220 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        _2222 = _2226;
    }
    float _2228 = _2222;
    float _2230 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2232 = precise::max(0.0, _2230);
    float _2234 = _2164;
    float _2236 = _2232;
    if (_2188)
    {
        float _2238 = _2220 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        _2234 = _2240;
    }
    float _2242 = _2234;
    float _2244 = -_2174;
    float _2246 = -_2232;
    float _2248 = fma(_2156, _2244, _2246);
    if (!_2188)
    {
        _2198 = _2180;
    }
    float _2250 = _2198;
    float _2252 = _2250;
    if (_2188)
    {
        float _2254 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2236 = _2254;
    }
    float _2256 = _2236;
    float _2258 = sqrt(_2170);
    float _2260 = _2228;
    float _2262 = _2256;
    if (_2188)
    {
        float _2264 = fma(_2228, _2256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2260 = _2264;
    }
    float _2266 = _2260;
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = _2266;
    if (_2188)
    {
        float _2272 = _2242 + (-1.0);
        _2262 = _2272;
    }
    float _2274 = _2262;
    float _2276 = _2274;
    if (_2188)
    {
        float _2278 = _2210 * _2266;
        _448 = _2278;
    }
    float _2280 = _448;
    if (!_2188)
    {
        _2212 = _2248;
    }
    float _2282 = _2212;
    float _2284 = _2282;
    if (_2188)
    {
        float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2286;
    }
    float _2288 = _2200;
    if (_2188)
    {
        float _2290 = _2176 * _2280;
        _2202 = _2290;
    }
    float _2292 = _2202;
    if (!_2188)
    {
        _2270 = _2178;
    }
    float _2294 = _2270;
    float _2296 = _2294;
    if (_2188)
    {
        float _2298 = _2178 * _2280;
        _2296 = _2298;
    }
    float _2300 = _2296;
    if (_2188)
    {
        float _2302 = fma(_2248, _2242, _2288);
        _2284 = _2302;
    }
    float _2304 = _2284;
    if (_2188)
    {
        float _2306 = _2292 * _2292;
        _2252 = _2306;
    }
    float _2308 = _2252;
    if (!_2188)
    {
        _2276 = _2182;
    }
    float _2310 = _2276;
    float _2312 = _2310;
    if (_2188)
    {
        float _2314 = _2300 * _2300;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = fma(_2304, _2304, _2308);
    float _2320 = _2318 + _2316;
    float _2322 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2326 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2324);
    float _2328 = precise::clamp(_2326, 0.0, 1.0);
    float _2330 = rsqrt(_2320);
    float _2332 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2322);
    float _2334 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2336 = -_2328;
    float _2338 = _2336 + 1.0;
    float _2340 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2342 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2344 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2334);
    float _2346 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2348 = abs(_2338);
    float _2350 = log2(_2348);
    float _2352 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2342);
    float _2354 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2344);
    float _2356 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2346);
    float _2358 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2360 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2352);
    float _2362 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2364 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2356);
    float _2366 = _2330 * _2292;
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2372 = _2330 * _2304;
    float _2374 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2376 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2378 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2370);
    float _2380 = _2330 * _2300;
    float _2382 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2384 = -_2374;
    float _2386 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = -_2376;
    float _2390 = fma(_2388, _2268, 1.0);
    float _2392 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2394 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2378);
    float _2396 = exp2(_2382);
    float _2398 = -_2380;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2402 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2394);
    float _2406 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2408 = fma(_2400, -0.5, 0.5);
    float _2410 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2402);
    float _2412 = fma(_2400, 0.5, 0.5);
    float _2414 = log2(_2390);
    float _2416 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2406);
    float _2418 = _2372 + 1.0;
    float _2420 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2410);
    float _2422 = fma(_2412, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2424 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2416);
    float _2426 = 1.0 / _2404;
    float _2428 = -_2372;
    float _2430 = fma(_2396, _2418, _2428);
    float _2432 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2434 = fma(_2412, _2422, -0.212114393711090087890625);
    float _2436 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2424);
    float _2438 = fma(_2430, 0.5, 0.5);
    float _2440 = fma(_2412, _2434, 1.570728778839111328125);
    float _2442 = sqrt(_2408);
    float _2444 = _2414 * 0.693147182464599609375;
    float _2446 = _2432 * _2426;
    float _2448 = _2436 * _2426;
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = fma(_2446, 0.5, 0.5);
    float _2454 = fma(_2448, -0.5, 0.5);
    float _2456 = _2442 * 0.636619746685028076171875;
    float3 _6501 = float3(_2452, _2454, _2450);
    float _2458 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6501, float3(0.0), isnan(_6501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6501, float3(0.0), isnan(_6501)), level(0.0)).x;
    float3 _6512 = float3(_2452, _2454, _2450);
    float4 _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6512, float3(0.0), isnan(_6512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6512, float3(0.0), isnan(_6512)), level(0.0)).xyzw;
    float _2463 = _2461.x;
    float _2465 = _2461.y;
    float _2467 = _2461.z;
    float _2469 = _2461.w;
    float _2471 = -_2440;
    float _2473 = fma(_2456, _2471, 1.0);
    float2 _6534 = float2(_2473, _2438);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2487 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2489 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2487);
    float _2491 = exp2(_2485);
    float _2493 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2489);
    float _2495 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2493);
    float _2497 = _2495 + _2404;
    out.gl_Position.x = _2432;
    out.gl_Position.y = _2436;
    out.gl_Position.z = _2495;
    out.gl_Position.w = _2404;
    float _2499 = -_2491;
    float _2501 = _2499 + 1.0;
    float _2503 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2505 = _2497 * 0.5;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _2503;
    out.m_67.z = _2505;
    out.m_67.w = _2404;
    float _2509 = _2507 * _2458;
    float _2511 = -_2507;
    float _2513 = _2511 + 1.0;
    float _2515 = _2469 * _2509;
    float _2517 = _2483 * _2509;
    float _2519 = fma(_2479, _2515, _2463);
    float _2521 = fma(_2481, _2515, _2465);
    float _2523 = _2469 * _2513;
    float _2525 = fma(_2469, _2517, _2467);
    out.m_69.x = _2519;
    out.m_69.y = _2521;
    out.m_69.z = _2525;
    out.m_69.w = _2523;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

