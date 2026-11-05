#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _120 = false;
    bool _118 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _635 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float2 _646 = float2(_52, _54);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_646, float2(0.0), isnan(_646))).x;
    float _60 = in.m_42.y;
    float _62 = in.m_42.x;
    float _64 = -_56;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _68 = 1.0 / _66;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = _68 * _70;
    float _74 = -_72;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_72;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_78;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_78)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    float _102 = _72 * _62;
    float _104 = _72 * _60;
    uint _106 = uint(int(uint(_100) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    bool _114 = as_type<int>(_112) == 400;
    if (!_114)
    {
        bool _116 = as_type<int>(_112) == 672;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _104 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _104 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _104 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _104 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _146;
            _158 = _148;
            _160 = _150;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _104 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _104 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _104 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _104 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _186;
            _158 = _188;
            _160 = _190;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _104 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _104 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _104 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _104 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _218;
            _158 = _220;
            _160 = _222;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = -_104;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _238 = -_102;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _242 = -_104;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _246 = -_102;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _250 = _236 * _236;
    float _252 = -_72;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _256 = _104 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _258 = _104 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _260 = fma(_240, _240, _250);
    float _262 = _244 * _244;
    float _264 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[30].x, _256);
    float _266 = fma(_254, _254, _260);
    float _268 = -_72;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _272 = fma(_248, _248, _262);
    float _274 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[33].x, _258);
    float _276 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].z, _264);
    float _278 = fma(_270, _270, _272);
    float _280 = sqrt(_266);
    float _282 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].z, _274);
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _286 = _104 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _288 = _104 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _290 = _104 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _292 = _104 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _294 = _104 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _296 = sqrt(_278);
    float _298 = _104 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _300 = _104 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _302 = _104 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _304 = _104 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _306 = _104 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _308 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[20].x, _286);
    float _310 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[18].x, _290);
    bool _312 = _280 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _314 = 1.0 / _226;
    bool _316 = _280 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _318 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[26].x, _300);
    bool _320 = !_312;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[19].x, _292);
    float _326 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[17].x, _294);
    float _328 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[27].x, _302);
    bool _330 = _296 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _332 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[31].x, _304);
    bool _334 = _296 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _336 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[32].x, _306);
    bool _338 = !_330;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].z, _308);
    int _344 = 2;
    int _346 = 2;
    float _348 = _284;
    if (!_312)
    {
        _344 = 1;
    }
    int _350 = _344;
    float _352 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].z, _328);
    int _354 = _350;
    if (!_316)
    {
        _354 = _322;
    }
    int _356 = _354;
    float _358 = _104 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _360 = _314 * _228;
    float _362 = _314 * _230;
    float _364 = float(_356);
    float _366 = _104 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_330)
    {
        _346 = 1;
    }
    int _368 = _346;
    float _370 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[21].x, _358);
    int _372 = _368;
    if (!_334)
    {
        _372 = _340;
    }
    int _374 = _372;
    float _376 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[24].x, _366);
    float _378 = precise::min(_364, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _380 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].z, _370);
    float _382 = float(_374);
    float _384 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].z, _376);
    bool _386 = _378 != 1.0;
    bool _388 = isnan(_378);
    bool _390 = _386 || _388;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    float _396 = _380 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _398 = precise::min(_382, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _400 = _104 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _402 = _104 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _404 = _378 != 0.0;
    bool _406 = isnan(_378);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = _314 * _232;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    bool _418 = _398 != 1.0;
    bool _420 = isnan(_398);
    bool _422 = _418 || _420;
    bool _424 = isnan(1.0);
    bool _426 = _422 || _424;
    float _428 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[29].x, _402);
    bool _430 = _398 != 0.0;
    bool _432 = isnan(_398);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    float _440 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].z, _324);
    float _442 = float(int(_95));
    float _444 = rint(_378);
    float _446 = precise::max(_444, 0.0);
    uint _448 = uint(_446);
    uint _450 = clamp(_448, 0u, 65535u);
    float _452 = _396;
    if (_394)
    {
        float _454 = _384 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _452 = _454;
    }
    float _456 = _452;
    float _458 = _104 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _460 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].z, _428);
    float _462 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].z, _332);
    float _464 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].z, _336);
    float _466 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].z, _310);
    float _468 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].z, _318);
    float _470 = _456;
    if (_426)
    {
        float _472 = _282 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _348 = _472;
    }
    float _474 = _348;
    float _476 = _104 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _478 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[22].x, _458);
    float _480 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[23].x, _288);
    float _482 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[25].x, _298);
    float _484 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].x, _476);
    float _486 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[28].x, _400);
    float _488 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].z, _480);
    float _490 = _342 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _492 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].z, _478);
    float _494 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].z, _486);
    float _496 = _490;
    float _498 = _474;
    if (_394)
    {
        float _500 = _488 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _496 = _500;
    }
    float _502 = _496;
    float _504 = _502;
    if (!_438)
    {
        float _506 = _352 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _498 = _506;
    }
    float _508 = _498;
    float _510 = rint(_398);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    uint _516 = clamp(_514, 0u, 65535u);
    float _518 = _440 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _520 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].z, _482);
    float _522 = _518;
    if (_394)
    {
        float _524 = _492 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _522 = _524;
    }
    float _526 = _522;
    float _528 = _494 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _530 = _460 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _532 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].z, _326);
    float _534 = _528;
    float _536 = _530;
    float _538 = _526;
    if (_426)
    {
        float _540 = _462 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _534 = _540;
    }
    float _542 = _534;
    float _544 = rint(_442);
    float _546 = precise::max(_544, 0.0);
    uint _548 = uint(_546);
    uint _550 = clamp(_548, 0u, 65535u);
    float _552 = _542;
    if (_426)
    {
        float _554 = _464 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _536 = _554;
    }
    float _556 = _536;
    float _558 = _556;
    if (!_412)
    {
        float _560 = _466 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _470 = _560;
    }
    float _562 = _470;
    if (!_438)
    {
        float _564 = _520 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _552 = _564;
    }
    float _566 = _552;
    float _568 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].z, _484);
    if (!_438)
    {
        float _570 = _468 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _558 = _570;
    }
    float _572 = _558;
    float _574 = 0.0 + _508;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    if (!_412)
    {
        float _578 = _532 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _504 = _578;
    }
    float _580 = _504;
    if (!_412)
    {
        float _582 = _568 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _538 = _582;
    }
    float _584 = _538;
    float _586 = 0.0 + _562;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float3 _1663 = float3(_566, _572, float(int(_516)));
    float3 _1667 = select(_1663, float3(0.0), isnan(_1663));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1667.xy, uint(rint(_1667.z)), _576);
    float3 _1676 = float3(_584, _580, float(int(_450)));
    float3 _1678 = select(_1676, float3(0.0), isnan(_1676));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1678.xy, uint(rint(_1678.z)), _588);
    float3 _1687 = float3(_360, _362, float(int(_550)));
    float3 _1689 = select(_1687, float3(0.0), isnan(_1687));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1689.xy, uint(rint(_1689.z)), _416);
    float _596 = -_72;
    float _598 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _600 = _596 + _598;
    float _602 = -_72;
    float _604 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _606 = _602 + _604;
    float _608 = _600 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _606 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _590 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _618 = fma(_592, (*spvDescriptorSet0.fp_c3)._m0[49].z, _616);
    float _620 = _594 + _610;
    float _622 = _618 + _614;
    out.m_45.x = _58;
    out.m_45.y = _620;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _622;
    return out;
}

