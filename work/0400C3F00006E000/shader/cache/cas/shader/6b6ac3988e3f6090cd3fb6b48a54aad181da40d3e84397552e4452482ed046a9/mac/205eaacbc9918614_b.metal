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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _719 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_719, float2(0.0), isnan(_719))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _76 = -_62;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_70;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_70)
    {
        _85 = 1;
    }
    int _87 = _85;
    int _89 = _87;
    if (!_74)
    {
        _89 = _83;
    }
    int _91 = _89;
    int _93 = _91 + 1;
    uint _96 = uint(_93);
    if (!_78)
    {
        _96 = uint(_91);
    }
    uint _98 = _96;
    uint _100 = min(_98, 2u);
    int _102 = int(_100) << 2;
    float _104 = in.m_40.x;
    uint _106 = uint(int(uint(_102) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    float _114 = _62 * _104;
    bool _116 = as_type<int>(_112) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_112) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _148;
            _160 = _150;
            _162 = _152;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _64 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _64 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _64 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _64 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _188;
            _160 = _190;
            _162 = _192;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _64 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _64 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _64 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _220;
            _160 = _222;
            _162 = _224;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = -_64;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _240 = -_114;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _244 = -_64;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _248 = _64 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _250 = _238 * _238;
    float _252 = -_62;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _256 = _246 * _246;
    float _258 = -_62;
    float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _262 = fma(_242, _242, _250);
    float _264 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _266 = _64 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _268 = _64 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _270 = fma(_254, _254, _262);
    float _272 = -_114;
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _276 = _64 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _278 = _64 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _280 = _64 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _282 = fma(_274, _274, _256);
    float _284 = sqrt(_270);
    float _286 = _64 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _288 = fma(_260, _260, _282);
    float _290 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _292 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _294 = _64 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _296 = _64 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _298 = _64 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _300 = sqrt(_288);
    float _302 = _64 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _304 = _64 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _306 = _64 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _308 = _64 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _310 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[19].x, _264);
    float _312 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[20].x, _268);
    bool _314 = _284 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _316 = 1.0 / _228;
    bool _318 = _284 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _320 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[21].x, _278);
    bool _322 = !_314;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[22].x, _266);
    float _328 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[23].x, _276);
    float _330 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[24].x, _280);
    float _332 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _310);
    bool _334 = _300 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _336 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _312);
    float _338 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _320);
    float _340 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[29].x, _298);
    int _342 = 2;
    if (!_314)
    {
        _342 = 1;
    }
    int _344 = _342;
    float _346 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _326);
    bool _348 = _300 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _350 = _64 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _352 = _344;
    if (!_318)
    {
        _352 = _324;
    }
    int _354 = _352;
    float _356 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[26].x, _248);
    bool _358 = !_334;
    int _360 = _358 ? 0 : 1;
    float _362 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _328);
    float _364 = float(_354);
    float _366 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _330);
    float _368 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[16].x, _286);
    float _370 = precise::min(_364, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _372 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[17].x, _290);
    int _374 = 2;
    if (!_334)
    {
        _374 = 1;
    }
    int _376 = _374;
    float _378 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[18].x, _292);
    int _380 = _376;
    if (!_348)
    {
        _380 = _360;
    }
    int _382 = _380;
    float _384 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[25].x, _294);
    bool _386 = _370 != 1.0;
    bool _388 = isnan(_370);
    bool _390 = _386 || _388;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    float _396 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[27].x, _350);
    float _398 = float(_382);
    float _400 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[28].x, _296);
    float _402 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[30].x, _302);
    float _404 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[31].x, _304);
    float _406 = precise::min(_398, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _408 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[32].x, _306);
    float _410 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[33].x, _308);
    float _412 = _332 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _414 = _336 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _416 = _338 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _418 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _340);
    float _420 = _412;
    float _422 = _414;
    float _424 = _416;
    if (_394)
    {
        float _426 = _346 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _420 = _426;
    }
    float _428 = _420;
    float _430 = _428;
    if (_394)
    {
        float _432 = _362 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _422 = _432;
    }
    float _434 = _422;
    float _436 = _434;
    if (_394)
    {
        float _438 = _366 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _424 = _438;
    }
    float _440 = _424;
    bool _442 = _406 != 1.0;
    bool _444 = isnan(_406);
    bool _446 = _442 || _444;
    bool _448 = isnan(1.0);
    bool _450 = _446 || _448;
    float _452 = _418 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _454 = _370 != 0.0;
    bool _456 = isnan(_370);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    float _464 = _316 * _230;
    bool _466 = _406 != 0.0;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _316 * _232;
    float _478 = _316 * _234;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = float(int(_98));
    float _484 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _402);
    float _486 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _400);
    float _488 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _410);
    float _490 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _378);
    float _492 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _404);
    float _494 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _396);
    float _496 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _408);
    float _498 = _484 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _500 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _356);
    float _502 = rint(_482);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    uint _508 = clamp(_506, 0u, 65535u);
    float _510 = _486 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _512 = _498;
    float _514 = _440;
    float _516 = _510;
    float _518 = _452;
    if (_450)
    {
        float _520 = _488 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _512 = _520;
    }
    float _522 = _512;
    float _524 = _522;
    if (!_462)
    {
        float _526 = _490 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _514 = _526;
    }
    float _528 = _514;
    if (_450)
    {
        float _530 = _492 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _516 = _530;
    }
    float _532 = _516;
    float _534 = _532;
    if (!_474)
    {
        float _536 = _494 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _524 = _536;
    }
    float _538 = _524;
    if (_450)
    {
        float _540 = _496 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _518 = _540;
    }
    float _542 = _518;
    float _544 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _480;
    float _546 = _542;
    if (!_474)
    {
        float _548 = _500 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _546 = _548;
    }
    float _550 = _546;
    float _552 = rint(_370);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    uint _558 = clamp(_556, 0u, 65535u);
    float _560 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _368);
    float _562 = 0.0 + _528;
    float _564 = precise::clamp(_562, 0.0, 1.0);
    float _566 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _568 = 0.0 + _538;
    float _570 = precise::clamp(_568, 0.0, 1.0);
    float _572 = _544 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _574 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_462)
    {
        float _576 = _560 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _430 = _576;
    }
    float _578 = _430;
    float _580 = rint(_406);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    uint _586 = clamp(_584, 0u, 65535u);
    float _588 = _544 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _590 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _372);
    float _592 = _566 * _570;
    float _594 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _384);
    float _596 = fma(_572, 0.5, _464);
    float _598 = fma(_572, -0.5, _464);
    float _600 = _564 * _574;
    float _602 = fma(_588, 0.5, _476);
    float _604 = fma(_588, -0.5, _476);
    if (!_462)
    {
        float _606 = _590 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _436 = _606;
    }
    float _608 = _436;
    float _610 = _564 * _566;
    float _612 = fma(_592, 0.5, _550);
    if (!_474)
    {
        float _614 = _594 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _534 = _614;
    }
    float _616 = _534;
    float _618 = _574 * _570;
    float _620 = fma(_592, -0.5, _550);
    float _622 = fma(_600, 0.5, _578);
    float _624 = fma(_600, -0.5, _578);
    float _626 = fma(_610, 0.5, _608);
    float _628 = fma(_610, -0.5, _608);
    float _630 = fma(_618, 0.5, _616);
    float _632 = fma(_618, -0.5, _616);
    float3 _1825 = float3(_598, _602, float(int(_508)));
    float3 _1829 = select(_1825, float3(0.0), isnan(_1825));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1829.xy, uint(rint(_1829.z)), _480);
    float3 _1838 = float3(_596, _602, float(int(_508)));
    float3 _1840 = select(_1838, float3(0.0), isnan(_1838));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1840.xy, uint(rint(_1840.z)), _480);
    float3 _1849 = float3(_596, _604, float(int(_508)));
    float3 _1851 = select(_1849, float3(0.0), isnan(_1849));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1851.xy, uint(rint(_1851.z)), _480);
    float3 _1860 = float3(_598, _604, float(int(_508)));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1862.xy, uint(rint(_1862.z)), _480);
    float3 _1871 = float3(_624, _626, float(int(_558)));
    float3 _1873 = select(_1871, float3(0.0), isnan(_1871));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1873.xy, uint(rint(_1873.z)), _564);
    float3 _1882 = float3(_622, _626, float(int(_558)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1884.xy, uint(rint(_1884.z)), _564);
    float3 _1893 = float3(_632, _612, float(int(_586)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1895.xy, uint(rint(_1895.z)), _570);
    float3 _1904 = float3(_630, _612, float(int(_586)));
    float3 _1906 = select(_1904, float3(0.0), isnan(_1904));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1906.xy, uint(rint(_1906.z)), _570);
    float3 _1915 = float3(_622, _628, float(int(_558)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1917.xy, uint(rint(_1917.z)), _564);
    float3 _1926 = float3(_630, _620, float(int(_586)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1928.xy, uint(rint(_1928.z)), _570);
    float3 _1937 = float3(_624, _628, float(int(_558)));
    float3 _1939 = select(_1937, float3(0.0), isnan(_1937));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1939.xy, uint(rint(_1939.z)), _564);
    float3 _1948 = float3(_632, _620, float(int(_586)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1950.xy, uint(rint(_1950.z)), _570);
    float _658 = _636 + _634;
    float _660 = _658 + _638;
    float _662 = -_62;
    float _664 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _666 = _662 + _664;
    float _668 = -_62;
    float _670 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _672 = _668 + _670;
    float _674 = _660 + _640;
    float _676 = _666 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = _672 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _682 = precise::clamp(_680, 0.0, 1.0);
    float _684 = _644 + _642;
    float _686 = fma(_674, 0.25, _678);
    float _688 = _648 + _646;
    float _690 = _684 + _650;
    float _692 = _688 + _652;
    float _694 = _690 + _654;
    float _696 = _692 + _656;
    float _698 = _694 * 0.25;
    float _700 = _696 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _702 = _700 * 0.25;
    float _704 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[49].z, _702);
    float _706 = _704 + _682;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _686;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _706;
    return out;
}

