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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _120 = false;
    bool _118 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _656 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_656, float2(0.0), isnan(_656))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = in.m_44.x;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_70;
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
    float _102 = _70 * _60;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _70 * _72;
    bool _114 = as_type<int>(_110) == 368;
    if (!_114)
    {
        bool _116 = as_type<int>(_110) == 640;
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
            float _122 = _102 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _102 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _148;
            _158 = _146;
            _160 = _150;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _102 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _188;
            _158 = _186;
            _160 = _190;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _102 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _102 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _102 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _102 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _220;
            _158 = _218;
            _160 = _222;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = -_102;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _238 = -_112;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _242 = -_102;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _246 = _236 * _236;
    float _248 = -_70;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _252 = _244 * _244;
    float _254 = _102 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _256 = fma(_240, _240, _246);
    float _258 = -_112;
    float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _262 = _102 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _264 = _102 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _266 = fma(_250, _250, _256);
    float _268 = -_70;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _272 = fma(_260, _260, _252);
    float _274 = _102 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _276 = _102 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _278 = fma(_270, _270, _272);
    float _280 = sqrt(_266);
    float _282 = _102 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _284 = _102 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _286 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].x, _274);
    float _288 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].x, _276);
    float _290 = _102 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _292 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[27].x, _282);
    float _294 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[28].x, _284);
    float _296 = sqrt(_278);
    float _298 = _102 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _300 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _288);
    float _302 = _102 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _304 = _102 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _306 = _102 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _308 = _102 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _310 = _102 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _312 = _280 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _314 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[25].x, _290);
    bool _316 = _280 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _318 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _294);
    bool _320 = !_312;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _314);
    float _326 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[19].x, _302);
    float _328 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[20].x, _306);
    bool _330 = _296 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _332 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].x, _308);
    bool _334 = _296 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _336 = 1.0 / _226;
    bool _338 = !_330;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _292);
    int _344 = 2;
    int _346 = 2;
    if (!_312)
    {
        _344 = 1;
    }
    int _348 = _344;
    float _350 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _326);
    int _352 = _348;
    if (!_316)
    {
        _352 = _322;
    }
    int _354 = _352;
    float _356 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[21].x, _262);
    float _358 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _328);
    float _360 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _332);
    if (!_330)
    {
        _346 = 1;
    }
    int _362 = _346;
    float _364 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _356);
    int _366 = _362;
    if (!_334)
    {
        _366 = _340;
    }
    int _368 = _366;
    float _370 = float(_354);
    float _372 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[24].x, _264);
    float _374 = float(_368);
    float _376 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[30].x, _254);
    float _378 = precise::min(_370, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _380 = _102 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _382 = precise::min(_374, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _384 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _376);
    bool _386 = _378 != 1.0;
    bool _388 = isnan(_378);
    bool _390 = _386 || _388;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    float _396 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _372);
    bool _398 = _382 != 1.0;
    bool _400 = isnan(_382);
    bool _402 = _398 || _400;
    bool _404 = isnan(1.0);
    bool _406 = _402 || _404;
    float _408 = _384 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _410 = _102 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _412 = _378 != 0.0;
    bool _414 = isnan(_378);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[29].x, _380);
    bool _424 = _382 != 0.0;
    bool _426 = isnan(_382);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _286);
    float _436 = _364 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _438 = _102 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _440 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[31].x, _410);
    float _442 = _102 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _444 = _436;
    float _446 = _408;
    if (_394)
    {
        float _448 = _396 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _444 = _448;
    }
    float _450 = _444;
    float _452 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[23].x, _298);
    float _454 = _450;
    if (_406)
    {
        float _456 = _300 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _446 = _456;
    }
    float _458 = _446;
    float _460 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _440);
    float _462 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[22].x, _304);
    float _464 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[16].x, _438);
    float _466 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[26].x, _310);
    float _468 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[32].x, _442);
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _452);
    float _472 = _318 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _474 = _472;
    float _476 = _458;
    if (_406)
    {
        float _478 = _460 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _474 = _478;
    }
    float _480 = _474;
    float _482 = _480;
    if (!_420)
    {
        float _484 = _434 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _454 = _484;
    }
    float _486 = _454;
    if (!_432)
    {
        float _488 = _324 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _482 = _488;
    }
    float _490 = _482;
    float _492 = float(int(_95));
    float2 _1517 = float2(_54, _56);
    float2 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1517, float2(0.0), isnan(_1517))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1517, float2(0.0), isnan(_1517))).xy;
    float _498 = _496.x;
    float _500 = _496.y;
    float _502 = rint(_382);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    uint _508 = clamp(_506, 0u, 65535u);
    float _510 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _422);
    float _512 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _468);
    float _514 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _462);
    float _516 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _466);
    float _518 = _336 * _228;
    float _520 = _336 * _230;
    float _522 = _336 * _232;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = rint(_378);
    float _528 = precise::max(_526, 0.0);
    uint _530 = uint(_528);
    uint _532 = clamp(_530, 0u, 65535u);
    float _534 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _464);
    if (!_432)
    {
        float _536 = _342 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _476 = _536;
    }
    float _538 = _476;
    float _540 = _510 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _542 = _350 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _544 = _540;
    float _546 = _542;
    if (_406)
    {
        float _548 = _512 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _544 = _548;
    }
    float _550 = _544;
    float _552 = _550;
    if (_394)
    {
        float _554 = _514 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _546 = _554;
    }
    float _556 = _546;
    float _558 = _556;
    if (!_432)
    {
        float _560 = _516 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _552 = _560;
    }
    float _562 = _552;
    float _564 = rint(_492);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    uint _570 = clamp(_568, 0u, 65535u);
    float _572 = _358 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _574 = _572;
    if (!_420)
    {
        float _576 = _534 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _558 = _576;
    }
    float _578 = _558;
    if (_394)
    {
        float _580 = _470 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _574 = _580;
    }
    float _582 = _574;
    float _584 = 0.0 + _538;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = _582;
    if (!_420)
    {
        float _590 = _360 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _588 = _590;
    }
    float _592 = _588;
    float _594 = 0.0 + _486;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float3 _1688 = float3(_490, _562, float(int(_508)));
    float3 _1692 = select(_1688, float3(0.0), isnan(_1688));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1692.xy, uint(rint(_1692.z)), _586);
    float3 _1701 = float3(_578, _592, float(int(_532)));
    float3 _1703 = select(_1701, float3(0.0), isnan(_1701));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1703.xy, uint(rint(_1703.z)), _596);
    float3 _1712 = float3(_518, _520, float(int(_570)));
    float3 _1714 = select(_1712, float3(0.0), isnan(_1712));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1714.xy, uint(rint(_1714.z)), _524);
    float _604 = fma(_498, 2.0, -1.0);
    float _606 = fma(_500, 2.0, -1.0);
    float _608 = _604 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _610 = _606 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _612 = fma(_608, 2.0, _54);
    float _614 = fma(_610, 2.0, _56);
    float2 _1741 = float2(_612, _614);
    float _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1741, float2(0.0), isnan(_1741))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1741, float2(0.0), isnan(_1741))).x;
    float _618 = -_70;
    float _620 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _622 = _618 + _620;
    float _624 = -_70;
    float _626 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _628 = _624 + _626;
    float _630 = _622 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = _628 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _598 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _640 = fma(_600, (*spvDescriptorSet0.fp_c3)._m0[49].z, _638);
    float _642 = _602 + _632;
    float _644 = _640 + _636;
    out.m_47.x = _616;
    out.m_47.y = _642;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _644;
    return out;
}

